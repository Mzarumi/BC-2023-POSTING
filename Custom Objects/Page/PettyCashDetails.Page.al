page 52185901 "Petty Cash Details"
{
    PageType = Card;
    SourceTable = "Imprest Details-User";

    layout
    {
        area(content)
        {
            repeater(Control1102758000)
            {
                ShowCaption = false;
                field(No; Rec.No)
                {
                }
                field("Account No:"; Rec."Account No:")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Due Date"; Rec."Due Date")
                {
                }
                field("Imprest Holder"; Rec."Imprest Holder")
                {
                }
                field("Actual Spent"; Rec."Actual Spent")
                {
                }
                field("Apply to"; Rec."Apply to")
                {
                }
                field("Apply to ID"; Rec."Apply to ID")
                {
                }
                field("Surrender Date"; Rec."Surrender Date")
                {
                }
                field(Surrendered; Rec.Surrendered)
                {
                }
                field("M.R. No"; Rec."M.R. No")
                {
                }
                field("Date Issued"; Rec."Date Issued")
                {
                }
                field("Type of Surrender"; Rec."Type of Surrender")
                {
                }
                field("Dept. Vch. No."; Rec."Dept. Vch. No.")
                {
                }
                field("Cash Surrender Amt"; Rec."Cash Surrender Amt")
                {
                }
                field("Bank/Petty Cash"; Rec."Bank/Petty Cash")
                {
                }
            }
        }
    }

    actions
    {
    }
}

