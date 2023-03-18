page 52185746 "Standing Order"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Approve, ,Request Approval,Adjustments';
    SourceTable = "Standing Order Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Editable = TransactionTypeEdit;
                }
                field("Source Account Type"; Rec."Source Account Type")
                {
                    Editable = false;
                    ValuesAllowed = Savings;
                }
                field("Source Account No."; Rec."Source Account No.")
                {
                    Editable = SourceAccountNoEtit;
                }
                field("Source Account Name"; Rec."Source Account Name")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("ID Number"; Rec."ID Number")
                {
                }
                field(Description; Rec.Description)
                {
                    Editable = DescriptionEdit;
                }
                field("Allocated Amount"; Rec."Allocated Amount")
                {
                }
                field(Amount; Rec.Amount)
                {
                    Editable = AmountEdit;
                }
                field(Type; Rec.Type)
                {
                    Visible = false;
                }
                field("Allow Partial Deduction"; Rec."Allow Partial Deduction")
                {
                    Editable = AllowPartialEdit;
                }
                field("Income Type"; Rec."Income Type")
                {
                    Editable = IncomeTypeEdit;
                }
                field(Activity; Rec."Global Dimension 1 Code")
                {
                }
                field(Branch; Rec."Global Dimension 2 Code")
                {
                }
                field("Standing Order Type"; Rec."Standing Order Type")
                {
                    Visible = false;
                }
                field(Priority; Rec.Priority)
                {
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = true;

                    trigger OnValidate()
                    begin
                        statusControl;
                        if Rec.Status = Rec.Status::Approved then
                            if Rec."Allow Partial Deduction" <> true then
                                Error('Periodic STOs must be partial');
                    end;
                }
                field("Effective/Start Date"; Rec."Effective/Start Date")
                {
                    Editable = EffectiveDateEdit;
                }
                field("Frequency (Months)"; Rec."Frequency (Months)")
                {
                    Editable = FrequencyEdit;
                }
                field("Duration (Months)"; Rec."Duration (Months)")
                {
                    Editable = DurationEdit;
                }
                field("End Date"; Rec."End Date")
                {
                    Editable = false;
                }
            }
            part(Control46; "Standing Order Lines")
            {
                SubPageLink = "Document No." = FIELD("No.");
            }
            group(Statistics)
            {
                field(Balance; Rec.Balance)
                {
                }
                field("Stopped By"; Rec."Stopped By")
                {
                }
                field("Date Stopped"; Rec."Date Stopped")
                {
                }
                field(Effected; Rec.Effected)
                {
                }
                field(Unsuccessfull; Rec.Unsuccessfull)
                {
                }
                field("Next Run Date"; Rec."Next Run Date")
                {
                }
                field("Auto Process"; Rec."Auto Process")
                {
                    Editable = false;
                }
                field("Date Reset"; Rec."Date Reset")
                {
                }
            }
        }
        area(factboxes)
        {
            part(Control45; "Signatory Factbox")
            {
                SubPageLink = "Member No." = FIELD("Member No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
        }
        area(processing)
        {
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
                        Rec.TestField(Status, Rec.Status::Pending);
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
                        Rec.TestField(Status, Rec.Status::Pending);
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
                        Rec.TestField(Status, Rec.Status::Pending);
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
                    PromotedCategory = Category6;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        StandingOrderLines: Record "Standing Order Lines";
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField("Source Account No.");
                        Rec.TestField(Amount);
                        Rec.TestField("Effective/Start Date");
                        Rec.TestField("Duration (Months)");
                        Rec.TestField("Frequency (Months)");
                        Rec.CalcFields("Allocated Amount");
                        if Rec."Allocated Amount" <> Rec.Amount then Error(AmountError);

                        StandingOrderLines.Reset;
                        StandingOrderLines.SetRange(StandingOrderLines."Document No.", Rec."No.");
                        if StandingOrderLines.Find('-') then begin
                            repeat
                                StandingOrderLines.TestField(StandingOrderLines."Destination Account No.");
                                StandingOrderLines.TestField(StandingOrderLines.Amount);

                                case StandingOrderLines."Destination Account Type" of
                                    StandingOrderLines."Destination Account Type"::External:
                                        begin
                                            StandingOrderLines.TestField(StandingOrderLines."Bank Code");
                                            /*StandingOrderLines.TestField(StandingOrderLines."Branch Code");*/
                                            StandingOrderLines.TestField(StandingOrderLines."Destination Account No.");
                                            Rec."Transfered to EFT" := true;
                                            Rec.Modify;
                                        end;

                                    StandingOrderLines."Destination Account Type"::Credit:
                                        begin
                                            StandingOrderLines.TestField(StandingOrderLines."Loan No.");
                                        end;

                                end;
                            until StandingOrderLines.Next = 0;
                        end;

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
                    PromotedCategory = Category6;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Status,Rec. Status::Pending);

                        VarVariant := Rec;
                        // CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category6;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action(Stop)
                {
                    Image = Stop;
                    Promoted = true;
                    PromotedCategory = Category7;

                    trigger OnAction()
                    var
                        StopConfirm: Label 'Are you sure you want to Stop this standing order?';
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);
                        if not Confirm(StopConfirm, true) then exit;

                        Rec.Status := Rec.Status::Stopped;
                        Rec."Stopped By" := UserId;
                        Rec."Date Stopped" := Today;
                        Rec.Modify;
                        Message('This standing order has been stopped');
                        /*
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                          CustomApprovals.OnSendDocForApproval(VarVariant);
                          */

                    end;
                }
                action("ReOpen ")
                {
                    Image = Start;
                    Promoted = true;
                    PromotedCategory = Category7;

                    trigger OnAction()
                    var
                        StartConfirm: Label 'Are you sure you want to Re- open this standing order?';
                        StatusError: Label 'Status can only be %1  for you to run this process.';
                    begin
                        if (Rec.Status <>Rec. Status::Stopped) then
                            Error(StatusError, Format(Rec.Status::Stopped));

                        if Confirm(StartConfirm, false) = true then begin
                            Rec.Status := Rec.Status::Open;
                            Rec.Modify;
                        end else
                            exit;

                        /*
                      VarVariant := Rec;
                      IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                        */

                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        statusControl;
        SetControlAppearance;
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Source Account Type" := Rec."Source Account Type"::Savings;
    end;

    trigger OnOpenPage()
    begin

        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
    end;

    var
        TransactionTypeEdit: Boolean;
        SourceAccountNoEtit: Boolean;
        DescriptionEdit: Boolean;
        AmountEdit: Boolean;
        AllowPartialEdit: Boolean;
        IncomeTypeEdit: Boolean;
        EffectiveDateEdit: Boolean;
        FrequencyEdit: Boolean;
        DurationEdit: Boolean;
        SOLinesEdit: Boolean;
        VarVariant: Variant;
        // CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        AmountError: Label 'Allocated amount and amount are not the same.';

    //[Scope('Internal')]
    procedure statusControl()
    begin
        case Rec.Status of
            Rec.Status::Open:
                begin
                    TransactionTypeEdit := true;
                    SourceAccountNoEtit := true;
                    DescriptionEdit := true;
                    AmountEdit := true;
                    AllowPartialEdit := true;
                    IncomeTypeEdit := true;
                    EffectiveDateEdit := true;
                    FrequencyEdit := true;
                    DurationEdit := true;
                    SOLinesEdit := true;
                end;

            Rec.Status::Pending, Rec.Status::Approved, Rec.Status::Rejected,Rec.Status::Stopped:
                begin
                    TransactionTypeEdit := false;
                    SourceAccountNoEtit := false;
                    DescriptionEdit := false;
                    AmountEdit := false;
                    AllowPartialEdit := false;
                    IncomeTypeEdit := false;
                    EffectiveDateEdit := false;
                    FrequencyEdit := false;
                    DurationEdit := false;
                    SOLinesEdit := false;
                end;
        end;
    end;

    //[Scope('Internal')]
    procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

