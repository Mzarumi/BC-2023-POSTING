table 52185739 "Loan Guarantors and Security"
{
    //DrillDownPageID = "Loan Guarantors and Security";
    //LookupPageID = "Loan Guarantors and Security";

    fields
    {
        field(1; "Loan No"; Code[50])
        {
            NotBlank = true;
            TableRelation = Loans."Loan No.";
        }
        field(2; "Savings Account No./Member No."; Code[20])
        {
            TableRelation = IF ("Guarantor Type" = CONST(Guarantor)) "Savings Accounts"."No." WHERE("Product Category" = FILTER("Deposit Contribution"),
                                                                                                   Balance = FILTER(> 0))
            ELSE
            IF ("Guarantor Type" = CONST(Collateral)) "Securities Register"."Account No." WHERE("Account No." = FIELD("Member Guaranteed"),
                                                                                                                                                                                           Status = FILTER(Approved))
            ELSE
            IF ("Guarantor Type" = FILTER(Lien)) "Savings Accounts"."No." WHERE("Lien Placed" = FILTER(<> 0));

            trigger OnValidate()
            begin

                GenSetUp.Get;

                "Self Guarantee" := false;
                SelfGuaranteedA := 0;
                Date := Today;


                //Set Member Guaranteed
                if LoansR.Get("Loan No") then begin
                    "Member Guaranteed" := LoansR."Member No.";
                    "Loanee Name" := LoansR."Member Name";

                end;

                if "Guarantor Type" = "Guarantor Type"::Guarantor then begin
                    SELFLOAN.Reset;
                    SELFLOAN.SetRange("Loan No.", "Loan No");
                    if SELFLOAN.Find('-') then
                        SavingsAccounts.Reset;
                    SavingsAccounts.SetRange("Member No.", SELFLOAN."Member No.");
                    SavingsAccounts.SetRange("Product Category", SavingsAccounts."Product Category"::"Deposit Contribution");
                    if SavingsAccounts.Find('-') then begin
                        if SavingsAccounts."No." = "Savings Account No./Member No." then
                            "Self Guarantee" := true else
                            "Self Guarantee" := false;

                    end;


                    //Evaluate guarantor basic info
                    if Cust.Get("Savings Account No./Member No.") then begin
                        if Members.Get(Cust."Member No.") then begin
                            if Members.Status <> Members.Status::Active then
                                Error('Member No. %1 is not an Active Member', Members."No.");
                        end;

                        if Employer.Get(Cust."Employer Code") then begin
                            if Employer."Internal Staff Employer" = true then
                                Error(Text001);

                            if ProductFactory.Get(LoansR."Loan Product Type") then begin
                                if ProductFactory."Ordinary Deposits Multiplier" >= 5 then begin

                                    SavingsAccounts.Reset;
                                    SavingsAccounts.SetRange("Member No.", Cust."Member No.");
                                    SavingsAccounts.SetRange("Loan Disbursement Account", true);
                                    if SavingsAccounts.Find('-') then begin
                                        SalaryLines.Reset;
                                        SalaryLines.SetRange("Account No.", SavingsAccounts."No.");
                                        SalaryLines.SetRange(Posted, true);
                                        if SalaryLines.Find('-') then begin
                                            if SalaryLines.Count < 2 then
                                                Error(Err0001);
                                        end else
                                            Error(Err0001);
                                    end;
                                end;
                            end;
                        end;
                        Members.Get(Cust."Member No.");
                        Cust.CalcFields(Cust."Balance (LCY)");
                        Name := Cust.Name;
                        "Staff/Payroll No." := Cust."Payroll/Staff No.";
                        // "Loan Balance":=Cust."Balance (LCY)";
                        "Deposits/Shares" := Cust."Balance (LCY)";
                        "Amount Guaranteed" := Cust."Balance (LCY)";
                        "ID No." := Members."ID No.";
                        "Member No" := Cust."Member No.";
                        Name := Cust.Name;

                        //Check if self gauarantee
                        Loans.Reset;
                        Loans.SetRange(Loans."Member No.", Cust."Member No.");
                        Loans.SetRange(Loans."Self Guarantee", true);
                        Loans.SetFilter(Loans."Outstanding Balance", '>0');
                        if Loans.Find('-') then begin
                            Loans.CalcFields(Loans."Outstanding Balance");
                            if Loans."Outstanding Balance" >= GenSetUp."Self Guarantee %" * "Deposits/Shares" * 0.01 then begin
                                LoansTopup.Reset;
                                LoansTopup.SetRange("Loan Top Up", Loans."Loan No.");
                                if not LoansTopup.Find('-') then begin
                                    Error(Text002, Loans."Outstanding Balance", "Deposits/Shares");
                                end;
                            end
                            else
                                "Amount Guaranteed" := (GenSetUp."Self Guarantee %" * "Deposits/Shares" * 0.01) - Loans."Outstanding Balance";
                        end;
                    end;



                    LoanGuar.Reset;
                    LoanGuar.SetRange("Savings Account No./Member No.", "Savings Account No./Member No.");
                    LoanGuar.SetFilter("Outstanding Balance", '>0');
                    if LoanGuar.Find('-') then begin
                        LoanGuar.CalcSums("Amount Guaranteed");
                        TotalGuaranteed := LoanGuar."Amount Guaranteed";
                        "No Of Loans Guaranteed" := LoanGuar.Count;
                        //MESSAGE('Loans gua %1 Counter %2 Loan No. %3',TotalGuaranteed,"No Of Loans Guaranteed",LoanGuar."Loan No");
                    end;


                    "Available Shares" := "Deposits/Shares" - "Total Guaranteed";

                end else
                    if "Guarantor Type" = "Guarantor Type"::Collateral then begin
                        if Members.Get("Savings Account No./Member No.") then begin

                            Name := Members.Name;
                            "Staff/Payroll No." := Members."Payroll/Staff No.";
                            "ID No." := Members."ID No.";
                            "Member No" := "Savings Account No./Member No.";
                            LoanGuar.Reset;
                            LoanGuar.SetRange("Member No", "Savings Account No./Member No.");
                            LoanGuar.SetFilter("Outstanding Balance", '>0');
                            if LoanGuar.Find('-') then begin
                                LoanGuar.CalcSums("Amount Guaranteed");
                                "No Of Loans Guaranteed" := LoanGuar.Count;
                            end;

                        end;
                    end else begin
                        if Cust.Get("Savings Account No./Member No.") then begin
                            if Cust.Status <> Cust.Status::Active then
                                Error('Member No. %1 is not an Active Member', Cust."No.");
                            Cust.CalcFields(Cust."Balance (LCY)");
                            Name := Cust.Name;
                            "Staff/Payroll No." := Cust."Payroll/Staff No.";
                            // "Loan Balance":=Cust."Balance (LCY)";
                            "Deposits/Shares" := Cust."Balance (LCY)";
                            "Amount Guaranteed" := Cust."Lien Placed";
                            "ID No." := Cust."ID No.";
                            "Member No" := Cust."Member No.";
                            Name := Cust.Name;

                            LoanGuar.Reset;
                            LoanGuar.SetRange("Member No", "Savings Account No./Member No.");
                            LoanGuar.SetFilter("Outstanding Balance", '>0');
                            if LoanGuar.Find('-') then begin
                                LoanGuar.CalcSums("Amount Guaranteed");
                                "No Of Loans Guaranteed" := LoanGuar.Count;
                            end;

                        end;
                    end;

                LoanGuarantors.Reset;
                LoanGuarantors.SetRange(LoanGuarantors."Loan No", "Loan No");
                if LoanGuarantors.Find('-') then begin
                    repeat
                        "Total Sum" := "Total Sum" + LoanGuarantors."Amount Guaranteed";
                    //LoanGuar.CALCSUMS(LoanGuar."Amount Guaranteed");
                    //MESSAGE('AmtGuar loop %1',TotG);

                    until LoanGuarantors.Next = 0;
                end;


                //Check Max garantors
                LoansG := 0;
                CalcFields("No Of Loans Guaranteed");
                LoansG := "No Of Loans Guaranteed";


                LoanGuarantors.Reset;
                LoanGuarantors.SetRange(LoanGuarantors."Member No", "Member No");
                LoanGuarantors.SetRange(LoanGuarantors.Substituted, false);
                if LoanGuarantors.Find('-') then begin

                    repeat
                        if Loans.Get(LoanGuarantors."Loan No") then begin
                            Loans.CalcFields(Loans."Outstanding Balance");
                            if Loans."Outstanding Balance" > 0 then begin


                                //Evaluate Available Shares
                                TotalGuaranteed += (LoanGuarantors."Percentage Guaranteed" / 100) * Loans."Outstanding Balance";
                                //END-Evaluate Available Shares


                            end;
                        end;
                    until LoanGuarantors.Next = 0;

                end;
                //changed

                if GenSetUp."Max Loans To Guarantee" > 0 then
                    if LoansG >= GenSetUp."Max Loans To Guarantee" then begin
                        Error('Member has reached Maximum Guarantorship of' + Format(LoansG));
                        exit;
                    end;
                //Check Max garantors - End


                LoanApp.Reset;
                LoanApp.SetRange("Member No.", "Member No");
                LoanApp.SetRange(Posted, true);
                LoanApp.SetFilter("Outstanding Balance", '>%1', 0);
                LoanApp.SetFilter("Loans Category-SASRA", '<>%1&<>%2', LoanApp."Loans Category-SASRA"::Perfoming, LoanApp."Loans Category-SASRA"::Watch);
                if LoanApp.Find('-') then begin
                    repeat
                        LoansTopup.Reset;
                        LoansTopup.SetRange("Loan Top Up", LoanApp."Loan No.");
                        if not LoansTopup.Find('-') then begin
                            Error(Err0003, "Member No", LoanApp."Loan No.");
                        end;

                    until LoanApp.Next = 0;
                end;
            end;
        }
        field(3; Name; Text[200])
        {
            Editable = false;
        }
        field(4; "Loan Balance"; Decimal)
        {
            Editable = false;
        }
        field(5; "Deposits/Shares"; Decimal)
        {
            Editable = false;
        }
        field(6; "No Of Loans Guaranteed"; Integer)
        {
            CalcFormula = Count("Loan Guarantors and Security" WHERE("Member No" = FIELD("Member No"),
                                                                      "Outstanding Balance" = FILTER(> 0),
                                                                      Substituted = FILTER(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; Substituted; Boolean)
        {
            Editable = true;

            trigger OnValidate()
            begin
                Date := Today;
            end;
        }
        field(8; Date; Date)
        {
        }
        field(9; "Shares Recovery"; Boolean)
        {
        }
        field(10; "New Upload"; Boolean)
        {
        }
        field(11; "Amount Guaranteed"; Decimal)
        {

            trigger OnValidate()
            begin
                //Shares:=Shares*-1;
                //MESSAGE('SHARE %1',Shares);
                TotG := 0;
                if "Amount Guaranteed" > ("Deposits/Shares") then
                    Error('You cannot guarantee more than your shares of %1', "Deposits/Shares");

                //CALCSUMS("Amount Guaranteed");
                BalanceRemaining := 0;

                TotG := TotG + "Amount Guaranteed";
                //MESSAGE('AmtGuar outside loop %1',TotG);
                //MESSAGE('Tot Guar %1',TotG);
                //CALCSUMS("Amount Guaranteed");
                if Loans.Get("Loan No") then begin
                    BalanceRemaining := Loans."Approved Amount" - TotG;//LoanGuar."Amount Guaranteed";

                    //MESSAGE('Balance not Guaranteed %1',BalanceRemaining);
                end;
                //"Percentage Guaranteed":=("Amount Guaranteed"/Loans."Approved Amount")*100;



                if Loans.Get("Loan No") then
                    "Percentage Guaranteed" := ("Amount Guaranteed" / Loans."Approved Amount") * 100;

                LoanGuarantors.Reset;
                LoanGuarantors.SetRange(LoanGuarantors."Loan No", "Loan No");
                if LoanGuarantors.Find('-') then begin
                    repeat
                        "Total Sum" := "Total Sum" + LoanGuarantors."Amount Guaranteed";
                    //LoanGuar.CALCSUMS(LoanGuar."Amount Guaranteed");
                    //MESSAGE('AmtGuar loop %1',TotG);

                    until LoanGuarantors.Next = 0;
                end;
            end;
        }
        field(12; "Staff/Payroll No."; Code[20])
        {

            trigger OnValidate()
            begin
                Cust.Reset;
                Cust.SetRange(Cust."Payroll/Staff No.", "Staff/Payroll No.");
                Cust.SetRange(Cust."Loan Security Inclination", Cust."Loan Security Inclination"::"Long Term Loan Security");
                if Cust.Find('-') then begin
                    "Savings Account No./Member No." := Cust."No.";
                    Validate("Savings Account No./Member No.");
                end
                else begin
                    "Savings Account No./Member No." := '';
                    Error('Member deposits account not found.');
                end;
            end;
        }
        field(13; "Account No."; Code[20])
        {
        }
        field(14; "Self Guarantee"; Boolean)
        {
        }
        field(15; "ID No."; Code[50])
        {
            Editable = false;
        }
        field(16; "Outstanding Balance"; Decimal)
        {
            CalcFormula = Sum("Credit Ledger Entry".Amount WHERE("Loan No" = FIELD("Loan No"),
                                                                  "Transaction Type" = FILTER(Loan | Repayment | "Interest Due" | "Interest Paid")));
            FieldClass = FlowField;
        }
        field(17; "Member Guaranteed"; Code[50])
        {
        }
        field(18; "Percentage Guaranteed"; Decimal)
        {
        }
        field(19; "Total Guaranteed"; Decimal)
        {
        }
        field(20; "Available Shares"; Decimal)
        {
        }
        field(21; Signature; BLOB)
        {
        }
        field(22; "Member No"; Code[20])
        {
        }
        field(23; "Loan Type"; Code[20])
        {
            CalcFormula = Lookup(Loans."Loan Product Type" WHERE("Loan No." = FIELD("Loan No")));
            FieldClass = FlowField;
        }
        field(24; "Guaranteed Balance"; Decimal)
        {
        }
        field(25; "Loanee Name"; Text[150])
        {
            Editable = false;
        }
        field(26; "Guarantor Type"; Option)
        {
            OptionCaption = 'Guarantor,Collateral,Lien';
            OptionMembers = Guarantor,Collateral,Lien;

            trigger OnValidate()
            begin
                if LoansR.Get("Loan No") then begin
                    "Member Guaranteed" := LoansR."Member No.";
                    "Loanee Name" := LoansR."Member Name";

                end;
            end;
        }
        field(27; "Collateral Reg. No."; Code[20])
        {
            TableRelation = "Securities Register"."No." WHERE("Account No." = FIELD("Savings Account No./Member No."),
                                                               Status = CONST(Approved));

            trigger OnValidate()
            begin
                /*IF SecReg.GET("Collateral Reg. No.") THEN BEGIN
                "Amount Guaranteed"  :=SecReg."Collateral Limit";
                "Collateral Value":=SecReg."Collateral Value";
                END;*/

                SecReg.Reset;
                SecReg.SetRange("Account No.", "Member Guaranteed");
                SecReg.SetRange("No.", "Collateral Reg. No.");
                if SecReg.Find('-') then begin
                    "Amount Guaranteed" := SecReg."Collateral Limit";
                    "Collateral Value" := SecReg."Collateral Value";

                end;

                LoanGuar.Reset;
                LoanGuar.SetFilter("Outstanding Balance", '>0');
                LoanGuar.SetRange("Collateral Reg. No.", "Collateral Reg. No.");
                if LoanGuar.Find('-') then begin
                    LoanGuar.CalcFields("Outstanding Balance");
                    Error(Text004, LoanGuar."Loan No", LoanGuar."Outstanding Balance");
                end;

            end;
        }
        field(28; "Collateral Value"; Decimal)
        {
        }
        field(29; "SMS Sent"; Boolean)
        {
        }
        field(30; "Total Sum"; Decimal)
        {
            CalcFormula = Sum("Loan Guarantors and Security"."Amount Guaranteed" WHERE("Loan No" = FIELD("Loan No")));
            FieldClass = FlowField;
        }
        field(31; "Member Substituted"; Code[20])
        {
            Enabled = false;
            TableRelation = "Savings Accounts"."No." WHERE("Product Category" = FILTER("Deposit Contribution"),
                                                            Balance = FILTER(> 0));
        }
        field(32; test; Integer)
        {
        }
        field(33; "Total Loan Balance"; Decimal)
        {
            CalcFormula = Sum("Credit Ledger Entry".Amount WHERE("Loan No" = FIELD("Loan No"),
                                                                  "Transaction Type" = FILTER("Interest Paid" | "Interest Due" | Repayment | Loan)));
            FieldClass = FlowField;
        }
        field(34; "Substituted By"; Text[50])
        {
        }
        field(35; "Date Substituted"; Date)
        {
        }
        field(36; Verified; Boolean)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Loan No", "Staff/Payroll No.", "Savings Account No./Member No.")
        {
        }
        key(Key2; "Loan No", "Savings Account No./Member No.")
        {
            Clustered = true;
            SumIndexFields = "Deposits/Shares";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if LoanApp.Get("Loan No") then begin
            if (LoanApp.Status = LoanApp.Status::Pending) or (LoanApp.Status = LoanApp.Status::Approved) then
                Error(Text003, LoanApp.Status);
        end;
    end;

    trigger OnInsert()
    begin
        if LoanApp.Get("Loan No") then begin
            if (LoanApp.Status = LoanApp.Status::Pending) or (LoanApp.Status = LoanApp.Status::Approved) then
                Error(Text003, LoanApp.Status);

            ProductFactory.Get(LoanApp."Loan Product Type");
            if ProductFactory."Mortgage Loan" = true then Error(MortgageError);
        end;
        Date := Today;
    end;

    trigger OnModify()
    begin
        if LoanApp.Get("Loan No") then begin
            if (LoanApp.Status = LoanApp.Status::Pending) or (LoanApp.Status = LoanApp.Status::Approved) then
                Error(Text003, LoanApp.Status);
        end;
        Date := Today;
    end;

    trigger OnRename()
    begin
        if LoanApp.Get("Loan No") then begin
            if (LoanApp.Status = LoanApp.Status::Pending) or (LoanApp.Status = LoanApp.Status::Approved) then
                Error(Text003, LoanApp.Status);
        end;
    end;

    var
        Cust: Record "Savings Accounts";
        LoanGuarantors: Record "Loan Guarantors and Security";
        Loans: Record Loans;
        LoansR: Record Loans;
        LoansG: Integer;
        GenSetUp: Record "General Set-Up";
        SelfGuaranteedA: Decimal;
        StatusPermissions: Record "Credit Ledger Entry";
        LoanProduct: Record "Loan Charges";
        TotalGuaranteed: Decimal;
        BalanceRemaining: Decimal;
        LoanGuar: Record "Loan Guarantors and Security";
        TotG: Decimal;
        Members: Record Members;
        SecReg: Record "Securities Register";
        Employer: Record Customer;
        Text001: Label 'Internal staff are not allowed to guarantee loans';
        Text002: Label 'This member has self guaranteed %1 and has a balance of %2';
        LoanApp: Record Loans;
        Text003: Label 'This Loan is already %1 and cannot modify';
        Text004: Label 'This collateral has been used for loan no. %1 and has a outstanding balance of %2';
        LoanGs: Record "Loan Guarantors and Security";
        SavingsAccounts: Record "Savings Accounts";
        SalaryLines: Record "Salary Lines";
        ProductFactory: Record "Product Factory";
        Err0001: Label 'Gurantor salary has not been processed for the past 2 Months';
        Err0003: Label 'This guarantor No %1 has loan No, %2 that is not performing';
        SELFLOAN: Record Loans;
        LoansTopup: Record "Loans Top up";
        SecuritiesRegister: Record "Securities Register";
        MortgageError: Label 'This product is a mortgage Loan and does not require guarantors';
}

