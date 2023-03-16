page 52186463 "HR Transport Requests List"
{
    CardPageID = "HR Staff Transport Requisition";
    Editable = false;
    PageType = List;
    SourceTable = "HR Transport Requisition Head";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Transport Request No"; Rec."Transport Request No")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("Job Title"; Rec."Job Title")
                {
                }
                field("Days Applied"; Rec."Days Applied")
                {
                }
                field(Supervisor; Rec.Supervisor)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755004; Outlook)
            {
            }
            systempart(Control1102755006; Notes)
            {
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Transport Requests")
            {
                Caption = 'Transport Requests';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "HR Transport Requisitions";
            }
        }
    }
}

