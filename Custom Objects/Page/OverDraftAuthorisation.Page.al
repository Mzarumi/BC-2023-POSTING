page 52185820 "Over Draft Authorisation"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Over Draft Authorisation";

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
                    Editable = ODFee;
                }
                field("Account No."; Rec."Account No.")
                {
                    Editable = AccNo;
                }
                field("Account Name"; Rec."Account Name")
                {
                    Editable = false;
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                    Editable = ReqAmount;
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                    Editable = AppAmount;
                }
                field("Overdraft Interest %"; Rec."Overdraft Interest %")
                {
                    Editable = ODInt;
                }
                field("Effective/Start Date"; Rec."Effective/Start Date")
                {
                    Editable = EstartDate;
                }
                field(Duration; Rec.Duration)
                {
                    Editable = Durationn;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    Editable = false;
                }
                field(Remarks; Rec.Remarks)
                {
                    Editable = Remmarks;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = GlobDim1;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Editable = GlobDim2;
                }
                field(Status; Rec.Status)
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field(Expired; Rec.Expired)
                {
                }
                field(Liquidated; Rec.Liquidated)
                {
                }
                field("Date Liquidated"; Rec."Date Liquidated")
                {
                }
                field("Liquidated By"; Rec."Liquidated By")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = RespCenter;
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755033; Outlook)
            {
            }
            systempart(Control1102755034; Notes)
            {
            }
            systempart(Control1102755035; MyNotes)
            {
            }
            systempart(Control1102755036; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Function")
            {
                Caption = 'Function';
                action(Post)
                {
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        SaccoT: Codeunit "Sacco Transactions";
                    begin
                        //here//SaccoT.PostOverDraft(Rec);
                    end;
                }
                action(Account)
                {
                    Image = Planning;
                    Promoted = true;
                    PromotedCategory = Process;
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
                        if Rec.Status <> Rec.Status::Open then
                            Error(DocMustbeOpen);

                        Rec.TestField("Transaction Type");
                        Rec.TestField("Account No.");
                        Rec.TestField("Effective/Start Date");
                        Rec.TestField(Duration);
                        Rec.TestField("Expiry Date");
                        Rec.TestField("Requested Amount");
                        Rec.TestField("Approved Amount");
                        Rec.TestField("Overdraft Interest %");


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

    trigger OnAfterGetCurrRecord()
    begin
        UpdateControl();
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    var
        DocMustbeOpen: Label 'This application request must be open';
        AccNo: Boolean;
        ReqAmount: Boolean;
        AppAmount: Boolean;
        ODInt: Boolean;
        EstartDate: Boolean;
        Durationn: Boolean;
        ODFee: Boolean;
        Remmarks: Boolean;
        RespCenter: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        GlobDim1: Boolean;
        GlobDim2: Boolean;
        DocMustbePending: Label 'This application request must be Pending';

    //[Scope('Internal')]
    procedure UpdateControl()
    begin




        if Rec.Status = Rec.Status::Open then begin
            AccNo := true;
            ReqAmount := true;
            AppAmount := true;
            ODInt := true;
            EstartDate := true;
            Durationn := true;
            ODFee := true;
            Remmarks := true;
            RespCenter := true;
            GlobDim1 := true;
            GlobDim2 := true;

        end;


        if Rec.Status = Rec.Status::Pending then begin
            AccNo := false;
            ReqAmount := false;
            AppAmount := true;
            ODInt := true;
            EstartDate := true;
            Durationn := true;
            ODFee := true;
            Remmarks := true;
            RespCenter := false;
            GlobDim1 := false;
            GlobDim2 := false;

        end;


        if Rec.Status = Rec.Status::Rejected then begin
            AccNo := false;
            ReqAmount := false;
            AppAmount := false;
            ODInt := false;
            EstartDate := false;
            Durationn := false;
            ODFee := false;
            Remmarks := false;
            RespCenter := false;
            GlobDim1 := false;
            GlobDim2 := false;


        end;

        if Rec.Status = Rec.Status::Approved then begin
            AccNo := false;
            ReqAmount := false;
            AppAmount := false;
            ODInt := false;
            EstartDate := false;
            Durationn := false;
            ODFee := false;
            Remmarks := false;
            RespCenter := false;
            GlobDim1 := false;
            GlobDim2 := false;

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

