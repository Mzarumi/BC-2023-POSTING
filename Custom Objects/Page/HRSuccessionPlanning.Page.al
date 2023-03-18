page 52186508 "HR Succession Planning"
{
    PageType = Card;
    PromotedActionCategories = 'Manage,Process,Report,Approvals,Employee Details,Position to Succeed Details';
    SourceTable = "HR Succession Employee";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Plan No."; Rec."Plan No.")
                {
                }
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("Staff Names"; Rec."Staff Names")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("Job ID"; Rec."Job ID")
                {
                    Editable = false;
                }
                field("Job Title"; Rec."Job Title")
                {
                    Editable = false;
                }
                field("Dimension 1 Code"; Rec."Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Dimension 1 Description"; Rec."Dimension 1 Description")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("Dimension 2 Code"; Rec."Dimension 2 Code")
                {
                    Editable = false;
                }
                field("Dimension 2 Description"; Rec."Dimension 2 Description")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("Date of Join"; Rec."Date of Join")
                {
                    Editable = false;
                }
                field(Mentor; Rec.Mentor)
                {
                }
                field("Mentor Name"; Rec."Mentor Name")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("Position to Succeed"; Rec."Position to Succeed")
                {
                }
                field("Position Description"; Rec."Position Description")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("Succession Date"; Rec."Succession Date")
                {
                }
                field(Status; Rec.Status)
                {
                    Style = Unfavorable;
                    StyleExpr = TRUE;
                }
                field("How long if not ready?"; Rec."How long if not ready?")
                {
                    Visible = true;
                }
            }
            part("Requirement Gaps"; "HR Succession Gaps")
            {
                Caption = 'Requirement Gaps';
                SubPageLink = "Plan No." = FIELD("Plan No.");
            }
            part("Succession Training & Development Needs"; "HR Succession Training Needs")
            {
                Caption = 'Succession Training & Development Needs';
                SubPageLink = "Plan No." = FIELD("Plan No.");
            }
            part("Succession Job Rotation"; "HR Succession Job Rotation")
            {
                Caption = 'Succession Job Rotation';
                SubPageLink = "Plan No." = FIELD("Plan No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                Caption = '&Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    //Rec.TestFieldS;

                    if Confirm('Send this Application for Approval?', true) = false then exit;

                    //ApprovalMgt.SendEmpConfirmationApprovalRequest(Rec);
                end;
            }
            action(Approvals)
            {
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin

                    DocumentType := DocumentType::SuccessionPlanning;
                    ApprovalEntries.Setfilters(DATABASE::"HR Succession Employee", DocumentType, Rec."Staff No.");
                    ApprovalEntries.Run;
                end;
            }
            action(CancelApprovalRequest)
            {
                Caption = '&Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    //ApprovalMgt.CancelEmpConfirmationApprovalRequest(Rec,TRUE,TRUE);
                end;
            }
        }
        area(navigation)
        {
            action(Qualifications)
            {
                Caption = 'Qualifications';
                Image = QualificationOverview;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = Page "HR Employee Qualification Line";
                RunPageLink = "Employee No." = FIELD("Staff No.");
            }
            action("Employment History")
            {
                Caption = 'Employment History';
                Image = History;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = Page "HR Employment History Lines";
                RunPageLink = "Employee No." = FIELD("Staff No.");
            }
            action("<Page Employee Competence>")
            {
                Caption = 'Employee Competence';
                Image = Job;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = Page "HR Employee Competence List";
                RunPageLink = "Employee No" = FIELD("Staff No.");
            }
            action("Job Requirements")
            {
                Caption = 'Job Requirements';
                Image = Card;
                Promoted = true;
                PromotedCategory = Category6;
                RunObject = Page "HR Job Requirement Lines";
                RunPageLink = "Job ID" = FIELD("Position to Succeed");
                RunPageMode = View;
            }
            action("Job Responsibilities")
            {
                Caption = 'Job Responsibilities';
                Image = JobResponsibility;
                Promoted = true;
                PromotedCategory = Category6;
                RunObject = Page "HR Job Responsiblities Lines";
                RunPageLink = "Job ID" = FIELD("Position to Succeed");
                RunPageMode = View;
            }
            action("Succession Requirements")
            {
                Caption = 'Succession Requirements';
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Category6;
                RunObject = Page "HR Succession Requirements";
                RunPageLink = "Job ID" = FIELD("Position to Succeed");
                RunPageMode = View;
            }
        }
    }

    var
        HREmp: Record "HR Employees";
        EmpJobDesc: Text[50];
        HRJobs: Record "HR Jobs";
        SupervisorName: Text[60];
        //SMTP: Codeunit "SMTP Mail";
        URL: Text[500];
        HRSetup: Record "HR Setup";
        EmpDept: Text[30];
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,EmpConfirmation,SuccessionPlanning;
        ApprovalEntries: Page "Approval Entries";
        HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        EmpName: Text[70];
        ApprovalComments: Page "Approval Comments";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        varDaysApplied: Integer;
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        "LineNo.": Integer;
        sDate: Record Date;
        Customized: Record "HR Leave Calendar";
        HREmailParameters: Record "HR E-Mail Parameters";
        HRJournalBatch: Record "HR Leave Journal Batch";
        [InDataSet]
        NotYetReady: Boolean;
}

