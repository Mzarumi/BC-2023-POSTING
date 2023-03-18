page 52186431 "BBF Requisation Headers"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "BBF Requisation Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field("Date of Death"; Rec."Date of Death")
                {
                    Editable = false;
                }
                field("Claim Option"; Rec."Claim Option")
                {
                    Editable = false;
                }
                field("Report Notice No"; Rec."Report Notice No")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
                field(Amount; Rec.Amount)
                {

                    trigger OnValidate()
                    var
                        RunPeriodicTrans: Codeunit "Sacco Transactions";
                    begin
                        //RunPeriodicTrans.POPostSinkClaim(REC);
                    end;
                }
                field("Account Name"; Rec."Account Name")
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
                field("Responsibily Center"; Rec."Responsibily Center")
                {
                    Editable = false;
                }
                field("Payment Release Date"; Rec."Payment Release Date")
                {
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
            }
            part(Control11; "BBF Requisation Lines")
            {
                SubPageLink = "Header No" = FIELD(No),
                              "Member No" = FIELD("Member No");
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action(Post)
                {
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        RunPeriodicTrans: Codeunit "Sacco Transactions";
                    begin

                        //Mark Transaction Posted...
                        if BBFRequisationHeader.Get(Rec.No) then
                            SavingsLedgerEntry.Reset;
                        SavingsLedgerEntry.SetRange("Document No.", BBFRequisationHeader.No);
                        if SavingsLedgerEntry.Find('-') then begin
                            Message('This Requision is already paid');
                            BBFRequisationLines.Reset;
                            BBFRequisationLines.SetRange("Header No", BBFRequisationHeader.No);
                            if BBFRequisationLines.Find('-') then begin
                                BBFRequisationLines.Posted := true;
                                BBFRequisationLines.Modify;
                                BBFRequisationHeader.Posted := true;
                                BBFRequisationHeader.Modify;


                                SinkFundReportInformation.Reset;
                                SinkFundReportInformation.SetRange(No, BBFHeaderClaim."Report Notice No");
                                if SinkFundReportInformation.Find('-') then begin
                                    if BBFHeaderClaim.Type = BBFHeaderClaim.Type::"Principal Member" then begin
                                        SinkFundReportInformation."Insurance Payment Status" := SinkFundReportInformation."Insurance Payment Status"::"Principal Amount Paid";
                                        SinkFundReportInformation.Modify
                                    end else
                                        SinkFundReportInformation."Insurance Payment Status" := SinkFundReportInformation."Insurance Payment Status"::"Beneficiary Claim Paid";
                                    SinkFundReportInformation.Modify;
                                end;

                                exit;
                            end;
                        end;
                        // RunPeriodicTrans.PostSinkClaims(Rec);
                    end;
                }
                action("Mandatory Requirements")
                {
                    Image = RegisteredDocs;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    RunObject = Page "Required Documents";
                    RunPageLink = "Loan No." = FIELD(No);
                }
                action("ReOpen Document")
                {
                    Caption = 'ReOpen Document';
                    Image = ReOpen;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        MsgOnDoc: Label 'Document has been Opened. Please send approval request before you can continue.';
                    begin

                        if Rec.Posted = true then
                            Error('This Requisition is already Posted');
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify;
                        Message(Mss001);
                    end;
                }
                action("Cancel Document")
                {
                    Caption = 'Cancel Document';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        Text000: Label 'Are you sure you want to cancel this Document?';
                        Text001: Label 'You have selected not to Cancel the Document';
                    begin
                    end;
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
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField("Payment Release Date");
                        Rec.TestField("Date of Death");
                        Rec.TestField(Amount);
                        ReqDocs.Reset;
                        ReqDocs.SetRange("Loan No.", Rec.No);
                        if ReqDocs.Find('-') then begin
                            repeat
                                if ReqDocs."Provided ?" = ReqDocs."Provided ?"::" " then
                                    Error(ErrMssg001, ReqDocs.Description);
                            until ReqDocs.Next = 0;
                        end;
                        BBFRequisationLines.Reset;
                        BBFRequisationLines.SetRange("Header No", Rec.No);
                        BBFRequisationLines.SetRange("Member No", Rec."Member No");
                        if BBFRequisationLines.Find('-') then begin
                            repeat
                                //BBFRequisationLines.TestField("ID No.");
                                BBFRequisationLines.TestField("Pay To ID");
                            until BBFRequisationLines.Next = 0;
                        end;
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

                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId)
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
                    RunPageLink = "Table ID" = CONST(52185888),
                                  "Document No." = FIELD("No. Series");
                    Visible = OpenApprovalEntriesExistForCurrUser;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        SetControlAppearance;
        if (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::Pending) then
            CurrPage.Editable := false;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec.Status <> Rec.Status::Open then
            Error('Status must be Open');
        if Rec.Status = Rec.Status::Open then
            Rec.Date := Today;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        if (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::Pending) then
            CurrPage.Editable := false;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        "NOT OpenApprovalEntriesExist": Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        ReqDocs: Record "Loan Required Documents";
        ErrMssg001: Label 'Please provide mandatory documet %1';
        Mss001: Label 'Document has been open successfuly';
        SavingsLedgerEntry: Record "Savings Ledger Entry";
        BBFRequisationHeader: Record "BBF Requisation Header";
        BBFRequisationLines: Record "BBF Requisation Lines";
        BBFHeaderClaim: Record "BBF Requisation Header";
        SinkFundReportInformation: Record "SinkFund Report Information";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

