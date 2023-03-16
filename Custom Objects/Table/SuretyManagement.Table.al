table 52185964 "Surety Management"
{

    fields
    {
        field(1; "Surety No"; Code[20])
        {
        }
        field(2; "Refference No"; Code[20])
        {
        }
        field(3; "Refference Details"; Text[200])
        {
        }
        field(4; "Member Nos"; Code[40])
        {
        }
        field(5; "Member Name"; Text[100])
        {
            Editable = false;
        }
        field(6; Amount; Decimal)
        {
        }
        field(7; Date; Date)
        {
        }
        field(23; "No. Series"; Code[20])
        {
        }
        field(50005; Status; Option)
        {
            Editable = true;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(50006; "Type Of Account"; Option)
        {
            OptionMembers = " ",Member,Savings;
        }
        field(50007; "Account No"; Code[20])
        {
            TableRelation = IF ("Type Of Account" = CONST(Member)) Members."No."
            ELSE
            IF ("Type Of Account" = CONST(Savings)) "Savings Accounts"."No." WHERE("Product Category" = FILTER("Deposit Contribution"));

            trigger OnValidate()
            begin

                SavingsAccounts.Reset;
                SavingsAccounts.SetRange(SavingsAccounts."No.", "Account No");
                if SavingsAccounts.Find('-') then
                    "Account Name" := SavingsAccounts.Name;
                SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                Amount := SavingsAccounts."Balance (LCY)";
                "Member Account No" := SavingsAccounts."Member No.";



                Memb.Reset;
                Memb.SetRange(Memb."No.", "Account No");
                if Memb.Find('-') then
                    "Member Name" := Memb.Name;


                Memb.Reset;
                Memb.SetRange(Memb."No.", "Account No");
                if Memb.Find('-') then
                    "Member Name" := Memb.Name;
            end;
        }
        field(50008; "User ID"; Code[50])
        {
        }
        field(50009; "Court Name"; Text[100])
        {
        }
        field(50010; Court; Text[100])
        {
        }
        field(50011; Type; Text[100])
        {
        }
        field(50012; "Case No"; Code[100])
        {
        }
        field(50013; "Member No"; Code[20])
        {
            TableRelation = "Credit Accounts"."No.";

            trigger OnValidate()
            begin
                CreditAccount.Reset;
                CreditAccount.SetRange(CreditAccount."No.", "Member No");
                if CreditAccount.Find('-') then
                    "Member Name" := CreditAccount.Name;
                CreditAccount.CalcFields(CreditAccount."Balance (LCY)");
                "Outstanding Balance" := CreditAccount."Balance (LCY)";
                if "Outstanding Balance" > 0 then
                    Error('You cannot be a surety because you have Loan ', "Outstanding Balance");
            end;
        }
        field(50014; "Account Name"; Text[50])
        {
            Editable = false;
        }
        field(50015; "Outstanding Balance"; Decimal)
        {
        }
        field(50016; Accused; Text[100])
        {
        }
        field(50017; "Member Account No"; Code[20])
        {
        }
        field(50018; "Stopped USER ID"; Code[20])
        {
        }
        field(50019; "Stopped Time"; Time)
        {
        }
        field(50020; "Stopped Date"; Date)
        {
        }
        field(50021; Comment; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Surety No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Surety No" = '' then begin
            GenLedgerSetup.Get;
            //NoSeriesMgtInitSeries(GenLedgerSetup."Case Number", xRec."No. Series", 0D, "Surety No", "No. Series");
        end;

        "User ID" := UserId;
    end;

    var
        SavingsAccounts: Record "Savings Accounts";
        Emp: Record "HR Employees";
        GenLedgerSetup: Record "Cash Office Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        Vend: Record Vendor;
        Cust: Record Customer;
        Memb: Record Members;
        Witn: Record Witnesses;
        HRCommittees: Record "HR Committees";
        Casetype: Record "Segment/County/Dividend/Signat";
        CreditAccount: Record "Credit Accounts";
}

