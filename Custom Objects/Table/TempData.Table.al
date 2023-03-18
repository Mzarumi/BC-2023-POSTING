table 52185423 "Temp Data"
{

    fields
    {
        field(8; No; Code[10])
        {
        }
        field(9; "Mobile Number"; Code[20])
        {
        }
        field(10; "Member Updated"; Boolean)
        {
            Caption = 'Member Updated';
        }
        field(11; "Account Updated"; Boolean)
        {
        }
        field(12; "Loan Updated"; Boolean)
        {
        }
        field(13; "Credit Updated"; Boolean)
        {
        }
        field(14; Repayment; Decimal)
        {
        }
        field(15; "Principle Amnt"; Decimal)
        {
        }
        field(16; "Interest Amnt"; Decimal)
        {
        }
        field(17; Instalments; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

