table 52186085 "File Movement Remarks"
{

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(2; Description; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "No.", Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

