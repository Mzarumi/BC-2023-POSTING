table 52185859 "Loans Interest"
{
    //DrillDownPageID = "Daily Loans Interest Buffer";
    //LookupPageID = "Daily Loans Interest Buffer";

    fields
    {
        field(1; No; Code[20])
        {
            Editable = false;
        }
        field(2; "Account No"; Code[20])
        {
            Editable = false;
        }
        field(3; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Savings,Credit';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        }
        field(4; "Interest Date"; Date)
        {
        }
        field(5; "Interest Amount"; Decimal)
        {
        }
        field(6; "User ID"; Code[100])
        {
        }
        field(8; "Account Matured"; Boolean)
        {
        }
        field(9; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(10; "Late Interest"; Boolean)
        {
        }
        field(11; Transferred; Boolean)
        {
        }
        field(12; "Mark For Deletion"; Boolean)
        {
        }
        field(13; Description; Text[80])
        {
        }
        field(14; Posted; Boolean)
        {
        }
        field(15; "Loan No."; Code[50])
        {
            Editable = false;
            TableRelation = Loans;
        }
        field(16; "Loan Product type"; Code[10])
        {
            Editable = false;
            TableRelation = "Product Factory";
        }
        field(17; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            Editable = false;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Member,None,Staff';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Member,"None",Staff;
        }
        field(18; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(19; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(20; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            Editable = false;
            TableRelation = IF ("Bal. Account Type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = CONST(Customer)) Customer
            ELSE
            IF ("Bal. Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Bal. Account Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Bal. Account Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Bal. Account Type" = CONST("IC Partner")) "IC Partner"
            ELSE
            IF ("Bal. Account Type" = CONST(Member)) Members;
        }
        field(21; Blocked; Option)
        {
            Caption = 'Blocked';
            Editable = false;
            OptionCaption = ' ,Ship,Invoice,All';
            OptionMembers = " ",Ship,Invoice,All;
        }
        field(22; Status; Option)
        {
            Editable = false;
            OptionCaption = ' ,New,Active,Dormant,Frozen,Withdrawal Applicant,Withdrawn,Deceased,Defaulter,Closed,Withdrawn Shareholder';
            OptionMembers = " ",New,Active,Dormant,Frozen,"Withdrawal Applicant",Withdrawn,Deceased,Defaulter,Closed,"Withdrawn Shareholder";
        }
        field(23; "Issued Date"; Date)
        {
            Editable = false;
        }
        field(24; "Bill Loan"; Boolean)
        {
        }
        field(25; "Charge Interest"; Boolean)
        {
        }
        field(26; "Repayment Amount"; Decimal)
        {
        }
        field(27; "Monthly Repayment"; Decimal)
        {
        }
        field(28; "Bill Account"; Code[20])
        {
            Caption = 'Bill Account';
            Editable = false;
            TableRelation = "G/L Account"."No.";
        }
        field(31; "Repayment Bill"; Decimal)
        {
        }
        field(32; "Interest Bill"; Decimal)
        {
        }
        field(33; "Outstanding Interest"; Decimal)
        {
            Editable = false;
        }
        field(34; "Outstanding Balance"; Decimal)
        {
            Editable = false;
        }
        field(35; "Appraisal Amount"; Decimal)
        {
        }
        field(36; "Date Captured"; Date)
        {
        }
        field(37; "Bal. Account No.(Suspended)"; Code[100])
        {
            Caption = 'Bal. Account No.';
            Editable = false;
            TableRelation = "G/L Account"."No.";
        }
        field(38; "Account Blocked"; Option)
        {
            OptionCaption = ' ,Credit,Debit,All';
            OptionMembers = " ",Credit,Debit,All;
        }
        field(39; "Outstanding Bill"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; No, "Loan No.", "Account No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*
          IF No = '' THEN BEGIN
          NoSetup.GET(0);
          NoSetup.TESTFIELD(NoSetup."Interest Buffer No");
          //NoSeriesMgtInitSeries(NoSetup."Interest Buffer No",xRec."No. Series",0D,No,"No. Series");
          END;
        */

    end;

    var
        NoSetup: Record "Purchases & Payables Setup";
    //NoSeriesMgt: Codeunit NoSeriesManagement;
}

