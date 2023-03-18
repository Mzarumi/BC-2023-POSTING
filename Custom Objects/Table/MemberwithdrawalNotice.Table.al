table 52185826 "Member withdrawal Notice"
{
    //DrillDownPageID = "Open withdrawal Notice";
    //LookupPageID = "Open withdrawal Notice";

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Member No."; Code[20])
        {
            TableRelation = Members;

            trigger OnValidate()
            begin
                "Staff No." := '';
                MemberwithdrawalNotice.Reset;
                MemberwithdrawalNotice.SetRange("Member No.", "Member No.");
                MemberwithdrawalNotice.SetFilter(Status, '<>%1', MemberwithdrawalNotice.Status::Rejected);
                if MemberwithdrawalNotice.Find('-') then begin
                    Membershipclosure.Reset;
                    Membershipclosure.SetRange("Member No.", MemberwithdrawalNotice."Member No.");
                    Membershipclosure.SetRange(Posted, true);
                    if not Membershipclosure.Find('-') then begin
                        Error('Member has an existing application- No.%1', MemberwithdrawalNotice."No.");
                    end;
                end;
                if Members.Get("Member No.") then begin
                    Name := Members.Name;
                    "Staff No." := Members."Payroll/Staff No.";
                    "Global Dimension 1 Code" := Members."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := Members."Global Dimension 2 Code";

                    if Members.Status = Members.Status::Defaulter then Error('Member status is %1. Kindly clear your liabilities.', Members.Status);
                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange(SavingsAccounts."Member No.", "Member No.");
                    SavingsAccounts.SetRange("Product Category", SavingsAccounts."Product Category"::"Deposit Contribution");
                    if SavingsAccounts.Find('-') then begin
                        SavingsAccounts.CalcFields("Balance (LCY)");
                        MemberDeposit := SavingsAccounts."Balance (LCY)";
                        //"Member Deposit":=SavingsAccounts."Balance (LCY)";
                    end else
                        MemberDeposit := 0;

                    Validate("Member Deposit", MemberDeposit);
                    //"Member Deposit":=0;
                    if MemberDeposit <= 0 then Error('Member has no Deposit');

                    /*Loans.RESET;
                    Loans.SETRANGE("Member No.","Member No.");
                    Loans.SETFILTER("Outstanding Balance",'>0');
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        Loans.CALCFIELDS("Outstanding Balance","Outstanding Interest");
                        "Loans Outstanding Balance"+=Loans."Outstanding Balance";
                        "Loans Outstanding Interest"+=Loans."Outstanding Interest";
                        UNTIL Loans.NEXT=0;
                      END;*/
                    Loans.CalcFields("Total Loan Balance");

                    Loans.Reset;
                    Loans.SetRange("Member No.", "Member No.");
                    Loans.SetRange(Posted, true);
                    Loans.SetFilter("Total Loan Balance", '>0');
                    if Loans.Find('-') then begin
                        repeat
                            Loans.CalcFields("Outstanding Balance");
                            OutstandingBalance += Loans."Outstanding Balance";
                            Loans.CalcFields("Outstanding Interest");
                            OutstandingInterest += Loans."Outstanding Interest";
                        until Loans.Next = 0;
                    end;

                    Validate("Loans Outstanding Balance", OutstandingBalance);
                    Validate("Loans Outstanding Interest", OutstandingInterest);

                    LoanGuar.Reset;
                    LoanGuar.SetRange("Member No", "Member No.");
                    LoanGuar.SetRange(Substituted, false);
                    LoanGuar.SetRange("Self Guarantee", false);
                    if LoanGuar.Find('-') then begin
                        repeat
                            if Loans.Get(LoanGuar."Loan No") then begin
                                Loans.CalcFields("Outstanding Balance");
                                if Loans."Member No." <> "Member No." then begin
                                    if Loans."Outstanding Balance" > 0 then begin
                                        Error(Err001, Loans."Loan No.");
                                        NoLoanGua := NoLoanGua + '-' + Format(Loans."Loan No.");
                                    end;
                                end;
                            end;
                        until LoanGuar.Next = 0;
                    end;

                    /*IF LoanGuar.COUNT>1 THEN
                      ERROR(Err003)*/

                    // IF NoLoanGua<>'' THEN BEGIN
                    //  Remarks:='Member has guranteed'+NoLoanGua;
                    //  "Member No." := '';
                    //  MODIFY;
                    //  COMMIT;
                    //  ERROR(Remarks);
                    // END;

                end;


                //IF ("Loans Outstanding Balance"+"Loans Outstanding Interest")>"Member Deposit" THEN ERROR(
                if (OutstandingBalance + OutstandingInterest) > MemberDeposit then
                    Error(
'Total Loans of %1 exceeds the member deposits of %2', (OutstandingBalance + OutstandingInterest), MemberDeposit);

            end;
        }
        field(3; "Reason for withdrawal"; Text[250])
        {
            TableRelation = "Withdrawal Reason".Description;
        }
        field(4; "Withdrawal Notice Date"; Date)
        {

            trigger OnValidate()
            begin
                if "Withdrawal Notice Date" <> Today then Error(ErrMsg);
                GeneralSetUp.Get;
                GeneralSetUp.TestField(GeneralSetUp."Withdrawal Notice period");
                "Maturity Date" := CalcDate(Format(GeneralSetUp."Withdrawal Notice period"), "Withdrawal Notice Date");
            end;
        }
        field(5; "Maturity Date"; Date)
        {
        }
        field(6; "Entered By"; Code[50])
        {
        }
        field(7; "Date Entered"; Date)
        {
            Editable = true;
        }
        field(8; "Time Entered"; Time)
        {
        }
        field(9; Status; Option)
        {
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(10; "No. Series"; Code[10])
        {
        }
        field(11; Name; Text[50])
        {
        }
        field(12; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(13; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(14; "Loans Outstanding Balance"; Decimal)
        {
            Editable = false;
        }
        field(15; "Loans Outstanding Interest"; Decimal)
        {
            Editable = false;
        }
        field(16; "Member Deposit"; Decimal)
        {
            Editable = false;
        }
        field(17; "Notice Type"; Option)
        {
            OptionCaption = ' ,Withdrawal - Normal,Withdrawal - Death';
            OptionMembers = " ","Withdrawal - Normal","Withdrawal - Death";

            trigger OnValidate()
            begin
                if "Notice Type" = "Notice Type"::"Withdrawal - Death" then begin
                    NextofKIN.Reset;
                    NextofKIN.SetRange("Account No", "Member No.");
                    if NextofKIN.IsEmpty then
                        Error(Err0006);

                end;
            end;
        }
        field(18; Remarks; Text[250])
        {
        }
        field(19; "Date Modified"; Date)
        {
        }
        field(20; "Rejection Remarks"; Text[250])
        {
        }
        field(21; "Staff No."; Code[15])
        {
            Editable = false;
        }
        field(22; "Early Withdrawal"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Status = Status::Approved then
            Error(Txt00001);
    end;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            NoSetup.Get();
            NoSetup.TestField(NoSetup."Withdrawal Notice");
            //NoSeriesMgtInitSeries(NoSetup."Withdrawal Notice", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        "Date Entered" := Today;
        "Time Entered" := Time;
        "Entered By" := UserId;
        "Date Modified" := Today;
    end;

    trigger OnModify()
    begin
        "Date Modified" := Today;
    end;

    var
        NoSetup: Record "Credit Nos. Series";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        Members: Record Members;
        GeneralSetUp: Record "General Set-Up";
        Txt00001: Label 'You cannot delete approved record';
        ErrMsg: Label 'You cannot base Withdrawa Noticel Date in the past of future';
        SavingsAccounts: Record "Savings Accounts";
        Loans: Record Loans;
        LoanGuar: Record "Loan Guarantors and Security";
        Err001: Label 'This member has guranteed loan %1';
        Err002: Label 'Outstanding Balance is greater than members deposits';
        UserSetup: Record "User Setup";
        Err003: Label 'This member has guranteed loan';
        MemberwithdrawalNotice: Record "Member withdrawal Notice";
        NoLoanGua: Text;
        NextofKIN: Record "Next of KIN";
        Err0006: Label 'Member does not have next of kin details';
        OutstandingBalance: Decimal;
        OutstandingInterest: Decimal;
        MemberDeposit: Decimal;
        Membershipclosure: Record "Membership closure";

    //[Scope('Internal')]
    procedure StopAdvice(MemberwithdrawalNotice: Record "Member withdrawal Notice")
    var
        Loans: Record Loans;
        SavingsAccounts: Record "Savings Accounts";
        // PeriodicAcc: Codeunit "Periodic Activities";
        // LoansProcess: Codeunit "Loans Process";
    begin
        Loans.Reset;
        Loans.SetRange("Member No.", "Member No.");
        Loans.SetRange("Recovery Mode", Loans."Recovery Mode"::Checkoff);
        Loans.SetFilter("Outstanding Balance", '>0');
        if Loans.Find('-') then begin
            repeat
                // LoansProcess.AdviceLoan(Loans."Loan No.", true);
            until Loans.Next = 0;
        end;

        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."Member No.", "Member No.");
        if SavingsAccounts.Find('-') then begin
            repeat
                if SavingsAccounts."Product Category" = SavingsAccounts."Product Category"::"Deposit Contribution" then begin
                    // PeriodicAcc.StopEmplyerSavingAdvice(SavingsAccounts, SavingsAccounts."Monthly Contribution", SavingsAccounts."Employer Balance");
                end else
                    if SavingsAccounts."Product Category" = SavingsAccounts."Product Category"::Benevolent then begin
                        // PeriodicAcc.StopEmplyerSavingAdvice(SavingsAccounts, SavingsAccounts."Monthly Contribution", SavingsAccounts."Employer Balance");
                    end;
                if SavingsAccounts."Product Category" <> SavingsAccounts."Product Category"::"Share Capital" then begin
                    if SavingsAccounts."Loan Disbursement Account" = false then begin
                        SavingsAccounts.Status := SavingsAccounts.Status::Closed;
                        SavingsAccounts.Blocked := SavingsAccounts.Blocked::All;
                        ///  SavingsAccounts.MODIFY;
                    end;
                end;
            until SavingsAccounts.Next = 0;
        end;
    end;
}

