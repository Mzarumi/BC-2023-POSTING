table 52185615 prInsurancePolicies
{

    fields
    {
        field(1; "Employee Code"; Code[10])
        {

        }
        field(2; "Policy Number"; Code[50])
        {
            NotBlank = true;
        }
        field(3; "Insurance Code"; Code[10])
        {
            TableRelation = "prInstitutional Membership"."Institution No";
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; "Deduct premium"; Boolean)
        {
        }
        field(6; balance; Decimal)
        {
        }
        field(7; lumpsumitems; Boolean)
        {
            Description = 'lump sum the values';
        }
        field(8; "Is Insurance policy"; Boolean)
        {
            Description = 'True if its an insurance policy';
        }
        field(9; "Transaction Code"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Policy Number", "Insurance Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

