page 52185691 "ATM Charge"
{
    PageType = List;
    SourceTable = "ATM Charges";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Total Amount"; Rec."Total Amount")
                {
                }
                field("Sacco Amount"; Rec."Sacco Amount")
                {
                }
                field(Source; Rec.Source)
                {
                }
                field(Commission; Rec.Commission)
                {
                }
            }
        }
    }

    actions
    {
    }
}

