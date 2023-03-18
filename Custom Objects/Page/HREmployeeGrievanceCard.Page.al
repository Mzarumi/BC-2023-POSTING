page 52185545 "HR Employee Grievance Card"
{
    PageType = Card;
    SourceTable = "HR Employee Grievance";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Employee First Name"; Rec."Employee First Name")
                {
                }
                field("Employee Last Name"; Rec."Employee Last Name")
                {
                }
                field("Date Of Grievance"; Rec."Date Of Grievance")
                {
                }
                field("Cause Of Grievance"; Rec."Cause Of Grievance")
                {
                }
                field("Release Date"; Rec."Release Date")
                {
                }
                field("Follow Up Date"; Rec."Follow Up Date")
                {
                }
                field("Follow Up Completed"; Rec."Follow Up Completed")
                {
                }
                field("Follow Up Date (Actual Date)"; Rec."Follow Up Date (Actual Date)")
                {
                }
                field("Outcome Of Grievance"; Rec."Outcome Of Grievance")
                {
                }
                field("Letter Sent To Employee"; Rec."Letter Sent To Employee")
                {
                }
                field("Letter Sent By Whom"; Rec."Letter Sent By Whom")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send Approval Request")
            {
                Image = SendApprovalRequest;
                Promoted = true;

                trigger OnAction()
                begin
                    Message('Send For Approval');
                end;
            }
            action(Approvals)
            {
                Image = Approvals;
                Promoted = true;

                trigger OnAction()
                begin
                    Message('Approvals');
                end;
            }
            action("Cancel Approvals Request")
            {
                Image = Cancel;
                Promoted = true;

                trigger OnAction()
                begin
                    Message('Cancel Approval Request');
                end;
            }
        }
    }
}

