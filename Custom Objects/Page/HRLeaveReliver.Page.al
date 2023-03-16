page 52185671 "HR Leave Reliver"
{
    PageType = List;
    SourceTable = "HR Leave Reliver";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Employee; Rec.Employee)
                {
                }
                field("Reliver Code"; Rec."Reliver Code")
                {
                }
                field("Reliver Name"; Rec."Reliver Name")
                {
                }
                field(Duties; Rec.Duties)
                {
                }
            }
        }
    }

    actions
    {
    }
}

