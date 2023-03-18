table 52185706 "FD Interest Calculation Rules"
{
    //LookupPageID = "Standing Order Register List";

    fields
    {
        field(1; "Entry No."; Integer)
        {
        }
        field(2; "Code"; Code[30])
        {
        }
        field(3; "Minimum Amount"; Decimal)
        {
            NotBlank = true;
        }
        field(4; "Maximum Amount"; Decimal)
        {
            NotBlank = true;
        }
        field(5; "Interest Rate"; Decimal)
        {
        }
        field(6; "Allowed Margin"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

