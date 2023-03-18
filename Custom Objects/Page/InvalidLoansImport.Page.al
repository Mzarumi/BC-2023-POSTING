page 52185485 "Invalid Loans Import"
{
    PageType = List;
    SourceTable = "Loans Employer Loan No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No"; Rec."Loan No")
                {
                }
                field("Employer Loan No."; Rec."Employer Loan No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

