table 52185723 "Member Category"
{
    LookupPageID = "Member Category";
    DrillDownPageId = "Member Category";

    fields
    {
        field(1; "No."; Code[10])
        {
        }
        field(5; "Registration Fee"; Decimal)
        {
        }
        field(6; "Share Capital"; Decimal)
        {
        }
        field(7; "Max. Installment"; Integer)
        {
        }
        field(8; "Default Share Capital"; Decimal)
        {
        }
        field(9; "Default Share Deposit"; Decimal)
        {
        }
        field(10; Checkoff; Boolean)
        {
        }
        field(11; "Can Take Loan"; Boolean)
        {
        }
        field(12; "Auto Generate Staff No"; Boolean)
        {
        }
        field(13; Acronym; Code[10])
        {
        }
        field(14; Remarks; Text[100])
        {
        }
        field(15; "Premier Club Min.Deposits"; Decimal)
        {
        }
        field(16; "Premier Club Reg Fee"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

