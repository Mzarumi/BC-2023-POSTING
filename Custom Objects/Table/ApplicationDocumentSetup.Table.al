table 52185724 "Application Document Setup"
{
    // //DrillDownPageID = "Application Doc. Setup Card";
    // //LookupPageID = "Application Doc. Setup Card";

    fields
    {
        field(1; "Document No."; Code[10])
        {
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = ' ,Member,Account,Loan';
            OptionMembers = " ",Member,Account,Loan;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Single Party/Multiple"; Option)
        {
            OptionCaption = ' ,Single,Multiple,Business';
            OptionMembers = " ",Single,Multiple,Business;
        }
        field(5; "Retiree Document"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

