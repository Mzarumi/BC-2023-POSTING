table 52185561 "HR OSAccident"
{

    fields
    {
        field(1; "Accident No"; Code[10])
        {
        }
        field(2; Description; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Accident No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

