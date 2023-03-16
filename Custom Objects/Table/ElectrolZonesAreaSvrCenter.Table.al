table 52186116 "Electrol Zones/Area Svr Center"
{
    //LookupPageID = "Electrol Zones/Area Svr Center";

    fields
    {
        field(1; Type; Option)
        {
            OptionMembers = " ","Electral Zone","Area Service Centers";
        }
        field(2; "Code"; Code[20])
        {
        }
        field(3; Description; Text[150])
        {
        }
        field(4; "Mileage (KMs)"; Decimal)
        {
            Description = '//To gather for delegates transport allowance computations';
        }
    }

    keys
    {
        key(Key1; Type, "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

