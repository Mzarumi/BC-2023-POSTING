page 52186492 "HR Training Application Lines"
{
    AutoSplitKey = false;
    Caption = 'HR Training Participants';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "HR Training App Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    Editable = true;
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field("Job ID"; Rec."Job ID")
                {
                    Editable = false;
                }
                field("Job Title"; Rec."Job Title")
                {
                    Editable = false;
                }
                field(Objectives; Rec.Objectives)
                {
                }
                field("Participant Email"; Rec."Participant Email")
                {
                }
                field(Notified; Rec.Notified)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        HREmployees: Record "HR Employees";
        HRTrainingAppHeader: Record "HR Training App Header";
        HRTrainingAppLines: Record "HR Training App Lines";
}

