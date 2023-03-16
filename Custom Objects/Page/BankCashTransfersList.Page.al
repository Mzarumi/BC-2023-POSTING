page 52185930 "Bank & Cash Transfers List"
{
    CardPageID = "Bank & Cash Transfer Request";
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancel,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "InterBank Transfers";
    SourceTableView = WHERE(Posted = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Receiving Account"; Rec."Receiving Account")
                {
                }
                field("Receiving Bank Account Name"; Rec."Receiving Bank Account Name")
                {
                }
                field("Currency Code Source"; Rec."Currency Code Source")
                {
                }
                field("Exch. Rate Source"; Rec."Exch. Rate Source")
                {
                }
                field("Request Amt LCY"; Rec."Request Amt LCY")
                {
                }
                field("Paying Account"; Rec."Paying Account")
                {
                }
                field("Paying  Bank Account Name"; Rec."Paying  Bank Account Name")
                {
                }
                field("Currency Code Destination"; Rec."Currency Code Destination")
                {
                }
                field("Exch. Rate Destination"; Rec."Exch. Rate Destination")
                {
                }
                field("Pay Amt LCY"; Rec."Pay Amt LCY")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755017; Notes)
            {
            }
            systempart(Control1102755018; MyNotes)
            {
            }
            systempart(Control1102755019; Outlook)
            {
            }
            systempart(Control1102755020; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("<Action1102756002>")
            {
                Caption = 'Functions';
                action("<Action1102756012>")
                {
                    Caption = 'Print';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(No, Rec.No);
                        //REPORT.Run(52185786, true, true, Rec);
                        Rec.Reset;
                    end;
                }
                action("<Action1102756018>")
                {
                    Caption = 'Cancel Document';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        Text000: Label 'Are you sure you want to Cancel this Document?';
                        Text001: Label 'You have selected not to Cancel this Document';
                    begin

                        Rec.TestField(Status, Rec.Status::Approved);

                        if Confirm(Text000, true) then begin
                            Rec.Status := Rec.Status::Cancelled;
                            Rec."Cancelled By" := UserId;
                            Rec."Date Cancelled" := Today;
                            Rec."Time Cancelled" := Time;
                            Rec.Modify;
                        end else
                            Error(Text001);
                    end;
                }
            }
            action("<Action1102758002>")
            {
                Caption = '&Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    TempBatch.Reset;
                    TempBatch.SetRange(TempBatch.UserID, UserId);
                    if TempBatch.Find('-') then begin
                        Rec."Inter Bank Template Name" := TempBatch."Inter Bank Template Name";
                        Rec."Inter Bank Journal Batch" := TempBatch."Inter Bank Batch Name";
                    end;

                    Rec.TestField(Status, Rec.Status::Approved);

                    Rec.TestField("Transfer Release Date");

                    //Check whether the two LCY amounts are same
                    if Rec."Request Amt LCY" <> Rec."Pay Amt LCY" then
                        Error('The [Requested Amount in LCY: %1] should be same as the [Paid Amount in LCY: %2]', Rec."Request Amt LCY", Rec."Pay Amt LCY");

                    //get the source account balance from the database table
                    BankAcc.Reset;
                    BankAcc.SetRange(BankAcc."No.", Rec."Paying Account");
                    BankAcc.SetRange(BankAcc."Bank Type", BankAcc."Bank Type"::Cash);
                    if BankAcc.FindFirst then begin
                        BankAcc.CalcFields(BankAcc.Balance);
                        Rec."Current Source A/C Bal." := BankAcc.Balance;
                        if (Rec."Current Source A/C Bal." - Rec.Amount) < 0 then begin
                            Error('The transaction will result in a negative balance in a CASH ACCOUNT.');
                        end;
                    end;
                    if Rec.Amount = 0 then begin
                        Error('Please ensure Amount to Transfer is entered');
                    end;
                    /*Check if the user's batch has any records within it*/
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", Rec."Inter Bank Template Name");
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", Rec."Inter Bank Journal Batch");
                    GenJnlLine.DeleteAll;

                    LineNo := 1000;
                    /*Insert the new lines to be updated*/
                    GenJnlLine.Init;
                    /*Insert the lines*/
                    GenJnlLine."Line No." := LineNo;
                    GenJnlLine."Source Code" := 'PAYMENTJNL';
                    GenJnlLine."Journal Template Name" := Rec."Inter Bank Template Name";
                    GenJnlLine."Journal Batch Name" := Rec."Inter Bank Journal Batch";
                    GenJnlLine."Posting Date" := Rec."Transfer Release Date";
                    GenJnlLine."Document No." := Rec.No;
                    if Rec."Receiving Transfer Type" = Rec."Receiving Transfer Type"::"Intra-Company" then begin
                        GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
                    end
                    else
                        if Rec."Receiving Transfer Type" = Rec."Receiving Transfer Type"::"Inter-Company" then begin
                            GenJnlLine."Account Type" := GenJnlLine."Account Type"::"IC Partner";
                        end;
                    GenJnlLine."Account No." := Rec."Receiving Account";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine.Description := 'Inter-Bank Transfer Ref No:' + Format(Rec.No);
                    GenJnlLine."Shortcut Dimension 1 Code" := Rec."Receiving Depot Code";
                    GenJnlLine."Shortcut Dimension 2 Code" := Rec."Receiving Department Code";
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code1");
                    GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code1");
                    GenJnlLine."External Document No." := Rec."External Doc No.";
                    GenJnlLine.Description := Rec.Remarks;
                    if Rec.Remarks = '' then begin GenJnlLine.Description := 'Inter-Bank Transfer Ref No:' + Format(Rec.No); end;
                    GenJnlLine."Currency Code" := Rec."Currency Code Destination";
                    GenJnlLine.Validate(GenJnlLine."Currency Code");
                    if Rec."Currency Code Destination" <> '' then begin
                        GenJnlLine."Currency Factor" := Rec."Exch. Rate Destination";//"Reciprical 2";
                        GenJnlLine.Validate(GenJnlLine."Currency Factor");
                    end;
                    GenJnlLine.Amount := Rec."Amount 2";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Insert;


                    GenJnlLine.Init;
                    /*Insert the lines*/
                    GenJnlLine."Line No." := LineNo + 1;
                    GenJnlLine."Source Code" := 'PAYMENTJNL';
                    GenJnlLine."Journal Template Name" := Rec."Inter Bank Template Name";
                    GenJnlLine."Journal Batch Name" := Rec."Inter Bank Journal Batch";
                    GenJnlLine."Posting Date" := Rec."Transfer Release Date";
                    GenJnlLine."Document No." := Rec.No;
                    if Rec."Source Transfer Type" = Rec."Source Transfer Type"::"Intra-Company" then begin
                        GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
                    end
                    else
                        if Rec."Source Transfer Type" = Rec."Source Transfer Type"::"Inter-Company" then begin
                            GenJnlLine."Account Type" := GenJnlLine."Account Type"::"IC Partner";
                        end;


                    GenJnlLine."Account No." := Rec."Paying Account";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Shortcut Dimension 1 Code" := Rec."Source Depot Code";
                    GenJnlLine."Shortcut Dimension 2 Code" := Rec."Source Department Code";
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                    GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
                    GenJnlLine."External Document No." := Rec."External Doc No.";
                    GenJnlLine.Description := Rec.Remarks;
                    if Rec.Remarks = '' then begin GenJnlLine.Description := 'Inter-Bank Transfer Ref No:' + Format(Rec.No); end;
                    GenJnlLine."Currency Code" := Rec."Currency Code Source";
                    GenJnlLine.Validate(GenJnlLine."Currency Code");
                    if Rec."Currency Code Source" <> '' then begin
                        GenJnlLine."Currency Factor" := Rec."Exch. Rate Source";//"Reciprical 1";
                        GenJnlLine.Validate(GenJnlLine."Currency Factor");
                    end;
                    GenJnlLine.Amount := -Rec.Amount;
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Insert;
                    Post := false;
                    CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post Line", GenJnlLine);
                    Post := JournalPostedSuccessfully.PostedSuccessfully();

                    if Post then begin
                        Rec.Posted := true;
                        Rec."Date Posted" := Today;
                        Rec."Time Posted" := Time;
                        Rec."Posted By" := UserId;
                        Rec.Modify;
                        Message('The Journal Has Been Posted Successfully');
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
        }
    }

    trigger OnOpenPage()
    begin
        if UserMgt.GetPurchasesFilter() <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Reciept Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FilterGroup(0);
        end;
    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        TempBatch: Record "Cash Office User Template";
        JTemplate: Code[20];
        JBatch: Code[20];
        PCheck: Codeunit "Posting Check FP";
        Post: Boolean;
        BankAcc: Record "Bank Account";
        RegNo: Integer;
        FromNo: Integer;
        ToNo: Integer;
        RegMgt: Codeunit "Register Management";
        JournalPostedSuccessfully: Codeunit "Journal Post Successful";
        RespCenter: Record "Responsibility CenterBR";
        UserMgt: Codeunit "User Setup Management BR";
        [InDataSet]
        "Exch. Rate DestinationVisible": Boolean;
        [InDataSet]
        "Exch. Rate SourceVisible": Boolean;
        [InDataSet]
        DateEditable: Boolean;
        [InDataSet]
        ReceivingTransferTypeEditable: Boolean;
        [InDataSet]
        RecieptResponsibilityCenterEdi: Boolean;
        [InDataSet]
        "Receiving AccountEditable": Boolean;
        [InDataSet]
        "Amount 2Editable": Boolean;
        [InDataSet]
        RemarksEditable: Boolean;
        [InDataSet]
        "Exch. Rate DestinationEditable": Boolean;
        [InDataSet]
        "Source Transfer TypeEditable": Boolean;
        [InDataSet]
        SendingResponsibilityCenterEdi: Boolean;
        [InDataSet]
        "Paying AccountEditable": Boolean;
        [InDataSet]
        AmountEditable: Boolean;
        [InDataSet]
        "Exch. Rate SourceEditable": Boolean;
        [InDataSet]
        "External Doc No.Editable": Boolean;
        [InDataSet]
        "Transfer Release DateEditable": Boolean;
        "NOT OpenApprovalEntriesExist": Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";

    //[Scope('Internal')]
    procedure GetDimensionName(var "Code": Code[20]; DimNo: Integer) Name: Text[60]
    var
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
        Text000: Label 'Are you sure you want to Cancel this Document?';
        Text001: Label 'You have selected not to Cancel this Document';
    begin
        /*Get the global dimension 1 and 2 from the database*/
        Name := '';

        GLSetup.Reset;
        GLSetup.Get();

        DimVal.Reset;
        DimVal.SetRange(DimVal.Code, Code);

        if DimNo = 1 then begin
            DimVal.SetRange(DimVal."Dimension Code", GLSetup."Global Dimension 1 Code");
        end
        else
            if DimNo = 2 then begin
                DimVal.SetRange(DimVal."Dimension Code", GLSetup."Global Dimension 2 Code");
            end;
        if DimVal.Find('-') then begin
            Name := DimVal.Name;
        end;

    end;

    //[Scope('Internal')]
    procedure UpdateControl()
    begin
        if Rec.Status <> Rec.Status::Pending then begin
            DateEditable := false;
            ReceivingTransferTypeEditable := false;
            RecieptResponsibilityCenterEdi := false;
            "Receiving AccountEditable" := false;
            "Amount 2Editable" := false;
            RemarksEditable := false;
            "Exch. Rate DestinationEditable" := false;

        end else begin
            DateEditable := true;
            ReceivingTransferTypeEditable := true;
            RecieptResponsibilityCenterEdi := true;
            "Receiving AccountEditable" := true;
            "Amount 2Editable" := true;
            RemarksEditable := true;
            "Exch. Rate DestinationEditable" := true;


        end;

        if Rec.Status = Rec.Status::Approved then begin
            "Source Transfer TypeEditable" := true;
            SendingResponsibilityCenterEdi := true;
            "Paying AccountEditable" := true;
            AmountEditable := true;
            "Paying AccountEditable" := true;
            "Exch. Rate SourceEditable" := true;
            "External Doc No.Editable" := true;
            "Transfer Release DateEditable" := true;
        end else begin
            "Source Transfer TypeEditable" := false;
            SendingResponsibilityCenterEdi := false;
            AmountEditable := false;
            "Paying AccountEditable" := false;
            "Exch. Rate SourceEditable" := false;
            "External Doc No.Editable" := false;
            "Transfer Release DateEditable" := false;
        end;
    end;

    local procedure ReceivingAccountOnAfterValidat()
    begin
        //check if the currency code field has been filled in
        "Exch. Rate DestinationVisible" := false;
        if Rec."Currency Code Destination" <> '' then begin
            "Exch. Rate DestinationVisible" := true;
        end;
    end;

    local procedure PayingAccountOnAfterValidate()
    begin
        //check if the currency code field has been filled in
        "Exch. Rate SourceVisible" := false;
        if Rec."Currency Code Source" <> '' then begin
            "Exch. Rate SourceVisible" := true;
        end;
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        if Rec."Currency Code Source" <> '' then begin
            "Exch. Rate SourceVisible" := true;
        end
        else begin
            "Exch. Rate SourceVisible" := false;
        end;

        if Rec."Currency Code Destination" <> '' then begin
            "Exch. Rate DestinationVisible" := true;
        end
        else begin
            "Exch. Rate DestinationVisible" := false;
        end;

        UpdateControl;
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

