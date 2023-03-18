table 52186241 "Meeting Types"
{

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; Intervals; Option)
        {
            OptionMembers = Monthly,Annual;
        }
        field(4; "Processing Fee"; Decimal)
        {
        }
        field(5; "Allowed Creation Channel"; Option)
        {
            OptionMembers = "Nav CBS","Web Portal";
        }
        field(6; "Only Officials"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

