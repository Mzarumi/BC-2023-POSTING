table 52185766 "M-SACCO Bulk SMS Lines"
{

    fields
    {
        field(1; No; Code[20])
        {
            NotBlank = true;
            TableRelation = "M-SACCO Bulk SMS Header".No;
        }
        field(2; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(3; Description; Text[200])
        {
        }
        field(4; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; No, "Code", Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

