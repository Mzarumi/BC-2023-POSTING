table 52185608 prPAYE
{

    fields
    {
        field(1; "Tier Code"; Code[10])
        {
        }
        field(2; "PAYE Tier"; Decimal)
        {
        }
        field(3; Rate; Decimal)
        {
        }
        field(4; "Tax Code"; Code[20])
        {
            TableRelation = "prTax Law".Code WHERE (Blocked = FILTER (false));
        }
    }

    keys
    {
        key(Key1; "Tier Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

