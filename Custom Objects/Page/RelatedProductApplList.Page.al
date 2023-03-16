page 52186409 "Related Product Appl. List"
{
    PageType = List;
    SourceTable = "Related Product Application";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Related Product Code"; Rec."Related Product Code")
                {
                }
                field("Related Product Desc"; Rec."Related Product Desc")
                {
                }
            }
        }
    }

    actions
    {
    }
}

