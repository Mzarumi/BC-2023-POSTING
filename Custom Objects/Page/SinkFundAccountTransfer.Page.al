page 52186133 "SinkFund Account Transfer"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Account Transfer Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    Editable = false;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Editable = HeaderA;
                }
                field("Member No"; Rec."Member No")
                {
                    Editable = HeaderA;
                }
                field("Transfer Type"; Rec."Transfer Type")
                {
                    Editable = HeaderA;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = false;
                }
                field(Remarks; Rec.Remarks)
                {
                    Editable = HeaderA;
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                }
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                    Visible = RejectionReason;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;

                    trigger OnValidate()
                    begin
                        AControl;
                    end;
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    Editable = false;
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field("Total Debits"; Rec."Total Debits")
                {
                    Editable = false;
                }
                field("Total Credits"; Rec."Total Credits")
                {
                    Editable = false;
                }
            }
            group(Control17)
            {
                ShowCaption = false;
                part("Account Transfers-Source [ Debit ]"; "Account Transfer Source")
                {
                    Caption = 'Account Transfers-Source [ Debit ]';
                    Editable = SourceA;
                    SubPageLink = "No." = FIELD(No);
                }
                part("Account Transfers-Destination [ Credit ]"; "Account Transfer Destination")
                {
                    Caption = 'Account Transfers-Destination [ Credit ]';
                    Editable = DestinationA;
                    SubPageLink = "No." = FIELD(No);
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Posting)
            {
                Caption = 'Posting';
                action(Post)
                {
                    Caption = 'Post';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if Rec.Status <> Rec.Status::Approved then
                            Error(DocMustbeApproved);


                        //CalcCharges;

                        AccountTransferSource.Reset;
                        AccountTransferSource.SetRange(AccountTransferSource."No.", Rec.No);
                        AccountTransferSource.SetRange(AccountTransferSource."Source Account Type", AccountTransferSource."Source Account Type"::Savings);
                        if AccountTransferSource.Find('-') then begin
                            repeat
                                AvailableBalance := 0;
                                MinBalance := 0;

                                if Account.Get(AccountTransferSource."Source Account No.") then begin
                                    Account.CalcFields(Account.Balance, Account."Uncleared Cheques", Account."Authorised Over Draft");

                                    ProdType.Reset;
                                    ProdType.SetRange(ProdType."Product ID", Account."Product Type");
                                    if ProdType.Find('-') then begin
                                        MinBalance := ProdType."Minimum Balance";

                                        AvailableBalance := (Account.Balance + Account."Authorised Over Draft") - (MinBalance + Account."Uncleared Cheques"/*+TChargeAmount*/);
                                        if AccountTransferSource."Source Amount" > AvailableBalance then
                                            Error('Amount cannot be more than the avaiable balance of %1', AvailableBalance);

                                    end;
                                end;
                            until AccountTransferSource.Next = 0;
                        end;
                        //Mark Transaction Posted...
                        if AccountTransferHeader.Get(Rec.No) then
                            SavingsLedgerEntry.Reset;
                        SavingsLedgerEntry.SetRange("Document No.", AccountTransferHeader.No);
                        if SavingsLedgerEntry.Find('-') then begin
                            Message('This Requision is already paid');
                            AccountTransferHeader.Posted := true;
                            AccountTransferHeader.Modify;
                            exit;
                        end;
                        //SaccoT.PostTransfers(Rec);//here

                    end;
                }
                action(Print)
                {
                    Caption = 'Print';
                    Image = Print;

                    trigger OnAction()
                    begin
                        /*BTRANS.RESET;
                        BTRANS.SETRANGE(BTRANS.No,No);
                        IF BTRANS.FIND('-') THEN BEGIN
                        //REPORT.Run(52185861,TRUE,TRUE,BTRANS);
                        END;
                        */

                    end;
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
                action("Re-Open ")
                {
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = ReopenAction;

                    trigger OnAction()
                    begin
                        Rec.TestField(Posted, false);
                        if Rec.Status = Rec.Status::Approved then begin
                            Rec.Status := Rec.Status::Open;
                            Rec.Modify;
                            Message('Document open successfuly');
                        end;
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

                        if Rec.Status <> Rec.Status::Open then
                            Error(DocMustbeOpen);

                        Rec.TestField("Transaction Type");


                        Rec.CalcFields("Total Credits", "Total Debits");
                        if Rec."Total Credits" <> Rec."Total Debits" then
                            Error(AmountErrorTxt);


                        VarVariant := Rec;
                        // if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        //     CustomApprovals.OnSendDocForApproval(VarVariant);
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

                        if Rec.Status <> Rec.Status::"Pending Approval" then
                            Error(DocMustbePending);

                        VarVariant := Rec;
                        // CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Reject Approved Document")
                {
                    Image = RemoveLine;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Visible = RejectApproved;

                    trigger OnAction()
                    begin
                        if DelChr(Rec."Rejection Reason", '=', ' ') = '' then Error('Specify reason for rejection');
                        if (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::"Pending Approval") then begin
                            Rec.TestField(Posted, false);
                            Rec.TestField("Rejection Reason");
                            if Confirm('Do you want to reject the document?') then begin
                                Rec.Status := Rec.Status::Rejected;
                                Rec.Modify;
                            end;
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        AControl;
        SetControlAppearance;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Account Transfer Type" := Rec."Account Transfer Type"::SinkFund;
    end;

    trigger OnOpenPage()
    begin
        if ((Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::"Pending Approval")) and (Rec.Posted = false) then RejectApproved := true;
        if (Rec.Posted = false) and (Rec.Status <> Rec.Status::Open) then ReopenAction := true;
        RejectionReason := true;
        if Rec.Posted then RejectionReason := false;
    end;

    var
        users: Record User;
        GenJournalLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        BSched: Record "Account Transfer Source";
        BTRANS: Record "Account Transfer Header";
        DActivity: Code[20];
        DBranch: Code[20];
        UsersID: Record User;
        BSchedDestin: Record "Account Transfer Destination";
        BSchedPch: Record "Account Transfer Source";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        // CustomApprovals: Codeunit "Custom Approvals Codeunit";
        DocMustbeOpen: Label 'This application request must be open';
        DocMustbePending: Label 'This application request must be Pending';
        // SaccoT: Codeunit "Sacco Transactions";
        DocMustbeApproved: Label 'This document must be approved before posting';
        HeaderA: Boolean;
        SourceA: Boolean;
        DestinationA: Boolean;
        AmountErrorTxt: Label 'Check compliance to contra Entry.';
        AccountTransferHeader: Record "Account Transfer Header";
        SavingsLedgerEntry: Record "Savings Ledger Entry";
        AvailableBalance: Decimal;
        MinBalance: Decimal;
        Account: Record "Savings Accounts";
        AccountTransferSource: Record "Account Transfer Source";
        ProdType: Record "Product Factory";
        RejectApproved: Boolean;
        ReopenAction: Boolean;
        RejectionReason: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    //[Scope('Internal')]
    procedure AControl()
    begin
        case Rec.Status of
            Rec.Status::Open:
                begin
                    SourceA := true;
                    DestinationA := true;
                    HeaderA := true;
                end;

            Rec.Status::"Pending Approval", Rec.Status::Approved, Rec.Status::Rejected:
                begin
                    SourceA := false;
                    DestinationA := false;
                    HeaderA := false;
                end;
        end;
    end;
}

