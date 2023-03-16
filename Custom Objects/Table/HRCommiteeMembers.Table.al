table 52185555 "HR Commitee Members"
{

    fields
    {
        field(1; "Member No."; Code[20])
        {

            trigger OnValidate()
            begin
                HREmp.Reset;
                HREmp.Get("Member No.");
                "Member Name" := HREmp."Plan No." + ' ' + HREmp."Job ID" + ' ' + HREmp."Job Title";
            end;
        }
        field(2; "Member Name"; Text[100])
        {
        }
        field(3; Role; Text[100])
        {
        }
        field(8; "Date Appointed"; Date)
        {
        }
        field(9; Grade; Code[20])
        {
        }
        field(10; Active; Boolean)
        {
        }
        field(11; Committee; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; Committee, "Member No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HREmp: Record "HR Succession Job Rotation";
}

