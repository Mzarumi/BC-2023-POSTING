page 52186296 "Delegate Groups Retire Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Delegate Group Memb Retirement";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Delegate Group"; Rec."Delegate Group")
                {
                    Caption = 'Electoral Zone Code';
                }
                field("Delegate Group Description"; Rec."Delegate Group Description")
                {
                    Caption = 'Electoral Zone Description';
                }
                field("Electoral Zone"; Rec."Electoral Zone")
                {
                    Caption = 'Region Name';
                }
                field("Electoral Zone Name"; Rec."Electoral Zone Name")
                {
                    Caption = 'Region Name Description';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field(County; Rec.County)
                {
                }
                field("County Name"; Rec."County Name")
                {
                }
                field("Sub-County"; Rec."Sub-County")
                {
                }
                field("Sub-County Name"; Rec."Sub-County Name")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Creation Date"; Rec."Creation Date")
                {
                }
            }
            part(Control11; "Delegate Retire Members")
            {
                Editable = false;
                SubPageLink = Code = FIELD("Delegate Group");
            }
        }
    }

    actions
    {
        area(creation)
        {
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
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        if not LinesExists then
                            Error('There are no Lines created for this Document');

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
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
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
                        // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId)

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
                        // ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId)
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
                        // ApprovalsMgmt.RejectRecordApprovalRequest(RecordId)
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
                        // ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId)
                    end;
                }
                action(Comment)
                {
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Approval Comments";
                    RunPageLink = "Table ID" = CONST(52185888),
                                  "Document No." = FIELD("No. Series");
                    Visible = OpenApprovalEntriesExistForCurrUser;
                }
            }
        }
    }

    var
        "NOT OpenApprovalEntriesExist": Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        HasLines: Boolean;

    //[Scope('Internal')]
    procedure LinesExists(): Boolean
    var
        PayLines: Record "Payment Line Board";
    begin
        HasLines := false;
        /*
        PayLines.RESET;
        PayLines.SETRANGE(PayLines."Document No","Transaction No.");
         IF PayLines.FIND('-') THEN BEGIN
            HasLines:=TRUE;
            EXIT(HasLines);
         END;
         */

    end;
}

