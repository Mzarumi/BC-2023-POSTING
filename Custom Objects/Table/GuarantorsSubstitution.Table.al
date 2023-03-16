table 52185828 "Guarantors Substitution"
{
    //DrillDownPageID = "Guarantor Subsitution List";
    //LookupPageID = "Guarantor Subsitution List";

    fields
    {
        field(1; "No."; Code[10])
        {
            Editable = false;

            trigger OnValidate()
            begin
                if xRec."No." <> xRec."No." then begin
                    CreditNosSeries.Get;
                    //NoSeriesMgtTestManual(CreditNosSeries."Guarantors Substitution");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Loan Account No."; Code[20])
        {
            TableRelation = "Credit Accounts";
        }
        field(3; Name; Text[50])
        {
            Editable = false;
        }
        field(4; "Account Status"; Option)
        {
            Editable = false;
            OptionCaption = 'Active,Non-Active,Blocked,Dormant,Re-instated,Deceased,Withdrawal,Retired,Termination,Resigned,Ex-Company,Casuals,Family Member,Defaulter,Apportioned,Suspended,Awaiting Verdict';
            OptionMembers = Active,"Non-Active",Blocked,Dormant,"Re-instated",Deceased,Withdrawal,Retired,Termination,Resigned,"Ex-Company",Casuals,"Family Member",Defaulter,Apportioned,Suspended,"Awaiting Verdict";
        }
        field(5; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(6; "Current Savings"; Decimal)
        {
            Editable = false;
        }
        field(7; "FOSA Account"; Code[20])
        {
            Editable = false;
            Enabled = false;
        }
        field(8; "Business Loan No."; Code[20])
        {
            Editable = false;
            Enabled = false;
        }
        field(9; "Business Loan Shares"; Decimal)
        {
            Editable = false;
        }
        field(10; "Posted By"; Code[50])
        {
            Editable = false;
        }
        field(11; "Captured By"; Code[50])
        {
            Editable = false;
        }
        field(12; "Responsibility Centre"; Code[20])
        {
            Editable = false;
            TableRelation = "Responsibility CenterBR";
        }
        field(13; "Activity Code"; Code[20])
        {
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(14; "Branch Code"; Code[20])
        {
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(15; "Document No."; Code[20])
        {
        }
        field(16; Date; Date)
        {
            Editable = false;
        }
        field(17; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(18; "ID/Passport"; Code[10])
        {
        }
        field(19; "Loan No."; Code[20])
        {
            TableRelation = Loans."Loan No.";

            trigger OnValidate()
            begin
                if Loan.Get("Loan No.") then begin
                    Loan.CalcFields(Loan."Outstanding Balance");
                    if Loan."Outstanding Balance" <= 0 then
                        Error(Txt001);
                    "Loan Account No." := Loan."Loan Account";
                    Name := Loan."Member Name";
                    // GenerateGuarantors();
                end;
            end;
        }
        field(20; Posted; Boolean)
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

    trigger OnInsert()
    begin

        if "No." = '' then begin
            CreditNosSeries.Get;
            CreditNosSeries.TestField(CreditNosSeries."Guarantors Substitution");
            //NoSeriesMgtInitSeries(CreditNosSeries."Guarantors Substitution", xRec."No. Series", 0D, "No.", "No. Series");

        end;
        "Captured By" := UserId;
        Date := Today;
        UserSetup.Get(UserId);
        //BEGIN
        UserSetup.TestField("Global Dimension 1 Code");
        UserSetup.TestField("Global Dimension 2 Code");
        UserSetup.TestField("Responsibility Centre");


        "Activity Code" := UserSetup."Global Dimension 1 Code";
        "Branch Code" := UserSetup."Global Dimension 2 Code";
        "Responsibility Centre" := UserSetup."Responsibility Centre";
    end;

    var
        CreditNosSeries: Record "Credit Nos. Series";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        LGuarant: Record "Loan Guarantors Sub";
        Lguarantx: Record "Loan Guarantors and Security";
        Loan: Record Loans;
        Txt001: Label 'This loan does not have a balance';
        UserSetup: Record "User Setup";

    //[Scope('Internal')]
    procedure GenerateGuarantors()
    begin

        Lguarantx.Reset;
        Lguarantx.SetRange(Lguarantx."Loan No", "Loan No.");
        Lguarantx.SetRange(Lguarantx.Substituted, false);
        if Lguarantx.Find('-') then
            repeat

                LGuarant.Init;
                LGuarant."No." := "No.";

                LGuarant."Loan No" := Lguarantx."Loan No";
                LGuarant."Member No" := Lguarantx."Member No";
                LGuarant."Savings Account No." := Lguarantx."Savings Account No./Member No.";
                LGuarant.Shares := Lguarantx."Deposits/Shares";
                LGuarant."Loan Balance" := Lguarantx."Loan Balance";
                LGuarant.Name := Lguarantx.Name;
                LGuarant.Substituted := Lguarantx.Substituted;
                LGuarant.Date := Lguarantx.Date;
                LGuarant."Amount Guaranteed" := Lguarantx."Amount Guaranteed";
                LGuarant."Staff/Payroll No." := Lguarantx."Staff/Payroll No.";
                //LGuarant."Account No.":=Lguarantx."Account No.";
                LGuarant."Self Guarantee" := Lguarantx."Self Guarantee";
                LGuarant."ID No." := Lguarantx."ID No.";
                LGuarant."Member Guaranteed" := Lguarantx."Member Guaranteed";
                //LGuarant."Group Account No.":=Lguarantx."Group Account No.";
                //LGuarant."Loan Product Type":=Lguarantx."Loan Product Type";
                LGuarant."Outstanding Balance" := Lguarantx."Outstanding Balance";
                LGuarant."SMS Sent" := Lguarantx."SMS Sent";
                LGuarant.Insert;

            until Lguarantx.Next = 0;
    end;
}

