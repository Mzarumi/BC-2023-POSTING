page 52186041 "Purchase Quote Parameters"
{
    PageType = List;
    SourceTable = "Purchase Quote Params";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Specification; Rec.Specification)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Value; Rec.Value)
                {
                }
            }
        }
    }

    actions
    {
    }
}

