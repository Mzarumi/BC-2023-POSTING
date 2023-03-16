page 52186339 "Delegate Members Applicationss"
{
    DeleteAllowed = false;
    PageType = ListPart;
    SourceTable = "Delegate Members Applicationss";

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
                field("Appointment Date"; Rec."Appointment Date")
                {
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Global Dimension 2 Name"; Rec."Global Dimension 2 Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

