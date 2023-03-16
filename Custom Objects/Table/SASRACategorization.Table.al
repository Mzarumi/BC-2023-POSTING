table 52185709 "SASRA Categorization"
{

    fields
    {
        field(1; "Loan No."; Code[50])
        {
        }
        field(2; "Loans Category-SASRA"; Option)
        {
            OptionCaption = 'Perfoming,Watch,Substandard,Doubtful,Loss';
            OptionMembers = Perfoming,Watch,Substandard,Doubtful,Loss;
        }
    }

    keys
    {
        key(Key1; "Loan No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

