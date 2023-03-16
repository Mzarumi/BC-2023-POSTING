table 52185827 "Loan Guarantors Sub"
{

    fields
    {
        field(1; "Loan No"; Code[20])
        {
            NotBlank = true;
            TableRelation = Loans."Loan No.";
        }
        field(2; "Member No"; Code[20])
        {
            Editable = false;
            NotBlank = false;

            trigger OnValidate()
            begin

                GHeader.Reset;
                GHeader.SetRange(GHeader."No.", "No.");
                if GHeader.Find('-') then begin
                    if LoanApp.Get(GHeader."Loan No.") then begin
                        //Check status - sasra
                        LoanApp.CalcFields("Loans Category-SASRA");
                        if LoanApp."Loans Category-SASRA" > GenSetUp."Allowed Loan Categories" then
                            Error(Text012, LoanApp."Loans Category-SASRA");
                    end;
                end;

                if CreditAccounts.Get("Member No") then begin
                    "Loan No" := Lno;
                    "Member No" := CreditAccounts."No.";
                    Name := CreditAccounts.Name;
                    "ID No." := CreditAccounts."ID No.";
                    "Staff/Payroll No." := CreditAccounts."Payroll/Staff No.";
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
        field(5; Shares; Decimal)
        {
            Editable = false;
        }
        field(6; "No Of Loans Guaranteed"; Integer)
        {
            Editable = false;
        }
        field(7; Substituted; Boolean)
        {

            trigger OnValidate()
            begin
                if Substituted then
                    TestField("Member Substituted");
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
        }
        field(12; "Staff/Payroll No."; Code[20])
        {
        }
        field(14; "Self Guarantee"; Boolean)
        {
        }
        field(15; "ID No."; Code[50])
        {
        }
        field(16; "Outstanding Balance"; Decimal)
        {
            CalcFormula = Sum ("Credit Ledger Entry".Amount WHERE ("Transaction Type" = FILTER (Loan | Repayment),
                                                                  "Loan No" = FIELD ("Loan No")));
            FieldClass = FlowField;
        }
        field(17; "Member Guaranteed"; Code[50])
        {
        }
        field(18; "Group Account No."; Code[50])
        {
        }
        field(19; "Loan Product Type"; Code[20])
        {
        }
        field(20; "No."; Code[20])
        {
        }
        field(21; "Line No."; Code[10])
        {
        }
        field(22; "Savings Account No."; Code[20])
        {
            TableRelation = "Savings Accounts"."No." WHERE ("Can Guarantee Loan" = CONST (true));

            trigger OnValidate()
            begin
                GenSetUp.Get;

                "Self Guarantee" := false;
                SelfGuaranteedA := 0;
                Date := Today;
                /*
                IF Members.GET("Account No.") THEN BEGIN
                    IF Employer.GET(Members."Employer Code") THEN BEGIN
                        IF NOT Employer."Can Guarantee Loan" THEN
                            ERROR('This member is not allowed to guarantee')
                           { ELSE IF
                            Members.=TRUE THEN
                            ERROR('Staff is not allowed to guarantee loan');}
                    END;
                END;
                */

                //Set Member Guaranteed
                if LoansR.Get("Loan No") then
                    "Member Guaranteed" := LoansR."Member No.";




                Image.Reset;
                Image.SetRange(Image."ID Number", SavingsAccounts."ID No.");
                if Image.Find('-') then begin
                    Image.CalcFields(Image.Signature);
                    //Signature:=Image.Signature;
                end;






                //Evaluate guarantor basic info
                if SavingsAccounts.Get("Savings Account No.") then begin
                    if SavingsAccounts.Status <> SavingsAccounts.Status::Active then
                        Error(Txt0001, SavingsAccounts."No.");
                    SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");//Cust."Outstanding Balance",Cust."Current Deposit");
                    Name := SavingsAccounts.Name;
                    "Staff/Payroll No." := SavingsAccounts."Payroll/Staff No.";
                    //"Loan Balance":=Cust."Outstanding Balance";
                    Shares := SavingsAccounts."Balance (LCY)";
                    "ID No." := SavingsAccounts."ID No.";
                    "Member No" := SavingsAccounts."Member No.";

                    //Check if short long term loan and exclude FOSA shares in guarantorship
                    if Loans.Get("Loan No") then begin
                        if (Loans."Loan Span" = Loans."Loan Span"::"Long Term") and (CreditAccounts."Loan Security Inclination" = CreditAccounts."Loan Security Inclination"::"Short Term Loan Security") then
                            Error('This security account is not meant for long term loans');
                    end;

                end;


                //Check Max garantors
                LoansG := 0;
                LoanGuarantors.Reset;
                LoanGuarantors.SetRange(LoanGuarantors."Account No.", "Member No");
                if LoanGuarantors.Find('-') then begin

                    repeat
                        if Loans.Get(LoanGuarantors."Loan No") then begin
                            Loans.CalcFields(Loans."Outstanding Balance");
                            if Loans."Outstanding Balance" > 0 then begin


                                LoansG := LoansG + 1;

                                //Evaluate Available Shares
                                TotalGuaranteed += (LoanGuarantors."Percentage Guaranteed" / 100) * Loans."Outstanding Balance";
                                //END-Evaluate Available Shares

                                if LoanGuarantors."Self Guarantee" = true then begin
                                    if LoansR.Get("Loan No") then begin
                                        if LoansR."Member No." <> "Savings Account No." then
                                            Message('Member has guaranteed self therefore can not guarantee another member.')
                                        else
                                            SelfGuaranteedA := SelfGuaranteedA + Loans."Outstanding Balance";
                                    end;
                                end;
                            end;
                        end;
                    until LoanGuarantors.Next = 0;

                end;
                //changed

                "No Of Loans Guaranteed" := LoansG;
                //"Total Guaranteed":=TotalGuaranteed;
                //"Available Shares":=Shares-"Total Guaranteed";


                if GenSetUp."Max Loans To Guarantee" > 0 then
                    if LoansG >= GenSetUp."Max Loans To Guarantee" then begin
                        if Confirm('Member has already guaranteed ' + Format(LoansG) + ' active loans. Do you wish to continue?', false) = false then begin
                            "Savings Account No." := '';
                            "Staff/Payroll No." := '';
                            Name := '';
                            "Loan Balance" := 0;
                            Date := 0D;
                            exit;
                        end;
                    end;
                //Check Max garantors - End



                /*
                //Check If Self Guarantee
                IF LoansR.GET("Loan No") THEN BEGIN
                    IF LoansR."Member No." = "Account No." THEN BEGIN
                        IF GenSetUp.GET(0) THEN BEGIN
                            IF GenSetUp.MEM"Member Can Guarantee Own Loan" = FALSE THEN
                                ERROR('Member can not guarantee own loan.')
                        END;
                
                        "Self Guarantee":=TRUE;
                
                    END;
                END;
                */

                "Member Guaranteed" := LoansR."Member No.";

                GHeader.Reset;
                GHeader.SetRange(GHeader."No.", "No.");
                if GHeader.Find('-') then begin
                    "Loan No" := GHeader."Loan No.";
                    "Member Guaranteed" := CopyStr(GHeader."Loan Account No.", 5);
                end;

                //Check If Self Guarantee

            end;
        }
        field(23; "SMS Sent"; Boolean)
        {
        }
        field(24; "Member Substituted"; Code[20])
        {
            TableRelation = "Savings Accounts" WHERE ("Can Guarantee Loan" = FILTER (true));

            trigger OnValidate()
            begin

                if SavingsAccounts.Get("Member Substituted") then
                    if SavingsAccounts.Status <> SavingsAccounts.Status::Active then
                        Error(Txt0001, SavingsAccounts."No.");

                GenSetUp.Get();

                GHeader.Reset;
                GHeader.SetRange(GHeader."No.", "No.");
                if GHeader.Find('-') then begin



                    LoanApp.Reset;
                    LoanApp.SetRange("Loan No.", GHeader."Loan No.");
                    if LoanApp.Find('-') then begin
                        //Check status - sasra
                        LoanApp.CalcFields("Loans Category-SASRA");
                        if LoanApp."Loans Category-SASRA" >= GenSetUp."Allowed Loan Categories" then
                            Error(
                          Text012, LoanApp."Loans Category-SASRA");
                    end;
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "No.", "Savings Account No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CreditAccounts: Record "Credit Accounts";
        GHeader: Record "Guarantors Substitution";
        Lno: Code[50];
        SavingsAccounts: Record "Savings Accounts";
        LoanGuarantors: Record "Loan Guarantors and Security";
        Loans: Record Loans;
        LoansR: Record Loans;
        LoansG: Integer;
        GenSetUp: Record "General Set-Up";
        SelfGuaranteedA: Decimal;
        StatusPermissions: Record "Credit Ledger Entry";
        Employer: Record Customer;
        LoanProduct: Record "Loan Charges";
        TotalGuaranteed: Decimal;
        BalanceRemaining: Decimal;
        Image: Record "Image Data";
        LoanGuar: Record "General Set-Up";
        TotG: Decimal;
        Txt0001: Label 'Member No. %1 is not an Active Member';
        LoanApp: Record Loans;
        Text012: Label 'The loan you are substituting guaranto is in default, Status: %1';
}

