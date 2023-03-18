page 52186050 "Overtime Claim Header"
{
    PageType = Document;
    SourceTable = "Overtime Claim Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = EDITABLE;
                field("Claim No"; Rec."Claim No")
                {
                }
                field("Date Created"; Rec."Date Created")
                {
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                }
                field("Staff No."; Rec."Staff No.")
                {
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field(Department; Rec.Department)
                {
                }
            }
            group("Overtime Hours")
            {
                Editable = EDITABLE;
                field("Total Overtime Week Days"; Rec."Total Overtime Week Days")
                {
                }
                field("Total Overtime Weekend & Holid"; Rec."Total Overtime Weekend & Holid")
                {
                }
                field("Total Overtime Hrs"; Rec."Total Overtime Hrs")
                {
                }
            }
            part(Lines; "Overtime Claim Lines")
            {
                Editable = Editable;
                SubPageLink = "Claim No" = FIELD("Claim No");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print/Preview")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Approved);

                    Rec.Reset;
                    Rec.SetFilter("Claim No", Rec."Claim No");
                    //REPORT.Run(39005909, true, true, Rec);
                    Rec.Reset;
                end;
            }
            separator(Action23)
            {
            }
            action("Cancel Document")
            {
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Text000: Label 'Are you sure you want to cancel this Document?';
                    Text001: Label 'You have selected not to Cancel the Document';
                begin

                    Rec.TestField(Status, Rec.Status::Approved);
                    if Confirm(Text000, true) then begin
                        Rec.Status := Rec.Status::Cancelled;
                        Rec.Modify;
                    end else
                        Error(Text001);
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
                        if not LinesExists then
                            Error('There are no Lines created for this Document');

                        if not AllFieldsEntered then
                            Error('Some of the Key Fields on the Lines:[ACCOUNT NO.,AMOUNT] Have not been Entered please RECHECK your entries');

                        /*
                        //Ensure No Items That should be committed that are not
                        IF LinesCommitmentStatus THEN
                          ERROR('There are some lines that have not been committed');
                        */
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
                    RunPageLink = "Table ID" = CONST(52185936),
                                  "Document No." = FIELD("Claim No");
                    Visible = OpenApprovalEntriesExistForCurrUser;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ActivatControls;
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();

        ActivatControls;
    end;

    trigger OnOpenPage()
    begin

        if UserMgt.GetPurchasesFilter() <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FilterGroup(0);
        end;
        ActivatControls;
    end;

    var
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batches,Loan,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,"HRTransport Request",HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation","Overdraft ",BLA,"Member Editable","MSacco Applications","MSacco PinChange","MSacco PhoneChange","MSacco TransChange",BulkSMS,"Payment Voucher","Petty Cash",Imp,Requisition,ImpSurr,Interbank,Receipt,"Staff Claim","Staff Adv",AdvSurr,OT;
        DocPrint: Codeunit "Document-Print";
        CheckLedger: Record "Check Ledger Entry";
        CheckManagement: Codeunit CheckManagement;
        HasLines: Boolean;
        ApprovalEntry: Record "Approval Entry";
        UserMgt: Codeunit "User Setup Management BR";
        AllKeyFieldsEntered: Boolean;
        [InDataSet]
        Editable: Boolean;
        "NOT OpenApprovalEntriesExist": Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";

    //[Scope('Internal')]
    procedure ActivatControls()
    begin
        /*
          IF Status <> Status::Pending THEN BEGIN
                CurrPage.Lines.EDITABLE :=FALSE;
                CurrPage."Responsibility Center".EDITABLE := FALSE;
                CurrPage.Department.EDITABLE := FALSE;
        
                CurrPage.UPDATECONTROLS;
          END ELSE BEGIN
               CurrPage.Lines.EDITABLE :=TRUE;
               CurrPage."Responsibility Center".EDITABLE := TRUE;
                CurrPage.Department.EDITABLE := TRUE;
        
               CurrPage.UPDATECONTROLS;
          END
        */
        /*
        xRec:=Rec;
        UpdateControls;
        UpdatePageControls();
        CurrPage.UPDATE;
        
          IF Status <> Status::Pending THEN
            CurrPage.EDITABLE := false
          else
            CurrPage.EDITABLE := true;
        */
        if Rec.Status <> Rec.Status::Pending then
            Editable := false
        else
            Editable := true;

    end;

    //[Scope('Internal')]
    procedure AllFieldsEntered(): Boolean
    var
        OTLines: Record "Overtime Claim Lines";
    begin
        AllKeyFieldsEntered := true;
        OTLines.Reset;
        OTLines.SetRange(OTLines."Claim No", Rec."Claim No");
        if OTLines.Find('-') then begin
            repeat
                if (OTLines."Work Description/Reason" = '') or (OTLines.Amount <= 0) or (OTLines.Date = 0D) then
                    AllKeyFieldsEntered := false;
            until OTLines.Next = 0;
            exit(AllKeyFieldsEntered);
        end;
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    //[Scope('Internal')]
    procedure LinesExists(): Boolean
    var
        PayLines: Record "Overtime Claim Lines";
    begin
        HasLines := false;
        PayLines.Reset;
        PayLines.SetRange(PayLines."Claim No", Rec."Claim No");
        if PayLines.Find('-') then
            repeat
                PayLines.TestField(PayLines.Amount);
                HasLines := true;
                exit(HasLines);
            until PayLines.Next = 0;
    end;

    //[Scope('Internal')]
    procedure LinesCommitmentStatus() Exists: Boolean
    var
        BCsetup: Record "Budgetary Control Setup";
        Payline: Record "Overtime Claim Lines";
    begin
        if BCsetup.Get() then begin
            if not BCsetup.Mandatory then begin
                Exists := false;
                exit;
            end;
        end else begin
            Exists := false;
            exit;
        end;
        Exists := false;
        Payline.Reset;
        Payline.SetRange(Payline."Claim No", Rec."Claim No");
        //Payline.SETRANGE(Payline.Committed,FALSE);
        //Payline.SETRANGE(Payline."Budgetary Control A/C",TRUE);
        if Payline.Find('-') then
            Exists := true;
    end;
}

