page 52185478 "Resignation List"
{
    CardPageID = "resignation card";
    Editable = false;
    PageType = List;
    SourceTable = Resignation;

    layout
    {
        area(content)
        {
            repeater(Group)
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
    }

    actions
    {
    }
}

