page 52186514 "HR Promotion Recommend Header"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Promotion';
    SourceTable = "HR Promo. Recommend Header";

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
                field(Status; Rec.Status)
                {
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
                field(Promoted; Rec.Promoted)
                {
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
        area(processing)
        {
            action(Promote)
            {
                Image = Position;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin

                    if Confirm(Txt001, false) = true then begin

                        Employees.Reset;
                        Employees.SetRange(Employees."No.", Rec."Employee No.");
                        if Employees.Find('-') then begin
                            Employees.Position := Rec."New Job ID";
                            Employees."Job Title" := Rec."New Job Title";
                            //Employees."Salary Grade" := Rec."New Salary Grade";
                            Employees."Salary Notch/Step" := Rec."New Salary Notch";

                            Employees.Modify;
                        end;

                        Rec.Promoted := true;
                        Rec.Modify;

                        Message(Txt002, Rec."Employee No.");

                    end;
                end;
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
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
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
}

