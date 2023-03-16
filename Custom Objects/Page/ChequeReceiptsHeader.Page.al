page 52185811 "Cheque Receipts Header"
{
    PageType = Card;
    SourceTable = "Cheque Receipts";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Clearing Bank"; Rec."Clearing Bank")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    Editable = false;
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    Editable = false;
                }
                field("Unpaid By"; Rec."Unpaid By")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Refference Document"; Rec."Refference Document")
                {
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                }
                field(Unpaid; Rec.Unpaid)
                {
                    Editable = false;
                }
            }
            group(Control13)
            {
                ShowCaption = false;
                part(Control12; "Cheque Receipt Lines")
                {
                    SubPageLink = "Chq Receipt No" = FIELD("No.");
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Import)
            {
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    RefNoRec.Reset;
                    RefNoRec.SetRange(RefNoRec.CurrUserID, UserId);
                    if RefNoRec.Find('-') then begin
                        RefNoRec."Reference No" := Rec."No.";
                        RefNoRec.Modify;
                    end
                    else begin
                        RefNoRec.Init;
                        RefNoRec.CurrUserID := UserId;
                        RefNoRec."Reference No" := Rec."No.";
                        RefNoRec.Insert;
                    end;


                    InwardFile.Reset;
                    //InwardFile.SETRANGE(InwardFile.CurrentUserID,USERID);
                    if InwardFile.Find('-') then
                        InwardFile.DeleteAll;


                    Commit;

                    XMLPORT.Run(52185687, true);


                    Commit;

                    //REPORT.Run(52185773, true);


                    Commit;

                    //REPORT.Run(52185772, true);

                    Rec."Created By" := UserId;
                    Rec.Modify;
                end;
            }
            action(Post)
            {
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Approved then
                        Error(DocMustbeApproved);

                    if Rec.Posted then
                        Error('Transaction already Posted');
                    //here//SaccoT.PostCheques(Rec);
                end;
            }
            action("Post Unpay Accounts")
            {
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Approved then
                        Error(DocMustbeApproved);

                    if Rec.Unpaid then
                        Error('Transaction already unpaid');
                    //here//SaccoT.PostUnpayCheques(Rec);
                end;
            }
            action("Export Unpay Accounts")
            {
                Image = Export;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin


                    ChqRecLines.Reset;
                    ChqRecLines.SetRange(ChqRecLines."Chq Receipt No", Rec."No.");
                    XMLPORT.Run(52185494, true, false, ChqRecLines);
                end;
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

                        if Rec.Status <> Rec.Status::Open then
                            Error(DocMustbeOpen);

                        Rec.TestField("Transaction Type");
                        Rec.TestField("Clearing Bank");

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

                        if Rec.Status <> Rec.Status::Pending then
                            Error(DocMustbePending);

                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
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
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    var
        GenJournalLine: Record "Gen. Journal Line";
        GLPosting: Codeunit "Gen. Jnl.-Post Line";
        AccountType: Record "Product Factory";
        AvailableBal: Decimal;
        LineNo: Integer;
        Accounts: Record "Savings Accounts";
        TextGen: Text[250];
        ReffNo: Code[20];
        Account: Record Vendor;
        iEntryNo: Integer;
        Vend: Record Vendor;
        ChqRecLines: Record "Cheque Issue Lines";
        AccountTypes: Record "Product Factory";
        CheqReg: Record "Cheques Register";
        Charges: Record "Transaction Charges";
        GenSetup: Record "General Set-Up";
        RefNoRec: Record "Refference Number";
        AllAmount: Decimal;
        InwardFile: Record "Inward file Buffer";
        SaccoT: Codeunit "Sacco Transactions";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        DocMustbeOpen: Label 'This application request must be open';
        DocMustbePending: Label 'This application request must be Pending';
        DocMustbeApproved: Label 'This application request must be Approved before proceeding';

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

