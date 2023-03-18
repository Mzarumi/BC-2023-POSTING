table 52185742 "Loans Top up"
{
    //DrillDownPageID = "Loan Top Up";
    //LookupPageID = "Loan Top Up";

    fields
    {
        field(1; "Loan No."; Code[50])
        {
            TableRelation = Loans."Loan No.";
        }
        field(2; "Loan Top Up"; Code[50])
        {
            TableRelation = Loans."Loan No." WHERE("Member No." = FIELD("Client Code"),
                                                    Posted = CONST(true),
                                                    "Total Loan Balance" = FILTER(> 0));

            trigger OnValidate()
            begin
                GenSetup.Get;
                RepaymentMade := 0;


                if Loans.Get("Loan Top Up") then begin
                    "Loan Type" := Loans."Loan Product Type";
                    Loantypes.Get(Loans."Loan Product Type");
                    if LoanApp.Get("Loan No.") then begin
                        LoanTypes2.Get(LoanApp."Loan Product Type");
                        LoanToBridge.Reset;
                        LoanToBridge.SetRange("Product Code", LoanApp."Loan Product Type");
                        LoanToBridge.SetRange("Product To Bridge", Loans."Loan Product Type");
                        if not LoanToBridge.Find('-') then
                            Error(Text001, LoanApp."Loan Product Type", LoanApp."Loan Product Type");
                    end;

                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", Loans."Outstanding Bills", Loans."Loans Category-SASRA");
                    if Customer.Get(Loans."Employer Code") then
                        "Loan Type" := Loans."Loan Product Type";
                    if (Loans."Recovery Mode" = Loans."Recovery Mode"::Checkoff) and (Loans."Loans Category-SASRA" = Loans."Loans Category-SASRA"::Perfoming)
                      and (Loans."Loan Product Type" <> '128') and (Loans."Loan Product Type" <> '134') and (Loans."Loan Product Type" <> '125')
                      and (Customer."Loans Cleared" <> Customer."Loans Cleared"::"Full Clearance") then begin

                        if Loans."Interest Calculation Method" = Loans."Interest Calculation Method"::"Reducing Flat" then begin
                            "Principle Top Up" := Loans."Outstanding Balance" - (Loans.Repayment - Round(((Loans."Approved Amount" * Loans.Interest / 12 / 100) + ((Round(Loans."Approved Amount" / Loans.Installments, 1.0, '>')) * Loans.Interest / 12 / 100)) / 2, 1.0, '>'));
                            "Interest Top Up" := Loans."Outstanding Interest" - Round(((Loans."Approved Amount" * Loans.Interest / 12 / 100) + ((Round(Loans."Approved Amount" / Loans.Installments, 1.0, '>')) * Loans.Interest / 12 / 100)) / 2, 1.0, '>');
                            //  MESSAGE('%1 and %2',Loans."Outstanding Interest",ROUND(((Loans."Approved Amount"*Loans.Interest/12/100)+((ROUND(Loans."Approved Amount"/Loans.Installments,1.0,'>'))*Loans.Interest/12/100))/2,1.0,'>'));
                        end else begin
                            "Principle Top Up" := Loans."Outstanding Balance" - (Loans.Repayment - Round((Loans."Outstanding Balance" * Loans.Interest * 0.01 / 12), 1, '>'));
                            "Interest Top Up" := Loans."Outstanding Interest" - Round((Loans."Outstanding Balance" * Loans.Interest * 0.01 / 12), 1, '>');
                        end;
                        "Interest Top Up" := (Loans."Outstanding Interest");
                        "One Month Interest" := (Loans."Outstanding Balance" * Loans.Interest * 0.01 / 12);
                        "Monthly Repayment" := Loans.Repayment - Round((Loans."Outstanding Balance" * Loans.Interest * 0.01 / 12), 1, '>');
                        "Interest Rate" := Loans.Interest;
                        if "Interest Top Up" <= 0 then
                            "Interest Top Up" := 0;
                        if "Principle Top Up" <= 0 then
                            "Principle Top Up" := 0;
                    end else begin
                        "Principle Top Up" := Loans."Outstanding Balance";
                        "Interest Top Up" := Loans."Outstanding Interest";
                        "Monthly Repayment" := Loans.Repayment;
                    end;

                    if CalcDate('CM', Loans."Disbursement Date") = CalcDate('CM', Today) then begin
                        "Principle Top Up" := Loans."Outstanding Balance";
                        "Interest Top Up" := Loans."Outstanding Interest";
                        "Monthly Repayment" := Loans.Repayment;
                    end;


                    "Outstanding Bill" := Loans."Outstanding Bills";
                    "Outstanding Balance" := Loans."Outstanding Balance";

                    "Loan Span" := Loans."Loan Span";


                    //Check re-application period
                    if Format(Loantypes."Min. Re-application Period") <> '' then
                        EndDate := CalcDate(Loantypes."Min. Re-application Period", Loans."Repayment Start Date");
                    RepaymentSchedule.Reset;
                    RepaymentSchedule.SetRange(RepaymentSchedule."Loan No.", "Loan Top Up");
                    RepaymentSchedule.SetRange(RepaymentSchedule."Repayment Date", 0D, EndDate);
                    if RepaymentSchedule.Find('-') then begin
                        RepaymentSchedule.CalcSums(RepaymentSchedule."Principal Repayment");
                    end;

                    //Get the difference if past schedule
                    RepaymentMade := Loans."Approved Amount" - Loans."Outstanding Balance";
                    if RepaymentMade < RepaymentSchedule."Principal Repayment" then
                        "Additional Top Up Commission" := true;

                    Validate("Principle Top Up");

                    if "Principle Top Up" < 0 then "Principle Top Up" := 0;
                    if "Interest Top Up" < 0 then "Interest Top Up" := 0;
                    "Total Top Up" := "Principle Top Up" + "Interest Top Up";
                    "Monthly Repayment" := Loans.Repayment;
                    "Loan Account" := Loans."Loan Account";
                end;
            end;
        }
        field(3; "Client Code"; Code[20])
        {
        }
        field(4; "Loan Type"; Code[20])
        {
        }
        field(5; "Principle Top Up"; Decimal)
        {

            trigger OnValidate()
            begin

                // Loans.RESET;
                // Loans.SETRANGE(Loans."Loan No.","Loan Top Up");
                // IF Loans.FIND('-') THEN BEGIN
                // Loans.CALCFIELDS(Loans."Outstanding Balance");
                // //IF "Principle Top Up" > Loans."Outstanding Balance" THEN
                // //ERROR('Amount cannot be greater than the loan oustanding balance.');
                // "Interest Top Up":="Principle Top Up"*(Loans.Interest/100);
                // END;

                if LoanApp.Get("Loan No.") then begin
                    "Total Top Up" := "Principle Top Up" + "Interest Top Up";
                    if LoanApp.Status <> LoanApp.Status::Approved then begin
                        NetAmt := 0;
                        // NetAmt := LoansProcess.ComputeCharges(LoanApp."Approved Amount", LoanApp."Loan Product Type", LoanApp."Loan No.", 0);
                        //MESSAGE(FORMAT(NetAmt));
                        if NetAmt - "Total Top Up" <= 0 then
                            Error(Text003);
                    end;
                end;
                if "Principle Top Up" < 0 then "Principle Top Up" := 0;
                "Total Top Up" := "Principle Top Up" + "Interest Top Up";
            end;
        }
        field(6; "Interest Top Up"; Decimal)
        {

            trigger OnValidate()
            begin
                "Total Top Up" := "Principle Top Up" + "Interest Top Up" + Commision;

                Loans.Reset;
                Loans.SetRange(Loans."Loan No.", "Loan Top Up");
                if Loans.Find('-') then begin
                    Loans.CalcFields(Loans."Outstanding Interest");
                    if "Principle Top Up" < Loans."Outstanding Balance" then
                        Error('Amount cannot be greater than the interest due.');
                end;
                if "Interest Top Up" < 0 then "Interest Top Up" := 0;
                "Total Top Up" := "Principle Top Up" + "Interest Top Up";
            end;
        }
        field(7; "Total Top Up"; Decimal)
        {
        }
        field(8; "Monthly Repayment"; Decimal)
        {
        }
        field(9; "Interest Paid"; Decimal)
        {
        }
        field(10; "Outstanding Balance"; Decimal)
        {
            FieldClass = Normal;
        }
        field(11; "Interest Rate"; Decimal)
        {
        }
        field(12; "ID. NO"; Code[20])
        {
        }
        field(13; Commision; Decimal)
        {
        }
        field(14; "One Month Interest"; Decimal)
        {
        }
        field(15; "Insurance rebate"; Decimal)
        {
        }
        field(16; "Loan Account"; Code[20])
        {
        }
        field(17; "Outstanding Bill"; Decimal)
        {
        }
        field(18; "Additional Top Up Commission"; Boolean)
        {
        }
        field(19; "Loan Span"; Option)
        {
            OptionCaption = ' ,Short Term,Long Term';
            OptionMembers = " ","Short Term","Long Term";
        }
        field(20; "Untransfered Interest"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Loan No.", "Client Code", "Loan Top Up")
        {
            Clustered = true;
            SumIndexFields = "Total Top Up", "Principle Top Up";
        }
        key(Key2; "Principle Top Up")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Loan Top Up", "Client Code", "Principle Top Up", "Interest Top Up", Commision)
        {
        }
    }

    trigger OnDelete()
    begin
        if LoanApp.Get("Loan No.") then begin
            if (LoanApp.Status = LoanApp.Status::Pending) or (LoanApp.Status = LoanApp.Status::Approved) then
                Error(Text002, LoanApp.Status);
        end;
    end;

    trigger OnInsert()
    begin
        if LoanApp.Get("Loan No.") then begin
            if (LoanApp.Status = LoanApp.Status::Pending) or (LoanApp.Status = LoanApp.Status::Approved) then
                Error(Text002, LoanApp.Status);
        end;
    end;

    trigger OnModify()
    begin
        if LoanApp.Get("Loan No.") then begin
            if (LoanApp.Status = LoanApp.Status::Pending) or (LoanApp.Status = LoanApp.Status::Approved) then
                Error(Text002, LoanApp.Status);
        end;
    end;

    trigger OnRename()
    begin
        if LoanApp.Get("Loan No.") then begin
            if (LoanApp.Status = LoanApp.Status::Pending) or (LoanApp.Status = LoanApp.Status::Approved) then
                Error(Text002, LoanApp.Status);
        end;
    end;

    var
        Loans: Record Loans;
        Loantypes: Record "Product Factory";
        Interest: Decimal;
        Cust: Record Members;
        RepaymentSchedule: Record "Loan Repayment Schedule";
        ExpectedRepayment: Decimal;
        RepaymentMade: Decimal;
        ExpectedInterest: Decimal;
        InterestPaid: Decimal;
        InterestArrears: Decimal;
        Count1: Integer;
        GenSetup: Record "Credit Nos. Series";
        RemainingPeriod: Decimal;
        IntBal: Decimal;
        LoanApp: Record Loans;
        DateFilter: Text;
        InstallPaid: Integer;
        InsureReabate: Decimal;
        NoOfMonths: Integer;
        NoOfInstallments: Integer;
        HalfNoOfInstallments: Decimal;
        TotalExpeInt: Decimal;
        Insurance: Decimal;
        LoanServ: Record Loans;
        ProdCharges: Record "Loan Product Charges";
        EndDate: Date;
        DailyLoansInterestBuffer: Record "Daily Loans Interest Buffer";
        LoanTypes2: Record "Product Factory";
        LoanToBridge: Record "Loan Products to Bridge";
        Text001: Label 'This product %1 is not allowed for offset by %2';
        Text002: Label 'Loan is already %1 and cannot modify';
        NetAmt: Decimal;
        // LoansProcess: Codeunit "Loans Process";
        Text003: Label 'The approved amount is not sufficient to clear this loan';
        Customer: Record Customer;
}

