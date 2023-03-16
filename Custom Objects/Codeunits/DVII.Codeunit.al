#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52185467 DVII
{

    trigger OnRun()
    begin
    end;

    var
        GeneralSetUp: Record 52185689;
        DividendSetUp: Record 52185708;
        Defaulter: Boolean;
        LoanApps: Record 52185729;
        SavingsAccounts: Record 52185730;
        SavingsAccountNo: Code[20];
        SavingsProductID: Code[20];
        SavingsProductName: Text;
        RunBal: Decimal;
        DividendProgression: Record 52185713;
        CAmount: Decimal;
        TCharges: Decimal;
        TransactionCharges: Record 52185774;
        TieredChargesLines: Record 52185777;
        GlobalDim1: Code[20];
        GlobalDim2: Code[20];
        EntrNo: Integer;
        Temp: Record 52185782;
        GenJLine: Record "Gen. Journal Line";
        AccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        PostingJnl: Codeunit "Journal Posting";
        TransactionTypes: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills;
        TopupShares: label 'Topup Share Capital :-';
        DividendEarned: label 'Dividend Earned :-';
        DividendDeductions: label 'Dividend Deductions :-';
        LoanInterest: label 'Loan Interest :-';
        LoanBills: label 'Loan Bill :-';
        LoanPrincipal: label 'Loan Principal :-';
        TransactionCharge: label 'Transaction Charge :-';
        ExciseDuty: label 'Excise Duty :-';
        GeneratepostLines: label 'Create Posting Lines :';
        MessageTxt: label 'Successfully processed.';
        Jtemplate: Code[10];
        JBatch: Code[10];
        DividendPostingBuffer: Record 52185714;
        ProductFactory: Record 52185690;
        Year: Integer;
        PreviousYear: Integer;
        Transactions: Record 52185773;
        LineNo: Integer;
        JournalPosting: Codeunit "Journal Posting";
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        AccNo: Code[20];
        Amt: Decimal;
        BalAccNo: Code[20];


    procedure PostDiv(CustMembrNo: Code[20]; SendTEXT: Boolean)
    var
        CustMembr: Record 52185700;
        SavingsAccounts: Record 52185730;
        SendSms: Codeunit SendSms;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        CompInfo: Record "Company Information";
        NetAmount: Decimal;
        JournalPosting: Codeunit "Journal Posting";
        DividendPostingBuffer2: Record 52185714;
        CreditAccounts: Record 52185731;
        Loans: Record 52185729;
        MobileBanking: Codeunit MobileBanking;
        PostingDate: Date;
    begin
        PostingDate := Today;

        DividendSetUp.Get;
        GeneralSetUp.Get;

        Temp.Get(UserId);
        Temp.Testfield("Cashier Journal Template");
        Temp.TestField("Cashier Journal Batch");
        JBatch := Temp."Cashier Journal Batch";
        Jtemplate := Temp."Cashier Journal Template";

        GenJLine.SetRange("Journal Batch Name", JBatch);
        GenJLine.SetRange("Journal Template Name", Jtemplate);
        if GenJLine.FindLast then
            EntrNo := GenJLine."Line No.";


        //MESSAGE('%1 and %2',Temp."Cashier Journal Batch",Temp."Cashier Journal Template");
        //EntrNo:=100;
        //**WITH CustMembr DO BEGIN
        CustMembr.Reset;
        CustMembr.SetRange("No.", CustMembrNo);
        if CustMembr.Find('-') then begin
            //**REPEAT

            GlobalDim1 := CustMembr."Global Dimension 1 Code";
            GlobalDim2 := CustMembr."Global Dimension 2 Code";
            RunBal := 0;
            Year := Date2dmy(Today, 3);
            PreviousYear := Year - 1;


            //++++++++++++++++++++Geting Savings Accounts
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."Member No.", CustMembr."No.");
            SavingsAccounts.SetFilter(SavingsAccounts."Loan Disbursement Account", '%1', true);
            //SavingsAccounts.SETFILTER(Blocked,'%1',SavingsAccounts.Blocked::" ");
            if SavingsAccounts.Find('-') then begin
                SavingsAccountNo := SavingsAccounts."No.";
                SavingsProductID := SavingsAccounts."Product Type";
                SavingsProductName := SavingsAccounts."Product Name";

                //++++++++++++++++++++
                NetAmount := 0;

                //++++++++++++++++++++++++++++++++++++Posting Enteries From buffer
                DividendPostingBuffer.Reset;
                DividendPostingBuffer.SetRange("Member No.", CustMembr."No.");
                DividendPostingBuffer.SetRange(Posted, false);
                if DividendPostingBuffer.Find('-') then begin
                    NetAmount := DividendPostingBuffer.Amount;
                    //MESSAGE('%1',NetAmount);
                    repeat

                        // IF DividendPostingBuffer."Account Type"=DividendPostingBuffer."Account Type"::Savings THEN BEGIN
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange("Member No.", CustMembr."No.");
                        SavingsAccounts.SetRange("Loan Disbursement Account", true);
                        if SavingsAccounts.Find('-') then begin
                            if SavingsAccounts.Blocked <> SavingsAccounts.Blocked::" " then begin
                                SavingsAccounts.Blocked := SavingsAccounts.Blocked::" ";
                                SavingsAccounts."Status Change Reason" := 'DIV PAY';
                                SavingsAccounts.Modify;
                                if SavingsAccounts.Status <> SavingsAccounts.Status::Dormant then begin
                                    DividendPostingBuffer.Status := SavingsAccounts.Status;
                                    DividendPostingBuffer.Blocked := SavingsAccounts.Blocked;
                                    DividendPostingBuffer.Modify;
                                end;
                            end;
                            //Auto Activate Dormant On Posting
                            SavingsAccounts.Reset;
                            SavingsAccounts.SetRange("No.", DividendPostingBuffer."Account No.");
                            SavingsAccounts.SetRange(Status, SavingsAccounts.Status::Dormant);
                            if SavingsAccounts.Find('-') then begin
                                Transactions.Reset;
                                Transactions.SetRange(Code, GeneralSetUp."Dormant Account Activation Fee");
                                if Transactions.Find('-') then begin
                                    TransactionCharges.Reset;
                                    TransactionCharges.SetRange("Transaction Type", Transactions.Code);
                                    if TransactionCharges.Find('-') then begin
                                        repeat
                                            TransactionCharges.TestField(TransactionCharges."G/L Account");
                                            if SavingsAccounts.Blocked = SavingsAccounts.Blocked::" " then begin
                                                SavingsAccounts.Blocked := SavingsAccounts.Blocked::" ";
                                                SavingsAccounts.Status := SavingsAccounts.Status::Active;
                                                SavingsAccounts."Status Change Reason" := 'Auto Activated on Dividend Posting';
                                                SavingsAccounts.Modify;
                                            end;
                                            EntrNo += 1;
                                            AccType := Acctype::"G/L Account";
                                            AccNo := TransactionCharges."G/L Account";
                                            TransType := Transtype::" ";
                                            if SavingsAccounts."Loan Disbursement Account" = true then begin
                                                BalAccType := Balacctype::Savings;
                                                BalAccNo := DividendPostingBuffer."Account No.";
                                            end else begin
                                                BalAccType := Balacctype::"G/L Account";
                                                BalAccNo := '';
                                            end;
                                            Amt := TransactionCharges."Charge Amount";
                                            Amt := Amt * -1;
                                            JournalPosting.PostJournal(Jtemplate, JBatch, EntrNo, AccType, 'DIV-' + Format(PreviousYear), TransactionCharges.Description + DividendPostingBuffer."Account No.", Amt, AccNo, PostingDate, BalAccType,
                                          BalAccNo, LoanApps."Loan No.", SavingsAccounts."Global Dimension 1 Code", SavingsAccounts."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                                            //If excise duty involved

                                            if TransactionCharges."Recover Excise Duty" = true then begin
                                                GeneralSetUp.TestField("Excise Duty G/L");
                                                GeneralSetUp.TestField("Excise Duty (%)");
                                                EntrNo += 1;
                                                AccType := Acctype::"G/L Account";
                                                AccNo := GeneralSetUp."Excise Duty G/L";
                                                TransType := Transtype::" ";
                                                BalAccType := Balacctype::Savings;
                                                BalAccNo := DividendPostingBuffer."Account No.";
                                                Amt := Amt * GeneralSetUp."Excise Duty (%)" * 0.01;

                                                JournalPosting.PostJournal(Jtemplate, JBatch, EntrNo, AccType, 'DIV-' + Format(PreviousYear), CopyStr((TransactionCharges.Description + DividendPostingBuffer."Account No." + '-Excise Duty'), 1, 50), Amt, AccNo, PostingDate, BalAccType
                    ,
                                                BalAccNo, LoanApps."Loan No.", SavingsAccounts."Global Dimension 1 Code", SavingsAccounts."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                                            end;
                                        until TransactionCharges.Next = 0;
                                    end;
                                end;
                                // END;
                            end;

                            //Credit Account Validation
                            Loans.Reset;
                            Loans.SetRange("Loan No.", DividendPostingBuffer."Loan No");
                            if Loans.Find('-') then begin
                                CreditAccounts.Reset;
                                CreditAccounts.SetRange("No.", Loans."Loan Account");
                                if not CreditAccounts.Find('-') then begin
                                    MobileBanking.CreateLoanAccount(Loans."Member No.", Loans."Loan Product Type");
                                end;
                            end;

                            EntrNo += 1;
                            GenJLine.Init;
                            GenJLine."Line No." := EntrNo;
                            GenJLine."Journal Template Name" := Jtemplate;
                            GenJLine."Journal Batch Name" := JBatch;
                            GenJLine."Posting Date" := PostingDate;
                            GenJLine."Document No." := 'DIV-' + Format(PreviousYear);
                            GenJLine."Account Type" := DividendPostingBuffer."Account Type";
                            GenJLine.Validate(GenJLine."Account No.", DividendPostingBuffer."Account No.");
                            GenJLine.Description := PadStr(DividendPostingBuffer.Description + CustMembr."No." + '-' + CustMembr.Name, 50);
                            GenJLine."Member No." := CustMembr."No.";
                            GenJLine.Validate(GenJLine.Amount, DividendPostingBuffer.Amount);
                            GenJLine."Transaction Type" := DividendPostingBuffer."Transaction Type";
                            GenJLine."Bal. Account Type" := DividendPostingBuffer."Bal. Account Type";
                            GenJLine.Validate("Bal. Account No.", DividendPostingBuffer."Bal. Account No.");
                            GenJLine.Validate(GenJLine."Loan No", DividendPostingBuffer."Loan No");
                            GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
                            GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
                            if GenJLine.Amount <> 0 then
                                GenJLine.Insert;

                            if (DividendPostingBuffer."Transaction Type" = DividendPostingBuffer."transaction type"::Repayment)
                              or (DividendPostingBuffer."Transaction Type" = DividendPostingBuffer."transaction type"::"Interest Paid") then begin

                                EntrNo += 1;
                                GenJLine.Init;
                                GenJLine."Line No." := EntrNo;
                                GenJLine."Journal Template Name" := Jtemplate;
                                GenJLine."Journal Batch Name" := JBatch;
                                GenJLine."Posting Date" := PostingDate;
                                GenJLine."Document No." := 'DIV-' + Format(PreviousYear);
                                GenJLine."Account Type" := GenJLine."account type"::Savings;//DividendPostingBuffer."Account Type";
                                GenJLine.Validate(GenJLine."Account No.", SavingsAccountNo);
                                GenJLine.Description := PadStr(DividendPostingBuffer.Description + CustMembr."No." + '-' + CustMembr.Name, 50);
                                GenJLine."Member No." := CustMembr."No.";
                                GenJLine.Validate(GenJLine.Amount, DividendPostingBuffer.Amount * -1);
                                //GenJLine."Transaction Type":=DividendPostingBuffer."Transaction Type";
                                ///MESSAGE('%1',DividendPostingBuffer.Amount);
                                //GenJLine."Bal. Account Type":=DividendPostingBuffer."Bal. Account Type";
                                //GenJLine.VALIDATE("Bal. Account No.",DividendPostingBuffer."Bal. Account No.");
                                //                  GenJLine.VALIDATE(GenJLine."Loan No",DividendPostingBuffer."Loan No");
                                GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
                                GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
                                if GenJLine.Amount <> 0 then
                                    GenJLine.Insert;
                            end;


                            if GenJLine.Amount > 0 then begin
                                NetAmount -= GenJLine.Amount;
                            end;
                        end else
                            if DividendPostingBuffer."Account Type" = DividendPostingBuffer."account type"::Credit then begin//End of Saving Accounts
                                                                                                                             //   MESSAGE('Tset');
                                if LoanApps.Get(DividendPostingBuffer."Loan No") then begin

                                    //Credit Account Validation
                                    Loans.Reset;
                                    Loans.SetRange("Loan No.", DividendPostingBuffer."Loan No");
                                    if Loans.Find('-') then begin
                                        CreditAccounts.Reset;
                                        CreditAccounts.SetRange("No.", Loans."Loan Account");
                                        if not CreditAccounts.Find('-') then begin
                                            MobileBanking.CreateLoanAccount(Loans."Member No.", Loans."Loan Product Type");
                                        end;
                                    end;
                                    //Kigen New
                                    EntrNo += 1;
                                    GenJLine.Init;
                                    GenJLine."Line No." := EntrNo;
                                    GenJLine."Journal Template Name" := Jtemplate;
                                    GenJLine."Journal Batch Name" := JBatch;
                                    GenJLine."Posting Date" := PostingDate;
                                    GenJLine."Document No." := 'DIV-' + Format(PreviousYear);
                                    GenJLine."Account Type" := DividendPostingBuffer."Account Type";
                                    GenJLine.Validate(GenJLine."Account No.", DividendPostingBuffer."Account No.");
                                    GenJLine.Description := PadStr(DividendPostingBuffer.Description + CustMembr."No." + '-' + CustMembr.Name, 50);
                                    GenJLine."Member No." := CustMembr."No.";
                                    GenJLine.Validate(GenJLine.Amount, DividendPostingBuffer.Amount);
                                    GenJLine."Transaction Type" := DividendPostingBuffer."Transaction Type";//GenJLine."Transaction Type"::"Interest Paid";
                                    GenJLine."Bal. Account Type" := DividendPostingBuffer."Bal. Account Type";
                                    GenJLine.Validate("Bal. Account No.", DividendPostingBuffer."Bal. Account No.");
                                    GenJLine.Validate(GenJLine."Loan No", DividendPostingBuffer."Loan No");
                                    GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
                                    GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
                                    if GenJLine.Amount <> 0 then
                                        GenJLine.Insert;




                                    if DividendPostingBuffer."Transaction Type" <> DividendPostingBuffer."transaction type"::Bills then begin
                                        EntrNo += 1;
                                        GenJLine.Init;
                                        GenJLine."Line No." := EntrNo;
                                        GenJLine."Journal Template Name" := Jtemplate;
                                        GenJLine."Journal Batch Name" := JBatch;
                                        GenJLine."Posting Date" := PostingDate;
                                        GenJLine."Document No." := 'DIV-' + Format(PreviousYear);
                                        GenJLine."Account Type" := GenJLine."account type"::Savings;
                                        GenJLine.Validate(GenJLine."Account No.", SavingsAccountNo);
                                        GenJLine.Description := PadStr(DividendPostingBuffer.Description + CustMembr."No." + '-' + CustMembr.Name, 50);
                                        GenJLine."Member No." := CustMembr."No.";
                                        GenJLine.Validate(GenJLine.Amount, -DividendPostingBuffer.Amount);
                                        //GenJLine."Transaction Type":=DividendPostingBuffer."Transaction Type";//GenJLine."Transaction Type"::"Interest Paid";
                                        //GenJLine."Bal. Account Type":=DividendPostingBuffer."Bal. Account Type";
                                        //GenJLine.VALIDATE("Bal. Account No.",DividendPostingBuffer."Bal. Account No.");
                                        //GenJLine.VALIDATE(GenJLine."Loan No",DividendPostingBuffer."Loan No");
                                        GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
                                        GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
                                        if GenJLine.Amount <> 0 then
                                            GenJLine.Insert;

                                    end;//Excess After loan Clear

                                end else begin
                                    ;//End of Credits Account

                                    EntrNo += 1;
                                    GenJLine.Init;
                                    GenJLine."Line No." := EntrNo;
                                    GenJLine."Journal Template Name" := Jtemplate;
                                    GenJLine."Journal Batch Name" := JBatch;
                                    GenJLine."Posting Date" := PostingDate;
                                    GenJLine."Document No." := 'DIV-' + Format(PreviousYear);
                                    GenJLine."Account Type" := DividendPostingBuffer."Account Type";
                                    GenJLine.Validate(GenJLine."Account No.", DividendPostingBuffer."Account No.");
                                    GenJLine.Description := PadStr(DividendPostingBuffer.Description + CustMembr."No." + '-' + CustMembr.Name, 50);
                                    GenJLine."Member No." := CustMembr."No.";
                                    GenJLine.Validate(GenJLine.Amount, DividendPostingBuffer.Amount);
                                    GenJLine."Transaction Type" := DividendPostingBuffer."Transaction Type";
                                    GenJLine."Bal. Account Type" := DividendPostingBuffer."Bal. Account Type";
                                    GenJLine.Validate("Bal. Account No.", DividendPostingBuffer."Bal. Account No.");
                                    GenJLine.Validate(GenJLine."Loan No", DividendPostingBuffer."Loan No");
                                    GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
                                    GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
                                    if GenJLine.Amount <> 0 then
                                        GenJLine.Insert;
                                    if GenJLine.Amount < 0 then
                                        NetAmount -= Abs(GenJLine.Amount);
                                end;
                            end;
                    until DividendPostingBuffer.Next = 0;
                end;//Populate to Journal

                //Post
                JournalPosting.CompletePosting(Jtemplate, JBatch);

                //Post
                //
                DividendPostingBuffer2.Reset;
                DividendPostingBuffer2.SetRange("Member No.", CustMembrNo);
                if DividendPostingBuffer2.Find('-') then begin
                    repeat
                        if SavingsAccounts.Get(DividendPostingBuffer2."Account No.") then begin
                            if DividendPostingBuffer2.Status <> DividendPostingBuffer2.Status::" " then
                                SavingsAccounts.Status := DividendPostingBuffer2.Status;
                            if DividendPostingBuffer2.Blocked <> DividendPostingBuffer2.Blocked::" " then
                                SavingsAccounts.Blocked := DividendPostingBuffer2.Blocked;
                            SavingsAccounts.Modify;
                        end;
                        DividendPostingBuffer2.Posted := true;
                        DividendPostingBuffer2.Modify;
                        Commit;
                    until DividendPostingBuffer2.Next = 0;
                end;


                if NetAmount < 0 then NetAmount := 0;
                //DIVSMS
                /*IF SendTEXT=TRUE THEN BEGIN
                SavingsAccounts.RESET;
                SavingsAccounts.SETRANGE("Member No.",CustMembr."No.");
                SavingsAccounts.SETRANGE("Loan Disbursement Account",TRUE);
                IF SavingsAccounts.FIND('-') THEN BEGIN
                  CompInfo.GET;
                   SendSms.SendSms(SourceType::"Salary Processing",SavingsAccounts."Transactional Mobile No",'Dear member, your net dividend of Kes'+FORMAT(NetAmount)+' has been credited to your FOSA A/C. Withdraw via M-Sacco *346# or ATM'
                   +'. Harambee SACCO.For Help:'+' '+CompInfo."Phone No.",'',SavingsAccounts."No.",FALSE);
                END;
                END;*/
            end; //With statement
        end;

        //**MESSAGE(MessageTxt);
        //TODAY

    end;

    local procedure AdviceLoan(Loans: Record 52185729; LoanAmount: Decimal)
    var
        iEntryNo: Integer;
        CheckoffAdvice: Record 52185818;
        PaymentMethods: Record 52186122;
        Memb: Record 52185700;
    begin
        Loans.CalcFields(Loans."Outstanding Balance");
        iEntryNo := 0;
        CheckoffAdvice.Reset;
        CheckoffAdvice.SetRange(CheckoffAdvice."Advice Date", Today);
        CheckoffAdvice.SetRange(CheckoffAdvice."Loan No.", Loans."Loan No.");
        if CheckoffAdvice.Find('-') then
            CheckoffAdvice.DeleteAll;

        CheckoffAdvice.Reset;
        if CheckoffAdvice.Find('+') then
            iEntryNo := CheckoffAdvice."Entry No" + 1;

        CheckoffAdvice.Init;
        CheckoffAdvice."Entry No" := iEntryNo;
        CheckoffAdvice."Account No." := Loans."Loan Account";
        CheckoffAdvice."Product Type" := Loans."Loan Product Type";
        CheckoffAdvice."Loan No." := Loans."Loan No.";
        if Memb.Get(Loans."Member No.") then
            CheckoffAdvice."ID No." := Memb."ID No.";
        CheckoffAdvice."Member No." := Loans."Member No.";
        CheckoffAdvice."Employer Code" := Loans."Employer Code";
        CheckoffAdvice.Validate(CheckoffAdvice."Member No.");
        CheckoffAdvice.Names := Loans."Member Name";

        //Different Mode of Payment***************
        PaymentMethods.Reset;
        PaymentMethods.SetRange(PaymentMethods."Loan No.", Loans."Loan No.");
        PaymentMethods.SetRange(PaymentMethods."Member No.", Loans."Member No.");
        PaymentMethods.SetRange(PaymentMethods."Payment Method", PaymentMethods."payment method"::Checkoff);
        if PaymentMethods.Find('-') then begin
            CheckoffAdvice."Amount On" := PaymentMethods.Amount;
        end else
            CheckoffAdvice."Amount On" := Loans.Repayment;
        CheckoffAdvice."Balance On" := Loans."Outstanding Balance" - LoanAmount;
        CheckoffAdvice."Advice Date" := 20190105D;
        CheckoffAdvice."Payroll No" := Memb."Payroll/Staff No.";
        CheckoffAdvice.Interest := Loans."Loan Interest Repayment";
        if (Loans."Outstanding Balance" - LoanAmount) <= 0 then
            CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Stoppage
        else
            CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Adjustment;
        CheckoffAdvice.Insert;
    end;
}
