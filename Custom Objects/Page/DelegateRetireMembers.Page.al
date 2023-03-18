page 52186298 "Delegate Retire Members"
{
    DeleteAllowed = true;
    InsertAllowed = false;
    PageType = ListPart;
    SourceTable = "Delegate Members Retirement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job Tittle"; Rec."Job Tittle")
                {
                    Editable = false;
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
                field(Retire; Rec.Retired)
                {
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

