table 52185820 "Checkoff Lines"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "Checkoff Header"; Code[20])
        {
        }
        field(3; "Member No."; Code[20])
        {
        }
        field(4; "Account No."; Code[20])
        {
        }
        field(5; "Payroll No."; Code[20])
        {
        }
        field(6; Amount; Decimal)
        {
        }
        field(7; "Loan No."; Code[20])
        {
        }
        field(8; Multiple; Boolean)
        {
        }
        field(9; "Credit Account"; Boolean)
        {
        }
        field(10; Name; Text[50])
        {
        }
        field(11; "Savings Account"; Boolean)
        {
        }
        field(12; "ID Number"; Code[11])
        {
        }
        field(13; Posted; Boolean)
        {
        }
        field(14; Type; Option)
        {
            OptionCaption = ' ,sInterest,sLoan,sShare,wCont,sJoining,Investment,wLoan';
            OptionMembers = " ",sInterest,sLoan,sShare,wCont,sJoining,Investment,wLoan;
        }
        field(15; "Employer Code"; Code[20])
        {
            CalcFormula = Lookup ("Checkoff Header"."Account No." WHERE ("No." = FIELD ("Checkoff Header")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Checkoff Header")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

