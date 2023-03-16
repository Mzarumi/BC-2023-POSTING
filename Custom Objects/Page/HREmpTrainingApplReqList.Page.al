page 52186574 "HR Emp Training Appl. Req List"
{
    CardPageID = "HR Emp Training App. Header";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HR Training App Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No"; Rec."Application No")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Course Title"; Rec."Course Title")
                {
                }
                field("Course Description"; Rec."Course Description")
                {
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field(Duration; Rec.Duration)
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Training Institution Name"; Rec."Training Institution Name")
                {
                }
                field("Training Venue"; Rec."Training Venue")
                {
                }
                field("Training Cost Cstimated"; Rec."Training Cost Cstimated")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control17; Outlook)
            {
            }
            systempart(Control18; Notes)
            {
            }
            systempart(Control19; Links)
            {
            }
        }
    }

    actions
    {
    }
}

