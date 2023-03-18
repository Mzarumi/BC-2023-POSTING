page 52186558 "HR Induction Participants List"
{
    PageType = List;
    SourceTable = "HR Staff  Induction";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Participant Code"; Rec."Participant Code")
                {
                }
                field("Participant Name"; Rec."Participant Name")
                {
                }
                field(From; Rec.From)
                {
                }
                field("To Date"; Rec."To Date")
                {
                }
                field(Duration; Rec.Duration)
                {
                }
                field("Days Attended"; Rec."Days Attended")
                {
                }
                field("Induction Status"; Rec."Induction Status")
                {
                }
            }
        }
    }

    actions
    {
    }
}

