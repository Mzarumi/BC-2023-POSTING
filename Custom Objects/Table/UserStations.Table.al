table 52186086 "User Stations"
{

    fields
    {
        field(1; "User Id"; Code[50])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserStations.Reset;
                UserStations.SetRange(UserStations."User Id", "User Id");
                if UserStations.FindFirst then
                    Error(UserAlreadyCreated, "User Id");
            end;
        }
        field(2; "Station Code"; Code[10])
        {
            TableRelation = "File Stations"."Station Code";

            trigger OnValidate()
            begin
                /*FileStations.RESET;
                IF FileStations.GET("Station Code") THEN
                  "Station Name" := FileStations.Description;*/
                FileStations.Reset;
                FileStations.SetRange("Station Code", Rec."Station Code");
                if FileStations.Find('-') then
                    Rec."Station Name" := FileStations.Description;
                Validate("Station Name");

            end;
        }
        field(3; "Station Name"; Text[50])
        {
            Editable = false;
        }
        field(4; "Can Create New"; Boolean)
        {
        }
        field(5; "Can Issue"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "User Id", "Station Code", "Station Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        FileStations: Record "File Stations";
        UserStations: Record "User Stations";
        UserAlreadyCreated: Label 'User %1 is already created';
}

