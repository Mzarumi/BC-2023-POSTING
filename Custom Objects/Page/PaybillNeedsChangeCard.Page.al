page 52185436 "Paybill Needs Change Card"
{
    DeleteAllowed = false;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "M-PESA Change Transactions";
    SourceTableView = WHERE("App Status" = FILTER(Pending));

    layout
    {
        area(content)
        {
            group(Control1102755008)
            {
                ShowCaption = false;
            }
            field(No; Rec.No)
            {
                Editable = false;
            }
            field("Transaction Date"; Rec."Transaction Date")
            {
                Editable = true;
            }
            field("Initiated By"; Rec."Initiated By")
            {
                Editable = false;
            }
            field("MPESA Receipt No"; Rec."MPESA Receipt No")
            {
                Editable = MPreceipt;
            }
            field("Account No"; Rec."Account No")
            {
                Editable = false;
            }
            field("Destination Type"; Rec."Destination Type")
            {

                trigger OnValidate()
                begin
                    UpdateControlVisible();
                end;
            }
            field("New Account No"; Rec."New Account No")
            {
                Editable = true;
                Enabled = true;
                Visible = true;
            }
            field("Transaction Type"; Rec."Transaction Type")
            {
                Editable = isVisible;
                Enabled = true;
                Visible = true;
            }
            field(Keyword; Rec.Keyword)
            {
            }
            field("Responsibility Centre"; Rec."Responsibility Centre")
            {
            }
            field(Activity; Rec.Activity)
            {
            }
            field(Comments; Rec.Comments)
            {
                Editable = Comms;
            }
            group(Control1102755009)
            {
                Editable = false;
                ShowCaption = false;
                field("Date Approved"; Rec."Date Approved")
                {
                    Editable = false;
                }
                field("Approved By"; Rec."Approved By")
                {
                    Editable = false;
                }
                field("Time Approved"; Rec."Time Approved")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Send For Approval By"; Rec."Send For Approval By")
                {
                    Editable = false;
                }
                field("Date Sent For Approval"; Rec."Date Sent For Approval")
                {
                    Editable = false;
                }
                field("Time Sent For Approval"; Rec."Time Sent For Approval")
                {
                    Editable = false;
                }
                field(Changed; Rec.Changed)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Mpesa Changes")
            {
            }
            action("Send Approval Request")
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    text001: Label 'This batch is already pending approval';
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    if Rec.Status <> Rec.Status::Open then
                        Error(text002);

                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                end;
            }
            action("Cancel Approval Request")
            {
                Caption = 'Cancel A&pproval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    text001: Label 'This batch is already pending approval';
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    if Rec.Status <> Rec.Status::Pending then
                        Error(text002);


                    //End allocate batch number
                    //IF ApprovalMgt.CancelMsaccoTransApprovalRequest(Rec,TRUE,TRUE) THEN;
                end;
            }
            action("Finalise Change")
            {
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Approved then
                        Error('Application must be approved');

                    if Rec.Changed = true then
                        Error('Change already effected');

                    /*StatusPermissions.RESET;
                    StatusPermissions.SETRANGE(StatusPermissions."User ID",USERID);
                    StatusPermissions.SETRANGE(StatusPermissions."Function",StatusPermissions."Function"::"Mpesa Change");
                    IF StatusPermissions.FIND('-') = FALSE THEN
                    ERROR('Please contact system Admin for this permission.');
                    
                    
                    ReversalMngt.RESET;
                    ReversalMngt.SETRANGE(ReversalMngt.UserId,USERID);
                    ReversalMngt.SETFILTER(ReversalMngt.Status,'Mpesa Change');
                    IF ReversalMngt.FIND('-') = FALSE THEN BEGIN
                    ERROR('Please contact system Admin for this permission')
                    END;
                    */
                    /*
                    IF "Initiated By"=UPPERCASE(USERID) THEN
                    ERROR('You cannot initiate and finalise same change');
                    */

                    //IF CONFIRM('Do you want to send for approval?') = TRUE THEN BEGIN

                    MPESATransactions.Reset;
                    MPESATransactions.SetRange(MPESATransactions."Entry No.", Rec."MPESA Receipt No");
                    if MPESATransactions.Find('-') then begin

                        if MPESATransactions.Changed = false then begin
                            MPESATransactions."Old Account No" := MPESATransactions."Member Account";
                        end;

                        MPESATransactions."Member Account" := Rec."New Account No";
                        MPESATransactions."Change Transaction No" := Rec.No;
                        MPESATransactions.Changed := true;
                        MPESATransactions."Needs Change" := false;
                        /*
                        MPESATransactions."Key Word":=Keyword;
                        IF ("Transaction Type"="Transaction Type"::"Deposit Contribution") THEN
                        MPESATransactions."Key Word":='D' ;
                        IF ("Transaction Type"="Transaction Type"::"Share Capital") THEN
                        MPESATransactions."Key Word":='S';
                        IF ("Transaction Type"="Transaction Type"::"Loan Repayment") THEN
                        MPESATransactions."Key Word":=Keyword;
                        */

                        MPESATransactions."Date Changed" := Today;
                        MPESATransactions."Time Changed" := Time;
                        MPESATransactions."Changed By" := Rec."Initiated By";
                        MPESATransactions."Approved By" := UserId;
                        MPESATransactions.Modify;
                    end;

                    ///////////
                    MPESAChanges.Reset;
                    MPESAChanges.SetRange(MPESAChanges.No, Rec.No);
                    if MPESAChanges.FindFirst then begin
                        MPESAChanges."App Status" := Rec."App Status"::Changed;
                        MPESAChanges."Approved By" := UserId;
                        MPESAChanges."Date Approved" := Today;
                        MPESAChanges."Time Approved" := Time;
                        MPESAChanges.Changed := true;
                        MPESAChanges.Modify;
                    end;
                    //END;

                end;
            }
            action("Reject Change")
            {
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin

                    if Confirm('Do you want to reject the transaction?') = true then begin
                        Rec.TestField("Reasons for rejection");
                        MPESAChanges.Reset;
                        MPESAChanges.SetRange(MPESAChanges.No, Rec.No);
                        if MPESAChanges.Find('-') then begin

                            if MPESAChanges."Initiated By" = UserId then begin
                                Error('The user who initiated the transaction cannot be the same as the one who rejects it.');
                                exit;
                            end;

                            MPESAChanges.Reset;
                            MPESAChanges.SetRange(MPESAChanges.No, Rec.No);
                            if MPESAChanges.FindFirst then begin
                                MPESAChanges."App Status" := MPESAChanges."App Status"::Rejected;
                                MPESAChanges."Approved By" := UserId;
                                MPESAChanges."Date Approved" := Today;
                                MPESAChanges."Time Approved" := Time;
                                MPESAChanges.Modify;
                            end;
                        end;
                    end;
                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

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

    trigger OnAfterGetCurrRecord()
    begin
        UpdateControl();
    end;

    trigger OnOpenPage()
    begin
        /*
     IF "Destination Type" = "Destination Type"::FOSA THEN BEGIN
     "BOSA Account No" := '';
     CurrPage."Transaction Type".ENABLED := FALSE;
     CurrForm."BOSA Account No".ENABLED := FALSE;
     CurrForm."New Account No".ENABLED := TRUE;
     END
     ELSE BEGIN
     CurrForm."Transaction Type".ENABLED := TRUE;
     CurrForm."BOSA Account No".ENABLED := TRUE;
     CurrForm."New Account No".ENABLED := FALSE;
     "New Account No" := '';
     END;
     */
        //isVisibleBosaAcc:=TRUE;

        //isVisible:=TRUE;

        UpdateControlVisible;
        //MPESAChanges.Activity:= UserSetUp."Global Dimension 1 Code"

    end;

    var
        MPESAChanges: Record "M-PESA Change Transactions";
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batches,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,"HRTransport Request",HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,ImprestSurrender,"MSacco Applications","MSacco PinChange","MSacco PhoneChange","MSacco TransChange",BulkSMS;
        text001: Label 'Status must be Open';
        text002: Label 'Status must be Pending';
        MPreceipt: Boolean;
        NewAccount: Boolean;
        Comms: Boolean;
        MPESATransactions: Record "Sky Transactions";
        isVisible: Boolean;
        isVisibleNewAcc: Boolean;
        isVisibleBosaAcc: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        UserSetUp: Record "User Setup";

    //[Scope('Internal')]
    procedure UpdateControl()
    begin
        if Rec.Status = Rec.Status::Open then begin

            MPreceipt := true;
            NewAccount := true;
            Comms := true;
        end;

        if Rec.Status = Rec.Status::Pending then begin
            MPreceipt := false;
            NewAccount := false;
            Comms := false;
        end;

        if Rec.Status = Rec.Status::Rejected then begin
            MPreceipt := false;
            NewAccount := false;
            Comms := false;
        end;

        if Rec.Status = Rec.Status::Approved then begin
            MPreceipt := false;
            NewAccount := false;
            Comms := false;
        end;
    end;

    //[Scope('Internal')]
    procedure UpdateControlVisible()
    begin
        if Rec."Destination Type" = Rec."Destination Type"::SAVINGS then begin

            isVisible := false;
            isVisibleNewAcc := true;
            isVisibleBosaAcc := false;


        end
        else begin
            isVisible := true;
            isVisibleNewAcc := false;
            isVisibleBosaAcc := true;
            Rec."New Account No" := '';
        end;
    end;
}

