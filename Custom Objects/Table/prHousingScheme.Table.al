table 52185634 "prHousing Scheme"
{

    fields
    {
        field(1; "Scheme Code"; Code[10])
        {
        }
        field(2; "Scheme Name"; Text[50])
        {
        }
        field(3; "Market Value"; Decimal)
        {
        }
        field(4; "Rental Value"; Decimal)
        {
        }
        field(5; "Employer Owned"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Scheme Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

