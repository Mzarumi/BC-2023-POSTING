table 52186057 "Delegates Meeting Attendees"
{

    fields
    {
        field(1; "Header No"; Code[30])
        {
        }
        field(2; "Delegate No."; Code[10])
        {
            TableRelation = Members."No.";

            trigger OnValidate()
            begin
                DelegateMemberss.Reset;
                DelegateMemberss.SetRange("Delegate MNO.", "Delegate No.");
                if DelegateMemberss.Find('-') then begin
                    "Delegate Name" := DelegateMemberss."Delegate Name";
                    "Delegate Position" := DelegateMemberss.Position;
                end;

                if Members.Get("Delegate No.") then begin
                    "Delegate Name" := Members.Name;
                    "Delegate Email" := Members."E-Mail";
                    "Delegate Phone" := Members."Mobile Phone No";
                end;
            end;
        }
        field(3; "Delegate Name"; Text[100])
        {
        }
        field(4; "Delegate Email"; Text[100])
        {
        }
        field(5; "Delegate Phone"; Text[100])
        {
        }
        field(6; "Delegate Position"; Text[100])
        {
        }
        field(7; "Delegate Region"; Code[50])
        {
            TableRelation = "Delegate Region".Code;
        }
        field(8; "Electoral Zone"; Code[100])
        {
            TableRelation = "Electrol Zones/Area Svr Center".Code WHERE (Type = FILTER ("Electral Zone"));
        }
    }

    keys
    {
        key(Key1; "Delegate No.", "Delegate Region", "Header No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Options; "Delegate No.", "Delegate Name", "Delegate Position")
        {
        }
    }

    var
        DelegateMemberss: Record "Delegate Memberss";
        Members: Record Members;
}

