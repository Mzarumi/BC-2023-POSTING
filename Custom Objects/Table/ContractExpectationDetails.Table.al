table 52185949 "Contract Expectation Details"
{

    fields
    {
        field(1; "Contract No"; Code[10])
        {
        }
        field(2; "Cycle Code"; Code[10])
        {
        }
        field(3; "Cycle Stage"; Integer)
        {
        }
        field(4; Description; Text[30])
        {
        }
        field(5; "Expectation Code"; Code[10])
        {
            TableRelation = "Contract Expectations"."Expectation Code";
        }
        field(6; "Person Responsible"; Text[30])
        {
        }
        field(7; "Due Date"; Date)
        {
        }
        field(8; Done; Boolean)
        {
        }
        field(9; "Date Done"; Date)
        {
        }
        field(10; "Done By"; Text[30])
        {
        }
        field(11; "%age Paid"; Decimal)
        {
        }
        field(12; Type; Option)
        {
            OptionCaption = ' ,Vendor,Customer';
            OptionMembers = " ",Vendor,Customer;
        }
        field(13; "Contractor No"; Code[10])
        {
        }
        field(14; "Invoice No"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Contract No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

