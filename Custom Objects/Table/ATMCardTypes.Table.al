table 52185851 "ATM Card Types"
{
    // //DrillDownPageID = "ATM Card Types";
    // //LookupPageID = "ATM Card Types";

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Description; Text[200])
        {
        }
        field(3; "Application Charge Code"; Code[10])
        {
            TableRelation = "Transaction Types".Code WHERE(Type = FILTER("ATM Applications"));
        }
        field(4; "Replacement Charge Code"; Code[10])
        {
            TableRelation = "Transaction Types".Code WHERE(Type = FILTER("ATM Replacement"));
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
}

