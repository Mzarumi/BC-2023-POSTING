page 52186400 "Product Required Documents"
{
    PageType = List;
    SourceTable = "Product Checklist";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Product Code"; Rec."Product Code")
                {
                }
                field("Mandatory Requirement"; Rec."Mandatory Requirement")
                {
                }
            }
        }
    }

    actions
    {
    }
}

