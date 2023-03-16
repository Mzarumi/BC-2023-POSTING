page 52186069 "Loan History"
{
    Editable = false;
    PageType = List;
    SourceTable = "Loan History";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                }
                field("Loan Status"; Rec."Loan Status")
                {
                }
                field("Outstanding Interest"; Rec."Outstanding Interest")
                {
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                }
                field("Outanding Bill"; Rec."Outanding Bill")
                {
                }
                field("Loan Issued Date"; Rec."Loan Issued Date")
                {
                }
                field("Loan Expiry Date"; Rec."Loan Expiry Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

