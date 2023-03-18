page 52186570 "HR Employee Separation"
{
    SourceTable = "HR Employee Separation";

    layout
    {
        area(content)
        {
            field("Separation No."; Rec."Separation No.")
            {
            }
            field("Employee No."; Rec."Employee No.")
            {
            }
            field("Employee Name"; Rec."Employee Name")
            {
            }
            field(Department; Rec.Department)
            {
            }
            field("Job Title"; Rec."Job Title")
            {
            }
            field("Nature of Separation"; Rec."Nature of Separation")
            {
            }
            field("Reason for Separation"; Rec."Reason for Separation")
            {
                MultiLine = true;
            }
            field("Separation Date"; Rec."Separation Date")
            {
            }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
            }
            field("Reason for Retirement"; Rec."Reason for Retirement")
            {
                Visible = false;
            }
            field(Illness; Rec.Illness)
            {
            }
            field(Justification; Rec.Justification)
            {
                MultiLine = true;
            }
            field(Status; Rec.Status)
            {
            }
            field("End of contract Date"; Rec."End of contract Date")
            {
            }
        }
        area(factboxes)
        {
            systempart(Control17; Outlook)
            {
            }
            systempart(Control16; Notes)
            {
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
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher",PettyCash,Imprest,Requisition,ImpSurrender,Interbank,Receipt,StaffClaim,"Staff Adv",AdvSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDetails,Disc,Separation;
                    ApprovalEntries: Page "Approval Entries";
                begin
                    DocumentType := DocumentType::Separation;
                    ApprovalEntries.Setfilters(DATABASE::"HR Employee Separation", DocumentType, Rec."Separation No.");
                    ApprovalEntries.Run;
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
                    /*Rec.TestField("No of Posts");
                    Rec.TestField("Responsibility Center");
                    
                    CALCFIELDS("No. of Requirements");
                    IF "No. of Requirements" = 0 THEN  ERROR('Please Specify the Job Requirements');
                     CALCFIELDS("No. of Responsibilities");
                    
                    IF "No. of Responsibilities" = 0 THEN ERROR('Please Specify the Job Responsibilities');
                      */
                    if Confirm('Send this Document for Approval?', true) = false then exit;
                    //   AppMgmt.SendQualifiedAplicantApprovalReq(Rec);

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
                    if Confirm('Cancel Approval Request?', true) = false then exit;
                    //AppMgmt.CancelEmpChangeDetailsRequest(Rec,TRUE,TRUE);
                end;
            }
        }
    }

    var
        HREmployees: Record "HR Employees";
}

