page 52186425 "Promise Topay"
{
    PageType = List;
    SourceTable = "Promise Topay";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Visible = false;
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                    Editable = false;
                }
                field("User ID"; Rec."User ID")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

