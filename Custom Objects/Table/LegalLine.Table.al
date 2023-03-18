table 52185960 "Legal Line"
{

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; Discussion; Text[150])
        {
        }
        field(3; Recommendation; Text[100])
        {
        }
        field(4; Date; Date)
        {
        }
        field(5; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; No, "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

