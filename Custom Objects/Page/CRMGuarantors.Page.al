page 52185483 CRMGuarantors
{
    PageType = List;
    SourceTable = "Loan Guarantors and Security";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No"; Rec."Loan No")
                {
                }
                field("Savings Account No./Member No."; Rec."Savings Account No./Member No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Loan Balance"; Rec."Loan Balance")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Member Guaranteed"; Rec."Member Guaranteed")
                {
                }
                field("Total Guaranteed"; Rec."Total Guaranteed")
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field("Amount Guaranteed"; Rec."Amount Guaranteed")
                {
                }
                field(Substituted; Rec.Substituted)
                {
                }
            }
        }
    }

    actions
    {
    }
}

