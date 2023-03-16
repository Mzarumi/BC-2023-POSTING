page 52186313 "MemberChanges Pic & Sig"
{
    DeleteAllowed = false;
    PageType = CardPart;
    SourceTable = "Reactivate/Deactivate Header";

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

