page 52185733 "Dividend Simulation Lines"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    Editable = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Dividend Simulation Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("G/L Account"; Rec."G/L Account")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Weighted Amount"; Rec."Weighted Amount")
                {
                }
            }
        }
    }

    actions
    {
    }
}

