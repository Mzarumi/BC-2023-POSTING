page 52185867 "Account  Interest Header"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Savings Interest Header";
    SourceTableView = WHERE(Posted = FILTER(false));

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
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Distributed Amount"; Rec."Distributed Amount")
                {
                }
                field("No of Accs."; Rec."No of Accs.")
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
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Time Posted"; Rec."Time Posted")
                {
                }
            }
            part(Control18; "Account Interest Buffer")
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
            group(Action31)
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
                        //SaccoTransactions.GenerateSavingssInterest(Rec);here
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
                        //SaccoTransactions.PostSavingsInterest(Rec);
                    end;
                }
                separator(Action28)
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";here
                    begin
                        //ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.$1.TestField$2;);here
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

                    // trigger OnAction()
                    // var
                    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    // begin
                    //     ApprovalsMgmt.RejectRecordApprovalRequest(Rec(Rec.RecordId);
                    // end;
                }
                action(Delegate)
                {
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    // trigger OnAction()
                    // var
                    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    // begin
                    //     ApprovalsMgmt.DelegateRecordApprovalRequest(Rec(Rec.RecordId);
                    // end;
                }
                action(Comment)
                {
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    //RunObject = Page "Approval Comments";
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Rec."Posting Date");
                        Rec.TestField(Rec."Document No.");
                        Rec.TestField(Rec.Description);
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
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

                    // trigger OnAction()
                    // var
                    //     ApprovalEntries: Page "Approval Entries";
                    //     approvalsMgmt: Codeunit "Approvals Mgmt.";
                    // begin
                    //     approvalsMgmt.OpenApprovalEntriesPage(Rec(Rec.RecordId);
                    // end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //UpdateControls();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        //UpdateControls();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //UpdateControls();
    end;

    trigger OnOpenPage()
    begin
        //UpdateControls();
    end;

    var
        InterestBuffer: Record "Savings Interest Buffer";
        InterestBuffer2: Record "Savings Interest Buffer";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit,TreasuryTransactions,BSC,"Risk Claim",Delegate,Maint,TellerTransactions,ATMM,GeneralRepair,Saccotransffers,ImprestSurrender,"BL Opening","Risk Closure","Defaulter Recovery","Guarantors Subsitute",MPESAApp,MPESAChange;
        PeriodicActivities: Codeunit "Periodic Activities";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        ErrNotApproved: Label 'This document has not been approved';
        ErrNoEntries: Label 'This Document has no Lines to post';
        MSGEntriesGenerated: Label 'Entries Generated Successfully';
        MSGConfirmation: Label 'Confirm interest Generation for period starting %1 and Ending %2';
        SavingsAccounts: Record "Savings Accounts";
        FromDateS: Text[100];
        ToDateS: Text[100];
        DateFilter: Text[100];
        ProductFactory: Record "Product Factory";
        ProductFactoryCode: Code[20];
        InterestRate: Decimal;
        PayableAccount: Code[20];
        ExpenseAccount: Code[20];
        BankingUserTemplate: Record "Banking User Template";
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        JTemp: Code[20];
        JBatch: Code[20];
        ErrPosted: Label 'This document has already been posted';
        PageEditable: Boolean;
        Members: Record Members;
        SaccoTransactions: Codeunit "Sacco Transactions";
        SavingsInterestBuffer: Record "Savings Interest Buffer";

    //[Scope('Internal')]
    procedure UpdateControls()
    begin
        if (Rec.Posted = true) or (Rec.Status <> Rec.Status::Open) then begin
            PageEditable := false;
        end else
            PageEditable := true;
    end;
}

