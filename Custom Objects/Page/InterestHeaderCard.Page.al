page 52185879 "Interest Header Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Interest Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = PageEditable;
                field("No."; Rec."No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Interest Due Date"; Rec."Interest Due Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Distributed Amount"; Rec."Distributed Amount")
                {
                }
                field("Loan Count"; Rec."Loan Count")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field(Cashier; Rec.Cashier)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Bill Loan"; Rec."Bill Loan")
                {
                    Visible = false;
                }
                field("Charge Interest"; Rec."Charge Interest")
                {
                    Visible = false;
                }
            }
            part(Control1000000008; "Loans Interest")
            {
                Editable = PageEditable;
                SubPageLink = No = FIELD("No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            group(Action1000000010)
            {
                action("Generate Entries")
                {
                    Caption = 'Generate Entries';
                    Image = GetEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        SelectOpttionsErr: Label 'Select Options';
                    begin

                        if Rec.Status <> Rec.Status::Open then
                            Error('You canot generate entries since the document is already %1', Rec.Status);
                        if not Rec.Posted then begin


                            //Delete existing entries
                            LoansInterest.Reset;
                            LoansInterest.SetRange(LoansInterest.No, Rec."No.");
                            //LoansInterest.SETRANGE(LoansInterest."Loan No."
                            if LoansInterest.Find('-') then
                                LoansInterest.DeleteAll;

                            // if ("Bill Loan" = true) and ("Charge Interest" = true) then
                            //     PeriodicActivities.GenerateMonthlyInterestandBills(Rec)
                            // else
                            //     if ("Bill Loan" = true) and ("Charge Interest" = false) then
                            //         //PeriodicActivities.GenerateMonthlyBills(Rec)
                            //         PeriodicActivities.GenerateMonthlyInterestandBills(Rec)
                            //     else
                            //         if ("Bill Loan" = false) and ("Charge Interest" = true) then
                            //             //PeriodicActivities.GenerateMonthlyInterest(Rec)
                            //             PeriodicActivities.GenerateMonthlyInterestandBills(Rec)
                            //         else
                            //             Error(SelectOpttionsErr);

                        end else
                            Error('These Entries have already been posted.');
                    end;
                }
                action("Post Entries")
                {
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if Rec.Status <> Rec.Status::Approved then
                            Error(ErrNotApproved);
                        Rec.CalcFields("Distributed Amount");
                        if Rec."Distributed Amount" = 0 then
                            Error(ErrNoEntries);
                        //if not Confirm('Do you want to post these entries?') then
                        //exit else
                        //PeriodicActivities.PostEntries(Rec);
                    end;
                }
                action("Generate Entries Selectively")
                {
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //RunObject = Report "Generate Monthly Interest";
                }
                separator(Action1000000020)
                {
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Approval Comments";
                    Visible = OpenApprovalEntriesExistForCurrUser;
                }
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
                        Rec.TestField("Posting Date");
                        Rec.TestField("Document No.");
                        Rec.TestField(Description);
                        Rec.TestField("Interest Due Date");
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

    trigger OnAfterGetRecord()
    begin
        UpdateControls;
        SetControlAppearance;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        UpdateControls;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec.Status <> Rec.Status::Open then Error('You cannot modify this record');
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        UpdateControls;
    end;

    trigger OnOpenPage()
    begin
        UpdateControls;
    end;

    var
        RecBuffer: Record "Loans Interest";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit,TreasuryTransactions,BSC,"Risk Claim",Delegate,Maint,TellerTransactions,ATMM,GeneralRepair,Saccotransffers,ImprestSurrender,"BL Opening","Risk Closure","Defaulter Recovery","Guarantors Subsitute",MPESAApp,MPESAChange;
        PeriodicActivities: Codeunit "Periodic Activities";
        aaaaa: Date;
        DailyLoansInterestBuffer: Record "Daily Loans Interest Buffer";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        ErrNotApproved: Label 'This document has not been approved';
        ErrNoEntries: Label 'This Document has no Lines to post';
        BankingUserTemplate: Record "Banking User Template";
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        JTemp: Code[20];
        JBatch: Code[20];
        LoansInterest: Record "Loans Interest";
        RecBuffLines: Record "Loans Interest";
        PageEditable: Boolean;

    //[Scope('Internal')]
    procedure UpdateControls()
    begin
        if (Rec.Posted = true) or (Rec.Status <> Rec.Status::Open) then begin
            PageEditable := false;
        end else
            PageEditable := true;
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

