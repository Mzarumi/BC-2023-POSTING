page 52186420 "Loan Products To Bridge"
{
    PageType = List;
    SourceTable = "Loan Products to Bridge";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Product To Bridge"; Rec."Product To Bridge")
                {
                }
                field("Product Name"; Rec."Product Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

