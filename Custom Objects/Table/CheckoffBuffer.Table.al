table 52185821 "Checkoff Buffer"
{

    fields
    {
        field(1; No; Integer)
        {
        }
        field(2; Name; Text[50])
        {
        }
        field(3; Payroll; Code[20])
        {
        }
        field(4; "Account No"; Code[20])
        {
        }
        field(5; "Loan No"; Code[20])
        {
        }
        field(6; Type; Option)
        {
            OptionCaption = ' ,sInterest,sLoan,sShare,wCont,sJoining,Investment,wLoan';
            OptionMembers = " ",sInterest,sLoan,sShare,wCont,sJoining,Investment,wLoan;
        }
        field(7; Amount; Decimal)
        {
        }
        field(8; Interest; Decimal)
        {
        }
        field(9; "Search Code"; Code[20])
        {
        }
        field(10; "Checkoff No"; Code[10])
        {
        }
        field(11; "Employer Code"; Code[20])
        {
            TableRelation = Customer;
        }
        field(12; "Member No."; Code[20])
        {
        }
        field(13; "Savings Account"; Boolean)
        {
        }
        field(14; "Credit Account"; Boolean)
        {
        }
        field(15; "ID No."; Code[20])
        {
        }
        field(16; "Upload Response"; Integer)
        {
            Editable = false;
        }
        field(17; "Upload No."; Code[20])
        {
        }
        field(18; "Not Found"; Boolean)
        {
            Editable = false;
        }
        field(19; "User Id"; Code[40])
        {
        }
        field(20; Balance; Decimal)
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

    var
        Txt00001: Label 'You cannot delete processed buffer';
}

