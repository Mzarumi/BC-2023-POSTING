page 52185550 "HR Leave Carryover Request"
{
    PageType = Card;
    SourceTable = "HR Leave Carry Allocation";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application Code"; Rec."Application Code")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Applicant Comments"; Rec."Applicant Comments")
                {
                }
                field(Names; Rec.Names)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Approved days"; Rec."Approved days")
                {
                }
                field(Attachments; Rec.Attachments)
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition",Job;
                    ApprovalEntries: Page "Approval Entries";
                begin

                    /*
                    DocumentType:=DocumentType::Job;
                    ApprovalEntries.Setfilters(DATABASE::Table39005606,DocumentType,"Application Code");
                    ApprovalEntries.RUN;
                    */

                end;
            }
            action("Send Approval Request")
            {
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    /*
                    
                    IF CONFIRM('Send this Carry over request for Approval?',TRUE)=FALSE THEN EXIT;
                    //AppMgmt.SendLeaveCarryoverApprovalReq(Rec);*/

                end;
            }
            action("Cancel Approval Request")
            {
                Caption = 'Cancel Approval Request';
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    /*
                    IF CONFIRM('Cancel Approval Request?',TRUE)=FALSE THEN EXIT;
                    //AppMgmt.CancelLeaveCarryoverAreasRequest(Rec,TRUE,TRUE);
                    */

                end;
            }
        }
    }
}

