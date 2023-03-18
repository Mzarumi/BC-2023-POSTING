page 52185816 "Bankers Cheque Application"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Bankers Cheque Application";

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
                field("Application Date"; Rec."Application Date")
                {
                    Editable = false;
                }
                field("Begining Cheque No."; Rec."Begining Cheque No.")
                {
                    Editable = BeginCHNo;
                }
                field("No of Leaves"; Rec."No of Leaves")
                {
                    Editable = NoOfLives;
                }
                field("Leaf Limit Amount"; Rec."Leaf Limit Amount")
                {
                    Editable = LeafLimit;
                }
                field("Bank Account"; Rec."Bank Account")
                {
                    Editable = Bnk;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Editable = false;
                }
                field("Responsibility Centre"; Rec."Responsibility Centre")
                {
                    Editable = false;
                }
                field("Cheque Register Generated"; Rec."Cheque Register Generated")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Generate Cheque Register")
            {
                Image = Interaction;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Rec."Cheque Register Generated" = true then
                        Error('Register already generated');

                    if Rec.Status <> Rec.Status::Approved then
                        Error('The document must be fully approved before proceeding');

                    if Confirm('Are you sure you want to generate bankers cheque register ?', false) = false then
                        exit;

                    i := 0;

                    repeat
                        i := i + 1;

                        BankerR.Init;
                        BankerR."Cheque No." := Rec."Begining Cheque No.";
                        BankerR."Application No." := Rec."No.";
                        BankerR."Global Dimension 2 Code" := Rec."Global Dimension 2 Code";
                        BankerR."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                        BankerR."Bank Account" := Rec."Bank Account";
                        BankerR."Leaf Limit Amount" := Rec."Leaf Limit Amount";
                        BankerR.Insert;

                        BankerR.Validate(BankerR."Bank Account");

                        Rec."Begining Cheque No." := IncStr(Rec."Begining Cheque No.");
                    until i = Rec."No of Leaves";

                    Rec."Cheque Register Generated" := true;
                    Rec.Modify;
                    Message('Register generated successfuly');
                end;
            }
            action("Cheque Register")
            {
                Image = GetLines;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Bankers Cheque Register List";
                RunPageLink = "Application No." = FIELD("No.");
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

                        Rec.TestField("Begining Cheque No.");
                        Rec.TestField("Bank Account");

                        if Rec."Leaf Limit Amount" = 0 then
                            Error('Kindly specify the leaf limit before proceeding');


                        if Rec.Status <> Rec.Status::Open then
                            Error(DocMustbeOpen);

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
                        if Rec.Status <> Rec.Status::"Pending Approval" then
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
        UpdateControl;
    end;

    trigger OnInit()
    begin
        UpdateControl;
    end;

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        i: Integer;
        BankerR: Record "Bankers Cheques Register";
        DocMustbeOpen: Label 'This application request must be open';
        DocMustbePending: Label 'This application request must be Pending';
        BeginCHNo: Boolean;
        NoOfLives: Boolean;
        Bnk: Boolean;
        LeafLimit: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    local procedure UpdateControl()
    begin


        if Rec.Status = Rec.Status::Open then begin
            BeginCHNo := true;
            NoOfLives := true;
            Bnk := true;
            LeafLimit := true;
        end;


        if Rec.Status = Rec.Status::"Pending Approval" then begin
            BeginCHNo := false;
            NoOfLives := false;
            Bnk := false;
            LeafLimit := false;
        end;


        if Rec.Status = Rec.Status::Rejected then begin
            BeginCHNo := false;
            NoOfLives := false;
            Bnk := false;
            LeafLimit := false;
        end;

        if Rec.Status = Rec.Status::Approved then begin
            BeginCHNo := false;
            NoOfLives := false;
            Bnk := false;
            LeafLimit := false;
        end;
    end;
}

