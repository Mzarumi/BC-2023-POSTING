table 52185610 "PR Bank Accounts"
{
    //DrillDownPageID = "PR Bank Accounts";
    //LookupPageID = "PR Bank Accounts";

    fields
    {
        field(1; "Bank Code"; Code[20])
        {
        }
        field(2; "Bank Name"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Bank Code")
        {
            Clustered = true;
        }
        key(Key2; "Bank Name")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Bank Code", "Bank Name")
        {
        }
    }
}

