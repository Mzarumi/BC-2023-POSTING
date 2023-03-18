page 52185794 "Cashier Transactions"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Cashier Transactions";
    SourceTableView = SORTING(No)
                      ORDER(Descending);

    layout
    {
        area(content)
        {
            group(Transactions)
            {
                Caption = 'Transactions';
                Editable = true;
                field(No; Rec.No)
                {
                }
                field("Account Type"; Rec."Account Type")
                {

                    trigger OnValidate()
                    begin

                        Rec."Account No" := '';
                        if Rec."Account Type" = Rec."Account Type"::Teller then
                            AccNo := false else
                            AccNo := true;
                    end;
                }
                field("Account No"; Rec."Account No")
                {

                    trigger OnValidate()
                    begin
                        if Rec.Type = Rec.Type::"Cash Withdrawal" then begin
                            if Members.Get(Rec."Member No.") then begin
                                if Members."Group Account" = false then begin
                                    ImageData.Reset;
                                    ImageData.SetRange(ImageData."Member No", Rec."Member No.");
                                    if ImageData.Find('-') then begin
                                        ImageData.CalcFields(ImageData.Picture, ImageData.Signature);
                                        if not ImageData.Picture.HasValue then
                                            Error('Kindly capture the member photo before proceeding');
                                        if not ImageData.Signature.HasValue then
                                            Error('Kindly Signature sample of the member before proceeding');
                                    end else
                                        Error('Kindly capture the member photo & Signature before proceeding');
                                end;
                            end;
                        end;

                        Rec."Transaction Type" := '';
                    end;
                }
                field(mNO; Rec."Member No.")
                {
                    Caption = 'Member No.';
                    Editable = false;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Editable = TransType;

                    trigger OnValidate()
                    begin
                        FChequeVisible := false;
                        BChequeVisible := false;
                        BReceiptVisible := false;
                        BOSAReceiptChequeVisible := false;
                        AllAmount := false;
                        DiscCH := false;
                        FLien := false;

                        if Rec.Type = Rec.Type::"Cheque Deposit" then begin
                            FChequeVisible := true;
                            DiscCH := true;
                        end;

                        if Rec.Type = Rec.Type::"Bankers Cheque" then
                            BChequeVisible := true;

                        if Rec.Type = Rec.Type::"Credit Receipt" then begin
                            BReceiptVisible := true;
                            AllAmount := true;
                        end;

                        if Rec.Type = Rec.Type::"Credit Cheque" then begin
                            FChequeVisible := true;
                            BOSAReceiptChequeVisible := true;
                            AllAmount := true;
                        end;

                        if Rec.Type = Rec.Type::Lien then begin
                            FLien := true;
                        end;
                    end;
                }
                field(Amount; Rec.Amount)
                {
                    Editable = Amont;

                    trigger OnValidate()
                    var
                        SkyMbanking: Codeunit "Sky Mbanking";
                    begin

                        Rec.TestField("Account No");
                        Rec.TestField("Transaction Type");
                        if (Rec."Transaction Type" = 'CASH WITHDRWAL') or (Rec."Transaction Type" = 'BANKERS CHEQUE') or (Rec."Transaction Type" = 'CASH WITHDRWAL') or (Rec."Transaction Type" = 'RTGS') or (Rec."Transaction Type" = 'STANDING ORDER') then
                            if Rec.Amount > (SkyMbanking.GetAccountBalance(Rec."Account No") + 240) then Error('This will result in overdrawing of members account');

                    end;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    Editable = Currr;
                }
                field(Type; Rec.Type)
                {
                    Editable = false;
                }
                field("Product Type"; Rec."Product Type")
                {
                    Editable = false;
                }
                field("Employer Code"; Rec."Employer Code")
                {
                    Editable = false;
                }
                field("Project Member"; Rec."Project Member")
                {
                    Editable = Rec."Account Type" = Rec."Account Type"::Teller;
                }
                field("Project Vendor"; Rec."Project Vendor")
                {
                    Editable = Rec."Account Type" = Rec."Account Type"::Teller;
                }
                field("Transaction Description"; Rec."Transaction Description")
                {
                    Editable = true;
                    Enabled = true;
                }
                group(BCheque)
                {
                    Caption = '.';
                    Visible = BChequeVisible;
                    field(Payee; Rec.Payee)
                    {
                    }
                    field("Post Dated"; Rec."Post Dated")
                    {
                    }
                    field("Bankers Cheque No"; Rec."Bankers Cheque No")
                    {
                        Caption = 'Bankers Cheque No';
                    }
                }
                group(BReceipt)
                {
                    Caption = '.';
                    Visible = BReceiptVisible;
                    field("Member No."; Rec."Member No.")
                    {
                        Editable = false;
                    }
                    field(Control49; Rec."Allocated Amount")
                    {
                    }
                }
                group("Lien Transaction")
                {
                    Caption = '.';
                    Visible = FLien;
                    field("Expiry Date"; Rec."Expected Maturity Date")
                    {
                        Editable = true;
                    }
                }
                group(FCheque)
                {
                    Caption = '.';
                    Visible = FChequeVisible;
                    field("Cheque Type"; Rec."Cheque Type")
                    {
                    }
                    field(BchequeNo; Rec."Cheque No")
                    {
                        Caption = ' Cheque No';
                    }
                    field("Bank Account"; Rec."Bank Account")
                    {
                        Caption = 'Bank';
                        Visible = true;
                    }
                    field("Cheque Issueing Bank"; Rec."Cheque Issueing Bank")
                    {
                    }
                    field("Cheque Date"; Rec."Cheque Date")
                    {
                    }
                    field("Cheque Status"; Rec."Cheque Status")
                    {
                        Editable = false;
                    }
                    field("Expected Maturity Date"; Rec."Expected Maturity Date")
                    {
                        Editable = false;
                    }
                    group(BOSAReceiptCheque)
                    {
                        Caption = '.';
                        Visible = BOSAReceiptChequeVisible;
                    }
                }
                field("Account Name"; Rec."Account Name")
                {
                    Editable = false;
                }
                field("Book Balance"; Rec."Book Balance")
                {
                }
                field("Available Balance"; Rec."Available Balance")
                {
                    Caption = 'Available Balance';
                    Editable = false;
                }
                field("New Account Balance"; Rec."New Account Balance")
                {
                    Editable = false;
                }
                field("Deposited By"; Rec.Remarks)
                {
                    Editable = Remarrrks;
                }
                field("ID No"; Rec."ID No")
                {
                    Editable = false;
                }
                field(Cashier; Rec.Cashier)
                {
                }
                field("Till Name"; Rec."Till Name")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Signing Instructions"; Rec."Signing Instructions")
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
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                }
                field("Attempted Self Transaction"; Rec."Attempted Self Transaction")
                {
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            part("Approved Images"; "Member Picture & Signature")
            {
                Caption = 'Approved Images';
                SubPageLink = "Member No" = FIELD("Member No.");
            }
            systempart(Control13; Links)
            {
                Visible = false;
            }
            systempart(Control12; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Transaction)
            {
                Caption = 'Transaction';
                action(Statement)
                {
                    Image = Customer;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        Account.Reset;
                        Account.SetRange(Account."No.", Rec."Account No");
                        //if Account.Find('-') then
                        //REPORT.Run(52185631, true, false, Account)
                    end;
                }
                action("Account Page")
                {
                    Caption = 'Account Page';
                    Image = Vendor;
                    Promoted = true;
                    RunObject = Page "Savings Account Card";
                    RunPageLink = "No." = FIELD("Account No");
                }
                separator(Action15)
                {
                }
                action("Picture & Signature")
                {
                    Image = Picture;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        ImageData.Reset;
                        ImageData.SetRange(ImageData."Member No", Rec."Member No.");
                        if ImageData.Find('-') then begin
                            PAGE.Run(52185638, ImageData);
                        end;
                    end;
                }
                separator(Action9)
                {
                }
                action(Action8)
                {
                    Caption = 'Stop Cheque';
                    Image = Stop;
                    Promoted = true;
                    PromotedCategory = Process;
                }
                action("Allocated Amount")
                {
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Cashier Transaction Lines";
                    RunPageLink = "Transaction No" = FIELD(No);
                    Visible = AllAmount;
                }
                action(Signatories)
                {
                    Image = Signature;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Signatories List";
                    RunPageLink = "Account No" = FIELD("Member No.");
                }
            }
        }
        area(processing)
        {
            action("Post & Print")
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SaccoT: Codeunit "Sacco Transactions";
                begin

                    if Rec.Status = Rec.Status::"Pending Approval" then
                        Error('The transaction must be fully approved before proceeding');

                    //here//SaccoT.InitPost(Rec);




                    Commit;

                    Trans.Reset;
                    Trans.SetRange(Trans.No, Rec.No);
                    if Trans.Find('-') then begin

                        //     //if Type = Type::"Cash Withdrawal" then
                        //         //REPORT.Run(52185683, false, true, Trans)
                        //         else
                        //         if Type = Type::"Cash Deposit" then
                        //             //REPORT.Run(52185684, false, true, Trans)
                        //             else
                        //             if Type = Type::"Credit Receipt" then
                        //                 //REPORT.Run(52185689, false, true, Trans)
                        //                 else
                        //                 if Type = Type::"Cheque Deposit" then
                        //                     //REPORT.Run(52185685, false, true, Trans)
                        //                     else
                        //                     if Type = Type::"Credit Cheque" then
                        //                         //REPORT.Run(52185689, false, true, Trans)
                        //                         else
                        //                         if Type = Type::"Bankers Cheque" then
                        //                             //REPORT.Run(52185690, false, true, Trans)

                    end;

                    CurrPage.Close;
                end;
            }
            action("Reset Transaction Date")
            {
                Image = ChangeStatus;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = false;

                trigger OnAction()
                begin

                    Trans.Reset;
                    Trans.SetRange(Trans.Posted, false);
                    Trans.SetRange(Trans.No, Rec.No);
                    if Trans.Find('-') then begin

                        Rec."Transaction Date" := Today;
                        Rec."Transaction Time" := Time;
                        Rec.Modify;

                        Message('Transaction date updated');

                    end else
                        Error('Transaction already posted');
                end;
            }
            action("Reprint Slip")
            {
                Caption = 'Reprint Slip';
                Image = DepositSlip;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.TestField(Posted);
                    Trans.Reset;
                    Trans.SetRange(Trans.No, Rec.No);
                    if Trans.Find('-') then begin
                        Trans.Dublicate := true;
                        Trans.Modify;
                        Commit;
                    end;

                    Trans.Reset;
                    Trans.SetRange(Trans.No, Rec.No);
                    if Trans.Find('-') then begin

                        //     if Type = Type::"Cash Withdrawal" then
                        //         //REPORT.Run(52185683, false, true, Trans)
                        //         else
                        //         if Type = Type::"Cash Deposit" then
                        //             //REPORT.Run(52185684, false, true, Trans)
                        //             else
                        //             if Type = Type::"Credit Receipt" then
                        //                 //REPORT.Run(52185689, false, true, Trans)
                        //                 else
                        //                 if Type = Type::"Cheque Deposit" then
                        //                     //REPORT.Run(52185685, false, true, Trans)
                        //                     else
                        //                     if Type = Type::"Credit Cheque" then
                        //                         //REPORT.Run(52185689, false, true, Trans)
                        //                         else
                        //                         if Type = Type::"Bankers Cheque" then
                        //                             //REPORT.Run(52185690, false, true, Trans)

                    end;
                end;
            }
            action(Post)
            {
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    SaccoT: Codeunit "Sacco Transactions";
                begin
                    if Rec.Type = Rec.Type::"Cash Withdrawal" then begin
                        if Members.Get(Rec."Member No.") then begin
                            if Members."Group Account" = false then begin
                                ImageData.Reset;
                                ImageData.SetRange(ImageData."Member No", Rec."Member No.");
                                if ImageData.Find('-') then begin
                                    ImageData.CalcFields(ImageData.Picture, ImageData.Signature);
                                    if not ImageData.Picture.HasValue then
                                        Error('Kindly capture the member photo before proceeding');
                                    if not ImageData.Signature.HasValue then
                                        Error('Kindly Signature sample of the member before proceeding');
                                end else
                                    Error('Kindly capture the member photo & Signature before proceeding');
                            end;
                        end;
                    end;

                    if Rec.Status = Rec.Status::"Pending Approval" then
                        Error('The transaction must be fully approved before proceeding');

                    //Mark Transaction Posted...
                    BankAccountLedgerEntry.Reset;
                    BankAccountLedgerEntry.SetRange("Document No.", Rec.No);
                    if BankAccountLedgerEntry.FindFirst then begin
                        Rec.Posted := true;
                        Rec.Modify;
                    end;

                    if Rec.Posted = false then
                        //  SaccoT.InitPost(Rec);




                        CurrPage.Close;
                end;
            }
            action("Till Balance")
            {
                Image = Balance;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Page "Bank Account Card";
                RunPageLink = "No." = FIELD("Till Code");
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
                        if Rec.Amount <= 0 then Error('Amount must be greater than zero');

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
                action("Discount Cheque")
                {
                    Image = MakeAgreement;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = false;
                    RunObject = Page "Cheque Discounting";
                    RunPageLink = No = FIELD(No),
                                  Type = CONST("Cheque Deposit");
                    Visible = DiscCH;
                }
                action("Stop Cheque")
                {
                    Image = VoidCheck;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        SaccoT: Codeunit "Sacco Transactions";
                    begin

                        //SaccoT.StopCheque(Rec);
                    end;
                }
                action("Clear Lien")
                {
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin


                        if Rec.Type <> Rec.Type::Lien then
                            Error('Only applicable to Lien');

                        if Confirm('Are you sure you want to process the selected transactions?', false) = true then begin

                            Rec."Cheque Status" := Rec."Cheque Status"::Honoured;
                            Rec."Date Cleared" := Today;
                            Rec."Cleared By" := UserId;
                            Rec.Modify;

                            Message('Lien processed successfully');

                        end;
                    end;
                }
                action("Print Bankers Cheque")
                {
                    Image = PrintCheck;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        Err00001: Label 'Document must be posted ';
                    begin
                        if Rec.Posted = true then begin
                            Rec.Reset;
                            Rec.SetFilter(No, Rec.No);
                            //REPORT.Run(52185437, true, true, Rec);
                            Rec.Reset;
                            //END;
                        end else
                            Error(Err00001);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Trans.Get(Rec.No) then begin
            BankLedger.Reset;
            BankLedger.SetRange(BankLedger."Document No.", Trans.No);
            if BankLedger.Find('-') then begin
                if Trans.Posted = false then begin
                    Trans.Posted := true;
                    Trans."Date Posted" := Today;
                    Trans."Time Posted" := Time;
                    Trans."Posted By" := UserId;
                    Trans.Modify;

                    exit;
                end;
            end;
        end;
        FChequeVisible := false;
        BChequeVisible := false;
        BReceiptVisible := false;
        BOSAReceiptChequeVisible := false;
        AllAmount := false;
        DiscCH := false;
        FLien := false;

        if Rec.Type = Rec.Type::"Cheque Deposit" then begin
            FChequeVisible := true;
            DiscCH := true;
        end;

        if Rec.Type = Rec.Type::"Bankers Cheque" then
            BChequeVisible := true;

        if Rec.Type = Rec.Type::"Credit Receipt" then begin
            BReceiptVisible := true;
            AllAmount := true;
        end;

        if Rec.Type = Rec.Type::"Credit Cheque" then begin
            FChequeVisible := true;
            BOSAReceiptChequeVisible := true;
            AllAmount := true;
        end;

        if Rec.Type = Rec.Type::Lien then begin
            FLien := true;
        end;

        SetControlAppearance;
        UpdateControl;
    end;

    trigger OnInit()
    begin
        if (UserId <> 'HARAMBEESACCO\CMSANGI') and (UserId <> 'HARAMBEESACCO\KKAIMOR') then begin
            Temp.Get(UserId);

            Jtemplate := Temp."Cashier Journal Template";
            Jbatch := Temp."Cashier Journal Batch";
            TillNo := Temp."Default  Bank";
            MemberNo := Temp."Member No.";
            Excess := Temp."Excess Account";
            Shortage := Temp."Shortage Account";

            if Jtemplate = '' then begin
                Error(Text0001);
            end;
            if Jbatch = '' then begin
                Error(Text0002);
            end;

            if TillNo = '' then begin
                Error(Text0003);
            end;

            if MemberNo = '' then begin
                Error(Text0004);
            end;

            if Shortage = '' then begin
                Error(Text0005);
            end;

            if Excess = '' then begin
                Error(Text0006);
            end;
        end;
        UpdateControl;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Temp.Get(UserId);
        Trans.Reset;
        Trans.SetRange(Trans.Cashier, UserId);
        Trans.SetRange(Status, Trans.Status::Open);
        Trans.SetRange(Trans.Posted, false);
        if Trans.FindFirst then begin
            if Trans.Count >= Temp."No of Open Transactions" then begin
                Error('There are still some pending document(s) on your account. Please list & select the pending document to use.  ');
            end;
        end;
    end;

    trigger OnOpenPage()
    begin

        if Rec.Posted = true then
            CurrPage.Editable := false;

        if Rec."Account Type" = Rec."Account Type"::Teller then
            AccNo := false;
        if Trans.Get(Rec.No) then begin
            BankLedger.Reset;
            BankLedger.SetRange(BankLedger."Document No.", Trans.No);
            if BankLedger.Find('-') then begin
                if Trans.Posted = false then begin
                    Trans.Posted := true;
                    Trans."Date Posted" := Today;
                    Trans."Time Posted" := Time;
                    Trans."Posted By" := UserId;
                    Trans.Modify;

                    exit;
                end;
            end;
        end;
        if Rec."Account Type" = Rec."Account Type"::Teller then
            AccNo := false else
            AccNo := true;



        if Rec."Account Type" = Rec."Account Type"::Teller then
            AccNo := false else
            AccNo := true;
    end;

    var
        [InDataSet]
        FChequeVisible: Boolean;
        [InDataSet]
        BChequeVisible: Boolean;
        [InDataSet]
        BReceiptVisible: Boolean;
        [InDataSet]
        BOSAReceiptChequeVisible: Boolean;
        FLien: Boolean;
        Account: Record "Savings Accounts";
        UserSetup: Record "User Setup";
        DBranch: Code[20];
        DActivity: Code[20];
        Temp: Record "Banking User Template";
        Jtemplate: Code[20];
        Jbatch: Code[20];
        TillNo: Code[20];
        MemberNo: Code[20];
        Text0001: Label 'Ensure the Cashier journal Template is set up in Banking User Setup';
        Text0002: Label 'Ensure the Cashier journal Batch is set up in Banking User Setup';
        Text0003: Label 'Ensure the Default Bank is set up in Banking User Setup';
        Text0004: Label 'Ensure the Cashier Member no is set up in Banking User Setup';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        AccNo: Boolean;
        TransType: Boolean;
        Amont: Boolean;
        Remarrrks: Boolean;
        AllAmount: Boolean;
        Trans: Record "Cashier Transactions";
        Text0005: Label 'Ensure the Cashier Shortage Account is set up in Banking User Setup';
        Text0006: Label 'Ensure the Cashier Excess Account iis set up in Banking User Setup';
        Excess: Code[20];
        Shortage: Code[20];
        Currr: Boolean;
        ImageData: Record "Image Data";
        DiscCH: Boolean;
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        BankLedger: Record "Bank Account Ledger Entry";
        Members: Record Members;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    //[Scope('Internal')]
    procedure UpdateControl()
    begin
        if Rec.Status <> Rec.Status::"Pending Approval" then begin
            if Rec.Cashier <> '' then
                if UserId <> Rec.Cashier then Error('You are not allowed to edit a card you did not create');
        end;


        if Rec.Status = Rec.Status::Open then begin
            AccNo := true;
            TransType := true;
            Remarrrks := true;
            Amont := true;
            Currr := true;
        end;


        if Rec.Status = Rec.Status::"Pending Approval" then begin
            AccNo := false;
            TransType := false;
            Remarrrks := false;
            Amont := false;
            Currr := false;
        end;


        if Rec.Status = Rec.Status::Rejected then begin
            AccNo := false;
            TransType := false;
            Remarrrks := false;
            Amont := false;
            Currr := false;
        end;

        if Rec.Status = Rec.Status::Approved then begin
            AccNo := false;
            TransType := false;
            Remarrrks := false;
            Amont := false;
            Currr := false;

        end;
    end;
}

