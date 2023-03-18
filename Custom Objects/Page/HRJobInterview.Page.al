page 52186551 "HR Job Interview"
{
    PageType = List;
    SourceTable = "HR Job Interview";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Interview Code"; Rec."Interview Code")
                {
                }
                field("Interview Description"; Rec."Interview Description")
                {
                    Editable = false;
                }
                field(Score; Rec.Score)
                {
                }
                field(Comments; Rec.Comments)
                {
                }
                field(Interviewer; Rec.Interviewer)
                {
                    Editable = false;
                }
                field("Interviewer Name"; Rec."Interviewer Name")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Applicants)
            {
                Caption = 'Applicants';
                action("Hiring Criteria")
                {
                    Caption = 'Hiring Criteria';
                    Image = Agreement;
                    Promoted = true;
                    RunObject = Page "HR Hiring Criteria";
                    RunPageLink = "Application Code" = FIELD("Applicant No");
                }
            }
        }
    }
}

