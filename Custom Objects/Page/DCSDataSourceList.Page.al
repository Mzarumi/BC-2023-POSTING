page 52186442 "DCS Data Source List"
{
    PageType = List;
    SourceTable = "DCS Data Source";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Source Name"; Rec."Source Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

