page 52186312 "Delegate Members Applications"
{
    PageType = ListPart;
    SourceTable = "Delegate Members Applications";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                }
                field(Position; Rec.Position)
                {
                }
                field("Delegate MNO."; Rec."Delegate MNO.")
                {
                }
                field("Delegate Name"; Rec."Delegate Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

