page 52185551 "HR Leave Journal Lines"
{
    DelayedInsert = false;
    PageType = Worksheet;
    PromotedActionCategories = 'New,Process,Report,Functions,Approvals';
    RefreshOnActivate = true;
    SaveValues = false;
    SourceTable = "HR Leave Journal Line";

    layout
    {
        area(content)
        {
            // field(CurrentJnlBatchName; Rec.CurrentJnlBatchName)
            // {
            //     Caption = 'Batch Name';
            //     Lookup = true;

            //     trigger OnLookup(var Text: Text): Boolean
            //     begin
            //         CurrPage.SaveRecord;

            //         //Rec.RESET;

            //         InsuranceJnlManagement.LookupName(CurrentJnlBatchName, Rec);
            //         CurrPage.Update(false);
            //     end;

            //     trigger OnValidate()
            //     begin

            //         InsuranceJnlManagement.CheckName(CurrentJnlBatchName, Rec);
            //         CurrentJnlBatchNameOnAfterVali;
            //     end;
            // }
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Leave Calendar Code"; Rec."Leave Calendar Code")
                {
                    Editable = true;

                    trigger OnValidate()
                    begin
                        Rec."Posting Date" := Today;
                    end;
                }
                field("Staff No."; Rec."Staff No.")
                {
                    Editable = true;

                    trigger OnValidate()
                    begin
                        if Rec."Leave Calendar Code" = '' then Error('leave calender must have a value');
                    end;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    Editable = false;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    Editable = true;
                }
                field("Leave Entry Type"; Rec."Leave Entry Type")
                {
                    Editable = true;
                }
                field("No. of Days"; Rec."No. of Days")
                {
                }
                field(Description; Rec.Description)
                {
                    Editable = true;
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable = true;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Editable = true;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Enabled = false;
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
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Post Leave Adjustment")
                {
                    Caption = 'Post Adjustment';
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);
                        if Rec."Leave Type" = '' then Error('Leave Type should have a value');
                        CODEUNIT.Run(CODEUNIT::"HR Leave Jnl.-Post", Rec);
                        CurrentJnlBatchName := Rec.GetRangeMax("Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
                action("Leave  Allocation")
                {
                    Image = Allocate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    //RunObject = Report "HR Leave Adjustment";
                }
            }
            group(Action1102755006)
            {
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = true;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval",JV;
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Send Approval Request")
                {
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = true;

                    trigger OnAction()
                    var
                        GenLedgSetup: Record "General Ledger Setup";
                        NoSeriesMgt: Codeunit NoSeriesManagement;
                        Text001: Label 'This batch is already pending approval';
                    begin
                        if Rec."Document No." = '' then Error('Document number must have a value');
                        if Rec."Leave Type" = '' then Error('Leave type must have a value');
                        Varv := Rec;
                        if CustomeApprovals.CheckApprovalsWorkflowEnabled(Varv) then
                            CustomeApprovals.OnSendDocForApproval(Varv);
                    end;
                }
                action("Cancel Approval Request")
                {
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = true;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        Varv := Rec;
                        CustomeApprovals.OnCancelDocApprovalRequest(Varv);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // HRLeaveJournalLines.RESET;
        // HRLeaveJournalLines.SETRANGE(Status,HRLeaveJournalLines.Status::Open);
        // IF HRLeaveJournalLines.FINDFIRST THEN BEGIN
        //  IF HRLeaveJournalLines.COUNT>=1 THEN BEGIN
        //   ERROR('There are still some pending document(s) on your account. Please list & select the pending document to use.');
        //  END
        // END;
    end;

    trigger OnOpenPage()
    var
        JnlSelected: Boolean;
        InsuranceJnlManagement: Codeunit "HR Leave Jnl Management";
    begin
        OpenedFromBatch := (Rec."Journal Batch Name" <> '') and (Rec."Journal Template Name" = '');
        if OpenedFromBatch then begin
            CurrentJnlBatchName := Rec."Journal Batch Name";
            //InsuranceJnlManagement.OpenJournal(CurrentJnlBatchName, Rec);
            exit;
        end;
        //InsuranceJnlManagement.TemplateSelection(PAGE::"HR Leave Journal Lines", Rec, JnlSelected);
        if not JnlSelected then
            Error('');
        //InsuranceJnlManagement.OpenJournal(CurrentJnlBatchName, Rec);
    end;

    var
        HRLeaveTypes: Record "HR Leave Types";
        HREmp: Record "HR Employees";
        HRLeaveLedger: Record "HR Leave Ledger Entries";
        InsuranceJnlManagement: Codeunit "HR Leave Jnl Management";
        ReportPrint: Codeunit "Test Report-Print";
        CurrentJnlBatchName: Code[10];
        InsuranceDescription: Text[30];
        FADescription: Text[30];
        ShortcutDimCode: array[8] of Code[20];
        OpenedFromBatch: Boolean;
        AllocationDone: Boolean;
        HRJournalBatch: Record "HR Leave Journal Batch";
        OK: Boolean;
        ApprovalEntries: Record "Approval Entry";
        LLE: Record "HR Leave Ledger Entries";
        HRLeaveCal: Record "HR Leave Calendar";
        HRLeaveJournalLine: Record "HR Leave Journal Line";
        CustomeApprovals: Codeunit "Custom Approvals Codeunit";
        Varv: Variant;
        HRLeaveJournalLines: Record "HR Leave Journal Line";
        HRLeaveJournalBatch: Record "HR Leave Journal Batch";
        UserSetup: Record "User Setup";
        ApprovalEntry: Record "Approval Entry";

    //[Scope('Internal')]
    procedure CheckGender(Emp: Record "HR Employees"; LeaveType: Record "HR Leave Types") Allocate: Boolean
    begin

        //CHECK IF LEAVE TYPE ALLOCATION APPLIES TO EMPLOYEE'S GENDER

        if Emp.Gender = Emp.Gender::Male then begin
            if LeaveType.Gender = LeaveType.Gender::Male then
                Allocate := true;
        end;

        if Emp.Gender = Emp.Gender::Female then begin
            if LeaveType.Gender = LeaveType.Gender::Female then
                Allocate := true;
        end;

        if LeaveType.Gender = LeaveType.Gender::Both then
            Allocate := true;
        exit(Allocate);

        if Emp.Gender <> LeaveType.Gender then
            Allocate := false;

        exit(Allocate);
    end;

    local procedure CurrentJnlBatchNameOnAfterVali()
    begin
        CurrPage.SaveRecord;
        //InsuranceJnlManagement.SetName(CurrentJnlBatchName, Rec);
        CurrPage.Update(false);
    end;

    //[Scope('Internal')]
    procedure AllocateLeave1()
    begin
    end;

    //[Scope('Internal')]
    procedure AllocateLeave2()
    begin
    end;
}

