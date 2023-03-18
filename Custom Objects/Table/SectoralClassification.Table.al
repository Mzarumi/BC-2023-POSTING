table 52186112 "Sectoral Classification"
{
    DataCaptionFields = "Sub Sector Level2", "Sub Sector Level2 Description";
    //DrillDownPageID = "Sectoral Classification";
    //LookupPageID = "Sectoral Classification";

    fields
    {
        field(1; "Main Sector"; Code[20])
        {
        }
        field(2; "Main Sector Description"; Text[100])
        {
        }
        field(3; "Sub Sector Level1"; Code[20])
        {
        }
        field(4; "Sub Sector Level1 Description"; Text[100])
        {
        }
        field(5; "Sub Sector Level2"; Code[20])
        {
        }
        field(6; "Sub Sector Level2 Description"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Main Sector", "Sub Sector Level1", "Sub Sector Level2")
        {
            Clustered = true;
        }
        key(Key2; "Sub Sector Level2")
        {
        }
    }

    fieldgroups
    {
    }
}

