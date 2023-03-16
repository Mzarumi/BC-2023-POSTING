page 52186556 "HR Job Applicants Qualified Ca"
{
    Caption = 'HR Job Applicants Qualified Card';
    DeleteAllowed = false;
    Description = 'HR Job Applicants Qualified Card';
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "HR Job Applications";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Job Application No."; Rec."Job Application No.")
                {
                    Editable = false;
                }
                field(Qualified; Rec.Qualified)
                {
                    Editable = false;
                    Style = AttentionAccent;
                    StyleExpr = TRUE;
                }
                field("First Name"; Rec."First Name")
                {
                    Editable = false;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Editable = false;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Editable = false;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    Editable = false;
                }
                field(Age; Rec.Age)
                {
                    Editable = false;
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    Editable = false;
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    Editable = false;
                }
                label("Interview Details")
                {
                    Caption = 'Interview Details';
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Date of Interview"; Rec."Date of Interview")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field("From Time"; Rec."From Time")
                {
                }
                field("To Time"; Rec."To Time")
                {
                }
                field(Venue; Rec.Venue)
                {
                }
                field("Total Score After Interview"; Rec."Total Score After Interview")
                {
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Approval Status"; Rec."Approval Status")
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
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                var
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer;
                    ApprovalEntries: Page "Approval Entries";
                begin
                    DocumentType := DocumentType::"Job Approval";
                    ApprovalEntries.Setfilters(DATABASE::"HR Job Applications", DocumentType, HRJobApplicants."Job Application No.");
                    ApprovalEntries.Run;
                end;
            }
            action("Send Approval Request")
            {
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    /*Rec.TestField("No of Posts");
                    Rec.TestField("Responsibility Center");
                    
                    CALCFIELDS("No. of Requirements");
                    IF "No. of Requirements" = 0 THEN  ERROR('Please Specify the Job Requirements');
                     CALCFIELDS("No. of Responsibilities");
                    
                    IF "No. of Responsibilities" = 0 THEN ERROR('Please Specify the Job Responsibilities');
                     */
                    if Confirm('Send this Job Applicant for Approval?', true) = false then exit;
                    //AppMgmt.SendQualifiedAplicantApprovalReq(Rec);

                end;
            }
            action("Cancel Approval Request")
            {
                Caption = 'Cancel Approval Request';
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    if Confirm('Cancel Approval Request?', true) = false then exit;
                    //AppMgmt.CancelEmpChangeDetailsRequest(Rec,TRUE,TRUE);
                end;
            }
            action(Approve)
            {
                Caption = 'Approve';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec."Approval Status" := "Approval Status"::Approved;
                    Rec.Modify;
                end;
            }
        }
    }

    var
        HRJobApplicants: Record "HR Job Applications";
}

