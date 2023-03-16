page 52185428 "Mbanking Applications"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "M-SACCO Applications";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    Editable = false;
                }
                field("Application Type"; Rec."Application Type")
                {
                }
                field("Application No"; Rec."Application No")
                {
                }
                field("Document Serial No"; Rec."Document Serial No")
                {
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    Editable = true;
                    Enabled = false;
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Customer ID No"; Rec."Customer ID No")
                {
                    Editable = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Editable = false;
                }
                field("MPESA Mobile No"; Rec."MPESA Mobile No")
                {
                    Editable = false;
                }
                field(Comments; Rec.Comments)
                {
                    Editable = false;
                }
                field("Date Entered"; Rec."Date Entered")
                {
                    Editable = false;
                }
                field("Time Entered"; Rec."Time Entered")
                {
                    Editable = false;
                }
                field("Entered By"; Rec."Entered By")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Withdrawal Limit Code"; Rec."Withdrawal Limit Code")
                {
                    Editable = WithLimit;
                }
                field("Withdrawal Limit Amount"; Rec."Withdrawal Limit Amount")
                {
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                }
            }
            field("Virtual Registration"; Rec."Virtual Registration")
            {
            }
            field("Sent To Server"; Rec."Sent To Server")
            {
                Editable = false;
            }
            part(Control1102755018; "MSACCO Applications Page Part")
            {
                Editable = true;
                SubPageLink = "Application No" = FIELD(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Function")
            {
                Caption = 'Function';
                action("Create MBanking Application")
                {
                    Image = Customer;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Rec."App Status" = Rec."App Status"::Approved then
                            Error('Application Already Processed');

                        if Rec.Status <> Rec.Status::Approved then
                            Error('This application has not yet been approved');


                        if Confirm('Are you sure you would like to Create the application?') = true then begin

                            if (StrLen(Rec."MPESA Mobile No") <> 13) or (CopyStr(Rec."MPESA Mobile No", 1, 4) <> '+254') then
                                Error('Invalid MPESA Mobile No.');

                            Account.Reset;
                            Account.SetRange("Transactional Mobile No", Rec."MPESA Mobile No");
                            if Account.Find('-') then begin
                                Error('Transactional Phone No. %1 already exists under Account No. %2', Rec."MPESA Mobile No", Account."No.");
                            end;


                            MPESAAppDetails.Reset;
                            MPESAAppDetails.SetRange(MPESAAppDetails."Application No", Rec.No);
                            MPESAAppDetails.SetRange(MPESAAppDetails."Account Type", MPESAAppDetails."Account Type"::Creditor);
                            if MPESAAppDetails.Find('-') then begin
                                repeat
                                    Account.Reset;
                                    Account.SetRange(Account."No.", MPESAAppDetails."Account No.");
                                    if Account.Find('-') then begin


                                        if SkyMbanking.CheckBlackList(Rec."MPESA Mobile No", Account."No.", Account.Name) then
                                            Error('This Member has been blacklisted');


                                        if Rec."Application Type" = Rec."Application Type"::Initial then begin //Application Type Initial

                                            if Account."Transactional Mobile No" <> Rec."MPESA Mobile No" then begin

                                                if Account."Transactional Mobile No" <> '' then begin
                                                    Error('The FOSA Account No. ' + Account."No." + ' has already been registered for M-Banking.');

                                                end else begin
                                                    Account."Transactional Mobile No" := Rec."MPESA Mobile No";
                                                    Account.Modify;


                                                    Auth.Reset;
                                                    Auth.SetRange("Account No.", Account."No.");
                                                    Auth.SetRange("Mobile No.", Account."Transactional Mobile No");
                                                    if Auth.FindFirst then begin
                                                        SkyMbanking.GenerateNewPin(CopyStr(Account."Transactional Mobile No", 2, 12));

                                                        Message('M-Banking activated for Member ' + Account.Name + '. The Customer will receive a confirmation SMS shortly.');

                                                    end
                                                    else begin
                                                        Auth.Init;
                                                        Auth."Mobile No." := Account."Transactional Mobile No";
                                                        Auth."Account No." := Account."No.";
                                                        Auth."User Status" := Auth."User Status"::Active;
                                                        if Auth.Insert then begin
                                                            SkyMbanking.GenerateNewPin(CopyStr(Account."Transactional Mobile No", 2, 12));

                                                            Message('M-Banking activated for Member ' + Account.Name + '. The Customer will receive a confirmation SMS shortly.');

                                                        end
                                                        else
                                                            Error('Not Processed. Try Creating');
                                                    end;


                                                end;
                                            end
                                            else begin
                                                Error('This telephone no does not Match');
                                            end;

                                        end
                                        else begin // Application Type is change

                                            Account."Transactional Mobile No" := Rec."MPESA Mobile No";
                                            Account.Modify;

                                            Auth.Reset;
                                            Auth.SetRange("Account No.", Account."No.");
                                            Auth.SetRange("Mobile No.", Account."Transactional Mobile No");
                                            if Auth.FindFirst then begin
                                                SkyMbanking.GenerateNewPin(CopyStr(Account."Transactional Mobile No", 2, 12));
                                            end
                                            else begin
                                                Auth.Init;
                                                Auth."Mobile No." := Account."Transactional Mobile No";
                                                Auth."Account No." := Account."No.";
                                                Auth."User Status" := Auth."User Status"::Active;
                                                Auth.Insert;
                                                SkyMbanking.GenerateNewPin(CopyStr(Account."Transactional Mobile No", 2, 12));
                                            end;


                                            Message('M-Banking transactional Mobile No changed for Customer ' + Account.Name + '.');

                                        end;
                                    end;
                                until MPESAAppDetails.Next = 0;
                            end;



                            Rec."App Status" := Rec."App Status"::Approved;
                            Rec."Date Approved" := Today;
                            Rec."Time Approved" := Time;
                            Rec."Approved By" := UserId;
                            Rec.Modify;
                        end;
                    end;
                }
                action("Delete Mbanking Application")
                {
                    Image = Customer;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Rec.Status <> Rec.Status::Approved then
                            Error('This application has not yet been approved');

                        if Confirm('Are you sure you would like to de-link the application?') = true then begin
                            //FOSA

                            Account.Reset;
                            Account.SetRange(Account."No.", Rec."Account No");
                            if Account.Find('-') then begin

                                //IF "Application Type"= "Application Type"::Initial THEN BEGIN //Application Type Initial

                                Auth.Reset;
                                Auth.SetRange("Mobile No.", Account."Transactional Mobile No");
                                if Auth.FindFirst then begin
                                    Auth.Delete;
                                end;

                                Auth.Reset;
                                Auth.SetRange("Account No.", Account."No.");
                                if Auth.FindFirst then begin
                                    Auth.DeleteAll;
                                end;

                                if Account."Transactional Mobile No" <> '' then begin
                                    Account."Transactional Mobile No" := '';
                                    Account.Modify;

                                    Message('M-SACCO de-activated for Customer ' + Account.Name + '.');

                                end else begin
                                    Error('The FOSA Account No. ' + Account."No." + ' has not been registered for M-SACCO.');
                                    exit;
                                end;

                                //END ELSE  BEGIN // Application Type is change

                                //Account."Transactional Mobile No":='';
                                //Account.MODIFY;

                                //MESSAGE('M-SACCO succesfully de-activated for Customer ' + Account.Name + '.');

                                //END;

                            end;
                        end;
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

                        if Rec.Status <> Rec.Status::Open then
                            Error(DocMustbeOpen);


                        Rec.TestField("Document Serial No");
                        Rec.TestField("Document Date");
                        Rec.TestField("Customer ID No");
                        Rec.TestField("Customer Name");
                        Rec.TestField("Responsibility Center");

                        if Rec."Application Type" = Rec."Application Type"::Initial then begin

                            Rec.TestField("MPESA Mobile No");
                            Rec.TestField("Withdrawal Limit Code");
                            Rec.TestField("Withdrawal Limit Amount");


                            StrTel := CopyStr(Rec."MPESA Mobile No", 1, 4);

                            if StrTel <> '+254' then begin
                                Error('The MPESA Mobile Phone No. should be in the format +254XXXYYYZZZ.');
                            end;

                            if StrLen(Rec."MPESA Mobile No") <> 13 then begin
                                Error('Invalid MPESA mobile phone number. Please enter the correct mobile phone number.');
                            end;

                            MPESAAppDetails.Reset;
                            MPESAAppDetails.SetRange(MPESAAppDetails."Application No", Rec.No);
                            if MPESAAppDetails.Find('-') then begin
                                //Check if Id number exists in this account
                                Account.Reset;
                                Account.SetRange(Account."ID No.", Rec."Customer ID No");
                                Account.SetRange(Account."No.", MPESAAppDetails."Account No.");
                                if Account.Find('-') then begin

                                    //Check if Id number exists in this account
                                    //Check if mpesa telephone number exist in this account

                                    Account.Reset;
                                    Account.SetRange(Account."Transactional Mobile No", Rec."MPESA Mobile No");
                                    Account.SetRange(Account."No.", MPESAAppDetails."Account No.");
                                    if Account.Find('-') then begin
                                        Error('Phone No ' + Rec."MPESA Mobile No" + ' already linked to account no ' + MPESAAppDetails."Account No.");
                                    end
                                    else begin

                                        VarVariant := Rec;
                                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant)
                                          then
                                            CustomApprovals.OnSendDocForApproval(VarVariant);
                                    end;

                                end
                                else begin

                                    Error('Id number ' + Rec."Customer ID No" + ' does not exist to account no ' + MPESAAppDetails."Account No.");

                                end;

                            end else begin

                                Error('Please select the account to link with the telepnone No.');
                            end;

                        end
                        else begin //Transaction Type Change

                            VarVariant := Rec;
                            if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant)
                              then
                                CustomApprovals.OnSendDocForApproval(VarVariant);
                        end;
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

                        if Rec.Status <> Rec.Status::Pending then
                            Error(DocMustbePending);

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
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance();
        UpdateControl();
        Rec."Document Date" := Today;
    end;

    var
        StrTel: Text[30];
        DocMustbeOpen: Label 'This application must be open';
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batches,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,"HRTransport Request",HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,ImprestSurrender,"MSacco Applications";
        Account: Record "Savings Accounts";
        Cust: Record "Savings Accounts";
        MPESAAppDetails: Record "M-SACCO Application Details";
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        Acct: Record "Savings Accounts";
        ATMCharges: Decimal;
        BankCharges: Decimal;
        GenBatches: Record "Gen. Journal Batch";
        GLPosting: Codeunit "Gen. Jnl.-Post Line";
        BankCode: Code[20];
        PDate: Date;
        RevFromDate: Date;
        MPESATRANS: Record Denominations;
        GenLedgerSetup: Record "General Ledger Setup";
        MPesaAccount: Code[50];
        MPesaCharges: Decimal;
        MPesaChargesAccount: Code[50];
        MPesaLiabilityAccount: Code[50];
        TotalCharges: Decimal;
        TariffHeader: Record "Salary Header";
        TariffDetails: Record "Banking User Template";
        Charges: Record "Dividend Simulation Header";
        TariffCharges: Decimal;
        DocSNo: Boolean;
        DocDate: Boolean;
        CustID: Boolean;
        CustName: Boolean;
        MpesaNo: Boolean;
        Comms: Boolean;
        WithLimit: Boolean;
        MpesaPagePart: Boolean;
        DocMustbePending: Label 'Application must be pending approval';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        MpesaApp: Record "M-SACCO Applications";
        SkyMbanking: Codeunit "Sky Mbanking";
        Auth: Record "Sky USSD Auth";

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


        if Rec.Status = Rec.Status::Open then begin

            DocSNo := true;
            DocDate := true;
            CustID := true;
            CustName := true;
            MpesaNo := true;
            Comms := true;
            WithLimit := true;

        end;


        if Rec.Status = Rec.Status::Pending then begin

            DocSNo := false;
            DocDate := false;
            CustID := false;
            CustName := false;
            MpesaNo := false;
            Comms := true;
            WithLimit := false;
        end;


        if Rec.Status = Rec.Status::Rejected then begin
            DocSNo := false;
            DocDate := false;
            CustID := false;
            CustName := false;
            MpesaNo := false;
            Comms := true;
            WithLimit := false;
        end;

        if Rec.Status = Rec.Status::Approved then begin
            DocSNo := false;
            DocDate := false;
            CustID := false;
            CustName := false;
            MpesaNo := false;
            Comms := true;
            WithLimit := false;

        end;
    end;
}

