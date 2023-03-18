table 52185941 "Maintain Machne/Vehicles"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
            TableRelation = "Fixed Asset"."No.";

            trigger OnValidate()
            begin
                ASSET.Reset;
                ASSET.SetRange(ASSET."No.", Code);
                if ASSET.Find('-') then
                    Description := ASSET.Description;
            end;
        }
        field(2; Description; Text[150])
        {
        }
        field(3; No; Code[20])
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
        ASSET: Record "Fixed Asset";
        Contracts: Record Contracts;
}

