table 52185852 "BBF Entitlement"
{
    // DrillDownPageID = "BBF Entitlement List";
    // LookupPageID = "BBF Entitlement List";

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Description; Text[30])
        {
            Editable = false;
        }
        field(3; Amount; Decimal)
        {
        }
        field(4; "Max No."; Integer)
        {
        }
        field(5; Minor; Boolean)
        {
        }
        field(6; Self; Boolean)
        {
        }
        field(7; Entitlement; Text[80])
        {
            TableRelation = "Relationship Types";

            trigger OnValidate()
            begin
                if Relations.Get(Entitlement) then
                    Description := Relations.Description;
            end;
        }
        field(8; "New Amount"; Decimal)
        {
        }
        field(9; "New Amount March 2019"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Relations: Record "Relationship Types";
}

