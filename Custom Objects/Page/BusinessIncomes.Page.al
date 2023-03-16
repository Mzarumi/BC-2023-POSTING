page 52186402 "Business Incomes"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Business Income";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("First Day of Current Month"; Rec."First Day of Current Month")
                {
                }
                field("Total Credits (Internal)"; Rec."Total Credits (Internal)")
                {
                }
                field("Total Debits (Internal)"; Rec."Total Debits (Internal)")
                {
                }
                field("Average Amount (Internal)"; Rec."Average Amount (Internal)")
                {
                }
                field("Average Amount (External)"; Rec."Average Amount (External)")
                {
                }
            }
        }
    }

    actions
    {
    }
}

