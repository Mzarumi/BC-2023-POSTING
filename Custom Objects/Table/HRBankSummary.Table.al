table 52186181 "HR Bank Summary"
{

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Bank Code"; Code[10])
        {
        }
        field(3; "Branch Code"; Code[10])
        {
        }
        field(4; "Payroll Period"; Date)
        {
        }
        field(5; Amount; Decimal)
        {
        }
        field(6; "Transaction Code"; Code[10])
        {
        }
        field(7; "Staff No."; Code[20])
        {
        }
        field(8; "% NPAY"; Decimal)
        {
        }
        field(9; "Bank Name"; Text[100])
        {
        }
        field(10; "Branch Name"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

