page 52186056 "Vote Transfer"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Vote Transfer";
    SourceTableView = WHERE(Posted = CONST(false));

    layout
    {
        area(content)
        {
            group("Budget Transfer")
            {
                Caption = 'Budget Transfer';
                label(Control1000000023)
                {
                    CaptionClass = Text19066037;
                    ShowCaption = false;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                field(No; Rec.No)
                {
                }
                field(Date; Rec.Date)
                {

                    trigger OnValidate()
                    begin
                        //CheckBudgetExists
                    end;
                }
                field("Budget Name"; Rec."Budget Name")
                {

                    trigger OnValidate()
                    begin
                        //CheckBudgetExists
                    end;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                label(Source)
                {
                    CaptionClass = Text19004057;
                    Caption = 'Source';
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Source Vote"; Rec."Source Vote")
                {

                    trigger OnValidate()
                    begin
                        CheckBudgetExists
                    end;
                }
                field("Source Dimension 1"; Rec."Source Dimension 1")
                {

                    trigger OnValidate()
                    begin
                        CheckBudgetExists
                    end;
                }
                field("Source Dimension 2"; Rec."Source Dimension 2")
                {

                    trigger OnValidate()
                    begin
                        CheckBudgetExists
                    end;
                }
                field(Amount; Rec.Amount)
                {

                    trigger OnValidate()
                    begin
                        CheckBudgetExists();
                    end;
                }
                field(Remarks; Rec.Remarks)
                {
                }
                label(Destination)
                {
                    CaptionClass = Text19061585;
                    Caption = 'Destination';
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Destination Vote"; Rec."Destination Vote")
                {
                }
                field("Destination Dimension 1"; Rec."Destination Dimension 1")
                {
                }
                field("Destination Dimension 2"; Rec."Destination Dimension 2")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                Caption = 'Post';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Approved);
                    if Confirm('Do You Really Want To Post The Vote Transfer ?') then begin
                        Post_Vote();
                    end;
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
                        VoteBookExists();
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
                        VarVariant := Rec;
                        // CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
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
                                  "Document No." = FIELD("No. Series");
                    Visible = OpenApprovalEntriesExistForCurrUser;
                }
            }
        }
    }

    var
        EntryNo: Integer;
        BudgetEntry: Record "G/L Budget Entry";
        Text19066037: Label 'Transfer Details';
        Text19004057: Label 'Transfer From Details';
        Text19061585: Label 'Transfer To Details';
        "NOT OpenApprovalEntriesExist": Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        // CustomApprovals: Codeunit "Custom Approvals Codeunit";
        GLAccount: Record "G/L Account";

    //[Scope('Internal')]
    procedure Post_Vote()
    begin
        CheckBudgetExists();
        Rec.TestField(Date);
        Rec.TestField("Budget Name");
        Rec.TestField(Amount);
        Rec.TestField("Source Vote");
        Rec.TestField("Destination Vote");

        if BudgetEntry.FindLast() then begin
            EntryNo := BudgetEntry."Entry No.";
        end;

        //.........Post Reducing Vote
        EntryNo := EntryNo + 1;

        BudgetEntry.Init;
        BudgetEntry."Entry No." := EntryNo;
        BudgetEntry."Budget Name" := Rec."Budget Name";
        BudgetEntry."G/L Account No." := Rec."Source Vote";
        BudgetEntry."Date" := Rec."Date";
        BudgetEntry."Global Dimension 1 Code" := Rec."Source Dimension 1";
        BudgetEntry."Global Dimension 2 Code" := Rec."Source Dimension 2";
        //BudgetEntry."Budget Dimension 1 Code":="Source Dimension 2";
        BudgetEntry.Amount := -Rec.Amount;
        BudgetEntry.Description := Rec.Remarks;
        BudgetEntry."User ID" := UserId;
        BudgetEntry.Insert(true);

        //.........Post Incresing Vote

        EntryNo := EntryNo + 1;
        BudgetEntry.Init;
        BudgetEntry."Entry No." := EntryNo;
        BudgetEntry."Budget Name" := Rec."Budget Name";
        BudgetEntry."G/L Account No." := Rec."Destination Vote";
        BudgetEntry."Date" := Rec."Date";
        BudgetEntry."Global Dimension 1 Code" := Rec."Destination Dimension 1";
        BudgetEntry."Global Dimension 2 Code" := Rec."Destination Dimension 2";
        //BudgetEntry."Budget Dimension 1 Code":="Destination Dimension 2";
        BudgetEntry.Amount := Rec.Amount;
        BudgetEntry.Description := Rec.Remarks;
        BudgetEntry."User ID" := UserId;
        BudgetEntry.Insert(true);

        Rec.Posted := true;
        Rec."Posted Date" := Today;
        Rec."Posted By" := UserId;
        Rec.Modify;
        Message('Vote Transfered Successfully');
    end;

    local procedure VoteBookExists()
    var
        GLAccount: Record "G/L Account";
        BudgetaryControlSetup: Record "Budgetary Control Setup";
    begin
        BudgetaryControlSetup.Get;
        GLAccount.Reset;
        GLAccount.SetRange(GLAccount."No.", Rec.No);
        GLAccount.SetRange(GLAccount."Date Filter", BudgetaryControlSetup."Current Budget Start Date", BudgetaryControlSetup."Current Budget End Date");
        GLAccount.SetRange(GLAccount."Global Dimension 1 Filter", Rec."Source Dimension 1");
        GLAccount.SetRange(GLAccount."Global Dimension 2 Filter", Rec."Source Dimension 2");
        GLAccount.CalcFields("Budgeted Amount");
        if GLAccount."Budgeted Amount" < 0 then
            Error('Vote not available for transaction.');
    end;

    local procedure CheckBudgetExists()
    begin
        GLAccount.Reset;
        GLAccount.SetRange("No.", Rec."Source Vote");
        GLAccount.SetFilter("Date Filter", '<=%1', Rec."Date");
        GLAccount.SetRange(GLAccount."Budget Filter", Rec."Budget Name");
        GLAccount.SetRange(GLAccount."Global Dimension 1 Filter", Rec."Source Dimension 1");
        GLAccount.SetRange(GLAccount."Global Dimension 2 Filter", Rec."Source Dimension 2");
        GLAccount.FindSet;
        GLAccount.CalcFields(GLAccount."Budgeted Amount");
        if Rec.Amount > GLAccount."Budgeted Amount" then Error('Insufficient Budget');
    end;
}

