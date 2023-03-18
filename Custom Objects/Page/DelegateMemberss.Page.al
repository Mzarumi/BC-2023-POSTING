page 52186333 "Delegate Memberss"
{
    PageType = List;
    SourceTable = "Delegate Memberss";

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
                field("Appointment Date"; Rec."Appointment Date")
                {
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 1 Name"; Rec."Global Dimension 1 Name")
                {
                }
                field(Retired; Rec.Retired)
                {
                }
                field("Retire Date"; Rec."Retire Date")
                {
                }
                field("Reason for retirement"; Rec."Reason for retirement")
                {
                }
                field("Service Period"; Rec."Service Period")
                {
                }
                field("Retired By"; Rec."Retired By")
                {
                }
            }
        }
    }

    actions
    {
    }
}

