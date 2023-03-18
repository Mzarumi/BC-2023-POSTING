page 52185759 "Loan Payment Schedule"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Schedule of Loan Payment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Payment Options"; Rec."Payment Options")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Posting Dates"; Rec."Posting Dates")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

