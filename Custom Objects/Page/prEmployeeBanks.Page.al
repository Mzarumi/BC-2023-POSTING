page 52185618 "prEmployee Banks"
{
    PageType = List;
    SourceTable = "prEmployee Banks";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Bank Code"; Rec."Bank Code")
                {
                }
                field("Branch Code"; Rec."Branch Code")
                {
                }
                field(Default; Rec.Default)
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field(Percentage; Rec.Percentage)
                {
                }
                field(AmountLCY; Rec.AmountLCY)
                {
                    Visible = false;
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Currency; Rec.Currency)
                {
                }
            }
        }
    }

    actions
    {
    }
}

