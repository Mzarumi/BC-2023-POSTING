table 52186071 "Rejection Reason"
{

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; "Rejection Reason"; Code[100])
        {
        }
        field(3; "Creation Date"; Date)
        {
            Editable = false;
        }
        field(4; "Created By"; Code[50])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Code", "Rejection Reason")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(a; "Code", "Rejection Reason")
        {
        }
    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Creation Date" := Today;
    end;
}

