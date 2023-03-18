page 52185730 "Member Picture & Signature"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = CardPart;
    SourceTable = "Image Data";

    layout
    {
        area(content)
        {
            group(Pictures)
            {
                field(Picture; Rec.Picture)
                {
                }
            }
            group(Signatures)
            {
                field(Signature; Rec.Signature)
                {
                }
            }
        }
    }

    actions
    {
    }
}

