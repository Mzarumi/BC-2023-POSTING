page 52186340 "Rejection Reasons"
{
    PageType = List;
    SourceTable = "Rejection Reason";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                }
            }
        }
    }

    actions
    {
    }
}

