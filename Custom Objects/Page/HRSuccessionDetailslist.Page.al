page 52186575 "HR Succession Details list"
{
    CardPageID = "HR Succession Details";
    PageType = List;
    SourceTable = "HR Jobs to Succeed";
    SourceTableView = SORTING("Job ID")
                      WHERE(Status = FILTER(Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job ID"; Rec."Job ID")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Department; Rec.Department)
                {
                }
                field(Availability; Rec.Availability)
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("No of Posts"; Rec."No of Posts")
                {
                }
                field("Position Reporting to"; Rec."Position Reporting to")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Succession)
            {
                Caption = 'Succession';
                action(Approvals)
                {
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        /*DocumentType:=DocumentType::EmpConfirmation;
                        ApprovalEntries.Setfilters(DATABASE::"HR Employee Confirmation",DocumentType,No);
                        ApprovalEntries.RUN;
                            */

                    end;
                }
                action("Send Approval Request")
                {
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        /*//Rec.TestFieldS;
                        
                        IF CONFIRM('Send this Application for Approval?',TRUE)=FALSE THEN EXIT;
                        
                        ApprovalMgt.SendEmpConfirmationApprovalReq(Rec);
                               */

                    end;
                }
                action("Cancel Approvals")
                {
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        //ApprovalMgt.CancelEmpConfirmationAppRequest(Rec,TRUE,TRUE);
                    end;
                }
            }
        }
    }
}

