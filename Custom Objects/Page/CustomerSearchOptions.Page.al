page 52185459 "Customer Search Options"
{
    PageType = List;
    SourceTable = "Sky Search Options";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ID; Rec.ID)
                {
                }
                field(Caption; Rec.Caption)
                {
                }
            }
        }
    }

    actions
    {
    }
}

