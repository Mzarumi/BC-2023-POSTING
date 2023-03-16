#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52186456 "Sacco Transactions"
{

    trigger OnRun()
    begin
        ClearCheques;
        ClearOverDraft;
        ClearLien;
    end;

    var
        Temp: Record 52185782;
        Jtemplate: Code[10];
        JBatch: Code[10];
        LineNo: Integer;
        EntrNo: Integer;
        BalAccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        GenJLine: Record "Gen. Journal Line";
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";
        GenSetup: Record 52185689;
        STORegister: Record 52185719;
        SendSMS: Codeunit SendSms;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book";
        SavingsACC: Record 52185730;
        MobileNo: Code[20];
        AccTypes: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        AccNo: Code[20];
        ErrPosted: label 'This document has not been approved';
        MsgOnConfirmDialog: label 'Are you want to Post this Application?';
        AccountTypes: Record 52185690;
        // SMTPMail: Codeunit 400;
        // SMTPSetup: Record "SMTP Mail Setup";
        Loans: Record 52185729;
        Memb: Record 52185700;
        CTransLines: Record 52185796;
        ProductFactory: Record 52185690;
        SavingsLedgerEntry: Record 52185732;
        ProductType: Record 52185690;
        CompanyInformation: Record "Company Information";
        VendorAmount: Decimal;
        Posted: Boolean;
        SkyMbanking: Codeunit "Sky Mbanking";

    local procedure "*********Cashier Transactions********"()
    begin
    end;


    procedure InitPost(CashierTrans: Record 52185776)
    var
        Temp: Record 52185782;
        Jtemplate: Code[30];
        JBatch: Code[30];
        UserSetup: Record "User Setup";
        DBranch: Code[20];
        DActivity: Code[20];
        Tillno: Code[20];
        Text0001: label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
        Text0003: label 'Ensure the Default Bank is set up in User Setup';
        Text0004: label 'The transaction has already been posted.';
        Text0005: label 'Cannot post a Transaction being processed by %1';
        Text0006: label 'Please specify the Account No';
        Text0007: label 'Please specify an amount greater than zero.';
        Text0008: label 'Please select the transaction type.';
        CmemberNo: Code[20];
        Text0009: label 'Ensure the Cashier Member No is set up in Banking User Setup';
        Text0010: label 'You are not authorised to transact your own account';
        Text0011: label 'Ensure the Cashier Shortage Account is set up in Banking User Setup';
        Text0012: label 'Ensure the Cashier Excess Account is set up in Banking User Setup';
        Excess: Code[20];
        Shortage: Code[20];
        Text0013: label 'The Transaction date must be today, please reset to proceed';
    begin
        with CashierTrans do begin

            //Cyrus

            if Posted = true then
                Error(Text0004);

            if "Transaction Date" <> Today then
                Error(Text0013);

            Temp.Get(UserId);

            Jtemplate := Temp."Cashier Journal Template";
            JBatch := Temp."Cashier Journal Batch";
            Tillno := Temp."Default  Bank";
            CmemberNo := Temp."Member No.";
            Excess := Temp."Excess Account";
            Shortage := Temp."Shortage Account";

            if Jtemplate = '' then begin
                Error(Text0001);
            end;

            if JBatch = '' then begin
                Error(Text0002);
            end;

            if Tillno = '' then begin
                Error(Text0003);
            end;

            if CmemberNo = '' then begin
                Error(Text0009);
            end;

            if Shortage = '' then begin
                Error(Text0011);
            end;

            if Excess = '' then begin
                Error(Text0012);
            end;


            CheckTillCurrency(Tillno, "Currency Code");

            if CmemberNo = "Member No." then begin

                "Attempted Self Transaction" := true;

                Modify;

                Message(Text0010);

                exit;
            end;




            if Cashier <> UpperCase(UserId) then
                Error(Text0005, Cashier);

            UserSetup.Reset;
            UserSetup.SetRange(UserSetup."User ID", UpperCase(UserId));
            if UserSetup.Find('-') then begin
                UserSetup.TestField(UserSetup."Global Dimension 2 Code");
                UserSetup.TestField(UserSetup."Global Dimension 1 Code");
                DBranch := UserSetup."Global Dimension 2 Code";
                DActivity := UserSetup."Global Dimension 1 Code";
            end;


            if "Account No" = '' then
                Error(Text0006);

            if Amount <= 0 then
                Error(Text0007);

            if "Transaction Type" = '' then
                Error(Text0008);

            CalcFields("Allocated Amount");

            if Type = Type::"Credit Cheque" then begin

                TestField("Member No.");
                TestField("Cheque Type");
                TestField("Cheque No");
                TestField("Cheque Date");

                if (Amount < "Allocated Amount") or ("Allocated Amount" = 0) then
                    Error('Amount Allocated must be less than the amount');
                PostChequeDep(CashierTrans, Jtemplate, JBatch, DBranch, DActivity);
            end;

            if Type = Type::"Credit Receipt" then begin
                TestField("Member No.");

                if Amount <> "Allocated Amount" then
                    Error('Allocated amount must be equall to the transaction amount.');
            end;

            if Type = Type::"Cheque Deposit" then begin
                TestField("Cheque Type");
                TestField("Cheque No");
                TestField("Cheque Date");

                PostChequeDep(CashierTrans, Jtemplate, JBatch, DBranch, DActivity);

                exit;
            end;

            if Type = Type::"Bankers Cheque" then begin

                TestField("Bankers Cheque No");
                PostBankersCheq(CashierTrans, Jtemplate, JBatch, DBranch, DActivity);

                exit;
            end;

            //prevent withdrawal from dormant
            if Type = Type::"Cash Withdrawal" then begin
                if SavingsACC.Get("Account No") then begin
                    if SavingsACC.Status = SavingsACC.Status::Dormant then
                        Error('You cannot withdraw from a dormant account');
                end;
            end;
            //prevent withdrawal from dormant

            if (Type = Type::"Cash Deposit") or (Type = Type::"Cash Withdrawal") or (Type = Type::"Credit Receipt") then begin

                PostCashDepWith(CashierTrans, Jtemplate, JBatch, Tillno, DBranch, DActivity);


                exit;
            end;


            if (Type = Type::Lien) then begin

                PostLien(CashierTrans);


                exit;
            end;

        end;
    end;

    local procedure PostCashDepWith(CashierTrans: Record 52185776; JTemplate: Code[20]; JBatch: Code[20]; TillNo: Code[20]; DBranch: Code[20]; DActivity: Code[20])
    var
        GenSetup: Record 52185689;
        Acc: Record 52185730;
        BankSetup: Record 52185782;
        BankAccount: Record "Bank Account";
        CurrentTellerAmount: Decimal;
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        TCharges: Decimal;
        TransactionCharges: Record 52185774;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        TChargeAmount: Decimal;
        Account: Record 52185730;
        AccountTypes: Record 52185690;
        Text0001: label 'This account has been blocked from receiving payments.';
        Text0002: label 'You need to add more money from the treasury since your balance has gone below the teller replenishing level.';
        Text0003: label 'You do not have enough money to carry out this transaction.';
        Text0004: label 'You need to transfer money back to the treasury since your balance has gone above the teller maximum withholding.';
        Text0005: label 'You need to transfer money back to the treasury since your balance has gone above the teller maximum withholding.';
        Text0006: label 'You cannot withdraw more than your allowed limit of %1 unless authorised.';
        Text0007: label 'You cannot withdraw more than the available balance unless authorised.';
        Text0008: label 'You cannot deposit more than your allowed limit of %1 unless authorised.';
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        Trans: Record 52185776;
        ProdType: Record 52185690;
        TransType: Record 52185773;
        Text0009: label 'You have done a transaction of KSHS. ';
        Text0010: label ' of type ';
        Text0011: label ' on ';
        Text0012: label ' on your account ';
        Text0013: label ' at ';
        Text0014: label 'The limit for cashier ';
        Text0015: label ' of till ';
        Text0016: label ' has gone below the replenishing levels of ';
        Text0017: label ' has gone above the replenishing levels of ';
        Text0018: label 'Transaction Aborted';
        Employer: Record Customer;
    begin

        with CashierTrans do begin
            if CashierTrans."Account Type" = CashierTrans."account type"::Account then begin
                GenSetup.Get;
                // SMTPSetup.Get;

                if Type = Type::"Cash Deposit" then begin
                    Acc.Reset;
                    Acc.SetRange(Acc."Product Category", Acc."product category"::"Registration Fee");
                    Acc.SetRange(Acc."Member No.", "Member No.");
                    if Acc.Find('-') then begin
                        Acc.CalcFields(Acc."Balance (LCY)");
                        ProdType.Reset;
                        ProdType.SetRange(ProdType."Product Category", ProdType."product category"::"Registration Fee");
                        if ProdType.Find('-') then begin
                            if Acc."Balance (LCY)" < ProdType."Minimum Balance" then
                                Message('Kindly Note that the Member has not settled the registration fee');
                        end;
                    end;// ELSE
                        //ERROR('Member does not have a registration fee account please create one before proceeding');

                    if "Product Category" = "product category"::"Registration Fee" then begin
                        Acc.Reset;
                        Acc.SetRange(Acc."Product Category", Acc."product category"::"Registration Fee");
                        Acc.SetRange(Acc."Member No.", "Member No.");
                        if Acc.Find('-') then begin
                            Acc.CalcFields(Acc."Balance (LCY)");
                            ProdType.Reset;
                            ProdType.SetRange(ProdType."Product Category", ProdType."product category"::"Registration Fee");
                            if ProdType.Find('-') then begin
                                if Acc."Balance (LCY)" > (ProdType."Minimum Balance" + Amount) then
                                    Error('Kindly Note that this will lead to an overpayment in registration fee for this member');
                            end;
                        end;
                    end;


                end;





                if Type = Type::"Cash Withdrawal" then begin
                    if Acc.Get("Account No") then begin
                        if Acc.Blocked = Acc.Blocked::Debit then
                            Error(Text0001);
                    end;


                    if Status <> Status::Approved then begin
                        if "Available Balance" < Amount then begin
                            Message(Text0007);
                        //     area specific to stima sacco
                        //   Error(Text0018);


                            if Confirm('Do you want to send this transaction for approval?', false) = true then begin

                                VarVariant := CashierTrans;
                                if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                                    CustomApprovals.OnSendDocForApproval(VarVariant);
                            end;
                            exit;
                        end;
                    end;



                end;

                BankSetup.Get(UserId);

                BankAccount.Reset;
                BankAccount.SetRange(BankAccount."No.", TillNo);
                if BankAccount.Find('-') then begin
                    BankAccount.CalcFields(BankAccount.Balance);

                    CurrentTellerAmount := BankAccount.Balance;

                    if CurrentTellerAmount - Amount <= BankSetup."Min. Balance" then begin
                        Message(Text0002);
                        //send email

                        // SMTPSetup.TestField(SMTPSetup."Email Sender Name");
                        // SMTPSetup.TestField(SMTPSetup."Email Sender Address");
                        BankSetup.TestField(BankSetup."Supervisor E-Mail");

                        // SMTPMail.CreateMessage(SMTPSetup."Email Sender Name", SMTPSetup."Email Sender Address",/*'cyidah@coretec.co.ke'*/BankSetup."Supervisor E-Mail", 'NOTIFICATIONS', '', true);
                        // SMTPMail.AppendBody('************DO NOT REPLY*************');
                        // SMTPMail.AppendBody('<br><br>');
                        // SMTPMail.AppendBody('Dear Sir/Madam');
                        // SMTPMail.AppendBody('<br><br>');
                        // SMTPMail.AppendBody(Text0014 + UserId + Text0015 + BankSetup."Default  Bank" + Text0016 + Format(BankSetup."Min. Balance") + Text0011 + Format(Today) + ' ' + Format(Time));
                        // SMTPMail.AppendBody('<br><br>');
                        // SMTPMail.AppendBody('Thanks & Regards');
                        // SMTPMail.AppendBody('<br><br>');
                        // SMTPMail.AppendBody('*****************************.');
                        // SMTPMail.AppendBody('<br><br>');
                        // // SMTPMail.AppendBody(SMTPSetup."Email Sender Name");
                        // SMTPMail.AppendBody('<br><br>');
                        // SMTPMail.AppendBody('<HR>');
                        // SMTPMail.AppendBody('This is a system generated mail.');
                        //SMTPMail.Send;
                        //send email

                        //Commented coz stima do not want sms
                        //SendSMS.SendSms(SourceType::"Cashier Below Limit",BankSetup."Supervisor Mobile No",Text0014 +USERID+Text0015+BankSetup."Default  Bank"+Text0016+
                        //        FORMAT(BankSetup."Min. Balance")+Text0011+FORMAT(TODAY)+' '+FORMAT(TIME) ,BankSetup."Default  Bank",BankSetup."Default  Bank",FALSE);
                    end;
                    /*
                    IF Type =Type::"Cash Withdrawal" THEN BEGIN
                    IF (CurrentTellerAmount - Amount) < BankSetup."Min. Balance" THEN
                    ERROR(Text0003);
                    SendSMS.SendSms(SourceType::"Cashier Below Limit",BankSetup."Supervisor Mobile No",Text0014 +USERID+Text0015+BankSetup."Default  Bank"+Text0016+
                              FORMAT(BankSetup."Min. Balance")+Text0011+FORMAT(TODAY)+' '+FORMAT(TIME) ,BankSetup."Default  Bank",BankSetup."Default  Bank",FALSE);
                    END;
                    */
                    if Type = Type::"Cash Withdrawal" then begin
                        if CurrentTellerAmount - Amount >= BankSetup."Max. Cashier Withholding" then begin
                            Message(Text0004);
                            // SMTPSetup.TestField(SMTPSetup."Email Sender Name");
                            // SMTPSetup.TestField(SMTPSetup."Email Sender Address");
                            BankSetup.TestField(BankSetup."Supervisor E-Mail");

                            // SMTPMail.CreateMessage(SMTPSetup."Email Sender Name", SMTPSetup."Email Sender Address",/*'cyidah@coretec.co.ke'*/BankSetup."Supervisor E-Mail", 'NOTIFICATIONS', '', true);
                            // SMTPMail.AppendBody('************DO NOT REPLY*************');
                            // SMTPMail.AppendBody('<br><br>');
                            // SMTPMail.AppendBody('Dear Sir/Madam');
                            // SMTPMail.AppendBody('<br><br>');
                            // SMTPMail.AppendBody(Text0014 + UserId + Text0015 + BankSetup."Default  Bank" + Text0017 + Format(BankSetup."Max. Cashier Withholding") + Text0011 + Format(Today) + ' ' + Format(Time));
                            // SMTPMail.AppendBody('<br><br>');
                            // SMTPMail.AppendBody('Thanks & Regards');
                            // SMTPMail.AppendBody('<br><br>');
                            // SMTPMail.AppendBody('*****************************.');
                            // SMTPMail.AppendBody('<br><br>');
                            // // SMTPMail.AppendBody(SMTPSetup."Email Sender Name");
                            // SMTPMail.AppendBody('<br><br>');
                            // SMTPMail.AppendBody('<HR>');
                            // SMTPMail.AppendBody('This is a system generated mail.');
                            // SMTPMail.Send;
                        end;
                        //SendSMS.SendSms(SourceType::"Cashier Above Limit",BankSetup."Supervisor Mobile No",Text0014 +USERID+Text0015+BankSetup."Default  Bank"+Text0017+
                        //        FORMAT(BankSetup."Max. Cashier Withholding")+Text0011+FORMAT(TODAY)+' '+FORMAT(TIME) ,BankSetup."Default  Bank",BankSetup."Default  Bank",FALSE);
                    end else begin
                        if CurrentTellerAmount + Amount >= BankSetup."Max. Cashier Withholding" then begin
                            Message(Text0005);

                            // SMTPSetup.TestField(SMTPSetup."Email Sender Name");
                            // SMTPSetup.TestField(SMTPSetup."Email Sender Address");
                            BankSetup.TestField(BankSetup."Supervisor E-Mail");

                            // SMTPMail.CreateMessage(SMTPSetup."Email Sender Name", SMTPSetup."Email Sender Address",/*'cyidah@coretec.co.ke'*/BankSetup."Supervisor E-Mail", 'NOTIFICATIONS', '', true);
                            // SMTPMail.AppendBody('************DO NOT REPLY*************');
                            // SMTPMail.AppendBody('<br><br>');
                            // SMTPMail.AppendBody('Dear Sir/Madam');
                            // SMTPMail.AppendBody('<br><br>');
                            // SMTPMail.AppendBody(Text0014 + UserId + Text0015 + BankSetup."Default  Bank" + Text0017 + Format(BankSetup."Max. Cashier Withholding") + Text0011 + Format(Today) + ' ' + Format(Time));
                            // SMTPMail.AppendBody('<br><br>');
                            // SMTPMail.AppendBody('Thanks & Regards');
                            // SMTPMail.AppendBody('<br><br>');
                            // SMTPMail.AppendBody('*****************************.');
                            // SMTPMail.AppendBody('<br><br>');
                            // // SMTPMail.AppendBody(SMTPSetup."Email Sender Name");
                            // SMTPMail.AppendBody('<br><br>');
                            // SMTPMail.AppendBody('<HR>');
                            // SMTPMail.AppendBody('This is a system generated mail.');
                            //SMTPMail.Send;
                            //SendSMS.SendSms(SourceType::"Cashier Above Limit",BankSetup."Supervisor Mobile No",Text0014 +USERID+Text0015+BankSetup."Default  Bank"+Text0017+
                            //      FORMAT(BankSetup."Max. Cashier Withholding")+Text0011+FORMAT(TODAY)+' '+FORMAT(TIME) ,BankSetup."Default  Bank",BankSetup."Default  Bank",FALSE);
                        end;
                    end;


                    if Type = Type::"Cash Withdrawal" then begin
                        if Status <> Status::Approved then begin
                            if Amount > BankSetup."Max. Withdrawal Limit" then begin
                                Message(Text0006, BankSetup."Max. Withdrawal Limit");


                                if Confirm('Do you want to send this transaction for approval?', false) = true then begin
                                    VarVariant := CashierTrans;
                                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                                        CustomApprovals.OnSendDocForApproval(VarVariant);
                                end;
                                exit;
                            end;
                        end;
                    end;





                end;

                if Type = Type::"Cash Deposit" then begin

                    if Amount > BankSetup."Max. Deposit Limit" then begin
                        Message(Text0008, BankSetup."Max. Deposit Limit");

                        if Confirm('Do you want to send this transaction for approval?', false) = true then begin
                            VarVariant := CashierTrans;
                            if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                                CustomApprovals.OnSendDocForApproval(VarVariant);
                        end;
                        exit;
                    end;
                end;


                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", JTemplate);
                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                GenJournalLine.DeleteAll;

                LineNo := LineNo + 10000;

                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := JTemplate;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Document No." := No;
                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                GenJournalLine."Account No." := "Account No";
                GenJournalLine."External Document No." := "ID No";
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Posting Date" := "Transaction Date";
                GenJournalLine.Description := PadStr(Format(Type) + '-' + Remarks, 50);
                GenJournalLine."Currency Code" := "Currency Code";
                GenJournalLine.Validate(GenJournalLine."Currency Code");
                if (Type = Type::"Cash Deposit") then
                    GenJournalLine.Amount := -Amount
                else
                    GenJournalLine.Amount := Amount;
                if (Type = Type::"Credit Receipt") then
                    GenJournalLine.Amount := 0;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"Bank Account";
                GenJournalLine."Bal. Account No." := TillNo;
                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;//(TRUE);


                //Charges
                TCharges := 0;

                TransactionCharges.Reset;
                TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                if TransactionCharges.Find('-') then begin
                    repeat

                        if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::Normal) or
                        (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::"Stamp Duty") then begin

                            LineNo := LineNo + 10000;

                            ChargeAmount := 0;
                            if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                                ChargeAmount := (Amount * TransactionCharges."Percentage of Amount") * 0.01
                            else
                                ChargeAmount := TransactionCharges."Charge Amount";

                            if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin

                                TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                                TariffDetails.Reset;
                                TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                if TariffDetails.Find('-') then begin
                                    repeat
                                        if (Amount >= TariffDetails."Lower Limit") and (Amount <= TariffDetails."Upper Limit") then begin
                                            if TariffDetails."Use Percentage" = true then begin
                                                ChargeAmount := Amount * TariffDetails.Percentage * 0.01;
                                            end else begin
                                                ChargeAmount := TariffDetails."Charge Amount";
                                            end;
                                        end;
                                    until TariffDetails.Next = 0;
                                end;
                            end;




                            //Dont charge Transactional Charges
                            if SavingsACC.Get("Account No") then begin
                                if Employer.Get(SavingsACC."Employer Code") then begin
                                    if Employer."Dont Charge Transactions" then
                                        ChargeAmount := 0;
                                end;
                            end;
                            //Dont charge Transactional Charges

                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := JTemplate;
                            GenJournalLine."Journal Batch Name" := JBatch;
                            GenJournalLine."Document No." := No;
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := "Account No";
                            GenJournalLine."External Document No." := "ID No";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Posting Date" := "Transaction Date";
                            GenJournalLine.Description := TransactionCharges.Description;
                            GenJournalLine."Currency Code" := "Currency Code";
                            GenJournalLine.Validate(GenJournalLine."Currency Code");
                            GenJournalLine.Amount := ChargeAmount;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
                            GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                            GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;


                            //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                            if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
                              (TransactionCharges."Recover Excise Duty" = true) then begin


                                //Excise Duty

                                LineNo := LineNo + 10000;

                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := JTemplate;
                                GenJournalLine."Journal Batch Name" := JBatch;
                                GenJournalLine."Document No." := No;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := "Account No";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := "Transaction Date";
                                GenJournalLine.Description := 'Excise Duty';
                                GenJournalLine."Currency Code" := "Currency Code";
                                GenJournalLine.Validate(GenJournalLine."Currency Code");
                                GenJournalLine.Amount := (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                                GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                TChargeAmount := TChargeAmount + ChargeAmount;
                            end;
                        end;
                    until TransactionCharges.Next = 0;
                end;



                //Charge withdrawal Frequency
                if Type = Type::"Cash Withdrawal" then begin
                    if Account.Get("Account No") then begin
                        if AccountTypes.Get(Account."Product Type") then begin
                            if Account."Last Withdrawal Date" = 0D then begin
                                Account."Last Withdrawal Date" := Today;
                                Account.Modify;
                            end else begin
                                if CalcDate(AccountTypes."Withdrawal Interval", Account."Last Withdrawal Date") > Today then begin
                                    //IF CALCDATE(AccountTypes."Withdrawal Interval",Account."Last Withdrawal Date") <= CALCDATE('1D',TODAY) THEN BEGIN


                                    //Charges
                                    TCharges := 0;

                                    TransactionCharges.Reset;
                                    TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                                    if TransactionCharges.Find('-') then begin
                                        repeat

                                            if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::"Withdrawal Frequency") then begin

                                                LineNo := LineNo + 10000;

                                                ChargeAmount := 0;
                                                if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                                                    ChargeAmount := (Amount * TransactionCharges."Percentage of Amount") * 0.01
                                                else
                                                    ChargeAmount := TransactionCharges."Charge Amount";

                                                if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin

                                                    TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                                                    TariffDetails.Reset;
                                                    TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                                    if TariffDetails.Find('-') then begin
                                                        repeat
                                                            if (Amount >= TariffDetails."Lower Limit") and (Amount <= TariffDetails."Upper Limit") then begin
                                                                if TariffDetails."Use Percentage" = true then begin
                                                                    ChargeAmount := Amount * TariffDetails.Percentage * 0.01;
                                                                end else begin
                                                                    ChargeAmount := TariffDetails."Charge Amount";
                                                                end;
                                                            end;
                                                        until TariffDetails.Next = 0;
                                                    end;
                                                end;


                                                //Dont charge Transactional Charges
                                                if SavingsACC.Get("Account No") then begin
                                                    if Employer.Get(SavingsACC."Employer Code") then begin
                                                        if Employer."Dont Charge Transactions" then
                                                            ChargeAmount := 0;
                                                    end;
                                                end;
                                                //Dont charge Transactional Charges

                                                GenJournalLine.Init;
                                                GenJournalLine."Journal Template Name" := JTemplate;
                                                GenJournalLine."Journal Batch Name" := JBatch;
                                                GenJournalLine."Document No." := No;
                                                GenJournalLine."Line No." := LineNo;
                                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                                GenJournalLine."Account No." := "Account No";
                                                GenJournalLine."External Document No." := "ID No";
                                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                                GenJournalLine."Posting Date" := "Transaction Date";
                                                GenJournalLine.Description := TransactionCharges.Description;
                                                GenJournalLine."Currency Code" := "Currency Code";
                                                GenJournalLine.Validate(GenJournalLine."Currency Code");
                                                GenJournalLine.Amount := ChargeAmount;
                                                GenJournalLine.Validate(GenJournalLine.Amount);
                                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                                GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
                                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                                GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                                                GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                                if GenJournalLine.Amount <> 0 then
                                                    GenJournalLine.Insert;


                                                //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                                                if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
                                                  (TransactionCharges."Recover Excise Duty" = true) then begin

                                                    //Excise Duty

                                                    LineNo := LineNo + 10000;

                                                    GenJournalLine.Init;
                                                    GenJournalLine."Journal Template Name" := JTemplate;
                                                    GenJournalLine."Journal Batch Name" := JBatch;
                                                    GenJournalLine."Document No." := No;
                                                    GenJournalLine."Line No." := LineNo;
                                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                                    GenJournalLine."Account No." := "Account No";
                                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                                    GenJournalLine."Posting Date" := "Transaction Date";
                                                    GenJournalLine.Description := 'Excise Duty';
                                                    GenJournalLine."Currency Code" := "Currency Code";
                                                    GenJournalLine.Validate(GenJournalLine."Currency Code");
                                                    GenJournalLine.Amount := (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                                    GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
                                                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                                    GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                                                    GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                                    if GenJournalLine.Amount <> 0 then
                                                        GenJournalLine.Insert;

                                                    TChargeAmount := TChargeAmount + ChargeAmount;
                                                end;
                                            end;
                                        until TransactionCharges.Next = 0;
                                    end;

                                end;
                                Account."Last Withdrawal Date" := Today;
                                Account.Modify;

                            end;
                        end;
                    end;
                end;
                //Charge withdrawal Frequency



                //Penalty of maximum amount on transaction
                if Type = Type::"Cash Withdrawal" then begin
                    if TransType.Get("Transaction Type") then begin

                        Trans.Reset;
                        Trans.SetRange(Trans."Transaction Date", Today);
                        Trans.SetRange(Trans."Account No", "Account No");
                        Trans.SetRange(Posted, true);
                        Trans.SetRange(Trans.Type, Trans.Type::"Cash Withdrawal");
                        if Trans.FindSet then begin
                            Trans.CalcSums(Trans.Amount);


                        end;
                    end;

                    if Trans.Amount > TransType."Upper Limit" then begin


                        //Charges
                        TCharges := 0;

                        TransactionCharges.Reset;
                        TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                        if TransactionCharges.Find('-') then begin
                            repeat

                                if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::"Withdrawn Amount") then begin

                                    LineNo := LineNo + 10000;

                                    ChargeAmount := 0;
                                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                                        ChargeAmount := (Amount * TransactionCharges."Percentage of Amount") * 0.01
                                    else
                                        ChargeAmount := TransactionCharges."Charge Amount";

                                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin

                                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                                        TariffDetails.Reset;
                                        TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                        if TariffDetails.Find('-') then begin
                                            repeat
                                                if (Amount >= TariffDetails."Lower Limit") and (Amount <= TariffDetails."Upper Limit") then begin
                                                    if TariffDetails."Use Percentage" = true then begin
                                                        ChargeAmount := Amount * TariffDetails.Percentage * 0.01;
                                                    end else begin
                                                        ChargeAmount := TariffDetails."Charge Amount";
                                                    end;
                                                end;
                                            until TariffDetails.Next = 0;
                                        end;
                                    end;


                                    //Dont charge Transactional Charges
                                    if SavingsACC.Get("Account No") then begin
                                        if Employer.Get(SavingsACC."Employer Code") then begin
                                            if Employer."Dont Charge Transactions" then
                                                ChargeAmount := 0;
                                        end;
                                    end;
                                    //Dont charge Transactional Charges

                                    GenJournalLine.Init;
                                    GenJournalLine."Journal Template Name" := JTemplate;
                                    GenJournalLine."Journal Batch Name" := JBatch;
                                    GenJournalLine."Document No." := No;
                                    GenJournalLine."Line No." := LineNo;
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                    GenJournalLine."Account No." := "Account No";
                                    GenJournalLine."External Document No." := "ID No";
                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                    GenJournalLine."Posting Date" := "Transaction Date";
                                    GenJournalLine.Description := TransactionCharges.Description;
                                    GenJournalLine."Currency Code" := "Currency Code";
                                    GenJournalLine.Validate(GenJournalLine."Currency Code");
                                    GenJournalLine.Amount := ChargeAmount;
                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                    GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
                                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                    GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                                    GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                    if GenJournalLine.Amount <> 0 then
                                        GenJournalLine.Insert;


                                    //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                                    if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
                                      (TransactionCharges."Recover Excise Duty" = true) then begin

                                        //Excise Duty

                                        LineNo := LineNo + 10000;

                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := JTemplate;
                                        GenJournalLine."Journal Batch Name" := JBatch;
                                        GenJournalLine."Document No." := No;
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                        GenJournalLine."Account No." := "Account No";
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Posting Date" := "Transaction Date";
                                        GenJournalLine.Description := 'Excise Duty';
                                        GenJournalLine."Currency Code" := "Currency Code";
                                        GenJournalLine.Validate(GenJournalLine."Currency Code");
                                        GenJournalLine.Amount := (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                        GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
                                        GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                        GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                                        GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        TChargeAmount := TChargeAmount + ChargeAmount;
                                    end;
                                end;
                            until TransactionCharges.Next = 0;
                        end;
                    end;
                end;


                //Penalty of maximum amount on transaction

                if SavingsACC.Get("Account No") then begin
                    MobileNo := SavingsACC."Mobile Phone No";
                end;

                if Type = Type::"Cash Withdrawal" then
                    SendSMS.SendSms(Sourcetype::"Cash Withdrawal Confirm", MobileNo, Text0009 + Format(Amount) + Text0010 + Format(Type) + Text0011 +
                               Format(Today) + ' ' + Format(Time) + Text0012 + Text0013 + COMPANYNAME, "Account No", "Account No", false)
                else
                    SendSMS.SendSms(Sourcetype::"Deposit Confirmation", MobileNo, Text0009 + Format(Amount) + Text0010 + Format(Type) + Text0011 +
                               Format(Today) + ' ' + Format(Time) + Text0012 + Text0013 + COMPANYNAME, "Account No", "Account No", false);


                if Type = Type::"Credit Receipt" then begin
                    PostCredit(CashierTrans, JTemplate, JBatch, TillNo, DBranch, DActivity);
                end;

                //Post New
                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", JTemplate);
                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                if GenJournalLine.Find('-') then begin
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                end;
                //Post New

                Post := false;
                Post := JournlPosted.PostedSuccessfully();
                if Post then begin
                    Posted := true;
                    "Date Posted" := Today;
                    "Time Posted" := Time;
                    "Posted By" := UserId;
                    Modify;
                    Commit;
                end;

                //Advice Loan -------------Advice Savings Accounts
                if (Type <> Type::"Credit Cheque") then begin
                    CTransLines.Reset;
                    CTransLines.SetRange("Transaction No", No);
                    if CTransLines.Find('-') then begin
                        repeat
                            if CTransLines."Transaction Type" = CTransLines."transaction type"::Repayment then begin
                                if Loans.Get(CTransLines."Loan No") then
                                    Loans.Validate(Repayment);
                            end;
                            if SavingsACC.Get(CTransLines."Account No") then begin
                                if (SavingsACC."Product Category" = SavingsACC."product category"::"Deposit Contribution") or
                                  (SavingsACC."Product Category" = SavingsACC."product category"::Benevolent) then
                                    EmployerSavingAdvice(SavingsACC, CTransLines.Amount);
                            end;
                        until CTransLines.Next = 0;
                    end;
                end;
            end
            else begin

                if Temp.Get(UserId) then begin

                end;



                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", JTemplate);
                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                GenJournalLine.DeleteAll;

                LineNo := LineNo + 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := JTemplate;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Document No." := No;
                GenJournalLine."External Document No." := No;
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                GenJournalLine."Account No." := "Account No";
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Posting Date" := "Transaction Date";
                GenJournalLine.Description := CopyStr("Transaction Description" + '-' + "Account Name" + '-' + "Member No.", 1, 50);
                GenJournalLine."Currency Code" := "Currency Code";
                GenJournalLine.Validate(GenJournalLine."Currency Code");
                GenJournalLine.Amount := Amount;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

                VendorAmount := 0;
                TransactionCharges.Reset;
                TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                if TransactionCharges.Find('-') then begin
                    repeat
                        ChargeAmount := 0;
                        if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                            VendorAmount := (Amount / (1 + TransactionCharges."Percentage of Amount" / 100));
                    until TransactionCharges.Next = 0;
                end;

                LineNo := LineNo + 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := JTemplate;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Document No." := No;
                GenJournalLine."External Document No." := No;
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                GenJournalLine."Account No." := "Project Vendor";
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Posting Date" := "Transaction Date";
                GenJournalLine.Description := CopyStr("Transaction Description" + '-' + "Account Name" + '-' + "Member No.", 1, 50);
                ;
                GenJournalLine."Currency Code" := "Currency Code";
                GenJournalLine.Validate(GenJournalLine."Currency Code");
                GenJournalLine.Amount := (VendorAmount) * -1;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;


                TCharges := 0;
                GenSetup.Get;

                TransactionCharges.Reset;
                TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                if TransactionCharges.Find('-') then begin
                    repeat
                        LineNo := LineNo + 10000;

                        ChargeAmount := 0;
                        if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                            ChargeAmount := (VendorAmount * TransactionCharges."Percentage of Amount") * 0.01
                        else
                            ChargeAmount := TransactionCharges."Charge Amount";

                        if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin

                            TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                            TariffDetails.Reset;
                            TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                            if TariffDetails.Find('-') then begin
                                repeat
                                    if (Amount >= TariffDetails."Lower Limit") and (Amount <= TariffDetails."Upper Limit") then begin
                                        if TariffDetails."Use Percentage" = true then begin
                                            ChargeAmount := Amount * TariffDetails.Percentage * 0.01;
                                        end else begin
                                            ChargeAmount := TariffDetails."Charge Amount";
                                        end;
                                    end;
                                until TariffDetails.Next = 0;
                            end;
                        end;

                        LineNo := LineNo + 10000;

                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := JTemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Document No." := No;
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                        GenJournalLine."Account No." := TransactionCharges."G/L Account";
                        GenJournalLine."External Document No." := CopyStr("ID No", 1, 20);
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Posting Date" := "Transaction Date";
                        GenJournalLine.Description := TransactionCharges.Description + '-' + "Member No.";
                        GenJournalLine."Currency Code" := "Currency Code";
                        GenJournalLine.Validate(GenJournalLine."Currency Code");
                        GenJournalLine.Amount := -ChargeAmount;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                        GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                        TChargeAmount := TChargeAmount + Abs(GenJournalLine.Amount);

                        if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
                          (TransactionCharges."Recover Excise Duty" = true) then begin

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := JTemplate;
                            GenJournalLine."Journal Batch Name" := JBatch;
                            GenJournalLine."Document No." := No;
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                            GenJournalLine."Account No." := TransactionCharges."G/L Account";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Posting Date" := "Transaction Date";
                            GenJournalLine.Description := CopyStr('Excise Duty' + "Account Name" + '-' + "Member No.", 1, 50);
                            ;
                            GenJournalLine."Currency Code" := "Currency Code";
                            GenJournalLine.Validate(GenJournalLine."Currency Code");
                            GenJournalLine.Amount := Abs((ChargeAmount * GenSetup."Excise Duty (%)") * 0.01);
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                            GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            TChargeAmount := TChargeAmount + Abs(GenJournalLine.Amount);
                        end;
                    until TransactionCharges.Next = 0;
                end;


                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", JTemplate);
                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                if GenJournalLine.Find('-') then begin
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                end;


                Post := false;
                Post := JournlPosted.PostedSuccessfully();
                if Post then begin
                    Posted := true;
                    "Date Posted" := Today;
                    "Time Posted" := Time;
                    "Posted By" := UserId;
                    Modify;
                end;

            end;
        end;

    end;

    local procedure PostChequeDep(CashierTrans: Record 52185776; JTemplate: Code[20]; JBatch: Code[20]; DBranch: Code[20]; DActivity: Code[20])
    var
        GenSetup: Record 52185689;
        Acc: Record 52185730;
        BankSetup: Record 52185782;
        BankAccount: Record "Bank Account";
        CurrentTellerAmount: Decimal;
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        TCharges: Decimal;
        TransactionCharges: Record 52185774;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        TChargeAmount: Decimal;
        Account: Record 52185730;
        AccountTypes: Record 52185690;
        ChBank: Code[20];
        Trans: Record 52185776;
    begin
        with CashierTrans do begin

            GenSetup.Get;

            ChBank := "Bank Account";

            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", JTemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            GenJournalLine.DeleteAll;

            LineNo := LineNo + 10000;

            GenJournalLine.Init;
            GenJournalLine."Journal Template Name" := JTemplate;
            GenJournalLine."Journal Batch Name" := JBatch;
            GenJournalLine."Document No." := No;
            GenJournalLine."External Document No." := "Cheque No";
            GenJournalLine."Line No." := LineNo;
            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
            GenJournalLine."Account No." := "Account No";
            GenJournalLine.Validate(GenJournalLine."Account No.");
            GenJournalLine."Posting Date" := "Transaction Date";
            GenJournalLine.Description := PadStr("Transaction Description" + '-' + Remarks, 50);
            GenJournalLine."Currency Code" := "Currency Code";
            GenJournalLine.Validate(GenJournalLine."Currency Code");
            GenJournalLine.Amount := -Amount;
            GenJournalLine.Validate(GenJournalLine.Amount);
            GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
            GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
            if GenJournalLine.Amount <> 0 then
                GenJournalLine.Insert;

            LineNo := LineNo + 10000;

            GenJournalLine.Init;
            GenJournalLine."Journal Template Name" := JTemplate;
            GenJournalLine."Journal Batch Name" := JBatch;
            GenJournalLine."Document No." := No;
            GenJournalLine."External Document No." := "Cheque No";
            GenJournalLine."Line No." := LineNo;
            GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
            GenJournalLine."Account No." := ChBank;
            GenJournalLine.Validate(GenJournalLine."Account No.");
            GenJournalLine."Posting Date" := "Transaction Date";
            GenJournalLine.Description := "Account Name";
            GenJournalLine."Currency Code" := "Currency Code";
            GenJournalLine.Validate(GenJournalLine."Currency Code");
            GenJournalLine.Amount := Amount;
            GenJournalLine.Validate(GenJournalLine.Amount);
            GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
            GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
            if GenJournalLine.Amount <> 0 then
                GenJournalLine.Insert;

            //Charges
            TCharges := 0;

            TransactionCharges.Reset;
            TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
            if TransactionCharges.Find('-') then begin
                repeat

                    if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::Normal) or
                    (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::"Stamp Duty") then begin

                        LineNo := LineNo + 10000;

                        ChargeAmount := 0;
                        if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                            ChargeAmount := (Amount * TransactionCharges."Percentage of Amount") * 0.01
                        else
                            ChargeAmount := TransactionCharges."Charge Amount";

                        if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin

                            TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                            TariffDetails.Reset;
                            TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                            if TariffDetails.Find('-') then begin
                                repeat
                                    if (Amount >= TariffDetails."Lower Limit") and (Amount <= TariffDetails."Upper Limit") then begin
                                        if TariffDetails."Use Percentage" = true then begin
                                            ChargeAmount := Amount * TariffDetails.Percentage * 0.01;
                                        end else begin
                                            ChargeAmount := TariffDetails."Charge Amount";
                                        end;
                                    end;
                                until TariffDetails.Next = 0;
                            end;
                        end;



                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := JTemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Document No." := No;
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                        GenJournalLine."Account No." := "Account No";
                        GenJournalLine."External Document No." := "ID No";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Posting Date" := "Transaction Date";
                        GenJournalLine.Description := TransactionCharges.Description;
                        GenJournalLine."Currency Code" := "Currency Code";
                        GenJournalLine.Validate(GenJournalLine."Currency Code");
                        GenJournalLine.Amount := ChargeAmount;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                        GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
                        GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                        GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                        GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;


                        //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                        if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
                          (TransactionCharges."Recover Excise Duty" = true) then begin


                            //Excise Duty

                            LineNo := LineNo + 10000;

                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := JTemplate;
                            GenJournalLine."Journal Batch Name" := JBatch;
                            GenJournalLine."Document No." := No;
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := "Account No";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Posting Date" := "Transaction Date";
                            GenJournalLine.Description := 'Excise Duty';
                            GenJournalLine."Currency Code" := "Currency Code";
                            GenJournalLine.Validate(GenJournalLine."Currency Code");
                            GenJournalLine.Amount := (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
                            GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                            GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            TChargeAmount := TChargeAmount + ChargeAmount;
                        end;
                    end;
                until TransactionCharges.Next = 0;
            end;




            //Post New
            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", JTemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            if GenJournalLine.Find('-') then begin
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
            end;

            //Post New

            Post := false;
            Post := JournlPosted.PostedSuccessfully();
            if Post then begin

                Posted := true;
                "Date Posted" := Today;
                "Time Posted" := Time;
                "Posted By" := UserId;
                Modify;
                Commit;
            end;


            //Advice Loan -------------Advice Savings Accounts
            if Type <> Type::"Credit Cheque" then begin
                CTransLines.Reset;
                CTransLines.SetRange("Transaction No", No);
                if CTransLines.Find('-') then begin
                    repeat
                        if Loans.Get(CTransLines."Loan No") then
                            Loans.Validate(Repayment);
                        if SavingsACC.Get(CTransLines."Account No") then begin
                            if (SavingsACC."Product Category" = SavingsACC."product category"::"Deposit Contribution") or
                              (SavingsACC."Product Category" = SavingsACC."product category"::Benevolent) then
                                SavingsACC.Validate("Monthly Contribution");
                        end;
                    until CTransLines.Next = 0;
                end;
            end;
        end;
    end;

    local procedure PostBankersCheq(CashierTrans: Record 52185776; JTemplate: Code[20]; JBatch: Code[20]; DBranch: Code[20]; DActivity: Code[20])
    var
        Acc: Record 52185730;
        BankingTemp: Record 52185782;
        Text0001: label 'This account has been blocked from receiving payments.';
        ChBank: Code[20];
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        TransactionCharges: Record 52185774;
        TCharges: Decimal;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        GenSetup: Record 52185689;
        TChargeAmount: Decimal;
        Text0002: label 'You cannot issue a Bankers cheque more than the available balance unless authorised.';
        BRegister: Record 52185794;
        Text0003: label 'You do not have enough money to carry out this transaction.';
        Text0004: label 'You need to transfer money back to the treasury since your balance has gone above the teller maximum withholding.';
        Text0005: label 'You need to transfer money back to the treasury since your balance has gone above the teller maximum withholding.';
        Text0006: label 'You cannot withdraw more than your allowed limit of %1 unless authorised.';
        Text0007: label 'You cannot withdraw more than the available balance unless authorised.';
        Text0008: label 'You cannot deposit more than your allowed limit of %1 unless authorised.';
        Text0009: label 'You have done a transaction of KSHS. ';
        Text0010: label ' of type ';
        Text0011: label ' on ';
        Text0012: label ' on your account ';
        Text0013: label ' at ';
        Text0014: label 'The limit for cashier ';
        Text0015: label ' of till ';
        Text0016: label ' has gone below the replenishing levels of ';
        Text0017: label ' has gone above the replenishing levels of ';
        Text0018: label 'Transaction Aborted';
        BankSetup: Record 52185782;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        Text0019: label 'You cannot draw banker cheque more than your allowed limit of %1 unless authorised.';
    begin

        with CashierTrans do begin

            if Acc.Get("Account No") then begin
                if Acc.Blocked = Acc.Blocked::Debit then
                    Error(Text0001);
            end;


            if BankingTemp.Get(UserId) then begin
                BankingTemp.TestField(BankingTemp."Bankers Cheque Account");
                ChBank := BankingTemp."Bankers Cheque Account";
            end;




            if Type = Type::"Bankers Cheque" then begin
                if "Available Balance" < Amount then begin

                    Message(Text0002);

                    exit;
                end;
            end;
            if Status <> Status::Approved then begin
                CheckBankersNo("Bankers Cheque No", "Global Dimension 2 Code", Amount);
                if Type = Type::"Bankers Cheque" then begin

                    if Amount > BankingTemp."Max. Bankers Chequel Limit" then begin
                        Message(Text0019, BankingTemp."Max. Bankers Chequel Limit");

                        if Confirm('Do you want to send this transaction for approval?', false) = true then begin
                            VarVariant := CashierTrans;
                            if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                                CustomApprovals.OnSendDocForApproval(VarVariant);
                        end;
                        exit;
                    end;
                end;
            end;
            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", JTemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            GenJournalLine.DeleteAll;

            LineNo := LineNo + 10000;

            GenJournalLine.Init;
            GenJournalLine."Journal Template Name" := JTemplate;
            GenJournalLine."Journal Batch Name" := JBatch;
            GenJournalLine."Document No." := No;
            GenJournalLine."External Document No." := "Bankers Cheque No";
            GenJournalLine."Line No." := LineNo;
            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
            GenJournalLine."Account No." := "Account No";
            GenJournalLine.Validate(GenJournalLine."Account No.");
            GenJournalLine."Posting Date" := "Transaction Date";
            GenJournalLine.Description := "Transaction Description" + '-' + Payee;
            GenJournalLine."Currency Code" := "Currency Code";
            GenJournalLine.Validate(GenJournalLine."Currency Code");
            GenJournalLine.Amount := Amount;
            GenJournalLine.Validate(GenJournalLine.Amount);
            GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
            GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
            if GenJournalLine.Amount <> 0 then
                GenJournalLine.Insert;

            LineNo := LineNo + 10000;

            GenJournalLine.Init;
            GenJournalLine."Journal Template Name" := JTemplate;
            GenJournalLine."Journal Batch Name" := JBatch;
            GenJournalLine."Document No." := No;
            GenJournalLine."External Document No." := "Bankers Cheque No";
            GenJournalLine."Line No." := LineNo;
            GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
            GenJournalLine."Account No." := ChBank;
            GenJournalLine.Validate(GenJournalLine."Account No.");
            GenJournalLine."Posting Date" := "Transaction Date";
            GenJournalLine.Description := Payee + '-' + "Cheque No";
            GenJournalLine."Currency Code" := "Currency Code";
            GenJournalLine.Validate(GenJournalLine."Currency Code");
            GenJournalLine.Amount := -Amount;
            GenJournalLine.Validate(GenJournalLine.Amount);
            GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
            GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
            if GenJournalLine.Amount <> 0 then
                GenJournalLine.Insert;



            //Charges
            TCharges := 0;
            GenSetup.Get;

            TransactionCharges.Reset;
            TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
            if TransactionCharges.Find('-') then begin
                repeat
                    LineNo := LineNo + 10000;

                    ChargeAmount := 0;
                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                        ChargeAmount := (Amount * TransactionCharges."Percentage of Amount") * 0.01
                    else
                        ChargeAmount := TransactionCharges."Charge Amount";

                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin

                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                        TariffDetails.Reset;
                        TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                        if TariffDetails.Find('-') then begin
                            repeat
                                if (Amount >= TariffDetails."Lower Limit") and (Amount <= TariffDetails."Upper Limit") then begin
                                    if TariffDetails."Use Percentage" = true then begin
                                        ChargeAmount := Amount * TariffDetails.Percentage * 0.01;
                                    end else begin
                                        ChargeAmount := TariffDetails."Charge Amount";
                                    end;
                                end;
                            until TariffDetails.Next = 0;
                        end;
                    end;



                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := JTemplate;
                    GenJournalLine."Journal Batch Name" := JBatch;
                    GenJournalLine."Document No." := No;
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                    GenJournalLine."Account No." := "Account No";
                    GenJournalLine."External Document No." := "ID No";
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine."Posting Date" := "Transaction Date";
                    GenJournalLine.Description := TransactionCharges.Description;
                    GenJournalLine."Currency Code" := "Currency Code";
                    GenJournalLine.Validate(GenJournalLine."Currency Code");
                    GenJournalLine.Amount := ChargeAmount;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                    GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                    GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                    GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;


                    //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                    if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
                      (TransactionCharges."Recover Excise Duty" = true) then begin


                        //Excise Duty

                        LineNo := LineNo + 10000;

                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := JTemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Document No." := No;
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                        GenJournalLine."Account No." := "Account No";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Posting Date" := "Transaction Date";
                        GenJournalLine.Description := 'Excise Duty';
                        GenJournalLine."Currency Code" := "Currency Code";
                        GenJournalLine.Validate(GenJournalLine."Currency Code");
                        GenJournalLine.Amount := (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                        GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
                        GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                        GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                        GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                        TChargeAmount := TChargeAmount + ChargeAmount;
                    end;
                until TransactionCharges.Next = 0;
            end;

            //Post New
            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", JTemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            if GenJournalLine.Find('-') then begin
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
            end;
            //Post New

            Post := false;
            Post := JournlPosted.PostedSuccessfully();
            if Post then begin
                Posted := true;
                "Date Posted" := Today;
                "Time Posted" := Time;
                "Posted By" := UserId;
                Modify;
                Commit;
            end;

            BRegister.Reset;
            BRegister.SetRange(BRegister."Cheque No.", "Bankers Cheque No");
            BRegister.SetRange(Status, BRegister.Status::Pending);
            if BRegister.Find('-') then begin
                BRegister.Status := BRegister.Status::Approved;
                BRegister.Modify;
            end;

            if SavingsACC.Get("Account No") then begin
                MobileNo := SavingsACC."Mobile Phone No";
            end;

            SendSMS.SendSms(Sourcetype::"Cash Withdrawal Confirm", MobileNo, Text0009 + Format(Amount) + Text0010 + Format(Type) + Text0011 +
                       Format(Today) + ' ' + Format(Time) + Text0012 + Text0013 + COMPANYNAME, "Account No", "Account No", false)


        end;
    end;

    local procedure PostCredit(CashierTrans: Record 52185776; JTemplate: Code[20]; JBatch: Code[20]; TillNo: Code[20]; DBranch: Code[20]; DActivity: Code[20])
    var
        CTransLines: Record 52185796;
        GenJournalLine: Record "Gen. Journal Line";
    begin
        with CashierTrans do begin

            LineNo := LineNo + 10000;

            GenJournalLine.Init;
            GenJournalLine."Journal Template Name" := JTemplate;
            GenJournalLine."Journal Batch Name" := JBatch;
            GenJournalLine."Document No." := No;
            GenJournalLine."External Document No." := "Cheque No";
            GenJournalLine."Line No." := LineNo;
            GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
            GenJournalLine."Account No." := TillNo;
            GenJournalLine.Validate(GenJournalLine."Account No.");
            GenJournalLine."Posting Date" := "Transaction Date";
            GenJournalLine.Description := Payee;
            GenJournalLine."Currency Code" := "Currency Code";
            GenJournalLine.Validate(GenJournalLine."Currency Code");
            GenJournalLine.Amount := Amount;
            GenJournalLine.Validate(GenJournalLine.Amount);
            GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
            GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
            if GenJournalLine.Amount <> 0 then
                GenJournalLine.Insert;

            CTransLines.Reset;
            CTransLines.SetRange(CTransLines."Transaction No", No);
            if CTransLines.Find('-') then begin
                repeat

                    LineNo := LineNo + 10000;

                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := JTemplate;
                    GenJournalLine."Journal Batch Name" := JBatch;
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Document No." := No;
                    GenJournalLine."External Document No." := "Cheque No";
                    GenJournalLine."Posting Date" := "Transaction Date";
                    if CTransLines.Type = CTransLines.Type::Credit then begin
                        GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Credit;
                        GenJournalLine.Description := 'Receipt ' + No + Format(CTransLines."Transaction Type");
                    end else
                        if CTransLines.Type = CTransLines.Type::Savings then begin
                            GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Savings;
                            GenJournalLine.Description := PadStr('Rct ' + No + ' ' + "Transaction Description", 50);
                        end;
                    GenJournalLine."Account No." := CTransLines."Account No";
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine.Amount := -CTransLines.Amount;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Currency Code" := "Currency Code";
                    GenJournalLine.Validate(GenJournalLine."Currency Code");
                    GenJournalLine."Transaction Type" := CTransLines."Transaction Type";
                    GenJournalLine."Loan No" := CTransLines."Loan No";
                    GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                    GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;


                    if Loans.Get(CTransLines."Loan No") then begin
                        //  Loans.VALIDATE(Repayment);}
                        //Pay Bills
                        if ProductFactory.Get(Loans."Loan Product Type") then begin
                            if CTransLines."Transaction Type" = CTransLines."transaction type"::Repayment then
                                if CTransLines."Outstanding Bill" <> 0 then begin
                                    begin
                                        LineNo := LineNo + 10000;

                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := JTemplate;
                                        GenJournalLine."Journal Batch Name" := JBatch;
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Document No." := No;
                                        GenJournalLine."External Document No." := "Cheque No";
                                        GenJournalLine."Posting Date" := "Transaction Date";
                                        GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Credit;
                                        GenJournalLine.Description := 'Receipt ' + No + Format(CTransLines."Transaction Type");
                                        GenJournalLine."Account No." := CTransLines."Account No";
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        if CTransLines.Amount = CTransLines."OutStanding Loan" then
                                            GenJournalLine.Amount := -CTransLines."Outstanding Bill"
                                        else
                                            if CTransLines."Outstanding Bill" < 0 then
                                                GenJournalLine.Amount := -CTransLines."Outstanding Bill"
                                            else
                                                if CTransLines.Amount > CTransLines."Outstanding Bill" then
                                                    GenJournalLine.Amount := -CTransLines."Outstanding Bill"
                                                else
                                                    GenJournalLine.Amount := -CTransLines.Amount;
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine."Currency Code" := "Currency Code";
                                        GenJournalLine.Validate(GenJournalLine."Currency Code");
                                        GenJournalLine."Transaction Type" := CTransLines."transaction type"::Bills;
                                        GenJournalLine."Loan No" := CTransLines."Loan No";
                                        GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                                        GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                        GenJournalLine."Bal. Account No." := ProductFactory."Billed Account";
                                        GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;
                                    end;
                                end;
                        end;
                    end;

                    //change status of deposit account from new to acctive
                    if CTransLines.Type = CTransLines.Type::Savings then
                        if SavingsACC.Get(CTransLines."Account No") then begin
                            if SavingsACC."Product Category" = SavingsACC."product category"::"Deposit Contribution" then
                                if SavingsACC.Status = SavingsACC.Status::New then begin
                                    SavingsACC.CalcFields("Balance (LCY)");
                                    if SavingsACC."Balance (LCY)" + CTransLines.Amount >= 1000 then begin
                                        SavingsACC.Status := SavingsACC.Status::Active;
                                        SavingsACC.Modify;
                                    end;
                                end;
                            if Memb.Get(SavingsACC."Member No.") then
                                if Memb.Status = Memb.Status::New then begin
                                    Memb.Status := Memb.Status::Active;
                                    Memb.Modify;
                                end;
                        end;

                until CTransLines.Next = 0;
            end;
        end;
    end;

    local procedure PostCreditCheque(CashierTrans: Record 52185776; JTemplate: Code[20]; JBatch: Code[20]; TillNo: Code[20]; DBranch: Code[20]; DActivity: Code[20])
    var
        CTransLines: Record 52185796;
        GenJournalLine: Record "Gen. Journal Line";
        CreditLedger: Record 52185733;
    begin
        with CashierTrans do begin
            CTransLines.Reset;
            CTransLines.SetRange(CTransLines."Transaction No", No);
            if CTransLines.Find('-') then begin
                repeat
                    CreditLedger.Reset;
                    CreditLedger.SetRange("Document No.", CTransLines."Transaction No");
                    CreditLedger.SetRange("Loan No", CTransLines."Loan No");
                    if not CreditLedger.Find('-') then begin
                        LineNo := LineNo + 10000;

                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := JTemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Document No." := No;
                        GenJournalLine."External Document No." := "Cheque No";
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                        GenJournalLine."Account No." := TillNo;
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Posting Date" := Today;//"Transaction Date";
                        GenJournalLine.Description := Payee;
                        GenJournalLine."Currency Code" := "Currency Code";
                        GenJournalLine.Validate(GenJournalLine."Currency Code");
                        GenJournalLine.Amount := CTransLines.Amount;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                        GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                        LineNo := LineNo + 10000;

                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := JTemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Document No." := No;
                        GenJournalLine."External Document No." := "Cheque No";
                        GenJournalLine."Posting Date" := Today;//"Transaction Date";
                        if CTransLines.Type = CTransLines.Type::Credit then
                            GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Credit
                        else
                            if CTransLines.Type = CTransLines.Type::Savings then
                                GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Savings;
                        GenJournalLine.Description := 'Receipt ' + No + Format(CTransLines."Transaction Type");
                        GenJournalLine."Account No." := CTransLines."Account No";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine.Amount := -CTransLines.Amount;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Currency Code" := "Currency Code";
                        GenJournalLine.Validate(GenJournalLine."Currency Code");
                        GenJournalLine."Transaction Type" := CTransLines."Transaction Type";
                        GenJournalLine."Loan No" := CTransLines."Loan No";
                        GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                        GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;
                    end;
                until CTransLines.Next = 0;
            end;
        end;
    end;


    procedure PostTCIssue(TCTrans: Record 52185778)
    var
        Text0004: label 'The money has already been issued.';
        BankingSetup: Record 52185782;
        Text0005: label 'You do not have permission to transact on this teller till/Account.';
        Banks: Record "Bank Account";
        BankBal: Decimal;
        GenJournalLine: Record "Gen. Journal Line";
        Temp: Record 52185782;
        JTemplate: Code[20];
        JBatch: Code[20];
        TillNo: Code[20];
        DBranch: Code[20];
        DActivity: Code[20];
        Text0001: label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
        Text0003: label 'Ensure the Default Bank is set up in User Setup';
        UserSetup: Record "User Setup";
        Text0007: label 'Please specify an amount greater than zero.';
        ToAccount: Code[20];
        FromAccount: Code[20];
        Text0008: label 'Coinage Amount must be equal to the amount';
    begin

        with TCTrans do begin



            //Cyrus
            Temp.Get(UserId);

            JTemplate := Temp."Cashier Journal Template";
            JBatch := Temp."Cashier Journal Batch";
            TillNo := Temp."Default  Bank";


            if JTemplate = '' then begin
                Error(Text0001);
            end;

            if JBatch = '' then begin
                Error(Text0002);
            end;

            if TillNo = '' then begin
                Error(Text0003);
            end;


            CheckTillCurrency(TillNo, "Currency Code");

            UserSetup.Reset;
            UserSetup.SetRange(UserSetup."User ID", UpperCase(UserId));
            if UserSetup.Find('-') then begin
                UserSetup.TestField(UserSetup."Global Dimension 2 Code");
                UserSetup.TestField(UserSetup."Global Dimension 1 Code");
                DBranch := UserSetup."Global Dimension 2 Code";
                DActivity := UserSetup."Global Dimension 1 Code";
            end;

            TestField(Amount);
            TestField("From Account");
            TestField("To Account");

            if Amount <= 0 then
                Error(Text0007);

            if Amount <> "Total Cash on Treasury Coinage" then
                Error(Text0008);

            if ("Transaction Type" = "transaction type"::"Issue To Teller") or
            ("Transaction Type" = "transaction type"::"Return To Treasury") or
            ("Transaction Type" = "transaction type"::"Inter Teller Transfers") or
            ("Transaction Type" = "transaction type"::"Branch Treasury Transactions") or
            ("Transaction Type" = "transaction type"::"End of Day Return to Treasury")

             then begin

                if Issued = Issued::Yes then
                    Error(Text0004);



                BankingSetup.Reset;
                BankingSetup.SetRange(BankingSetup.UserID, "From Account");
                if BankingSetup.Find('-') then begin
                    if UpperCase(UserId) <> BankingSetup.UserID then
                        Error(Text0005);
                end;


                Banks.Reset;
                Banks.SetRange(Banks."No.", TillNo);
                if Banks.Find('-') then begin
                    Banks.CalcFields(Banks."Balance (LCY)");
                    BankBal := Banks."Balance (LCY)";
                    if Amount > BankBal then begin
                        Error('You cannot issue more than the account balance.')
                    end;
                end;

                if Confirm('Are you sure you want to make this issue?', false) = true then begin
                    Issued := Issued::Yes;
                    "Date Issued" := Today;
                    "Time Issued" := Time;
                    "Issued By" := UpperCase(UserId);
                    Modify;
                    Commit;
                end;
                Message('Money successfully issued/Returned.');
            end else

                if "Transaction Type" = "transaction type"::"Return To Bank" then begin
                    TestField(Amount);
                    TestField("From Account");
                    TestField("To Account");


                    BankingSetup.Reset;
                    BankingSetup.SetRange(BankingSetup.UserID, "From Account");
                    if BankingSetup.Find('-') then begin
                        FromAccount := BankingSetup."Default  Bank";
                    end;

                    ToAccount := "To Account";

                    Banks.Reset;
                    Banks.SetRange(Banks."No.", "From Account");
                    if Banks.Find('-') then begin
                        Banks.CalcFields("Balance (LCY)");
                        if Amount > Banks."Balance (LCY)" then
                            Error('You cannot receive more than balance in ' + "From Account")
                    end;

                    Banks.Reset;
                    Banks.SetRange(Banks."No.", FromAccount);
                    if Banks.Find('-') then begin
                        Banks.CalcFields(Banks."Balance (LCY)", Banks.Balance);
                        BankBal := Banks.Balance;//Banks."Balance (LCY)";
                        if Amount > BankBal then begin
                            Error('You cannot return more than the account balance.')
                        end;
                    end;

                    if Confirm('Are you sure you want to make this return?', false) = false then
                        exit;


                    //Delete any items present
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange(GenJournalLine."Journal Template Name", JTemplate);
                    GenJournalLine.SetRange(GenJournalLine."Journal Batch Name", JBatch);
                    GenJournalLine.DeleteAll;


                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := JTemplate;
                    GenJournalLine."Journal Batch Name" := JBatch;
                    GenJournalLine."Document No." := No;
                    GenJournalLine."External Document No." := "External Document No.";
                    GenJournalLine."Line No." := 10000;
                    GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                    GenJournalLine."Account No." := FromAccount;
                    GenJournalLine."Posting Date" := Today;
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine.Description := Description;
                    GenJournalLine."Currency Code" := "Currency Code";
                    GenJournalLine.Validate(GenJournalLine."Currency Code");
                    GenJournalLine.Amount := -Amount;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"Bank Account";
                    GenJournalLine."Bal. Account No." := ToAccount;
                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                    GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                    GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange(GenJournalLine."Journal Template Name", JTemplate);
                    GenJournalLine.SetRange(GenJournalLine."Journal Batch Name", JBatch);
                    if GenJournalLine.Find('-') then
                        //CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJournalLine);

                        Post := false;
                    Post := JournlPosted.PostedSuccessfully();
                    if Post then begin
                        Posted := true;
                        "Date Posted" := Today;
                        "Time Posted" := Time;
                        "Posted By" := UpperCase(UserId);
                        Received := Received::Yes;
                        "Date Received" := Today;
                        "Time Received" := Time;
                        "Received By" := UpperCase(UserId);
                        //**COMMIT;
                        //MODIFY;
                    end;
                end else
                    Message('Only applicable for teller, treasury & Bank Issues/Returns.');

        end;
    end;


    procedure PostTCReceive(TCTrans: Record 52185778)
    var
        CurrentTellerAmount: Decimal;
        BankingSetup: Record 52185782;
        Banks: Record "Bank Account";
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        Temp: Record 52185782;
        JTemplate: Code[20];
        JBatch: Code[20];
        TillNo: Code[20];
        DBranch: Code[20];
        DActivity: Code[20];
        UserSetup: Record "User Setup";
        Text0001: label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
        Text0003: label 'Ensure the Default Bank is set up in User Setup';
        Text0007: label 'Please specify an amount greater than zero.';
        ToAccount: Code[20];
        FromAccount: Code[20];
        ShortageAcc: Code[20];
        ExcessAcc: Code[20];
        GLEntry: Record "G/L Entry";
    begin

        with TCTrans do begin

            //Cyrus

            //*******Prevent posting Twice
            GLEntry.Reset;
            GLEntry.SetRange("Document No.", No);
            if GLEntry.Find('-') then begin
                Posted := true;
                "Date Posted" := Today;
                "Time Posted" := Time;
                "Posted By" := UpperCase(UserId);
                Received := Received::Yes;
                "Date Received" := Today;
                "Time Received" := Time;
                "Received By" := UpperCase(UserId);
                Commit;
                Modify;
                exit;
            end;
            //*******Prevent Posting Twice.
            Temp.Get(UserId);

            JTemplate := Temp."Cashier Journal Template";
            JBatch := Temp."Cashier Journal Batch";
            TillNo := Temp."Default  Bank";

            if JTemplate = '' then begin
                Error(Text0001);
            end;

            if JBatch = '' then begin
                Error(Text0002);
            end;

            if TillNo = '' then begin
                Error(Text0003);
            end;

            CheckTillCurrency(TillNo, "Currency Code");

            UserSetup.Reset;
            UserSetup.SetRange(UserSetup."User ID", UpperCase(UserId));
            if UserSetup.Find('-') then begin
                UserSetup.TestField(UserSetup."Global Dimension 2 Code");
                UserSetup.TestField(UserSetup."Global Dimension 1 Code");
                DBranch := UserSetup."Global Dimension 2 Code";
                DActivity := UserSetup."Global Dimension 1 Code";
            end;

            TestField(Amount);
            TestField("From Account");
            TestField("To Account");

            if Amount <= 0 then
                Error(Text0007);


            if "Transaction Type" = "transaction type"::"Issue From Bank" then begin
                TestField("External Document No.");

                BankingSetup.Reset;
                BankingSetup.SetRange(BankingSetup.UserID, "To Account");
                if BankingSetup.Find('-') then begin
                    ToAccount := BankingSetup."Default  Bank";
                end;
                FromAccount := "From Account";

            end;



            CurrentTellerAmount := 0;

            if Posted then
                Error('The transaction has already been received and posted.');


            if ("Transaction Type" = "transaction type"::"Issue To Teller") or
               ("Transaction Type" = "transaction type"::"Branch Treasury Transactions") or
              ("Transaction Type" = "transaction type"::"Return To Treasury") or
              ("Transaction Type" = "transaction type"::"End of Day Return to Treasury") or
               ("Transaction Type" = "transaction type"::"Inter Teller Transfers")

               then begin
                if Issued = Issued::No then
                    Error('The issue has not yet been made and therefore you cannot continue with this transaction.');


                BankingSetup.Reset;
                BankingSetup.SetRange(BankingSetup.UserID, "To Account");
                if BankingSetup.Find('-') then begin
                    if UpperCase(UserId) <> BankingSetup.UserID then
                        Error('You do not have permission to transact on this teller till/Account.');

                    ToAccount := BankingSetup."Default  Bank";

                    Banks.Reset;
                    Banks.SetRange(Banks."No.", ToAccount);
                    if Banks.Find('-') then begin
                        Banks.CalcFields(Banks."Balance (LCY)");
                        CurrentTellerAmount := Banks."Balance (LCY)";



                        if CurrentTellerAmount + Amount > BankingSetup."Max. Cashier Withholding" then
                            Error('The transaction will result in the teller having a balance more than the maximum allowable therefor terminated.');
                    end;
                end;

                BankingSetup.Reset;
                BankingSetup.SetRange(BankingSetup.UserID, "From Account");
                if BankingSetup.Find('-') then begin
                    FromAccount := BankingSetup."Default  Bank";
                    ExcessAcc := BankingSetup."Excess Account";
                    ShortageAcc := BankingSetup."Shortage Account";
                end;

            end;



            if Confirm('Are you sure you want to make this receipt?', false) = false then exit;

            //Delete any items present
            GenJournalLine.Reset;
            GenJournalLine.SetRange(GenJournalLine."Journal Template Name", JTemplate);
            GenJournalLine.SetRange(GenJournalLine."Journal Batch Name", JBatch);
            GenJournalLine.DeleteAll;

            //==Post Normal

            LineNo += 10000;
            GenJournalLine.Init;
            GenJournalLine."Journal Template Name" := JTemplate;
            GenJournalLine."Journal Batch Name" := JBatch;
            GenJournalLine."Document No." := No;
            GenJournalLine."Line No." := LineNo;
            GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
            GenJournalLine."Account No." := FromAccount;
            GenJournalLine."External Document No." := "External Document No.";
            GenJournalLine."Posting Date" := Today;
            GenJournalLine.Validate(GenJournalLine."Account No.");
            GenJournalLine.Description := Description;
            GenJournalLine."Currency Code" := "Currency Code";
            GenJournalLine.Validate(GenJournalLine."Currency Code");
            if Type = Type::Excess then
                GenJournalLine.Amount := -(Amount - "Excess/Shortage Amount")
            else
                if Type = Type::Shortage then
                    GenJournalLine.Amount := -Amount
                else
                    if Type = Type::" " then
                        GenJournalLine.Amount := -Amount;
            GenJournalLine.Validate(GenJournalLine.Amount);
            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"Bank Account";
            GenJournalLine."Bal. Account No." := ToAccount;
            GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
            GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
            GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
            if GenJournalLine.Amount <> 0 then
                GenJournalLine.Insert;
            //END;


            //Posting Excess
            if Type = Type::Excess then begin

                LineNo += 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := JTemplate;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Document No." := No;
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                GenJournalLine."Account No." := ToAccount;
                GenJournalLine."External Document No." := "External Document No.";
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine.Description := 'Excess From Cashier';
                GenJournalLine."Currency Code" := "Currency Code";
                GenJournalLine.Validate(GenJournalLine."Currency Code");
                GenJournalLine.Amount := "Excess/Shortage Amount";
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::Customer;
                GenJournalLine."Bal. Account No." := ExcessAcc;
                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

            end;
            //Posting Excess


            //Posting Shortage
            if Type = Type::Shortage then begin

                LineNo += 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := JTemplate;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Document No." := No;
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                GenJournalLine."Account No." := ToAccount;
                GenJournalLine."External Document No." := "External Document No.";
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine.Description := 'Shortage From Cashier';
                GenJournalLine."Currency Code" := "Currency Code";
                GenJournalLine.Validate(GenJournalLine."Currency Code");
                GenJournalLine.Amount := "Excess/Shortage Amount";
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::Customer;
                GenJournalLine."Bal. Account No." := ShortageAcc;
                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

            end;
            //Posting Shortage

            GenJournalLine.Reset;
            GenJournalLine.SetRange(GenJournalLine."Journal Template Name", JTemplate);
            GenJournalLine.SetRange(GenJournalLine."Journal Batch Name", JBatch);
            if GenJournalLine.Find('-') then
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);

            Post := false;
            Post := JournlPosted.PostedSuccessfully();
            if Post then begin
                Posted := true;
                "Date Posted" := Today;
                "Time Posted" := Time;
                "Posted By" := UpperCase(UserId);
                Received := Received::Yes;
                "Date Received" := Today;
                "Time Received" := Time;
                "Received By" := UpperCase(UserId);
                //**COMMIT;
                Modify;
            end;
        end;
    end;


    procedure ClearCheques()
    var
        Transactions: Record 52185776;
        GenJournalLine: Record "Gen. Journal Line";
        Text0001: label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
        TCharges: Decimal;
        TransactionCharges: Record 52185774;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        TChargeAmount: Decimal;
        Loans: Record 52185729;
        CTransLines: Record 52185796;
        CreditLedger: Record 52185733;
    begin
        Temp.Get(UserId);
        GenSetup.Get;

        Jtemplate := Temp."Cashier Journal Template";
        JBatch := Temp."Cashier Journal Batch";

        if Jtemplate = '' then begin
            Error(Text0001);
        end;

        if JBatch = '' then begin
            Error(Text0002);
        end;

        Transactions.Reset;
        Transactions.SetRange(Posted, true);
        Transactions.SetRange(Transactions.Select, true);
        Transactions.SetRange(Transactions."Cheque Status", Transactions."cheque status"::Pending);
        if Transactions.Find('-') then begin
            repeat
                if (Transactions.Type = Transactions.Type::"Cheque Deposit") or (Transactions.Type = Transactions.Type::"Credit Cheque") then begin
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                    GenJournalLine.SetRange("Journal Batch Name", JBatch);
                    GenJournalLine.DeleteAll;

                    CreditLedger.Reset;
                    CreditLedger.SetRange("Loan No", CTransLines."Loan No");
                    CreditLedger.SetRange("Document No.", CTransLines."Transaction No");
                    if not CreditLedger.Find('-') then begin
                        if Transactions.Type = Transactions.Type::"Credit Cheque" then begin
                            PostCreditCheque(Transactions, Jtemplate, JBatch, Transactions."Account No", Transactions."Global Dimension 2 Code",
                            Transactions."Global Dimension 1 Code");
                        end;
                    end;
                    //Recover Discounting
                    if Transactions."Discounted Amount" > 0 then begin
                        Loans.Reset;
                        Loans.SetRange(Loans.Remarks, Transactions.No);
                        Loans.SetRange(Loans."Member No.", Transactions."Member No.");
                        Loans.SetRange(Loans.Posted, true);
                        if Loans.Find('-') then begin
                            repeat
                                Loans.CalcFields(Loans."Outstanding Balance");
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Journal Batch Name" := JBatch;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Document No." := Transactions.No;
                                GenJournalLine."External Document No." := Loans."Loan No.";
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Credit;
                                GenJournalLine."Account No." := Loans."Loan Account";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine.Description := 'Discounting Loan Recovery';
                                GenJournalLine.Amount := -Loans."Outstanding Balance";
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Repayment;
                                GenJournalLine."Loan No" := Loans."Loan No.";
                                GenJournalLine."Shortcut Dimension 1 Code" := Transactions."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := Transactions."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Journal Batch Name" := JBatch;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Document No." := Transactions.No;
                                GenJournalLine."External Document No." := Loans."Loan No.";
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Savings;
                                GenJournalLine."Account No." := Transactions."Account No";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine.Description := 'Discounting Loan Recovery';
                                GenJournalLine.Amount := (Loans."Outstanding Balance");
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Shortcut Dimension 1 Code" := Transactions."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := Transactions."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;
                            until Loans.Next = 0;
                        end else
                            Error('Discounting loan for %1 not found.', Transactions.No);
                    end;

                    //Post New
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                    GenJournalLine.SetRange("Journal Batch Name", JBatch);
                    if GenJournalLine.Find('-') then begin
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                    end;
                    //Post New
                    Transactions."Cheque Status" := Transactions."cheque status"::Honoured;
                    Transactions."Date Cleared" := Today;
                    Transactions."Cleared By" := UserId;
                    Transactions.Modify;
                end;

                CTransLines.Reset;
                CTransLines.SetRange("Transaction No", Transactions.No);
                if CTransLines.Find('-') then begin
                    repeat
                        if CTransLines."Transaction Type" = CTransLines."transaction type"::Repayment then begin
                            if Loans.Get(CTransLines."Loan No") then
                                Loans.Validate(Repayment);
                        end;
                    until CTransLines.Next = 0;
                end;
            until Transactions.Next = 0;
        end;
    end;


    procedure StopCheque(CashierTrans: Record 52185776)
    var
        Text0001: label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
        GenJournalLine: Record "Gen. Journal Line";
        ChargeAmount: Decimal;
        ChequeType: Record 52185775;
        TCharges: Decimal;
        TransactionCharges: Record 52185774;
        TariffDetails: Record 52185777;
        TChargeAmount: Decimal;
        TransType: Record 52185773;
    begin
        with CashierTrans do begin

            Temp.Get(UserId);
            GenSetup.Get;

            Jtemplate := Temp."Cashier Journal Template";
            JBatch := Temp."Cashier Journal Batch";


            if Jtemplate = '' then begin
                Error(Text0001);
            end;

            if JBatch = '' then begin
                Error(Text0002);
            end;

            if (Type = Type::"Cheque Deposit") or (Type = Type::"Credit Cheque") then begin
                // ERROR('Only applicable to cheques');

                if "Cheque Status" <> "cheque status"::Pending then
                    Error('Cheque already processed.');

                if Confirm('Are you sure you want to stop the Cheque? reversal charges will apply', true) = false then
                    exit;



                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                GenJournalLine.DeleteAll;



                //Reverse Entry
                LineNo := LineNo + 10000;

                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := Jtemplate;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Document No." := No;
                GenJournalLine."External Document No." := "Cheque No";
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                GenJournalLine."Account No." := "Account No";
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'Unpaid Cheque Reversal';
                GenJournalLine.Validate(GenJournalLine."Currency Code");
                GenJournalLine.Amount := Amount;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

                LineNo := LineNo + 10000;

                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := Jtemplate;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Document No." := No;
                GenJournalLine."External Document No." := "Cheque No";
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                GenJournalLine."Account No." := "Bank Account";//BankCodes;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := CopyStr("Member No." + ' ' + "Account Name", 1, 30);
                GenJournalLine.Validate(GenJournalLine."Currency Code");
                GenJournalLine.Amount := -Amount;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;


                //Charges
                TCharges := 0;

                TransType.Reset;
                TransType.SetRange(TransType.Type, TransType.Type::"Bounced Cheque");
                if TransType.Find('-') then begin


                    TransactionCharges.Reset;
                    TransactionCharges.SetRange(TransactionCharges."Transaction Type", TransType.Code);
                    if TransactionCharges.Find('-') then begin
                        repeat

                            if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::Normal) or
                            (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::"Stamp Duty") then begin

                                LineNo := LineNo + 10000;

                                ChargeAmount := 0;
                                if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                                    ChargeAmount := (Amount * TransactionCharges."Percentage of Amount") * 0.01
                                else
                                    ChargeAmount := TransactionCharges."Charge Amount";

                                if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin

                                    TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                                    TariffDetails.Reset;
                                    TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                    if TariffDetails.Find('-') then begin
                                        repeat
                                            if (Amount >= TariffDetails."Lower Limit") and (Amount <= TariffDetails."Upper Limit") then begin
                                                if TariffDetails."Use Percentage" = true then begin
                                                    ChargeAmount := Amount * TariffDetails.Percentage * 0.01;
                                                end else begin
                                                    ChargeAmount := TariffDetails."Charge Amount";
                                                end;
                                            end;
                                        until TariffDetails.Next = 0;
                                    end;
                                end;



                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Journal Batch Name" := JBatch;
                                GenJournalLine."Document No." := No;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := "Account No";
                                GenJournalLine."External Document No." := "ID No";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := "Transaction Date";
                                GenJournalLine.Description := TransactionCharges.Description;
                                GenJournalLine."Currency Code" := "Currency Code";
                                GenJournalLine.Validate(GenJournalLine."Currency Code");
                                GenJournalLine.Amount := ChargeAmount;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;


                                //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                                if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty")
                                  and (TransactionCharges."Recover Excise Duty" = true) then begin

                                    //Excise Duty

                                    LineNo := LineNo + 10000;

                                    GenJournalLine.Init;
                                    GenJournalLine."Journal Template Name" := Jtemplate;
                                    GenJournalLine."Journal Batch Name" := JBatch;
                                    GenJournalLine."Document No." := No;
                                    GenJournalLine."Line No." := LineNo;
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                    GenJournalLine."Account No." := "Account No";
                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                    GenJournalLine."Posting Date" := "Transaction Date";
                                    GenJournalLine.Description := 'Excise Duty';
                                    GenJournalLine."Currency Code" := "Currency Code";
                                    GenJournalLine.Validate(GenJournalLine."Currency Code");
                                    GenJournalLine.Amount := (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                    GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
                                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                    GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                    GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                    if GenJournalLine.Amount <> 0 then
                                        GenJournalLine.Insert;

                                    TChargeAmount := TChargeAmount + ChargeAmount;
                                end;

                            end;
                        until TransactionCharges.Next = 0;
                    end;
                end;






                //Post
                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                if GenJournalLine.Find('-') then begin
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                end;
                //Post

                "Cheque Status" := "cheque status"::Stopped;
                "Date Cleared" := Today;
                "Cleared By" := UserId;
                Modify;
            end else
                Error('Only applicable to cheques');
        end;
    end;


    procedure StopBankers(CashierTrans: Record 52185776)
    var
        Acc: Record 52185730;
        BankingTemp: Record 52185782;
        Text0001: label 'This account has been blocked from receiving payments.';
        ChBank: Code[20];
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        TransactionCharges: Record 52185774;
        TCharges: Decimal;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        GenSetup: Record 52185689;
        TChargeAmount: Decimal;
        Text0002: label 'You cannot issue a Bankers cheque more than the available balance unless authorised.';
        BRegister: Record 52185794;
        Text0003: label 'You do not have enough money to carry out this transaction.';
        Text0004: label 'You need to transfer money back to the treasury since your balance has gone above the teller maximum withholding.';
        Text0005: label 'You need to transfer money back to the treasury since your balance has gone above the teller maximum withholding.';
        Text0006: label 'You cannot withdraw more than your allowed limit of %1 unless authorised.';
        Text0007: label 'You cannot withdraw more than the available balance unless authorised.';
        Text0008: label 'You cannot deposit more than your allowed limit of %1 unless authorised.';
        Text0009: label 'You have done a transaction of KSHS. ';
        Text0010: label ' of type ';
        Text0011: label ' on ';
        Text0012: label ' on your account ';
        Text0013: label ' at ';
        Text0014: label 'The limit for cashier ';
        Text0015: label ' of till ';
        Text0016: label ' has gone below the replenishing levels of ';
        Text0017: label ' has gone above the replenishing levels of ';
        Text0018: label 'Transaction Aborted';
        BankSetup: Record 52185782;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        Text0019: label 'You cannot draw banker cheque more than your allowed limit of %1 unless authorised.';
        TransType: Record 52185773;
        Text0020: label 'Your Bankers Cheque of KSHS. ';
        Text0021: label 'has been cancelled and charges applied';
        JTemplate: Code[20];
        JBatch: Code[20];
        DBranch: Code[20];
        DActivity: Code[20];
    begin

        with CashierTrans do begin

            if Acc.Get("Account No") then begin
                if Acc.Blocked = Acc.Blocked::Debit then
                    Error(Text0001);
            end;


            if BankingTemp.Get(UserId) then begin
                BankingTemp.TestField(BankingTemp."Bankers Cheque Account");
                ChBank := BankingTemp."Bankers Cheque Account";
            end;
            Temp.Get(UserId);
            GenSetup.Get;

            JTemplate := Temp."Cashier Journal Template";
            JBatch := Temp."Cashier Journal Batch";



            if Type = Type::"Bankers Cheque" then begin
                /*IF "Available Balance" < Amount THEN BEGIN

                MESSAGE(Text0002);

                EXIT;
                END;*/
                BRegister.Reset;
                BRegister.SetRange(BRegister."Cheque No.", "Bankers Cheque No");
                BRegister.SetFilter(Status, '<>%1', BRegister.Status::Approved);
                if BRegister.Find('-') then begin
                    Error('Reversal Has already been done');
                end;

            end;
            if Status <> Status::Approved then begin
                if Type = Type::"Bankers Cheque" then begin
                    if Confirm('Do you want to send this transaction for approval?', false) = true then begin
                        VarVariant := CashierTrans;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                    exit;
                end;
            end;
            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", JTemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            GenJournalLine.DeleteAll;



            LineNo := LineNo + 10000;

            GenJournalLine.Init;
            GenJournalLine."Journal Template Name" := JTemplate;
            GenJournalLine."Journal Batch Name" := JBatch;
            GenJournalLine."Document No." := No;
            GenJournalLine."External Document No." := "Bankers Cheque No";
            GenJournalLine."Line No." := LineNo;
            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
            GenJournalLine."Account No." := "Account No";
            GenJournalLine.Validate(GenJournalLine."Account No.");
            GenJournalLine."Posting Date" := Today;
            GenJournalLine.Description := CopyStr('Cancelled-' + "Transaction Description" + '-' + Payee, 1, 50);
            GenJournalLine."Currency Code" := "Currency Code";
            GenJournalLine.Validate(GenJournalLine."Currency Code");
            GenJournalLine.Amount := -Amount;
            GenJournalLine.Validate(GenJournalLine.Amount);
            GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
            GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
            if GenJournalLine.Amount <> 0 then
                GenJournalLine.Insert;

            LineNo := LineNo + 10000;

            GenJournalLine.Init;
            GenJournalLine."Journal Template Name" := JTemplate;
            GenJournalLine."Journal Batch Name" := JBatch;
            GenJournalLine."Document No." := No;
            GenJournalLine."External Document No." := "Bankers Cheque No";
            GenJournalLine."Line No." := LineNo;
            GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
            GenJournalLine."Account No." := ChBank;
            GenJournalLine.Validate(GenJournalLine."Account No.");
            GenJournalLine."Posting Date" := Today;
            GenJournalLine.Description := CopyStr('Cancelled Bankers Cheque-' + Payee + '-' + "Cheque No", 1, 50);
            GenJournalLine."Currency Code" := "Currency Code";
            GenJournalLine.Validate(GenJournalLine."Currency Code");
            GenJournalLine.Amount := Amount;
            GenJournalLine.Validate(GenJournalLine.Amount);
            GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
            GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
            if GenJournalLine.Amount <> 0 then
                GenJournalLine.Insert;



            //Charges
            TCharges := 0;
            GenSetup.Get;

            TransType.Reset;
            TransType.SetRange(TransType.Type, TransType.Type::"Cancel Bankers Cheque");
            if TransType.Find('-') then begin

                TransactionCharges.Reset;
                TransactionCharges.SetRange(TransactionCharges."Transaction Type", TransType.Code);
                if TransactionCharges.Find('-') then begin
                    repeat


                        LineNo := LineNo + 10000;

                        ChargeAmount := 0;
                        if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                            ChargeAmount := (Amount * TransactionCharges."Percentage of Amount") * 0.01
                        else
                            ChargeAmount := TransactionCharges."Charge Amount";

                        if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin

                            TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                            TariffDetails.Reset;
                            TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                            if TariffDetails.Find('-') then begin
                                repeat
                                    if (Amount >= TariffDetails."Lower Limit") and (Amount <= TariffDetails."Upper Limit") then begin
                                        if TariffDetails."Use Percentage" = true then begin
                                            ChargeAmount := Amount * TariffDetails.Percentage * 0.01;
                                        end else begin
                                            ChargeAmount := TariffDetails."Charge Amount";
                                        end;
                                    end;
                                until TariffDetails.Next = 0;
                            end;
                        end;



                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := JTemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Document No." := No;
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                        GenJournalLine."Account No." := "Account No";
                        GenJournalLine."External Document No." := "ID No";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Posting Date" := Today;
                        GenJournalLine.Description := TransactionCharges.Description;
                        GenJournalLine."Currency Code" := "Currency Code";
                        GenJournalLine.Validate(GenJournalLine."Currency Code");
                        GenJournalLine.Amount := ChargeAmount;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                        GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
                        GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                        GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                        GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;


                        //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                        if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
                          (TransactionCharges."Recover Excise Duty" = true) then begin


                            //Excise Duty

                            LineNo := LineNo + 10000;

                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := JTemplate;
                            GenJournalLine."Journal Batch Name" := JBatch;
                            GenJournalLine."Document No." := No;
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := "Account No";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := 'Excise Duty';
                            GenJournalLine."Currency Code" := "Currency Code";
                            GenJournalLine.Validate(GenJournalLine."Currency Code");
                            GenJournalLine.Amount := (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
                            GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
                            GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            TChargeAmount := TChargeAmount + ChargeAmount;
                        end;
                    until TransactionCharges.Next = 0;
                end;
            end;

            //Post New
            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", JTemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            if GenJournalLine.Find('-') then begin
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
            end;
            //Post New

            Post := false;
            Post := JournlPosted.PostedSuccessfully();
            if Post then begin
                Posted := true;
                "Date Posted" := Today;
                "Time Posted" := Time;
                "Posted By" := UserId;
                Modify;
                Commit;
            end;

            BRegister.Reset;
            BRegister.SetRange(BRegister."Cheque No.", "Bankers Cheque No");
            if BRegister.Find('-') then begin
                BRegister.Status := BRegister.Status::Cancelled;
                BRegister."Cancelled/Stopped By" := UserId;
                BRegister.Modify;
            end;

            if SavingsACC.Get("Account No") then begin
                MobileNo := SavingsACC."Mobile Phone No";
            end;

            SendSMS.SendSms(Sourcetype::"Cash Withdrawal Confirm", MobileNo, Text0020 + Format(Amount) + Text0021 + Text0011 +
                       Format(Today) + ' ' + Format(Time) + Text0012 + Text0013 + COMPANYNAME, "Account No", "Account No", false)

        end;

    end;


    procedure CheckTillCurrency(BankAcc: Code[20]; CurrCode: Code[20])
    var
        BankAcct: Record "Bank Account";
    begin
        BankAcct.Reset;
        BankAcct.SetRange(BankAcct."No.", BankAcc);
        if BankAcct.Find('-') then begin
            if BankAcct."Currency Code" <> CurrCode then begin
                if BankAcct."Currency Code" = '' then
                    Error('This bank [%1:- %2] can only transact in LOCAL Currency', BankAcct."No.", BankAcct.Name)
                else
                    Error('This bank [%1:- %2] can only transact in %3', BankAcct."No.", BankAcct.Name, BankAcct."Currency Code");
            end;
        end;
    end;

    local procedure CheckBankersNo(ChequeNo: Code[20]; GlobalDim2: Code[20]; TAmount: Decimal)
    var
        Bregister: Record 52185794;
    begin
        Bregister.Reset;
        Bregister.SetRange(Bregister.Status, Bregister.Status::Pending);
        Bregister.SetRange(Bregister."Global Dimension 2 Code", GlobalDim2);
        Bregister.SetRange(Bregister."Cheque No.", ChequeNo);
        if Bregister.Find('-') = false then
            Error('Bankers cheque no has already been used');

        Bregister.Reset;
        Bregister.SetRange(Bregister.Status, Bregister.Status::Pending);
        Bregister.SetRange(Bregister."Global Dimension 2 Code", GlobalDim2);
        Bregister.SetRange(Bregister."Cheque No.", ChequeNo);
        if Bregister.Find('-') then begin
            if Bregister."Leaf Limit Amount" < TAmount then
                Error('Bankers cheque amount cannot be more than the leaf limit of %1', Bregister."Leaf Limit Amount");
        end;
    end;


    procedure PostTransfers(ACTransfer: Record 52185797)
    var
        Text0001: label 'Ensure the Transfer Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
        Text0003: label 'Dear member, your erroneous refund of Kes ';
        Text0004: label 'The transaction has already been posted.';
        BSched: Record 52185798;
        BSchedDestin: Record 52185799;
        GenJournalLine: Record "Gen. Journal Line";
        TCharges: Decimal;
        TransactionCharges: Record 52185774;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        TChargeAmount: Decimal;
        Member: Record 52185700;
        MobNo: Code[20];
        Text0005: label ' has been credited to your FOSA Account';
        Employer: Record Customer;
        Loans: Record 52185729;
        Text0006: label 'Dear Member, your Share Capital transfer of KES. ';
        Text0007: label ' has been effected on ';
        Text0008: label '. For any equiry kindly call ';
        Text0009: label ' on ';
        Text0010: label '. You may withdrawal via M-Sacco/ATM';
    begin
        with ACTransfer do begin

            //Cyrus
            if Posted = true then
                Error(Text0004);

            Temp.Get(UserId);

            Jtemplate := Temp."Transfer Journal Template";
            JBatch := Temp."Transfer Journal Batch";


            if Jtemplate = '' then begin
                Error(Text0001);
            end;

            if JBatch = '' then begin
                Error(Text0002);
            end;

            TestField(Remarks);

            if "Total Debits" <> "Total Credits" then
                Error('Debits must be equal to credits, please cheque your schedule');

            if Confirm('Are you sure you want to transfer schedule?', false) = true then begin

                GenJournalLine.Reset;
                GenJournalLine.SetRange(GenJournalLine."Journal Template Name", Jtemplate);
                GenJournalLine.SetRange(GenJournalLine."Journal Batch Name", JBatch);
                GenJournalLine.DeleteAll;


                BSched.Reset;
                BSched.SetRange(BSched."No.", No);
                if BSched.Find('-') then begin
                    repeat

                        LineNo := LineNo + 10000;

                        // UPDATE Source Account
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := Jtemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Document No." := No;
                        GenJournalLine."External Document No." := BSched."External Document No.";
                        GenJournalLine."Line No." := LineNo;
                        if BSched."Source Account Type" = BSched."source account type"::Customer then begin
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Customer;
                        end else
                            if BSched."Source Account Type" = BSched."source account type"::Credit then begin
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                GenJournalLine."Transaction Type" := BSched."Source Transaction Type";
                                GenJournalLine."Loan No" := BSched."Source Loan No.";
                            end else
                                if BSched."Source Account Type" = BSched."source account type"::Vendor then begin
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                                end else
                                    if BSched."Source Account Type" = BSched."source account type"::Savings then begin
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                    end else
                                        if BSched."Source Account Type" = BSched."source account type"::"G/L Account" then begin
                                            GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                                        end else
                                            if BSched."Source Account Type" = BSched."source account type"::"Bank Account" then begin
                                                GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                                            end;
                        GenJournalLine."Account No." := BSched."Source Account No.";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Posting Date" := "Transaction Date";
                        GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        GenJournalLine.Description := PadStr(Remarks + '-Destination Acc-' + BSchedDestin."Destination Account No.", 50);
                        //GenJournalLine.Description:=BSched."Source Account Name";//Remarks;
                        GenJournalLine.Amount := BSched."Source Amount";
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Transaction Type" := BSched."Source Transaction Type";
                        GenJournalLine."Loan No" := BSched."Source Loan No.";
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                    until BSched.Next = 0;
                end;



                BSchedDestin.Reset;
                BSchedDestin.SetRange(BSchedDestin."No.", No);
                if BSchedDestin.Find('-') then begin
                    repeat

                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := Jtemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Document No." := No;
                        GenJournalLine."External Document No." := BSchedDestin."External Document No.";
                        GenJournalLine."Line No." := LineNo;
                        if BSchedDestin."Destination Account Type" = BSchedDestin."destination account type"::Customer then begin
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Customer;
                        end else
                            if BSchedDestin."Destination Account Type" = BSchedDestin."destination account type"::Credit then begin
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                GenJournalLine."Transaction Type" := BSchedDestin."Destination Transaction Type";
                                GenJournalLine."Loan No" := BSchedDestin."Destination Loan No.";
                            end else
                                if BSchedDestin."Destination Account Type" = BSchedDestin."destination account type"::Vendor then begin
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                                end else
                                    if BSchedDestin."Destination Account Type" = BSchedDestin."destination account type"::"G/L Account" then begin
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                                    end else
                                        if BSchedDestin."Destination Account Type" = BSchedDestin."destination account type"::Savings then begin
                                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                        end else
                                            if BSchedDestin."Destination Account Type" = BSchedDestin."destination account type"::"Bank Account" then begin
                                                GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                                            end;

                        GenJournalLine."Account No." := BSchedDestin."Destination Account No.";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Posting Date" := "Transaction Date";
                        GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        //GenJournalLine.Description:=PADSTR(Remarks+':-Source Acc.'+BSched."Source Account No.",50);
                        //GenJournalLine.Description:=BSchedDestin."Destination Account Name";
                        BSched.Reset;
                        BSched.SetRange(BSched."No.", No);
                        if BSched.Find('-') then
                            GenJournalLine.Description := PadStr(Remarks + ':-Source Acc.' + BSched."Source Account No.", 50);
                        GenJournalLine.Amount := -BSchedDestin."Destination Amount";
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Transaction Type" := BSchedDestin."Destination Transaction Type";
                        GenJournalLine."Loan No" := BSchedDestin."Destination Loan No.";
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                    until BSchedDestin.Next = 0;
                end;

                //**************

                BSched.Reset;
                BSched.SetRange(BSched."No.", No);
                BSched.SetRange(BSched."Source Account Type", BSched."source account type"::Savings);
                if BSched.Find('-') then begin
                    repeat
                        GenSetup.Get;

                        //Charges
                        TCharges := 0;

                        TransactionCharges.Reset;
                        TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                        if TransactionCharges.Find('-') then begin
                            repeat

                                if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::Normal) then begin
                                    LineNo := LineNo + 10000;

                                    ChargeAmount := 0;
                                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                                        ChargeAmount := (BSched."Source Amount" * TransactionCharges."Percentage of Amount") * 0.01
                                    else
                                        ChargeAmount := TransactionCharges."Charge Amount";

                                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin

                                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                                        TariffDetails.Reset;
                                        TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                        if TariffDetails.Find('-') then begin
                                            repeat
                                                if (BSched."Source Amount" >= TariffDetails."Lower Limit") and (BSched."Source Amount" <= TariffDetails."Upper Limit") then begin
                                                    if TariffDetails."Use Percentage" = true then begin
                                                        ChargeAmount := BSched."Source Amount" * TariffDetails.Percentage * 0.01;
                                                    end else begin
                                                        ChargeAmount := TariffDetails."Charge Amount";
                                                    end;
                                                end;
                                            until TariffDetails.Next = 0;
                                        end;
                                    end;


                                    GenJournalLine.Init;
                                    GenJournalLine."Journal Template Name" := Jtemplate;
                                    GenJournalLine."Journal Batch Name" := JBatch;
                                    GenJournalLine."Document No." := No;
                                    GenJournalLine."Line No." := LineNo;
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                    GenJournalLine."Account No." := BSched."Source Account No.";
                                    GenJournalLine."External Document No." := BSched."External Document No.";
                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                    GenJournalLine."Posting Date" := "Transaction Date";
                                    GenJournalLine.Description := TransactionCharges.Description;
                                    //GenJournalLine."Currency Code":="Currency Code";
                                    GenJournalLine.Validate(GenJournalLine."Currency Code");
                                    GenJournalLine.Amount := ChargeAmount;
                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                    GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
                                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                    GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                    GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                    if GenJournalLine.Amount <> 0 then
                                        GenJournalLine.Insert;


                                    //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                                    if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty")
                                      and (TransactionCharges."Recover Excise Duty" = true) then begin

                                        //Excise Duty

                                        LineNo := LineNo + 10000;

                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := Jtemplate;
                                        GenJournalLine."Journal Batch Name" := JBatch;
                                        GenJournalLine."Document No." := No;
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                        GenJournalLine."Account No." := BSched."Source Account No.";
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Posting Date" := "Transaction Date";
                                        GenJournalLine.Description := 'Excise Duty';
                                        //GenJournalLine."Currency Code":="Currency Code";
                                        GenJournalLine.Validate(GenJournalLine."Currency Code");
                                        GenJournalLine.Amount := (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                        GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
                                        GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                        GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        TChargeAmount := TChargeAmount + ChargeAmount;
                                    end;
                                end;
                            until TransactionCharges.Next = 0;
                        end;


                        //***************************Charge Withdrawal Frequency**********************************

                        if SavingsACC.Get(BSched."Source Account No.") then begin
                            if AccountTypes.Get(SavingsACC."Product Type") then begin

                                if SavingsACC."Last Withdrawal Date" = 0D then begin
                                    SavingsACC."Last Withdrawal Date" := Today;
                                    SavingsACC.Modify;
                                end else begin
                                    if CalcDate(AccountTypes."Withdrawal Interval", SavingsACC."Last Withdrawal Date") > Today then begin
                                        //IF CALCDATE(AccountTypes."Withdrawal Interval",Account."Last Withdrawal Date") <= CALCDATE('1D',TODAY) THEN BEGIN

                                        GenSetup.Get;
                                        //Charges
                                        TCharges := 0;

                                        TransactionCharges.Reset;
                                        TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                                        if TransactionCharges.Find('-') then begin
                                            repeat

                                                if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::"Withdrawal Frequency") then begin

                                                    LineNo := LineNo + 10000;

                                                    ChargeAmount := 0;
                                                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                                                        ChargeAmount := (BSched."Source Amount" * TransactionCharges."Percentage of Amount") * 0.01
                                                    else
                                                        ChargeAmount := TransactionCharges."Charge Amount";

                                                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin

                                                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                                                        TariffDetails.Reset;
                                                        TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                                        if TariffDetails.Find('-') then begin
                                                            repeat
                                                                if (BSched."Source Amount" >= TariffDetails."Lower Limit") and (BSched."Source Amount" <= TariffDetails."Upper Limit") then begin
                                                                    if TariffDetails."Use Percentage" = true then begin
                                                                        ChargeAmount := BSched."Source Amount" * TariffDetails.Percentage * 0.01;
                                                                    end else begin
                                                                    end;
                                                                    ChargeAmount := TariffDetails."Charge Amount";
                                                                end;
                                                            until TariffDetails.Next = 0;
                                                        end;
                                                    end;


                                                    //Dont charge Transactional Charges
                                                    if SavingsACC.Get(BSched."Source Account No.") then begin
                                                        if Employer.Get(SavingsACC."Employer Code") then begin
                                                            if Employer."Dont Charge Transactions" then
                                                                ChargeAmount := 0;
                                                        end;
                                                    end;
                                                    //Dont charge Transactional Charges

                                                    GenJournalLine.Init;
                                                    GenJournalLine."Journal Template Name" := Jtemplate;
                                                    GenJournalLine."Journal Batch Name" := JBatch;
                                                    GenJournalLine."Document No." := No;
                                                    GenJournalLine."Line No." := LineNo;
                                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                                    GenJournalLine."Account No." := BSched."Source Account No.";
                                                    //GenJournalLine."External Document No.":="ID No";
                                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                                    GenJournalLine."Posting Date" := "Transaction Date";
                                                    GenJournalLine.Description := TransactionCharges.Description;
                                                    //GenJournalLine."Currency Code":="Currency Code";
                                                    GenJournalLine.Validate(GenJournalLine."Currency Code");
                                                    GenJournalLine.Amount := ChargeAmount;
                                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                                    GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
                                                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                                    GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                                    GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                                    if GenJournalLine.Amount <> 0 then
                                                        GenJournalLine.Insert;


                                                    //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                                                    if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
                                                      (TransactionCharges."Recover Excise Duty" = true) then begin

                                                        //Excise Duty

                                                        LineNo := LineNo + 10000;

                                                        GenJournalLine.Init;
                                                        GenJournalLine."Journal Template Name" := Jtemplate;
                                                        GenJournalLine."Journal Batch Name" := JBatch;
                                                        GenJournalLine."Document No." := No;
                                                        GenJournalLine."Line No." := LineNo;
                                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                                        GenJournalLine."Account No." := BSched."Source Account No.";
                                                        ;
                                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                                        GenJournalLine."Posting Date" := "Transaction Date";
                                                        GenJournalLine.Description := 'Excise Duty';
                                                        //GenJournalLine."Currency Code":="Currency Code";
                                                        GenJournalLine.Validate(GenJournalLine."Currency Code");
                                                        GenJournalLine.Amount := (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                                        GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
                                                        GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                                        GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                                        GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                                        if GenJournalLine.Amount <> 0 then
                                                            GenJournalLine.Insert;

                                                        TChargeAmount := TChargeAmount + ChargeAmount;
                                                    end;
                                                end;
                                            until TransactionCharges.Next = 0;
                                        end;
                                    end;
                                    SavingsACC."Last Withdrawal Date" := Today;
                                    SavingsACC.Modify;

                                end;
                            end;
                        end;

                    //***************************Charge Withdrawal Frequency**********************************
                    until BSched.Next = 0;
                end;

                //**************

                //Post
                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                if GenJournalLine.Find('-') then begin
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                end;
                //Post


                Posted := true;
                Modify;
                Commit;

                /*IF ACTransfer."Transaction Type"='ACCOUNT TRANSFERS' THEN BEGIN
                  IF Member.GET("Member No") THEN BEGIN
                    MobNo:=Member."Mobile Phone No";
                     END;
                              CALCFIELDS("Total Debits");
                  SendSMS.SendSms(SourceType::"InterAccount Transfer",MobNo,Text0003 +FORMAT("Total Debits")+Text0005+COMPANYNAME+' '
                    +FORMAT(TODAY)+' '+FORMAT(TIME) ,"Member No","Member No",FALSE);
                  END;*/
            end;
            CompanyInformation.Get;
            if ACTransfer."Transaction Type" = 'ACCOUNT TRANSFERS' then begin
                BSched.Reset;
                BSched.SetRange(BSched."No.", No);
                BSched.SetRange(BSched."Source Account Type", BSched."source account type"::Savings);
                BSched.SetFilter(BSched."Product Code", '03');
                BSched.SetFilter("Source Amount", '>0');
                if BSched.Find('-') then begin
                    if Member.Get("Member No") then
                        if Member."Mobile Phone No" <> '' then
                            SendSMS.SendSms(Sourcetype::"InterAccount Transfer", Member."Mobile Phone No", Text0006 + Format("Total Debits") + Text0007 + Format(Today) + ' ' + Format(Time)
                            + Text0008 + COMPANYNAME + Text0009 + CompanyInformation."Phone No.", No, "Member No", false);

                    BSchedDestin.Reset;
                    BSchedDestin.SetRange(BSchedDestin."No.", No);
                    BSchedDestin.SetRange(BSchedDestin."Destination Account Type", BSchedDestin."destination account type"::Savings);
                    BSchedDestin.SetFilter("Product Code", '03');
                    BSchedDestin.SetFilter("Destination Amount", '>0');
                    if BSchedDestin.Find('-') then begin
                        if SavingsACC.Get(BSchedDestin."Destination Account No.") then
                            if Memb.Get(SavingsACC."Member No.") then
                                if Memb."Mobile Phone No" <> '' then
                                    SendSMS.SendSms(Sourcetype::"InterAccount Transfer", Memb."Mobile Phone No", Text0006 + Format("Total Debits") + Text0007 + Format(Today) + ' ' + Format(Time)
                                    + Text0008 + COMPANYNAME + Text0009 + CompanyInformation."Phone No.", No, Memb."No.", false);
                    end;

                end else begin
                    if Member.Get("Member No") then begin
                        MobNo := Member."Mobile Phone No";
                    end;
                    CalcFields("Total Debits");
                    if MobNo <> '' then
                        SendSMS.SendSms(Sourcetype::"InterAccount Transfer", MobNo, Text0003 + Format("Total Debits") + Text0005 + Text0009
                          + Format(Today) + ' ' + Format(Time) + Text0010 + 'Call ' + CompanyInformation."Phone No.", "Member No", "Member No", false);
                end;
            end;

            /*
            BSchedDestin.RESET;
            BSchedDestin.SETRANGE(BSchedDestin."No.",No);
            IF BSchedDestin.FIND('-') THEN BEGIN
              REPEAT

              //Advice Savings Accounts
              IF SavingsACC.GET(BSchedDestin."Destination Account No.") THEN BEGIN
                  IF (SavingsACC."Product Category"=SavingsACC."Product Category"::"Deposit Contribution") OR
                    (SavingsACC."Product Category"=SavingsACC."Product Category"::Benevolent) THEN
                SavingsACC.VALIDATE("Monthly Contribution");
              END;

              //Advice
              IF Loans.GET(BSchedDestin."Destination Loan No.") THEN
              Loans.VALIDATE(Repayment);
              UNTIL BSchedDestin.NEXT=0;
            END;*/
            SavingsACC.Reset;
            SavingsACC.SetRange("Member No.", "Member No");
            SavingsACC.SetRange("Product Category", SavingsACC."product category"::"Share Capital");
            if SavingsACC.Find('-') then begin
                SavingsACC.CalcFields("Balance (LCY)");
                if SavingsACC."Balance (LCY)" = 0 then begin
                    if Member.Get("Member No") then begin
                        if Member.Status <> Member.Status::Withdrawn then begin
                            Member.Status := Member.Status::Withdrawn;
                            Member.Modify;
                        end;
                    end;
                end;
            end;
        end;

    end;


    procedure ChequeDiscounting(CashierTrans: Record 52185776)
    var
        Text0001: label 'Ensure the Cheque Discounting Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Cheque Discounting Batch is set up in Banking User Setup';
        GenJournalLine: Record "Gen. Journal Line";
        Loans: Record 52185729;
        ProdF: Record 52185690;
        LoanProcess: Codeunit "Loans Process";
        AcctsNo: Code[20];
        Accounts: Record 52185731;
        LnAccount: Code[20];
        ProdType: Record 52185690;
    begin
        with CashierTrans do begin

            Temp.Get(UserId);
            GenSetup.Get;


            Jtemplate := Temp."Cheque Discounting Template";
            JBatch := Temp."Cheque Discounting Batch";


            if Jtemplate = '' then begin
                Error(Text0001);
            end;

            if JBatch = '' then begin
                Error(Text0002);
            end;

            if Type <> Type::"Cheque Deposit" then
                Error('You can only discount cheques.');

            if "Cheque Status" <> "cheque status"::Pending then
                Error('Cheque already processed.');

            if "Discounting Amount" < 1 then
                Error('Please enter the amount you want to discount.');


            if Confirm('Are you sure you want to discount this cheque?', true) = false then
                exit;

            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", Jtemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            GenJournalLine.DeleteAll;


            Loans.Reset;
            Loans.SetRange(Loans.Remarks, No);
            Loans.SetRange(Loans."Member No.", "Member No.");
            Loans.SetRange(Loans.Posted, false);
            if Loans.Find('-') then
                Loans.DeleteAll;




            Loans."Loan No." := '';
            Loans."Member No." := "Member No.";
            Loans."Disbursement Account No" := "Account No";

            //fetch Cheque Discounting Product
            ProdF.Reset;
            ProdF.SetRange(ProdF."Type of Discounting", ProdF."type of discounting"::"Cheque Discounting");
            ProdF.SetRange(ProdF."Product Class Type", ProdF."product class type"::Loan);
            if ProdF.Find('-') then begin
                Loans."Loan Product Type" := ProdF."Product ID";
                AcctsNo := ProdF."Account No. Prefix" + "Member No.";
            end;
            //fetch Cheque Discounting Product

            if Accounts.Get(AcctsNo) = false then begin
                AcctsNo := LoanProcess."CreateLoan Account"("Member No.", ProdF."Product ID");

                Loans."Loan Account" := AcctsNo;
            end else
                Loans."Loan Account" := AcctsNo;
            Loans."Application Date" := Today;
            Loans.Interest := ProdF."Interest Rate (Min.)";
            Loans."Requested Amount" := "Discounting Amount";
            Loans."Approved Amount" := "Discounting Amount";
            Loans.Status := Loans.Status::Approved;
            Loans."Disbursement Date" := Today;
            Loans.Remarks := No;
            Loans.Insert(true);



            Loans.Reset;
            Loans.SetRange(Loans.Remarks, No);
            Loans.SetRange(Loans."Member No.", "Member No.");
            Loans.SetRange(Loans.Posted, false);
            if Loans.Find('-') then begin

                LineNo := LineNo + 10000;

                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := Jtemplate;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Document No." := Loans."Loan No.";
                GenJournalLine."Posting Date" := Today;
                GenJournalLine."External Document No." := No;
                GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Credit;
                GenJournalLine."Account No." := Loans."Loan Account";
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine.Description := 'Principle Amount';
                GenJournalLine.Amount := "Discounting Amount";
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                GenJournalLine."Loan No" := Loans."Loan No.";
                GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;


                Loans.Posted := true;
                Loans.Modify;

                //Discount
                LineNo := LineNo + 10000;

                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := Jtemplate;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Document No." := Loans."Loan No.";
                GenJournalLine."Posting Date" := Today;
                GenJournalLine."External Document No." := "Cheque No";
                GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Savings;
                GenJournalLine."Account No." := "Account No";
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine.Description := 'Discounted Cheque';
                GenJournalLine.Amount := -"Discounting Amount";
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

                //Discounting Commision
                LineNo := LineNo + 10000;

                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := Jtemplate;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Document No." := Loans."Loan No.";
                GenJournalLine."Posting Date" := Today;
                GenJournalLine."External Document No." := "Cheque No";
                GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Savings;
                GenJournalLine."Account No." := "Account No";
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine.Description := 'Discounting Commission';
                GenJournalLine.Amount := ROUND("Discounting Amount" * (Loans.Interest / 100), 0.01, '>');
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;


                //Interest
                LineNo := LineNo + 10000;

                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := Jtemplate;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                GenJournalLine."Account No." := Loans."Loan Account";
                GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Due";
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Document No." := Loans."Loan No.";
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'Interest Due';
                GenJournalLine.Amount := ROUND("Discounting Amount" * (Loans.Interest / 100), 0.01, '>');
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                if ProdType.Get(Loans."Loan Product Type") then
                    GenJournalLine."Bal. Account No." := ProdType."Loan Receivable Account[G/L]";
                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                GenJournalLine."Loan No" := Loans."Loan No.";
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;


                LineNo := LineNo + 10000;

                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := Jtemplate;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Document No." := Loans."Loan No.";
                GenJournalLine."Posting Date" := Today;
                GenJournalLine."External Document No." := No;
                GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Credit;
                GenJournalLine."Account No." := Loans."Loan Account";
                ;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine.Description := 'Interest Paid';
                GenJournalLine.Amount := -ROUND("Discounting Amount" * (Loans.Interest / 100), 0.01, '>');
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                GenJournalLine."Loan No" := Loans."Loan No.";
                GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;




                //Post New
                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                if GenJournalLine.Find('-') then begin
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                end;
                //Post New

                "Discounted Amount" := "Discounted Amount" + "Discounting Amount";
                "Discounting Amount" := 0;
                Modify;

            end;
        end;
    end;

    local procedure PostLien(CashierTrans: Record 52185776)
    var
        GenSetup: Record 52185689;
        Acc: Record 52185730;
        BankSetup: Record 52185782;
        BankAccount: Record "Bank Account";
        CurrentTellerAmount: Decimal;
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        TCharges: Decimal;
        TransactionCharges: Record 52185774;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        TChargeAmount: Decimal;
        Account: Record 52185730;
        AccountTypes: Record 52185690;
        Text0001: label 'This account has been blocked from receiving payments.';
        Text0002: label 'You need to add more money from the treasury since your balance has gone below the teller replenishing level.';
        Text0003: label 'You do not have enough money to carry out this transaction.';
        Text0004: label 'You need to transfer money back to the treasury since your balance has gone above the teller maximum withholding.';
        Text0005: label 'You need to transfer money back to the treasury since your balance has gone above the teller maximum withholding.';
        Text0006: label 'You cannot withdraw more than your allowed limit of %1 unless authorised.';
        Text0007: label 'You cannot withdraw more than the available balance unless authorised.';
        Text0008: label 'You cannot deposit more than your allowed limit of %1 unless authorised.';
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        Trans: Record 52185776;
        ProdType: Record 52185690;
        TransType: Record 52185773;
    begin

        with CashierTrans do begin

            if Confirm('Are you sure you want to place lien on this account? ', false) = true then begin

                Posted := true;
                "Date Posted" := Today;
                "Time Posted" := Time;
                "Posted By" := UserId;
                Modify;

                Message('Lien placed successfully');
            end;
        end;
    end;


    procedure ClearLien()
    var
        Transactions: Record 52185776;
        GenJournalLine: Record "Gen. Journal Line";
        Text0001: label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
        TCharges: Decimal;
        TransactionCharges: Record 52185774;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        TChargeAmount: Decimal;
        Loans: Record 52185729;
    begin
        Temp.Get(UserId);
        GenSetup.Get;


        Jtemplate := Temp."Cashier Journal Template";
        JBatch := Temp."Cashier Journal Batch";


        if Jtemplate = '' then begin
            Error(Text0001);
        end;

        if JBatch = '' then begin
            Error(Text0002);
        end;


        Transactions.Reset;
        Transactions.SetRange(Transactions."Cheque Status", Transactions."cheque status"::Pending);
        Transactions.SetRange(Transactions.Type, Transactions.Type::Lien);
        if Transactions.Find('-') then begin
            repeat

                if Transactions."Expected Maturity Date" <= Today then begin


                    Transactions."Cheque Status" := Transactions."cheque status"::Honoured;
                    Transactions."Date Cleared" := Today;
                    Transactions."Cleared By" := UserId;
                    Transactions.Modify;

                end;

            until Transactions.Next = 0;
        end;
    end;


    procedure PostBankChequeCharges(BankCheque: Record 52185785)
    var
        TCharges: Decimal;
        TransactionCharges: Record 52185774;
        LineNo: Integer;
        TariffDetails: Record 52185777;
        ChargeAmount: Decimal;
        GenJournalLine: Record "Gen. Journal Line";
        Text0001: label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
        AvailBal: Decimal;
        MinBalance: Decimal;
        Account: Record 52185730;
        ProdType: Record 52185690;
        Vend: Record 52185730;
        MobNo: Code[20];
        Text0003: label 'Your account has insufficient funds to cater for cheque book charges ';
    begin
        with BankCheque do begin

            Temp.Get(UserId);
            GenSetup.Get;


            Jtemplate := Temp."Cashier Journal Template";
            JBatch := Temp."Cashier Journal Batch";


            if Jtemplate = '' then begin
                Error(Text0001);
            end;

            if JBatch = '' then begin
                Error(Text0002);
            end;



            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", Jtemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            GenJournalLine.DeleteAll;
            //Charges
            TCharges := 0;

            TransactionCharges.Reset;
            TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
            if TransactionCharges.Find('-') then begin
                repeat

                    if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::Normal) or
                    (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::"Stamp Duty") then begin

                        LineNo := LineNo + 10000;

                        ChargeAmount := 0;
                        //IF TransactionCharges."Charge Type"=TransactionCharges."Charge Type"::"% of Amount" = TRUE THEN
                        //ChargeAmount:=(Amount*TransactionCharges."Percentage of Amount")*0.01
                        //ELSE
                        ChargeAmount := TransactionCharges."Charge Amount";

                        /*
                        IF TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered THEN BEGIN

                        TransactionCharges.TESTFIELD(TransactionCharges."Staggered Charge Code");

                        TariffDetails.RESET;
                        TariffDetails.SETRANGE(TariffDetails.Code,TransactionCharges."Staggered Charge Code");
                        IF TariffDetails.FIND('-') THEN BEGIN
                        REPEAT
                        IF (Amount >= TariffDetails."Lower Limit") AND (Amount <= TariffDetails."Upper Limit") THEN BEGIN
                        IF TariffDetails."Use Percentage"=TRUE THEN BEGIN
                          ChargeAmount:=Amount*TariffDetails.Percentage*0.01;
                        END ELSE BEGIN
                        ChargeAmount := TariffDetails."Charge Amount";
                        END;
                        END;
                        UNTIL TariffDetails.NEXT =0;
                        END;
                        END;
                        */

                        //cheque available balance
                        AvailBal := 0;
                        MinBalance := 0;

                        if Account.Get("Account No.") then begin
                            Account.CalcFields(Account.Balance, Account."Uncleared Cheques", Account."Authorised Over Draft", Account."Lien Placed");

                            ProdType.Reset;
                            ProdType.SetRange(ProdType."Product ID", Account."Product Type");
                            if ProdType.Find('-') then begin
                                MinBalance := ProdType."Minimum Balance";

                                AvailBal := (Account.Balance + Account."Authorised Over Draft") - (MinBalance + Account."Uncleared Cheques" + Account."Lien Placed");

                                if AvailBal < ChargeAmount then
                                    Error('The transaction will result in overdrawing account %1', "Account No.");
                                MobNo := '';

                                if Vend.Get("Account No.") then begin
                                    MobNo := Vend."Transactional Mobile No";
                                end;


                                SendSMS.SendSms(Sourcetype::"Chq Book", MobNo, Text0003 + Format(Today) + ' ' + Format(Time)
                                + ' ' + COMPANYNAME, "No.", "No.", false);

                            end;
                        end;
                        //cheque available balance


                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := Jtemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Document No." := "No.";
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                        GenJournalLine."Account No." := "Account No.";
                        GenJournalLine."External Document No." := "ID No.";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Posting Date" := Today;
                        GenJournalLine.Description := TransactionCharges.Description;
                        //GenJournalLine."Currency Code":="Currency Code";
                        //GenJournalLine.VALIDATE(GenJournalLine."Currency Code");
                        GenJournalLine.Amount := ChargeAmount;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                        GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
                        GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                        //GenJournalLine."Shortcut Dimension 1 Code":=DActivity;
                        //GenJournalLine."Shortcut Dimension 2 Code":=DBranch;
                        //GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                        //GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;


                        //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                        if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
                          (TransactionCharges."Recover Excise Duty" = true) then begin


                            //Excise Duty

                            LineNo := LineNo + 10000;

                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := Jtemplate;
                            GenJournalLine."Journal Batch Name" := JBatch;
                            GenJournalLine."Document No." := "No.";
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := "Account No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Posting Date" := Today;//"Transaction Date";
                            GenJournalLine.Description := 'Excise Duty';
                            //GenJournalLine."Currency Code":="Currency Code";
                            //GenJournalLine.VALIDATE(GenJournalLine."Currency Code");
                            GenJournalLine.Amount := (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
                            GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                            //GenJournalLine."Shortcut Dimension 1 Code":=DActivity;
                            //GenJournalLine."Shortcut Dimension 2 Code":=DBranch;
                            //GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                            //GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;


                        end;
                    end;
                until TransactionCharges.Next = 0;
            end;

            //Post New
            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", Jtemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            if GenJournalLine.Find('-') then begin
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
            end;
            //Post New


            "Cheque Book charges Posted" := true;
            Modify;

            Message('Charges posted successfully');

        end;

    end;

    local procedure "**********Salary Processing***********"()
    begin
    end;


    procedure PostSalary(SalHeaD: Record 52185783)
    var
        SalLines: Record 52185784;
        GenJournalLine: Record "Gen. Journal Line";
        Temp: Record 52185782;
        Jtemplate: Code[20];
        JBatch: Code[20];
        Text0001: label 'Ensure the Salary  Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Salary Journal Batch is set up in Banking User Setup';
        Text0003: label 'Ensure the Default Bank is set up in User Setup';
        Text0004: label 'The transaction has already been posted.';
        RunBal: Decimal;
        Gensetup: Record 52185689;
        LineNo: Integer;
        PDate: Date;
        DocNo: Code[20];
        PostingRemarks: Text[50];
        DActivity2: Code[20];
        DBranch2: Code[20];
        Account: Record 52185730;
        AvailableBal: Decimal;
        ProductF: Record 52185690;
        SalFee: Decimal;
        SalProcessingHeader: Record 52185783;
        SalGLAccount: Code[20];
        TCharges: Decimal;
        TransactionCharges: Record 52185774;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        MemberNo: Code[20];
        Salaccno: Code[20];
        Text0005: label 'Your Salary of Kes ';
        Text0006: label ' has been credited to your FOSA  account ';
        Text0007: label ' on ';
        SavingsLedgerEntry: Record 52185732;
        Text0008: Text;
    begin
        with SalHeaD do begin

            //Cyrus
            if Posted = true then
                Error(Text0004);

            /*IF Status<>Status::Approved THEN
            ERROR('The document is not fully approved');*/

            Temp.Get(UserId);
            Jtemplate := Temp."Salary Journal Template";
            JBatch := Temp."Salary Journal Batch";

            if Jtemplate = '' then begin
                Error(Text0001);
            end;

            if JBatch = '' then begin
                Error(Text0002);
            end;

            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", Jtemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            GenJournalLine.DeleteAll;

            CalcFields("Total Count", "Scheduled Amount");

            RunBal := 0;

            Gensetup.Get;

            LineNo := LineNo + 10000;
            //TotSal:=TotSal+SalLines.Amount;
            TestField(Remarks);
            TestField("Document No");
            TestField("Posting date");
            TestField(Amount);
            if "Scheduled Amount" <> Amount then
                Error('Scheduled amount and Amount must be the same');

            PDate := "Posting date";
            DocNo := "Document No";
            PostingRemarks := Remarks;
            if Confirm('Are you sure you want to post Salaries?', false) = false then
                exit;



            //Check Posted
            SalLines.Reset;
            SalLines.SetRange(SalLines."Salary Header No.", No);
            SalLines.SetRange(Posted, false);
            if SalLines.Find('-') then begin
                repeat
                    SavingsLedgerEntry.Reset;
                    SavingsLedgerEntry.SetRange("Document No.", No);
                    SavingsLedgerEntry.SetRange("Posting Date", PDate);
                    SavingsLedgerEntry.SetRange("Customer No.", SalLines."Account No.");
                    if SavingsLedgerEntry.Find('-') then begin
                        SalLines.Posted := true;

                    end else
                        SalLines.Posted := false;
                    SalLines.Modify;
                until SalLines.Next = 0;
            end;
            //Check Posted

            SalLines.Reset;
            SalLines.SetRange(SalLines."Salary Header No.", No);
            SalLines.SetRange(Posted, false);
            //SalLines.SETRANGE("Account No.",'5050050386000');
            if SalLines.Find('-') then begin
                repeat

                    MemberNo := '';
                    Salaccno := '';

                    MemberNo := SalLines."Member No.";
                    Salaccno := SalLines."Account No.";

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                    GenJournalLine.SetRange("Journal Batch Name", JBatch);
                    GenJournalLine.DeleteAll;

                    if Account.Get(SalLines."Account No.") then begin

                        DActivity2 := Account."Global Dimension 1 Code";
                        DBranch2 := Account."Global Dimension 2 Code";

                        //Check Account Bal
                        AvailableBal := 0;
                        Account.CalcFields(Account.Balance, Account."Authorised Over Draft", Account."Uncleared Cheques");

                        AvailableBal := ((Account.Balance + Account."Authorised Over Draft") - (Account."ATM Transactions" + Account."Uncleared Cheques"));
                        if ProductF.Get(Account."Product Type") then
                            AvailableBal := AvailableBal - ProductF."Minimum Balance";

                        RunBal := AvailableBal + SalLines.Amount;
                        //RunBal:=SalLines.Amount;

                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := Jtemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Document No." := CopyStr(DocNo, 1, 14);
                        //GenJournalLine."External Document No.":=SalLines."Branch Reff.";
                        GenJournalLine."Posting Date" := PDate;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                        GenJournalLine."Account No." := SalLines."Account No.";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine.Description := PostingRemarks;//'Salary';//COPYSTR(Remarks,20);//'Salary';
                                                                     //GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::Customer;
                                                                     //GenJournalLine."Bal. Account No.":=SalProcessingHeader."Account No";
                                                                     //GenJournalLine.VALIDATE(GenJournalLine."Bal. Account No.");
                        GenJournalLine.Amount := -SalLines.Amount;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Shortcut Dimension 1 Code" := DActivity2;
                        GenJournalLine."Shortcut Dimension 2 Code" := DBranch2;
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := Jtemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;//USERID;
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Document No." := CopyStr(DocNo, 1, 14);
                        //GenJournalLine."External Document No.":=SalLines."Branch Reff.";
                        GenJournalLine."Posting Date" := PDate;
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine.Description := PostingRemarks;//'Salary';
                        GenJournalLine."Account Type" := "Account Type";
                        if SalProcessingHeader.Get(SalLines."Salary Header No.") then begin
                            GenJournalLine."Account No." := SalProcessingHeader."Account No";
                        end;
                        GenJournalLine.Amount := SalLines.Amount;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Shortcut Dimension 1 Code" := DActivity2;
                        GenJournalLine."Shortcut Dimension 2 Code" := DBranch2;
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                        //Charges
                        TCharges := 0;
                        TransactionCharges.Reset;
                        TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                        if TransactionCharges.Find('-') then begin
                            repeat
                                LineNo := LineNo + 10000;
                                ChargeAmount := 0;
                                if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                                    ChargeAmount := (Amount * TransactionCharges."Percentage of Amount") * 0.01
                                else
                                    ChargeAmount := TransactionCharges."Charge Amount";
                                if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin
                                    TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
                                    TariffDetails.Reset;
                                    TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                    if TariffDetails.Find('-') then begin
                                        repeat
                                            if (Amount >= TariffDetails."Lower Limit") and (Amount <= TariffDetails."Upper Limit") then begin
                                                if TariffDetails."Use Percentage" = true then begin
                                                    ChargeAmount := Amount * TariffDetails.Percentage * 0.01;
                                                end else begin
                                                    ChargeAmount := TariffDetails."Charge Amount";
                                                end;
                                            end;
                                        until TariffDetails.Next = 0;
                                    end;
                                end;

                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Journal Batch Name" := JBatch;
                                GenJournalLine."Document No." := CopyStr(DocNo, 1, 14);
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := SalLines."Account No.";
                                //GenJournalLine."External Document No.":="ID No";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := PDate;
                                GenJournalLine.Description := TransactionCharges.Description;
                                GenJournalLine.Validate(GenJournalLine."Currency Code");
                                GenJournalLine.Amount := ChargeAmount;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := DActivity2;
                                GenJournalLine."Shortcut Dimension 2 Code" := DBranch2;
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;
                                RunBal := RunBal - GenJournalLine.Amount;

                                //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                                if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
                                (TransactionCharges."Recover Excise Duty" = true) then begin
                                    //Excise Duty
                                    LineNo := LineNo + 10000;
                                    GenJournalLine.Init;
                                    GenJournalLine."Journal Template Name" := Jtemplate;
                                    GenJournalLine."Journal Batch Name" := JBatch;
                                    GenJournalLine."Document No." := CopyStr(DocNo, 1, 14);
                                    GenJournalLine."Line No." := LineNo;
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                    GenJournalLine."Account No." := SalLines."Account No.";
                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                    GenJournalLine."Posting Date" := PDate;
                                    GenJournalLine.Description := 'Excise Duty';
                                    GenJournalLine.Validate(GenJournalLine."Currency Code");
                                    GenJournalLine.Amount := (ChargeAmount * Gensetup."Excise Duty (%)") * 0.01;
                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                    GenJournalLine."Bal. Account No." := Gensetup."Excise Duty G/L";
                                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                    GenJournalLine."Shortcut Dimension 1 Code" := DActivity2;
                                    GenJournalLine."Shortcut Dimension 2 Code" := DBranch2;
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                    if GenJournalLine.Amount <> 0 then
                                        GenJournalLine.Insert;
                                    RunBal := RunBal - GenJournalLine.Amount;

                                    TCharges := TCharges + ChargeAmount;
                                end;
                            until TransactionCharges.Next = 0;
                        end;

                        //--Activate Dormant.
                        ActivateDormant(SalHeaD, DocNo, PDate, DActivity2, DBranch2, Jtemplate, JBatch, RunBal, MemberNo, LineNo, Salaccno);

                        if "Donnot Recover" = false then
                            PostSalaryLoans(SalHeaD, DocNo, PDate, DActivity2, DBranch2, Jtemplate, JBatch, RunBal, MemberNo, LineNo, Salaccno);

                        if Account.Get(SalLines."Account No.") then begin
                            Account."Loan Disbursement Account" := true;
                            Account.Modify;
                        end;

                        /*GenJournalLine.RESET;
                        GenJournalLine.SETRANGE("Journal Template Name",Jtemplate);
                        GenJournalLine.SETRANGE("Journal Batch Name",JBatch);
                        IF GenJournalLine.FIND('-') THEN BEGIN
                        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post New",GenJournalLine);
                        END;

                        SalLines.Posted:=TRUE;
                        SalLines."Posted By":=USERID;
                        SalLines.MODIFY;
                        COMMIT;*///*
                    end;

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                    GenJournalLine.SetRange("Journal Batch Name", JBatch);
                    if GenJournalLine.Find('-') then begin
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                    end;

                    SalLines.Posted := true;
                    SalLines."Posted By" := UserId;
                    SalLines."Posting Date" := Today;
                    SalLines."Posting Time" := Time;
                    SalLines.Modify;
                    Commit;//*
                    Gensetup.Get();
                    if Gensetup."Disable Salary SMS" = false then begin
                        if Account.Get(SalLines."Account No.") then begin
                            Text0008 := Gensetup."Salary SMS Suffix";
                            SendSMS.SendSms(Sourcetype::"Salary Processing", Account."Transactional Mobile No", Text0005 + Format(SalLines.Amount) + Text0006
                            + Text0007 + SkyMbanking.ddMMyyyy(Today) + ' ' + Format(Time) + ' ' + Text0008, SalLines."Account No.", SalLines."Account No.", false);

                        end;
                    end;

                until SalLines.Next = 0;
            end;

            Posted := true;
            "Posted By" := UserId;

            Modify;




            Message('The salary batch has been posted successfully');

        end;

    end;

    local procedure PostSalaryLoans(SalHeaD: Record 52185783; DocNo: Code[20]; PDate: Date; DActivity2: Code[20]; DBranch2: Code[20]; Jtemplate: Code[20]; Jbatch: Code[20]; RunBal: Decimal; MemberNo: Code[20]; LineNo: Integer; Salaccno: Code[20])
    var
        Loans: Record 52185729;
        Interest: Decimal;
        GenJournalLine: Record "Gen. Journal Line";
        LRepayment: Decimal;
        SalLines: Record 52185784;
        CreditLedger: Record 52185733;
        ProductType: Record 52185690;
        StandingOrdSRegister: Record 52185719;
    begin
        with SalHeaD do begin

            Loans.Reset;
            Loans.SetRange(Loans."Member No.", MemberNo);
            Loans.SetRange(Loans."Disbursement Date", 0D, "Last Loan Issue Date");
            Loans.SetRange(Loans."Recovery Mode", Loans."recovery mode"::Salary);
            if Loans.Find('-') then begin
                repeat

                    if RunBal > 0 then begin
                        Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", Loans."Outstanding Bills");
                        if Loans."Outstanding Bills" >= 0 then begin
                            if Loans."Outstanding Interest" > 0 then begin
                                Interest := 0;
                                //Interest:=Loans."Outstanding Interest";
                                if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Straight Line" then
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
                                    GenJournalLine."Journal Template Name" := Jtemplate;
                                    GenJournalLine."Journal Batch Name" := Jbatch;
                                    GenJournalLine."Line No." := LineNo;
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                    GenJournalLine."Account No." := Loans."Loan Account";
                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                    GenJournalLine."Document No." := CopyStr(DocNo, 1, 14);
                                    GenJournalLine."Posting Date" := PDate;
                                    GenJournalLine.Description := 'Interest Paid';
                                    if RunBal > Interest then
                                        GenJournalLine.Amount := Interest * -1
                                    else
                                        GenJournalLine.Amount := RunBal * -1;
                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                    GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                                    GenJournalLine."Loan No" := Loans."Loan No.";
                                    GenJournalLine."Shortcut Dimension 1 Code" := DActivity2;
                                    GenJournalLine."Shortcut Dimension 2 Code" := DBranch2;
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                    if GenJournalLine.Amount <> 0 then
                                        GenJournalLine.Insert;

                                    LineNo := LineNo + 10000;
                                    GenJournalLine.Init;
                                    GenJournalLine."Journal Template Name" := Jtemplate;
                                    GenJournalLine."Journal Batch Name" := Jbatch;
                                    GenJournalLine."Line No." := LineNo;
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                    GenJournalLine."Account No." := Salaccno;
                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                    GenJournalLine."Document No." := CopyStr(DocNo, 1, 14);
                                    GenJournalLine."Posting Date" := PDate;
                                    GenJournalLine.Description := PadStr('Interest Paid -  - ' + Loans."Loan Product Type Name", 50);
                                    if RunBal > Interest then
                                        GenJournalLine.Amount := Interest
                                    else
                                        GenJournalLine.Amount := RunBal;
                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                    GenJournalLine."Loan No" := Loans."Loan No.";
                                    GenJournalLine."Shortcut Dimension 1 Code" := DActivity2;
                                    GenJournalLine."Shortcut Dimension 2 Code" := DBranch2;
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
                                /*
                                  //cater for first time loans being recovered before billing
                                  CreditLedger.RESET;
                                  CreditLedger.SETRANGE(CreditLedger."Loan No",Loans."Loan No.");
                                  CreditLedger.SETRANGE(CreditLedger."Transaction Type",CreditLedger."Transaction Type"::Bills);
                                  IF CreditLedger.FIND('-') = FALSE THEN BEGIN


                                  LRepayment:=0;
                                  //
                                  IF Loans.Interest=0 THEN BEGIN
                                   LRepayment:=Loans.Repayment;
                                  END  ELSE
                                  LRepayment:=Loans.Repayment-Interest;
                                  //ERROR('Repayment %1',LRepayment);

                                  IF LRepayment > 0 THEN BEGIN
                                  IF LRepayment > Loans."Outstanding Balance" THEN
                                  LRepayment:=Loans."Outstanding Balance";

                                  LineNo:=LineNo+10000;
                                  GenJournalLine.INIT;
                                  GenJournalLine."Journal Template Name":=Jtemplate;
                                  GenJournalLine."Journal Batch Name":=Jbatch;
                                  GenJournalLine."Line No.":=LineNo;
                                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::Credit;
                                  GenJournalLine."Account No.":=Loans."Loan Account";
                                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                  GenJournalLine."Document No.":=COPYSTR(DocNo,1,14);
                                  GenJournalLine."Posting Date":=PDate;
                                  GenJournalLine.Description:='Loan Repayment';
                                  IF RunBal > LRepayment THEN
                                  GenJournalLine.Amount:=LRepayment*-1
                                  ELSE
                                  GenJournalLine.Amount:=RunBal*-1;
                                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                  GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::Repayment;
                                  GenJournalLine."Loan No":=Loans."Loan No.";
                                  GenJournalLine."Shortcut Dimension 1 Code":=DActivity2;
                                  GenJournalLine."Shortcut Dimension 2 Code":=DBranch2;
                                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                  IF GenJournalLine.Amount<>0 THEN
                                  GenJournalLine.INSERT;


                                  IF ProductType.GET(Loans."Loan Product Type") THEN BEGIN

                                  //post bill entry
                                  LineNo:=LineNo+10000;
                                  GenJournalLine.INIT;
                                  GenJournalLine."Journal Template Name":=Jtemplate;
                                  GenJournalLine."Journal Batch Name":=Jbatch;
                                  GenJournalLine."Line No.":=LineNo;
                                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::Credit;
                                  GenJournalLine."Account No.":=Loans."Loan Account";
                                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                  GenJournalLine."Document No.":=COPYSTR(DocNo,1,14);
                                  GenJournalLine."Posting Date":=PDate;
                                  GenJournalLine.Description:='Bill Repayment';
                                  IF RunBal > LRepayment THEN
                                  GenJournalLine.Amount:=LRepayment*-1
                                  ELSE
                                  GenJournalLine.Amount:=RunBal*-1;
                                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                  GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::Bills;
                                  GenJournalLine."Loan No":=Loans."Loan No.";
                                  GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::"G/L Account";
                                  GenJournalLine."Bal. Account No.":=ProductType."Billed Account";
                                  GenJournalLine."Shortcut Dimension 1 Code":=DActivity2;
                                  GenJournalLine."Shortcut Dimension 2 Code":=DBranch2;
                                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                  IF GenJournalLine.Amount<>0 THEN
                                  GenJournalLine.INSERT;
                                  //post bill entry


                                  END;




                                  LineNo:=LineNo+10000;
                                  GenJournalLine.INIT;
                                  GenJournalLine."Journal Template Name":=Jtemplate;
                                  GenJournalLine."Journal Batch Name":=Jbatch;
                                  GenJournalLine."Line No.":=LineNo;
                                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::Savings;
                                  GenJournalLine."Account No.":=Salaccno;
                                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                  GenJournalLine."Document No.":=COPYSTR(DocNo,1,14);
                                  GenJournalLine."Posting Date":=PDate;
                                  GenJournalLine.Description:='Loan Repayment - ' + Loans."Loan Product Type";
                                  IF RunBal > LRepayment THEN
                                  GenJournalLine.Amount:=LRepayment
                                  ELSE
                                  GenJournalLine.Amount:=RunBal;
                                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                  GenJournalLine."Loan No":=Loans."Loan No.";
                                  GenJournalLine."Shortcut Dimension 1 Code":=DActivity2;
                                  GenJournalLine."Shortcut Dimension 2 Code":=DBranch2;
                                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                  IF GenJournalLine.Amount<>0 THEN
                                  GenJournalLine.INSERT;
                                  RunBal:=RunBal-GenJournalLine.Amount;



                                    END;
                                    END;

                                  //cater for first time loans being recovered before billing
                                  */
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
                                    GenJournalLine."Journal Template Name" := Jtemplate;
                                    GenJournalLine."Journal Batch Name" := Jbatch;
                                    GenJournalLine."Line No." := LineNo;
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                    GenJournalLine."Account No." := Loans."Loan Account";
                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                    GenJournalLine."Document No." := CopyStr(DocNo, 1, 14);
                                    GenJournalLine."Posting Date" := PDate;
                                    GenJournalLine.Description := 'Loan Repayment';
                                    if RunBal > LRepayment then
                                        GenJournalLine.Amount := LRepayment * -1
                                    else
                                        GenJournalLine.Amount := RunBal * -1;
                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                    GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Repayment;
                                    GenJournalLine."Loan No" := Loans."Loan No.";
                                    GenJournalLine."Shortcut Dimension 1 Code" := DActivity2;
                                    GenJournalLine."Shortcut Dimension 2 Code" := DBranch2;
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                    if GenJournalLine.Amount <> 0 then
                                        GenJournalLine.Insert;


                                    if ProductType.Get(Loans."Loan Product Type") then begin

                                        //post bill entry
                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := Jtemplate;
                                        GenJournalLine."Journal Batch Name" := Jbatch;
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                        GenJournalLine."Account No." := Loans."Loan Account";
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := CopyStr(DocNo, 1, 14);
                                        GenJournalLine."Posting Date" := PDate;
                                        GenJournalLine.Description := 'Bill Repayment';
                                        if RunBal > LRepayment then
                                            GenJournalLine.Amount := LRepayment * -1
                                        else
                                            GenJournalLine.Amount := RunBal * -1;
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                                        GenJournalLine."Loan No" := Loans."Loan No.";
                                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                        GenJournalLine."Bal. Account No." := ProductType."Billed Account";
                                        GenJournalLine."Shortcut Dimension 1 Code" := DActivity2;
                                        GenJournalLine."Shortcut Dimension 2 Code" := DBranch2;
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;
                                        //post bill entry


                                    end;




                                    LineNo := LineNo + 10000;
                                    GenJournalLine.Init;
                                    GenJournalLine."Journal Template Name" := Jtemplate;
                                    GenJournalLine."Journal Batch Name" := Jbatch;
                                    GenJournalLine."Line No." := LineNo;
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                    GenJournalLine."Account No." := Salaccno;
                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                    GenJournalLine."Document No." := CopyStr(DocNo, 1, 14);
                                    GenJournalLine."Posting Date" := PDate;
                                    GenJournalLine.Description := PadStr('Loan Repayment - ' + Loans."Loan Product Type Name", 50);
                                    if RunBal > LRepayment then
                                        GenJournalLine.Amount := LRepayment
                                    else
                                        GenJournalLine.Amount := RunBal;
                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                    GenJournalLine."Loan No" := Loans."Loan No.";
                                    GenJournalLine."Shortcut Dimension 1 Code" := DActivity2;
                                    GenJournalLine."Shortcut Dimension 2 Code" := DBranch2;
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
        /*
        StandingOrdSRegister.RESET;
        StandingOrdSRegister.SETRANGE("Source Account No.",Salaccno);
        StandingOrdSRegister.SETRANGE("Deduction Status",StandingOrdSRegister."Deduction Status"::Successfull);
        StandingOrdSRegister.SETRANGE("Date Processed",CALCDATE('-5D',PDate),PDate);
        IF NOT StandingOrdSRegister.FIND('-') THEN
        */
        PostSalarySTO(SalHeaD, DocNo, PDate, DActivity2, DBranch2, Jtemplate, Jbatch, RunBal, MemberNo, LineNo, Salaccno);

    end;

    local procedure PostSalarySTO(SalHeaD: Record 52185783; DocNo: Code[20]; PDate: Date; DActivity2: Code[20]; DBranch2: Code[20]; Jtemplate: Code[20]; Jbatch: Code[20]; RunBal: Decimal; MemberNo: Code[20]; LineNo: Integer; Salaccno: Code[20])
    var
        StandingOrderHeader: Record 52185717;
        SavingsAccounts: Record 52185730;
        ProductFactory: Record 52185690;
        AvailableBal: Decimal;
        GenJournalLine: Record "Gen. Journal Line";
        BalAccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        StandingOrdDeductStatus: Option " ",Successfull,"Partial Deduction",Failed;
        StandingOrdSRegister: Record 52185719;
        TCharges: Decimal;
        SalLines: Record 52185784;
        STOHeaderNo: Code[20];
        StandingOrderLines: Record 52185718;
        LoanApps: Record 52185729;
        LoanInterest: Decimal;
        LoanPrinciple: Decimal;
        STOHead: Record 52185717;
        STOlinesname: Text[80];
        TransactionCharges: Record 52185774;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        TChargeAmount: Decimal;
        AmountDedu: Decimal;
        LoanPrincipal: Decimal;
        LoanRepayment: Decimal;
        TransTypes: Record 52185773;
        DeductedSTO: Decimal;
        STR: Date;
        SkipSTO: Boolean;
    begin
        with SalHeaD do begin

            GenSetup.Get;

            StandingOrderHeader.Reset;
            StandingOrderHeader.SetCurrentkey(StandingOrderHeader."No.");
            StandingOrderHeader.SetRange(StandingOrderHeader."Member No.", MemberNo);
            StandingOrderHeader.SetRange(StandingOrderHeader.Status, StandingOrderHeader.Status::Approved);
            StandingOrderHeader.SetFilter(StandingOrderHeader."Income Type", '=%1|=%2', StandingOrderHeader."income type"::Salary, StandingOrderHeader."income type"::Pension);
            if StandingOrderHeader.Find('-') then begin //*Header Info

                repeat
                    SkipSTO := false;
                    STR := (CalcDate('-5D', PDate));

                    //For non partial
                    StandingOrdSRegister.Reset;
                    StandingOrdSRegister.SetCurrentkey("Date Processed", "No.");
                    StandingOrdSRegister.SetRange("Document No.", StandingOrderHeader."No.");
                    StandingOrdSRegister.SetRange("Deduction Status", StandingOrdSRegister."deduction status"::Successful);
                    if StandingOrdSRegister.FindLast then begin
                        if (StandingOrdSRegister."Date Processed" >= STR) and (StandingOrdSRegister."Date Processed" <= PDate) then
                            SkipSTO := true;
                    end;

                    //Taking into consideration double salary for partial
                    StandingOrdSRegister.Reset;
                    StandingOrdSRegister.SetCurrentkey("Date Processed", "No.");
                    StandingOrdSRegister.SetRange("Document No.", StandingOrderHeader."No.");
                    StandingOrdSRegister.SetRange("Deduction Status", StandingOrdSRegister."deduction status"::"Partial Deduction");
                    StandingOrdSRegister.SetFilter("Date Processed", '>=%1', STR);
                    if StandingOrdSRegister.FindLast then begin
                        if (StandingOrdSRegister."Date Processed" >= STR) and (StandingOrdSRegister."Date Processed" <= PDate) and (StandingOrdSRegister."Amount Deducted" >= StandingOrderHeader.Amount) then
                            SkipSTO := true;
                    end;
                    if SkipSTO = false then begin
                        STOHeaderNo := '';
                        STOHeaderNo := StandingOrderHeader."No.";
                        //*
                        /*StandingOrdSRegister.RESET;
                        StandingOrdSRegister.SETRANGE(StandingOrdSRegister."Date Processed",TODAY);
                        StandingOrdSRegister.SETRANGE("Document No.",StandingOrderHeader."No.");
                        IF StandingOrdSRegister.FIND('-') THEN
                        StandingOrdSRegister.DELETEALL;*///27.04.2021

                        //*
                        //ERROR(FORMAT(StandingOrderHeader."Allow Partial Deduction"));
                        if not StandingOrderHeader."Allow Partial Deduction" then begin


                            if RunBal < StandingOrderHeader.Amount then begin

                                UpdateStandingOrderRegister('', Today, StandingOrderHeader."No.", '', StandingOrderHeader."Source Account No.", StandingOrderHeader."Source Account Name",
                                                                StandingOrderHeader."Member No.", StandingOrderHeader."Payroll/Staff No.", StandingOrderHeader."Allow Partial Deduction",
                                                                Standingorddeductstatus::Failed, StandingOrderHeader.Amount, 0, StandingOrderHeader."Effective/Start Date", StandingOrderHeader."Duration (Months)",
                                                                StandingOrderHeader."Frequency (Months)", StandingOrderHeader."End Date", StandingOrderHeader.Description, StandingOrderHeader."Transfered to EFT", false, StandingOrderHeader."No.");

                                //Sto Charges on failure
                                GenSetup.Get;


                                TCharges := 0;
                                TransactionCharges.Reset;
                                TransactionCharges.SetRange(TransactionCharges."Transaction Type", StandingOrderHeader."Transaction Type");
                                if TransactionCharges.Find('-') then begin
                                    repeat

                                        if /*(TransactionCharges."Transaction Charge Category"=TransactionCharges."Transaction Charge Category"::Normal) OR*/
                                        (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::"Failed STO Charge") then begin

                                            ChargeAmount := 0;
                                            if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" then
                                                ChargeAmount := (StandingOrderHeader.Amount * TransactionCharges."Percentage of Amount") * 0.01
                                            else
                                                ChargeAmount := TransactionCharges."Charge Amount";

                                            if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin
                                                TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
                                                TariffDetails.Reset;
                                                TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                                if TariffDetails.Find('-') then begin
                                                    repeat
                                                        if (StandingOrderHeader.Amount >= TariffDetails."Lower Limit") and
                                                            (StandingOrderHeader.Amount <= TariffDetails."Upper Limit") then begin
                                                            if TariffDetails."Use Percentage" then
                                                                ChargeAmount := StandingOrderHeader.Amount * TariffDetails.Percentage * 0.01
                                                            else
                                                                ChargeAmount := TariffDetails."Charge Amount";
                                                        end;
                                                    until TariffDetails.Next = 0;
                                                end;
                                            end;

                                            LineNo := LineNo + 10000;

                                            GenJournalLine.Init;
                                            GenJournalLine."Journal Template Name" := Jtemplate;
                                            GenJournalLine."Journal Batch Name" := Jbatch;
                                            GenJournalLine."Line No." := LineNo;
                                            GenJournalLine."Posting Date" := PDate;
                                            GenJournalLine."Document No." := DocNo;
                                            GenJournalLine."External Document No." := StandingOrderHeader."No.";
                                            GenJournalLine."Account Type" := StandingOrderHeader."Source Account Type";
                                            GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderHeader."Source Account No.");
                                            GenJournalLine.Description := TransactionCharges.Description;
                                            GenJournalLine.Validate(GenJournalLine.Amount, ChargeAmount);
                                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                            GenJournalLine.Validate(GenJournalLine."Bal. Account No.", TransactionCharges."G/L Account");
                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                            if GenJournalLine.Amount <> 0 then
                                                GenJournalLine.Insert;


                                            if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
                                                (TransactionCharges."Recover Excise Duty" = true) then begin
                                                //Excise
                                                LineNo := LineNo + 10000;
                                                GenJournalLine.Init;
                                                GenJournalLine."Journal Template Name" := Jtemplate;
                                                GenJournalLine."Journal Batch Name" := Jbatch;
                                                GenJournalLine."Line No." := LineNo;
                                                GenJournalLine."Posting Date" := PDate;
                                                GenJournalLine."Document No." := DocNo;
                                                GenJournalLine."External Document No." := StandingOrderHeader."No.";
                                                GenJournalLine."Account Type" := StandingOrderHeader."Source Account Type";
                                                GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderHeader."Source Account No.");
                                                GenJournalLine.Description := 'Excise Duty';//TransactionCharges.Description;
                                                GenJournalLine.Validate(GenJournalLine.Amount, (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01);
                                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.", GenSetup."Excise Duty G/L");
                                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                                if GenJournalLine.Amount <> 0 then
                                                    GenJournalLine.Insert;
                                                //Excise
                                            end;
                                            TChargeAmount += ChargeAmount;
                                        end;
                                    until TransactionCharges.Next = 0;
                                end;
                                TCharges := TChargeAmount;


                                //Sto Charges on failure
                            end else begin

                                UpdateStandingOrderRegister('', Today, StandingOrderHeader."No.", '', StandingOrderHeader."Source Account No.", StandingOrderHeader."Source Account Name",
                                                                StandingOrderHeader."Member No.", StandingOrderHeader."Payroll/Staff No.", StandingOrderHeader."Allow Partial Deduction",
                                                                Standingorddeductstatus::Successfull, StandingOrderHeader.Amount, StandingOrderHeader.Amount, StandingOrderHeader."Effective/Start Date", StandingOrderHeader."Duration (Months)",
                                                                StandingOrderHeader."Frequency (Months)", StandingOrderHeader."End Date", StandingOrderHeader.Description, StandingOrderHeader."Transfered to EFT", false, StandingOrderHeader."No.");


                                STOlinesname := '';
                                AmountDedu := 0;

                                //*Line Posting
                                StandingOrderLines.Reset;
                                //StandingOrderLines.SETCURRENTKEY("Destination Account Type","Destination Account Type"::Internal);
                                StandingOrderLines.SetRange(StandingOrderLines."Document No.", STOHeaderNo);

                                if StandingOrderLines.Find('-') then begin
                                    repeat
                                        StandingOrderLines.CalcFields("OutStanding Bills");


                                        case StandingOrderLines."Destination Account Type" of
                                            //*Credit Entries
                                            StandingOrderLines."destination account type"::Credit:
                                                begin

                                                    LoanApps.Reset;
                                                    LoanApps.SetRange(LoanApps."Loan No.", StandingOrderLines."Loan No.");
                                                    //LoanApps.SETFILTER(LoanApps."Outstanding Interest",'>0');
                                                    if LoanApps.Find('-') then begin
                                                        LoanApps.CalcFields(LoanApps."Outstanding Interest", LoanApps."Outstanding Balance", "Outstanding Bills");

                                                        LineNo := LineNo + 10000;

                                                        GenJournalLine.Init;
                                                        GenJournalLine."Journal Template Name" := Jtemplate;
                                                        GenJournalLine."Journal Batch Name" := Jbatch;
                                                        GenJournalLine."Line No." := LineNo;
                                                        GenJournalLine."Posting Date" := PDate;
                                                        GenJournalLine."Document No." := DocNo;
                                                        GenJournalLine."External Document No." := StandingOrderHeader."No.";
                                                        GenJournalLine."Account Type" := StandingOrderLines."Destination Account Type";
                                                        GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderLines."Destination Account No.");
                                                        //GenJournalLine.Description:='Destination:-'+LoanApps."Loan No."+'-'+StandingOrderLines."Destination Account Name";
                                                        GenJournalLine.Description := PadStr('STO:-' + LoanApps."Loan No." + '-' + Format(StandingOrderHeader."Source Account Name"), 50);
                                                        if LoanApps."Outstanding Interest" > StandingOrderLines.Amount then begin
                                                            LoanInterest := StandingOrderLines.Amount;
                                                            LoanPrinciple := 0;
                                                        end else begin
                                                            LoanPrinciple := StandingOrderLines.Amount - LoanApps."Outstanding Interest";
                                                            LoanInterest := LoanApps."Outstanding Interest";
                                                        end;
                                                        GenJournalLine.Validate(GenJournalLine.Amount, -LoanInterest);
                                                        GenJournalLine.Validate(GenJournalLine."Loan No", StandingOrderLines."Loan No.");
                                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                                        if GenJournalLine.Amount <> 0 then
                                                            GenJournalLine.Insert;
                                                        RunBal -= Abs(GenJournalLine.Amount);
                                                        AmountDedu += Abs(GenJournalLine.Amount);


                                                        if LoanPrinciple > LoanApps."Outstanding Balance" then
                                                            LoanPrinciple := LoanApps."Outstanding Balance";

                                                        //repayment
                                                        LineNo := LineNo + 10000;

                                                        GenJournalLine.Init;
                                                        GenJournalLine."Journal Template Name" := Jtemplate;
                                                        GenJournalLine."Journal Batch Name" := Jbatch;
                                                        GenJournalLine."Line No." := LineNo;
                                                        GenJournalLine."Posting Date" := PDate;
                                                        GenJournalLine."Document No." := DocNo;
                                                        GenJournalLine."External Document No." := StandingOrderHeader."No.";
                                                        GenJournalLine."Account Type" := StandingOrderLines."Destination Account Type";
                                                        GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderLines."Destination Account No.");
                                                        //GenJournalLine.Description:='Destination:-'+LoanApps."Loan No."+'-'+StandingOrderLines."Destination Account Name";
                                                        GenJournalLine.Description := PadStr('STO:-' + LoanApps."Loan No." + '-' + Format(StandingOrderHeader."Source Account Name"), 50);
                                                        GenJournalLine.Validate(GenJournalLine.Amount, -LoanPrinciple);
                                                        GenJournalLine.Validate(GenJournalLine."Loan No", StandingOrderLines."Loan No.");
                                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Repayment;
                                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                                        if GenJournalLine.Amount <> 0 then
                                                            GenJournalLine.Insert;
                                                        RunBal -= Abs(GenJournalLine.Amount);
                                                        AmountDedu += Abs(GenJournalLine.Amount);


                                                        //RecoverBills
                                                        if LoanApps."Outstanding Bills" <> 0 then begin
                                                            if ProductType.Get(LoanApps."Loan Product Type") then begin
                                                                LoanApps.Reset;
                                                                LoanApps.SetRange("Loan Product Type", ProductType."Product ID");
                                                                LoanApps.SetRange("Dummy Appraisal", false);
                                                                if LoanApps.Find('-') then begin
                                                                    LineNo := LineNo + 10000;
                                                                    GenJournalLine.Init;
                                                                    GenJournalLine."Journal Template Name" := Jtemplate;
                                                                    GenJournalLine."Journal Batch Name" := Jbatch;
                                                                    GenJournalLine."Posting Date" := PDate;
                                                                    GenJournalLine."Line No." := LineNo;
                                                                    GenJournalLine."Document No." := DocNo;
                                                                    GenJournalLine."External Document No." := StandingOrderHeader."No.";
                                                                    GenJournalLine."Account Type" := StandingOrderLines."Destination Account Type";
                                                                    GenJournalLine."Account No." := StandingOrderLines."Destination Account No.";
                                                                    GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                                                                    GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderLines."Destination Account No.");
                                                                    GenJournalLine.Description := PadStr('STO:-' + StandingOrderLines."Loan No." + '-' + Format(StandingOrderHeader."Source Account Name"), 50);
                                                                    if (-1 * LoanPrinciple) = StandingOrderLines."OutStanding Bills" then
                                                                        GenJournalLine.Amount := -StandingOrderLines."OutStanding Bills"
                                                                    else
                                                                        if StandingOrderLines."OutStanding Bills" < 0 then
                                                                            GenJournalLine.Amount := -StandingOrderLines."OutStanding Bills"
                                                                        else
                                                                            if StandingOrderLines."OutStanding Bills" > StandingOrderLines."OutStanding Bills" then
                                                                                GenJournalLine.Amount := -StandingOrderLines."OutStanding Bills"
                                                                            else
                                                                                GenJournalLine.Amount := (LoanPrinciple * -1);
                                                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                                                    GenJournalLine."Loan No" := StandingOrderLines."Loan No.";
                                                                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                                                    GenJournalLine."Bal. Account No." := '107001';
                                                                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");

                                                                    GenJournalLine."Shortcut Dimension 1 Code" := DActivity2;
                                                                    GenJournalLine."Shortcut Dimension 2 Code" := DBranch2;
                                                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                                                    GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                                                                    if GenJournalLine.Amount <> 0 then
                                                                        GenJournalLine.Insert;
                                                                end;
                                                            end;
                                                        end

                                                    end;
                                                end;//Credit Entries



                                            //*Internal,External Entries
                                            StandingOrderLines."destination account type"::External, StandingOrderLines."destination account type"::Internal:
                                                begin

                                                    LineNo := LineNo + 10000;

                                                    GenJournalLine.Init;
                                                    GenJournalLine."Journal Template Name" := Jtemplate;
                                                    GenJournalLine."Journal Batch Name" := Jbatch;

                                                    GenJournalLine."Line No." := LineNo;

                                                    GenJournalLine."Posting Date" := PDate;
                                                    GenJournalLine."Document No." := DocNo;
                                                    GenJournalLine."External Document No." := StandingOrderHeader."No.";

                                                    case StandingOrderLines."Destination Account Type" of

                                                        StandingOrderLines."destination account type"::External:
                                                            begin
                                                                GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                                                                GenJournalLine.Validate(GenJournalLine."Account No.", GenSetup."External STO Account No.");
                                                            end;


                                                        StandingOrderLines."destination account type"::Internal:
                                                            begin
                                                                GenJournalLine."Account Type" := StandingOrderLines."Destination Account Type";
                                                                GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderLines."Destination Account No.");
                                                            end;
                                                    end;

                                                    //GenJournalLine.Description:='Destination:-'+StandingOrderLines."Destination Account Name";
                                                    GenJournalLine.Description := PadStr('STO:-' + Format(StandingOrderHeader."No.") + '-' + Format(StandingOrderHeader."Source Account Name"), 50);

                                                    if RunBal >= StandingOrderLines.Amount then
                                                        GenJournalLine.Validate(GenJournalLine.Amount, -StandingOrderLines.Amount)
                                                    else
                                                        GenJournalLine.Validate(GenJournalLine.Amount, -RunBal);

                                                    GenJournalLine.Validate(GenJournalLine."Loan No", StandingOrderLines."Loan No.");
                                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                                    if GenJournalLine.Amount <> 0 then
                                                        GenJournalLine.Insert;
                                                    RunBal -= Abs(GenJournalLine.Amount);
                                                    AmountDedu += Abs(GenJournalLine.Amount);
                                                end;//*Internal,External Entries


                                        end;
                                    until StandingOrderLines.Next = 0;
                                end;


                                //*Header Posting

                                if STOHead.Get(STOHeaderNo) then begin

                                    //**********************
                                    GenSetup.Get;


                                    TCharges := 0;
                                    TransactionCharges.Reset;
                                    TransactionCharges.SetRange(TransactionCharges."Transaction Type", StandingOrderHeader."Transaction Type");
                                    if TransactionCharges.Find('-') then begin
                                        repeat

                                            if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::Normal) then begin

                                                ChargeAmount := 0;
                                                if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" then
                                                    ChargeAmount := (StandingOrderHeader.Amount * TransactionCharges."Percentage of Amount") * 0.01
                                                else
                                                    ChargeAmount := TransactionCharges."Charge Amount";

                                                if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin
                                                    TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
                                                    TariffDetails.Reset;
                                                    TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                                    if TariffDetails.Find('-') then begin
                                                        repeat
                                                            if (StandingOrderHeader.Amount >= TariffDetails."Lower Limit") and
                                                                (StandingOrderHeader.Amount <= TariffDetails."Upper Limit") then begin
                                                                if TariffDetails."Use Percentage" then
                                                                    ChargeAmount := StandingOrderHeader.Amount * TariffDetails.Percentage * 0.01
                                                                else
                                                                    ChargeAmount := TariffDetails."Charge Amount";
                                                            end;
                                                        until TariffDetails.Next = 0;
                                                    end;
                                                end;

                                                LineNo := LineNo + 10000;

                                                GenJournalLine.Init;
                                                GenJournalLine."Journal Template Name" := Jtemplate;
                                                GenJournalLine."Journal Batch Name" := Jbatch;
                                                GenJournalLine."Line No." := LineNo;
                                                GenJournalLine."Posting Date" := PDate;
                                                GenJournalLine."Document No." := DocNo;
                                                GenJournalLine."External Document No." := StandingOrderHeader."No.";
                                                GenJournalLine."Account Type" := StandingOrderHeader."Source Account Type";
                                                GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderHeader."Source Account No.");
                                                GenJournalLine.Description := TransactionCharges.Description;
                                                GenJournalLine.Validate(GenJournalLine.Amount, ChargeAmount);
                                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.", TransactionCharges."G/L Account");
                                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                                if GenJournalLine.Amount <> 0 then
                                                    GenJournalLine.Insert;


                                                if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
                                                    (TransactionCharges."Recover Excise Duty" = true) then begin
                                                    //Excise
                                                    LineNo := LineNo + 10000;
                                                    GenJournalLine.Init;
                                                    GenJournalLine."Journal Template Name" := Jtemplate;
                                                    GenJournalLine."Journal Batch Name" := Jbatch;
                                                    GenJournalLine."Line No." := LineNo;
                                                    GenJournalLine."Posting Date" := PDate;
                                                    GenJournalLine."Document No." := DocNo;
                                                    GenJournalLine."External Document No." := StandingOrderHeader."No.";
                                                    GenJournalLine."Account Type" := StandingOrderHeader."Source Account Type";
                                                    GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderHeader."Source Account No.");
                                                    GenJournalLine.Description := 'Excise Duty';//TransactionCharges.Description;
                                                    GenJournalLine.Validate(GenJournalLine.Amount, (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01);
                                                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.", GenSetup."Excise Duty G/L");
                                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                                    if GenJournalLine.Amount <> 0 then
                                                        GenJournalLine.Insert;
                                                    //Excise
                                                end;
                                                TChargeAmount += ChargeAmount;
                                            end;
                                        until TransactionCharges.Next = 0;
                                    end;
                                    TCharges := TChargeAmount;
                                    //**********************

                                    LineNo := LineNo + 10000;

                                    GenJournalLine.Init;
                                    GenJournalLine."Journal Template Name" := Jtemplate;
                                    GenJournalLine."Journal Batch Name" := Jbatch;

                                    GenJournalLine."Line No." := LineNo;

                                    GenJournalLine."Posting Date" := PDate;
                                    GenJournalLine."Document No." := DocNo;
                                    GenJournalLine."External Document No." := STOHead."No.";
                                    GenJournalLine."Account Type" := STOHead."Source Account Type";
                                    GenJournalLine.Validate(GenJournalLine."Account No.", STOHead."Source Account No.");
                                    //GenJournalLine.Description:='Source:-'+STOHead."Source Account Name";
                                    GenJournalLine.Description := PadStr('STO:-' + Format(STOHead."No.") + '-' + Format(STOlinesname), 50);
                                    if AmountDedu > 0 then
                                        GenJournalLine.Validate(GenJournalLine.Amount, STOHead.Amount);
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                    if GenJournalLine.Amount <> 0 then
                                        GenJournalLine.Insert;
                                end;
                            end;
                        end else begin
                            //Partial
                            AmountDedu := 0;
                            DeductedSTO := 0;

                            //Taking into consideration double salary
                            StandingOrdSRegister.Reset;
                            StandingOrdSRegister.SetCurrentkey("Date Processed", "No.");
                            StandingOrdSRegister.SetRange("Document No.", StandingOrderHeader."No.");
                            StandingOrdSRegister.SetRange("Deduction Status", StandingOrdSRegister."deduction status"::"Partial Deduction");
                            StandingOrdSRegister.SetFilter("Date Processed", '>=%1', STR);
                            if StandingOrdSRegister.FindLast then begin
                                if (StandingOrdSRegister."Date Processed" >= STR) and (StandingOrdSRegister."Date Processed" <= PDate) then
                                    StandingOrderHeader.Amount -= StandingOrdSRegister."Amount Deducted";
                            end;


                            if RunBal > StandingOrderHeader.Amount then begin
                                DeductedSTO := StandingOrderHeader.Amount;
                                StandingOrdDeductStatus := Standingorddeductstatus::Successfull;
                            end else begin
                                DeductedSTO := RunBal;
                                StandingOrdDeductStatus := Standingorddeductstatus::"Partial Deduction";

                            end;
                            if DeductedSTO < 0 then
                                DeductedSTO := 0;
                            //  ERROR(FORMAT(StandingOrdDeductStatus));
                            UpdateStandingOrderRegister('', Today, StandingOrderHeader."No.", '', StandingOrderHeader."Source Account No.", StandingOrderHeader."Source Account Name",
                                                        StandingOrderHeader."Member No.", StandingOrderHeader."Payroll/Staff No.", StandingOrderHeader."Allow Partial Deduction",
                                                        StandingOrdDeductStatus, StandingOrderHeader.Amount, DeductedSTO, StandingOrderHeader."Effective/Start Date", StandingOrderHeader."Duration (Months)",
                                                        StandingOrderHeader."Frequency (Months)", StandingOrderHeader."End Date", StandingOrderHeader.Description, StandingOrderHeader."Transfered to EFT", false, StandingOrderHeader."No.");


                            if StandingOrderHeader."Allow Partial Deduction" then begin //Partial Deduction
                                StandingOrderLines.Reset;
                                StandingOrderLines.SetRange(StandingOrderLines."Document No.", StandingOrderHeader."No.");
                                if StandingOrderLines.Find('-') then begin
                                    repeat
                                        STOlinesname := StandingOrderLines."Destination Account Name";
                                        //   MESSAGE('The Lines name is %1',STOlinesname);
                                        case StandingOrderLines."Destination Account Type" of
                                            StandingOrderLines."destination account type"::Internal, StandingOrderLines."destination account type"::External:
                                                begin
                                                    LineNo := LineNo + 10000;
                                                    GenJournalLine.Init;
                                                    GenJournalLine."Journal Template Name" := Jtemplate;
                                                    GenJournalLine."Journal Batch Name" := Jbatch;
                                                    GenJournalLine."Posting Date" := PDate;
                                                    GenJournalLine."Line No." := LineNo;
                                                    GenJournalLine."Document No." := DocNo;
                                                    GenJournalLine."External Document No." := STOHead."No.";
                                                    GenJournalLine."Account Type" := StandingOrderLines."Destination Account Type";
                                                    GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderLines."Destination Account No.");
                                                    //GenJournalLine.Description:=PADSTR('Destination:- '+StandingOrderHeader."Source Account No."+'-'+StandingOrderHeader."Source Account Name",50);
                                                    GenJournalLine.Description := PadStr('STO:-' + Format(StandingOrderHeader."No.") + '-' + Format(StandingOrderHeader."Source Account Name"), 50);
                                                    if RunBal >= StandingOrderLines.Amount then
                                                        GenJournalLine.Validate(GenJournalLine.Amount, -StandingOrderLines.Amount)
                                                    else
                                                        GenJournalLine.Validate(GenJournalLine.Amount, -RunBal);

                                                    GenJournalLine.Validate(GenJournalLine."Loan No", StandingOrderLines."Loan No.");
                                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                                    if GenJournalLine.Amount <> 0 then
                                                        GenJournalLine.Insert;

                                                    RunBal -= Abs(GenJournalLine.Amount);
                                                    AmountDedu += Abs(GenJournalLine.Amount); //MESSAGE('TE5 :%1',AmountDedu);
                                                end;

                                            StandingOrderLines."destination account type"::Credit:
                                                begin

                                                    LoanInterest := 0;
                                                    LoanPrincipal := 0;
                                                    LoanRepayment := 0;

                                                    LoanApps.Reset;
                                                    LoanApps.SetRange(LoanApps."Loan No.", StandingOrderLines."Loan No.");
                                                    if LoanApps.Find('-') then begin
                                                        LoanApps.CalcFields(LoanApps."Outstanding Interest", LoanApps."Outstanding Bills", LoanApps."Outstanding Balance");

                                                        LoanPrincipal := StandingOrderLines.Amount;

                                                        if LoanApps."Outstanding Interest" > 0 then begin
                                                            LineNo := LineNo + 10000;
                                                            GenJournalLine.Init;
                                                            GenJournalLine."Journal Template Name" := Jtemplate;
                                                            GenJournalLine."Journal Batch Name" := Jbatch;
                                                            GenJournalLine."Line No." := LineNo;
                                                            GenJournalLine."Posting Date" := PDate;
                                                            GenJournalLine."Document No." := DocNo;
                                                            GenJournalLine."External Document No." := STOHead."No.";
                                                            GenJournalLine."Account Type" := StandingOrderLines."Destination Account Type";
                                                            GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderLines."Destination Account No.");
                                                            GenJournalLine.Description := PadStr('Destination:-' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
                                                                                         Format(GenJournalLine."transaction type"::"Interest Paid"), 50);

                                                            if LoanApps."Outstanding Interest" > StandingOrderLines.Amount then begin
                                                                LoanInterest := StandingOrderLines.Amount;
                                                                LoanPrincipal := StandingOrderLines.Amount - LoanInterest;
                                                            end else
                                                                LoanInterest := LoanApps."Outstanding Interest";

                                                            if RunBal > LoanInterest then
                                                                GenJournalLine.Validate(GenJournalLine.Amount, -LoanInterest)
                                                            else
                                                                GenJournalLine.Validate(GenJournalLine.Amount, -RunBal);

                                                            GenJournalLine.Validate(GenJournalLine."Loan No", StandingOrderLines."Loan No.");
                                                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                                            if GenJournalLine.Amount <> 0 then
                                                                GenJournalLine.Insert;

                                                            RunBal -= Abs(GenJournalLine.Amount);
                                                            AmountDedu += Abs(GenJournalLine.Amount); //MESSAGE('TE6 :%1',AmountDedu);
                                                        end;

                                                        if (LoanApps."Outstanding Balance" > 0) and (LoanApps."Outstanding Bills" > 0) then begin
                                                            LineNo := LineNo + 10000;
                                                            GenJournalLine.Init;
                                                            GenJournalLine."Journal Template Name" := Jtemplate;
                                                            GenJournalLine."Journal Batch Name" := Jbatch;
                                                            GenJournalLine."Line No." := LineNo;
                                                            GenJournalLine."Posting Date" := PDate;
                                                            GenJournalLine."Document No." := DocNo;
                                                            GenJournalLine."External Document No." := STOHead."No.";
                                                            GenJournalLine."Account Type" := StandingOrderLines."Destination Account Type";
                                                            GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderLines."Destination Account No.");
                                                            GenJournalLine.Description := PadStr('Destination:- ' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
                                                                                         Format(GenJournalLine."transaction type"::Bills), 50);

                                                            if LoanApps."Outstanding Bills" >= LoanPrincipal then
                                                                LoanRepayment := LoanPrincipal
                                                            else
                                                                LoanRepayment := LoanApps."Outstanding Bills";

                                                            if RunBal >= LoanRepayment then
                                                                GenJournalLine.Validate(GenJournalLine.Amount, -LoanRepayment)
                                                            else
                                                                GenJournalLine.Validate(GenJournalLine.Amount, -RunBal);

                                                            GenJournalLine.Validate(GenJournalLine."Loan No", StandingOrderLines."Loan No.");
                                                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                                                            if ProductFactory.Get(LoanApps."Loan Product Type") then begin
                                                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.", ProductFactory."Billed Account");
                                                            end;
                                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                                            if GenJournalLine.Amount <> 0 then
                                                                GenJournalLine.Insert;

                                                            LineNo := LineNo + 10000;
                                                            GenJournalLine.Init;
                                                            GenJournalLine."Journal Template Name" := Jtemplate;
                                                            GenJournalLine."Journal Batch Name" := Jbatch;
                                                            GenJournalLine."Line No." := LineNo;
                                                            GenJournalLine."Posting Date" := PDate;
                                                            GenJournalLine."Document No." := DocNo;
                                                            GenJournalLine."External Document No." := STOHead."No.";
                                                            GenJournalLine."Account Type" := StandingOrderLines."Destination Account Type";
                                                            GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderLines."Destination Account No.");
                                                            GenJournalLine.Description := PadStr('Destination:-' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
                                                                                         Format(GenJournalLine."transaction type"::Repayment), 50);

                                                            if LoanApps."Outstanding Bills" >= LoanPrincipal then
                                                                LoanRepayment := LoanPrincipal
                                                            else
                                                                LoanRepayment := LoanApps."Outstanding Bills";

                                                            if RunBal >= LoanRepayment then
                                                                GenJournalLine.Validate(GenJournalLine.Amount, -LoanRepayment)
                                                            else
                                                                GenJournalLine.Validate(GenJournalLine.Amount, -RunBal);

                                                            GenJournalLine.Validate(GenJournalLine."Loan No", StandingOrderLines."Loan No.");
                                                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Repayment;
                                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                                            if GenJournalLine.Amount <> 0 then
                                                                GenJournalLine.Insert;

                                                            RunBal -= Abs(GenJournalLine.Amount);
                                                            AmountDedu += Abs(GenJournalLine.Amount); //MESSAGE('TE7 :%1',AmountDedu);
                                                        end;

                                                        if (LoanApps."Outstanding Balance" > 0) and (LoanApps."Outstanding Bills" = 0) then begin
                                                            LineNo := LineNo + 10000;
                                                            GenJournalLine.Init;
                                                            GenJournalLine."Journal Template Name" := Jtemplate;
                                                            GenJournalLine."Journal Batch Name" := Jbatch;
                                                            GenJournalLine."Line No." := LineNo;
                                                            GenJournalLine."Posting Date" := PDate;
                                                            GenJournalLine."Document No." := DocNo;
                                                            GenJournalLine."External Document No." := STOHead."No.";
                                                            GenJournalLine."Account Type" := StandingOrderLines."Destination Account Type";
                                                            GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderLines."Destination Account No.");
                                                            GenJournalLine.Description := PadStr('Destination:- ACCRUAL' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
                                                                                         Format(GenJournalLine."transaction type"::Bills), 50);

                                                            if LoanApps."Outstanding Balance" > LoanPrincipal then
                                                                LoanRepayment := LoanPrincipal
                                                            else
                                                                LoanRepayment := LoanApps."Outstanding Balance";

                                                            //MESSAGE('Bill :%1 PPay :%2 RunBal :%3',LoanRepayment ,LoanPrincipal,Runbal);

                                                            if RunBal > LoanRepayment then
                                                                GenJournalLine.Validate(GenJournalLine.Amount, LoanRepayment)
                                                            else
                                                                GenJournalLine.Validate(GenJournalLine.Amount, RunBal);

                                                            GenJournalLine.Validate(GenJournalLine."Loan No", StandingOrderLines."Loan No.");
                                                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                                                            if ProductFactory.Get(LoanApps."Loan Product Type") then begin
                                                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.", ProductFactory."Billed Account");
                                                            end;
                                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                                            if GenJournalLine.Amount <> 0 then
                                                                GenJournalLine.Insert;

                                                            LineNo := LineNo + 10000;
                                                            GenJournalLine.Init;
                                                            GenJournalLine."Journal Template Name" := Jtemplate;
                                                            GenJournalLine."Journal Batch Name" := Jbatch;
                                                            GenJournalLine."Line No." := LineNo;
                                                            GenJournalLine."Posting Date" := PDate;
                                                            GenJournalLine."Document No." := DocNo;
                                                            GenJournalLine."External Document No." := STOHead."No.";
                                                            GenJournalLine."Account Type" := StandingOrderLines."Destination Account Type";
                                                            GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderLines."Destination Account No.");
                                                            GenJournalLine.Description := PadStr('Destination:-' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
                                                                                         Format(GenJournalLine."transaction type"::Bills), 50);

                                                            if LoanApps."Outstanding Balance" > LoanPrincipal then
                                                                LoanRepayment := LoanPrincipal
                                                            else
                                                                LoanRepayment := LoanApps."Outstanding Balance";

                                                            if RunBal > LoanRepayment then
                                                                GenJournalLine.Validate(GenJournalLine.Amount, -LoanRepayment)
                                                            else
                                                                GenJournalLine.Validate(GenJournalLine.Amount, -RunBal);

                                                            GenJournalLine.Validate(GenJournalLine."Loan No", StandingOrderLines."Loan No.");
                                                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                                                            if ProductFactory.Get(LoanApps."Loan Product Type") then begin
                                                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.", ProductFactory."Billed Account");
                                                            end;
                                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                                            if GenJournalLine.Amount <> 0 then
                                                                GenJournalLine.Insert;

                                                            LineNo := LineNo + 10000;
                                                            GenJournalLine.Init;
                                                            GenJournalLine."Journal Template Name" := Jtemplate;
                                                            GenJournalLine."Journal Batch Name" := Jbatch;
                                                            GenJournalLine."Line No." := LineNo;
                                                            GenJournalLine."Posting Date" := PDate;
                                                            GenJournalLine."Document No." := DocNo;
                                                            GenJournalLine."External Document No." := STOHead."No.";
                                                            GenJournalLine."Account Type" := StandingOrderLines."Destination Account Type";
                                                            GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderLines."Destination Account No.");
                                                            GenJournalLine.Description := PadStr('Destination:-' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
                                                                                         Format(GenJournalLine."transaction type"::Repayment), 50);

                                                            if LoanApps."Outstanding Balance" > LoanPrincipal then
                                                                LoanRepayment := LoanPrincipal
                                                            else
                                                                LoanRepayment := LoanApps."Outstanding Balance";

                                                            if RunBal > LoanRepayment then
                                                                GenJournalLine.Validate(GenJournalLine.Amount, -LoanRepayment)
                                                            else
                                                                GenJournalLine.Validate(GenJournalLine.Amount, -RunBal);

                                                            GenJournalLine.Validate(GenJournalLine."Loan No", StandingOrderLines."Loan No.");
                                                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Repayment;
                                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                                            if GenJournalLine.Amount <> 0 then
                                                                GenJournalLine.Insert;

                                                            RunBal -= Abs(GenJournalLine.Amount);
                                                            AmountDedu += Abs(GenJournalLine.Amount);  //MESSAGE('TE8 :%1',AmountDedu);
                                                        end;
                                                    end;
                                                end;
                                        end;
                                    until StandingOrderLines.Next = 0;
                                end;
                                //--Partial End***
                            end;

                            //*Header Posting

                            if STOHead.Get(STOHeaderNo) then begin


                                //Charges
                                STOlinesname := StandingOrderLines."Destination Account Name";


                                GenSetup.Get;


                                TCharges := 0;
                                TransactionCharges.Reset;
                                TransactionCharges.SetRange(TransactionCharges."Transaction Type", StandingOrderHeader."Transaction Type");
                                if TransactionCharges.Find('-') then begin
                                    repeat

                                        if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::Normal) then begin

                                            ChargeAmount := 0;
                                            if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" then
                                                ChargeAmount := (StandingOrderHeader.Amount * TransactionCharges."Percentage of Amount") * 0.01
                                            else
                                                ChargeAmount := TransactionCharges."Charge Amount";

                                            if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin
                                                TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
                                                TariffDetails.Reset;
                                                TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                                if TariffDetails.Find('-') then begin
                                                    repeat
                                                        if (StandingOrderHeader.Amount >= TariffDetails."Lower Limit") and
                                                            (StandingOrderHeader.Amount <= TariffDetails."Upper Limit") then begin
                                                            if TariffDetails."Use Percentage" then
                                                                ChargeAmount := StandingOrderHeader.Amount * TariffDetails.Percentage * 0.01
                                                            else
                                                                ChargeAmount := TariffDetails."Charge Amount";
                                                        end;
                                                    until TariffDetails.Next = 0;
                                                end;
                                            end;

                                            LineNo := LineNo + 10000;

                                            GenJournalLine.Init;
                                            GenJournalLine."Journal Template Name" := Jtemplate;
                                            GenJournalLine."Journal Batch Name" := Jbatch;
                                            GenJournalLine."Line No." := LineNo;
                                            GenJournalLine."Posting Date" := PDate;
                                            GenJournalLine."Document No." := DocNo;
                                            GenJournalLine."External Document No." := StandingOrderHeader."No.";
                                            GenJournalLine."Account Type" := StandingOrderHeader."Source Account Type";
                                            GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderHeader."Source Account No.");
                                            GenJournalLine.Description := TransactionCharges.Description;
                                            GenJournalLine.Validate(GenJournalLine.Amount, ChargeAmount);
                                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                            GenJournalLine.Validate(GenJournalLine."Bal. Account No.", TransactionCharges."G/L Account");
                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                            if GenJournalLine.Amount <> 0 then
                                                GenJournalLine.Insert;


                                            if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
                                                (TransactionCharges."Recover Excise Duty" = true) then begin
                                                //Excise
                                                LineNo := LineNo + 10000;
                                                GenJournalLine.Init;
                                                GenJournalLine."Journal Template Name" := Jtemplate;
                                                GenJournalLine."Journal Batch Name" := Jbatch;
                                                GenJournalLine."Line No." := LineNo;
                                                GenJournalLine."Posting Date" := PDate;
                                                GenJournalLine."Document No." := DocNo;
                                                GenJournalLine."External Document No." := StandingOrderHeader."No.";
                                                GenJournalLine."Account Type" := StandingOrderHeader."Source Account Type";
                                                GenJournalLine.Validate(GenJournalLine."Account No.", StandingOrderHeader."Source Account No.");
                                                GenJournalLine.Description := 'Excise Duty';//TransactionCharges.Description;
                                                GenJournalLine.Validate(GenJournalLine.Amount, (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01);
                                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.", GenSetup."Excise Duty G/L");
                                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                                if GenJournalLine.Amount <> 0 then
                                                    GenJournalLine.Insert;
                                                //Excise
                                            end;
                                            TChargeAmount += ChargeAmount;
                                        end;
                                    until TransactionCharges.Next = 0;
                                end;
                                TCharges := TChargeAmount;
                                //Charges
                                LineNo := LineNo + 10000;

                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Journal Batch Name" := Jbatch;

                                GenJournalLine."Line No." := LineNo;

                                GenJournalLine."Posting Date" := PDate;
                                GenJournalLine."Document No." := DocNo;
                                GenJournalLine."External Document No." := STOHead."No.";
                                GenJournalLine."Account Type" := STOHead."Source Account Type";
                                GenJournalLine.Validate(GenJournalLine."Account No.", STOHead."Source Account No.");
                                //GenJournalLine.Description:='Source:-'+STOHead."Source Account Name";
                                GenJournalLine.Description := PadStr('STO:-' + Format(STOHead."No.") + '-' + Format(STOlinesname), 50);
                                GenJournalLine.Validate(GenJournalLine.Amount, AmountDedu);
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code", DActivity2);
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code", DBranch2);
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;
                            end;
                        end;
                    end;//All Successful STOS Exempt
                until StandingOrderHeader.Next = 0;
            end;//*Header Info
        end;



        //PostLoansArreas(SalHeaD,DocNo,PDate,DActivity2,DBranch2,Jtemplate,Jbatch,RunBal,MemberNo,LineNo,Salaccno);

    end;

    local procedure PostLoansArreas(SalHeaD: Record 52185783; DocNo: Code[20]; PDate: Date; DActivity2: Code[20]; DBranch2: Code[20]; Jtemplate: Code[20]; Jbatch: Code[20]; RunBal: Decimal; MemberNo: Code[20]; LineNo: Integer; Salaccno: Code[20])
    var
        Loans: Record 52185729;
        Interest: Decimal;
        GenJournalLine: Record "Gen. Journal Line";
        LRepayment: Decimal;
        SalLines: Record 52185784;
    begin
        with SalHeaD do begin

            Loans.Reset;
            Loans.SetRange(Loans."Member No.", MemberNo);
            //Loans.SETRANGE(Loans."Recovery Mode",Loans."Recovery Mode"::Salary);
            if Loans.Find('-') then begin
                repeat
                    if RunBal > 0 then begin
                        Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", Loans."Outstanding Bills");
                        if Loans."Outstanding Interest" > 0 then begin
                            Interest := 0;
                            Interest := Loans."Outstanding Interest";

                            if Interest > 0 then begin
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Journal Batch Name" := Jbatch;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                GenJournalLine."Account No." := Loans."Loan Account";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := CopyStr(DocNo, 1, 14);
                                GenJournalLine."Posting Date" := PDate;
                                GenJournalLine.Description := 'Interest Paid';
                                if RunBal > Interest then
                                    GenJournalLine.Amount := Interest * -1
                                else
                                    GenJournalLine.Amount := RunBal * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                                GenJournalLine."Loan No" := Loans."Loan No.";
                                GenJournalLine."Shortcut Dimension 1 Code" := DActivity2;
                                GenJournalLine."Shortcut Dimension 2 Code" := DBranch2;
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Journal Batch Name" := Jbatch;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := Salaccno;
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := CopyStr(DocNo, 1, 14);
                                GenJournalLine."Posting Date" := PDate;
                                GenJournalLine.Description := 'Interest Paid - ' + Loans."Loan Product Type";
                                if RunBal > Interest then
                                    GenJournalLine.Amount := Interest
                                else
                                    GenJournalLine.Amount := RunBal;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Loan No" := Loans."Loan No.";
                                GenJournalLine."Shortcut Dimension 1 Code" := DActivity2;
                                GenJournalLine."Shortcut Dimension 2 Code" := DBranch2;
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;
                                RunBal := RunBal - GenJournalLine.Amount;
                            end;
                        end;
                    end;

                    if RunBal > 0 then begin
                        if Loans."Outstanding Balance" > 0 then begin
                            LRepayment := 0;
                            LRepayment := Loans."Outstanding Bills";

                            if LRepayment > 0 then begin
                                if LRepayment > Loans."Outstanding Balance" then
                                    LRepayment := Loans."Outstanding Balance";

                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Journal Batch Name" := Jbatch;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                GenJournalLine."Account No." := Loans."Loan Account";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := CopyStr(DocNo, 1, 14);
                                GenJournalLine."Posting Date" := PDate;
                                GenJournalLine.Description := 'Loan Repayment';
                                if RunBal > LRepayment then
                                    GenJournalLine.Amount := LRepayment * -1
                                else
                                    GenJournalLine.Amount := RunBal * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Repayment;
                                GenJournalLine."Loan No" := Loans."Loan No.";
                                GenJournalLine."Shortcut Dimension 1 Code" := DActivity2;
                                GenJournalLine."Shortcut Dimension 2 Code" := DBranch2;
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Journal Batch Name" := Jbatch;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := Salaccno;
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := CopyStr(DocNo, 1, 14);
                                GenJournalLine."Posting Date" := PDate;
                                GenJournalLine.Description := 'Loan Repayment - ' + Loans."Loan Product Type";
                                if RunBal > LRepayment then
                                    GenJournalLine.Amount := LRepayment
                                else
                                    GenJournalLine.Amount := RunBal;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Loan No" := Loans."Loan No.";
                                GenJournalLine."Shortcut Dimension 1 Code" := DActivity2;
                                GenJournalLine."Shortcut Dimension 2 Code" := DBranch2;
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;
                                RunBal := RunBal - GenJournalLine.Amount;
                            end;
                        end;
                    end;

                until Loans.Next = 0;
            end;
        end;
    end;


    procedure UpdateStandingOrderRegister(RNo: Code[10]; RDateProcessed: Date; RDocNo: Code[10]; RNoSeries: Code[10]; RSourceAccountNo: Code[20]; RSourceAccountName: Text; RMemberNo: Code[20]; RStaffNo: Code[11]; RPartialDeduction: Boolean; RDeductionStatus: Option " ",Successfull,"Partial Deduction",Failed; RDeductionAmount: Decimal; RAmountDeducted: Decimal; RStartDate: Date; RDuration: DateFormula; RFrequency: DateFormula; REndDate: Date; Rremarks: Code[50]; Reft: Boolean; RTransferEft: Boolean; STONo: Code[20])
    var
        LineNo: Code[10];
        StandingOrdSRegister: Record 52185719;
    begin
        //*
        StandingOrdSRegister.Init;
        StandingOrdSRegister."No." := RNo;
        StandingOrdSRegister."Date Processed" := RDateProcessed;
        StandingOrdSRegister."Document No." := RDocNo;
        StandingOrdSRegister."No. Series" := RNoSeries;
        StandingOrdSRegister."Source Account No." := RSourceAccountNo;
        StandingOrdSRegister."Source Account Name" := RSourceAccountName;
        StandingOrdSRegister."Member No" := RMemberNo;
        StandingOrdSRegister."Staff/Payroll No." := RStaffNo;
        StandingOrdSRegister."Allow Partial Deduction" := RPartialDeduction;
        StandingOrdSRegister."Deduction Status" := RDeductionStatus;
        StandingOrdSRegister.Amount := RDeductionAmount;
        StandingOrdSRegister."Amount Deducted" := RAmountDeducted;
        StandingOrdSRegister."Effective/Start Date" := RStartDate;
        StandingOrdSRegister.Duration := RDuration;
        StandingOrdSRegister.Frequency := RFrequency;
        StandingOrdSRegister."End Date" := REndDate;
        StandingOrdSRegister.Remarks := Rremarks;
        StandingOrdSRegister.EFT := Reft;
        StandingOrdSRegister."Transfered to EFT" := RTransferEft;
        StandingOrdSRegister."Standing Order No." := STONo;
        //StandingOrdSRegister."Destination Account Type":=Destinacctype;
        StandingOrdSRegister.Insert(true);
    end;

    local procedure ActivateDormant(SalHeaD: Record 52185783; DocNo: Code[20]; PDate: Date; DActivity2: Code[20]; DBranch2: Code[20]; Jtemplate: Code[20]; Jbatch: Code[20]; RunBal: Decimal; MemberNo: Code[20]; LineNo: Integer; Salaccno: Code[20])
    var
        SavAcc: Record 52185730;
        TransactionCharges: Record 52185774;
        TransactionTypes: Record 52185773;
        AccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        AccNo: Code[20];
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccNo: Code[20];
        Amt: Decimal;
        JournalPosting: Codeunit "Journal Posting";
    begin
        //Auto Activate Dormant On Loan Posting
        GenSetup.Get;
        with SalHeaD do begin
            SavAcc.Reset;
            SavAcc.SetRange("No.", Salaccno);
            SavAcc.SetRange(Status, SavAcc.Status::Dormant);
            if SavAcc.Find('-') then begin
                TransactionTypes.Reset;
                TransactionTypes.SetRange(Code, GenSetup."Dormant Account Activation Fee");
                if TransactionTypes.Find('-') then begin
                    TransactionCharges.Reset;
                    TransactionCharges.SetRange("Transaction Type", TransactionTypes.Code);
                    if TransactionCharges.Find('-') then begin
                        repeat
                            TransactionCharges.TestField(TransactionCharges."G/L Account");
                            if SavAcc.Blocked = SavAcc.Blocked::" " then begin
                                SavAcc.Blocked := SavAcc.Blocked::" ";
                                SavAcc.Status := SavAcc.Status::Active;
                                SavAcc."Status Change Reason" := 'Auto Activated on Salary Posting';
                                SavAcc.Modify;
                            end;
                            LineNo := LineNo + 10000;
                            AccType := Acctype::"G/L Account";
                            AccNo := TransactionCharges."G/L Account";
                            TransType := Transtype::" ";
                            BalAccType := Balacctype::Savings;
                            BalAccNo := SavAcc."No.";

                            Amt := TransactionCharges."Charge Amount";
                            Amt := Amt * -1;
                            JournalPosting.PostJournal(Jtemplate, Jbatch, LineNo, AccType, DocNo, TransactionCharges.Description + SavAcc."No.", Amt, AccNo, PDate, BalAccType,
                          BalAccNo, '', DActivity2, DBranch2, TransType, SalHeaD."Document No", '', '', 0, '', 0);

                            if TransactionCharges."Recover Excise Duty" = true then begin
                                GenSetup.TestField("Excise Duty G/L");
                                GenSetup.TestField("Excise Duty (%)");
                                LineNo := LineNo + 10000;
                                AccType := Acctype::"G/L Account";
                                AccNo := GenSetup."Excise Duty G/L";
                                TransType := Transtype::" ";
                                BalAccType := Balacctype::Savings;
                                BalAccNo := SavAcc."No.";
                                Amt := Amt * GenSetup."Excise Duty (%)" * 0.01;
                                JournalPosting.PostJournal(Jtemplate, Jbatch, LineNo, AccType, DocNo, CopyStr((TransactionCharges.Description + SavAcc."No." + '-Excise Duty'), 1, 50), Amt, AccNo, PDate, BalAccType,
                                BalAccNo, '', DActivity2, DBranch2, TransType, '', '', '', 0, '', 0);
                            end;
                        until TransactionCharges.Next = 0;
                    end;
                end;
            end;
        end;
        //block account if
    end;

    local procedure "**********Over Draft Processing*******"()
    begin
    end;


    procedure PostOverDraft(Overdraft: Record 52185795)
    var
        Text0001: label 'Ensure the Overdraft Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Overdraft Journal Batch is set up in Banking User Setup';
        Text0003: label 'Ensure the Default Bank is set up in User Setup';
        Text0004: label 'The transaction has already been posted.';
        TCharges: Integer;
        TransactionCharges: Record 52185774;
        LineNo: Integer;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        GenJournalLine: Record "Gen. Journal Line";
        TChargeAmount: Decimal;
        GenSetup: Record 52185689;
    begin

        with Overdraft do begin

            //Cyrus
            if Posted = true then
                Error(Text0004);

            Temp.Get(UserId);
            GenSetup.Get;

            Jtemplate := Temp."Over Draft Template";
            JBatch := Temp."Over Draft Batch";


            if Jtemplate = '' then begin
                Error(Text0001);
            end;

            if JBatch = '' then begin
                Error(Text0002);
            end;


            if Status <> Status::Approved then
                Error('You cannot post an application being processed.');

            TestField("Account No.");
            TestField("Effective/Start Date");
            TestField(Duration);
            TestField("Expiry Date");
            TestField("Requested Amount");
            TestField("Approved Amount");
            //TESTFIELD("Overdraft Interest %");


            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", Jtemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            GenJournalLine.DeleteAll;

            if Confirm('Are you sure you want to charge overdraft issue fee.', false) = false then
                exit;

            //Charges
            TCharges := 0;

            TransactionCharges.Reset;
            TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
            if TransactionCharges.Find('-') then begin
                repeat
                    LineNo := LineNo + 10000;

                    ChargeAmount := 0;
                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                        ChargeAmount := ("Approved Amount" * TransactionCharges."Percentage of Amount") * 0.01
                    else
                        ChargeAmount := TransactionCharges."Charge Amount";

                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin

                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                        TariffDetails.Reset;
                        TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                        if TariffDetails.Find('-') then begin
                            repeat
                                if ("Approved Amount" >= TariffDetails."Lower Limit") and ("Approved Amount" <= TariffDetails."Upper Limit") then begin
                                    if TariffDetails."Use Percentage" = true then begin
                                        ChargeAmount := "Approved Amount" * TariffDetails.Percentage * 0.01;
                                    end else begin
                                        ChargeAmount := TariffDetails."Charge Amount";
                                    end;
                                end;
                            until TariffDetails.Next = 0;
                        end;
                    end;



                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := Jtemplate;
                    GenJournalLine."Journal Batch Name" := JBatch;
                    GenJournalLine."Document No." := "No.";
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                    GenJournalLine."Account No." := "Account No.";
                    GenJournalLine."External Document No." := "Account No.";
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine."Posting Date" := Today;
                    GenJournalLine.Description := TransactionCharges.Description;
                    GenJournalLine.Validate(GenJournalLine."Currency Code");
                    GenJournalLine.Amount := ChargeAmount;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                    GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                    GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                    GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;


                    //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                    if TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty" then begin

                        //Excise Duty

                        LineNo := LineNo + 10000;

                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := Jtemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Document No." := "No.";
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                        GenJournalLine."Account No." := "Account No.";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Posting Date" := Today;
                        GenJournalLine.Description := 'Excise Duty';
                        GenJournalLine.Validate(GenJournalLine."Currency Code");
                        GenJournalLine.Amount := (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                        GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
                        GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                        GenJournalLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                        TChargeAmount := TChargeAmount + ChargeAmount;
                    end;
                until TransactionCharges.Next = 0;
            end;


            //Post New
            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", Jtemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            if GenJournalLine.Find('-') then begin
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
            end;

            //Post New

            Posted := true;
            Modify;

            Message('Overdraft charges posted successfully.');

        end;
    end;

    local procedure ClearOverDraft()
    var
        OverDraft: Record 52185795;
    begin

        OverDraft.Reset;
        OverDraft.SetRange(OverDraft.Expired, false);
        if OverDraft.Find('-') then begin
            if OverDraft."Expiry Date" <= Today then begin
                OverDraft.Expired := true;
                OverDraft.Modify;
            end;
        end;
    end;

    local procedure "************Fixed Deposit**************"()
    begin
    end;

    local procedure CalculateFDInterest(Account: Record 52185730; RunDate: Date)
    var
        InterestAmount: Decimal;
        InterestBuffer: Record 52185741;
        IntBufferNo: Integer;
        AccountTypes: Record 52185690;
        FixedDepType: Record 52185705;
        FDInterestCalc: Record 52185706;
        IntRate: Decimal;
        FDDays: Integer;
    begin

        InterestAmount := 0;
        InterestBuffer.Reset;
        if InterestBuffer.Find('+') then
            IntBufferNo := InterestBuffer.No;


        if AccountTypes.Get(Account."Product Type") then begin
            if AccountTypes."Product Category" = AccountTypes."product category"::"Fixed Deposit" = true then begin
                if FixedDepType.Get(Account."Fixed Deposit Type") then begin

                    FDInterestCalc.Reset;
                    FDInterestCalc.SetRange(FDInterestCalc.Code, Account."Fixed Deposit Type");
                    if FDInterestCalc.Find('-') then begin
                        Account.CalcFields("Balance (LCY)");
                        repeat
                            if (FDInterestCalc."Minimum Amount" <= Account."Balance (LCY)") and
                            (Account."Balance (LCY)" <= FDInterestCalc."Maximum Amount") then
                                if Account."Neg. Interest Rate" = 0 then begin
                                    IntRate := FDInterestCalc."Interest Rate";
                                end else begin
                                    IntRate := Account."Neg. Interest Rate";
                                end;

                        until FDInterestCalc.Next = 0;
                    end;

                    FDDays := CalcDate(FixedDepType.Duration, RunDate) - RunDate;
                    //FDDays:=Account."FD Duration";
                    InterestAmount := Account."Balance (LCY)" * IntRate * 0.01 * (FDDays / 365);
                    InterestAmount := ROUND(InterestAmount, 1.0, '<');



                    IntBufferNo := IntBufferNo + 1;

                    InterestBuffer.Init;
                    InterestBuffer."Account No" := Account."No.";
                    InterestBuffer.No := IntBufferNo;
                    InterestBuffer."Product Type" := Account."Product Type";
                    InterestBuffer."Interest Date" := RunDate;
                    InterestBuffer."Interest Amount" := InterestAmount;
                    InterestBuffer.Description := 'FD INT - ' + Format(Account."FD Maturity Date", 0, ' <Day,2>-<Month Text,3>-<Year4> ');
                    InterestBuffer.Description := UpperCase(InterestBuffer.Description);
                    // InterestBuffer."User ID":=USERID;
                    if InterestBuffer."Interest Amount" <> 0 then
                        InterestBuffer.Insert(true);
                end;
            end;
        end;
    end;


    procedure RollOver(Account: Record 52185730; RunDate: Date; Jtemplate: Code[10]; Jbatch: Code[10])
    var
        AccountTypes: Record 52185690;
        FDType: Record 52185705;
        GenJournalLine: Record "Gen. Journal Line";
        InterestBuffer: Record 52185741;
        Text0001: label 'Your Fixed deposit of ';
        Text0002: label ' has matured and amount transfered to your savings account on';
    begin

        if Account.Blocked <> Account.Blocked::All then begin
            Account.CalcFields(Account."Balance (LCY)");
            if AccountTypes.Get(Account."Product Type") then begin
                if AccountTypes."Product Category" = AccountTypes."product category"::"Fixed Deposit" = true then begin
                    if AccountTypes."Earns Interest" = true then
                        Account.TestField(Account."FD Maturity Date");
                    if Account."FD Maturity Date" <= RunDate then begin
                        if FDType.Get(Account."Fixed Deposit Type") then begin
                            CalculateFDInterest(Account, RunDate);

                            AccountTypes.Reset;
                            AccountTypes.SetRange(AccountTypes."Product ID", Account."Product Type");
                            if AccountTypes.Find('-') then begin

                                LineNo := LineNo + 10000;
                                Account.CalcFields("Untranfered Interest");

                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Journal Batch Name" := Jbatch;
                                GenJournalLine."Document No." := 'FD INTEREST';
                                GenJournalLine."External Document No." := Account."No.";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := Account."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := RunDate;
                                GenJournalLine.Description := 'FD Interest - ' + Format(Account."FD Maturity Date", 0, ' <Day,2>-<Month Text,3>-<Year4> ');
                                GenJournalLine.Description := UpperCase(GenJournalLine.Description);
                                GenJournalLine.Amount := -Account."Untranfered Interest";
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                GenJournalLine."Bal. Account No." := AccountTypes."Interest Payable Account";
                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := Account."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := Account."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                //Withholding tax
                                LineNo := LineNo + 10000;

                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Journal Batch Name" := Jbatch;
                                GenJournalLine."Document No." := 'FD INTEREST';
                                GenJournalLine."External Document No." := Account."No.";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := Account."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := RunDate;
                                GenJournalLine.Description := 'Withholding Tax';
                                GenJournalLine.Description := UpperCase(GenJournalLine.Description);
                                GenJournalLine.Amount := Account."Untranfered Interest" * (AccountTypes."WithHolding Tax" / 100);
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                GenJournalLine."Bal. Account No." := AccountTypes."Withholding Tax Account";
                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := Account."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := Account."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                //Withholding tax

                                //DERRICK TRANSFER
                                //Transfer to savings
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Journal Batch Name" := Jbatch;
                                GenJournalLine."Document No." := 'FD INTEREST';
                                GenJournalLine."External Document No." := Account."No.";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := Account."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := RunDate;
                                GenJournalLine.Description := 'Transfer to Savings';
                                GenJournalLine.Description := UpperCase(GenJournalLine.Description);
                                GenJournalLine.Amount := (Account."Balance (LCY)" + Account."Untranfered Interest") - (Account."Untranfered Interest" * (AccountTypes."WithHolding Tax" / 100));
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                //GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::"G/L Account";
                                //GenJournalLine."Bal. Account No.":=AccountTypes."Interest Tax Account";
                                //GenJournalLine.VALIDATE(GenJournalLine."Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := Account."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := Account."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;


                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Journal Batch Name" := Jbatch;
                                GenJournalLine."Document No." := 'FD INTEREST';
                                GenJournalLine."External Document No." := Account."No.";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := Account."Savings Account No.";//Account."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := RunDate;
                                GenJournalLine.Description := 'Transfer from fixed'; //DERRICK TRANSFER FROM FIXED
                                GenJournalLine.Description := UpperCase(GenJournalLine.Description);
                                GenJournalLine.Amount := ((Account."Balance (LCY)" + Account."Untranfered Interest") - (Account."Untranfered Interest" * (AccountTypes."WithHolding Tax" / 100))) * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                //GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::"G/L Account";
                                //GenJournalLine."Bal. Account No.":=AccountTypes."Interest Tax Account";
                                //GenJournalLine.VALIDATE(GenJournalLine."Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := Account."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := Account."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                //Transfer to savings


                                //Post New
                                GenJournalLine.Reset;
                                GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                                GenJournalLine.SetRange("Journal Batch Name", Jbatch);
                                if GenJournalLine.Find('-') then begin
                                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                                end;

                                //Post New


                                SendSMS.SendSms(Sourcetype::"Fixed Deposit Maturity", Account."Transactional Mobile No", Text0001 + Format(Account."Fixed Deposit Amount") + Text0002
                                + Format(Today) + ' ' + Format(Time), Account."No.", Account."No.", false);

                                FixedHistory(Account);


                                InterestBuffer.Reset;
                                InterestBuffer.SetRange(InterestBuffer."Account No", Account."No.");
                                if InterestBuffer.Find('-') then
                                    InterestBuffer.ModifyAll(InterestBuffer.Transferred, true);

                                Account."FD Maturity Date" := CalcDate(FDType.Duration, Account."FD Maturity Date");
                                //Account."FD Maturity Instructions" := Account."FD Maturity Instructions"::"Transfer to Savings";
                                Account."Fixed Deposit Status" := Account."fixed deposit status"::Closed;
                                Account.Modify;




                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;


    procedure Renew(Account: Record 52185730; RunDate: Date; Jtemplate: Code[10]; Jbatch: Code[10])
    var
        AccountTypes: Record 52185690;
        FDType: Record 52185705;
        GenJournalLine: Record "Gen. Journal Line";
        InterestBuffer: Record 52185741;
        Text0001: label 'Your Fixed deposit of ';
        Text0002: label ' has matured and interest transfered to your savings account and principal renewed on ';
    begin

        if Account.Blocked <> Account.Blocked::All then begin
            if AccountTypes.Get(Account."Product Type") then begin
                if AccountTypes."Product Category" = AccountTypes."product category"::"Fixed Deposit" = true then begin
                    if AccountTypes."Earns Interest" = true then
                        Account.TestField("FD Maturity Date");
                    if Account."FD Maturity Date" <= RunDate then begin
                        if FDType.Get(Account."Fixed Deposit Type") then begin
                            CalculateFDInterest(Account, RunDate);
                            AccountTypes.Reset;
                            AccountTypes.SetRange(AccountTypes."Product ID", Account."Product Type");
                            if AccountTypes.Find('-') then begin

                                Account.TestField("Savings Account No.");


                                LineNo := LineNo + 10000;
                                Account.CalcFields("Untranfered Interest");

                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Journal Batch Name" := Jbatch;
                                GenJournalLine."Document No." := 'FD INTEREST';
                                GenJournalLine."External Document No." := Account."No.";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := Account."No.";
                                //GenJournalLine."Account No.":=Account."Savings Account No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := RunDate;
                                GenJournalLine.Description := 'FD Interest - ' + Format(Account."FD Maturity Date", 0, ' <Day,2>-<Month Text,3>-<Year4> ');
                                GenJournalLine.Description := UpperCase(GenJournalLine.Description);
                                GenJournalLine.Amount := -Account."Untranfered Interest";
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                GenJournalLine."Bal. Account No." := AccountTypes."Interest Payable Account";
                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := Account."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := Account."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;


                                //Withholding tax
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Journal Batch Name" := Jbatch;
                                GenJournalLine."Document No." := 'FD INTEREST';
                                GenJournalLine."External Document No." := Account."No.";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := Account."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := RunDate;
                                GenJournalLine.Description := 'Withholding Tax';
                                GenJournalLine.Description := UpperCase(GenJournalLine.Description);
                                GenJournalLine.Amount := Account."Untranfered Interest" * (AccountTypes."WithHolding Tax" / 100);
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                GenJournalLine."Bal. Account No." := AccountTypes."Withholding Tax Account";
                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := Account."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := Account."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                //Withholding tax

                                //Transfer to savings
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Journal Batch Name" := Jbatch;
                                GenJournalLine."Document No." := 'FD INTEREST';
                                GenJournalLine."External Document No." := Account."No.";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := Account."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := RunDate;
                                GenJournalLine.Description := 'Transfer to Savings';
                                GenJournalLine.Description := UpperCase(GenJournalLine.Description);
                                GenJournalLine.Amount := Account."Untranfered Interest" - (Account."Untranfered Interest" * (AccountTypes."WithHolding Tax" / 100));
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                //GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::"G/L Account";
                                //GenJournalLine."Bal. Account No.":=AccountTypes."Interest Tax Account";
                                //GenJournalLine.VALIDATE(GenJournalLine."Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := Account."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := Account."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");

                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;


                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Journal Batch Name" := Jbatch;
                                GenJournalLine."Document No." := 'FD INTEREST';
                                GenJournalLine."External Document No." := Account."No.";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := Account."Savings Account No.";//Account."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := RunDate;
                                GenJournalLine.Description := 'Transfer from fixed'; //DERRICK TRANSFER FROM FIXED
                                GenJournalLine.Description := UpperCase(GenJournalLine.Description);
                                GenJournalLine.Amount := (Account."Untranfered Interest" - (Account."Untranfered Interest" * (AccountTypes."WithHolding Tax" / 100))) * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                //GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::"G/L Account";
                                //GenJournalLine."Bal. Account No.":=AccountTypes."Interest Tax Account";
                                //GenJournalLine.VALIDATE(GenJournalLine."Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := Account."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := Account."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");

                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                //Transfer to savings


                                //Post New
                                GenJournalLine.Reset;
                                GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                                GenJournalLine.SetRange("Journal Batch Name", Jbatch);
                                if GenJournalLine.Find('-') then begin
                                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                                end;

                                if Account."Fixed Deposit Amount" > 0 then
                                    SendSMS.SendSms(Sourcetype::"Fixed Deposit Maturity", Account."Transactional Mobile No", Text0001 + Format(Account."Fixed Deposit Amount") + Text0002
                                    + Format(Today) + ' ' + Format(Time), Account."No.", Account."No.", false);


                                FixedHistory(Account);

                                //Post New
                                InterestBuffer.Reset;
                                InterestBuffer.SetRange(InterestBuffer."Account No", Account."No.");
                                if InterestBuffer.Find('-') then
                                    InterestBuffer.ModifyAll(InterestBuffer.Transferred, true);

                                Account."FD Maturity Date" := CalcDate(FDType.Duration, Account."FD Maturity Date");
                                //Account."Fixed Deposit Status" := Account."Fixed Deposit Status"::Renewed;
                                Account."FD Date Renewed" := Today;
                                Account.Modify;

                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;


    procedure CloseNonRenewable(Account: Record 52185730; RunDate: Date; Jtemplate: Code[10]; Jbatch: Code[10])
    var
        AccountTypes: Record 52185690;
        FDType: Record 52185705;
        GenJournalLine: Record "Gen. Journal Line";
        InterestBuffer: Record 52185741;
        Text0001: label 'Your Fixed deposit of ';
        Text0002: label ' has matured and has been renewed on';
    begin

        if Account.Blocked <> Account.Blocked::All then begin
            Account.CalcFields("Balance (LCY)");

            if AccountTypes.Get(Account."Product Type") then begin
                if AccountTypes."Product Category" = AccountTypes."product category"::"Fixed Deposit" = true then begin
                    if AccountTypes."Earns Interest" = true then
                        Account.TestField("FD Maturity Date");
                    if Account."FD Maturity Date" <= RunDate then begin
                        if FDType.Get(Account."Fixed Deposit Type") then begin
                            CalculateFDInterest(Account, RunDate);

                            AccountTypes.Reset;
                            AccountTypes.SetRange(AccountTypes."Product ID", Account."Product Type");
                            if AccountTypes.Find('-') then begin
                                Account.TestField("Savings Account No.");

                                LineNo := LineNo + 10000;
                                Account.CalcFields("Untranfered Interest");

                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Journal Batch Name" := Jbatch;
                                GenJournalLine."Document No." := 'FD INTEREST';
                                GenJournalLine."External Document No." := Account."No.";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := Account."No.";
                                // GenJournalLine."Account No.":=Account."Savings Account No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := RunDate;
                                GenJournalLine.Description := 'FD Interest - ' + Format(Account."FD Maturity Date", 0, ' <Day,2>-<Month Text,3>-<Year4> ');
                                GenJournalLine.Description := UpperCase(GenJournalLine.Description);
                                GenJournalLine.Amount := -Account."Untranfered Interest";
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                GenJournalLine."Bal. Account No." := AccountTypes."Interest Payable Account";
                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := Account."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := Account."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;


                                //Withholding tax
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := Jtemplate;
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Journal Batch Name" := Jbatch;
                                GenJournalLine."Document No." := 'FD INTEREST';
                                GenJournalLine."External Document No." := Account."No.";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := Account."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := RunDate;
                                GenJournalLine.Description := 'Withholding Tax';
                                GenJournalLine.Description := UpperCase(GenJournalLine.Description);
                                GenJournalLine.Amount := Account."Untranfered Interest" * (AccountTypes."WithHolding Tax" / 100);
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                GenJournalLine."Bal. Account No." := AccountTypes."Withholding Tax Account";
                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := Account."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := Account."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                //Withholding tax




                                //Post New
                                GenJournalLine.Reset;
                                GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                                GenJournalLine.SetRange("Journal Batch Name", Jbatch);
                                if GenJournalLine.Find('-') then begin
                                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                                end;

                                //Post New

                                SendSMS.SendSms(Sourcetype::"Fixed Deposit Maturity", Account."Transactional Mobile No", Text0001 + Format(Account."Balance (LCY)") + Text0002
                                + Format(Today) + ' ' + Format(Time), Account."No.", Account."No.", false);

                                FixedHistory(Account);

                                InterestBuffer.Reset;
                                InterestBuffer.SetRange(InterestBuffer."Account No", Account."No.");
                                if InterestBuffer.Find('-') then
                                    InterestBuffer.ModifyAll(InterestBuffer.Transferred, true);

                                //Account."FD Maturity Date":=Account."FD Maturity Date";
                                Account."FD Maturity Date" := CalcDate(FDType.Duration, Account."FD Maturity Date");
                                Account."FD Date Renewed" := Today;
                                //Account."Fixed Deposit Status" := Account."Fixed Deposit Status"::Closed;
                                Account.Modify;

                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;


    procedure FixedHistory(Account: Record 52185730)
    var
        FixedHistory: Record 52185810;
        FixedHistNo: Integer;
    begin

        FixedHistory.Reset;
        if FixedHistory.Find('+') then
            FixedHistNo := FixedHistory.No;

        FixedHistNo := FixedHistNo + 1;

        FixedHistory.Init;
        FixedHistory.No := FixedHistNo;
        FixedHistory."Account No." := Account."No.";
        FixedHistory."Interest Earned" := Account."Untranfered Interest";
        FixedHistory."Fixed Deposit Type" := Account."Fixed Deposit Type";
        FixedHistory."Fixed Amount" := Account."Balance (LCY)";
        FixedHistory."FD Maturity Date" := Account."FD Maturity Date";
        FixedHistory."FD Duration" := Account."FD Duration";
        FixedHistory."FD Maturity Instructions" := Account."FD Maturity Instructions";
        FixedHistory."Registration Date" := Account."Registration Date";
        FixedHistory."Neg. Interest Rate" := Account."Neg. Interest Rate";
        FixedHistory.Insert;
    end;

    local procedure "****************Sacco_ Bank Cheque Posting***********************"()
    begin
    end;


    procedure PostCheques(ChReceiptH: Record 52185787)
    var
        Text0001: label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Salary Journal Batch is set up in Banking User Setup';
        GenJournalLine: Record "Gen. Journal Line";
        ChqRecLines: Record 52185786;
        TCharges: Decimal;
        TransactionCharges: Record 52185774;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        CheqReg: Record 52185788;
        AvailBal: Decimal;
        MinBalance: Decimal;
        Account: Record 52185730;
        ProdType: Record 52185690;
        MobNo: Code[20];
        Text0003: label 'Your Cheque of Amount ';
        Text0004: label ' has been paid ';
    begin
        with ChReceiptH do begin

            Temp.Get(UserId);
            Jtemplate := Temp."Cashier Journal Template";
            JBatch := Temp."Cashier Journal Batch";

            if Jtemplate = '' then begin
                Error(Text0001);
            end;

            if JBatch = '' then begin
                Error(Text0002);
            end;

            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", Jtemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            GenJournalLine.DeleteAll;

            ///////

            if Confirm('Are you sure you want post cheques', true) = true then begin



                ChqRecLines.Reset;
                ChqRecLines.SetRange(ChqRecLines."Chq Receipt No", "No.");
                ChqRecLines.SetRange(ChqRecLines.Status, ChqRecLines.Status::Pending);

                if ChqRecLines.Find('-') then begin
                    repeat

                        if ChqRecLines."Un pay Code" = '' then begin
                            //Cheque Amounts

                            LineNo := LineNo + 10000;

                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := Jtemplate;
                            GenJournalLine."Journal Batch Name" := JBatch;
                            GenJournalLine."Document No." := "No.";
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := ChqRecLines."Account No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Posting Date" := "Transaction Date";
                            GenJournalLine."External Document No." := ChqRecLines."Cheque Serial No";
                            GenJournalLine.Description := 'Cheque Issued' + ChqRecLines."Cheque Serial No";
                            GenJournalLine.Amount := ChqRecLines.Amount;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            //GenJournalLine."Shortcut Dimension 1 Code":='';
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"Bank Account";
                            GenJournalLine."Bal. Account No." := "Clearing Bank";
                            //GenJournalLine."Shortcut Dimension 2 Code":=DBranch;
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;


                            //Charges
                            TCharges := 0;
                            TransactionCharges.Reset;
                            TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                            if TransactionCharges.Find('-') then begin
                                repeat
                                    LineNo := LineNo + 10000;
                                    ChargeAmount := 0;
                                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                                        ChargeAmount := (ChqRecLines.Amount * TransactionCharges."Percentage of Amount") * 0.01
                                    else
                                        ChargeAmount := TransactionCharges."Charge Amount";
                                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin
                                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
                                        TariffDetails.Reset;
                                        TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                        if TariffDetails.Find('-') then begin
                                            repeat
                                                if (ChqRecLines.Amount >= TariffDetails."Lower Limit") and (ChqRecLines.Amount <= TariffDetails."Upper Limit") then begin
                                                    if TariffDetails."Use Percentage" = true then begin
                                                        ChargeAmount := ChqRecLines.Amount * TariffDetails.Percentage * 0.01;
                                                    end else begin
                                                        ChargeAmount := TariffDetails."Charge Amount";
                                                    end;
                                                end;
                                            until TariffDetails.Next = 0;
                                        end;
                                    end;

                                    GenJournalLine.Init;
                                    GenJournalLine."Journal Template Name" := Jtemplate;
                                    GenJournalLine."Journal Batch Name" := JBatch;
                                    GenJournalLine."Document No." := "No.";
                                    GenJournalLine."Line No." := LineNo;
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                    GenJournalLine."Account No." := ChqRecLines."Account No.";
                                    //GenJournalLine."External Document No.":="ID No";
                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                    GenJournalLine."Posting Date" := "Transaction Date";
                                    GenJournalLine.Description := TransactionCharges.Description;
                                    GenJournalLine.Validate(GenJournalLine."Currency Code");
                                    GenJournalLine.Amount := ChargeAmount;
                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                    GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
                                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                    //GenJournalLine."Shortcut Dimension 1 Code":=DActivity2;
                                    //GenJournalLine."Shortcut Dimension 2 Code":=DBranch2;
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                    if GenJournalLine.Amount <> 0 then
                                        GenJournalLine.Insert;



                                    if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
                                    (TransactionCharges."Recover Excise Duty" = true) then begin
                                        //Excise Duty
                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := Jtemplate;
                                        GenJournalLine."Journal Batch Name" := JBatch;
                                        GenJournalLine."Document No." := "No.";
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                        GenJournalLine."Account No." := ChqRecLines."Account No.";
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Posting Date" := "Transaction Date";
                                        GenJournalLine.Description := 'Excise Duty';
                                        GenJournalLine.Validate(GenJournalLine."Currency Code");
                                        GenJournalLine.Amount := (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                        GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
                                        GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                        // GenJournalLine."Shortcut Dimension 1 Code":=DActivity2;
                                        //GenJournalLine."Shortcut Dimension 2 Code":=DBranch2;
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        TCharges := TCharges + ChargeAmount;
                                    end;
                                until TransactionCharges.Next = 0;
                            end;


                            AvailBal := 0;
                            MinBalance := 0;

                            if Account.Get(ChqRecLines."Account No.") then begin
                                Account.CalcFields(Account.Balance, Account."Uncleared Cheques", Account."Authorised Over Draft", Account."Lien Placed");

                                ProdType.Reset;
                                ProdType.SetRange(ProdType."Product ID", Account."Product Type");
                                if ProdType.Find('-') then begin
                                    MinBalance := ProdType."Minimum Balance";

                                    AvailBal := (Account.Balance + Account."Authorised Over Draft") - (MinBalance + Account."Uncleared Cheques" + Account."Lien Placed");

                                    if AvailBal < ChqRecLines.Amount then
                                        Error('The transaction will result in overdrawing account %1', ChqRecLines."Account No.");
                                end;
                            end;
                        end;
                    until ChqRecLines.Next = 0;
                end;


                //Post New
                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                if GenJournalLine.Find('-') then begin
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                end;

                //Mark cheque book register
                ChqRecLines.Reset;
                ChqRecLines.SetRange(ChqRecLines."Chq Receipt No", "No.");
                ChqRecLines.SetRange(ChqRecLines.Status, ChqRecLines.Status::Pending);
                if ChqRecLines.Find('-') then begin
                    repeat
                        CheqReg.Reset;
                        CheqReg.SetRange(CheqReg."Cheque No.", ChqRecLines."Cheque Serial No");
                        if CheqReg.Find('-') then begin
                            CheqReg.Status := CheqReg.Status::Approved;
                            CheqReg."Approval Date" := Today;
                            CheqReg.Modify;
                        end;


                        if Account.Get(ChqRecLines."Account No.") then begin
                            MobNo := Account."Transactional Mobile No";
                        end;


                        SendSMS.SendSms(Sourcetype::"Chq Book", MobNo, Text0003 + Format(ChqRecLines.Amount) + Text0004 + Format(Today) + ' ' + Format(Time)
                        + ' ' + COMPANYNAME, "No.", "No.", false);


                    until ChqRecLines.Next = 0;
                end;


                Posted := true;
                "Posted By" := UserId;
                Modify;

                Message('Transaction Posted Successfully');


            end;
            //////

        end;
    end;


    procedure PostUnpayCheques(ChReceiptH: Record 52185787)
    var
        Text0001: label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Salary Journal Batch is set up in Banking User Setup';
        GenJournalLine: Record "Gen. Journal Line";
        ChqRecLines: Record 52185786;
        TCharges: Decimal;
        TransactionCharges: Record 52185774;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        CheqReg: Record 52185788;
        ChequeCodes: Record 52185789;
        MobNo: Code[20];
        Account: Record 52185730;
        Text0003: label 'Your Cheque of Amount ';
        Text0004: label ' has been bounced ';
    begin
        with ChReceiptH do begin

            Temp.Get(UserId);
            Jtemplate := Temp."Cashier Journal Template";
            JBatch := Temp."Cashier Journal Batch";

            if Jtemplate = '' then begin
                Error(Text0001);
            end;

            if JBatch = '' then begin
                Error(Text0002);
            end;

            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", Jtemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            GenJournalLine.DeleteAll;

            /////////

            if Confirm('Are you sure you want to unpay accounts', false) = true then begin

                if UpperCase(UserId) = UpperCase("Posted By") then
                    Error('This must be done by another user');

                if Posted = false then
                    Error('It must be posted first');

                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                GenJournalLine.DeleteAll;

                ChqRecLines.Reset;
                ChqRecLines.SetRange(ChqRecLines."Chq Receipt No", "No.");
                ChqRecLines.SetRange(ChqRecLines.Status, ChqRecLines.Status::Pending);
                if ChqRecLines.Find('-') then begin
                    repeat

                        if ChqRecLines."Un pay Code" <> '' then begin


                            //Cheque Amounts

                            LineNo := LineNo + 10000;

                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := Jtemplate;
                            GenJournalLine."Journal Batch Name" := JBatch;
                            GenJournalLine."Document No." := "No.";
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := ChqRecLines."Account No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Posting Date" := "Transaction Date";
                            GenJournalLine."External Document No." := ChqRecLines."Cheque Serial No";
                            GenJournalLine.Description := 'Cheque Issued' + ChqRecLines."Cheque Serial No";
                            GenJournalLine.Amount := ChqRecLines.Amount * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            //GenJournalLine."Shortcut Dimension 1 Code":='FOSA';
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"Bank Account";
                            GenJournalLine."Bal. Account No." := "Clearing Bank";
                            //GenJournalLine."Shortcut Dimension 2 Code":=DBranch;
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            //Post cheque processing charges

                            LineNo := LineNo + 10000;

                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := Jtemplate;
                            GenJournalLine."Journal Batch Name" := JBatch;
                            GenJournalLine."Document No." := "No.";
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := ChqRecLines."Account No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Posting Date" := "Transaction Date";
                            GenJournalLine."External Document No." := ChqRecLines."Cheque Serial No";
                            GenJournalLine.Description := 'Cheque unpay Commision';
                            GenJournalLine.Amount := ChqRecLines."Un Pay Charge Amount";
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            //GenJournalLine."Shortcut Dimension 1 Code":='FOSA';
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            if ChequeCodes.Get(ChqRecLines."Un pay Code") then begin
                                ChequeCodes.TestField(ChequeCodes."Bounced Charges GL Account");
                                GenJournalLine."Bal. Account No." := ChequeCodes."Bounced Charges GL Account";
                            end;
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            //Excise duty
                            GenSetup.Get;

                            LineNo := LineNo + 10000;

                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := Jtemplate;
                            GenJournalLine."Journal Batch Name" := JBatch;
                            GenJournalLine."Document No." := "No.";
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := ChqRecLines."Account No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Posting Date" := "Transaction Date";
                            GenJournalLine."External Document No." := ChqRecLines."Cheque Serial No";
                            GenJournalLine.Description := 'Excise Duty';
                            GenJournalLine.Amount := ChqRecLines."Un Pay Charge Amount" * (GenSetup."Excise Duty (%)" / 100);
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            //GenJournalLine."Shortcut Dimension 1 Code":='FOSA';
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                        end;


                        if Account.Get(ChqRecLines."Account No.") then begin
                            MobNo := Account."Transactional Mobile No";
                        end;


                        SendSMS.SendSms(Sourcetype::"Chq Book", MobNo, Text0003 + Format(ChqRecLines.Amount) + Text0004 + Format(Today) + ' ' + Format(Time)
                        + ' ' + COMPANYNAME, "No.", "No.", false);
                    until ChqRecLines.Next = 0;
                end;


                //Post New
                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                if GenJournalLine.Find('-') then begin
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                end;



                "Unpaid By" := UserId;
                Unpaid := true;
                Modify;
            end;
            ////////

        end;
    end;

    local procedure "***********************************"()
    begin
    end;


    procedure getTransferStandingOrderLines(ElectronicFundsH: Record 52185715)
    var
        Text0001: label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
        Text0003: label 'Ensure the Default Bank is set up in User Setup';
        StandingOrdHdr: Record 52185717;
        StandingOrdLine: Record 52185718;
        Text0004: label 'The transaction has already been Processed.';
        ElectronicFundsL: Record 52185716;
    begin
        with ElectronicFundsH do begin
            if ElectronicFundsH.Status = ElectronicFundsH.Status::Transferred then
                Error(Text0004);

            ElectronicFundsH.TestField(ElectronicFundsH."Account No.");
            ElectronicFundsH.TestField(ElectronicFundsH."Start Date");
            ElectronicFundsH.TestField(ElectronicFundsH."End Date");

            ElectronicFundsL.Reset;
            ElectronicFundsL.SetRange(ElectronicFundsL."Document No.", ElectronicFundsH."No.");
            ElectronicFundsL.SetFilter(ElectronicFundsL."Standing Order Register No", '<>%1', '');
            if ElectronicFundsL.Find('-') then
                ElectronicFundsL.DeleteAll;

            STORegister.Reset;
            STORegister.SetRange(STORegister.EFT, true);
            STORegister.SetRange(STORegister."Date Processed", ElectronicFundsH."Start Date", ElectronicFundsH."End Date");
            STORegister.SetRange(STORegister."Transfered to EFT", false);
            if STORegister.Find('-') then begin
                repeat
                    StandingOrdLine.Reset;
                    StandingOrdLine.SetRange(StandingOrdLine."Document No.", STORegister."Document No.");
                    StandingOrdLine.SetFilter(StandingOrdLine."Destination Account Type", '%1', StandingOrdLine."destination account type"::External);
                    StandingOrdLine.SetFilter(StandingOrdLine."Destination Account No.", ElectronicFundsH."Account No.");
                    if StandingOrdLine.Find('-') then begin
                        repeat
                            if StandingOrdHdr.Get(StandingOrdLine."Document No.") then
                                EntrNo += 1;
                            ElectronicFundsL.Init;
                            ElectronicFundsL.No := '';
                            ElectronicFundsL."Document No." := ElectronicFundsH."No.";
                            ElectronicFundsL."Entered By" := UserId;
                            ElectronicFundsL."Account Type" := StandingOrdHdr."Source Account Type";
                            ElectronicFundsL.Validate(ElectronicFundsL."Account No.", StandingOrdHdr."Source Account No.");
                            ElectronicFundsL."External Account Name" := PadStr(STORegister.Remarks, 50);
                            ElectronicFundsL.Validate(ElectronicFundsL."Don't Charge", false);
                            ElectronicFundsL."Phone No." := '';
                            ElectronicFundsL.Validate(ElectronicFundsL.Amount, StandingOrdLine.Amount);
                            ElectronicFundsL.Validate(ElectronicFundsL."Bank Code", StandingOrdLine."Bank Code");
                            ElectronicFundsL."Branch Code" := StandingOrdLine."Branch Code";
                            ElectronicFundsL."External Account No." := Format(StandingOrdLine."Bank Account No.");
                            ElectronicFundsL."Account Name" := StandingOrdLine."Destination Account Name";
                            ElectronicFundsL."Standing Order Register No" := STORegister."No.";
                            ElectronicFundsL.Insert;
                        until StandingOrdLine.Next = 0;
                    end;
                until STORegister.Next = 0;
            end;
        end;
        StandingOrdLine.Reset;
        StandingOrdLine.SetRange("Document No.", ElectronicFundsL."Standing Order No");
        StandingOrdLine.SetFilter("Destination Account Type", '', StandingOrdLine."destination account type"::External);
        if StandingOrdLine.FindFirst then begin
            repeat
                ElectronicFundsL."External Account No." := StandingOrdLine."Bank Account No.";
                ElectronicFundsL.Modify;

            until StandingOrdLine.Next = 0;

        end;
    end;


    procedure ElectronicFundsProcessing(ElectronicFundsH: Record 52185715)
    var
        Text002: label 'Your application for fund transfer has been effect by ';
        Text003: label 'Follow up using Reference No. ';
        Text004: label 'The transaction has already been Processed.';
        ElectronicFundsL: Record 52185716;
        Text005: label 'Destnation account name of staff no %1 more than %2 characters.';
        Text006: label 'Destnation account of staff no %1 more than 14 characters.';
        Text007: label 'Posted successfully.';
        ChargeAmount: Decimal;
        TChargeAmount: Decimal;
        TransactionCharges: Record 52185774;
        TariffDetails: Record 52185777;
        TCharges: Decimal;
        FundTransfer: label 'Fund Transfer';
        MobileNo: Code[20];
        CashierTransactions: Record 52185776;
        ChargesNet: Decimal;
    begin
        GenSetup.Get();
        Temp.Get(UserId);
        Temp.TestField(Temp."Cashier Journal Template");
        Temp.TestField(Temp."Cashier Journal Batch");
        Jtemplate := Temp."Cashier Journal Template";
        JBatch := Temp."Cashier Journal Batch";

        GenJLine.Reset;
        GenJLine.SetRange(GenJLine."Journal Template Name", Jtemplate);
        GenJLine.SetRange(GenJLine."Journal Batch Name", JBatch);
        GenJLine.DeleteAll;

        with ElectronicFundsH do begin
            if ElectronicFundsH.Status = ElectronicFundsH.Status::Transferred then
                Error(Text004);
            ElectronicFundsH.CalcFields(ElectronicFundsH."Record Total");

            ElectronicFundsL.Reset;
            ElectronicFundsL.SetRange(ElectronicFundsL."Document No.", ElectronicFundsH."No.");
            if ElectronicFundsL.Find('-') then begin
                repeat
                    ElectronicFundsL.TestField(ElectronicFundsL."Account No.");
                    ElectronicFundsL.TestField(ElectronicFundsL."Account Name");
                    ElectronicFundsL.TestField(ElectronicFundsL.Amount);
                    ElectronicFundsL.TestField(ElectronicFundsL."Bank Code");
                    //ElectronicFundsL.TESTFIELD(ElectronicFundsL."Branch Code");
                    ElectronicFundsL.TestField(ElectronicFundsL."Bank Name");

                    if StrLen(ElectronicFundsL."Account Name") > GenSetup."EFT Dest Acc Length" then
                        Error(Text005, ElectronicFundsL."Account No.", GenSetup."EFT Dest Acc Length");

                    if StrLen(ElectronicFundsL."External Account No.") > 14 then
                        Error(Text006, ElectronicFundsL."External Account No.");

                    if ElectronicFundsL."Standing Order No" <> '' then begin
                        AccNo := GenSetup."External STO Account No.";
                        AccTypes := Acctypes::"G/L Account";

                    end else begin
                        AccNo := ElectronicFundsL."Account No.";
                        AccTypes := Acctypes::Savings;
                    end;

                    //Line Posting
                    ElectronicFundsJournal(Jtemplate, JBatch, Today, ElectronicFundsH."No.", '', AccTypes, AccNo,
                                           PadStr('EFT To Account ' + ElectronicFundsL."External Account No.", 50), ElectronicFundsL.Amount, '', '', BalAccountType, '');

                    //Charge Posting
                    if not ElectronicFundsL."Don't Charge" then begin
                        ChargeAmount := 0;
                        ChargesNet := 0;
                        TransactionCharges.Reset;
                        TransactionCharges.SetRange(TransactionCharges."Transaction Type", ElectronicFundsH."Transaction Type");
                        if TransactionCharges.Find('-') then begin
                            repeat
                                if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" then
                                    ChargeAmount += (ElectronicFundsL.Amount * TransactionCharges."Percentage of Amount") * 0.01
                                else
                                    ChargeAmount += TransactionCharges."Charge Amount";

                                if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin
                                    TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
                                    TariffDetails.Reset;
                                    TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                    if TariffDetails.Find('-') then begin
                                        repeat
                                            if (ChargeAmount >= TariffDetails."Lower Limit") and (ChargeAmount <= TariffDetails."Upper Limit") then begin
                                                if TariffDetails."Use Percentage" then
                                                    ChargeAmount += ElectronicFundsL.Amount * TariffDetails.Percentage * 0.01
                                                else
                                                    ChargeAmount += TariffDetails."Charge Amount";
                                            end;
                                        until TariffDetails.Next = 0;
                                    end;
                                end;
                                //DEBIT ACCOUNT
                                ElectronicFundsJournal(Jtemplate, JBatch, Today, ElectronicFundsH."No.", '', ElectronicFundsL."Account Type", ElectronicFundsL."Account No.",
                                                       PadStr(TransactionCharges.Description, 50), ElectronicFundsL."Charge Amount", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", Balaccounttype::"G/L Account", '');
                                ChargesNet := ChargeAmount;//(ChargeAmount-ElectronicFundsL."Excise Duty")*-1;
                                                           //CREDIT GL
                                ElectronicFundsJournal(Jtemplate, JBatch, Today, ElectronicFundsH."No.", '', ElectronicFundsL."account type"::"G/L Account", TransactionCharges."G/L Account",
                                                        PadStr(FundTransfer + ' :- ' + TransactionCharges.Description, 50), ChargesNet * -1, "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", Balaccounttype::"G/L Account", '');

                                //CREDIT Excise Duty GL
                                GenSetup.Get;
                                ElectronicFundsJournal(Jtemplate, JBatch, Today, ElectronicFundsH."No.", '', ElectronicFundsL."account type"::"G/L Account", GenSetup."Excise Duty G/L",
                                                        PadStr(FundTransfer + ' :- ' + 'Excise Duty', 50), ChargesNet * -(GenSetup."Excise Duty (%)" / 100), "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", Balaccounttype::"G/L Account", '');

                            until TransactionCharges.Next = 0;
                            TCharges := ChargeAmount;
                        end;
                        /*
                          //Excise Duty on Charge Posting
                          GenSetup.GET;
                        {  ElectronicFundsJournal(Jtemplate,JBatch,TODAY,ElectronicFundsH."No.",'',ElectronicFundsL."Account Type",ElectronicFundsL."Account No.",
                                                 PADSTR('Excise Duty :- ' + FundTransfer +' - '+ ElectronicFundsL."Account No.",50),TCharges*(GenSetup."Excise Duty (%)"/100),"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                                                 BalAccountType::"G/L Account",GenSetup."Excise Duty G/L");}
                          ElectronicFundsJournal(Jtemplate,JBatch,TODAY,ElectronicFundsH."No.",'',ElectronicFundsL."Account Type"::"G/L Account",{ElectronicFundsL."Account No."}GenSetup."Excise Duty G/L",
                          PADSTR('Excise Duty :- ' + FundTransfer +' - '+ ElectronicFundsL."Account No.",50),ElectronicFundsL."Excise Duty"*-1{TCharges*(GenSetup."Excise Duty (%)"/100)},"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                          BalAccountType::"G/L Account",{GenSetup."Excise Duty G/L"}'');
                          */
                    end;
                until ElectronicFundsL.Next = 0;
            end;

            //Header Posting
            ElectronicFundsJournal(Jtemplate, JBatch, Today, ElectronicFundsH."No.", '', ElectronicFundsH."Account Type", ElectronicFundsH."Account No.",
                                   PadStr(Format(ElectronicFundsH."Document Type"), 50), -ElectronicFundsH."Record Total", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", BalAccountType, '');
        end;
        GenJLine.Reset;
        GenJLine.SetRange(GenJLine."Journal Template Name", Jtemplate);
        GenJLine.SetRange(GenJLine."Journal Batch Name", JBatch);
        if GenJLine.Find('-') then begin
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJLine);
        end;

        Post := false;
        Post := JournlPosted.PostedSuccessfully;
        if Post then begin

            ElectronicFundsL.Reset;
            ElectronicFundsL.SetRange(ElectronicFundsL."Document No.", ElectronicFundsH."No.");
            ElectronicFundsL.SetRange(ElectronicFundsL.Transferred, false);
            if ElectronicFundsL.Find('-') then begin
                repeat

                    case ElectronicFundsL."Account Type" of
                        ElectronicFundsL."account type"::Savings:
                            begin
                                if SavingsACC.Get(ElectronicFundsL."Account No.") then
                                    if SavingsACC."Mobile Phone No" <> '' then
                                        MobileNo := SavingsACC."Mobile Phone No";

                                SendSMS.SendSms(Sourcetype::"EFT Effected", MobileNo, Text002 + COMPANYNAME + ', ' + Text003 +
                                                ElectronicFundsH."No.", ElectronicFundsH."No.", SavingsACC."No.", false);
                            end;
                    end;


                    //ElectronicFundsL.Transferred:=TRUE; ElectronicFundsL.MODIFY;

                    //* Mark the standing order register has transfered
                    STORegister.Reset;
                    STORegister.SetRange(STORegister."No.", ElectronicFundsL."Standing Order Register No");
                    STORegister.SetRange(STORegister."Transfered to EFT", false);
                    if STORegister.Find('-') then begin
                        STORegister."Transfered to EFT" := true;
                        STORegister.Modify;
                    end;
                    CashierTransactions.Reset;
                    CashierTransactions.SetRange("Account No", ElectronicFundsL."Account No.");
                    CashierTransactions.SetRange(Amount, (ElectronicFundsL.Amount + ElectronicFundsL."Charge Amount"));
                    CashierTransactions.SetRange(Remarks, 'EFT Amount');
                    CashierTransactions.SetRange(Payee, ElectronicFundsL."Document No.");
                    CashierTransactions.SetRange("Cheque Status", CashierTransactions."cheque status"::Pending);

                    if CashierTransactions.Find('-')
                      then begin
                        repeat
                            //ERROR('here');
                            CashierTransactions."Cheque Status" := CashierTransactions."cheque status"::Honoured;
                            CashierTransactions.Modify;
                        until CashierTransactions.Next = 0;
                    end
                until ElectronicFundsL.Next = 0;
            end;

            ElectronicFundsH.Status := ElectronicFundsH.Status::Transferred;
            ElectronicFundsH."Date Transferred" := Today;
            ElectronicFundsH."Time Transferred" := Time;
            ElectronicFundsH."Transferred By" := UserId;
            ElectronicFundsH.Modify;


        end;
        Message(Text007);

    end;


    procedure ElectronicFundsJournal(Jtemplate: Code[10]; JBatch: Code[10]; PostingDate: Date; DocNo: Code[10]; ExtDocNo: Code[10]; AccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit; AccountNo: Code[20]; Desc: Text; JnlAmount: Decimal; GlobalDim1: Code[10]; GlobalDim2: Code[10]; BalAccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit; BalAccountNo: Code[20])
    var
        Text0001: label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
        Text0003: label 'Ensure the Default Bank is set up in User Setup';
    begin
        LineNo += 1;
        GenJLine.Init;
        GenJLine."Journal Template Name" := Jtemplate;
        GenJLine."Journal Batch Name" := JBatch;
        GenJLine."Line No." := LineNo;
        GenJLine."Posting Date" := PostingDate;
        GenJLine."Document No." := DocNo;
        GenJLine."External Document No." := ExtDocNo;
        GenJLine."Account Type" := AccountType;
        GenJLine.Validate(GenJLine."Account No.", AccountNo);
        GenJLine.Description := Desc;
        GenJLine.Validate(GenJLine.Amount, JnlAmount);
        GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
        GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
        GenJLine."Bal. Account Type" := BalAccountType;
        GenJLine.Validate(GenJLine."Bal. Account No.", BalAccountNo);
        if GenJLine.Amount <> 0 then
            GenJLine.Insert;
    end;

    local procedure "******************************Ma Interests"()
    begin
    end;


    procedure GenerateSavingssInterest(SavingsInterestHeader: Record 52185845)
    var
        InterestBuffer: Record 52185846;
        InterestBuffer2: Record 52185846;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit,TreasuryTransactions,BSC,"Risk Claim",Delegate,Maint,TellerTransactions,ATMM,GeneralRepair,Saccotransffers,ImprestSurrender,"BL Opening","Risk Closure","Defaulter Recovery","Guarantors Subsitute",MPESAApp,MPESAChange;
        PeriodicActivities: Codeunit "Periodic Activities";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        SavingsAccounts: Record 52185730;
        FromDateS: Text[100];
        ToDateS: Text[100];
        DateFilter: Text[100];
        ProductFactory: Record 52185690;
        ProductFactoryCode: Code[20];
        InterestRate: Decimal;
        PayableAccount: Code[20];
        ExpenseAccount: Code[20];
        BankingUserTemplate: Record 52185782;
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        JTemp: Code[20];
        JBatch: Code[20];
        PageEditable: Boolean;
        Members: Record 52185700;
        ErrNotApproved: label 'This document has not been approved';
        ErrNoEntries: label 'This Document has no Lines to post';
        MSGEntriesGenerated: label 'Entries Generated Successfully';
        MSGConfirmation: label 'Confirm interest Generation for period starting %1 and Ending %2';
        ErrPosted: label 'This document has already been posted';
        IntDays: Integer;
        BalAccount: Record 52185730;
        Bal: Decimal;
        Account: Record 52185730;
        IntRate: Decimal;
        LowestBal: Decimal;
        MinBal: Boolean;
        RIntDays: Integer;
        AsAt: Date;
        StartDate: Date;
        AccruedInt: Decimal;
        Turn: Integer;
        diaProgress: Dialog;
        intProgress: Integer;
        timProgress: Time;
        intProgressI: Integer;
        intProgressTotal: Integer;
        Counter1: Integer;
        GeneratingDividends: label 'Generating Interest :';
        Counter2: Integer;
        PercentComplete: Decimal;
        MonthDays: Integer;
    begin
        with SavingsInterestHeader do begin
            TestField(Posted, false);
            TestField("Start Date");
            TestField("End Date");
            TestField(Description);
            TestField("Responsibility Center");
            TestField("Shortcut Dimension 1 Code");
            TestField("Document No.");
            TestField("Shortcut Dimension 2 Code");
            AsAt := "Start Date";
            // Turn:=0;
            IntDays := 0;
            RIntDays := 0;
            MonthDays := 0;

            if not Confirm(MSGConfirmation, true, "Start Date", "End Date") then
                exit;
            //Delete entries
            InterestBuffer2.Reset;
            InterestBuffer2.SetRange(InterestBuffer2.No, "No.");
            if InterestBuffer2.Find('-') then
                InterestBuffer2.DeleteAll;
            Counter2 := SavingsAccounts.Count * 30;
            // diaProgress.OPEN(GeneratingDividends+'@1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@',intProgress);
            diaProgress.Open('@1@@@@@@@@@@@\#2############');
            Evaluate(FromDateS, Format("Start Date"));
            Evaluate(ToDateS, Format("End Date"));
            DateFilter :=/*FromDateS*/'01/01/2005' + '..' + ToDateS;
            MonthDays := (CalcDate('<CM>', "Start Date") - "Start Date") + 1;
            SavingsAccounts.Reset;
            //SavingsAccounts.SETRANGE("No.",'L01-00003');
            SavingsAccounts.SetFilter(SavingsAccounts."Date Filter", DateFilter);
            if SavingsAccounts.Find('-') then begin
                repeat
                    if ProductFactory.Get(SavingsAccounts."Product Type") then begin//Product Factory Found
                        ProductFactoryCode := ProductFactory."Product ID";
                        if (ProductFactory."Product Class Type" = ProductFactory."product class type"::Savings) and (ProductFactory."Product Category" = ProductFactory."product category"::" ")
                          and (ProductFactory."Earns Interest" = true) then begin//Product Factory Prime
                            Counter1 += 1;
                            PercentComplete := ROUND(Counter1 / Counter2 * 10000, 1);
                            // diaProgress.UPDATE(1,ROUND((Counter1/Counter2),1,'>')*10000);
                            diaProgress.Update(1, PercentComplete);
                            diaProgress.Update(2, PercentComplete);
                            SavingsAccounts.CalcFields(SavingsAccounts.Balance);
                            if SavingsAccounts.Balance > 0 then begin//BAL>0
                                Turn := 0;
                                IntDays := ("End Date" - "Start Date") + 1;
                                RIntDays := IntDays;
                                LowestBal := 0;

                                InterestRate := ProductFactory."Interest Rate (Min.)";
                                PayableAccount := ProductFactory."Interest Payable Account";
                                ExpenseAccount := ProductFactory."Interest Expense Account";
                                repeat
                                    RIntDays := RIntDays - 1;
                                    DateFilter := '01/01/2005' + '..' + Format(AsAt);
                                    // MESSAGE(DateFilter);
                                    Account.Reset;
                                    Account.SetRange(Account."No.", SavingsAccounts."No.");
                                    Account.SetFilter(Account."Date Filter", DateFilter);
                                    if Account.Find('-') then begin//Account found
                                        Account.CalcFields(Account."Net Change (LCY)", Account."Balance (LCY)");
                                        Bal := Account."Net Change (LCY)";
                                        // MESSAGE('Bal is %1',Bal);
                                        if Account."Net Change (LCY)" >= ProductFactory."Interest Calc Min Balance" then begin // Balalnce is greater then bal in Product
                                            IntRate := ProductFactory."Interest Rate (Min.)";
                                            if Turn = 0 then
                                                LowestBal := Bal//Account."Net Change (LCY)"
                                            else
                                                if LowestBal > Bal/*Account."Net Change (LCY)"*/ then
                                                    LowestBal := Bal;//Account."Net Change (LCY)";
                                                                     //  MESSAGE('Lowest Bal %1',LowestBal);
                                        end; // Balalnce is greater then bal in Product
                                    end;//end of Account found
                                        //Turn:=Turn+1;
                                    Turn += 1;
                                    AsAt := CalcDate('1D', AsAt);
                                until RIntDays = 0;
                                //**************************************************************************************************************************************
                                InterestBuffer.Init;
                                InterestBuffer.No := "No.";
                                InterestBuffer."Account No" := SavingsAccounts."No.";
                                InterestBuffer.Name := SavingsAccounts.Name;
                                InterestBuffer."Account Type" := InterestBuffer."account type"::Savings;
                                InterestBuffer."Bal. Account Type" := InterestBuffer."bal. account type"::"G/L Account";
                                InterestBuffer."Payable Account" := PayableAccount;
                                InterestBuffer."Expense Account" := ExpenseAccount;
                                InterestBuffer."Account Balance" := LowestBal;//SavingsAccounts.Balance;
                                InterestBuffer.Blocked := SavingsAccounts.Blocked;
                                InterestBuffer.Description := Description;
                                InterestBuffer."Interest Date" := CalcDate('<CM>', "Start Date");
                                InterestBuffer."Interest Rate" := InterestRate;
                                InterestBuffer."Interest Amount" := LowestBal/*SavingsAccounts.Balance*/* ((InterestRate * MonthDays) / 36500);
                                InterestBuffer."Product Factory Code" := ProductFactoryCode;
                                if Members.Get(SavingsAccounts."Member No.") then begin
                                    InterestBuffer."Shortcut Dimension 1 Code" := Members."Global Dimension 1 Code";//SavingsAccounts."Global Dimension 1 Code";
                                    InterestBuffer."Shortcut Dimension 2 Code" := Members."Global Dimension 2 Code";//SavingsAccounts."Global Dimension 2 Code";
                                end;
                                InterestBuffer."User ID" := UserId;
                                if InterestBuffer."Interest Amount" <> 0 then
                                    InterestBuffer.Insert(true);
                            end;//BAL>0

                        end;//end of prime account
                    end;//End of Product Factory
                until SavingsAccounts.Next = 0;
            end;
            diaProgress.Close;
        end;
        Message(MSGEntriesGenerated);

    end;


    procedure PostSavingsInterest(SavingsInterestHeader: Record 52185845)
    var
        InterestBuffer: Record 52185846;
        InterestBuffer2: Record 52185846;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit,TreasuryTransactions,BSC,"Risk Claim",Delegate,Maint,TellerTransactions,ATMM,GeneralRepair,Saccotransffers,ImprestSurrender,"BL Opening","Risk Closure","Defaulter Recovery","Guarantors Subsitute",MPESAApp,MPESAChange;
        PeriodicActivities: Codeunit "Periodic Activities";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        SavingsAccounts: Record 52185730;
        FromDateS: Text[100];
        ToDateS: Text[100];
        DateFilter: Text[100];
        ProductFactory: Record 52185690;
        ProductFactoryCode: Code[20];
        InterestRate: Decimal;
        PayableAccount: Code[20];
        ExpenseAccount: Code[20];
        BankingUserTemplate: Record 52185782;
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        JTemp: Code[20];
        JBatch: Code[20];
        PageEditable: Boolean;
        Members: Record 52185700;
        ErrNotApproved: label 'This document has not been approved';
        ErrNoEntries: label 'This Document has no Lines to post';
        MSGEntriesGenerated: label 'Entries Generated Successfully';
        MSGConfirmation: label 'Confirm interest Generation for period starting %1 and Ending %2';
        ErrPosted: label 'This document has already been posted';
    begin

        if not Confirm('Do you want to post the journal lines?') = true then exit;

        with SavingsInterestHeader do begin
            if Posted = true then
                Error(ErrPosted);
            if Status <> Status::Approved then
                Error(ErrNotApproved);
            CalcFields("Distributed Amount");
            if "Distributed Amount" = 0 then
                Error(ErrNoEntries);
            if BankingUserTemplate.Get(UserId) then begin
                JTemp := BankingUserTemplate."Interest Account Template";
                JBatch := BankingUserTemplate."Interest Account Batch";
            end;

            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", JTemp);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            if GenJournalLine.Find('-') then
                GenJournalLine.DeleteAll;

            InterestBuffer.Reset;
            InterestBuffer.SetRange(InterestBuffer.No, "No.");
            if InterestBuffer.Find('-') then begin
                repeat
                    LineNo := LineNo + 10000;
                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := JTemp;
                    GenJournalLine."Journal Batch Name" := JBatch;
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                    GenJournalLine."Account No." := InterestBuffer."Expense Account";
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine."Document No." := "Document No.";
                    GenJournalLine."Posting Date" := "Posting Date";
                    GenJournalLine.Description := Description;
                    GenJournalLine.Amount := InterestBuffer."Interest Amount";
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                    GenJournalLine."Bal. Account No." := InterestBuffer."Payable Account";
                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                    GenJournalLine."Shortcut Dimension 1 Code" := InterestBuffer."Shortcut Dimension 1 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine."Shortcut Dimension 2 Code" := InterestBuffer."Shortcut Dimension 2 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;
                until InterestBuffer.Next = 0;
            end;

            //Post New
            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", JTemp);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            if GenJournalLine.Find('-') then begin
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
            end;
            Message('Posted Successfully');
            Posted := true;
            "Posted By" := UserId;
            "Posting Date" := Today;
            Modify;
        end;
    end;


    procedure GenerateEndYearInterest(EndYearTransferHeader: Record 52185847)
    var
        InterestBuffer: Record 52185848;
        InterestBuffer2: Record 52185848;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit,TreasuryTransactions,BSC,"Risk Claim",Delegate,Maint,TellerTransactions,ATMM,GeneralRepair,Saccotransffers,ImprestSurrender,"BL Opening","Risk Closure","Defaulter Recovery","Guarantors Subsitute",MPESAApp,MPESAChange;
        PeriodicActivities: Codeunit "Periodic Activities";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        SavingsAccounts: Record 52185730;
        FromDateS: Text[100];
        ToDateS: Text[100];
        DateFilter: Text[100];
        ProductFactory: Record 52185690;
        ProductFactoryCode: Code[20];
        InterestRate: Decimal;
        PayableAccount: Code[20];
        ExpenseAccount: Code[20];
        BankingUserTemplate: Record 52185782;
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        JTemp: Code[20];
        JBatch: Code[20];
        PageEditable: Boolean;
        Members: Record 52185700;
        SavingsInterestBuffer: Record 52185846;
        IntEarned: Decimal;
        ErrNotApproved: label 'This document has not been approved';
        ErrNoEntries: label 'This Document has no Lines to post';
        MSGEntriesGenerated: label 'Entries Generated Successfully';
        MSGConfirmation: label 'Confirm interest Generation for period starting %1 and Ending %2';
        ErrPosted: label 'This document has already been posted';
    begin
        with EndYearTransferHeader do begin
            TestField("Start Date");
            TestField("End Date");
            TestField(Description);
            TestField("Responsibility Center");
            TestField("Shortcut Dimension 1 Code");
            TestField("Document No.");
            TestField("Shortcut Dimension 2 Code");
            IntEarned := 0;

            if not Confirm(MSGConfirmation, true, "Start Date", "End Date") then
                exit else begin
                InterestBuffer2.Reset;
                InterestBuffer2.SetRange(InterestBuffer2.No, "No.");
                if InterestBuffer2.Find('-') then
                    if Posted = false then
                        InterestBuffer2.DeleteAll else
                        Error(ErrPosted);

                IntEarned := 0;
                SavingsAccounts.Reset;
                //SavingsAccounts.SETRANGE(SavingsAccounts.Status,SavingsAccounts.Status::New);
                if SavingsAccounts.Find('-') then begin
                    //SavingsAccounts.CALCFIELDS("Savings Interest Earned");
                    repeat
                        // IF SavingsAccounts."Savings Interest Earned">0 THEN
                        //  BEGIN
                        IntEarned := 0;
                        if ProductFactory.Get(SavingsAccounts."Product Type") then begin
                            ProductFactoryCode := ProductFactory."Product ID";
                            InterestRate := ProductFactory."Interest Rate (Min.)";
                            PayableAccount := ProductFactory."Interest Payable Account";
                            ExpenseAccount := ProductFactory."Interest Expense Account";
                        end;
                        /*
                                SavingsInterestBuffer.RESET;
                                SavingsInterestBuffer.SETRANGE(SavingsInterestBuffer."Account No",SavingsAccounts."No.");
                                IF SavingsInterestBuffer.FIND('-') THEN
                                  BEGIN
                                    IntEarned:=0;
                                    REPEAT
                                      IF (InterestBuffer."Interest Date">="Start Date") AND (InterestBuffer."Interest Date"<="End Date") THEN
                                      IntEarned+=SavingsInterestBuffer."Interest Amount";
                                      UNTIL SavingsInterestBuffer.NEXT=0;
                                    END;
                        */
                        SavingsInterestBuffer.SetCurrentkey(SavingsInterestBuffer."Account No", SavingsInterestBuffer."Interest Date");
                        SavingsInterestBuffer.SetRange(SavingsInterestBuffer."Account No", SavingsAccounts."No.");
                        SavingsInterestBuffer.SetRange(SavingsInterestBuffer."Interest Date", "Start Date", "End Date");
                        SavingsInterestBuffer.CalcSums(SavingsInterestBuffer."Interest Amount");
                        IntEarned := SavingsInterestBuffer."Interest Amount";
                        //IF IntEarned<>0 THEN
                        // MESSAGE('here %1',IntEarned);
                        InterestBuffer.Init;
                        InterestBuffer."Account No" := SavingsAccounts."No.";
                        InterestBuffer."Account Type" := InterestBuffer."account type"::Savings;
                        SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                        InterestBuffer."Account Balance" := SavingsAccounts."Balance (LCY)";
                        InterestBuffer."Bal. Account Type" := InterestBuffer."bal. account type"::"G/L Account";
                        InterestBuffer.Blocked := SavingsAccounts.Blocked;
                        InterestBuffer.Description := Description;
                        InterestBuffer."Interest Amount" := IntEarned;
                        InterestBuffer."Interest Date" := "End Date";
                        InterestBuffer.Name := SavingsAccounts.Name;
                        InterestBuffer.No := "No.";
                        InterestBuffer."Payable Account" := PayableAccount;
                        InterestBuffer."Product Factory Code" := SavingsAccounts."Product Type";
                        if Members.Get(SavingsAccounts."Member No.") then begin
                            InterestBuffer."Shortcut Dimension 1 Code" := Members."Global Dimension 1 Code";
                            InterestBuffer."Shortcut Dimension 2 Code" := Members."Global Dimension 2 Code";
                        end;
                        InterestBuffer."User ID" := UserId;
                        if InterestBuffer."Interest Amount" <> 0 then
                            InterestBuffer.Insert(true);
                    //END;
                    until SavingsAccounts.Next = 0;
                end;
            end;
            Message(MSGEntriesGenerated);
        end;

    end;


    procedure PostEndYearInterest(EndYearTransferHeader: Record 52185847)
    var
        InterestBuffer: Record 52185848;
        InterestBuffer2: Record 52185848;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit,TreasuryTransactions,BSC,"Risk Claim",Delegate,Maint,TellerTransactions,ATMM,GeneralRepair,Saccotransffers,ImprestSurrender,"BL Opening","Risk Closure","Defaulter Recovery","Guarantors Subsitute",MPESAApp,MPESAChange;
        PeriodicActivities: Codeunit "Periodic Activities";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        SavingsAccounts: Record 52185730;
        FromDateS: Text[100];
        ToDateS: Text[100];
        DateFilter: Text[100];
        ProductFactory: Record 52185690;
        ProductFactoryCode: Code[20];
        InterestRate: Decimal;
        PayableAccount: Code[20];
        ExpenseAccount: Code[20];
        BankingUserTemplate: Record 52185782;
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        JTemp: Code[20];
        JBatch: Code[20];
        PageEditable: Boolean;
        Members: Record 52185700;
        SavingsInterestBuffer: Record 52185846;
        IntEarned: Decimal;
        ErrNotApproved: label 'This document has not been approved';
        ErrNoEntries: label 'This Document has no Lines to post';
        MSGEntriesGenerated: label 'Entries Generated Successfully';
        MSGConfirmation: label 'Confirm interest Generation for period starting %1 and Ending %2';
        ErrPosted: label 'This document has already been posted';
        MSGPostedSuccessfully: label 'Posted Successfully.';
        Sav: Record 52185730;
    begin
        with EndYearTransferHeader do begin
            if Status <> Status::Approved then
                Error(ErrNotApproved);
            if Posted = true then
                Error(ErrPosted);
            CalcFields("Distributed Amount");
            if "Distributed Amount" = 0 then
                Error(ErrNoEntries);
            if BankingUserTemplate.Get(UserId) then begin
                JTemp := BankingUserTemplate."Interest Account Template";
                JBatch := BankingUserTemplate."Interest Account Batch";
            end;

            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", JTemp);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            if GenJournalLine.Find('-') then
                GenJournalLine.DeleteAll;

            InterestBuffer.Reset;
            InterestBuffer.SetRange(InterestBuffer.No, "No.");
            if InterestBuffer.Find('-') then begin
                repeat
                    //Credit Account
                    LineNo := LineNo + 10000;
                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := JTemp;
                    GenJournalLine."Journal Batch Name" := JBatch;
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Account Type" := InterestBuffer."Account Type";
                    GenJournalLine."Account No." := InterestBuffer."Account No";
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine."Document No." := "Document No.";
                    GenJournalLine."Posting Date" := "Posting Date";
                    GenJournalLine.Description := Description;
                    GenJournalLine.Amount := -InterestBuffer."Interest Amount";
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Bal. Account Type" := InterestBuffer."Bal. Account Type";
                    GenJournalLine."Bal. Account No." := InterestBuffer."Payable Account";
                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                    GenJournalLine."Shortcut Dimension 1 Code" := InterestBuffer."Shortcut Dimension 1 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine."Shortcut Dimension 2 Code" := InterestBuffer."Shortcut Dimension 2 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;

                    //Withholding Tax
                    ProductFactory.Get(InterestBuffer."Product Factory Code");
                    Sav.Reset;
                    Sav.SetRange("No.", InterestBuffer."Account No");
                    if Sav.Find('-') then begin

                        Memb.Reset;
                        Memb.SetRange("No.", Sav."Member No.");
                        Memb.SetRange("Tax Exempted", false);
                        if Memb.Find('-') then begin

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := JTemp;
                            GenJournalLine."Journal Batch Name" := JBatch;
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := InterestBuffer."Account Type";
                            GenJournalLine."Account No." := InterestBuffer."Account No";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := "Document No.";
                            GenJournalLine."Posting Date" := "Posting Date";
                            GenJournalLine.Description := Description;
                            ProductFactory.Get(InterestBuffer."Product Factory Code");
                            GenJournalLine.Amount := InterestBuffer."Interest Amount" * (ProductFactory."WithHolding Tax" / 100);
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := ProductFactory."Withholding Tax Account";
                            GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := InterestBuffer."Shortcut Dimension 1 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine."Shortcut Dimension 2 Code" := InterestBuffer."Shortcut Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then begin
                                ProductFactory.TestField("Withholding Tax Account");
                                GenJournalLine.Insert;
                            end;
                        end;
                    end;
                    //Post New
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", JTemp);
                    GenJournalLine.SetRange("Journal Batch Name", JBatch);
                    if GenJournalLine.Find('-') then begin
                        Codeunit.Run(Codeunit::"Gen. Jnl.-B.Post", GenJournalLine);
                    end;

                    InterestBuffer.Posted := true;
                    InterestBuffer."User ID" := UserId;
                    InterestBuffer.Modify;
                    Commit;
                until InterestBuffer.Next = 0;
            end;

            Message(MSGPostedSuccessfully);
            Posted := true;
            "Posted By" := UserId;
            "Posting Date" := Today;
            Modify;
        end;
    end;


    procedure CollectATM(ATMApplications: Record 52185842)
    var
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit,TreasuryTransactions,BSC,"Risk Claim",Delegate,Maint,TellerTransactions,ATMM,GeneralRepair,Saccotransffers,ImprestSurrender,"BL Opening","Risk Closure","Defaulter Recovery","Guarantors Subsitute",MPESAApp,MPESAChange;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        SavingsAccounts: Record 52185730;
        PeriodicActivities: Codeunit "Periodic Activities";
        BankingUserTemplate: Record 52185782;
        JTemp: Code[20];
        JBatch: Code[20];
        ErrDocNotApproved: label 'This document has not been approved.';
        ErrLink: label 'Kindly Charge the ATM Fee.';
        ErrAlreadyCollected: label 'The ATM Card has already been collected.';
        CONFIRMIssue: label 'Are you sure you want to issue Card?';
        MSGOperationSuc: label 'Operation effected successfully.';
    begin
        with ATMApplications do begin
            if Status <> Status::Approved then Error(ErrDocNotApproved);
            if "ATM Charges Applied" <> true then Error(ErrLink);
            if Collected = true then
                Error(ErrAlreadyCollected);

            if Confirm(CONFIRMIssue, false) = true then begin

                Collected := true;
                "Card Issued" := true;
                "Date Collected" := Today;
                "Card Issued By" := UserId;
                "Card Status" := "card status"::Active;
                "Date Activated" := Today;
                Modify;

                SavingsAccounts.Reset;
                SavingsAccounts.SetRange(SavingsAccounts."No.", "Account No");
                if SavingsAccounts.Find('-') then begin
                    //MESSAGE(FORMAT(SavingsAccounts."No."));
                    SavingsAccounts."ATM No." := "Card No";
                    SavingsAccounts.Modify;
                end;

                Message(MSGOperationSuc);
            end;
        end;
    end;


    procedure LinkATM(ATMApplications: Record 52185842)
    var
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit,TreasuryTransactions,BSC,"Risk Claim",Delegate,Maint,TellerTransactions,ATMM,GeneralRepair,Saccotransffers,ImprestSurrender,"BL Opening","Risk Closure","Defaulter Recovery","Guarantors Subsitute",MPESAApp,MPESAChange;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        SavingsAccounts: Record 52185730;
        PeriodicActivities: Codeunit "Periodic Activities";
        BankingUserTemplate: Record 52185782;
        JTemp: Code[20];
        JBatch: Code[20];
        ErrPosted: label 'This document has not been approved.';
        ErrChargeATM: label 'Kindly Charge the ATM Fee.';
        ConfrmATMLink: label 'Are you sure you want to Link This ATM Card?';
        ErrATMLinked: label 'This ATM card is already linked.';
        MSGATMCardLinked: label 'ATM Card Successfully linked.';
        ErrOperationCancelled: label 'Operation cancelled';
        Txt004: label 'Your account has been linked to Sacco Link ATM.';
        ATMLinkingStatistics: Record 52185844;
    begin
        with ATMApplications do begin
            if Status <> Status::Approved then Error(ErrPosted);
            if "ATM Charges Applied" <> true then Error(ErrChargeATM);
            if Confirm(ConfrmATMLink, true) = true then begin
                if ("ATM Linked" = true) and ("ATM Delinked" = false) then Error(ErrATMLinked);
                TestField("Card No");
                SavingsAccounts.Reset;
                SavingsAccounts.SetRange(SavingsAccounts."No.", "Account No");
                if SavingsAccounts.Find('-') then begin
                    SavingsAccounts."ATM No." := "Card No";
                    "Linked Date" := Today;
                    "Linked By" := UserId;
                    "ATM Delinked Date" := Today;
                    "Card Status" := "card status"::Active;
                    "ATM Linked" := true;
                    "ATM Delinked" := false;
                    Modify;
                    SavingsAccounts.Modify;
                    ATMLinkingStatistics.Init;
                    ATMLinkingStatistics."Account No." := SavingsAccounts."No.";
                    ATMLinkingStatistics."Activity Date" := Today;
                    ATMLinkingStatistics."ATM Application No." := "ATM Application No.";
                    ATMLinkingStatistics."Linking Type" := ATMLinkingStatistics."linking type"::Linking;
                    ATMLinkingStatistics."User ID" := UserId;
                    ATMLinkingStatistics."Activity Time" := Time;
                    ATMLinkingStatistics.Insert(true);
                    //send sms
                    if SavingsACC.Get(ATMApplications."Account No") then begin
                        SendSMS.SendSms(Sourcetype::"ATM Collection", SavingsACC."Mobile Phone No", Txt004, ATMApplications."No.", SavingsAccounts."No.", false);
                    end;
                end;

                Message(MSGATMCardLinked);
            end else
                Error(ErrOperationCancelled);
        end;
    end;


    procedure DeLinkATM(ATMApplications: Record 52185842)
    var
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit,TreasuryTransactions,BSC,"Risk Claim",Delegate,Maint,TellerTransactions,ATMM,GeneralRepair,Saccotransffers,ImprestSurrender,"BL Opening","Risk Closure","Defaulter Recovery","Guarantors Subsitute",MPESAApp,MPESAChange;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        SavingsAccounts: Record 52185730;
        PeriodicActivities: Codeunit "Periodic Activities";
        BankingUserTemplate: Record 52185782;
        JTemp: Code[20];
        JBatch: Code[20];
        ConfrmATMLink: label 'Are you sure you want to delink This ATM Card?';
        ErrATMLinked: label 'This ATM card is already dellinked.';
        MSGATMCardLinked: label 'ATM Card Successfully delinked.';
        ErrOperationCancelled: label 'Operation cancelled';
        Txt004: label 'Your Account has been Delinked from ATM. In case of any query contact your branch.';
        ATMLinkingStatistics: Record 52185844;
        // [RunOnClient]
        Window: code[100];//dotnet Interaction;
        MyComment: Text;
    begin
        with ATMApplications do begin
            if Status <> Status::Approved then Error(ErrPosted);
            if Confirm(ConfrmATMLink, true) = true then begin
                if "ATM Delinked" = true then Error(ErrATMLinked);
                TestField("Card No");
                // MyComment := Window.InputBox('Enter reason for delinking ATM Card for ' + "Account Name", 'account:' + "Account No", '', 100, 100);
                if MyComment = '' then Error('Kindly Enter reason for delinking');
                SavingsAccounts.Reset;
                SavingsAccounts.SetRange(SavingsAccounts."No.", "Account No");
                if SavingsAccounts.Find('-') then begin
                    SavingsAccounts."ATM No." := '';
                    "ATM Delinked Date" := Today;
                    "Delinked By" := UserId;
                    "ATM Delinked" := true;
                    "ATM Linked" := false;
                    "Card Status" := "card status"::Frozen;
                    Modify;
                    SavingsAccounts.Modify;
                    ATMLinkingStatistics.Init;
                    ATMLinkingStatistics."Account No." := SavingsAccounts."No.";
                    ATMLinkingStatistics."Activity Date" := Today;
                    ATMLinkingStatistics."ATM Application No." := "ATM Application No.";
                    ATMLinkingStatistics."Linking Type" := ATMLinkingStatistics."linking type"::Delinking;
                    ATMLinkingStatistics."User ID" := UserId;
                    ATMLinkingStatistics."Activity Time" := Time;
                    ATMLinkingStatistics."Reason for change" := MyComment;
                    ATMLinkingStatistics.Insert(true);
                    //send sms
                    if SavingsACC.Get(ATMApplications."Account No") then begin
                        SendSMS.SendSms(Sourcetype::"ATM Collection", SavingsACC."Mobile Phone No", Txt004, ATMApplications."No.", SavingsAccounts."No.", false);
                    end;
                end;

                Message(MSGATMCardLinked);
            end else
                Error(ErrOperationCancelled);
        end;
    end;


    procedure ChargeATMFee(ATMApplications: Record 52185850)
    var
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit,TreasuryTransactions,BSC,"Risk Claim",Delegate,Maint,TellerTransactions,ATMM,GeneralRepair,Saccotransffers,ImprestSurrender,"BL Opening","Risk Closure","Defaulter Recovery","Guarantors Subsitute",MPESAApp,MPESAChange;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        SavingsAccounts: Record 52185730;
        PeriodicActivities: Codeunit "Periodic Activities";
        BankingUserTemplate: Record 52185782;
        JTemp: Code[20];
        JBatch: Code[20];
    begin
    end;

    local procedure "-"()
    begin
    end;


    procedure StatementCharges(SavingsAccounts: Record 52185730)
    var
        AvailableBal: Decimal;
        LineN: Integer;
        DocumentNo: Code[10];
        ExtDocumentNo: Code[10];
    begin
        Temp.Get(UserId);
        Jtemplate := Temp."Cashier Journal Template";
        JBatch := Temp."Cashier Journal Batch";

        GenJLine.Reset;
        GenJLine.SetRange(GenJLine."Journal Template Name", Jtemplate);
        GenJLine.SetRange(GenJLine."Journal Batch Name", JBatch);
        GenJLine.DeleteAll;

        if SavingsAccounts.Find('-') then begin
            SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)", SavingsAccounts."Authorised Over Draft",
                                       SavingsAccounts."Uncleared Cheques", SavingsAccounts."ATM Transactions");

            AvailableBal := (SavingsAccounts."Balance (LCY)" + SavingsAccounts."Authorised Over Draft") -
                            (SavingsAccounts."Uncleared Cheques" + SavingsAccounts."ATM Transactions");//+MinBalance)


        end;
    end;

    local procedure "--"()
    begin
    end;


    procedure PostBBFClaims(BBFHeader: Record 52185888)
    var
        JournalPosting: Codeunit "Journal Posting";
        Template: Code[10];
        Batch: Code[10];
        OfficeTemp: Record 52185873;
        ClaimLines: Record 52185853;
        GeneralSetUp: Record 52185689;
        LineNo: Integer;
        KinDetails: Record 52185701;
        ErrorOnPayMode: label 'Pay mode must be Bank or Cheque';
        MsgOnCompletePosting: label 'Application No. -%1- successfully posted.';
        SavingsAccounts: Record 52185730;
        CreditAccounts: Record 52185731;
        AccType: Integer;
        BBFRequisationLines: Record 52186126;
    begin

        with BBFHeader
          do begin

            TestField(Posted, false);
            TestField(Status, Status::Approved);
            TestField("Payment Release Date", Today);

            // IF NOT ("Pay Mode"<>"Pay Mode"::Cheque) OR ("Pay Mode"<>"Pay Mode"::"Custom 4") THEN ERROR(ErrorOnPayMode);

            CalcFields("Total Payment Amount BBF");
            GeneralSetUp.Get();
            GeneralSetUp.TestField("Benevolent Claim Account");
            TestField("Global Dimension 1 Code");
            TestField("Shortcut Dimension 2 Code");
            // TESTFIELD("Payment Narration");

            Temp.Get(UserId);

            Temp.TestField("Cashier Journal Template");
            Temp.TestField("Cashier Journal Batch");

            Template := Temp."Cashier Journal Template";
            Batch := Temp."Cashier Journal Batch";

            if Confirm(MsgOnConfirmDialog, true) = false then
                exit;

            JournalPosting.ClearJournalLines(Template, Batch);

            ClaimLines.Reset;
            ClaimLines.SetRange("Line No.", "No.");
            ClaimLines.SetRange(Posted, false);
            ClaimLines.SetRange(Deceased, false);
            if ClaimLines.Find('-') then begin
                repeat
                    ClaimLines.TestField(Name);
                    if (ClaimLines."BBF Entitlement Code" = 'PRINCIPAL MEMBER') or (ClaimLines."BBF Entitlement Code" = 'PRINCIPAL') then begin
                        ClaimLines.TestField("Account No");
                        ClaimLines.TestField("BBF Entitlement Paid");
                    end;

                    if CreditAccounts.Get(ClaimLines."Account No") then
                        AccType := 7
                    else
                        AccType := 6;

                    if ClaimLines."BBF Entitlement Code" = '' then begin
                        LineNo := LineNo + 1;
                        JournalPosting.PostJournal(Template, Batch, LineNo, AccType, "No.", PadStr(ClaimLines.Name + ' Pay Acc No.' + ClaimLines."Account No", 50), ClaimLines."BBF Entitlement Paid" * -1,
                        ClaimLines."Account No", "Payment Release Date", 0, '', '',
                        "Global Dimension 1 Code", "Shortcut Dimension 2 Code", ClaimLines."Transaction Type", ClaimLines."Loan No.",
                        '', '', 0, '', 0);
                    end else begin
                        LineNo := LineNo + 1;
                        JournalPosting.PostJournal(Template, Batch, LineNo, 0, "No.", PadStr(ClaimLines.Name + ' Pay Acc No.' + ClaimLines."Account No", 50), ClaimLines."BBF Entitlement Paid" * -1,
                        GeneralSetUp."Benevolent Claim Account", "Payment Release Date", 0, '', '',
                        "Global Dimension 1 Code", "Shortcut Dimension 2 Code", ClaimLines."Transaction Type", ClaimLines."Loan No.",
                        '', '', 0, '', 0);
                    end;

                    ClaimLines.Posted := true;
                    ClaimLines.Deceased := true;
                    ClaimLines.Modify;

                    KinDetails.Reset;
                    KinDetails.SetRange(Name, ClaimLines."Next of Kin");
                    KinDetails.SetRange("Account No", ClaimLines."Member No");
                    if KinDetails.Find('-') then begin
                        KinDetails.Deceased := true;
                        KinDetails.Modify;//(Deceased,TRUE);
                                          //KinDetails.MODIFYALL(Deceased,TRUE);
                    end;
                until ClaimLines.Next = 0;

                //Debit Bank
                BBFHeader.CalcFields("Total Payment Amount BBF");
                LineNo := LineNo + 1;
                JournalPosting.PostJournal(Template, Batch, LineNo, BBFHeader."Account Type", "No.", PadStr(ClaimLines.Name, 50), "Total Payment Amount BBF",
                "Account No.", "Payment Release Date", 0, '', '',
                "Global Dimension 1 Code", "Shortcut Dimension 2 Code",
                0, '', '', '', 0, '', 0);
            end;

            JournalPosting.LinesCompletePosting(Template, Batch);

            BBFRequisationLines.Reset;
            BBFRequisationLines.SetRange(No, BBFHeader."Requisation Doc No.");
            if BBFRequisationLines.Find('-') then begin
                BBFRequisationLines.Payed := true;
                BBFRequisationLines.Modify;
            end;

            Posted := true;
            "Date Posted" := Today;
            "Time Posted" := Time;
            "Posted By" := UserId;
            Modify;
            if Posted = true then Message(MsgOnCompletePosting, "No.");

            Commit;
            /*
            RESET;
            SETFILTER("No.","No.");
            REPORT.RUN(52185720,TRUE,TRUE,BBFHeader);
            RESET;
            */

        end;

    end;


    procedure GenerateClaimLines(ClaimLines: Record 52185853)
    var
        ErrorOnMaxEntitlement: label 'Member has exhausted the Max. No. of -%1- entitlement under this category.Category is %2.';
        KinDetails: Record 52185701;
        Entitlement: Record 52185852;
        MaxKinNo: Integer;
    begin
        with ClaimLines do begin

            KinDetails.Reset;
            KinDetails.SetRange(Name, "Next of Kin");
            if KinDetails.Find('-') then
                Relationship := KinDetails.Relationship;
            "BBF Entitlement Claimed" := KinDetails."BBF Entitlement";
            "BBF Entitlement Code" := KinDetails."BBF Entitlement Code";
            Beneficiary := KinDetails.Beneficiary;
            "ID No." := KinDetails."ID No.";
            Deceased := KinDetails.Deceased;
            Type := KinDetails.Type;
            "Date of Birth" := KinDetails."Date of Birth";
            Address := KinDetails.Address;

            if Entitlement.Get("BBF Entitlement Code") then begin

                KinDetails.Reset;
                KinDetails.SetRange(Relationship, Relationship);
                KinDetails.SetRange(Deceased, true);
                if KinDetails.Find('-') then
                    repeat
                        MaxKinNo := KinDetails.Count;
                    until KinDetails.Next = 0;
                if MaxKinNo > Entitlement."Max No." then Error(ErrorOnMaxEntitlement, MaxKinNo, Relationship);
            end;
        end
    end;


    procedure PostSinkClaims(BBFHeaderClaim: Record 52186126)
    var
        JournalPosting: Codeunit "Journal Posting";
        Template: Code[10];
        Batch: Code[10];
        OfficeTemp: Record 52185873;
        ClaimLines: Record 52186127;
        GeneralSetUp: Record 52185689;
        LineNo: Integer;
        KinDetails: Record 52185701;
        ErrorOnPayMode: label 'Pay mode must be Bank or Cheque';
        MsgOnCompletePosting: label 'Application No. -%1- successfully posted.';
        SavingsAccounts: Record 52185730;
        CreditAccounts: Record 52185731;
        AccType: Integer;
        BBFRequisationLines: Record 52186126;
        Members: Record 52185700;
        SinkFundReportInformation: Record 52185940;
        TransactionCharges: Record 52185774;
        TariffDetails: Record 52185777;
        TCharges: Decimal;
        ChargeAmount: Decimal;
        TransactionTypes: Record 52185773;
        Txt0001: label 'Excise Duty';
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills;
        AccNo: Code[10];
        BalAccNo: Code[10];
        BBFEntitlementSetUp: Record 52186224;
        IncomeRecAccount: Code[30];
        MemberAmount: Decimal;
        SaccoAmount: Decimal;
    begin

        with BBFHeaderClaim
          do begin
            //Mark Transaction Posted...
            SavingsLedgerEntry.Reset;
            SavingsLedgerEntry.SetRange("Document No.", No);
            if SavingsLedgerEntry.Find('-') then begin
                Posted := true;
                Modify;
            end else
                TestField(Posted, false);
            TestField(Status, Status::Approved);
            //TESTFIELD("Payment Release Date",TODAY);

            GeneralSetUp.Get();
            GeneralSetUp.TestField("Benevolent Claim Account");
            TestField("Global Dimension 1 Code");
            TestField("Global Dimension 2 Code");

            Temp.Get(UserId);

            Temp.TestField("Cashier Journal Template");
            Temp.TestField("Cashier Journal Batch");

            Template := Temp."Cashier Journal Template";
            Batch := Temp."Cashier Journal Batch";

            if Confirm(MsgOnConfirmDialog, true) = false then
                exit;

            JournalPosting.ClearJournalLines(Template, Batch);

            MemberAmount := 0;
            SaccoAmount := 0;

            ClaimLines.Reset;
            ClaimLines.SetRange("Header No", No);
            ClaimLines.SetRange(Posted, false);
            ClaimLines.SetRange(Deceased, false);
            if ClaimLines.Find('-') then begin
                repeat
                    if ClaimLines."BBF Entitlement Code" <> '' then begin
                        ClaimLines.TestField(Name);
                        ClaimLines.TestField("Account No.");
                        ClaimLines.TestField("Pay To Name");
                        ClaimLines.TestField("Pay To ID");

                        if CreditAccounts.Get(ClaimLines."Account No.") then
                            AccType := 7
                        else
                            AccType := 6;

                        SaccoAmount := ClaimLines."Sacco Income Recovable";
                        MemberAmount := ClaimLines."Total Amount" - SaccoAmount;

                        LineNo := LineNo + 1;
                        JournalPosting.PostJournal(Template, Batch, LineNo, AccType, No, PadStr(ClaimLines."Pay To Name" + 'ID.' + ClaimLines."Pay To ID" + ' for ' + ClaimLines.Relationship + '-' + ClaimLines."Next of Kin", 50),
                        (MemberAmount) * -1, ClaimLines."Account No.", "Payment Release Date", 0, '', '', "Global Dimension 1 Code", "Global Dimension 2 Code",
                        ClaimLines."Transaction Type", ClaimLines."Loan No.", '', '', 0, '', 0);

                        ClaimLines.Posted := true;
                        ClaimLines.Deceased := true;
                        ClaimLines.Modify;
                        Posted := true;
                        Modify;

                        KinDetails.Reset;
                        KinDetails.SetRange(Name, ClaimLines."Next of Kin");
                        KinDetails.SetRange("Account No", ClaimLines."Member No");
                        if KinDetails.Find('-') then begin
                            KinDetails.ModifyAll(Deceased, true);
                        end;
                        //Debit GL
                        LineNo := LineNo + 1;
                        JournalPosting.PostJournal(Template, Batch, LineNo, 2, No, PadStr(ClaimLines."Pay To Name" + 'ID.' + ClaimLines."Pay To ID" + ' for ' + ClaimLines.Relationship + '-' + ClaimLines."Next of Kin", 50), ClaimLines."Total Amount",
                        GeneralSetUp."Benevolent Claim Account", "Payment Release Date", 0, '', '',
                        "Global Dimension 1 Code", "Global Dimension 2 Code",
                        0, '', '', '', 0, '', 0);

                        BBFEntitlementSetUp.Reset;
                        if BBFEntitlementSetUp.FindFirst then IncomeRecAccount := BBFEntitlementSetUp."Sacco G/L";
                        LineNo := LineNo + 1;
                        JournalPosting.PostJournal(Template, Batch, LineNo, 0, No, PadStr(ClaimLines."Pay To Name" + 'ID.' + ClaimLines."Pay To ID" + ' for ' + ClaimLines.Relationship + '-' + ClaimLines."Next of Kin", 50),
                        SaccoAmount * -1, IncomeRecAccount, "Payment Release Date", 0, '', '', "Global Dimension 1 Code", "Global Dimension 2 Code",
                        ClaimLines."Transaction Type", ClaimLines."Loan No.", '', '', 0, '', 0);


                        //bbf charge

                        Temp.Get(UserId);

                        Temp.TestField("Cashier Journal Template");
                        Temp.TestField("Cashier Journal Batch");

                        Template := Temp."Cashier Journal Template";
                        Batch := Temp."Cashier Journal Batch";
                        GeneralSetUp.Get();
                        TransactionTypes.Reset;
                        TransactionTypes.SetRange(TransactionTypes.Type, TransactionTypes.Type::"BBF Payment");
                        TransactionTypes.SetRange(Code, GeneralSetUp."Sink Fund Process Charge");
                        if TransactionTypes.Find('-') then begin
                        end;

                        //Charges
                        TCharges := 0;

                        TransactionCharges.Reset;
                        TransactionCharges.SetRange(TransactionCharges."Transaction Type", TransactionTypes.Code);
                        if TransactionCharges.Find('-') then begin
                            repeat
                                LineNo := LineNo + 10000;

                                ChargeAmount := 0;
                                if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                                    ChargeAmount := (ClaimLines."BBF Entitlement" * TransactionCharges."Percentage of Amount") * 0.01
                                else
                                    ChargeAmount := TransactionCharges."Charge Amount";

                                if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin

                                    TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                                    TariffDetails.Reset;
                                    TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                    if TariffDetails.Find('-') then begin
                                        repeat
                                            if (ClaimLines."BBF Entitlement" >= TariffDetails."Lower Limit") and (ClaimLines."BBF Entitlement" <= TariffDetails."Upper Limit") then begin
                                                if TariffDetails."Use Percentage" = true then begin
                                                    ChargeAmount := ClaimLines."BBF Entitlement" * TariffDetails.Percentage * 0.01;
                                                end else begin
                                                    ChargeAmount := TariffDetails."Charge Amount"
                                                end;
                                            end;
                                        until TariffDetails.Next = 0;
                                    end;
                                end;



                                if CreditAccounts.Get(ClaimLines."Account No.") then
                                    AccType := 7
                                else
                                    AccType := 6;
                                BalAccType := Balacctype::"G/L Account";
                                LineNo := LineNo + 1;
                                JournalPosting.PostJournal(Template, Batch, LineNo, AccType, No,
                                TransactionCharges.Description + '-' + ClaimLines."Account No.", ChargeAmount, ClaimLines."Account No.", "Payment Release Date", BalAccType,
                                TransactionCharges."G/L Account", '', "Global Dimension 1 Code", "Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);
                                if TransactionCharges."Recover Excise Duty" then begin
                                    //Excise Duty
                                    LineNo := LineNo + 1;
                                    JournalPosting.PostJournal(Template, Batch, LineNo, AccType, No,
                                    'Excise Duty' + TransactionCharges.Description + '-' + ClaimLines."Account No.", (ChargeAmount * GeneralSetUp."Excise Duty (%)") * 0.01, ClaimLines."Account No.", "Payment Release Date", BalAccType,
                                     GeneralSetUp."Excise Duty G/L", '', "Global Dimension 1 Code", "Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);
                                end;
                            until TransactionCharges.Next = 0;
                        end;
                        //bbf charge






                    end;
                until ClaimLines.Next = 0;

            end;

            JournalPosting.LinesCompletePosting(Template, Batch);
            /*
           BBFRequisationLines.RESET;
           BBFRequisationLines.SETRANGE(No,);
           IF BBFRequisationLines.FIND('-') THEN BEGIN
             BBFRequisationLines.Payed:=TRUE;
             BBFRequisationLines.MODIFY;
             END;
             */
            Posted := true;
            //"Date Posted":=TODAY;
            //"Time Posted":=TIME;
            //"Posted By":=USERID;
            Modify;
            //IF BBFHeaderClaim.Type=BBFHeaderClaim.Type::"Principal Member" THEN BEGIN
            if BBFHeaderClaim."Claim Option" = 'PRINCIPAL MEMBER' then begin
                if Members.Get(BBFHeaderClaim."Member No") then begin
                    Members.Status := Members.Status::Deceased;
                    Members.Modify;
                end;
                SavingsAccounts.Reset;
                SavingsAccounts.SetRange("Member No.", BBFHeaderClaim."Member No");
                SavingsAccounts.SetRange("Loan Disbursement Account", true);
                if SavingsAccounts.Find('-') then begin
                    SavingsAccounts.Status := SavingsAccounts.Status::Frozen;
                    SavingsAccounts."Status Change Reason" := 'Deceased awaiting documentation';
                    SavingsAccounts.Modify;
                end;
            end;


            if BBFHeaderClaim.Posted = true then Message(MsgOnCompletePosting, BBFHeaderClaim.No);

            SinkFundReportInformation.Reset;
            SinkFundReportInformation.SetRange(No, BBFHeaderClaim."Report Notice No");
            if SinkFundReportInformation.Find('-') then begin
                if BBFHeaderClaim.Type = BBFHeaderClaim.Type::"Principal Member" then begin
                    SinkFundReportInformation."Insurance Payment Status" := SinkFundReportInformation."insurance payment status"::"Principal Amount Paid";
                    SinkFundReportInformation.Modify
                end else
                    SinkFundReportInformation."Insurance Payment Status" := SinkFundReportInformation."insurance payment status"::"Beneficiary Claim Paid";
                SinkFundReportInformation.Modify;
            end;




            //**COMMIT;
            /*
            RESET;
            SETFILTER("No.","No.");
            REPORT.RUN(52185720,TRUE,TRUE,BBFHeader);
            RESET;
            */
            if Members.Get(BBFHeaderClaim."Member No") then begin
                CompanyInformation.Get();
                SendSMS.SendSms(Sourcetype::"Account Status", Members."Mobile Phone No", 'Dear member, your sink fund claim has been credited to your account. '
                , BBFHeaderClaim.No, BBFHeaderClaim."Member No", true);
            end;
        end;

    end;


    procedure InitJournal(JTemplate: Code[10]; JBatch: Code[10])
    var
        GenJournalLine: Record "Gen. Journal Line";
    begin
        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", JTemplate);
        GenJournalLine.SetRange("Journal Batch Name", JBatch);
        if GenJournalLine.Find('-') then
            GenJournalLine.DeleteAll;
    end;


    procedure JournalInsert(Jtemplate: Code[20]; JBatch: Code[20]; DocNo: Code[20]; PDate: Date; AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit; AcctNo: Code[20]; Desc: Text[150]; BalAcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit; BalAcctNo: Code[20]; Amt: Decimal; ExtDocNo: Code[20]; Loan: Code[20]; TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal; Dim1: Code[20]; Dim2: Code[20]; SystemCreated: Boolean)
    var
        LineNo: Integer;
        GenJournalLine: Record "Gen. Journal Line";
    begin

        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", Jtemplate);
        GenJournalLine.SetRange("Journal Batch Name", JBatch);
        LineNo := GenJournalLine.Count;

        LineNo += 1;


        GenJournalLine.Init;
        GenJournalLine."Journal Template Name" := Jtemplate;
        GenJournalLine."Journal Batch Name" := JBatch;
        GenJournalLine."Line No." := LineNo;
        GenJournalLine."Document No." := DocNo;
        GenJournalLine."Posting Date" := PDate;
        GenJournalLine."Account Type" := AcctType;
        GenJournalLine."Account No." := AcctNo;
        GenJournalLine.Validate(GenJournalLine."Account No.");
        GenJournalLine.Description := CopyStr(Desc, 1, 50);
        GenJournalLine."Bal. Account Type" := BalAcctType;
        GenJournalLine."Bal. Account No." := BalAcctNo;
        GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
        GenJournalLine.Amount := Amt;
        GenJournalLine.Validate(GenJournalLine.Amount);
        GenJournalLine."External Document No." := ExtDocNo;
        GenJournalLine."Loan No" := Loan;
        GenJournalLine."Transaction Type" := TransType;
        GenJournalLine."Shortcut Dimension 1 Code" := Dim1;
        GenJournalLine."Shortcut Dimension 2 Code" := Dim2;
        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
        GenJournalLine."System-Created Entry" := SystemCreated;

        //MESSAGE('%1',GenJournalLine);
        if GenJournalLine.Amount <> 0 then
            GenJournalLine.Insert;
    end;


    procedure PostJournal(JTemplate: Code[10]; JBatch: Code[10]) Posted: Boolean
    var
        GenJournalLine: Record "Gen. Journal Line";
    begin
        Posted := false;
        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", JTemplate);
        GenJournalLine.SetRange("Journal Batch Name", JBatch);
        if GenJournalLine.Find('-') then begin
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
            Posted := true;

        end;
    end;


    procedure EmployerSavingAdvice(SavingsAccounts: Record 52185730; NewAmount: Decimal)
    var
        CheckoffAdvice: Record 52185818;
        iEntryNo: Integer;
        SavingsAccount: Record 52185730;
        MemberCategory: Record 52185723;
        ProductFactory: Record 52185690;
        Members: Record 52185700;
        OldAmount: Decimal;
    begin
        with SavingsAccounts do begin
            CalcFields("Balance (LCY)");
            iEntryNo := 0;
            CheckoffAdvice.Reset;
            if CheckoffAdvice.Find('+') then
                iEntryNo := CheckoffAdvice."Entry No" + 1;

            //  IF Members.GET(SavingsAccounts."Member No.") THEN BEGIN
            //    IF MemberCategory.GET(Members."Member Category") THEN BEGIN
            //      IF SavingsAccounts."Product Category"=SavingsAccounts."Product Category"::"Deposit Contribution" THEN
            //        NewAmount:=MemberCategory."Default Share Deposit";
            //      IF SavingsAccounts."Product Category"=SavingsAccounts."Product Category"::Benevolent THEN BEGIN
            //        IF ProductFactory.GET("Product Type") THEN BEGIN
            //          NewAmount:=ProductFactory."Minimum Contribution";
            //        END;
            //      END;
            //    END;
            //  END;

            OldAmount := SavingsAccounts."Monthly Contribution";

            if (SavingsAccounts.Status = SavingsAccounts.Status::Closed) or (SavingsAccounts.Status = SavingsAccounts.Status::New) then
                OldAmount := 0;

            CheckoffAdvice.Init;
            CheckoffAdvice."Entry No" := iEntryNo;
            CheckoffAdvice."Account No." := SavingsAccounts."No.";
            CheckoffAdvice."Member No." := SavingsAccounts."Member No.";
            CheckoffAdvice."Payroll No" := SavingsAccounts."Payroll/Staff No.";
            CheckoffAdvice.Validate(CheckoffAdvice."Member No.");

            CheckoffAdvice.Type := CheckoffAdvice.Type::Savings;

            SavingsAccount.Reset;
            SavingsAccount.SetRange("No.", SavingsAccounts."No.");
            if SavingsAccount.Find('-') then begin
                SavingsAccount.CalcFields("Balance (LCY)");
                CheckoffAdvice."Balance On" := SavingsAccount."Balance (LCY)";

                if SavingsAccount."Employer Account No" <> '' then
                    CheckoffAdvice."Employer Account No." := SavingsAccount."Employer Account No"
                else
                    CheckoffAdvice."Employer Account No." := SavingsAccount."No.";
            end;

            if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Deposit Contribution" then begin
                SavingsAccount.Reset;
                SavingsAccount.SetRange("Member No.", SavingsAccounts."Member No.");
                SavingsAccount.SetFilter(Status, '<>%1', SavingsAccount.Status::Closed);
                SavingsAccount.SetRange("Product Category", SavingsAccount."product category"::"Deposit Contribution");
                if SavingsAccount.Find('-') then begin
                    SavingsAccount.CalcFields("Balance (LCY)");
                    if SavingsAccount."Employer Balance" = 0 then
                        CheckoffAdvice."Balance On" := /*CheckoffAdvice."Balance On"+*/SavingsAccount."Balance (LCY)"//Commented to prevent doubling of balance on
                    else
                        CheckoffAdvice."Balance On" := NewAmount + SavingsAccount."Employer Balance";
                end;
            end;
            CheckoffAdvice."Amount On" := OldAmount;
            CheckoffAdvice."Amount Off" := OldAmount;
            CheckoffAdvice."Advice Method" := CheckoffAdvice."advice method"::Changes;
            CheckoffAdvice."Advice Date" := Today;
            CheckoffAdvice."ID No." := SavingsAccounts."ID No.";
            CheckoffAdvice."Employer Code" := SavingsAccounts."Employer Code";
            CheckoffAdvice.Names := SavingsAccounts.Name;
            CheckoffAdvice."Product Type" := SavingsAccounts."Product Type";
            CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Adjustment;

            if NewAmount = 0 then begin
                CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Stoppage;
                CheckoffAdvice."Balance Off" := SavingsAccount."Monthly Contribution";
            end else
                if "Balance (LCY)" = 0 then
                    CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::New;
            CheckoffAdvice.Validate(CheckoffAdvice."Product Type");
            if (CheckoffAdvice."Amount On" <> 0) or (CheckoffAdvice."Amount Off" <> 0) or (CheckoffAdvice."Balance On" <> 0) or (CheckoffAdvice."Advice Type" = CheckoffAdvice."advice type"::Stoppage) then
                CheckoffAdvice.Insert(true);
        end;

    end;
}

