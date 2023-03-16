page 52186392 "Delegate Appoint  Lines"
{
    PageType = ListPart;
    SourceTable = "Delegate AGM Appoint Update";

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
                field("Appointment Date"; Rec."Appointment Date")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

