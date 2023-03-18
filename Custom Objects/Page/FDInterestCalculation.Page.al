page 52185741 "FD Interest Calculation"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = "FD Interest Calculation Rules";

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                ShowCaption = false;
                field("Minimum Amount"; Rec."Minimum Amount")
                {
                }
                field("Maximum Amount"; Rec."Maximum Amount")
                {
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                }
                field("Allowed Margin"; Rec."Allowed Margin")
                {
                }
            }
        }
    }

    actions
    {
    }
}

