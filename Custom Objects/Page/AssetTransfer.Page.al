page 52185969 "Asset Transfer"
{
    SourceTable = "Asset Transfer";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = FieldEditable;
                field("No."; Rec."No.")
                {
                    ShowMandatory = true;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Raised By"; Rec."Raised By")
                {
                }
                field("Asset to Transfer"; Rec."Asset to Transfer")
                {
                }
                field("Asset Description"; Rec."Asset Description")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field(Transferred; Rec.Transferred)
                {
                }
                field(Comments; Rec.Comments)
                {
                }
            }
            group("Transfer From")
            {
                Caption = 'Transfer From';
                Editable = FieldEditable;
                field("From Location"; Rec."From Location")
                {
                    Editable = false;
                }
                field("From Responsible Employee"; Rec."From Responsible Employee")
                {
                    Editable = false;
                }
                field("From Employee Name"; Rec."From Employee Name")
                {
                    Editable = false;
                    ShowCaption = false;
                    Style = AttentionAccent;
                    StyleExpr = TRUE;
                }
                field("From Dimension 1 Code"; Rec."From Dimension 1 Code")
                {
                }
                field("From Dimension 2 Code"; Rec."From Dimension 2 Code")
                {
                }
            }
            group("Transfer To")
            {
                Caption = 'Transfer To';
                Editable = FieldEditable;
                field("To Location"; Rec."To Location")
                {
                    ShowMandatory = true;
                }
                field("To Responsible Employee"; Rec."To Responsible Employee")
                {
                    ShowMandatory = true;
                }
                field("To Employee Name"; Rec."To Employee Name")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("To Dimension 1 Code"; Rec."To Dimension 1 Code")
                {
                }
                field("To Dimension 2 Code"; Rec."To Dimension 2 Code")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Transfer)
            {
                Image = TransferToLines;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin

                    Rec.TestField(Status, Rec.Status::Approved);

                    if Confirm(Txt001, false) = true then begin

                        FA.Reset;
                        if FA.Get(Rec."Asset to Transfer") then begin
                            if Rec."To Location" <> '' then
                                FA."FA Location Code" := Rec."To Location";
                            if Rec."To Responsible Employee" <> '' then
                                FA."Responsible Employee" := Rec."To Responsible Employee";
                            if Rec."To Dimension 1 Code" <> '' then
                                FA."Global Dimension 1 Code" := Rec."To Dimension 1 Code";
                            if Rec."To Dimension 2 Code" <> '' then
                                FA."Global Dimension 2 Code" := Rec."To Dimension 2 Code";
                            FA.Modify;
                            Message(Txt002, Rec."Asset to Transfer");
                            Rec.Transferred := true;
                        end;

                    end;
                end;
            }
            action(Print)
            {
                Caption = 'Print/Preview';
                Image = PrintReport;
                Promoted = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetFilter("No.", Rec."No.");
                    //REPORT.Run(52185915, true, true, Rec);
                    Rec.Reset;
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
            }
            group(Navigate)
            {
                Caption = 'Navigate';
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*
                        DocumentType := DocumentType::"Payment Voucher";
                        ApprovalEntries.Setfilters(DATABASE::"Payments Header","Document Type","No.");
                        ApprovalEntries.RUN;
                        */
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);

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
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId)
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
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId)
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
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId)
                    end;
                }
                action(Comment)
                {
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Approval Comments";
                    RunPageLink = "Table ID" = CONST(52185914),
                                  "Document No." = FIELD("No.");
                    Visible = OpenApprovalEntriesExistForCurrUser;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        UpdateControls;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        UpdateControls;
    end;

    var
        FA: Record "Fixed Asset";
        FieldEditable: Boolean;
        Txt001: Label 'Do you want to effect the transfer';
        Txt002: Label 'Asset %1 Successfully Transferred';
        "NOT OpenApprovalEntriesExist": Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        ActionVisible: Boolean;

    local procedure UpdateControls()
    begin
        if Rec.Status = Rec.Status::Approved then begin
            FieldEditable := false;
            ActionVisible := false;
        end else begin
            FieldEditable := true;
            ActionVisible := true;
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

