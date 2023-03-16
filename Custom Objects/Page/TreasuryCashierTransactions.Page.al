page 52185804 "Treasury Cashier Transactions"
{
    DeleteAllowed = false;
    SourceTable = "Treasury Cashier Transactions";

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
                    Editable = TransType;
                    OptionCaption = 'Teller Request,Return To Treasury,Issue From Bank,Return To Bank,Inter Teller Transfers,Branch Treasury Transactions,End of Day Return to Treasury';
                }
                field("From Account"; Rec."From Account")
                {
                    Caption = 'From';
                    Editable = FrAccount;
                }
                field("From Till"; Rec."From Till")
                {
                }
                field("To Account"; Rec."To Account")
                {
                    Caption = 'To';
                    Editable = ToAccount;
                }
                field("To Till"; Rec."To Till")
                {
                }
                field("Till/Treasury Balance"; Rec."Till/Treasury Balance")
                {
                    Caption = 'End Of Day Till Balance';
                    Editable = false;
                    Visible = true;
                }
                field(Balance; Rec.Balance)
                {
                    Caption = 'Vault Balance';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    Editable = Amnt;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    Editable = Currr;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    Caption = 'Cheque/Document No.';
                    Editable = ExternDoc;
                }
                field(Issued; Rec.Issued)
                {
                    Editable = false;
                }
                field("Date Issued"; Rec."Date Issued")
                {
                    Editable = false;
                }
                field("Time Issued"; Rec."Time Issued")
                {
                    Editable = false;
                }
                field("Issued By"; Rec."Issued By")
                {
                    Editable = false;
                }
                field(Received; Rec.Received)
                {
                    Editable = false;
                }
                field("Date Received"; Rec."Date Received")
                {
                }
                field("Time Received"; Rec."Time Received")
                {
                }
                field("Received By"; Rec."Received By")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                }
                field("Total Cash on Treasury Coinage"; Rec."Total Cash on Treasury Coinage")
                {
                    Caption = 'Total Cash on Treasury/Teller Coinage';
                }
                field(Type; Rec.Type)
                {
                    Editable = Typee;
                }
                field("Excess/Shortage Amount"; Rec."Excess/Shortage Amount")
                {
                    Editable = Excess;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
            }
            part(Coinage; Coinage)
            {
                Caption = 'Coinage';
                Editable = Cnage;
                SubPageLink = No = FIELD(No);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print/Preview.")
            {
                Promoted = true;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Approved);
                    Treasury.Reset;
                    Treasury.SetRange(No, Rec.No);
                    if Treasury.Find('-') then begin
                        //REPORT.Run(52185771, true, false, Treasury);
                    end;
                end;
            }
            action("Issue/Return")
            {
                Caption = 'Issue/Return';
                Image = Interaction;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                // SaccoT: Codeunit "Sacco Transactions";
                begin
                    //IF "Transaction Type"="Transaction Type"::"Inter Teller Transfers" THEN BEGIN
                    if Rec.Status <> Rec.Status::Approved then
                        Error('Transaction must be approved');
                    //END;

                    //SaccoT.PostTCIssue(Rec);here
                end;
            }
            separator(Action27)
            {
            }
            action(Receive)
            {
                Caption = 'Receive';
                Image = ReceiveLoaner;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                // SaccoT: Codeunit "Sacco Transactions";
                begin
                    if Rec.Status <> Rec.Status::Approved then
                        Error('Transaction must be approved');

                    //SaccoT.PostTCReceive(Rec);here
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
                action("Print/Preview")
                {

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);
                        Treasury.Reset;
                        Treasury.SetRange(No,Rec.No);
                        if Treasury.Find('-') then begin
                            //REPORT.Run(52185771, true, false, Treasury);
                        end;
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

                        if Rec.Status <> Rec.Status::Pending then
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
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateControls;
        SetControlAppearance;
    end;

    trigger OnInit()
    begin
        UpdateControls;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Posted = true then
            CurrPage.Editable := false;

        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.Find('-') then begin
            Rec."Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
            Rec."Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
            // MODIFY;
        end;
    end;

    var
        TransType: Boolean;
        FrAccount: Boolean;
        ToAccount: Boolean;
        Amnt: Boolean;
        Currr: Boolean;
        ExternDoc: Boolean;
        Excess: Boolean;
        Cnage: Boolean;
        Typee: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        // CustomApprovals: Codeunit "Custom Approvals Codeunit";
        DocMustbeOpen: Label 'This application request must be open';
        DocMustbePending: Label 'This application request must be Pending';
        UserSetup: Record "User Setup";
        Treasury: Record "Treasury Cashier Transactions";

    local procedure UpdateControls()
    begin
        if (Rec.Issued = Rec.Issued::Yes) or (Rec.Received = Rec.Received::Yes) then begin
            TransType := false;
            FrAccount := false;
            ToAccount := false;
            Amnt := false;
            Excess := false;
            Currr := false;
            Cnage := false;
            ExternDoc := false;
            Typee := false;
        end else begin
            TransType := true;
            FrAccount := true;
            ToAccount := true;
            Amnt := true;
            Excess := true;
            Currr := true;
            Cnage := true;
            ExternDoc := true;
            Typee := true;

        end;
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

