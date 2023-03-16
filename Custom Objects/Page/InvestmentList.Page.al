page 52186281 "Investment List"
{
    CardPageID = "Investment Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Investment Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Investment No"; Rec."Investment No")
                {
                }
                field("Investment Type Code"; Rec."Investment Type Code")
                {
                }
                field("Investment Type Description"; Rec."Investment Type Description")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
    }
}

