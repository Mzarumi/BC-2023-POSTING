table 52185741 "Interest Buffer"
{
    //DrillDownPageID = "Interest Buffer";
    //LookupPageID = "Interest Buffer";

    fields
    {
        field(1; No; Integer)
        {
            AutoIncrement = false;
        }
        field(2; "Account No"; Code[20])
        {
            TableRelation = "Savings Accounts"."No.";
        }
        field(3; "Product Type"; Code[20])
        {
        }
        field(4; "Interest Date"; Date)
        {
        }
        field(5; "Interest Amount"; Decimal)
        {
        }
        field(6; "User ID"; Code[20])
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
        field(13; "Reference No."; Code[30])
        {
        }
        field(14; "Qualifying Amount"; Decimal)
        {
        }
        field(15; Description; Text[80])
        {
        }
    }

    keys
    {
        key(Key1; No, "Account No")
        {
            Clustered = true;
        }
        key(Key2; "Account No", Transferred)
        {
            SumIndexFields = "Interest Amount";
        }
    }

    fieldgroups
    {
    }
}

