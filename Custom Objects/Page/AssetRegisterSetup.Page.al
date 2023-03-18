page 52186207 "Asset Register Setup"
{
    PageType = List;
    SourceTable = "Asset Register Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

