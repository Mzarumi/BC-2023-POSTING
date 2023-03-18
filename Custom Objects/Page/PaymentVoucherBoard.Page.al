page 52186299 "Payment Voucher Board"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Payments Header Board";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Transaction No."; Rec."Transaction No.")
                {
                    Editable = false;
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    Editable = false;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                    Editable = false;
                }
                field("Allocated Amount"; Rec."Allocated Amount")
                {
                }
                field("User ID"; Rec."User ID")
                {
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    Editable = false;
                }
                field("File Location"; Rec."File Location")
                {
                    Visible = false;
                }
                field(Remarks; Rec.Remarks)
                {
                }
            }
            part(Control1000000013; "Payment Sub Form Board")
            {
                SubPageLink = "Document No" = FIELD("Transaction No.");
            }
        }
        area(factboxes)
        {
            part(Control17; "Payment Line FactBox")
            {
                Provider = Control1000000013;
                SubPageLink = No = FIELD("Document No");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Post Payment")
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    /*
                    Rec.TestField("Pay Mode");
                    IF "Pay Mode" = "Pay Mode"::Cheque THEN
                      Rec.TestField("Cheque No.");
                    */
                    if Rec.Posted then
                        Error('This payment is already posted');
                    if Rec.Status <> Rec.Status::Approved then
                        Error('Document must be approved');

                    UserSetup.Get(Rec."User ID");

                    if Rec."Transaction Date" <> Today then begin
                        Rec."Transaction Date" := Today;
                        Rec.Modify;
                    end;
                    /*
                    TillNo:='';
                    TellerTill.RESET;
                    TellerTill.SETRANGE(TellerTill."Account Type",TellerTill."Account Type"::Cashier);
                    TellerTill.SETRANGE(TellerTill."Cashier ID",USERID);
                    IF TellerTill.FIND('-') THEN BEGIN
                    TillNo:=TellerTill."No.";
                    TellerTill.CALCFIELDS(TellerTill.Balance);
                    
                    CurrentTellerAmount:=TellerTill.Balance;
                    
                    IF CurrentTellerAmount-Amount<=TellerTill."Min. Balance" THEN
                    MESSAGE('You need to add more money from the treasury since your balance has gone below the teller replenishing level.');
                    
                    IF (CurrentTellerAmount - Amount) < 0 THEN
                    ERROR('You do not have enough money to carry out this transaction.');
                    
                    IF CurrentTellerAmount - Amount>=TellerTill."Maximum Teller Withholding" THEN
                    MESSAGE('You need to transfer money back to the treasury since your balance has gone above the teller maximum withholding.');
                    
                    END ELSE BEGIN
                    IF CurrentTellerAmount + Amount>=TellerTill."Maximum Teller Withholding" THEN
                    MESSAGE('You need to transfer money back to the treasury since your balance has gone above the teller maximum withholding.');
                    END;
                    
                    
                    
                    IF TillNo = '' THEN
                    ERROR('Teller account not set-up.');
                    */
                    //Check Teller Balances

                    CashOfficeUserTemplate.Get(Rec."User ID");
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", CashOfficeUserTemplate."Payment Journal Template");
                    GenJournalLine.SetRange("Journal Batch Name", CashOfficeUserTemplate."Payment Journal Batch");
                    GenJournalLine.DeleteAll;

                    //add members to batch
                    BatchMembers(Rec."Transaction Code");
                    //The break down
                    BOSAPAY.Reset;
                    BOSAPAY.SetRange(BOSAPAY."Document No", Rec."Transaction No.");
                    if BOSAPAY.Find('-') then begin
                        repeat

                            if UserSetup."Global Dimension 1 Code" <> '' then
                                if BOSAPAY."Shortcut Dimension 1 Code" <> UserSetup."Global Dimension 1 Code" then
                                    Error('User %1 can only process from Center %2', Rec."User ID", UserSetup."Global Dimension 1 Code");
                            if UserSetup."Global Dimension 2 Code" <> '' then
                                if BOSAPAY."Shortcut Dimension 2 Code" <> UserSetup."Global Dimension 2 Code" then
                                    Error('User %1 can only process from Center %2', Rec."User ID", UserSetup."Global Dimension 2 Code");
                            /*
                            ReceiptsandPaymentTypes.GET(BOSAPAY."Payment Types",ReceiptsandPaymentTypes.Type::Payment);
                            IF NOT TariffCodes.GET(ReceiptsandPaymentTypes."Withholding Tax Code") THEN ERROR('Please specify W/Tax code for %1',BOSAPAY."Payment Types");
                            Payee:=0;
                            Payee:=ROUND((BOSAPAY.Amount)* TariffCodes.Percentage/100);//3/10);

                            //MESSAGE('cHECKING');
                            GenJournalLine.INIT;
                            GenJournalLine."Journal Template Name":=CashOfficeUserTemplate."Payment Journal Template";
                            GenJournalLine."Journal Batch Name":=CashOfficeUserTemplate."Payment Journal Batch";
                            GenJournalLine."Line No.":=GenJournalLine."Line No."+1000;
                            GenJournalLine."Document No.":="Transaction No.";
                            GenJournalLine."Posting Date":="Transaction Date";
                            GenJournalLine."Account Type":=GenJournalLine."Account Type"::Savings;
                            GenJournalLine."Account No.":=BOSAPAY."Savings Account";
                            GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                            GenJournalLine.Description:=BOSAPAY.Description;
                            GenJournalLine."External Document No.":=BOSAPAY."External DOC No";
                            GenJournalLine.Amount:=(BOSAPAY.Amount-Payee)*-1;
                            //GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::"G/L Account";
                            //GenJournalLine."Bal. Account No.":=BOSAPAY."G/L Account No.";
                            //GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code":=BOSAPAY."Shortcut Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code":=BOSAPAY."Shortcut Dimension 2 Code";
                            GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                            IF GenJournalLine.Amount<>0 THEN
                            GenJournalLine.INSERT;
                            */

                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := CashOfficeUserTemplate."Payment Journal Template";
                            GenJournalLine."Journal Batch Name" := CashOfficeUserTemplate."Payment Journal Batch";
                            GenJournalLine."Line No." := GenJournalLine."Line No." + 1000;
                            GenJournalLine."Document No." := Rec."Transaction No.";
                            GenJournalLine."Posting Date" := Rec."Transaction Date";
                            GenJournalLine."Account Type" := GenJournalLine."Account Type"::"G/L Account";
                            GenJournalLine."Account No." := BOSAPAY."G/L Account No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine.Description := CopyStr(BOSAPAY."Member Name" + ' ' + BOSAPAY.Description, 1, 50);
                            GenJournalLine."External Document No." := BOSAPAY."External DOC No";
                            GenJournalLine.Amount := BOSAPAY.Amount;
                            GenJournalLine."Bal. Account Type" := GenJournalLine."Bal. Account Type"::"G/L Account";
                            //GenJournalLine."Bal. Account No.":=BOSAPAY."G/L Account No.";
                            //GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := BOSAPAY."Shortcut Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := BOSAPAY."Shortcut Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;



                            //Withholding Tax

                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := CashOfficeUserTemplate."Payment Journal Template";
                            GenJournalLine."Journal Batch Name" := CashOfficeUserTemplate."Payment Journal Batch";
                            GenJournalLine."Line No." := GenJournalLine."Line No." + 1000;
                            GenJournalLine."Document No." := Rec."Transaction No.";
                            GenJournalLine."Posting Date" := Rec."Transaction Date";
                            if ReceiptsandPaymentTypes.Get(BOSAPAY."Payment Types", ReceiptsandPaymentTypes.Type::Payment) then begin
                                if TariffCodes.Get(ReceiptsandPaymentTypes."Withholding Tax Code") then
                                    if TariffCodes."Account No." = '' then Error('Specify the Account for tariff code %1', TariffCodes.Code);
                            end;
                            GenJournalLine."Account Type" := TariffCodes."Account Type";
                            GenJournalLine."Account No." := TariffCodes."Account No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine.Description := CopyStr('Withholding Tax' + ' ' + BOSAPAY.Description, 1, 50);
                            GenJournalLine."External Document No." := BOSAPAY."External DOC No";
                            GenJournalLine.Amount := BOSAPAY."W/Tax Amount" * -1;//Payee*-1;
                                                                                 //GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::"G/L Account";
                                                                                 //GenJournalLine."Bal. Account No.":=BOSAPAY."G/L Account No.";
                                                                                 //GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := BOSAPAY."Shortcut Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := BOSAPAY."Shortcut Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;


                        //Withholding Tax

                        until BOSAPAY.Next = 0;
                    end;

                    //Post New
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", CashOfficeUserTemplate."Payment Journal Template");
                    GenJournalLine.SetRange("Journal Batch Name", CashOfficeUserTemplate."Payment Journal Batch");
                    if GenJournalLine.Find('-') then begin
                        CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post", GenJournalLine);
                    end;

                    Post := false;
                    Post := JournlPosted.PostedSuccessfully();
                    if Post then begin
                        //Post New
                        Rec."Posted By" := UserId;
                        Rec.Posted := true;
                        Rec.Modify;

                        Message('Transactions Succesfully Posted');
                    end

                end;
            }
            action("Print/Preview")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin

                    Rec.Reset;
                    Rec.SetFilter("Transaction No.", Rec."Transaction No.");
                    //REPORT.Run(52185723, true, true, Rec);
                    Rec.Reset;
                end;
            }
            action(Import_Payment_Line)
            {
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    BosaPaymentH.Reset;
                    BosaPaymentH.SetRange(BosaPaymentH."Transaction No.", Rec."Transaction No.");
                    if BosaPaymentH.Find('-') then begin
                        BOSAPAY.Reset;
                        BOSAPAY.SetRange(BOSAPAY."Document No", BosaPaymentH."Transaction No.");
                        XMLPORT.Run(52185502);
                    end;
                end;
            }
            action("Send Board/Staff SMS")
            {
                Caption = 'Send Board SMS';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Account: Record "Savings Accounts";
                    Text0001: Label 'Dear Member, Your allowance has been credited to your FOSA Account. Harambee Sacco';
                begin
                    PayLine.Reset;
                    PayLine.SetRange(PayLine."Document No", Rec."Transaction No.");
                    if PayLine.Find('-') then begin
                        repeat
                            if PayLine."SMS Sent" = false then begin
                                if Account.Get(PayLine."Savings Account") then begin
                                    SendSms.SendSms(SourceType::Delegate, Account."Transactional Mobile No", Text0001
                                    , Account."No.", Account."No.", false);
                                end;
                                PayLine."SMS Sent" := true;
                                PayLine.Modify;
                            end;
                        until PayLine.Next = 0;
                    end;
                    Message('Notification successfully sent');
                end;
            }
            separator(Action14)
            {
            }
            action("Check Budgetary Availability")
            {
                Caption = 'Check Budgetary Availability';
                Image = Balance;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    BCSetup: Record "Budgetary Control Setup";
                begin
                    if not (Rec.Status = Rec.Status::Pending) then begin
                        Error('Document must be Pending/Open');
                    end;

                    BCSetup.Get;
                    if not BCSetup.Mandatory then
                        exit;

                    if not AllFieldsEntered then
                        Error('Some of the Key Fields on the Lines:[ACCOUNT NO.,AMOUNT] Have not been Entered please RECHECK your entries');
                    //First Check whether other lines are already committed.
                    Commitments.Reset;
                    Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::"Payment Voucher");
                    Commitments.SetRange(Commitments."Document No.", Rec."Transaction No.");
                    if Commitments.Find('-') then begin
                        if Confirm('Lines in this Document appear to be committed do you want to re-commit?', false) = false then begin exit end;
                        Commitments.Reset;
                        Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::"Payment Voucher");
                        Commitments.SetRange(Commitments."Document No.", Rec."Transaction No.");
                        Commitments.DeleteAll;
                    end;

                    //here//CheckBudgetAvail.CheckPVBoard(Rec);
                end;
            }
            action("Cancel Budget Commitment")
            {
                Caption = 'Cancel Budget Commitment';
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if not (Rec.Status = Rec.Status::Pending) then begin
                        Error('Document must be Pending/Open');
                    end;

                    if Confirm('Do you Wish to Cancel the Commitment entries for this document', false) = false then begin exit end;

                    Commitments.Reset;
                    Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::"Payment Voucher");
                    Commitments.SetRange(Commitments."Document No.", Rec."Transaction No.");
                    Commitments.DeleteAll;

                    PayLine.Reset;
                    PayLine.SetRange(PayLine."Document No", Rec."Transaction No.");
                    if PayLine.Find('-') then begin
                        repeat
                            PayLine.Committed := false;
                            PayLine.Modify;
                        until PayLine.Next = 0;
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
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Remarks);
                        if not LinesExists then
                            Error('There are no Lines created for this Document');

                        if not AllFieldsEntered then
                            Error('Some of the Key Fields on the Lines:[ACCOUNT NO.,AMOUNT] Have not been Entered please RECHECK your entries');

                        //Ensure No Items That should be committed that are not
                        if LinesCommitmentStatus then
                            Error('There are some lines that have not been committed');

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
    end;

    trigger OnClosePage()
    begin
        SetControlAppearance;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        SetControlAppearance;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Posted = true then begin
            CurrPage.Editable := false;
        end;
    end;

    var
        Approval: Record "Signatory Application";
        ApprovalUsers: Record "Next of KIN";
        DActivity: Code[10];
        dbranch: Code[10];
        UsersID: Record User;
        TillNo: Code[20];
        TellerTill: Record "Bank Account";
        CurrentTellerAmount: Decimal;
        GenJournalLine: Record "Gen. Journal Line";
        BOSAPAY: Record "Payment Line Board";
        BosaPaymentH: Record "Payments Header Board";
        Payee: Decimal;
        TariffCodes: Record "Tariff Code s";
        ReceiptsandPaymentTypes: Record "Receipts and Payment Types";
        UserSetup: Record "User Setup";
        CashOfficeUserTemplate: Record "Cash Office User Template";
        "NOT OpenApprovalEntriesExist": Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        [InDataSet]
        StatusEditableApproved: Boolean;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        Commitments: Record Committment;
        CheckBudgetAvail: Codeunit "Budgetary Control";
        PayLine: Record "Payment Line Board";
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book",Internetbanking,CRM,"Member Withdrawal",Delegate;
        SendSms: Codeunit SendSms;
        RunBal: Decimal;
        Loans: Record Loans;
        Interest: Decimal;
        LineNo: Integer;
        LRepayment: Decimal;
        ProductType: Record "Product Factory";

    //[Scope('Internal')]
    procedure LinesExists(): Boolean
    var
        PayLines: Record "Payment Line Board";
    begin
        HasLines := false;
        PayLines.Reset;
        PayLines.SetRange(PayLines."Document No", Rec."Transaction No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;

    //[Scope('Internal')]
    procedure AllFieldsEntered(): Boolean
    var
        PayLines: Record "Payment Line Board";
    begin
        AllKeyFieldsEntered := true;
        PayLines.Reset;
        PayLines.SetRange(PayLines."Document No", Rec."Transaction No.");
        if PayLines.Find('-') then begin
            repeat
                if (PayLines."G/L Account No." = '') or (PayLines.Amount <= 0) then
                    AllKeyFieldsEntered := false;
            until PayLines.Next = 0;
            exit(AllKeyFieldsEntered);
        end;
    end;

    //[Scope('Internal')]
    procedure LinesCommitmentStatus() Exists: Boolean
    var
        BCSetup: Record "Budgetary Control Setup";
    begin
        if BCSetup.Get() then begin
            if not BCSetup.Mandatory then begin
                Exists := false;
                exit;
            end;
        end else begin
            Exists := false;
            exit;
        end;
        Exists := false;
        PayLine.Reset;
        PayLine.SetRange(PayLine."Document No", Rec."Transaction No.");
        PayLine.SetRange(PayLine.Committed, false);
        PayLine.SetRange(PayLine."Budgetary Control A/C", true);
        if PayLine.Find('-') then
            Exists := true;
    end;

    local procedure BatchMembers(TransactionCode: Code[30])
    var
        PaymentLineBoard: Record "Payment Line Board";
        PaymentLineTemp: Record "Payment Line Temp";
        i: Integer;
        TransactionCharges: Record "Transaction Charges";
        TCharges: Decimal;
        GeneralSetUp: Record "General Set-Up";
    begin
        PaymentLineTemp.DeleteAll;
        PaymentLineBoard.Reset;
        PaymentLineBoard.SetRange(PaymentLineBoard."Document No", Rec."Transaction No.");
        PaymentLineBoard.FindSet;
        repeat
            PaymentLineTemp.Init;
            PaymentLineTemp."Document No" := PaymentLineBoard."Document No";
            PaymentLineTemp."Member No" := PaymentLineBoard."Member No.";
            if not PaymentLineTemp.Insert then i += 1;
        until PaymentLineBoard.Next = 0;

        PaymentLineTemp.Reset;
        PaymentLineTemp.SetRange(PaymentLineTemp."Document No", Rec."Transaction No.");
        if PaymentLineTemp.FindSet then
            repeat
                PaymentLineBoard.Reset;
                PaymentLineBoard.SetRange(PaymentLineBoard."Document No", PaymentLineTemp."Document No");
                PaymentLineBoard.SetRange(PaymentLineBoard."Member No.", PaymentLineTemp."Member No");
                if PaymentLineBoard.FindSet then begin
                    PaymentLineBoard.CalcSums("Net Amount");
                    // MESSAGE('-');
                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := CashOfficeUserTemplate."Payment Journal Template";
                    GenJournalLine."Journal Batch Name" := CashOfficeUserTemplate."Payment Journal Batch";
                    GenJournalLine."Line No." := GenJournalLine."Line No." + 1000;
                    GenJournalLine."Document No." := Rec."Transaction No.";
                    GenJournalLine."Posting Date" := Rec."Transaction Date";
                    GenJournalLine."Account Type" := GenJournalLine."Account Type"::Employee;
                    GenJournalLine."Account No." := PaymentLineBoard."Savings Account";
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine.Description := Rec.Remarks;
                    GenJournalLine."External Document No." := BOSAPAY."External DOC No";
                    GenJournalLine.Amount := (PaymentLineBoard."Net Amount" * -1);
                    //GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::"G/L Account";
                    //GenJournalLine."Bal. Account No.":=BOSAPAY."G/L Account No.";
                    //GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                    GenJournalLine."Shortcut Dimension 1 Code" := PaymentLineBoard."Shortcut Dimension 1 Code";
                    GenJournalLine."Shortcut Dimension 2 Code" := PaymentLineBoard."Shortcut Dimension 2 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;

                    GeneralSetUp.Get;
                    Rec.TestField("Transaction Code");
                    TransactionCharges.Reset;
                    TransactionCharges.SetRange(TransactionCharges."Transaction Type", Rec."Transaction Code");
                    if TransactionCharges.Find('-') then begin


                        //Charges
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := CashOfficeUserTemplate."Payment Journal Template";
                        GenJournalLine."Journal Batch Name" := CashOfficeUserTemplate."Payment Journal Batch";
                        GenJournalLine."Line No." := GenJournalLine."Line No." + 1000;
                        GenJournalLine."Document No." := Rec."Transaction No.";
                        GenJournalLine."Posting Date" := Rec."Transaction Date";
                        GenJournalLine."Account Type" := GenJournalLine."Account Type"::Employee;
                        GenJournalLine."Account No." := PaymentLineBoard."Savings Account";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine.Description := TransactionCharges.Description;
                        GenJournalLine."External Document No." := BOSAPAY."External DOC No";
                        GenJournalLine.Amount := (TransactionCharges."Charge Amount");
                        GenJournalLine."Bal. Account Type" := GenJournalLine."Bal. Account Type"::"G/L Account";
                        GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Shortcut Dimension 1 Code" := PaymentLineBoard."Shortcut Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := PaymentLineBoard."Shortcut Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                        TCharges += GenJournalLine.Amount;

                        //Exices Duty
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := CashOfficeUserTemplate."Payment Journal Template";
                        GenJournalLine."Journal Batch Name" := CashOfficeUserTemplate."Payment Journal Batch";
                        GenJournalLine."Line No." := GenJournalLine."Line No." + 1000;
                        GenJournalLine."Document No." := Rec."Transaction No.";
                        GenJournalLine."Posting Date" := Rec."Transaction Date";
                        GenJournalLine."Account Type" := GenJournalLine."Account Type"::Employee;
                        GenJournalLine."Account No." := PaymentLineBoard."Savings Account";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine.Description := TransactionCharges.Description + 'Exicse Duty';
                        GenJournalLine."External Document No." := BOSAPAY."External DOC No";
                        GenJournalLine.Amount := (TransactionCharges."Charge Amount" * (GeneralSetUp."Excise Duty (%)" / 100));
                        GenJournalLine."Bal. Account Type" := GenJournalLine."Bal. Account Type"::"G/L Account";
                        GenJournalLine."Bal. Account No." := GeneralSetUp."Excise Duty G/L";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Shortcut Dimension 1 Code" := PaymentLineBoard."Shortcut Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := PaymentLineBoard."Shortcut Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                        TCharges += GenJournalLine.Amount;

                    end;
                    RunBal := PaymentLineBoard.Amount - TCharges;
                    //Loan Recovery
                    Loans.Reset;
                    Loans.SetRange(Loans."Member No.", PaymentLineBoard."Member No.");
                    //Loans.SETRANGE(Loans."Disbursement Date",0D,TODAY);
                    Loans.SetRange(Loans."Recovery Mode", Loans."Recovery Mode"::"Board Allowance");
                    if Loans.Find('-') then begin
                        repeat
                            //ERROR('here');
                            if RunBal > 0 then begin
                                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", Loans."Outstanding Bills");
                                if Loans."Outstanding Bills" >= 0 then begin
                                    if Loans."Outstanding Interest" > 0 then begin
                                        Interest := 0;
                                        //Interest:=Loans."Outstanding Interest";
                                        if Loans."Interest Calculation Method" = Loans."Interest Calculation Method"::"Straight Line" then
                                            Interest := (Loans."Approved Amount" * (Loans.Interest / 1200))
                                        else
                                            Interest := (Loans."Outstanding Balance" * (Loans.Interest / 1200));//Loans."Outstanding Interest";
                                                                                                                //ERROR('Interest %1 Loan No %2',Interest,Loans."Loan No.");

                                        if Interest > Loans."Outstanding Interest" then
                                            Interest := Loans."Outstanding Interest"
                                        else
                                            if (Interest <= 0) and (Loans."Outstanding Balance" = 0) then begin
                                                if Loans.Repayment > Loans."Outstanding Interest" then
                                                    Interest := Loans."Outstanding Interest"
                                                else
                                                    Interest := Loans.Repayment;
                                            end;

                                        if Interest > 0 then begin
                                            LineNo := LineNo + 10000;
                                            GenJournalLine.Init;
                                            GenJournalLine."Journal Template Name" := CashOfficeUserTemplate."Payment Journal Template";
                                            GenJournalLine."Journal Batch Name" := CashOfficeUserTemplate."Payment Journal Batch";
                                            GenJournalLine."Line No." := LineNo;
                                            //here//GenJournalLine."Account Type" := GenJournalLine."Account Type"::"7";
                                            GenJournalLine."Account No." := Loans."Loan Account";
                                            GenJournalLine.Validate(GenJournalLine."Account No.");
                                            GenJournalLine."Document No." := CopyStr(Rec."Transaction No.", 1, 14);
                                            GenJournalLine."Posting Date" := Rec."Transaction Date";
                                            GenJournalLine.Description := 'Interest Paid';
                                            if RunBal > Interest then
                                                GenJournalLine.Amount := Interest * -1
                                            else
                                                GenJournalLine.Amount := RunBal * -1;
                                            GenJournalLine.Validate(GenJournalLine.Amount);
                                            GenJournalLine."Transaction Type" := GenJournalLine."Transaction Type"::"Interest Paid";
                                            GenJournalLine."Loan No" := Loans."Loan No.";
                                            GenJournalLine."Shortcut Dimension 1 Code" := PaymentLineBoard."Shortcut Dimension 1 Code";
                                            GenJournalLine."Shortcut Dimension 2 Code" := PaymentLineBoard."Shortcut Dimension 2 Code";
                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                            if GenJournalLine.Amount <> 0 then
                                                GenJournalLine.Insert;

                                            LineNo := LineNo + 10000;
                                            GenJournalLine.Init;
                                            GenJournalLine."Journal Template Name" := CashOfficeUserTemplate."Payment Journal Template";
                                            GenJournalLine."Journal Batch Name" := CashOfficeUserTemplate."Payment Journal Batch";
                                            GenJournalLine."Line No." := LineNo;
                                            GenJournalLine."Account Type" := GenJournalLine."Account Type"::Employee;
                                            GenJournalLine."Account No." := PaymentLineBoard."Savings Account";
                                            GenJournalLine.Validate(GenJournalLine."Account No.");
                                            GenJournalLine."Document No." := CopyStr(Rec."Transaction No.", 1, 14);
                                            GenJournalLine."Posting Date" := Rec."Transaction Date";
                                            GenJournalLine.Description := PadStr('Interest Paid  - ' + Loans."Loan Product Type Name", 50);
                                            if RunBal > Interest then
                                                GenJournalLine.Amount := Interest
                                            else
                                                GenJournalLine.Amount := RunBal;
                                            GenJournalLine.Validate(GenJournalLine.Amount);
                                            GenJournalLine."Loan No" := Loans."Loan No.";
                                            GenJournalLine."Shortcut Dimension 1 Code" := PaymentLineBoard."Shortcut Dimension 1 Code";
                                            GenJournalLine."Shortcut Dimension 2 Code" := PaymentLineBoard."Shortcut Dimension 2 Code";
                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                            if GenJournalLine.Amount <> 0 then
                                                GenJournalLine.Insert;
                                            RunBal := RunBal - Abs(GenJournalLine.Amount);
                                        end;
                                    end;
                                end;


                                if RunBal > 0 then begin
                                    if Loans."Outstanding Balance" > 0 then begin

                                        LRepayment := 0;
                                        LRepayment := Loans."Outstanding Bills" - Interest;

                                        if Loans.Interest = 0 then begin
                                            LRepayment := Loans."Outstanding Bills";/*Loans.Repayment;*/
                                        end else
                                            LRepayment := Loans."Outstanding Bills"/*Loans.Repayment-Interest*/;

                                        if LRepayment > 0 then begin
                                            if LRepayment > Loans."Outstanding Balance" then
                                                LRepayment := Loans."Outstanding Balance";

                                            LineNo := LineNo + 10000;
                                            GenJournalLine.Init;
                                            GenJournalLine."Journal Template Name" := CashOfficeUserTemplate."Payment Journal Template";
                                            GenJournalLine."Journal Batch Name" := CashOfficeUserTemplate."Payment Journal Batch";
                                            GenJournalLine."Line No." := LineNo;
                                            //here//GenJournalLine."Account Type" := GenJournalLine."Account Type"::"7";
                                            GenJournalLine."Account No." := Loans."Loan Account";
                                            GenJournalLine.Validate(GenJournalLine."Account No.");
                                            GenJournalLine."Document No." := CopyStr(Rec."Transaction No.", 1, 14);
                                            GenJournalLine."Posting Date" := Rec."Transaction Date";
                                            GenJournalLine.Description := 'Loan Repayment';
                                            if RunBal > LRepayment then
                                                GenJournalLine.Amount := LRepayment * -1
                                            else
                                                GenJournalLine.Amount := RunBal * -1;
                                            GenJournalLine.Validate(GenJournalLine.Amount);
                                            GenJournalLine."Transaction Type" := GenJournalLine."Transaction Type"::Repayment;
                                            GenJournalLine."Loan No" := Loans."Loan No.";
                                            GenJournalLine."Shortcut Dimension 1 Code" := PaymentLineBoard."Shortcut Dimension 1 Code";
                                            GenJournalLine."Shortcut Dimension 2 Code" := PaymentLineBoard."Shortcut Dimension 2 Code";
                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                            if GenJournalLine.Amount <> 0 then
                                                GenJournalLine.Insert;


                                            if ProductType.Get(Loans."Loan Product Type") then begin

                                                //post bill entry
                                                LineNo := LineNo + 10000;
                                                GenJournalLine.Init;
                                                GenJournalLine."Journal Template Name" := CashOfficeUserTemplate."Payment Journal Template";
                                                GenJournalLine."Journal Batch Name" := CashOfficeUserTemplate."Payment Journal Batch";
                                                GenJournalLine."Line No." := LineNo;
                                                //here//GenJournalLine."Account Type" := GenJournalLine."Account Type"::"7";
                                                GenJournalLine."Account No." := Loans."Loan Account";
                                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                                GenJournalLine."Document No." := CopyStr(Rec."Transaction No.", 1, 14);
                                                GenJournalLine."Posting Date" := Rec."Transaction Date";
                                                GenJournalLine.Description := 'Bill Repayment';
                                                if RunBal > LRepayment then
                                                    GenJournalLine.Amount := LRepayment * -1
                                                else
                                                    GenJournalLine.Amount := RunBal * -1;
                                                GenJournalLine.Validate(GenJournalLine.Amount);
                                                GenJournalLine."Transaction Type" := GenJournalLine."Transaction Type"::Bills;
                                                GenJournalLine."Loan No" := Loans."Loan No.";
                                                GenJournalLine."Bal. Account Type" := GenJournalLine."Bal. Account Type"::"G/L Account";
                                                GenJournalLine."Bal. Account No." := ProductType."Billed Account";
                                                GenJournalLine."Shortcut Dimension 1 Code" := PaymentLineBoard."Shortcut Dimension 1 Code";
                                                GenJournalLine."Shortcut Dimension 2 Code" := PaymentLineBoard."Shortcut Dimension 2 Code";
                                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                                if GenJournalLine.Amount <> 0 then
                                                    GenJournalLine.Insert;
                                                //post bill entry


                                            end;




                                            LineNo := LineNo + 10000;
                                            GenJournalLine.Init;
                                            GenJournalLine."Journal Template Name" := CashOfficeUserTemplate."Payment Journal Template";
                                            GenJournalLine."Journal Batch Name" := CashOfficeUserTemplate."Payment Journal Batch";
                                            GenJournalLine."Line No." := LineNo;
                                            GenJournalLine."Account Type" := GenJournalLine."Account Type"::Employee;
                                            GenJournalLine."Account No." := PaymentLineBoard."Savings Account";
                                            GenJournalLine.Validate(GenJournalLine."Account No.");
                                            GenJournalLine."Document No." := CopyStr(Rec."Transaction No.", 1, 14);
                                            GenJournalLine."Posting Date" := Rec."Transaction Date";
                                            GenJournalLine.Description := PadStr('Loan Repayment - ' + Loans."Loan Product Type Name", 50);
                                            if RunBal > LRepayment then
                                                GenJournalLine.Amount := LRepayment
                                            else
                                                GenJournalLine.Amount := RunBal;
                                            GenJournalLine.Validate(GenJournalLine.Amount);
                                            GenJournalLine."Loan No" := Loans."Loan No.";
                                            GenJournalLine."Shortcut Dimension 1 Code" := PaymentLineBoard."Shortcut Dimension 1 Code";
                                            GenJournalLine."Shortcut Dimension 2 Code" := PaymentLineBoard."Shortcut Dimension 2 Code";
                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                            if GenJournalLine.Amount <> 0 then
                                                GenJournalLine.Insert;
                                            RunBal := RunBal - GenJournalLine.Amount;
                                            //ERROR('Interst %1',Interest);
                                        end;
                                    end;
                                end;// Bill is >=0
                            end;
                        until Loans.Next = 0;
                    end;
                end;
            until PaymentLineTemp.Next = 0;





        /*
        ReceiptsandPaymentTypes.GET(BOSAPAY."Payment Types",ReceiptsandPaymentTypes.Type::Payment);
        IF NOT TariffCodes.GET(ReceiptsandPaymentTypes."Withholding Tax Code") THEN ERROR('Please specify W/Tax code for %1',BOSAPAY."Payment Types");
        Payee:=0;
        Payee:=ROUND((BOSAPAY.Amount)* TariffCodes.Percentage/100);//3/10);
        */

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

