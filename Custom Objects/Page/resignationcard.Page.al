page 52185479 "resignation card"
{
    PageType = Card;
    SourceTable = Resignation;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Ln No"; Rec."Ln No")
                {
                }
                field(Updated; Rec.Updated)
                {
                }
                field("STO Effective Date"; Rec."STO Effective Date")
                {
                }
                field("BNK Code"; Rec."BNK Code")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000009; MyNotes)
            {
            }
        }
    }

    actions
    {
    }
}

