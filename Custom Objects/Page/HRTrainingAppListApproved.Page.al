page 52186491 "HR Training App List -Approved"
{
    CardPageID = "HR Training App. Card - Approv";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Training App Header";
    SourceTableView = WHERE(Status = FILTER(Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No"; Rec."Application No")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
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
                field(Status; Rec.Status)
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control5; Outlook)
            {
            }
            systempart(Control4; Notes)
            {
            }
            systempart(Control3; Links)
            {
            }
        }
    }

    actions
    {
    }
}

