page 52186348 "Banking Account Closure"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Banking Account Closure";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Reason For Account Closure"; Rec."Reason For Account Closure")
                {
                }
                field("Account Balance"; Rec."Account Balance")
                {
                }
                field("Closure Date"; Rec."Closure Date")
                {
                }
                field("User Id"; Rec."User Id")
                {
                }
                field(Closed; Rec.Closed)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
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
                        Rec.TestField("Closure Date");
                        Rec.TestField("Reason For Account Closure");
                        Rec.TestField("Account No");
                        Rec.TestField("Member No");

                        if Rec."Closure Date" <> Today then Error('Closure Date must be today');

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
                action(Reopen)
                {
                    Caption = 'Reopen';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Closed, false);
                        if not Confirm('Are you sure you want to reopen this document?') then
                            exit;
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify;
                    end;
                }
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
                action("Post Closure")
                {
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        RunPeriodicTrans: Codeunit "Sacco Transactions";
                        SinkFund: Record "SinkFund Report Information";
                        GenJnlLine: Record "Gen. Journal Line";
                        DefaultBatch: Record "Gen. Journal Batch";
                        CashierLinks: Record "Cash Office User Template";
                        LineNo: Integer;
                        Temp: Record "Cash Office User Template";
                        JTemplate: Code[10];
                        JBatch: Code[10];
                        Post: Boolean;
                        strText: Text[100];
                        CashOfficeSetup: Record "Cash Office Setup";
                        BankLed: Record "Cust. Ledger Entry";
                    begin
                        Rec.TestField(Closed, false);

                        Rec.TestField(Status, Rec.Status::Approved);

                        PostAccountClosure(Rec);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if (Rec.Status <> Rec.Status::Open) then CurrPage.Editable := false;
        if Rec.Closed = true then CurrPage.Editable := false;
    end;

    var
        "NOT OpenApprovalEntriesExist": Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        JournlPosted: Codeunit "Journal Post Successful";
        CashOfficeSetup: Record "Cash Office Setup";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        CashierLinks: Record "Cash Office User Template";
        LineNo: Integer;
        Temp: Record "Cash Office User Template";
        JTemplate: Code[10];
        JBatch: Code[10];
        PCheck: Codeunit "Posting Check FP";
        Post: Boolean;
        Members: Record Members;
        CompanyInformation: Record "Company Information";
        SendSMSS: Codeunit SendSms;
        SourceTypes: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        ApplicationDetailsEdit: Boolean;
        ApprovedEdit: Boolean;
        SavingsAccounts: Record "Savings Accounts";

    //[Scope('Internal')]
    procedure PostAccountClosure(Rec: Record "Banking Account Closure")
    var
        BankLed: Record "Savings Ledger Entry";
    begin
        BankLed.Reset;
        BankLed.SetRange("Document No.", Rec.No);
        BankLed.SetRange(BankLed."Posting Date", Rec."Closure Date");
        if BankLed.Find('-') then begin
            Rec.Closed := true;
            Rec.Modify;
            Message('Account Closed succesfully');
            exit;
        end;
        Temp.Get(UserId);

        JTemplate := Temp."Receipt Journal Template";
        JBatch := Temp."Receipt Journal Batch";

        if JTemplate = '' then begin
            Error('Ensure the Loans Template is set up in Banking User Setup');
        end;
        if JBatch = '' then begin
            Error('Ensure the Loans Batch is set up in Banking User Setup')
        end;


        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        GenJnlLine.DeleteAll;
        CashOfficeSetup.Get();


        LineNo := LineNo + 1000;
        GenJnlLine.Init;
        GenJnlLine."Journal Template Name" := JTemplate;
        GenJnlLine."Journal Batch Name" := JBatch;
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Posting Date" := Rec."Closure Date";
        GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
        GenJnlLine."Document No." := Rec.No;
        GenJnlLine."External Document No." := Rec.No + '-' + Rec."Member No";
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::Employee;
        GenJnlLine."Account No." := Rec."Account No";
        GenJnlLine.Validate(GenJnlLine."Account No.");
        GenJnlLine.Description := CopyStr('FOSA Account Closure: ' + Rec."Account No", 1, 50);
        //CALCFIELDS("Total Net Amount");
        GenJnlLine.Amount := Rec."Account Balance";
        GenJnlLine.Validate(GenJnlLine.Amount);
        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
        GenJnlLine."Bal. Account No." := '';
        GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
        GenJnlLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := Rec."Global Dimension 2 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");

        if GenJnlLine.Amount <> 0 then
            GenJnlLine.Insert;
        LineNo := LineNo + 1000;
        GenJnlLine.Init;
        GenJnlLine."Journal Template Name" := JTemplate;
        GenJnlLine."Journal Batch Name" := JBatch;
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Posting Date" := Today;
        GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
        GenJnlLine."Document No." := Rec.No;
        GenJnlLine."External Document No." := Rec.No + '-' + Rec."Member No";
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
        GenJnlLine."Account No." := CashOfficeSetup."Sundry Income for Account  Clo";
        GenJnlLine.Validate(GenJnlLine."Account No.");
        GenJnlLine.Description := CopyStr('FOSA Account Closure: ' + Rec."Account No", 1, 50);
        ;
        //CALCFIELDS("Total Net Amount");
        GenJnlLine.Amount := (Rec."Account Balance" * -1);
        GenJnlLine.Validate(GenJnlLine.Amount);
        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
        GenJnlLine."Bal. Account No." := '';//CashOfficeSetup."Insurance Claim Received";
        GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
        GenJnlLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := Rec."Global Dimension 2 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");

        if GenJnlLine.Amount <> 0 then
            GenJnlLine.Insert;

        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post", GenJnlLine);

        Post := false;
        Post := JournlPosted.PostedSuccessfully();
        if Post then begin
            Rec.Closed := true;
            Rec."Closed By" := UserId;
            Rec."Date Closed" := Today;
            Rec.Modify;
            if Members.Get(Rec."Member No") then begin

                CompanyInformation.Get();
                SendSMSS.SendSms(SourceTypes::"Account Status", Members."Mobile Phone No", 'Dear member, we have closed your account no. ' + Rec."Account No"
                   , Rec.No, Rec."Member No", true);

            end;
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange("No.", Rec."Account No");
            if SavingsAccounts.Find('-') then begin
                SavingsAccounts.Status := SavingsAccounts.Status::Closed;
                SavingsAccounts."Status Change Reason" := 'Account Closed on ' + Format(Today) + ' - Document No' + Rec.No;
                SavingsAccounts.Modify;
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

        if Rec.Status = Rec.Status::Open then
            CurrPage.Editable := true else
            CurrPage.Editable := false;


        case Rec.Status of
            Rec.Status::Open:
                begin
                    ApplicationDetailsEdit := true;
                    ApprovedEdit := true;
                end;

            Rec.Status::Approved:
                begin
                    ApprovedEdit := false;
                    ApplicationDetailsEdit := false;
                end;
            Rec.Status::Pending:
                begin
                    ApprovedEdit := false;
                    ApplicationDetailsEdit := false;
                end;
            Rec.Status::Rejected:
                begin
                    ApprovedEdit := false;
                    ApplicationDetailsEdit := false;
                end;
        end;
    end;
}

