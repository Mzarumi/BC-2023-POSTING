page 52185967 "Payment Mode Charges"
{
    PageType = List;
    SourceTable = "Payment Mode Charges";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Payment Mode Type"; Rec."Payment Mode Type")
                {
                }
                field("Amount Min."; Rec."Amount Min.")
                {
                }
                field("Amount Max."; Rec."Amount Max.")
                {
                }
                field(Charges; Rec.Charges)
                {
                }
                field("Posting Account"; Rec."Posting Account")
                {
                }
            }
        }
    }

    actions
    {
    }
}

