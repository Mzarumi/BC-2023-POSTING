table 52186090 "DCS Parameter"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[100])
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

