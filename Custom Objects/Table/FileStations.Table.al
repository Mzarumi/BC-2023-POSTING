table 52186083 "File Stations"
{
    //DrillDownPageID = "File Stations";
    //LookupPageID = "File Stations";

    fields
    {
        field(1; "Station No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "Station Code"; Code[50])
        {
        }
        field(4; "Duration (Hr)"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Station No.", "Station Code", Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

