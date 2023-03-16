page 52186441 "DCS CRB Account Type"
{
    PageType = List;
    SourceTable = "DCS CRB Account Type";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Type Name"; Rec."Type Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

