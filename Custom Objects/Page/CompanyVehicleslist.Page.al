page 52186564 "Company Vehicles list"
{
    PageType = List;
    SourceTable = "Company Vehicles";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Asset No."; Rec."Asset No.")
                {
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(Capacity; Rec.Capacity)
                {
                }
            }
        }
    }

    actions
    {
    }
}

