page 52186391 "Delegate Retire Lines"
{
    PageType = ListPart;
    SourceTable = "Delegate AGM Retire Update";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
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
                field(Status; Rec.Status)
                {
                }
                field(Retired; Rec.Retired)
                {
                }
                field("Retire Date"; Rec."Retire Date")
                {
                }
                field("Retired By"; Rec."Retired By")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("Reason for retirement"; Rec."Reason for retirement")
                {
                }
            }
        }
    }

    actions
    {
    }
}

