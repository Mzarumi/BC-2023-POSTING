page 52186569 "HR Activity Participants SF"
{
    Caption = 'Activity Participants';
    PageType = ListPart;
    SaveValues = true;
    SourceTable = "HR Activity Participants";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field(Notified; Rec.Notified)
                {
                }
                field(Participant; Rec.Participant)
                {
                }
                field("Participant Name"; Rec."Participant Name")
                {
                }
                field("Participant E-Mail"; Rec."Participant E-Mail")
                {
                }
                field("Participant Role"; Rec."Participant Role")
                {
                }
                field(Contribution; Rec.Contribution)
                {
                }
            }
        }
    }

    actions
    {
    }
}

