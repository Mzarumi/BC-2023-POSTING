page 52186294 "Delegate Members"
{
    PageType = ListPart;
    SourceTable = "Delegate Members";

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
                field("Delegate MNO."; Rec."Delegate MNO.")
                {
                }
                field("Delegate Name"; Rec."Delegate Name")
                {
                }
                field(Position; Rec.Position)
                {
                }
            }
        }
    }

    actions
    {
    }
}

