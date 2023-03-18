page 52186620 "HR Promotion Recommend AppHead"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Promotion';
    SourceTable = "HR Promo. Recommend Header";
    SourceTableView = WHERE(Promoted = CONST(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    Editable = false;
                }
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                }
                field("Job Title"; Rec."Job Title")
                {
                    Editable = false;
                }
                field("Salary Grade"; Rec."Salary Grade")
                {
                    Editable = false;
                }
                field("Salary Notch"; Rec."Salary Notch")
                {
                    Editable = false;
                }
                field("Shortcut Dimension code1"; Rec."Shortcut Dimension code1")
                {
                    Caption = 'Region';
                    Editable = false;
                }
                field("Shortcut Dimension code2"; Rec."Shortcut Dimension code2")
                {
                    Caption = 'Department';
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                }
                field(Competencies; Rec.Competencies)
                {
                    MultiLine = true;
                }
                field("Development Areas"; Rec."Development Areas")
                {
                    MultiLine = true;
                }
                field("New Job ID"; Rec."New Job ID")
                {
                }
                field("New Job Title"; Rec."New Job Title")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("New Salary Grade"; Rec."New Salary Grade")
                {
                }
                field("New Salary Notch"; Rec."New Salary Notch")
                {
                }
                field(Reason; Rec.Reason)
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Promoted; Rec.Promoted)
                {
                    Editable = false;
                }
            }
            part("Employee Qualifications"; "HR Employee Qualification Line")
            {
                Caption = 'Employee Qualifications';
                SubPageLink = "Employee No." = FIELD("Employee No.");
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        PromoLinesrec.Reset;
        PromoLinesrec.SetRange(PromoLinesrec."Document No", Rec.No);
        if PromoLinesrec.Find('-') then
            PromoLinesrec."Document No" := Rec.No;
    end;

    var
        HREmp: Record "HR Employees";
        EmpJobDesc: Text[50];
        HRJobs: Record "HR Jobs";
        SupervisorName: Text[60];
        //SMTP: Codeunit "SMTP Mail";
        URL: Text[500];
        HRSetup: Record "HR Setup";
        EmpDept: Text[30];
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,EmpConfirmation,EmpPromotion;
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
        PromoLinesrec: Record "HR Promo. Recommend Lines";
        Txt001: Label 'Do you want to promote this employee?';
        Txt002: Label 'Employee No. %1 has been successfully promoted';
        Employees: Record "HR Employees";
}

