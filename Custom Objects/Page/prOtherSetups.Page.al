page 52185662 prOtherSetups
{
    PageType = List;
    SourceTable = PrOtherSetups;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Range; Rec.Range)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Period; Rec.Period)
                {
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                }
                field("Period Type"; Rec."Period Type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

