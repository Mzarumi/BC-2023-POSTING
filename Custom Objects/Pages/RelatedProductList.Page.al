page 52185776 "Related Product List"
{
    PageType = List;
    SourceTable = "Related Product";

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

