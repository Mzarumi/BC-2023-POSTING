page 52185642 "Salary Step/Notch Transactions"
{
    PageType = List;
    SourceTable = "Salary Step/Notch Transactions";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Transaction Code"; Rec."Transaction Code")
                {
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("% of Basic Pay"; Rec."% of Basic Pay")
                {
                }
                field(Formula; Rec.Formula)
                {
                    Editable = false;
                }
                field("Annual Amount"; Rec."Annual Amount")
                {
                }
            }
        }
    }

    actions
    {
    }
}

