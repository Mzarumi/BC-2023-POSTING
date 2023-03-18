page 52186305 "Payment Voucher Staff"
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
                field("Transaction Time"; Rec."Transaction Time")
                {
                    Editable = false;
                }
                field("Gross Amount"; Rec."Gross Amount")
                {
                }
                field("WTax Amount"; Rec."WTax Amount")
                {
                }
                field("Net Amount"; Rec."Net Amount")
                {
                }
                field("User ID"; Rec."User ID")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
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
                field("Transaction Code"; Rec."Transaction Code")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
            }
            part(Control1000000013; "Payment Sub Form Staff")
            {
                SubPageLink = "Document No" = FIELD("Transaction No.");
            }
        }
        area(factboxes)
        {
            part(Control18; "Payment Line FactBox")
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


                    CashOfficeUserTemplate.Get(UserId);
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
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := CashOfficeUserTemplate."Payment Journal Template";
                            GenJournalLine."Journal Batch Name" := CashOfficeUserTemplate."Payment Journal Batch";
                            GenJournalLine."Line No." := GenJournalLine."Line No." + 1000;
                            GenJournalLine."Document No." := Rec."Transaction No.";
                            GenJournalLine."Posting Date" := Rec."Transaction Date";
                            GenJournalLine."Account Type" := GenJournalLine."Account Type"::"G/L Account";
                            GenJournalLine."Account No." := BOSAPAY."G/L Account No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine.Description := CopyStr(Rec.Remarks, 1, 50);
                            GenJournalLine."External Document No." := BOSAPAY."External DOC No";
                            GenJournalLine.Amount := BOSAPAY.Amount;
                            GenJournalLine."Bal. Account Type" := GenJournalLine."Bal. Account Type"::"G/L Account";
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
                            GenJournalLine."Account Type" := GenJournalLine."Account Type"::"G/L Account";
                            GenJournalLine."Account No." := BOSAPAY."Tax Account";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine.Description := CopyStr('Withholding Tax' + ' ' + Rec.Remarks, 1, 50);
                            GenJournalLine."External Document No." := BOSAPAY."External DOC No";
                            GenJournalLine.Amount := BOSAPAY."W/Tax Amount" * -1;//Payee*-1;
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
                    //REPORT.Run(52185908, true, true, Rec);
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
                        XMLPORT.Run(52185621);
                    end;
                end;
            }
            action("Send Board/Staff SMS")
            {
                Caption = 'Send Staff SMS';
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
                            //Confirm If member exists in buffer table
                            SmsSPVBuffer.Reset;
                            SmsSPVBuffer.SetRange("Member No", PayLine."Member No.");
                            if not SmsSPVBuffer.FindFirst then begin
                                //Confirm If member exists in buffer table
                                if PayLine."SMS Sent" = false then begin
                                    if Account.Get(PayLine."Savings Account") then begin
                                        SendSms.SendSms(SourceType::Delegate, Account."Transactional Mobile No", Text0001
                                        , Account."No.", Account."No.", false);
                                        //Insert Into Buffer Table
                                        SmsSPVBuffer.Init;
                                        SmsSPVBuffer."Member No" := PayLine."Member No.";
                                        SmsSPVBuffer.Insert;
                                        //Insert Into Buffer Table

                                    end;
                                    PayLine."SMS Sent" := true;
                                    PayLine.Modify;
                                end;
                            end;
                        until PayLine.Next = 0;
                    end;
                    SmsSPVBuffer.Reset;
                    SmsSPVBuffer.DeleteAll;
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
                        if not LinesExists then
                            Error('There are no Lines created for this Document');

                        if not AllFieldsEntered then
                            Error('Some of the Key Fields on the Lines:[ACCOUNT NO.,AMOUNT] Have not been Entered please RECHECK your entries');

                        //Ensure No Items That should be committed that are not
                        if LinesCommitmentStatus then
                            Error('There are some lines that have not been committed');
                        Rec.TestField(Remarks);
                        Rec.TestField("Transaction Code");
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."Payment Type"::Staff;
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
        BOSAPAY: Record "Payment Line Staff";
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
        PayLine: Record "Payment Line Staff";
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";
        SendSms: Codeunit SendSms;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book",Internetbanking,CRM,"Member Withdrawal",Delegate;
        GeneralSetUp: Record "General Set-Up";
        TransactionCharges: Record "Transaction Charges";
        TCharges: Decimal;
        PaymentLineTemp: Record "Payment Line Temp";
        RunBal: Decimal;
        SmsSPVBuffer: Record "Sms SPV Buffer";

    //[Scope('Internal')]
    procedure LinesExists(): Boolean
    var
        PayLines: Record "Payment Line Staff";
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
        PayLines: Record "Payment Line Staff";
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

    //[Scope('Internal')]
    procedure fnUpdateP9Table(P9EmployeeCode: Code[20]; P9Allowances: Decimal; P9GrossPay: Decimal; P9TaxablePay: Decimal; P9TaxCharged: Decimal; P9Paye: Decimal; P9NetPay: Decimal; dtCurrPeriod: Date; PVNo: Code[20]; AllowanceCode: Code[20])
    var
        StaffAllowanceP9: Record "Staff Allowance P9";
        intYear: Integer;
        intMonth: Integer;
        P9BasicPay: Decimal;
        P9Benefits: Decimal;
        P9ValueOfQuarters: Decimal;
        P9DefinedContribution: Decimal;
        P9OwnerOccupierInterest: Decimal;
        P9InsuranceRelief: Decimal;
        P9TaxRelief: Decimal;
        P9NSSF: Decimal;
        P9NHIF: Decimal;
        P9Deductions: Decimal;
    begin
        intMonth := Date2DMY(dtCurrPeriod, 2);
        intYear := Date2DMY(dtCurrPeriod, 3);

        StaffAllowanceP9.Reset;
        with StaffAllowanceP9 do begin
            Init;
            "Employee Code" := P9EmployeeCode;
            "Basic Pay" := P9BasicPay;
            Allowances := P9Allowances;
            Benefits := P9Benefits;
            "Value Of Quarters" := P9ValueOfQuarters;
            "Defined Contribution" := P9DefinedContribution;
            "Owner Occupier Interest" := P9OwnerOccupierInterest;
            "Gross Pay" := P9GrossPay;
            "Taxable Pay" := P9TaxablePay;
            "Tax Charged" := P9TaxCharged;
            "Insurance Relief" := P9InsuranceRelief;
            "Tax Relief" := P9TaxRelief;
            PAYE := P9Paye;
            NSSF := P9NSSF;
            NHIF := P9NHIF;
            Deductions := P9Deductions;
            "Net Pay" := P9NetPay;
            "Period Month" := intMonth;
            "Period Year" := intYear;
            "Payroll Period" := dtCurrPeriod;
            "PV No." := PVNo;
            "Allowance Code" := AllowanceCode;
            Insert;
        end;
    end;

    local procedure BatchMembers(TransactionCode: Code[30])
    var
        PaymentLineBoard: Record "Payment Line Staff";
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
                    PaymentLineBoard.CalcSums(Amount, "W/Tax Amount", "Net Amount");
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
                    GenJournalLine.Amount := (PaymentLineBoard.Amount * -1);
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Shortcut Dimension 1 Code" := PaymentLineBoard."Shortcut Dimension 1 Code";
                    GenJournalLine."Shortcut Dimension 2 Code" := PaymentLineBoard."Shortcut Dimension 2 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;

                    if PaymentLineBoard."W/Tax Amount" > 0 then begin
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := CashOfficeUserTemplate."Payment Journal Template";
                        GenJournalLine."Journal Batch Name" := CashOfficeUserTemplate."Payment Journal Batch";
                        GenJournalLine."Line No." := GenJournalLine."Line No." + 1000;
                        GenJournalLine."Document No." := Rec."Transaction No.";
                        GenJournalLine."Posting Date" := Rec."Transaction Date";
                        GenJournalLine."Account Type" := GenJournalLine."Account Type"::Employee;
                        GenJournalLine."Account No." := PaymentLineBoard."Savings Account";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine.Description := CopyStr('WIthholding Tax-' + Rec.Remarks, 1, 50);
                        GenJournalLine."External Document No." := BOSAPAY."External DOC No";
                        GenJournalLine.Amount := (PaymentLineBoard."W/Tax Amount");
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Bal. Account Type" := GenJournalLine."Bal. Account Type"::"G/L Account";
                        //GenJournalLine."Bal. Account No.":=PaymentLineBoard."Tax Account";
                        //GenJournalLine.VALIDATE(GenJournalLine."Bal. Account No.");
                        GenJournalLine."Shortcut Dimension 1 Code" := PaymentLineBoard."Shortcut Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := PaymentLineBoard."Shortcut Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;
                    end;
                    fnUpdateP9Table(PaymentLineBoard."Member No.", PaymentLineBoard.Amount, PaymentLineBoard.Amount, PaymentLineBoard.Amount,
                    PaymentLineBoard."W/Tax Amount", PaymentLineBoard."W/Tax Amount", PaymentLineBoard."Net Amount", Rec."Transaction Date", Rec."Transaction No.", PaymentLineBoard."Payment Types");

                end;

                GeneralSetUp.Get;
                Rec.TestField("Transaction Code");
                TransactionCharges.Reset;
                TransactionCharges.SetRange(TransactionCharges."Transaction Type", Rec."Transaction Code");
                if TransactionCharges.Find('-') then begin
                    if (PaymentLineBoard."Payment Types" <> 'ST_BRFAST') and (PaymentLineBoard."Payment Types" <> 'ST_LUNCH')
                     and (PaymentLineBoard."Payment Types" <> 'ST_SUPPER') then begin

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
                        GenJournalLine.Validate(GenJournalLine.Amount);
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
                        GenJournalLine.Validate(GenJournalLine.Amount);
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
                end;
                RunBal := PaymentLineBoard.Amount - TCharges;

            until PaymentLineTemp.Next = 0;
    end;
}

