#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52186424 "Sky Mbanking"
{
    // // // //
    // 
    // msg += '. REF: '+TransactionID;


    trigger OnRun()
    var
        MobileLoan: Record 52186144;
        msg: Text;
        Success: Boolean;
        LoanLimit: Decimal;
        QualifiedAmt: Decimal;
        TopUp: Decimal;
        SalDates: array[3] of Date;
        SmallestSal: Decimal;
        Salary: array[3] of Decimal;
        SalaryThroughFosa: Boolean;
        Pin: Text;
        MinVal: Decimal;
        TestVal: Text;
        MaxVal: Decimal;
        DepDates: array[3] of Date;
        Deposit: array[3] of Decimal;
        justdec: Decimal;
        MobileTrans: Record 52185482;
        GLEntry: Record "G/L Entry";
        Members: Record 52185700;
        MobileLoans: Record 52185483;
        Loans: Record 52185729;
        AcctNo: Code[30];
        SavingsAccounts: Record 52185730;
        SkyMortgage: Record 52185503;
        SaccoCharge: Decimal;
        VendorCahrge: Decimal;
    begin
        Pin := '539f5bcbc532e19446dbcf2d81edc5877b3218223e4dba5a9fd9379949c389fb';
        //CallServiceFunction(1);
        //PostLightTransactions('3-65AB7877');
        //CreateSavingsAcounts('phonenumber','Account Name','Business Location','Produc code','dob','Birth Cert Number','Gender');

        //MESSAGE(CreateSavingsAcounts('254722368794','Business Acc Test','Harambee Sacco','513',0D,'',''));
        // MESSAGE(CreateSavingsAcounts('254722368794','Child Account','','511',20100101D,'0123456','male'));
        //MESSAGE(CreateSavingsAcounts('254722368794','','','506',0D,'',''));

        //MESSAGE(PinResetLocal);
        //CalculateDividends();//TestVal := '';
        //DividendAdvanceChecks('0161197',MinVal,MaxVal,FALSE,TestVal);
        ////MESSAGE(FORMAT(MaxVal));
        //ProcessMobileLoan(6);
        // GetChargeAmount('BANKTRANS',100000,SaccoCharge,VendorCahrge);
        // MESSAGE('Sacco Charge %1 Vendor Charge %2',SaccoCharge,VendorCahrge);
        //MESSAGE(GetMobileLoanList('254729658799','FOSA'));

        // MESSAGE(ApplyLoan('TEST00008','TEST00008','254723164549','136',20000,Pin,4,'1180',Pin,'NRB'));
        // ProcessMobileLoan(344117);


        //MESSAGE(FORMAT(CalculateNetTakeHqualifome(99105)));
        //MESSAGE(GetAccounts('2547202596M55','FOSA'));

        /*
        Dummy.RESET;sends
        IF Dummy.FINDFIRST THEN BEGIN
            Auth.DELETEALL;f
            REPEAT
                Account.RESET;
        
                Account.SETRANGE("Transactional Mobile No",Dummy."Phone No");
                IF Account.FINDFIRST THEN BEGIN
                    Auth.INIT;
                    Auth."Mobile No." := Dummy."Phone No";
                    Auth."Account No." := Account."No.";
        
                    Auth.INSERT;
                END;fb
            UNTIL Dummy.NEXT=0;
        END;
        */
        //MESSAGE(ApplyLoan('TEST000145','TEST000145','254722368794','136',5000,Pin,1,'1120','1234','NBI'));
        //ProcessMobileLoan(28399);
        //MESSAGE(FORMAT(GetDividendLoanQualifiedAmount('5050123278000','136')));
        //MESSAGE(GetMobileLoanList('254721296177','FOSA'));
        //(Transaction = 'Withdrawal Request') OR (Transaction = 'Utility Request') OR (Transaction ''= 'Pesalink Transfer Request') OR (Transaction = 'Bank Transfer Request')  OR (Transaction = 'Airtime Request')  THEN BEGIN

        //MESSAGE(InsertMpesaTransaction('WITHDRAWAL005','WITHDRAWAL005',CURRENTDATETIME,'Mpesa Withdrawal','Mpesa Withdrawal Transaction','5050123278000',25000,'254722368794','1234','','','','','','','',''));


        //MESSAGE(InsertMpesaTransaction('CREATEGUID3','WITHDRAWAL0004',CURRENTDATETIME,'Paybill','Mpesa Deposit','33868262',12000,'254723631593','1234','','',''));
        /*
       MESSAGE(InsertMpesaTransaction(CREATEGUID,'WITHDRAWAL001','Mpesa Withdrawal','Mpesa Withdrawal Transaction','',25000,'254720259655','1234','','',''));
       MESSAGE(InsertMpesaTransaction(CREATEGUID,'WITHDRAWAL002','Utility Request','Utility Withdrawal Transaction','',400,'254720259655','1234','','',''));
       MESSAGE(InsertMpesaTransaction(CREATEGUID,'WITHDRAWAL003','Pesalink Transfer Request','Pesalink Withdrawal Transaction','',600,'254720259655','1234','','',''));
       MESSAGE(InsertMpesaTransaction(CREATEGUID,'WITHDRAWAL004','Bank Transfer Request','Bank Transfer Withdrawal Transaction','',800,'254720259655','1234','','',''));
       MESSAGE(InsertMpesaTransaction(CREATEGUID,'WITHDRAWAL005','Airtime Request','Airtime Withdrawal Transaction','',1000,'254720259655','1234','','',''));
       */


        //MESSAGE(MiniStatementUSSD(CREATEGUID,'mini00001',5,'5000006057000','5000006057000'));

        //MESSAGE(AccountTransfer(CREATEGUID,'at0001','254706405989','BLN-63695','',15,'1111',TRUE));


        //MESSAGE(AccountTransfer(CREATEGUID,'at000133','254706405989','0720259655','Mobile',15,'1111',FALSE));




        //PostMpesaTransaction('A1A378AC','A1A378AC');
        //PostMpesaTransaction('QGH2N65OQ8','QGH2N65OQ8');





        /*
        MobileLoan.RESET;
        MobileLoan.SETRANGE(Status,MobileLoan.Status::Pending);
        MobileLoan.SETRANGE(Posted,FALSE);
        IF MobileLoan.FINDFIRST THEN BEGIN
            REPEAT
                ProcessMobileLoan(MobileLoan."Entry No");
            UNTIL MobileLoan.NEXT=0;
        END;
        */


        //MESSAGE(GetWithdrawableAccountList('254720343840'));


        /*
        strMobileNumber = 254720828221
        
        strLoanType = {"LOAN_NAME":"Mahitaji Mobile Loan","LOAN_ID":"414"}
        
        
        
        strLoanID = 414
        
        
        
        strPIN= 2010
        
        
        
        strAmount = 3000
        
        
        
        strSessionID = 13869720
        */

        //ProcessMobileLoan(3069);

        //MESSAGE(GetLoanLimit('254711409663','414'));


        //MESSAGE(AccountMiniStatement(CREATEGUID,'mNI0001',5,'505','254706405989','1111'));


        //MESSAGE(AccountMiniStatement(CREATEGUID,'mNI0002',5,'5000009312000','254701365086','6138'));
        //MESSAGE(AccountTransfer('ACTTR0006','ACTTR0006','254722368794','LN00277358','LN00277358',501,'6138',TRUE,FALSE,'254722368794'));


        /*
        //Jacob
        MESSAGE(GetLoanLimit('254720259655','414'));
        */
        //MESSAGE(GetAccountTransferRecipientXML('0720259655','MOBILE'));

        //MESSAGE(GetLoansGuaranteed('123123123', '254706405989'));


        //MESSAGE(AccountMiniStatementMobileApp(CREATEGUID,'tr001app',50,20171207D,20190505D,'5000006329000','254720259655','2121'));

        //MESSAGE(GetLoansGuaranteed('mapp_3432', '254720259655'));



        //MESSAGE(PostMpesaTransaction('8A62E43C-D'));

        //PostSMSAlertCharges;


        //MESSAGE(MobileAppLogin('1342134', '+254706405989'));
        //RecoverSalariedLoanPenalty;






        //LoanPenalty;
        //RecoverLoanPenalty;
        //UpdateNextMahitajiDate;
        //RecoverSalariedLoanPenalty;

        //UpdateDepositOffset;
        //MESSAGE(FORMAT(CURRENTDATETIME));



        //MESSAGE('Name: '+FirstName('Aziz Yusuf Wachira'));

        //MBoostaAppraisal('5050199066000',Success,msg,LoanLimit,QualifiedAmt,TopUp);
        //MESSAGE(msg+': %1',QualifiedAmt);






        //GetSalaryEntries('5050020771000',SalDates,SmallestSal,Salary,SalaryThroughFosa);

        //MESSAGE(GetSavingsAccountList('254704365759',FALSE,'TOTO_JUNIOR'));
        //TestTransactionalSMS('');


        // MESSAGE(InsertMpesaTransaction('PAYLOAN001','PAYLOAN001',CURRENTDATETIME,'Paybill','Msangi','MB_445678',6000,'+254723940612',Pin,'','','','','','','',''));
        // PostMpesaTransaction('PAYLOAN001',CREATEGUID);


        //MESSAGE(GetMobileLoanList('254717808197','ALL'));

        //MESSAGE(GetLoanAccessSetup('254701365086'));
        //MESSAGE(GetBranches());
        //TestBalanceEnq;

        //ApplyLoan('LAP003','LAP003','254701365086','119',3600,Pin,3,'','1234','NBI');
        //CheckBeneficiaries('B6','B6','254721476587',Pin,'SMS','');
        //MESSAGE(GetLoanPurpose);

        //MESSAGE(GetLocalIP);

        //MESSAGE(GetLoanToConfirmGuarantoship('254701365086'));
        //MESSAGE('%1',GetRemainingGuarantorCount(28));

        //MboosterAlerts;
        //ProcessMobileLoan(17);

        //CallServiceFunction(2);
        //MESSAGE(GetMobileLoanList('254722368794',''));

        //PostBosaLoans;
        //MboostaRecovery;
        //MBoostaAppraisal('5050179032000',Success,msg,LoanLimit,QualifiedAmt,TopUp);

        //UpdateSectorials;

        //CallServiceFunction(1);

        //MESSAGE(GetSavingsAccountList('254722368794',TRUE,' WITHDRAWABLE'));
        //MboostaRecovery;
        //MESSAGE(AccountBalanceEnquiry('CREATEGUID121','BAL004','254701365086','65841dba1b08679642c4516a36da3a675bff346824097163adf41ba5a47ac0bc','254701365086'));
        //MESSAGE(MobileBankingReports);
        //MESSAGE(FORMAT(GetLoanQualifiedAmount('5050138126000','126')));
        // GetDepositEntries('020138126',DepDates,Deposit,justdec,TRUE);
        // MESSAGE(FORMAT(justd;
        //MESSAGE(CreatVirtiualMember('+25498049560','36706700','FAITH BIKETI',20961107D,'Female','Kenyan','10895164','sirkal','123456'));
        //MESSAGE(CreateBusinessAcount('254722368794','New Business','MPEKETONI'));
        //MESSAGE(GetBusinessAccounts('254722368794'));
        //MESSAGE(GetMobileLoanList('254759932952',''));
        //MESSAGE(GetMobileLoanList('254712222181',''));
        //MESSAGE(GetBusinessAccountDetails('254722368794','B5739A'));//
        //PostBosaLoans;
        // CreditBusinessAccounts;
        // SMSBusinessAccounts;

        //MobileTrans.RESET;
        //MESSAGE('%1',MobileTrans.COUNT);

        // MobileTrans.RESET;
        // MobileTrans.SETRANGE("Transaction Date",CALCDATE('-6M',TODAY),CALCDATE('-3M',TODAY));
        // MobileTrans.SETRANGE("Needs Change",FALSE);
        // IF MobileTrans.FINDFIRST THEN BEGIN
        // REPEAT
        //  MobileTrans.Posted := FALSE;
        //  MobileTrans.MODIFY;
        // UNTIL MobileTrans.NEXT = 0;
        // END;

        //  Members.RESET;
        //  Members.SETRANGE("Registration Date",20210101D,20211231D);
        //  IF Members.FINDFIRST THEN BEGIN
        //    MESSAGE('Joined Members: %1 ',FORMAT(Members.COUNT));
        //  END;

        // GLEntry.RESET;
        // GLEntry.SETRANGE("G/L Account No.",'103001');
        // GLEntry.SETRANGE("Posting Date",20210101D,20210131D);
        // GLEntry.SETFILTER(Amount,'>0');
        // IF GLEntry.FINDFIRST THEN BEGIN
        //  GLEntry.CALCSUMS(Amount);
        //  MESSAGE('Give Loan for Development: %1',FORMAT(GLEntry.Amount));
        // END;

        //   Loans.RESET;
        //   Loans.SETRANGE("Approval Date",20220501D,20220531D);
        //   //Loans.SETFILTER(Loans."Outstanding Balance", '>0');
        //   Loans.SETRANGE(Posted,TRUE);
        //   IF Loans.FINDFIRST THEN MESSAGE(FORMAT(Loans.COUNT));
        //    Loans.CALCSUMS("Approved Amount");

        // MobileLoans.RESET;
        // MobileLoans.SETRANGE(Status,MobileLoans.Status::Successful);
        // MobileLoans.SETRANGE(Posted,TRUE);
        // MobileLoans.SETRANGE(Source,'FOSA');
        // MobileLoans.SETRANGE("Date Entered",CALCDATE('-6M',TODAY),CALCDATE('-3M',TODAY));
        // IF MobileLoans.FINDFIRST THEN BEGIN
        // REPEAT
        //  MobileLoans.Posted := FALSE;
        //  MobileLoans.Status := MobileLoans.Status::Pending;
        //  MobileLoans.MODIFY;
        // UNTIL MobileLoans.NEXT = 0;
        // END;
        // MESSAGE(FORMAT(GetNumberOfGuarantors('111',4000)));

        // AcctNo := '5050163233000';
        //SalaryMobileLoanAppraisal(AcctNo,Success,msg,LoanLimit,QualifiedAmt,TopUp,'143',Salary,SalDates);

        // SalaryThroughFosa := TRUE;
        // GetSalaryEntries(AcctNo,SalDates,SmallestSal,Salary,SalaryThroughFosa);
        // MESSAGE(FORMAT(SmallestSal));

        // MESSAGE(FORMAT(GetTransactionCharges('Bank Transfer',21200,'5050123278000')));

        //MESSAGE(CheckBeneficiaries('ENTRY001','ENTRY001','254722631476',Pin,'mode','email'));

        //MESSAGE(AccountBalanceEnquiry('BAL001','BAL001','254722368794',Pin,'5050123278000'));

        //CreateSavingsAcounts('254722368794','MSANGI MANYATTA','','511',20120101D,'123456','male');

        //MESSAGE(GetSavingsAccountList('254722368794',FALSE,'TOTO_JUNIOR'));

        // GetChargeAmount('BANKTRANSFER',21200,SaccoCharge,VendorCahrge);
        // MESSAGE('Sacco Charge %1  Vendor Charge %2',SaccoCharge,VendorCahrge);




        Message('Done');

    end;

    var
        Sep: label '\::/';
        Null: label 'NULL';
        Success: label '200';
        Account_Does_Not_Exist: label '300';
        Parameters_Not_Valid_Or_Missing: label '400';
        Caller_Not_Authorized_For_This_Request: label '401';
        Insufficient_Funds: label '402';
        Daily_Amount_Limit_Reached: label '403';
        Operation_Does_Not_Exist: label '404';
        Daily_Frequency_Limit_Reached: label '405';
        Severe_problem_Has_Occured: label '500';
        StatusOK: label '200';
        StatusNotFound: label '404';
        ExciseDutyGL: Code[20];
        ExciseDutyRate: Decimal;
        ExciseDuty: Decimal;
        CoopSetup: Record 52185471;
        SaccoTrans: Codeunit "Sacco Transactions";
        Source: Option NEW_MEMBER,NEW_ACCOUNT,LOAN_ACCOUNT_APPROVAL,DEPOSIT_CONFIRMATION,CASH_WITHDRAWAL_CONFIRM,LOAN_APPLICATION,LOAN_APPRAISAL,LOAN_GUARANTORS,LOAN_REJECTED,LOAN_POSTED,LOAN_DEFAULTED,SALARY_PROCESSING,TELLER_CASH_DEPOSIT,TELLER_CASH_WITHDRAWAL,TELLER_CHEQUE_DEPOSIT,FIXED_DEPOSIT_MATURITY,INTERACCOUNT_TRANSFER,ACCOUNT_STATUS,STATUS_ORDER,EFT_EFFECTED,ATM_APPLICATION_FAILED,ATM_COLLECTION,MBANKING,MEMBER_CHANGES,CASHIER_BELOW_LIMIT,CASHIER_ABOVE_LIMIT,INTERNETBANKING,CRM,MOBILE_PIN;
        Account: Record 52185730;
        Auth: Record 52185476;
        LoanProcess: Codeunit "Loans Process";
        Priority: Integer;
        SMSCharge: Decimal;
        SMSAccount: Code[20];
        GenJournalBatch: Record "Gen. Journal Batch";
        LGCount: Integer;
        CheckDate: Date;
        RemInst: Integer;
        LoaneeDepAcc: Code[20];
        STOFound: Boolean;
        STOLines: Record 52185718;
        Members: Record 52185700;
        CreditLimit: Decimal;
        TestDate: Date;
        MSGRequestApplication: Text[30];
        MSGRequestCorrelationID: Text[50];
        MSGSourceApplication: Text[30];
        SacAcc: Code[20];
        GeneralLedgerSetup: Record "General Ledger Setup";
        CreditAccounts: Record 52185731;
        PostATM: Codeunit "POST ATM Transactions";
        LoanGuarantorsandSecurity2: Record 52185438;
        ChannelThroughFosa: label 'You do not qualify for this product. Kindly channel your Salary through Harambee Sacco';
        HMember: Record 52185700;
        FName: Text;
        UssdCode: label '*357#';
        Br: label '';
        PaybillNo: label '525200';
        GMNo: Code[20];
        LoansProcess: Codeunit "Loans Process";
        ProdFac: Record 52185690;
        Salute: Text;
        BillProdFac: Record 52185690;
        HelpDesk: label '0709943000';


    procedure GetExciseRate() rate: Integer
    var
        GenSetup: Record 52185689;
    begin


        GenSetup.Get;
        GenSetup.TestField(GenSetup."Excise Duty (%)");
        rate := GenSetup."Excise Duty (%)";
    end;


    procedure GetExciseDutyGL() account: Text[20]
    var
        GenSetup: Record 52185689;
    begin

        GenSetup.Reset;
        GenSetup.Get;
        GenSetup.TestField(GenSetup."Excise Duty G/L");
        account := GenSetup."Excise Duty G/L";
    end;


    procedure GetSavingsAccountTypes() Response: Text
    var
        PFact: Record 52185690;
    begin

        Response := '';

        PFact.Reset;
        PFact.SetRange("Product Class Type", PFact."product class type"::Savings);
        PFact.SetFilter("Mobile Transaction", '<>%1', PFact."mobile transaction"::" ");
        if PFact.FindFirst then begin
            Response := '<SavingsProducts>';
            repeat
                Response += '<Product>';
                Response += '<ProductID>' + PFact."Product ID" + '</ProductID>';
                Response += '<ProductName>' + PFact."USSD Product Name" + '</ProductName>';
                Response += '</Product>';
            until PFact.Next = 0;
            Response += '</SavingsProducts>';
        end;
    end;


    procedure GetSingleAccount(PhoneNo: Text[30]; AccountType: Code[20]) Response: Text
    var
        SavAcc: Record 52185730;
        PFact: Record 52185690;
        xmlWriter: code[100];//dotnet XmlTextWriter;
        EncodingText: code[100];//dotnet Encoding;
        XMLDOMMgt: Codeunit "XML DOM Management";
        BodyContentXmlDoc: code[100];//dotnet XmlDocument;
        EnvelopeXmlNode: code[100];//dotnet XmlNode;
        CreatedXmlNode: code[100];//dotnet XmlNode;
    begin

        PhoneNo := '+' + PhoneNo;

        Response := '';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        SavAcc.SetRange("Product Type", AccountType);
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        if SavAcc.FindFirst then begin
            Response := ' <SavAcc>';
            repeat
                Response += '<Account>';
                Response += '<AccNo>' + SavAcc."No." + '</AccNo>';
                Response += '<AccName>' + SavAcc."Product Name" + '</AccName>';
                Response += '</Account>';
            until SavAcc.Next = 0;
            Response += '</SavAcc>';
        end;


        //Response:='';
    end;


    procedure GetAccountList(PhoneNo: Text[30]) Response: Text
    var
        SavAcc: Record 52185730;
        PFact: Record 52185690;
        Found: Boolean;
    begin

        PhoneNo := '+' + PhoneNo;
        Response := '';
        Found := false;

        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        SavAcc.SetRange("Product Category", SavAcc."product category"::" ");
        if SavAcc.FindFirst then begin
            Response := '<Accounts>';
            repeat
                PFact.Get(SavAcc."Product Type");
                if PFact."Mobile Transaction" <> PFact."mobile transaction"::" " then begin
                    Found := true;
                    Response += '<Account>';
                    Response += '<AccNo>' + SavAcc."No." + '</AccNo>';
                    Response += '<AccName>' + SavAcc."Product Name" + '</AccName>';
                    Response += '</Account>';
                end;

            until SavAcc.Next = 0;
            Response += '</Accounts>';

        end;

        if not Found then
            Response := '';
    end;


    procedure GetSavingsAccountList(PhoneNo: Text[30]; Withdrawable: Boolean; Type: Code[100]) Response: Text
    var
        SavAcc: Record 52185730;
        ProdFact: Record 52185690;
        Found: Boolean;
        MemberNo: Code[20];
        Category: Option "FOSA Account","BOSA Account","Investment Account","FOSA Loan"," BOSA Loan";
        SavingsLedgerEntry: Record 52185732;
        LastPostingDate: Date;
        DaysCount: Integer;
    begin

        PhoneNo := '+' + PhoneNo;
        Response := '';
        Found := false;


        Category := Category::"FOSA Account";

        MemberNo := '';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        if SavAcc.FindFirst then
            MemberNo := SavAcc."Member No.";

        if MemberNo = '' then
            exit;

        if Type = 'FOSA_ACCOUNTS' then
            Category := ProdFact.Category::"FOSA Account";

        if Type = 'BOSA_ACCOUNTS' then
            Category := ProdFact.Category::"BOSA Account";

        if Type = 'INVESTMENT_ACCOUNTS' then
            Category := ProdFact.Category::"Investment Account";

        if Type = 'FOSA_LOANS' then
            Category := ProdFact.Category::"BOSA Loan";

        if Type = 'BOSA_LOANS' then
            Category := ProdFact.Category::"BOSA Loan";

        if Type = 'TOTO_JUNIOR' then
            Category := ProdFact.Category::"FOSA Account";


        ProdFact.Reset;
        ProdFact.SetCurrentkey("Sort Order");

        if Withdrawable then
            ProdFact.SetFilter("Mobile Transaction", '%1|%2', ProdFact."mobile transaction"::"Withdrawals Only", ProdFact."mobile transaction"::"Deposits & Withdrawals")
        else begin

            ProdFact.SetFilter("Mobile Transaction", '<>%1', ProdFact."mobile transaction"::" ");
            if Type <> 'ALL_ACCOUNTS' then
                ProdFact.SetRange(Category, Category);
        end;

        if Type = 'TOTO_JUNIOR' then
            ProdFact.SetRange("Product Category", ProdFact."product category"::"Junior Savings");
        if ProdFact.FindFirst then begin
            Response := '<Accounts>';
            repeat

                SavAcc.Reset;
                SavAcc.SetRange("Member No.", MemberNo);
                if Withdrawable then begin
                    SavAcc.SetFilter(Status, '%1|%2', SavAcc.Status::Active, SavAcc.Status::New);
                end
                else begin
                    SavAcc.SetFilter(Status, '%1|%2|%3', SavAcc.Status::Active, SavAcc.Status::New, SavAcc.Status::Dormant);
                end;
                SavAcc.SetFilter("Product Type", '%1', ProdFact."Product ID");
                if SavAcc.Find('-') then begin
                    repeat

                        if Type = 'TOTO_JUNIOR' then begin
                            LastPostingDate := 0D;
                            SavingsLedgerEntry.Reset;
                            SavingsLedgerEntry.SetRange("Customer No.", SavAcc."No.");
                            SavingsLedgerEntry.SetRange("Posting Date", CalcDate('-3M', Today), Today);
                            SavingsLedgerEntry.SetFilter(Amount, '>0');
                            if not SavingsLedgerEntry.FindLast then begin
                                Found := true;
                                Response += '<Account>';
                                Response += '<AccNo>' + SavAcc."No." + '</AccNo>';
                                Response += '<AccName>' + SavAcc.Name + '</AccName>';
                                Response += '</Account>';
                            end else begin
                                LastPostingDate := SavingsLedgerEntry."Posting Date";
                                DaysCount := Today - LastPostingDate;

                                Found := true;

                                if DaysCount > 90 then begin
                                    Response += '<Account>';
                                    Response += '<AccNo>' + SavAcc."No." + '</AccNo>';
                                    Response += '<AccName>' + ProdFact."USSD Product Name" + '</AccName>';
                                    Response += '</Account>';
                                end else begin
                                    Response += '<Account>';
                                    Response += '<AccNo>' + SavAcc."No." + '3M</AccNo>';
                                    Response += '<AccName>' + SavAcc.Name + ' - Wait ' + Format(90 - DaysCount) + ' Days</AccName>';
                                    Response += '</Account>';
                                end;
                            end;
                        end else begin
                            Found := true;
                            Response += '<Account>';
                            Response += '<AccNo>' + SavAcc."No." + '</AccNo>';
                            Response += '<AccName>' + ProdFact."USSD Product Name" + '</AccName>';
                            Response += '</Account>';
                        end;
                    until SavAcc.Next = 0;

                end;


            until ProdFact.Next = 0;
            Response += '</Accounts>';
        end;

        if not Found then
            Response := '';
    end;


    procedure InsertMpesaTransaction(EntryCode: Code[20]; TransactionID: Code[20]; TransactionDate: DateTime; Transaction: Text; Description: Text[100]; AccountNo: Code[20]; Amount: Decimal; PhoneNo: Code[20]; PIN: Text; RequestApplication: Text; RequestCorrelationID: Text; SourceApplication: Text; DestinationAcc: Text; DestinationName: Text; DestinationOrg: Text; ClientPhoneNumber: Code[13]; CustomerName: Text) Response: Text[1024]
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TransactionType: Option " ","Mpesa Withdrawal","Mpesa Deposit","Utility Payment","Loan Repayment","Balance Enquiry","Mini-Statement","Loan Disbursement","Account Transfer","Pay Loan From Account",Paybill,"Mobile App Login","Pesalink Transfer",Airtime,"Bank Deposit","Bank Agent Deposit","Bank Transfer";
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        MpesaTrans: Record 52185482;
        Continue: Boolean;
        MobileWithdrawalsBuffer: Record 52185755;
        AccBal: Decimal;
        SafcomCharges: Record 52185475;
        SafcomAcc: Code[20];
        SafcomFee: Decimal;
        MemberID: Code[20];
        PrePaymentGL: Code[20];
        Loans: Record 52185729;
        LoanNo: Code[20];
        MemberNo: Code[20];
        Type: Option Daily,Weekly,Monthly;
        Limit: Decimal;
        msg: Text;
        SacAcc: Code[20];
        EmpRestrict: Code[20];
        LengthWithin: Boolean;
        ProductFactory: Record 52185690;
        TelNo: Code[20];
        BusinessAccount: Record 52185730;
    begin
        MpesaTrans.LockTable(true);
        BusinessAccount.Reset;
        BusinessAccount.SetRange("Business Account Code", UpperCase(AccountNo));
        if BusinessAccount.FindFirst then AccountNo := BusinessAccount."No.";

        if CopyStr(AccountNo, 1, 3) = '514' then begin
            if not SavAcc.Get(AccountNo) then begin
                CreateSavingsAcounts(PhoneNo, '', '', '514', 0D, '', '', 0);
            end;
        end;


        PhoneNo := '+' + PhoneNo;

        MSGRequestApplication := RequestApplication;
        MSGRequestCorrelationID := RequestCorrelationID;
        MSGSourceApplication := SourceApplication;

        //IF (TransactionType = TransactionType::Paybill) OR (TransactionType = TransactionType::"Mpesa Withdrawal") OR (TransactionType = TransactionType::"Utility Payment") THEN BEGIN

        MpesaTrans.Reset;
        MpesaTrans.LockTable(true);
        MpesaTrans.SetRange("Transaction ID", TransactionID);
        if MpesaTrans.FindFirst then begin
            Response := '<Response>';
            Response += '<Status>TRANSACTION_EXISTS</Status>';
            Response += '<StatusDescription>Transaction Already Exists</StatusDescription>';
            Response += '<Reference>' + Format(TransactionID) + '</Reference>';
            Response += '</Response>';
            exit;
        end;

        //END;



        if AccountNo = '' then begin
            SavAcc.Reset;
            SavAcc.SetRange("Transactional Mobile No", PhoneNo);
            SavAcc.SetRange("Product Type", '505');
            if SavAcc.FindFirst then begin
                AccountNo := SavAcc."No.";
                MemberNo := SavAcc."Member No.";
            end;
        end;

        //TransactionDate:=CURRENTDATETIME;

        Response := 'ERROR';

        if CopyStr(AccountNo, 1, 4) = 'LOAN' then begin
            Transaction := 'Loan Repayment';
            Description := 'Loan Repayment';
        end;

        if Loans.Get(AccountNo) then begin
            Transaction := 'Loan Repayment';
            Description := 'Loan Repayment';
        end;


        if Transaction = 'Balance Enquiry' then
            TransactionType := Transactiontype::"Balance Enquiry";

        if Transaction = 'Loan Repayment' then
            TransactionType := Transactiontype::"Loan Repayment";


        if Transaction = 'Mini-Statement' then
            TransactionType := Transactiontype::"Mini-Statement";

        if Transaction = 'Mpesa Deposit' then
            TransactionType := Transactiontype::"Mpesa Deposit";

        if Transaction = 'Bank Deposit' then
            TransactionType := Transactiontype::"Bank Deposit";

        if Transaction = 'Bank Agent Deposit' then
            TransactionType := Transactiontype::"Bank Agent Deposit";

        if Transaction = 'Mpesa Withdrawal' then
            TransactionType := Transactiontype::"Mpesa Withdrawal";


        if Transaction = 'Airtime Request' then
            TransactionType := Transactiontype::Airtime;

        if Transaction = 'Airtime Purchase' then
            TransactionType := Transactiontype::Airtime;


        if Transaction = 'Utility Request' then
            TransactionType := Transactiontype::"Utility Payment";

        if Transaction = 'Utility Payment' then
            TransactionType := Transactiontype::"Utility Payment";

        if Transaction = 'Withdrawal Request' then
            TransactionType := Transactiontype::"Mpesa Withdrawal";

        if Transaction = 'Paybill' then
            TransactionType := Transactiontype::Paybill;


        if Transaction = 'Bank Transfer' then
            TransactionType := Transactiontype::"Bank Transfer";


        if Transaction = 'Bank Transfer Request' then
            TransactionType := Transactiontype::"Bank Transfer";


        if Transaction = 'Pesalink Transfer' then
            TransactionType := Transactiontype::"Pesalink Transfer";


        if Transaction = 'Pesalink Transfer Request' then
            TransactionType := Transactiontype::"Pesalink Transfer";





        // Get Excise duty G/L
        ExciseDutyGL := GetExciseDutyGL();
        ExciseDutyRate := GetExciseRate();
        ExciseDuty := 0;


        if (Transaction = 'Mpesa Withdrawal') or (Transaction = 'Utility Payment') or (Transaction = 'Pesalink Transfer') or (Transaction = 'Bank Transfer') or (Transaction = 'Airtime Purchase') then begin

            MobileWithdrawalsBuffer.Reset;
            MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer."Trace ID", EntryCode);
            MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer.Source, MobileWithdrawalsBuffer.Source::"M-PESA");
            if MobileWithdrawalsBuffer.Find('-') then begin
                AccountNo := MobileWithdrawalsBuffer."Account No";
                Amount := MobileWithdrawalsBuffer.Amount;
                if Description = '' then
                    Description := MobileWithdrawalsBuffer.Description;
            end;
        end;

        if TransactionType = Transactiontype::"Loan Repayment" then begin
            LoanNo := CopyStr(AccountNo, 5, StrLen(AccountNo) - 3);
            if Loans.Get(LoanNo) then begin
                SavAcc.Reset;
                SavAcc.SetRange("Member No.", Loans."Member No.");
                SavAcc.SetRange("Product Type", '505');
                if SavAcc.FindFirst then begin
                    AccountNo := SavAcc."No.";
                    LoanNo := Loans."Loan No.";
                end;
            end;
            if Loans.Get(AccountNo) then begin
                SavAcc.Reset;
                SavAcc.SetRange("Member No.", Loans."Member No.");
                SavAcc.SetRange("Product Type", '505');
                if SavAcc.FindFirst then begin
                    AccountNo := SavAcc."No.";
                    LoanNo := Loans."Loan No.";
                end;
            end;
        end;


        SafcomFee := 0;
        SaccoFee := 0;
        VendorCommission := 0;
        PrePaymentGL := '';
        SMSAccount := '';
        SMSCharge := 0;


        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", TransactionType);
        if CoopSetup.FindFirst then begin


            if (Transaction = 'Withdrawal Request') or (Transaction = 'Utility Request') or (Transaction = 'Pesalink Transfer Request') or (Transaction = 'Bank Transfer Request') or (Transaction = 'Airtime Request') then begin

                if CoopSetup."Transaction Limit" > 0 then begin
                    if Amount > CoopSetup."Transaction Limit" then begin

                        if SavAcc.Get(AccountNo) then begin

                            HMember.Get(SavAcc."Member No.");
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";


                            //ERROR(DestinationName);

                            Priority := 211;
                            msg := 'Dear ' + FName + ',' + NewLine + 'Your withdrawal request could not be processed because the amount exceeds the set daily limit. You can only withdraw up to KES ' + Format(CoopSetup."Transaction Limit") + ' per transaction.';
                            SendSmsWithID(Source::MBANKING, SavAcc."Transactional Mobile No", msg, AccountNo, '', true, Priority, false, RequestApplication, RequestCorrelationID, SourceApplication);
                        end;

                        Response := '<Response>';
                        Response += '<Status>TRANSACTION_LIMIT_EXCEEDED</Status>';
                        Response += '<StatusDescription>Transaction Amount Exceeds the Set Limit</StatusDescription>';
                        Response += '<Reference>' + Format(EntryCode) + '</Reference>';
                        Response += '</Response>';
                        exit;
                    end;
                end;
                if CoopSetup."Daily Limit" > 0 then begin
                    Limit := CoopSetup."Daily Limit" - GetAmountTransacted(Transaction, AccountNo, Dt2Date(TransactionDate), Type::Daily);

                    if Limit < 0 then
                        Limit := 0;

                    if Limit < Amount then begin
                        if SavAcc.Get(AccountNo) then begin

                            HMember.Get(SavAcc."Member No.");
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";

                            Priority := 211;
                            msg := 'Dear ' + FName + ',' + NewLine + 'Your withdrawal request could not be processed because the amount exceeds the set daily limit. You can only withdraw up to KES ' + Format(Limit) + ' today.';
                            SendSmsWithID(Source::MBANKING, SavAcc."Transactional Mobile No", msg, AccountNo, '', true, Priority, false, RequestApplication, RequestCorrelationID, SourceApplication);
                        end;

                        Response := '<Response>';
                        Response += '<Status>TRANSACTION_LIMIT_EXCEEDED</Status>';
                        Response += '<StatusDescription>Transaction Amount Exceeds the Set Limit</StatusDescription>';
                        Response += '<Reference>' + Format(EntryCode) + '</Reference>';
                        Response += '</Response>';
                        exit;
                    end;
                end;
                if CoopSetup."Weekly Limit" > 0 then begin
                    Limit := CoopSetup."Daily Limit" - GetAmountTransacted(Transaction, AccountNo, Dt2Date(TransactionDate), Type::Weekly);

                    if Limit < 0 then
                        Limit := 0;

                    if Limit < Amount then begin
                        if SavAcc.Get(AccountNo) then begin

                            HMember.Get(SavAcc."Member No.");
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";


                            //ERROR(DestinationName);

                            Priority := 211;
                            msg := 'Dear ' + FName + ',' + NewLine + 'Your withdrawal request could not be processed because the amount exceeds the set weekly limit. You can only withdraw up to KES ' + Format(Limit) + ' today.';
                            SendSmsWithID(Source::MBANKING, SavAcc."Transactional Mobile No", msg, AccountNo, '', true, Priority, false, RequestApplication, RequestCorrelationID, SourceApplication);
                        end;

                        Response := '<Response>';
                        Response += '<Status>TRANSACTION_LIMIT_EXCEEDED</Status>';
                        Response += '<StatusDescription>Transaction Amount Exceeds the Set Limit</StatusDescription>';
                        Response += '<Reference>' + Format(EntryCode) + '</Reference>';
                        Response += '</Response>';
                        exit;
                    end;

                end;
                if CoopSetup."Monthly Limit" > 0 then begin
                    Limit := CoopSetup."Daily Limit" - GetAmountTransacted(Transaction, AccountNo, Dt2Date(TransactionDate), Type::Monthly);

                    if Limit < 0 then
                        Limit := 0;

                    if Limit < Amount then begin
                        if SavAcc.Get(AccountNo) then begin
                            Priority := 211;
                            msg := 'Dear member, your withdrawal request could not be processed because the amount exceeds the set monthly limit. You can only withdraw up to KES ' + Format(Limit) + ' today.';
                            SendSmsWithID(Source::MBANKING, SavAcc."Transactional Mobile No", msg, AccountNo, '', true, Priority, false, RequestApplication, RequestCorrelationID, SourceApplication);
                        end;

                        Response := '<Response>';
                        Response += '<Status>TRANSACTION_LIMIT_EXCEEDED</Status>';
                        Response += '<StatusDescription>Transaction Amount Exceeds the Set Limit</StatusDescription>';
                        Response += '<Reference>' + Format(EntryCode) + '</Reference>';
                        Response += '</Response>';
                        exit;
                    end;
                end;

            end;

            SMSAccount := CoopSetup."SMS Account";
            SMSCharge := CoopSetup."SMS Charge";

            SaccoFee := CoopSetup."Sacco Fee";

            if CoopSetup."Charge Type" = CoopSetup."charge type"::Staggered then begin
                SacAcc := '';
                GetChargeAmount(CoopSetup."Staggered Charge Code", Amount, SaccoFee, VendorCommission);
            end;


            SafcomCharges.Reset;
            SafcomCharges.SetRange("Transaction Type", MpesaTrans."Transaction Type");
            SafcomCharges.SetFilter(Charge, '>0');
            SafcomCharges.SetFilter(Minimum, '<=%1', MpesaTrans.Amount);
            SafcomCharges.SetFilter(Maximum, '>=%1', MpesaTrans.Amount);
            if SafcomCharges.FindFirst then begin
                SafcomFee := SafcomCharges.Charge;
            end;



            PrePaymentGL := CoopSetup."Pre-Payment Account";
            VendorCommission := CoopSetup."Vendor Commission";
            TotalCharge := SaccoFee + VendorCommission + SafcomFee + SMSCharge;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);


        end
        else begin
            Error('Setup Missing for %1', Transaction);
        end;


        MemberID := '';

        if (Transaction = 'Withdrawal Request') or (Transaction = 'Utility Request') or (Transaction = 'Pesalink Transfer Request') or (Transaction = 'Bank Transfer Request') or (Transaction = 'Airtime Request') then begin

            if not CorrectPin(PhoneNo, PIN) then begin
                Response := 'INCORRECT_PIN';
                exit;
            end;

        end;




        if (TransactionType = Transactiontype::Paybill) or (TransactionType = Transactiontype::"Bank Agent Deposit") or (TransactionType = Transactiontype::"Bank Deposit") then begin




            SavAcc.Reset;
            SavAcc.SetRange("Product Type", '505');
            SavAcc.SetRange("Transactional Mobile No", AccountNo);
            if (SavAcc.FindFirst) then begin
                MemberID := SavAcc."ID No.";
                AccountNo := SavAcc."No.";
            end
            else begin

                SavAcc.Reset;
                SavAcc.SetRange("No.", AccountNo);
                if (SavAcc.FindFirst) then begin
                    MemberID := SavAcc."ID No.";
                    AccountNo := SavAcc."No.";
                end
                else begin

                    SavAcc.Reset;
                    SavAcc.SetRange("Product Type", '505');
                    SavAcc.SetRange("Transactional Mobile No", PhoneNo);
                    if (StrLen(PhoneNo) = 13) and (SavAcc.FindFirst) then begin

                        MemberID := SavAcc."ID No.";
                        AccountNo := SavAcc."No.";
                    end
                    else begin

                        MpesaTrans.Init;
                        MpesaTrans."Entry No." := EntryCode;
                        MpesaTrans."Transaction ID" := TransactionID;
                        MpesaTrans."Session ID" := TransactionID;
                        MpesaTrans."Transaction Type" := TransactionType;
                        MpesaTrans."Transaction Name" := Transaction;
                        MpesaTrans.Description := CopyStr(Description, 1, 50);
                        ;
                        MpesaTrans."Transaction Date" := Dt2Date(TransactionDate);
                        MpesaTrans."Transaction Time" := Dt2Time(TransactionDate);
                        MpesaTrans."Member Account" := AccountNo;
                        MpesaTrans.Amount := Amount;
                        MpesaTrans."Loan No." := LoanNo;
                        MpesaTrans."Mobile No." := PhoneNo;
                        MpesaTrans."Vendor Commission" := VendorCommission;
                        MpesaTrans."Sacco Fee" := SaccoFee;
                        MpesaTrans."Paybill Member ID" := MemberID;
                        MpesaTrans."Destination Account" := DestinationAcc;
                        MpesaTrans."Destination Name" := DestinationName;
                        MpesaTrans.Organization := DestinationOrg;
                        //For business account
                        MpesaTrans."Client Phone Number" := ClientPhoneNumber;
                        MpesaTrans."Customer Name" := CustomerName;
                        MpesaTrans.Insert;

                        Response := '<Response>';
                        Response += '<Status>SUCCESS</Status>';
                        Response += '<StatusDescription>Success</StatusDescription>';
                        Response += '<Reference>' + Format(EntryCode) + '</Reference>';
                        Response += '</Response>';
                        //PostMpesaTransaction(TransactionID);
                        exit;
                    end;
                end
            end;
        end;

        if SavAcc.Get(AccountNo) then begin
            TelNo := SavAcc."Transactional Mobile No";

            if (Transaction = 'Withdrawal Request') or (Transaction = 'Utility Request') or (Transaction = 'Pesalink Transfer Request') or (Transaction = 'Bank Transfer Request') or (Transaction = 'Airtime Request') then begin

                if ((SavAcc.Status <> SavAcc.Status::New) and (SavAcc.Status <> SavAcc.Status::Active)) or (SavAcc.Blocked = SavAcc.Blocked::Debit) then begin
                    Response := 'ACCOUNT_NOT_ACTIVE';
                    exit;
                end;

                AccBal := GetAccountBalance(SavAcc."No.");
                if (AccBal >= Amount + TotalCharge + ExciseDuty) then begin

                    MobileWithdrawalsBuffer.Init;
                    MobileWithdrawalsBuffer."Reference No" := Format(EntryCode);
                    MobileWithdrawalsBuffer."Trace ID" := TransactionID;
                    MobileWithdrawalsBuffer."Posting Date" := Dt2Date(TransactionDate);
                    ;
                    MobileWithdrawalsBuffer."Account No" := AccountNo;
                    MobileWithdrawalsBuffer.Description := CopyStr(DestinationOrg + ' ' + Transaction, 1, 50);
                    MobileWithdrawalsBuffer.Amount := Amount;
                    MobileWithdrawalsBuffer."Unit ID" := 'M-PESA';
                    MobileWithdrawalsBuffer."Transaction Type" := 'Withdrawal';
                    MobileWithdrawalsBuffer."Transaction Date" := Dt2Date(TransactionDate);
                    MobileWithdrawalsBuffer.Source := MobileWithdrawalsBuffer.Source::"M-PESA";
                    MobileWithdrawalsBuffer.Insert;


                    ProductFactory.Get(SavAcc."Product Type");
                    Priority := 211;
                    HMember.Get(SavAcc."Member No.");
                    FName := HMember."First Name";
                    if FName = '' then
                        FName := HMember."Second Name";


                    Response := 'SUCCESS%&:' + HMember."First Name" + ' ' + HMember."Second Name" + ' ' + HMember."Last Name";

                    Priority := 211;


                    ProductFactory.Get(SavAcc."Product Type");
                    Priority := 211;
                    HMember.Get(SavAcc."Member No.");
                    FName := HMember."First Name";
                    if FName = '' then
                        FName := HMember."Second Name";


                    //ERROR(DestinationName);
                    if DestinationOrg <> DestinationAcc then
                        msg := 'Dear ' + FName + ',' + NewLine + 'You have initiated ' + Transaction + ' of KES ' + Format(Amount) + ' from your ' + ProductFactory."USSD Product Name" + ' to ' + Format(DestinationOrg) + ' - ' + Format(DestinationAcc) + ' on ' +
                    Format(Today, 0, '<Day,2>/<Month,2>/<Year4>') + ' ' + Format(Time) + '. Kindly wait as we process this transaction.' + NewLine + 'REF: ' + EntryCode
                    else
                        msg := 'Dear ' + FName + ',You have initiated ' + Transaction + ' of KES ' + Format(Amount) + ' from your ' + ProductFactory."USSD Product Name" + ' to ' + Format(DestinationOrg) + ' on ' + Format(Today, 0, '<Day,2>/<Month,2>/<Year4>') + ' ' + Format(Time) +
                        '. Kindly wait as we process this transaction.' + NewLine + 'REF: ' + EntryCode;



                    //SendSmsWithID(Source::MBANKING,SavAcc."Transactional Mobile No",msg,AccountNo,'',TRUE,Priority,FALSE, RequestApplication, RequestCorrelationID, SourceApplication);
                end
                else begin
                    Response := 'INSUFFICIENT_BAL';
                end;
            end
            else begin

                MpesaTrans.Init;
                MpesaTrans."Entry No." := EntryCode;
                MpesaTrans."Transaction ID" := TransactionID;
                MpesaTrans."Session ID" := TransactionID;
                MpesaTrans."Transaction Type" := TransactionType;
                MpesaTrans."Transaction Name" := Transaction;
                MpesaTrans.Description := CopyStr(Description, 1, 50);
                ;
                MpesaTrans."Transaction Date" := Dt2Date(TransactionDate);
                MpesaTrans."Transaction Time" := Dt2Time(TransactionDate);
                MpesaTrans."Member Account" := AccountNo;
                MpesaTrans.Amount := Amount;
                MpesaTrans."Loan No." := LoanNo;
                MpesaTrans."Mobile No." := TelNo;
                MpesaTrans."Vendor Commission" := VendorCommission;
                MpesaTrans."Sacco Fee" := SaccoFee;
                MpesaTrans."Paybill Member ID" := MemberID;
                MpesaTrans."Destination Account" := DestinationAcc;
                MpesaTrans."Destination Name" := DestinationName;
                MpesaTrans.Organization := DestinationOrg;
                //For business account
                MpesaTrans."Client Phone Number" := ClientPhoneNumber;
                MpesaTrans."Customer Name" := CustomerName;
                MpesaTrans.Insert;

                Response := 'SUCCESS';

                Response := '<Response>';
                Response += '<Status>SUCCESS</Status>';
                Response += '<StatusDescription>Success</StatusDescription>';
                Response += '<Reference>' + Format(EntryCode) + '</Reference>';
                Response += '</Response>';

                //PostMpesaTransaction(TransactionID);
            end;

        end
        else begin
            if (TransactionType = Transactiontype::"Bank Deposit")
                or (TransactionType = Transactiontype::"Bank Agent Deposit")
                or (TransactionType = Transactiontype::Paybill)
                or (TransactionType = Transactiontype::"Loan Repayment") then begin

                MpesaTrans.Init;
                MpesaTrans."Entry No." := EntryCode;
                MpesaTrans."Transaction ID" := TransactionID;
                MpesaTrans."Session ID" := TransactionID;
                MpesaTrans."Transaction Type" := TransactionType;
                MpesaTrans."Transaction Name" := Transaction;
                MpesaTrans.Description := CopyStr(Description, 1, 50);
                ;
                MpesaTrans."Transaction Date" := Dt2Date(TransactionDate);
                MpesaTrans."Transaction Time" := Dt2Time(TransactionDate);
                MpesaTrans."Member Account" := AccountNo;
                MpesaTrans.Amount := Amount;
                MpesaTrans."Loan No." := LoanNo;
                MpesaTrans."Mobile No." := PhoneNo;
                MpesaTrans."Vendor Commission" := VendorCommission;
                MpesaTrans."Sacco Fee" := SaccoFee;
                MpesaTrans."Needs Change" := true;
                MpesaTrans."Paybill Member ID" := MemberID;
                //For business account
                MpesaTrans."Client Phone Number" := ClientPhoneNumber;
                MpesaTrans."Customer Name" := CustomerName;
                MpesaTrans.Insert;

                Response := 'SUCCESS';

                Response := '<Response>';
                Response += '<Status>SUCCESS</Status>';
                Response += '<StatusDescription>Success</StatusDescription>';
                Response += '<Reference>' + Format(EntryCode) + '</Reference>';
                Response += '</Response>';

            end
            else
                Error('Account Not Found');

        end;
    end;


    procedure GetTransactionCharges(Transaction: Text; Amount: Decimal; AccountNumber: Code[30]): Decimal
    var
        CoopSetup: Record 52185471;
        TransactionType: Option " ","Mpesa Withdrawal","Mpesa Deposit","Utility Payment","Loan Repayment","Balance Enquiry","Mini-Statement","Loan Disbursement","Account Transfer","Pay Loan From Account",Paybill,"Mobile App Login","Pesalink Transfer",Airtime,"Bank Deposit","Bank Agent Deposit","Bank Transfer";
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SafcomCharges: Record 52185475;
        SafcomAcc: Code[20];
        SafcomFee: Decimal;
        AgentSavings: Record 52185730;
        AgentFloatAcc: Record 52185730;
        Agent: Record 52186104;
    begin
        if Transaction = 'Balance Enquiry' then
            TransactionType := Transactiontype::"Balance Enquiry";

        if Transaction = 'Loan Repayment' then
            TransactionType := Transactiontype::"Loan Repayment";


        if Transaction = 'Mini-Statement' then
            TransactionType := Transactiontype::"Mini-Statement";

        if Transaction = 'Mpesa Deposit' then
            TransactionType := Transactiontype::"Mpesa Deposit";

        if Transaction = 'Bank Deposit' then
            TransactionType := Transactiontype::"Bank Deposit";

        if Transaction = 'Bank Agent Deposit' then
            TransactionType := Transactiontype::"Bank Agent Deposit";

        if Transaction = 'Mpesa Withdrawal' then
            TransactionType := Transactiontype::"Mpesa Withdrawal";


        if Transaction = 'Airtime Request' then
            TransactionType := Transactiontype::Airtime;

        if Transaction = 'Airtime Purchase' then
            TransactionType := Transactiontype::Airtime;


        if Transaction = 'Utility Request' then
            TransactionType := Transactiontype::"Utility Payment";

        if Transaction = 'Utility Payment' then
            TransactionType := Transactiontype::"Utility Payment";

        if Transaction = 'Withdrawal Request' then
            TransactionType := Transactiontype::"Mpesa Withdrawal";

        if Transaction = 'Paybill' then
            TransactionType := Transactiontype::Paybill;


        if Transaction = 'Bank Transfer' then
            TransactionType := Transactiontype::"Bank Transfer";


        if Transaction = 'Bank Transfer Request' then
            TransactionType := Transactiontype::"Bank Transfer";


        if Transaction = 'Pesalink Transfer' then
            TransactionType := Transactiontype::"Pesalink Transfer";


        if Transaction = 'Pesalink Transfer Request' then
            TransactionType := Transactiontype::"Pesalink Transfer";

        TotalCharge := 0;
        SaccoFee := 0;
        VendorCommission := 0;
        SafcomFee := 0;
        SMSCharge := 0;
        ExciseDuty := 0;

        ExciseDutyRate := GetExciseRate;

        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", TransactionType);
        if CoopSetup.FindFirst then begin

            SMSAccount := CoopSetup."SMS Account";
            SMSCharge := CoopSetup."SMS Charge";



            if CoopSetup."Charge Type" = CoopSetup."charge type"::Staggered then begin
                SacAcc := '';
                GetChargeAmount(CoopSetup."Staggered Charge Code", Amount, SaccoFee, VendorCommission);
            end;


            if CoopSetup."Transaction Type" = CoopSetup."transaction type"::"Mpesa Withdrawal" then begin
                SafcomCharges.Reset;
                SafcomCharges.SetFilter(Charge, '>0');
                SafcomCharges.SetFilter(Minimum, '<=%1', Amount);
                SafcomCharges.SetFilter(Maximum, '>=%1', Amount);
                SafcomCharges.SetRange(Category, SafcomCharges.Category::Safaricom);
                if SafcomCharges.FindFirst then begin
                    SafcomFee := SafcomCharges.Charge;
                end;
            end;

            if CoopSetup."Transaction Type" = CoopSetup."transaction type"::"Pesalink Transfer" then begin
                SafcomCharges.Reset;
                SafcomCharges.SetFilter(Charge, '>0');
                SafcomCharges.SetFilter(Minimum, '<=%1', Amount);
                SafcomCharges.SetFilter(Maximum, '>=%1', Amount);
                SafcomCharges.SetRange(Category, SafcomCharges.Category::Bank);
                if SafcomCharges.FindFirst then begin
                    SafcomFee := SafcomCharges.Charge;
                end;
            end;


            if CoopSetup."Charge Type" <> CoopSetup."charge type"::Staggered then
                SaccoFee := CoopSetup."Sacco Fee";
            VendorCommission := CoopSetup."Vendor Commission";

            TotalCharge := SaccoFee + VendorCommission + SafcomFee + SMSCharge;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
            TotalCharge += ExciseDuty;

            //Check if agents are not to be charged on withdrawal
            if not CoopSetup."Charge Agents" then begin
                if CoopSetup."Transaction Type" = CoopSetup."transaction type"::"Mpesa Withdrawal" then begin
                    if AgentSavings.Get(AccountNumber) then begin
                        AgentFloatAcc.Reset;
                        AgentFloatAcc.SetRange("Member No.", AgentSavings."Member No.");
                        AgentFloatAcc.SetRange("Product Type", '512');
                        if AgentFloatAcc.FindFirst then begin
                            Agent.Reset;
                            Agent.SetRange(Account, AgentFloatAcc."No.");
                            Agent.SetRange("Approval Status", Agent."approval status"::Approved);
                            if Agent.FindFirst then begin
                                TotalCharge := 0;
                                SaccoFee := 0;
                                VendorCommission := 0;
                                SafcomFee := 0;
                                SMSCharge := 0;
                                TotalCharge := 0;
                            end;
                        end;
                    end;
                end;
            end;

        end
        else begin
            if CoopSetup."Transaction Type" <> CoopSetup."transaction type"::"Pay Loan From Account" then
                Error('Setup Missing for %1', CoopSetup."Transaction Type");
        end;
        exit(TotalCharge);
    end;


    procedure PostMpesaTransaction(DocumentNo: Code[20]; SessionID: Text) Response: Text
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        MpesaTrans: Record 52185482;
        TransAmt: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal,"Penalty Due","Penalty Paid";
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        RunBal: Decimal;
        AccBal: Decimal;
        Loans: Record 52185729;
        IntAmt: Decimal;
        PrAmt: Decimal;
        ATMTrans: Record 52185755;
        SafcomCharges: Record 52185475;
        SafcomAcc: Code[20];
        SafcomFee: Decimal;
        MobileWithdrawalsBuffer: Record 52185755;
        msg: Text;
        PrePaymentGL: Code[20];
        NewLoanBal: Decimal;
        LoanType: Record 52185690;
        LT: Text;
        AccountToCharge: Code[20];
        BillAcc: Record 52185730;
        IntRate: Decimal;
        MemberName: Text;
        Depositor: Text;
        GenSetup: Record 52185689;
        DepDesc: Text;
        MobileNo: Code[20];
        LengthWithin: Boolean;
        FosaAcc: Record 52185730;
        NewAccBalance: Decimal;
        BusinessAccount: Record 52185730;
        ProductFactory: Record 52185690;
        BusinessProdCode: Code[30];
        AgentSavings: Record 52185730;
        AgentFloatAcc: Record 52185730;
        Agent: Record 52186104;
        ReceipientPhoneNumber: Text;
        ReceipientsName: Text;
    begin
        MpesaTrans.LockTable(true);
        MpesaTrans.Reset;
        MpesaTrans.SetRange("Transaction ID", DocumentNo);
        MpesaTrans.SetRange(Posted, false);
        MpesaTrans.SetRange("Needs Change", false);
        MpesaTrans.SetFilter("Transaction Type", '<>%1|<>%2|<>%3',
        MpesaTrans."transaction type"::"Balance Enquiry",
        MpesaTrans."transaction type"::"Mini-Statement",
        MpesaTrans."transaction type"::"Account Transfer");

        GenSetup.Get;
        if GenSetup."MBanking Posting Date" <> 0D then
            MpesaTrans.SetRange("Transaction Date", GenSetup."MBanking Posting Date");



        if MpesaTrans.FindFirst then begin
            GenSetup.Get;

            // Get Excise duty G/L
            ExciseDutyGL := GetExciseDutyGL();
            ExciseDutyRate := GetExciseRate();
            ExciseDuty := 0;



            SaccoAccount := '';
            SaccoFee := 0;
            VendorAccount := '';
            VendorCommission := 0;
            SafcomAcc := '';
            SafcomFee := 0;
            PrePaymentGL := '';
            SMSAccount := '';
            SMSCharge := 0;

            CoopSetup.Reset;
            CoopSetup.SetRange("Transaction Type", MpesaTrans."Transaction Type");
            if CoopSetup.FindFirst then begin

                SMSAccount := CoopSetup."SMS Account";
                SMSCharge := CoopSetup."SMS Charge";

                if MpesaTrans.MobileApp then
                    SMSCharge := 0;

                if CoopSetup."Charge Type" = CoopSetup."charge type"::Staggered then begin
                    SacAcc := '';
                    GetChargeAmount(CoopSetup."Staggered Charge Code", MpesaTrans.Amount, SaccoFee, VendorCommission);
                    //MESSAGE('%1',SafcomFee);
                end;



                SafcomCharges.Reset;
                SafcomCharges.SetRange("Transaction Type", MpesaTrans."Transaction Type");
                SafcomCharges.SetFilter(Charge, '>0');
                SafcomCharges.SetFilter(Minimum, '<=%1', MpesaTrans.Amount);
                SafcomCharges.SetFilter(Maximum, '>=%1', MpesaTrans.Amount);
                if SafcomCharges.FindFirst then begin
                    SafcomFee := SafcomCharges.Charge;
                end;






                PrePaymentGL := CoopSetup."Pre-Payment Account";
                SafcomAcc := CoopSetup."Safaricom Account";
                SaccoAccount := CoopSetup."Sacco Fee Account";
                if CoopSetup."Charge Type" <> CoopSetup."charge type"::Staggered then begin
                    SaccoFee := CoopSetup."Sacco Fee";
                    VendorCommission := CoopSetup."Vendor Commission";
                end;
                VendorAccount := CoopSetup."Vendor Commission Account";


                TotalCharge := SaccoFee + VendorCommission + SafcomFee + SMSCharge;
                ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);

                //Check if agents are not to be charged on withdrawal
                if not CoopSetup."Charge Agents" then begin
                    if MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Mpesa Withdrawal" then begin
                        if AgentSavings.Get(MpesaTrans."Member Account") then begin
                            AgentFloatAcc.Reset;
                            AgentFloatAcc.SetRange("Member No.", AgentSavings."Member No.");
                            AgentFloatAcc.SetRange("Product Type", '512');
                            if AgentFloatAcc.FindFirst then begin
                                Agent.Reset;
                                Agent.SetRange(Account, AgentFloatAcc."No.");
                                Agent.SetRange("Approval Status", Agent."approval status"::Approved);
                                if Agent.FindFirst then begin
                                    TotalCharge := 0;
                                    SaccoFee := 0;
                                    VendorCommission := 0;
                                    SafcomFee := 0;
                                    SMSCharge := 0;
                                end;
                            end;
                        end;
                    end;
                end;

            end
            else begin
                if MpesaTrans."Transaction Type" <> MpesaTrans."transaction type"::"Pay Loan From Account" then
                    Error('Setup Missing for %1', MpesaTrans."Transaction Type");
            end;

            //ERROR('SafcomFee %1\SaccoFee %2',SafcomFee,SaccoFee);

            if SavAcc.Get(MpesaTrans."Member Account") then begin
                MemberName := SavAcc."No.";
                TransAmt := MpesaTrans.Amount;
                AccountToCharge := '';

                BillAcc.Reset;
                BillAcc.SetRange("Member No.", SavAcc."Member No.");
                BillAcc.SetRange("Product Type", '505');
                if BillAcc.FindFirst then
                    AccountToCharge := BillAcc."No.";

                if (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Loan Repayment") or
                    (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::Paybill) or
                    (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Mpesa Deposit") or
                    (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Bank Deposit") or
                    (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Bank Agent Deposit") or
                    (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Pay Loan From Account")
                    then
                    TransAmt := TransAmt * -1;

                if TransAmt >= 0 then begin
                    if SavAcc.Blocked = SavAcc.Blocked::Debit then begin
                        MpesaTrans."Needs Change" := true;
                        MpesaTrans.Modify;
                        exit;
                    end;
                end;

                if TransAmt < 0 then begin
                    if (SavAcc.Blocked <> SavAcc.Blocked::" ") then begin
                        MpesaTrans."Needs Change" := true;
                        MpesaTrans.Modify;
                        exit;
                    end;
                end;

                if (SavAcc.Blocked = SavAcc.Blocked::All) then begin
                    MpesaTrans."Needs Change" := true;
                    MpesaTrans.Modify;
                    exit;
                end;

                //BUser.GET(USERID);

                //BUser.TESTFIELD("Cashier Journal Template");
                //BUser.TESTFIELD("Cashier Journal Batch");

                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';

                GenJournalBatch.Reset;
                GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                GenJournalBatch.SetRange(Name, JBatch);
                if not GenJournalBatch.FindFirst then begin
                    GenJournalBatch.Init;
                    GenJournalBatch."Journal Template Name" := JTemplate;
                    GenJournalBatch.Name := JBatch;
                    GenJournalBatch.Description := 'Sky World Batch';
                    GenJournalBatch.Init;
                end;

                DocNo := MpesaTrans."Transaction ID";
                PDate := MpesaTrans."Transaction Date";

                if CalcDate('-CM', Today) > PDate then PDate := Today;

                AccNo := MpesaTrans."Member Account";
                ExtDoc := '';
                if StrLen(MpesaTrans."Mobile No.") > 5 then
                    ExtDoc := MpesaTrans."Mobile No.";
                LoanNo := '';
                TransType := Transtype::" ";
                Dim1 := SavAcc."Global Dimension 1 Code";
                Dim2 := SavAcc."Global Dimension 2 Code";
                SystCreated := true;

                SaccoTrans.InitJournal(JTemplate, JBatch);


                if (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::Airtime) then begin

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(MpesaTrans.Description, 1, 50), Balacctype::"G/L Account",
                                  '', TransAmt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Vendor, VendorAccount, CopyStr(MpesaTrans.Description, 1, 50), Balacctype::"G/L Account",
                                  '', -TransAmt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);
                end
                else
                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(MpesaTrans.Description, 1, 50), Balacctype::"Bank Account",
                                  CoopSetup."Bank Account", TransAmt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


                if (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::Paybill) then begin

                    FosaAcc.Reset;
                    FosaAcc.SetRange("No.", AccNo);
                    FosaAcc.SetRange("Product Category", FosaAcc."product category"::"Deposit Contribution");
                    if FosaAcc.FindFirst then
                        LoansProcess.AdviceShares(FosaAcc, Abs(TransAmt), FosaAcc."Monthly Contribution");
                end;



                if TotalCharge > 0 then begin
                    AccountToCharge := AccNo;

                    FosaAcc.Reset;
                    FosaAcc.SetRange("Member No.", SavAcc."Member No.");
                    FosaAcc.SetRange("Product Type", '505');
                    if FosaAcc.FindFirst then
                        AccountToCharge := FosaAcc."No.";





                    /*
                    IF (MpesaTrans."Transaction Type"  <> MpesaTrans."Transaction Type"::Paybill) AND (MpesaTrans."Transaction Type"  <> MpesaTrans."Transaction Type"::"Mpesa Deposit")
                        AND (MpesaTrans."Transaction Type" <> MpesaTrans."Transaction Type"::"Loan Repayment") AND (MpesaTrans."Transaction Type" <> MpesaTrans."Transaction Type"::"Bank Deposit")
                       AND (MpesaTrans."Transaction Type" <> MpesaTrans."Transaction Type"::"Bank Agent Deposit")  THEN BEGIN
                       */


                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccountToCharge, CopyStr(Format(MpesaTrans."Transaction Type") + ' Fee', 1, 50), Balacctype::"G/L Account",
                                  '', TotalCharge + ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    /*
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccountToCharge,COPYSTR('SMS Charges',1,50),BalAccType::"G/L Account",
                                  '',VendorCommission,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccountToCharge,COPYSTR('Corporate Charge',1,50),BalAccType::"Bank Account",
                                  SafcomAcc,SafcomFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccountToCharge,COPYSTR('Transaction Charge',1,50),BalAccType::"G/L Account",
                                  SaccoAccount,SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccountToCharge,COPYSTR('Notification Charge - ',1,50),BalAccType::"G/L Account",
                                  SMSAccount,SMSCharge,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccountToCharge,COPYSTR('Excise Duty - Charges ',1,50),BalAccType::"G/L Account",
                                  ExciseDutyGL,ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    */




                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"Bank Account", SafcomAcc, CopyStr('Fee on ' + MpesaTrans.Description, 1, 50), Balacctype::"G/L Account",
                                  '', -SafcomFee, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", SaccoAccount, CopyStr('Fee on ' + MpesaTrans.Description, 1, 50), Balacctype::"G/L Account",
                                  '', -SaccoFee, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", ExciseDutyGL, CopyStr('Excise Duty on ' + MpesaTrans.Description, 1, 50), Balacctype::"G/L Account",
                                  '', -ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    /*
                    END
                    ELSE BEGIN
        
                        CoopSetup.TESTFIELD("Non-Member Debit Account");
                        DepDesc := 'C2B Mpesa Deposit';
                        IF (MpesaTrans."Transaction Type" = MpesaTrans."Transaction Type"::"Bank Deposit")  THEN
                          DepDesc := 'C2B Bank Deposit';
                        IF (MpesaTrans."Transaction Type" = MpesaTrans."Transaction Type"::"Bank Agent Deposit")  THEN
                          DepDesc := 'C2B Bank Agent Deposit';
        
                        SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::"G/L Account",CoopSetup."Non-Member Debit Account",COPYSTR(DepDesc,1,50),BalAccType::"G/L Account",
                              '',VendorCommission,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
                        IF (MpesaTrans."Transaction Type" = MpesaTrans."Transaction Type"::"Bank Agent Deposit")  THEN BEGIN
                          SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::"G/L Account",CoopSetup."Non-Member Debit Account",COPYSTR('Corporate Charge',1,50),BalAccType::"Bank Account",
                                      SafcomAcc,SafcomFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
                        END;
        
                    END;
                    */

                    AccNo := VendorAccount;
                    ExtDoc := MpesaTrans."Member Account";
                    LoanNo := '';
                    TransType := Transtype::" ";

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Vendor, AccNo, CopyStr('Fee on ' + MpesaTrans.Description, 1, 50), Balacctype::"G/L Account",
                                  '', -VendorCommission, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


                end;


                if MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Loan Repayment" then begin

                    AccBal := GetAccountBalance(SavAcc."No.");
                    RunBal := AccBal + MpesaTrans.Amount - (TotalCharge + ExciseDuty);

                    if RunBal > 0 then begin
                        RunBal := MpesaTrans.Amount;
                        Loans.Reset;
                        Loans.SetRange("Loan No.", MpesaTrans."Loan No.");
                        Loans.SetRange("Member No.", SavAcc."Member No.");
                        if Loans.FindFirst then begin

                            Loans.CalcFields("Outstanding Balance", "Outstanding Interest", "Outstanding Bills");

                            IntRate := Loans.Interest / 12;

                            IntAmt := Loans."Outstanding Interest";


                            if IntAmt > 0 then begin

                                if IntAmt > RunBal then
                                    IntAmt := RunBal;

                                AccNo := MpesaTrans."Member Account";
                                ExtDoc := '';
                                LoanNo := Loans."Loan No.";
                                TransType := Transtype::"Interest Paid";
                                SystCreated := true;

                                MpesaTrans."Interest Paid" := IntAmt;
                                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(MpesaTrans.Description, 1, 50), Balacctype::"G/L Account",
                                              '', IntAmt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                                AccNo := Loans."Loan Account";
                                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, AccNo, CopyStr(MpesaTrans.Description, 1, 50), Balacctype::"G/L Account",
                                              '', -IntAmt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


                                RunBal -= IntAmt;

                            end;


                            if Loans."Outstanding Balance" > 0 then begin
                                PrAmt := Loans."Outstanding Balance";
                                if PrAmt > RunBal then
                                    PrAmt := RunBal;

                                AccNo := MpesaTrans."Member Account";
                                ExtDoc := '';
                                LoanNo := Loans."Loan No.";
                                TransType := Transtype::Repayment;
                                SystCreated := true;

                                MpesaTrans."Principal Paid" := PrAmt;

                                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(MpesaTrans.Description, 1, 50), Balacctype::"G/L Account",
                                              '', PrAmt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                                AccNo := Loans."Loan Account";
                                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, AccNo, CopyStr(MpesaTrans.Description, 1, 50), Balacctype::"G/L Account",
                                              '', -PrAmt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                                RunBal -= PrAmt;


                                if BillProdFac.Get(Loans."Loan Product Type") then begin
                                    if not ProdFac."No Principle Bills" then begin
                                        if PrAmt > Loans."Outstanding Bills" then
                                            PrAmt := Loans."Outstanding Bills";
                                        SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, Loans."Loan Account", CopyStr(MpesaTrans.Description, 1, 50), Balacctype::"G/L Account",
                                                BillProdFac."Billed Account", -PrAmt, ExtDoc, Loans."Loan No.", Transtype::Bills, Dim1, Dim2, SystCreated);
                                    end;
                                end;

                            end;

                        end;
                    end;
                end;



                //MARK BUFFER AS POSTED
                MobileWithdrawalsBuffer.Reset;
                MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer."Trace ID", MpesaTrans."Entry No.");
                MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer.Source, MobileWithdrawalsBuffer.Source::"M-PESA");
                MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer."Account No", MpesaTrans."Member Account");
                MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer.Amount, MpesaTrans.Amount);
                if MobileWithdrawalsBuffer.Find('-') then begin

                    MobileWithdrawalsBuffer.Posted := true;
                    MobileWithdrawalsBuffer."Posting Date" := Today;
                    MobileWithdrawalsBuffer.Modify;
                end;


                MpesaTrans.Posted := true;
                MpesaTrans."Posted By" := UserId;
                MpesaTrans."Date Posted" := Today;
                MpesaTrans."Time Posted" := Time;
                MpesaTrans.Modify;


                Priority := 211;
                SaccoTrans.PostJournal(JTemplate, JBatch);


                if MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Mpesa Withdrawal" then
                    Priority := 211;
                if MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Utility Payment" then
                    Priority := 211;


                if MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Loan Repayment" then begin
                    if Loans.Get(LoanNo) then begin
                        Loans.CalcFields("Outstanding Balance");
                        LT := Loans."Loan Product Type Name";
                        if LoanType.Get(Loans."Loan Product Type") then
                            LT := LoanType."USSD Product Name";

                        NewLoanBal := Loans."Outstanding Balance";
                        msg := GetSMSSalutation(Loans."Member No.") +
                              Format(MpesaTrans."Transaction Type") + ' of KES ' + Format(MpesaTrans.Amount) + ' done on ' + Format(ddMMyyyy(MpesaTrans."Transaction Date")) +
                              ' has been processed successfully. Interest Paid is ' + Format(MpesaTrans."Interest Paid") + ', Principal Paid is ' + Format(MpesaTrans."Principal Paid") +
                              ', New ' + LT + ' Balance is ' + Format(NewLoanBal) + NewLine + 'REF: ' + MpesaTrans."Entry No.";

                        Loans.Validate(Repayment);
                        //AdviceLoan(Loans."Loan No.",FALSE);
                    end;
                end
                else begin
                    if MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::Paybill then begin
                        ProductFactory.Reset;
                        ProductFactory.SetRange("Product Category", ProductFactory."product category"::"Business Account");
                        if ProductFactory.FindFirst then BusinessProdCode := ProductFactory."Product ID";

                        BusinessAccount.Reset;
                        BusinessAccount.SetRange("No.", MpesaTrans."Member Account");
                        BusinessAccount.SetRange("Product Type", BusinessProdCode);
                        if BusinessAccount.FindFirst then begin
                            //when its a customer depositing money
                            if (MpesaTrans."Mobile No." <> MpesaTrans."Client Phone Number") and (MpesaTrans."Client Phone Number" <> '') then begin

                                msg := 'Dear ' + MpesaTrans."Customer Name" + ' your payment of KES ' + Format(MpesaTrans.Amount) + ' to ' + SavAcc.Name +
                                ' has been received successfully.' + NewLine + 'Date: ' + Format(ddMMyyyy(MpesaTrans."Transaction Date")) +
                                        '.' + NewLine + 'REF: ' + MpesaTrans."Transaction ID";
                                SendSms(Source::MBANKING, MpesaTrans."Client Phone Number", msg, MpesaTrans."Transaction ID", '', true, 205, false);

                                Depositor := CopyStr(MpesaTrans.Description, 24, StrLen(MpesaTrans.Description));
                                msg := GetSMSSalutation(SavAcc."Member No.") + Depositor + '''s(+' + MpesaTrans."Client Phone Number" + ') payment of KES ' + Format(MpesaTrans.Amount) +
                                ' to ' + SavAcc.Name + ' has been received successfully.' + NewLine + 'Date: ' + Format(ddMMyyyy(MpesaTrans."Transaction Date")) +
                                        '.' + NewLine + 'REF: ' + MpesaTrans."Transaction ID";
                                SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, MpesaTrans."Transaction ID", '', true, 205, false);

                            end else begin//when its the owner of the business depositing

                                Depositor := CopyStr(MpesaTrans.Description, 24, StrLen(MpesaTrans.Description));
                                msg := GetSMSSalutation(SavAcc."Member No.") + Depositor + ' your payment of KES ' + Format(MpesaTrans.Amount) +
                                ' to ' + SavAcc.Name + ' has been received successfully.' + NewLine + 'Date: ' + Format(ddMMyyyy(MpesaTrans."Transaction Date")) +
                                        '.' + NewLine + 'REF: ' + MpesaTrans."Transaction ID";
                                SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, MpesaTrans."Transaction ID", '', true, 205, false);

                            end;
                        end else begin
                            if (MpesaTrans."Mobile No." <> '+' + MpesaTrans."Client Phone Number") and (MpesaTrans."Client Phone Number" <> '') then begin
                                Depositor := CopyStr(MpesaTrans.Description, 24, StrLen(MpesaTrans.Description));

                                msg := 'Dear ' + MpesaTrans."Customer Name" + ' your deposit of KES ' + Format(MpesaTrans.Amount) + ' to ' + SavAcc.Name +
                               ' has been received successfully.' + NewLine + 'Date: ' + Format(ddMMyyyy(MpesaTrans."Transaction Date")) +
                                       '.' + NewLine + 'REF: ' + MpesaTrans."Transaction ID";
                                SendSms(Source::MBANKING, MpesaTrans."Client Phone Number", msg, MpesaTrans."Transaction ID", '', true, 205, false);

                                //MemberName
                                msg := GetSMSSalutation(SavAcc."Member No.") +
                                      Depositor + ' has successfully deposited KES ' + Format(MpesaTrans.Amount) +
                                          ' to your ' + SavAcc."Product Name" + ' on ' + Format(ddMMyyyy(MpesaTrans."Transaction Date")) +
                                          '.' + NewLine + 'REF: ' + MpesaTrans."Transaction ID";
                                ;



                            end else begin
                                Depositor := CopyStr(MpesaTrans.Description, 24, StrLen(MpesaTrans.Description));
                                //MemberName
                                msg := GetSMSSalutation(SavAcc."Member No.") +
                                      'you have successfully deposited KES ' + Format(MpesaTrans.Amount) +
                                          ' to your ' + SavAcc."Product Name" + ' on ' + Format(ddMMyyyy(MpesaTrans."Transaction Date")) +
                                          '.' + NewLine + 'REF: ' + MpesaTrans."Transaction ID";
                                ;
                            end;
                        end;

                    end
                    else begin
                        msg := GetSMSSalutation(SavAcc."Member No.") +
                               Format(MpesaTrans."Transaction Type") + ' of KES ' + Format(MpesaTrans.Amount) + ' done on ' + Format(ddMMyyyy(MpesaTrans."Transaction Date")) + '  has been processed successfully.';
                    end;
                end;



                HMember.Get(SavAcc."Member No.");
                FName := HMember."First Name";
                if FName = '' then
                    FName := HMember."Second Name";

                if (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Mpesa Withdrawal") or
                  (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Utility Payment") or
                  (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Bank Transfer") or
                  (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Pesalink Transfer") then begin

                    NewAccBalance := GetAccountBalance(SavAcc."No.");

                    if MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Mpesa Withdrawal" then begin
                        ReceipientPhoneNumber := CopyStr(MpesaTrans.Description, StrLen(MpesaTrans.Description) - 12, StrLen(MpesaTrans.Description));
                        if ReceipientPhoneNumber <> CopyStr(MpesaTrans."Mobile No.", 2, StrLen(MpesaTrans."Mobile No.")) then begin
                            ReceipientsName := CopyStr(MpesaTrans.Description, 14, StrLen(MpesaTrans.Description) - 12);

                            msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + Format(MpesaTrans."Transaction Type") + ' of KES ' + Format(MpesaTrans.Amount) +
                            ' to ' + ReceipientsName + ' has been processed successfully on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) + NewLine + ' MPESA Ref: ' + MpesaTrans."Transaction ID" +
                            NewLine + 'New A/C Bal is Ksh' + Format(NewAccBalance) + NewLine + ' REF: ' + MpesaTrans."Entry No.";


                        end;
                    end else begin

                        msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + Format(MpesaTrans."Transaction Type") + ' of KES ' + Format(MpesaTrans.Amount) +
                              ' has been processed successfully on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) + NewLine + ' MPESA Ref: ' + MpesaTrans."Transaction ID" +
                              NewLine + 'New A/C Bal is Ksh' + Format(NewAccBalance) + NewLine + ' REF: ' + MpesaTrans."Entry No.";

                    end;

                    // if StrLen(msg + NewLine + MobileAppLink) < 250 then
                    //     msg := msg + NewLine + MobileAppLink;

                end;


                if (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Utility Payment") then begin

                    NewAccBalance := GetAccountBalance(SavAcc."No.");
                    msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + Format(MpesaTrans."Transaction Type") + ' of KSHS ' + Format(MpesaTrans.Amount) + ' to ' + MpesaTrans.Organization +
                          ' MPESA Ref: ' + MpesaTrans."Transaction ID" + ' has been processed successfully on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) + NewLine + 'New A/C Bal is Ksh' + Format(NewAccBalance) + NewLine + ' REF:' +
                          MpesaTrans."Entry No.";

                end;

                if (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::Airtime) then begin

                    NewAccBalance := GetAccountBalance(SavAcc."No.");
                    msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'You have successfully purchased Airtime of KSHS ' + Format(MpesaTrans.Amount) +
                          ' on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) + '.' + NewLine + 'New A/C Bal is Ksh' + Format(NewAccBalance) + NewLine + ' REF:' + MpesaTrans."Entry No.";

                end;




                MobileNo := SavAcc."Transactional Mobile No";
                if MobileNo = '' then
                    MobileNo := SavAcc."Mobile Phone No";

                if (MpesaTrans."Transaction Type" <> MpesaTrans."transaction type"::"Mini-Statement") and (MpesaTrans."Transaction Type" <> MpesaTrans."transaction type"::"Balance Enquiry") then
                    if (MpesaTrans."Transaction Type" <> MpesaTrans."transaction type"::"Mobile App Login") then
                        SendSmsWithID(Source::MBANKING, MobileNo, msg, Format(MpesaTrans."Transaction ID"), '', true, Priority, false, 'CBS', SessionID, 'CBS');

                //ERROR('Test');

            end
            else begin

                if (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::Paybill) or (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Bank Agent Deposit") or
                  (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Bank Deposit") then begin

                    SavAcc.Reset;
                    SavAcc.SetRange("Transactional Mobile No", MpesaTrans."Member Account");
                    SavAcc.SetRange("Product Type", '505');
                    if SavAcc.FindFirst then begin
                        MpesaTrans."Member Account" := SavAcc."No.";
                        MpesaTrans."Paybill Member ID" := SavAcc."ID No.";
                        MpesaTrans.Modify;

                    end
                    else begin

                        if Loans.Get(MpesaTrans."Member Account") then begin
                            SavAcc.Reset;
                            SavAcc.SetRange("Member No.", Loans."Member No.");
                            SavAcc.SetRange("Product Type", '505');
                            if SavAcc.FindFirst then begin
                                MpesaTrans.Description := 'Loan Repayment ' + MpesaTrans."Member Account";
                                MpesaTrans."Member Account" := SavAcc."No.";
                                MpesaTrans."Loan No." := Loans."Loan No.";
                                MpesaTrans."Transaction Type" := MpesaTrans."transaction type"::"Loan Repayment";
                                MpesaTrans."Needs Change" := false;
                                MpesaTrans.Modify;
                            end
                            else begin
                                MpesaTrans."Needs Change" := true;
                                MpesaTrans.Modify;
                            end
                        end
                        else begin
                            MpesaTrans."Needs Change" := true;
                            MpesaTrans.Modify;
                        end;
                    end;
                end
                else begin
                    MpesaTrans."Needs Change" := true;
                    MpesaTrans.Modify;
                end;
            end;
        end;

    end;


    procedure PostLightTransactions(TransactionID: Code[20]) Response: Text[1024]
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        RecMemberName: Text;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        MemberName: Text;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52185482;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        SLedger: Record 52185732;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        AccountBookBalance: Decimal;
        AccountAvailableBalance: Decimal;
        AccountToCharge: Code[20];
        Found: Boolean;
        MemberNo: Code[20];
        TransactionDate: DateTime;
        Loans: Record 52185729;
        LoanType: Text;
        BalStmt: Text;
        msg: Text;
        SafcomCharges: Record 52185475;
        SafcomFee: Decimal;
        BalEnqCharge: Decimal;
        DrAmt: Decimal;
        PayLoan: Boolean;
        IntRate: Decimal;
        IntAmt: Decimal;
        RunBal: Decimal;
        PrAmt: Decimal;
        ItsABusinesAccount: Boolean;
        LT: Text;
        LoanTypes: Record 52185690;
        NewLoanBal: Decimal;
        RecMemberNo: Code[30];
        RecMobileNo: Text;
        MobileNumber: Text;
    begin
        MobileTrans.LockTable(true);
        MobileTrans.Reset;
        MobileTrans.SetRange("Transaction ID", TransactionID);
        MobileTrans.SetRange(Posted, false);
        MobileTrans.SetRange("Needs Change", false);
        MobileTrans.SetRange("Transaction Type", MobileTrans."transaction type"::"Balance Enquiry");
        if MobileTrans.FindFirst then begin

            AccountToCharge := MobileTrans."Member Account";
            MemberNo := '';


            // Get Excise duty G/L
            ExciseDutyGL := GetExciseDutyGL();
            ExciseDutyRate := GetExciseRate();
            ExciseDuty := 0;

            SaccoAccount := '';
            SaccoFee := 0;
            VendorAccount := '';
            VendorCommission := 0;


            SMSAccount := '';
            SMSCharge := 0;

            CoopSetup.Reset;
            CoopSetup.SetRange("Transaction Type", MobileTrans."Transaction Type");
            if CoopSetup.FindFirst then begin

                SMSAccount := CoopSetup."SMS Account";
                SMSCharge := CoopSetup."SMS Charge";


                SaccoAccount := CoopSetup."Sacco Fee Account";
                SaccoFee := CoopSetup."Sacco Fee";
                VendorAccount := CoopSetup."Vendor Commission Account";
                VendorCommission := CoopSetup."Vendor Commission";

                TotalCharge := SaccoFee + VendorCommission + SMSCharge;
                ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);

            end
            else begin
                Error('Setup Missing for %1', CoopSetup."Transaction Type");
            end;



            if SavAcc.Get(AccountToCharge) then begin

                ProdFact.Get(SavAcc."Product Type");

                if (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::"Deposits Only") or
                    (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::" ") then begin
                    Error('The Account to Charge is not a Withdrawable Account');
                end;

                BalEnqCharge := 0;

                BalEnqCharge := TotalCharge + ExciseDuty;


                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';

                GenJournalBatch.Reset;
                GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                GenJournalBatch.SetRange(Name, JBatch);
                if not GenJournalBatch.FindFirst then begin
                    GenJournalBatch.Init;
                    GenJournalBatch."Journal Template Name" := JTemplate;
                    GenJournalBatch.Name := JBatch;
                    GenJournalBatch.Description := 'Sky World Batch';
                    GenJournalBatch.Init;
                end;


                DocNo := MobileTrans."Transaction ID";
                PDate := MobileTrans."Transaction Date";
                AccNo := MobileTrans."Member Account";
                ExtDoc := '';
                LoanNo := '';
                TransType := Transtype::" ";
                Dim1 := SavAcc."Global Dimension 1 Code";
                Dim2 := SavAcc."Global Dimension 2 Code";
                SystCreated := true;

                SaccoTrans.InitJournal(JTemplate, JBatch);

                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(MobileTrans.Description, 1, 50), Balacctype::"G/L Account",
                              '', TotalCharge + ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);



                AccNo := VendorAccount;
                ExtDoc := MobileTrans."Member Account";
                LoanNo := '';
                TransType := Transtype::" ";

                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Vendor, AccNo, CopyStr(MobileTrans.Description + ' Commission', 1, 50), Balacctype::"G/L Account",
                              '', -VendorCommission, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                AccNo := SaccoAccount;
                ExtDoc := MobileTrans."Member Account";
                LoanNo := '';
                TransType := Transtype::" ";

                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", AccNo, CopyStr(MobileTrans.Description + ' Fee', 1, 50), Balacctype::"G/L Account",
                              '', -SaccoFee, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", ExciseDutyGL, CopyStr(MobileTrans.Description + ' Excise Duty', 1, 50), Balacctype::"G/L Account",
                              '', -ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


                MobileTrans.Posted := true;
                MobileTrans."Posted By" := UserId;
                MobileTrans."Date Posted" := Today;
                MobileTrans."Time Posted" := Time;
                MobileTrans.Modify;



                SaccoTrans.PostJournal(JTemplate, JBatch);


            end
            else begin
                Response := 'INVALID_ACCOUNT';
            end;
        end;
        /*--------------------------------------BALANCE ENQUIRY------------------------------------*/

        /*--------------------------------------ACCOUNT TRANSFER------------------------------------*/


        MobileTrans.Reset;
        MobileTrans.SetRange("Transaction ID", TransactionID);
        MobileTrans.SetRange(Posted, false);
        MobileTrans.SetRange("Needs Change", false);
        MobileTrans.SetRange("Transaction Type", MobileTrans."transaction type"::"Account Transfer");
        if MobileTrans.FindFirst then begin

            if Loans.Get(MobileTrans."Account to Check") then PayLoan := true;
            AccountToCharge := MobileTrans."Member Account";
            MemberNo := '';

            RunBal := MobileTrans.Amount;
            // Get Excise duty G/L
            ExciseDutyGL := GetExciseDutyGL();
            ExciseDutyRate := GetExciseRate();
            ExciseDuty := 0;

            SaccoAccount := '';
            SaccoFee := 0;
            VendorAccount := '';
            VendorCommission := 0;


            SMSAccount := '';
            SMSCharge := 0;


            CoopSetup.Reset;
            if PayLoan then
                CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Pay Loan From Account")
            else
                CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Account Transfer");
            if CoopSetup.FindFirst then begin

                SMSAccount := CoopSetup."SMS Account";
                SMSCharge := CoopSetup."SMS Charge";


                SaccoAccount := CoopSetup."Sacco Fee Account";
                SaccoFee := CoopSetup."Sacco Fee";
                VendorAccount := CoopSetup."Vendor Commission Account";
                VendorCommission := CoopSetup."Vendor Commission";

                TotalCharge := SaccoFee + VendorCommission + SMSCharge;
                if ItsABusinesAccount then begin
                    TotalCharge := 0;
                    SaccoFee := 0;
                    VendorCommission := 0;
                    SMSCharge := 0;
                end;
                ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
            end
            else begin
                if Loans.Get(MobileTrans."Account to Check") then
                    Error('Setup Missing for %1', CoopSetup."transaction type"::"Pay Loan From Account")
                else
                    Error('Setup Missing for %1', CoopSetup."transaction type"::"Account Transfer");
            end;

            JTemplate := 'RECEIPT';
            JBatch := 'SKYWORLD';


            DocNo := MobileTrans."Transaction ID";
            PDate := MobileTrans."Transaction Date";
            AccNo := MobileTrans."Member Account";
            ExtDoc := '';
            LoanNo := '';
            TransType := Transtype::" ";
            Dim1 := SavAcc."Global Dimension 1 Code";
            Dim2 := SavAcc."Global Dimension 2 Code";
            SystCreated := true;

            SaccoTrans.InitJournal(JTemplate, JBatch);

            DrAmt := MobileTrans.Amount;

            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(MobileTrans.Description, 1, 50), Balacctype::"G/L Account",
                          '', DrAmt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


            if PayLoan then begin
                if Loans.Get(MobileTrans."Account to Check") then begin
                    Loans.CalcFields("Outstanding Balance", "Outstanding Interest");
                    IntRate := Loans.Interest / 12;

                    IntAmt := Loans."Outstanding Interest";


                    if IntAmt > 0 then begin

                        if IntAmt > RunBal then
                            IntAmt := RunBal;

                        MobileTrans."Interest Paid" := IntAmt;
                        SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, Loans."Loan Account", CopyStr(MobileTrans.Description, 1, 50), Balacctype::"G/L Account",
                                      '', -IntAmt, ExtDoc, Loans."Loan No.", Transtype::"Interest Paid", Dim1, Dim2, SystCreated);

                        RunBal -= IntAmt;

                    end;

                    if Loans."Outstanding Balance" > 0 then begin
                        PrAmt := Loans."Outstanding Balance";
                        if PrAmt > RunBal then
                            PrAmt := RunBal;


                        MobileTrans."Principal Paid" := PrAmt;
                        SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, Loans."Loan Account", CopyStr(MobileTrans.Description, 1, 50), Balacctype::"G/L Account",
                                      '', -PrAmt, ExtDoc, Loans."Loan No.", Transtype::Repayment, Dim1, Dim2, SystCreated);

                        RunBal -= PrAmt;


                        if BillProdFac.Get(Loans."Loan Product Type") then begin
                            if not BillProdFac."No Principle Bills" then begin
                                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, Loans."Loan Account", CopyStr(MobileTrans.Description, 1, 50), Balacctype::"G/L Account",
                                        BillProdFac."Billed Account", -PrAmt, ExtDoc, Loans."Loan No.", Transtype::Bills, Dim1, Dim2, SystCreated);

                            end;
                        end;





                    end;
                    Loans.Validate(Repayment);
                    //(Loans."Loan No.",FALSE);

                    if RunBal > 0 then begin

                        SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr('Excess - ' + MobileTrans.Description, 1, 50), Balacctype::"G/L Account",
                                      '', -RunBal, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    end;

                end;
            end
            else begin
                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, MobileTrans."Account to Check", CopyStr(MobileTrans.Description, 1, 50), Balacctype::"G/L Account",
                              '', -MobileTrans.Amount, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);
            end;

            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(Format(MobileTrans."Transaction Type") + ' Charge', 1, 50), Balacctype::"G/L Account",
                          '', TotalCharge + ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);
            /*
            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Transfer Charge',1,50),BalAccType::"G/L Account",
                          '',SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Notification Charge',1,50),BalAccType::"G/L Account",
                          SMSAccount,SMSCharge,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Excise Duty',1,50),BalAccType::"G/L Account",
                          ExciseDutyGL,ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
            */


            AccNo := VendorAccount;
            ExtDoc := MobileTrans."Member Account";
            LoanNo := '';
            TransType := Transtype::" ";

            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Vendor, AccNo, CopyStr(MobileTrans.Description + ' Commission', 1, 50), Balacctype::"G/L Account",
                          '', -VendorCommission, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

            AccNo := SaccoAccount;
            ExtDoc := MobileTrans."Member Account";
            LoanNo := '';
            TransType := Transtype::" ";

            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", AccNo, CopyStr(MobileTrans.Description + ' Fee', 1, 50), Balacctype::"G/L Account",
                          '', -SaccoFee, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);
            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", ExciseDutyGL, CopyStr(MobileTrans.Description + ' Excise Duty', 1, 50), Balacctype::"G/L Account",
                          '', -ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


            MobileTrans.Posted := true;
            MobileTrans."Posted By" := UserId;
            MobileTrans."Date Posted" := Today;
            MobileTrans."Time Posted" := Time;
            MobileTrans.Modify;

            SaccoTrans.PostJournal(JTemplate, JBatch);

            Priority := 232;
            if PayLoan then begin
                if Loans.Get(MobileTrans."Account to Check") then begin
                    if SavAcc.Get(MobileTrans."Member Account") then begin
                        HMember.Get(SavAcc."Member No.");
                        MemberName := HMember."First Name";
                        if MemberName = '' then MemberName := HMember."Second Name";
                        MemberNo := SavAcc."Member No.";
                        MobileNumber := SavAcc."Transactional Mobile No";
                        if MobileNumber = '' then MobileNumber := SavAcc."Mobile Phone No";
                    end;
                    Loans.CalcFields("Outstanding Balance");
                    LT := Loans."Loan Product Type Name";
                    if LoanTypes.Get(Loans."Loan Product Type") then
                        LT := LoanTypes."USSD Product Name";

                    NewLoanBal := Loans."Outstanding Balance";
                    msg := 'Dear ' + FirstName(MemberName) + ',' + NewLine + Format(MobileTrans."Transaction Type") + ' of KES ' + Format(MobileTrans.Amount) + ' has been processed successfully. Interest Paid is ' + Format(MobileTrans."Interest Paid") +
                    ', Principal Paid is ' + Format(MobileTrans."Principal Paid") + ', New ' + LT + ' Balance is ' + Format(NewLoanBal) + NewLine + 'REF: ' + MobileTrans."Transaction ID";
                end;
            end
            else begin
                if SavAcc.Get(MobileTrans."Account to Check") then begin
                    MemberName := SavAcc.Name;
                    MemberNo := SavAcc."Member No.";
                    MobileNumber := SavAcc."Transactional Mobile No";
                    if MobileNumber = '' then MobileNumber := SavAcc."Mobile Phone No";
                end;
                if SavAcc.Get(MobileTrans."Member Account") then begin
                    RecMemberNo := SavAcc."Member No.";
                    if Members.Get(SavAcc."Member No.") then
                        RecMobileNo := Members."Mobile Phone No";

                    RecMemberName := SavAcc.Name;
                end;

                if RecMemberNo <> MemberNo then begin
                    if RecMobileNo <> '' then begin
                        msg := 'Dear ' + RecMemberName + ',' + NewLine + 'You have successfully received KES ' + Format(MobileTrans.Amount) + ' from ' + SavAcc.Name + ' - ' +
                        SavAcc."Mobile Phone No" + ' on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) + '.' + NewLine + 'REF: ' + MobileTrans."Transaction ID";
                        SendSms(Source::MBANKING, RecMobileNo, msg, Format(MobileTrans."Transaction ID"), '', true, Priority, false);

                    end;

                    msg := 'Dear ' + FirstName(MemberName) + ',' + NewLine + 'You have successfully transferred KES. ' + Format(MobileTrans.Amount) +
                          ' to ' + RecMemberName + ' - ' + RecMobileNo + ' on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) + '.' + NewLine + 'REF: ' + MobileTrans."Transaction ID";
                    ;
                end
                else begin
                    msg := 'Dear ' + FirstName(MemberName) + ',' + NewLine + 'You have successfully transferred KES. ' + Format(MobileTrans.Amount) +
                          ' to A/C ' + MobileTrans."Account to Check" + ' on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) + '.' + NewLine + 'REF: ' + MobileTrans."Transaction ID";
                end;


            end;


            SendSms(Source::MBANKING, MobileNumber, msg, Format(MobileTrans."Transaction ID"), '', true, Priority, false);

            //
        end;
        /*--------------------------------------ACCOUNT TRANSFER------------------------------------*/



        /*--------------------------------------ACCOUNT MINISTATEMENT------------------------------------*/
        MobileTrans.Reset;
        MobileTrans.SetRange("Transaction ID", TransactionID);
        MobileTrans.SetRange(Posted, false);
        MobileTrans.SetRange("Needs Change", false);
        MobileTrans.SetRange("Transaction Type", MobileTrans."transaction type"::"Mini-Statement");
        if MobileTrans.FindFirst then begin

            SMSAccount := '';
            SMSCharge := 0;
            SaccoAccount := '';
            SaccoFee := 0;
            VendorAccount := '';
            VendorCommission := 0;
            TotalCharge := 0;
            ExciseDuty := 0;

            CoopSetup.Reset;
            CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Mini-Statement");
            if CoopSetup.FindFirst then begin

                SMSAccount := CoopSetup."SMS Account";
                SMSCharge := CoopSetup."SMS Charge";


                SaccoAccount := CoopSetup."Sacco Fee Account";
                SaccoFee := CoopSetup."Sacco Fee";
                VendorAccount := CoopSetup."Vendor Commission Account";
                VendorCommission := CoopSetup."Vendor Commission";

                TotalCharge := SaccoFee + VendorCommission + SMSCharge;
                ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
            end
            else begin
                Error('Setup Missing for %1', CoopSetup."Transaction Type");
            end;

            JTemplate := 'RECEIPT';
            JBatch := 'SKYWORLD';

            DocNo := MobileTrans."Transaction ID";
            PDate := MobileTrans."Transaction Date";
            AccNo := MobileTrans."Member Account";
            ExtDoc := '';
            LoanNo := '';
            TransType := Transtype::" ";
            Dim1 := SavAcc."Global Dimension 1 Code";
            Dim2 := SavAcc."Global Dimension 2 Code";
            SystCreated := true;

            SaccoTrans.InitJournal(JTemplate, JBatch);


            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(MobileTrans.Description, 1, 50), Balacctype::"G/L Account",
                          '', TotalCharge + ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

            /*
            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccountToCharge,COPYSTR('SMS Charge',1,50),BalAccType::"G/L Account",
                          SMSAccount,SMSCharge,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Sacco Fee ',1,50),BalAccType::"G/L Account",
                          '',SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Excise Duty ',1,50),BalAccType::"G/L Account",
                          ExciseDutyGL,ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
            */


            AccNo := VendorAccount;
            ExtDoc := MobileTrans."Member Account";
            LoanNo := '';
            TransType := Transtype::" ";

            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Vendor, AccNo, CopyStr(MobileTrans.Description + ' Commission', 1, 50), Balacctype::"G/L Account",
                          '', -VendorCommission, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

            AccNo := SaccoAccount;
            ExtDoc := MobileTrans."Member Account";
            LoanNo := '';
            TransType := Transtype::" ";

            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", AccNo, CopyStr(MobileTrans.Description + ' Fee', 1, 50), Balacctype::"G/L Account",
                          '', -SaccoFee, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", ExciseDutyGL, CopyStr(MobileTrans.Description + ' Excise Duty', 1, 50), Balacctype::"G/L Account",
                          '', -ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

            MobileTrans.Posted := true;
            MobileTrans."Posted By" := UserId;
            MobileTrans."Date Posted" := Today;
            MobileTrans."Time Posted" := Time;
            MobileTrans.Modify;

            SaccoTrans.PostJournal(JTemplate, JBatch);
        end;

    end;


    procedure GetAccountBalance(Account: Text[30]) AccountBal: Decimal
    var
        savAccList: Record 52185730;
        periodicActivities: Codeunit "Periodic Activities";
        AccountTypes: Record 52185690;
        MNo: Code[20];
        minBal: Decimal;
    begin
        AccountBal := 0;
        savAccList.Reset;
        savAccList.SetRange("No.", Account);
        if savAccList.Find('-') then begin

            savAccList.CalcFields("Balance (LCY)", "Uncleared Cheques", "ATM Transactions", "Lien Placed", "Authorised Over Draft", "Coop Transactions");
            if AccountTypes.Get(savAccList."Product Type") then begin
                minBal := 0;
                if AccountTypes."Product Category" = AccountTypes."product category"::" " then
                    minBal := AccountTypes."Minimum Balance";
                if AccountTypes."Loan Disbursement Account" then
                    minBal := AccountTypes."Minimum Balance";

                AccountBal := (savAccList."Balance (LCY)" + savAccList."Authorised Over Draft")
                              - minBal
                              - savAccList."Coop Transactions"
                              - savAccList."Uncleared Cheques"
                              - savAccList."Lien Placed"
                              - savAccList."ATM Transactions";

            end;
        end;
        exit(AccountBal);
    end;


    procedure AccountMiniStatement(EntryCode: Text[20]; TransactionID: Code[20]; MaxNumberRows: Integer; StatementAccount: Code[20]; MobileNo: Code[20]; Pin: Text) Response: Text
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        PhoneNo: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52185482;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[10];
        Dim2: Code[10];
        SystCreated: Boolean;
        SLedger: Record 52185732;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        TransactionDate: DateTime;
        Msg: Text;
        Stmt: Text;
        AccountToCharge: Code[20];
        MemberNo: Code[20];
        SavingsAccounts: Record 52185730;
    begin
        MobileTrans.LockTable(true);
        TransactionDate := CurrentDatetime;
        MobileNo := '+' + MobileNo;

        Response := 'ERROR';

        if not CorrectPin(MobileNo, Pin) then begin
            Response := 'INCORRECT_PIN';
            exit;
        end;


        // Get Excise duty G/L
        ExciseDutyGL := GetExciseDutyGL();
        ExciseDutyRate := GetExciseRate();
        ExciseDuty := 0;

        SaccoAccount := '';
        SaccoFee := 0;
        VendorAccount := '';
        VendorCommission := 0;

        MemberNo := '';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", MobileNo);
        if SavAcc.FindFirst then
            MemberNo := SavAcc."Member No.";


        if SavAcc.Blocked <> SavAcc.Blocked::" " then
            exit;

        AccountToCharge := '';

        SavAcc.Get(StatementAccount);


        SavAcc.Reset;
        SavAcc.SetRange("Member No.", MemberNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then
            AccountToCharge := SavAcc."No.";

        SMSAccount := '';
        SMSCharge := 0;

        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Mini-Statement");
        if CoopSetup.FindFirst then begin

            SMSAccount := CoopSetup."SMS Account";
            SMSCharge := CoopSetup."SMS Charge";


            SaccoAccount := CoopSetup."Sacco Fee Account";
            SaccoFee := CoopSetup."Sacco Fee";
            VendorAccount := CoopSetup."Vendor Commission Account";
            VendorCommission := CoopSetup."Vendor Commission";

            TotalCharge := SaccoFee + VendorCommission + SMSCharge;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
        end
        else begin
            Error('Setup Missing for %1', CoopSetup."Transaction Type");
        end;


        //PhoneNo:='+'+MobileNo;

        SavAcc.Reset;
        SavAcc.SetRange("No.", AccountToCharge);
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        if SavAcc.FindFirst then begin


            ProdFact.Get(SavAcc."Product Type");

            if (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::"Deposits Only") or
                (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::" ") then begin
                Error('The Account to Charge is not a Withdrawable Account');
            end;



            AccBal := GetAccountBalance(SavAcc."No.");
            if AccBal >= TotalCharge + ExciseDuty then begin

                //BUser.GET(USERID);

                //BUser.TESTFIELD("Cashier Journal Template");
                //BUser.TESTFIELD("Cashier Journal Batch");

                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';

                GenJournalBatch.Reset;
                GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                GenJournalBatch.SetRange(Name, JBatch);
                if not GenJournalBatch.FindFirst then begin
                    GenJournalBatch.Init;
                    GenJournalBatch."Journal Template Name" := JTemplate;
                    GenJournalBatch.Name := JBatch;
                    GenJournalBatch.Description := 'Sky World Batch';
                    GenJournalBatch.Init;
                end;


                MobileTrans.Init;
                MobileTrans."Entry No." := EntryCode;
                MobileTrans."Transaction ID" := TransactionID;
                MobileTrans."Session ID" := TransactionID;
                MobileTrans."Transaction Date" := Dt2Date(TransactionDate);
                MobileTrans."Transaction Time" := Dt2Time(TransactionDate);
                MobileTrans."Member Account" := SavAcc."No.";
                MobileTrans."Statement Max Rows" := MaxNumberRows;
                //MobileTrans."Statement Start Date":=StartDate;
                //MobileTrans."Statement End Date":=EndDate;
                MobileTrans."Account to Check" := StatementAccount;
                MobileTrans."Transaction Type" := MobileTrans."transaction type"::"Mini-Statement";
                MobileTrans.Description := Format(MobileTrans."Transaction Type");
                MobileTrans.Insert;


                //        MobileTrans.RESET;
                //        MobileTrans.SETRANGE("Transaction ID",TransactionID);
                //        MobileTrans.SETRANGE(Posted,FALSE);
                //        IF MobileTrans.FINDFIRST THEN BEGIN
                //
                //            DocNo := MobileTrans."Transaction ID";
                //            PDate := MobileTrans."Transaction Date";
                //            AccNo := MobileTrans."Member Account";
                //            ExtDoc := '';
                //            LoanNo := '';
                //            TransType := TransType::" ";
                //            Dim1 := SavAcc."Global Dimension 1 Code";
                //            Dim2 := SavAcc."Global Dimension 2 Code";
                //            SystCreated := TRUE;
                //
                //            SaccoTrans.InitJournal(JTemplate,JBatch);
                //
                //
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                //                          '',TotalCharge+ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //
                //            {
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccountToCharge,COPYSTR('SMS Charge',1,50),BalAccType::"G/L Account",
                //                          SMSAccount,SMSCharge,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Sacco Fee ',1,50),BalAccType::"G/L Account",
                //                          '',SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Excise Duty ',1,50),BalAccType::"G/L Account",
                //                          ExciseDutyGL,ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //            }
                //
                //
                //            AccNo := VendorAccount;
                //            ExtDoc := MobileTrans."Member Account";
                //            LoanNo := '';
                //            TransType := TransType::" ";
                //
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Vendor,AccNo,COPYSTR(MobileTrans.Description+' Commission',1,50),BalAccType::"G/L Account",
                //                          '',-VendorCommission,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //
                //            AccNo := SaccoAccount;
                //            ExtDoc := MobileTrans."Member Account";
                //            LoanNo := '';
                //            TransType := TransType::" ";
                //
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::"G/L Account",AccNo,COPYSTR(MobileTrans.Description+' Fee',1,50),BalAccType::"G/L Account",
                //                          '',-SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //
                //
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::"G/L Account",ExciseDutyGL,COPYSTR(MobileTrans.Description+' Excise Duty',1,50),BalAccType::"G/L Account",
                //                          '',-ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //
                //            MobileTrans.Posted:=TRUE;
                //            MobileTrans."Posted By":=USERID;
                //            MobileTrans."Date Posted":=TODAY;
                //            MobileTrans.MODIFY;
                //
                //            SaccoTrans.PostJournal(JTemplate,JBatch);
                //
                //        END
                //        ELSE BEGIN
                //            ERROR('Transaction Not Found');
                //        END;


            end
            else begin
                Response := 'INSUFFICIENT_BAL';
            end;


            if Response = 'ERROR' then begin
                MobileTrans.Reset;
                MobileTrans.SetRange("Transaction ID", TransactionID);
                //MobileTrans.SETRANGE(Posted,TRUE);
                if MobileTrans.FindFirst then begin
                    SLedger.Reset;
                    SLedger.SetCurrentkey("Entry No.");
                    SLedger.Ascending(false);
                    SLedger.SetRange("Customer No.", StatementAccount);
                    SLedger.SetRange(Reversed, false);
                    if SLedger.FindFirst then begin
                        SavingsAccounts.Get(StatementAccount);
                        ProdFact.Get(SavingsAccounts."Product Type");
                        HMember.Get(SavAcc."Member No.");
                        FName := HMember."First Name";
                        if FName = '' then
                            FName := HMember."Second Name";

                        AccBal := 0;
                        Msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + ProdFact."USSD Product Name" + ' Statement as at ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time);
                        repeat
                            LedgerCount += 1;
                            Stmt := '' + NewLine + Format(SLedger."Posting Date") + ': ' + SLedger.Description + ': ' + Format(SLedger."Amount (LCY)") + ';';

                            if StrLen(Msg + Stmt) <= 200 then begin
                                Msg += Stmt;
                            end;

                        until (SLedger.Next = 0) or (SLedger.Count = MaxNumberRows);
                        Msg += '.' + NewLine + 'REF: ' + TransactionID;
                        Priority := 221;
                        SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", Msg, StatementAccount, '', true, Priority, false);

                        Response := 'SUCCESS';
                    end;
                end;
            end;
        end
        else begin
            Response := 'INVALID_ACCOUNT';
        end;
    end;


    procedure AccountBalanceAsAt(Account: Text[30]; AsAt: Date) AccountBal: Decimal
    var
        savAccList: Record 52185730;
        periodicActivities: Codeunit "Periodic Activities";
        AccountTypes: Record 52185690;
        MNo: Code[20];
    begin


        AccountBal := 0;
        savAccList.Reset;
        savAccList.SetRange("No.", Account);
        savAccList.SetFilter("Date Filter", '..%1', AsAt);
        if savAccList.Find('-') then begin
            savAccList.CalcFields("Net Change (LCY)");
            AccountBal := savAccList."Net Change (LCY)";
        end;
        exit(AccountBal);
    end;


    procedure GetAllLoansList() Response: Text
    var
        MobileNo: Code[20];
        Loans: Record 52185729;
        LoanProduct: Record 52185690;
        SavAcc: Record 52185730;
        MemberNo: Code[20];
        MaxLoan: Decimal;
    begin
        Response := '';
        LoanProduct.Reset;
        LoanProduct.SetRange("Product Class Type", LoanProduct."product class type"::Loan);
        if LoanProduct.Find('-') then begin
            Response := '<Loans>';
            repeat
                Response += '<Product>';
                Response += '<Code>' + LoanProduct."Product ID" + '</Code>';
                Response += '<Type>' + LoanProduct."USSD Product Name" + '</Type>';
                Response += '</Product>';

            until LoanProduct.Next = 0;
            Response += '</Loans>';

        end;
    end;


    procedure GetMobileLoanList(Phone: Code[20]; Category: Code[20]) Response: Text
    var
        MobileNo: Code[20];
        Loans: Record 52185729;
        LoanProduct: Record 52185690;
        SavAcc: Record 52185730;
        MemberNo: Code[20];
        MaxLoan: Decimal;
        Cust: Record 52185700;
        MobileLoanInstallments: Record 52185466;
        Success: Boolean;
        Msg: Text;
        LoanLimit: Decimal;
        QualifiedAmt: Decimal;
        TopUp: Decimal;
        MinLoan: Decimal;
        Salary: array[3] of Decimal;
        SalDates: array[3] of Date;
        LoanProductstoBridge: Record 52186098;
        SkipLoan: Boolean;
        DepAcc: Record 52185730;
        MaxCredit: Decimal;
        SalaryThroughFosa: Boolean;
        SmallestSal: Decimal;
        CurrLoanBal: Text;
        LoanTopUP: Record 52185729;
        UserCanApply: Boolean;
    begin

        MobileNo := '+' + Phone;
        Response := '';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", MobileNo);
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        if SavAcc.FindFirst then begin
            MemberNo := SavAcc."Member No.";
            Members.Get(MemberNo);

            LoanProduct.Reset;
            LoanProduct.SetCurrentkey("Sort Order");
            LoanProduct.SetRange("Product Class Type", LoanProduct."product class type"::Loan);
            LoanProduct.SetRange(AvailableOnMobile, true);
            if Category = 'FOSA' then
                LoanProduct.SetRange(Category, LoanProduct.Category::"FOSA Loan")
            else
                if Category = 'BOSA' then
                    LoanProduct.SetRange(Category, LoanProduct.Category::"BOSA Loan");
            if LoanProduct.Find('-') then begin
                Response := '<Loans>';
                repeat
                    MaxLoan := 0;
                    MinLoan := LoanProduct."Mobile Min. Loan Amount";
                    Msg := '';
                    if LoanProduct."Product ID" = '136' then begin
                        DividendAdvanceChecks(SavAcc."Member No.", MinLoan, MaxLoan, UserCanApply, Msg);
                    end;
                    if LoanProduct.Category = LoanProduct.Category::"FOSA Loan" then begin
                        if LoanProduct."Product ID" = '126' then begin
                            MBoostaAppraisal(SavAcc."No.", Success, Msg, LoanLimit, QualifiedAmt, TopUp);//here1
                            MaxLoan := QualifiedAmt;
                        end
                        else begin
                            if LoanProduct."Salary Loans" then begin
                                SalaryMobileLoanAppraisal(SavAcc."No.", Success, Msg, LoanLimit, QualifiedAmt, TopUp, LoanProduct."Product ID", Salary, SalDates);
                                MaxLoan := QualifiedAmt;
                                //MESSAGE(FORMAT(TopUp));
                                if TopUp > 0 then begin
                                    if LoanProduct."Min. Net after Topup" > (MaxLoan - TopUp) then begin
                                        Message('Maxloan: ' + Format(MaxLoan));
                                        MaxLoan := 0;
                                        Msg := 'Net disbursed after topup should be above KES ' + Format(LoanProduct."Min. Net after Topup");
                                    end;
                                end;

                            end;
                        end;
                    end;

                    if LoanProduct.Category = LoanProduct.Category::"BOSA Loan" then begin
                        MaxLoan := LoanProduct."Mobile Max. Loan Amount";
                        MaxCredit := 0;
                        DepAcc.Reset;
                        DepAcc.SetRange("Member No.", SavAcc."Member No.");
                        DepAcc.SetRange("Product Category", DepAcc."product category"::"Deposit Contribution");
                        if DepAcc.FindFirst then begin
                            DepAcc.CalcFields("Balance (LCY)");
                            MaxCredit := DepAcc."Balance (LCY)" * LoanProduct."Ordinary Deposits Multiplier";
                            if MaxCredit <= 0 then
                                MaxCredit := DepAcc."Balance (LCY)";
                        end;
                        if MaxLoan > MaxCredit then
                            MaxLoan := MaxCredit;

                        if LoanProduct."Requires Salary Processing" then begin
                            SalaryThroughFosa := false;
                            GetSalaryEntries(SavAcc."No.", SalDates, SmallestSal, Salary, SalaryThroughFosa);
                            if not SalaryThroughFosa then begin
                                MaxLoan := 0;
                                Msg := ChannelThroughFosa;
                            end;

                        end;
                    end;



                    if MaxLoan = 0 then
                        MinLoan := 0;

                    Cust.Get(MemberNo);

                    CurrLoanBal := '';
                    if LoanProduct."Product ID" = '119' then begin
                        LoanTopUP.Reset;
                        LoanTopUP.SetRange("Member No.", MemberNo);
                        LoanTopUP.SetRange("Loan Product Type", '119');
                        LoanTopUP.SetFilter("Outstanding Balance", '>0');
                        if LoanTopUP.FindFirst then begin
                            LoanTopUP.CalcFields("Outstanding Balance", "Outstanding Interest");
                            if LoanTopUP."Outstanding Interest" < 0 then
                                LoanTopUP."Outstanding Interest" := LoanTopUP."Outstanding Interest";
                            CurrLoanBal := ' (Loan Bal: ' + Format(LoanTopUP."Outstanding Balance" + LoanTopUP."Outstanding Interest") + ')';
                        end;
                    end;

                    MaxLoan := ROUND(MaxLoan, 1000, '<');
                    MinLoan := ROUND(MinLoan, 100, '>');
                    if MaxLoan > LoanProduct."Mobile Max. Loan Amount" then
                        MaxLoan := LoanProduct."Mobile Max. Loan Amount";

                    SkipLoan := false;
                    if LoanProduct."Available To Member" <> '' then
                        if LoanProduct."Available To Member" <> MemberNo then
                            SkipLoan := true;

                    if Category = 'BOSA' then begin
                        if Cust."Employer Code" = '05' then
                            SkipLoan := true;

                        if Cust."Employer Code" = '99' then
                            SkipLoan := true;
                    end;

                    if (not SkipLoan) and ((LoanProduct."Restrict to Emp. Code" = '') or (LoanProduct."Restrict to Emp. Code" = Cust."Employer Code")) then begin
                        Response += '<Product>';
                        Response += '<Code>' + LoanProduct."Product ID" + '</Code>';
                        Response += '<Type>' + LoanProduct."USSD Product Name" + CurrLoanBal + '</Type>';

                        if MaxLoan > 0 then
                            Response += '<UserCanApply>' + 'TRUE' + '</UserCanApply>'
                        else begin
                            // IF Msg = ChannelThroughFosa THEN
                            Response += '<UserCanApply>' + 'FALSE' + '</UserCanApply>'
                            //  ELSE
                            //   Response += '<UserCanApply>'+'TRUE'+'</UserCanApply>'

                        end;


                        Response += '<Message>' + Msg + '</Message>';

                        if LoanProduct.Category = LoanProduct.Category::"BOSA Loan" then
                            Response += '<Source>' + 'BOSA' + '</Source>'
                        else
                            if LoanProduct.Category = LoanProduct.Category::"FOSA Loan" then
                                Response += '<Source>' + 'FOSA' + '</Source>';

                        /*
                        LoanProductstoBridge.RESET;
                        LoanProductstoBridge.SETRANGE("Product Code",LoanProduct."Product ID");
                        IF LoanProductstoBridge.FINDFIRST THEN BEGIN
                            REPEAT

                                Response += '<LoansToTopUp>';
                                    Response += '<PID>'+LoanProductstoBridge."Product To Bridge"+'</PID>';
                                    Response += '<PName>'+LoanProductstoBridge."Product Name"+'</PName>';
                                Response += '</LoansToTopUp>';
                            UNTIL LoanProductstoBridge.NEXT=0;
                        END;

                        IF TopUp>0 THEN BEGIN

                            Response += '<TopUp>'+FORMAT(TopUp)+'</TopUp>';
                            Response += '<NetAfterTopUp>'+FORMAT(QualifiedAmt)+'</NetAfterTopUp>';
                        END;
                        */


                        if LoanProduct."Mobile Loan Req. Guar." then
                            Response += '<RequiresGuarantors>' + 'TRUE' + '</RequiresGuarantors>'
                        else
                            Response += '<RequiresGuarantors>' + 'FALSE' + '</RequiresGuarantors>';


                        if LoanProduct."Requires Purpose" then
                            Response += '<RequiresPurpose>' + 'TRUE' + '</RequiresPurpose>'
                        else
                            Response += '<RequiresPurpose>' + 'FALSE' + '</RequiresPurpose>';


                        if LoanProduct."Requires Branch" then
                            Response += '<RequiresBranch>' + 'TRUE' + '</RequiresBranch>'
                        else
                            Response += '<RequiresBranch>' + 'FALSE' + '</RequiresBranch>';

                        if LoanProduct."Mobile Loan Req. Guar." then
                            Response += '<RequiresGuarantors>' + 'TRUE' + '</RequiresGuarantors>'
                        else
                            Response += '<RequiresGuarantors>' + 'FALSE' + '</RequiresGuarantors>';

                        if LoanProduct."Mobile Installments Type" = LoanProduct."mobile installments type"::None then
                            Response += '<InstallmentsType>' + 'NONE' + '</InstallmentsType>'
                        else
                            if LoanProduct."Mobile Installments Type" = LoanProduct."mobile installments type"::Input then
                                Response += '<InstallmentsType>' + 'INPUT' + '</InstallmentsType>'
                            else
                                Response += '<InstallmentsType>' + 'PRESET' + '</InstallmentsType>';



                        if LoanProduct."Mobile Installments Type" = LoanProduct."mobile installments type"::None then begin
                            Response += '<InputInstallments>';
                            Response += '<Minimum>' + Format(LoanProduct."Ordinary Default Intallments") + '</Minimum>';
                            Response += '<Maximum>' + Format(LoanProduct."Ordinary Default Intallments") + '</Maximum>';
                            Response += '</InputInstallments>';
                        end;

                        if LoanProduct."Mobile Installments Type" = LoanProduct."mobile installments type"::Input then begin
                            Response += '<InputInstallments>';
                            Response += '<Minimum>' + Format(LoanProduct."Min. Mobile Installments") + '</Minimum>';
                            Response += '<Maximum>' + Format(LoanProduct."Max. Mobile Installments") + '</Maximum>';
                            Response += '</InputInstallments>';
                        end;

                        if LoanProduct."Mobile Installments Type" = LoanProduct."mobile installments type"::Preset then begin

                            MobileLoanInstallments.Reset;
                            MobileLoanInstallments.SetRange(Product, LoanProduct."Product ID");
                            if MobileLoanInstallments.FindFirst then begin
                                Response += '<PresetInstallments>';
                                repeat

                                    Response += '<Installment Id="' + Format(MobileLoanInstallments.Installments) + '" Label="' + MobileLoanInstallments.Caption + '">';

                                    Response += '<Qualification>';
                                    Response += '<Minimum>' + Format(MinLoan) + '</Minimum>';
                                    if LoanProduct.Category = LoanProduct.Category::"BOSA Loan" then
                                        Response += '<Maximum>' + Format(MaxLoan) + '</Maximum>'
                                    else
                                        Response += '<Maximum>' + Format(MaxLoan) + '</Maximum>';
                                    Response += '</Qualification>';

                                    Response += '</Installment>';

                                until MobileLoanInstallments.Next = 0;
                                Response += '</PresetInstallments>';
                            end;

                        end;
                        Response += '<NumberOfGuarantors>';
                        Response += '<Minimum>' + Format(LoanProduct."Mobile Min. Guarantors") + '</Minimum>';
                        Response += '<Maximum>' + Format(LoanProduct."Mobile Max. Guarantors") + '</Maximum>';
                        Response += '</NumberOfGuarantors>';

                        Response += '<InterestRate>' + Format(LoanProduct."Interest Rate (Max.)") + '%</InterestRate>';

                        Response += '<DefaultQualification>';
                        Response += '<Minimum>' + Format(MinLoan) + '</Minimum>';
                        Response += '<Maximum>' + Format(MaxLoan) + '</Maximum>';
                        Response += '</DefaultQualification>';

                        if LoanProduct."Requires TnC" then
                            Response += '<RequiresTnC>' + 'TRUE' + '</RequiresTnC>'
                        else
                            Response += '<RequiresTnC>' + 'FALSE' + '</RequiresTnC>';

                        if LoanProduct."Shows Mobile Qualification" then
                            Response += '<ShowsQualification>' + 'TRUE' + '</ShowsQualification>'
                        else
                            Response += '<ShowsQualification>' + 'FALSE' + '</ShowsQualification>';

                        if LoanProduct."Requires Payslip PIN" then
                            Response += '<RequiresPayslipPIN>' + 'TRUE' + '</RequiresPayslipPIN>'
                        else
                            Response += '<RequiresPayslipPIN>' + 'FALSE' + '</RequiresPayslipPIN>';



                        Response += '</Product>';
                    end;

                until LoanProduct.Next = 0;
                Response += '</Loans>';

            end;

        end;

    end;


    procedure ApplyLoan(EntryCode: Text[20]; TransactionID: Code[20]; Phone: Code[20]; LoanType: Code[20]; LoanAmount: Decimal; PIN: Text; LoanPeriod: Integer; LoanPurpose: Code[10]; Password: Text; Branch: Text) Response: Text
    var
        MobileNo: Code[20];
        Loans: Record 52185729;
        LoanProduct: Record 52185690;
        SavAcc: Record 52185730;
        MemberNo: Code[20];
        MaxLoan: Decimal;
        CreditAccount: Record 52185731;
        LoanAccountNo: Code[20];
        CreateLoanAccount: Codeunit "Loans Process";
        MobileLoans: Record 52185483;
        Members: Record 52185700;
        msg: Text;
        QualifiedAmount: Decimal;
        SavingsLedgerEntry: Record 52185732;
        InstallmentsTracker: Record 52186223;
    begin

        InstallmentsTracker.Init;
        InstallmentsTracker.Code := CreateGuid;
        InstallmentsTracker."Product Code" := LoanType;
        InstallmentsTracker.Date := Today;
        InstallmentsTracker.Time := Time;
        InstallmentsTracker."Phone Number" := Phone;
        InstallmentsTracker.Intallments := LoanPeriod;
        InstallmentsTracker.Insert;

        MobileNo := '+' + Phone;

        Response := 'ERROR';

        if LoanType = '' then
            exit;

        if not CorrectPin(MobileNo, PIN) then begin
            Response := 'INCORRECT_PIN';
            exit;
        end;


        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", MobileNo);
        SavAcc.SetRange("Product Type", '505');
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        if SavAcc.FindFirst then begin

            MemberNo := SavAcc."Member No.";

            LoanProduct.Reset;
            LoanProduct.SetRange("Product ID", LoanType);
            LoanProduct.SetRange(AvailableOnMobile, true);
            if LoanProduct.Find('-') then begin

                MobileLoans.Reset;
                MobileLoans.SetRange("Account No", SavAcc."No.");
                MobileLoans.SetFilter(Status, '<>%1&<>%2', MobileLoans.Status::Failed, MobileLoans.Status::Successful);
                MobileLoans.SetRange("Loan Product Type", LoanProduct."Product ID");
                if MobileLoans.FindFirst then begin
                    Response := 'LOAN_APPLICATION_EXISTS';
                end
                else begin

                    MobileLoans.Init;
                    MobileLoans."Entry No" := 0;
                    MobileLoans."Account No" := SavAcc."No.";
                    MobileLoans."Account Name" := SavAcc.Name;
                    MobileLoans."Member No." := SavAcc."Member No.";
                    MobileLoans.Date := CurrentDatetime;
                    MobileLoans."Requested Amount" := LoanAmount;
                    MobileLoans.Status := MobileLoans.Status::Pending;
                    MobileLoans."Loan Product Type" := LoanProduct."Product ID";
                    MobileLoans."Loan Name" := LoanProduct."USSD Product Name";
                    if MobileLoans."Loan Name" = '' then
                        MobileLoans."Loan Name" := LoanProduct."Product Description";
                    MobileLoans.Amount := LoanAmount;
                    if LoanPeriod = 0 then
                        LoanPeriod := LoanProduct."Ordinary Default Intallments";
                    MobileLoans."Entry Code" := EntryCode;
                    MobileLoans."Session ID" := TransactionID;
                    MobileLoans."Date Entered" := Today;
                    MobileLoans."Time Entered" := Time;
                    MobileLoans."Telephone No" := SavAcc."Transactional Mobile No";
                    MobileLoans."Loan Period" := LoanPeriod;
                    MobileLoans.Password := Password;
                    MobileLoans."Loan Purpose" := LoanPurpose;
                    MobileLoans.Branch := Branch;
                    MobileLoans."Salary Loan" := LoanProduct."Salary Loans";
                    if LoanProduct.Category = LoanProduct.Category::"BOSA Loan" then
                        MobileLoans.Source := 'BOSA';
                    if LoanProduct.Category = LoanProduct.Category::"FOSA Loan" then
                        MobileLoans.Source := 'FOSA';



                    MobileLoans."Needs Guarantors" := LoanProduct."Mobile Loan Req. Guar.";
                    if MobileLoans."Needs Guarantors" then begin
                        LoanProduct.TestField("Mobile Min. Guarantors");
                        MobileLoans.Status := MobileLoans.Status::"Pending Guarantors";
                        MobileLoans."Expected Guarantors" := GetNumberOfGuarantors(LoanProduct."Product ID", LoanAmount);


                    end;

                    //MobileLoans."Micro Loan" := LoanProduct."Micro Loan";

                    /*
                    MicroLoanPurpose.RESET;
                    MicroLoanPurpose.SETRANGE("Loan Type",LoanProduct."Product ID");
                    MicroLoanPurpose.SETRANGE("Mobile Based",TRUE);
                    IF MicroLoanPurpose.FINDFIRST THEN BEGIN
                        IF Members.GET(MemberNo) THEN BEGIN
                            IF MicroLoanPurpose."Guarantors Mandatory For" = MicroLoanPurpose."Guarantors Mandatory For"::"Non-Members" THEN
                                IF (Members."Non-Member") AND (NOT Members."Group Account") THEN
                                    MobileLoans."Needs Guarantors" := TRUE;
        
                            IF MicroLoanPurpose."Guarantors Mandatory For" = MicroLoanPurpose."Guarantors Mandatory For"::Groups THEN
                                IF Members."Group Account" THEN
                                    MobileLoans."Needs Guarantors" := TRUE;
        
                            IF MicroLoanPurpose."Guarantors Mandatory For" = MicroLoanPurpose."Guarantors Mandatory For"::"Members & Non-Members" THEN
                                IF NOT Members."Group Account" THEN
                                    MobileLoans."Needs Guarantors" := TRUE;
                            IF MicroLoanPurpose."Guarantors Mandatory For" = MicroLoanPurpose."Guarantors Mandatory For"::Members THEN
                                IF (NOT Members."Non-Member") AND (NOT Members."Group Account") THEN
                                    MobileLoans."Needs Guarantors" := TRUE;
        
                            IF MobileLoans."Needs Guarantors" THEN
                                MobileLoans.Status := MobileLoans.Status::"Pending Guarantors";
        
                        END;
                    END;
                    */

                    MobileLoans.Insert;
                    if LoanProduct."Mobile Loan Req. Guar." then begin

                        msg := GetSMSSalutation(MobileLoans."Member No.") +
                              NewLine + 'To add guarantors to your ' + MobileLoans."Loan Name" + ' request of KES ' + Format(MobileLoans.Amount) + ', Please dial ' + UssdCode + ' or use our Mobile App.' +
                              NewLine + 'Login > Loans > Add / Remove Guarantors. ' +
                              NewLine + 'REF: ' + MobileLoans."Entry Code";
                        SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoans."Entry Code"), '', true, Priority, false);

                        msg := 'Minimum required guarantors is ' + Format(MobileLoans."Expected Guarantors") + '. In the event their total deposits won''t be sufficient, you''ll'
                        + ' be required to add one or more.' + NewLine + 'REF: ' + MobileLoans."Entry Code";
                        SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoans."Entry Code"), '', true, Priority, false);
                    end;

                    Response := 'SUCCESS:::' + Format(MobileLoans."Entry No");

                    //ProcessMobileLoan(MobileLoans."Entry No");
                end;
            end
            else begin
                Error('Loan product not found');
            end;
        end
        else begin
            Error('Member account not found');
        end;

    end;


    procedure ProcessMobileLoan(EntryNo: Integer)
    var
        MobileNo: Code[20];
        Loans: Record 52185729;
        LoanProduct: Record 52185690;
        SavAcc: Record 52185730;
        MemberNo: Code[20];
        MaxLoan: Decimal;
        LoanAccountNo: Code[20];
        CreateLoanAccount: Codeunit "Loans Process";
        CreditAccount: Record 52185731;
        LoanType: Code[20];
        LoanAmount: Decimal;
        MobileLoan: Record 52185483;
        Continue: Boolean;
        msg: Text;
        Product: Record 52185690;
        nDays: Integer;
        SavingsAccounts: Record 52185730;
        ShareCap: Decimal;
        Members: Record 52185700;
        LoanNo: Code[20];
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        TransactionType: Option " ","Mpesa Withdrawal","Mpesa Deposit","Utility Payment","Loan Repayment","Balance Enquiry","Mini-Statement","Loan Disbursement";
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        UpfrontInterest: Decimal;
        PCharges: Record 52185734;
        Amt: Decimal;
        TariffDetails: Record 52185777;
        LoanRec: Record 52185829;
        LoanLimit: Decimal;
        QualifiedAmt: Decimal;
        TopUp: Decimal;
        LoanTopUp: Record 52185729;
        RunBal: Decimal;
        Salary: array[3] of Decimal;
        SalDates: array[3] of Date;
        Salute: Text;
        IntDue: Decimal;
        TopUpAmt: Decimal;
        SavingsLedgerEntry: Record 52185732;
        TransactionCharges: Record 52185774;
        MembNoSeries: Record 52185688;
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        LoansNo: Code[20];
        BillAmount: Decimal;
        SameProduct: Record 52185729;
        PreviousLoanAmount: Decimal;
        InterestableAmount: Decimal;
        PrePostingCharges: Decimal;
        NetTakeHome: Decimal;
        LoansTopup: Record 52185742;
        LoansProcess: Codeunit "Loans Process";
        OutstandingInterest: Decimal;
        TotalLoanBal: Decimal;
        TotalTopUpCharges: Decimal;
        LoanBalance: Decimal;
        UserSetup: Record "User Setup";
    begin

        MobileLoan.Reset;
        MobileLoan.SetRange("Entry No", EntryNo);
        MobileLoan.SetRange(Status, MobileLoan.Status::"Pending Guarantors");
        MobileLoan.SetRange(Posted, false);
        if MobileLoan.FindFirst then begin

            if GetRemainingGuarantorCount(EntryNo) <= 0 then begin
                UpdateAmountGuaranteed(EntryNo);

                if MobileGuarantorsAccepted(EntryNo) = true then begin
                    MobileLoan.Status := MobileLoan.Status::Pending;

                    if MobileLoan.Source = 'BOSA' then begin
                        MobileLoan.Status := MobileLoan.Status::Appraisal;
                        CreateLoanRegister(MobileLoan);
                    end;
                    MobileLoan.Modify;
                end;

            end;
        end;


        MobileLoan.Reset;
        MobileLoan.SetRange("Entry No", EntryNo);
        MobileLoan.SetRange("Loan No.", '');
        MobileLoan.SetRange(Source, 'BOSA');
        MobileLoan.SetRange(Status, MobileLoan.Status::Pending);
        MobileLoan.SetRange(Posted, false);
        if MobileLoan.FindFirst then begin
            MobileLoan.Status := MobileLoan.Status::Appraisal;
            CreateLoanRegister(MobileLoan);
        end;



        MobileLoan.Reset;
        MobileLoan.SetRange("Entry No", EntryNo);
        MobileLoan.SetRange("Loan No.", '');
        MobileLoan.SetRange(Source, 'BOSA');
        MobileLoan.SetRange(Status, MobileLoan.Status::Appraisal);
        MobileLoan.SetRange(Posted, false);
        if MobileLoan.FindFirst then begin
            CreateLoanRegister(MobileLoan);
        end;



        MobileLoan.Reset;
        MobileLoan.SetRange("Entry No", EntryNo);
        MobileLoan.SetRange(Source, 'FOSA');
        MobileLoan.SetRange(Status, MobileLoan.Status::Pending);
        MobileLoan.SetRange(Posted, false);
        if MobileLoan.FindFirst then begin
            Priority := 231;
            LoanProduct.Get(MobileLoan."Loan Product Type");
            if MobileLoan."Loan Period" = 0 then
                MobileLoan."Loan Period" := LoanProduct."Ordinary Default Intallments";


            SavAcc.Reset;
            SavAcc.SetRange("No.", MobileLoan."Account No");
            SavAcc.SetRange("Loan Disbursement Account", true);
            if SavAcc.FindFirst then begin

                MemberNo := SavAcc."Member No.";
                Continue := true;

                Members.Get(MemberNo);

                QualifiedAmt := 0;

                if Continue then begin
                    if LoanProduct."Product ID" = '126' then begin
                        MBoostaAppraisal(MobileLoan."Account No", Continue, msg, LoanLimit, QualifiedAmt, TopUp);
                        if not Continue then begin
                            MobileLoan.Remarks := msg;

                            HMember.Get(MobileLoan."Member No.");
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";
                            Salute := 'Dear ' + FirstName(FName) + ',' + NewLine;

                            msg := Salute + 'Your ' + LoanProduct."USSD Product Name" + ' request has failed, ' + msg;
                            MobileLoan.Status := MobileLoan.Status::Failed;
                            MobileLoan.Posted := true;
                            MobileLoan."Date Posted" := CurrentDatetime;//TODAY;
                            MobileLoan."Message Text" := msg;
                            SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);
                            MobileLoan.Modify;
                            Continue := false;
                        end;

                    end
                    else
                        if LoanProduct."Product ID" = '136' then begin
                            QualifiedAmt := GetDividendLoanQualifiedAmount(SavAcc."No.", '136');
                        end
                        else begin
                            if MobileLoan."Salary Loan" then begin
                                SalaryMobileLoanAppraisal(MobileLoan."Account No", Continue, msg, LoanLimit, QualifiedAmt, TopUp, MobileLoan."Loan Product Type", Salary, SalDates);
                                if not Continue then begin
                                    MobileLoan.Remarks := msg;

                                    HMember.Get(MobileLoan."Member No.");
                                    FName := HMember."First Name";
                                    if FName = '' then
                                        FName := HMember."Second Name";
                                    Salute := 'Dear ' + FirstName(FName) + ',' + NewLine;

                                    msg := Salute + 'Your ' + LoanProduct."USSD Product Name" + ' request has failed, ' + msg;
                                    MobileLoan.Status := MobileLoan.Status::Failed;
                                    MobileLoan.Posted := true;
                                    MobileLoan."Date Posted" := CurrentDatetime;//TODAY;
                                    MobileLoan."Message Text" := msg;
                                    SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);
                                    MobileLoan.Modify;
                                    Continue := false;
                                end;
                            end;
                        end;
                end;

                if LoanProduct."Product ID" = '136' then begin
                    //Check qualified amount
                    if Continue then begin
                        if MobileLoan."Requested Amount" > QualifiedAmt then begin
                            HMember.Get(MobileLoan."Member No.");
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";
                            Salute := 'Dear ' + FirstName(FName) + ',' + NewLine;

                            msg := Salute + 'You do not qualify for this type of loan: ' + LoanProduct."USSD Product Name" + ' ' + msg;
                            MobileLoan.Status := MobileLoan.Status::Failed;
                            MobileLoan.Posted := true;
                            MobileLoan."Date Posted" := CurrentDatetime;//TODAY;
                            MobileLoan.Remarks := 'Applied Amount Ksh ' + Format(MobileLoan."Requested Amount") + ' is greater than qualified amount Ksh ' + Format(QualifiedAmt);
                            SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);
                            MobileLoan.Modify;
                            Continue := false;
                        end;
                    end;

                    //Dividend action field pay check
                    if Continue then begin
                        HMember.Get(MobileLoan."Member No.");
                        if HMember."Dividend Action" <> HMember."dividend action"::Pay then begin
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";
                            Salute := 'Dear ' + FirstName(FName) + ',' + NewLine;

                            msg := Salute + 'You do not qualify for this type of loan: ' + LoanProduct."USSD Product Name" + ' ' + msg;
                            MobileLoan.Status := MobileLoan.Status::Failed;
                            MobileLoan.Posted := true;
                            MobileLoan."Date Posted" := CurrentDatetime;//TODAY;
                            MobileLoan.Remarks := 'Dividend action must be equal to pay in member single list';
                            SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);
                            MobileLoan.Modify;
                            Continue := false;
                        end;
                    end;

                    //Active member check
                    if Continue then begin
                        HMember.Get(MobileLoan."Member No.");
                        if HMember.Status <> HMember.Status::Active then begin
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";
                            Salute := 'Dear ' + FirstName(FName) + ',' + NewLine;

                            msg := Salute + 'Your member status must be active ' + msg;
                            MobileLoan.Status := MobileLoan.Status::Failed;
                            MobileLoan.Posted := true;
                            MobileLoan."Date Posted" := CurrentDatetime;//TODAY;
                            MobileLoan.Remarks := 'Member status not active';
                            SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);
                            MobileLoan.Modify;
                            Continue := false;
                        end;
                    end;


                end;

                if Continue then begin
                    if TopUp > 0 then begin
                        if LoanProduct."Min. Net after Topup" >= (MobileLoan."Requested Amount" - TopUp) then begin

                            HMember.Get(MobileLoan."Member No.");
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";
                            Salute := 'Dear ' + FirstName(FName) + ',' + NewLine;

                            msg := Salute + 'Your ' + LoanProduct."USSD Product Name" + ' request has failed, Net disbursed after topup should be above KES ' + Format(LoanProduct."Min. Net after Topup");
                            MobileLoan.Remarks := 'Net disbursed after topup should be above KES ' + Format(LoanProduct."Min. Net after Topup");
                            MobileLoan.Status := MobileLoan.Status::Failed;
                            MobileLoan.Posted := true;
                            MobileLoan."Date Posted" := CurrentDatetime;//TODAY;
                            MobileLoan."Message Text" := msg;
                            SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);
                            MobileLoan.Modify;
                            Continue := false;
                        end;
                    end;
                end;


                if Continue then begin
                    if LoanProduct."Product ID" <> '136' then begin
                        if (SavAcc.Status <> SavAcc.Status::Active) and (SavAcc.Status <> SavAcc.Status::New) and (SavAcc.Status <> SavAcc.Status::Dormant) then begin

                            HMember.Get(MobileLoan."Member No.");
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";
                            Salute := 'Dear ' + FirstName(FName) + ',' + NewLine;

                            msg := Salute + 'Your ' + LoanProduct."USSD Product Name" + ' request has failed, Your account is not Active.';
                            MobileLoan.Remarks := 'Account is not Active';
                            MobileLoan.Status := MobileLoan.Status::Failed;
                            MobileLoan.Posted := true;
                            MobileLoan."Date Posted" := CurrentDatetime;//TODAY;
                            MobileLoan."Message Text" := msg;
                            SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);
                            MobileLoan.Modify;
                            Continue := false;
                        end;
                    end;
                end;


                /*
                //Check Share Capital
                IF Continue THEN BEGIN
                    //IF NOT Members."Non-Member" THEN BEGIN
        
        ERROR('T');        ShareCap:=0;
                        SavingsAccounts.RESET;
                        SavingsAccounts.SETRANGE(SavingsAccounts."Member No.",MemberNo);
                        SavingsAccounts.SETRANGE("Product Category",SavingsAccounts."Product Category"::"Share Capital"); // share capital account
                        IF SavingsAccounts.FIND ('-') THEN BEGIN
                            SavingsAccounts.CALCFIELDS("Balance (LCY)");
                            ShareCap := SavingsAccounts."Balance (LCY)";
                        END;
        
                        IF (ShareCap <= 0) THEN BEGIN
                            msg:='Your '+LoanProduct."USSD Product Name"+' request was rejected, current share capital should be more than 0';
                            MobileLoan.Remarks:='Share capital should be more than 0';// ::' + FORMAT(membersShares);
                            MobileLoan.Status:=MobileLoan.Status::Failed;
                            MobileLoan.Posted:=TRUE;
                            MobileLoan."Date Posted":=CURRENTDATETIME;//TODAY;
                            MobileLoan.Message:=msg;
                            SendSms(Source::MBANKING,SavAcc."Transactional Mobile No",msg,FORMAT(MobileLoan."Entry No"),'',TRUE,Priority,FALSE);
                            MobileLoan.MODIFY;
                            Continue:=FALSE;
                        END;
                    //END;
                END;
                */



                //Check Defaulter
                if Continue then begin
                    Loans.Reset;
                    Loans.SetRange("Member No.", MemberNo);
                    Loans.SetFilter("Loans Category-SASRA", '%1|%2|%3|%4', Loans."loans category-sasra"::Watch, Loans."loans category-sasra"::Substandard,
                    Loans."loans category-sasra"::Doubtful, Loans."loans category-sasra"::Loss);
                    Loans.SetFilter("Outstanding Balance", '>0');
                    if Loans.FindFirst then begin
                        repeat
                            if LoanProduct."Product ID" <> '136' then begin
                                Product.Get(Loans."Loan Product Type");

                                HMember.Get(MobileLoan."Member No.");
                                FName := HMember."First Name";
                                if FName = '' then
                                    FName := HMember."Second Name";
                                Salute := 'Dear ' + FirstName(FName) + ',' + NewLine;

                                msg := Salute + 'Your ' + LoanProduct."USSD Product Name" + ' request has failed, You have defaulted ' + Product."Product Description";
                                MobileLoan.Remarks := 'Member has defaulted Loan No. ' + Loans."Loan No." + ' - ' + Product."Product Description";
                                MobileLoan.Status := MobileLoan.Status::Failed;
                                MobileLoan.Posted := true;
                                MobileLoan."Date Posted" := CurrentDatetime;//TODAY;
                                MobileLoan."Message Text" := msg;
                                SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);
                                MobileLoan.Modify;
                                Continue := false;
                            end else begin
                                Loans.CalcFields("Outstanding Balance", "Outstanding Interest");
                                OutstandingInterest := Loans."Outstanding Interest";
                                if OutstandingInterest <= 0 then OutstandingInterest := 0;
                                TotalLoanBal += Loans."Outstanding Balance" + OutstandingInterest;
                                LoanBalance := Loans."Outstanding Balance" + OutstandingInterest;
                                TotalTopUpCharges += GetTopUpCharges(Loans."Loan Product Type", LoanBalance);
                            end;
                        until (Continue = false) or (Loans.Next = 0);
                    end;
                end;


                if LoanProduct."Product ID" = '136' then begin
                    UpfrontInterest := ROUND(MobileLoan.Amount * LoanProduct."Interest Rate (Max.)" / 100, 1, '>');
                    if Continue then begin
                        if (TotalLoanBal + TotalTopUpCharges + LoanProduct."Min. Net after Topup" + UpfrontInterest) > MobileLoan."Requested Amount" then begin
                            HMember.Get(MobileLoan."Member No.");
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";
                            Salute := 'Dear ' + FirstName(FName) + ',' + NewLine;

                            msg := Salute + 'Your ' + LoanProduct."USSD Product Name" + ' request has failed, Net disbursed after topup should be above KES ' + Format(LoanProduct."Min. Net after Topup");
                            MobileLoan.Remarks := 'Net disbursed after topup should be above KES ' + Format(LoanProduct."Min. Net after Topup");
                            MobileLoan.Status := MobileLoan.Status::Failed;
                            MobileLoan.Posted := true;
                            MobileLoan."Date Posted" := CurrentDatetime;//TODAY;
                            MobileLoan."Message Text" := msg;
                            SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);
                            MobileLoan.Modify;
                            Continue := false;
                        end;
                    end;
                end;


                /*-------------------START: Net take hoem for topups and upfronted interests---------------------*/
                if LoanProduct."Product ID" <> '136' then begin
                    if Continue then begin
                        NetTakeHome := CalculateNetTakeHome(MobileLoan."Entry No");
                        if NetTakeHome < 1000 then begin
                            HMember.Get(MobileLoan."Member No.");
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";
                            Salute := 'Dear ' + FirstName(FName) + ',' + NewLine;

                            msg := Salute + 'Your ' + LoanProduct."USSD Product Name" + ' request has failed, Your net take home is less than KES 1000/';
                            MobileLoan.Remarks := 'Net take home is less than KES 1000';
                            MobileLoan.Status := MobileLoan.Status::Failed;
                            MobileLoan.Posted := true;
                            MobileLoan."Date Posted" := CurrentDatetime;//TODAY;
                            MobileLoan."Message Text" := msg;
                            SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);
                            MobileLoan.Modify;
                            Continue := false;
                        end;
                    end;
                end;
                /*-------------------END  : Net take hoem for topups and upfronted interests---------------------*/

                if Continue then begin
                    LoanProduct.Reset;
                    LoanProduct.SetRange("Product ID", MobileLoan."Loan Product Type");
                    LoanProduct.SetRange(AvailableOnMobile, true);
                    if LoanProduct.Find('-') then begin
                        MaxLoan := QualifiedAmt;

                        if Continue then begin
                            if MobileLoan."Requested Amount" > MaxLoan then begin

                                HMember.Get(MobileLoan."Member No.");
                                FName := HMember."First Name";
                                if FName = '' then
                                    FName := HMember."Second Name";
                                Salute := 'Dear ' + FirstName(FName) + ',' + NewLine;

                                msg := Salute + 'Your ' + LoanProduct."USSD Product Name" + ' request has failed, your eligibility is KES ' + Format(MaxLoan);
                                MobileLoan.Remarks := 'Member eligibility is ' + Format(MaxLoan);
                                MobileLoan.Status := MobileLoan.Status::Failed;
                                MobileLoan.Posted := true;
                                MobileLoan."Date Posted" := CurrentDatetime;//TODAY;
                                MobileLoan."Message Text" := msg;
                                SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);
                                MobileLoan.Modify;
                                Continue := false;
                            end;
                        end;


                        //ERROR('T4 %1',Continue);


                        if Continue then begin


                            JTemplate := 'RECEIPT';
                            JBatch := 'SKYWORLD';

                            GenJournalBatch.Reset;
                            GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                            GenJournalBatch.SetRange(Name, JBatch);
                            if not GenJournalBatch.FindFirst then begin
                                GenJournalBatch.Init;
                                GenJournalBatch."Journal Template Name" := JTemplate;
                                GenJournalBatch.Name := JBatch;
                                GenJournalBatch.Description := 'Sky World Batch';
                                GenJournalBatch.Init;
                            end;


                            SaccoTrans.InitJournal(JTemplate, JBatch);



                            // Get Excise duty G/L
                            ExciseDutyGL := GetExciseDutyGL();
                            ExciseDutyRate := GetExciseRate();
                            ExciseDuty := 0;

                            SaccoAccount := '';
                            SaccoFee := 0;
                            VendorAccount := '';
                            VendorCommission := 0;

                            SMSAccount := '';
                            SMSCharge := 0;

                            CoopSetup.Reset;
                            CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Loan Disbursement");
                            if CoopSetup.FindFirst then begin

                                SMSAccount := CoopSetup."SMS Account";
                                SMSCharge := CoopSetup."SMS Charge";


                                SaccoAccount := CoopSetup."Sacco Fee Account";
                                SaccoFee := CoopSetup."Sacco Fee";
                                VendorAccount := CoopSetup."Vendor Commission Account";
                                VendorCommission := CoopSetup."Vendor Commission";

                                TotalCharge := SaccoFee + VendorCommission + SMSCharge;
                                ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
                            end
                            else begin
                                Error('Setup Missing for %1', CoopSetup."transaction type"::"Loan Disbursement");
                            end;




                            CreditAccount.Reset;
                            CreditAccount.SetRange("Member No.", MemberNo);
                            CreditAccount.SetRange("Product Type", LoanProduct."Product ID");
                            if CreditAccount.Find('-') then begin
                                LoanAccountNo := CreditAccount."No.";
                                if CreditAccount.Blocked <> CreditAccount.Blocked::" " then begin

                                    MobileLoan.Remarks := 'Credit Account Blocked';
                                    MobileLoan.Blocked := true;
                                    MobileLoan."Date Posted" := CurrentDatetime;//TODAY;
                                    MobileLoan."Message Text" := msg;
                                    MobileLoan.Modify;
                                    exit;
                                end;

                            end else begin
                                // if loan account does not exist then create the account
                                LoanAccountNo := CreateMobileLoanAccount(MemberNo, LoanProduct."Product ID");
                            end;


                            begin
                                //create loan
                                if LoanProduct."Product ID" = '136' then begin
                                    MembNoSeries.Get;
                                    MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                                    // NoSeriesMgt.InitSeries(LoanProduct."Loan Nos", Loans."No. Series", 0D, LoansNo, Loans."No. Series");
                                end;

                                Dim2 := MobileLoan.Branch;

                                UserSetup.Reset;
                                UserSetup.SetRange("User ID", UserId);
                                if UserSetup.FindFirst then begin
                                    if Dim2 = '' then
                                        Dim2 := UserSetup."Global Dimension 2 Code";
                                    Dim1 := UserSetup."Global Dimension 1 Code";
                                end;

                                Loans.Init;
                                Loans."Mobile Loan" := true;
                                Loans."Picked Mobile Loan" := true;
                                Loans."Loan No." := LoansNo;
                                //Loans."Loan No."  :='ML' + FORMAT(MobileLoan."Entry No");
                                Loans."Application Date" := MobileLoan."Date Entered";
                                Loans."Loan Product Type" := LoanProduct."Product ID";
                                Loans."Loan Product Type Name" := LoanProduct."Product Description";
                                Loans."Loan Account" := LoanAccountNo;
                                Loans."Staff No" := Members."Payroll/Staff No.";
                                Loans."Member No." := Members."No.";
                                Loans."Member Name" := Members.Name;


                                Loans."Loan Account" := CreateMobileLoanAccount(Members."No.", LoanProduct."Product ID");

                                Loans."Requested Amount" := MobileLoan.Amount;
                                Loans."Approved Amount" := MobileLoan.Amount;
                                Loans.Status := Loans.Status::Approved;
                                Loans."Disbursement Account No" := MobileLoan."Account No";// loanAccountNum;
                                Loans."Disbursement Date" := Today;

                                //Added 10.11.2022 12:54PM -to resolve erroneous installments
                                Loans.Installments := MobileLoan."Loan Period";
                                if LoanProduct."Mobile Installments Type" = LoanProduct."mobile installments type"::None then
                                    Loans.Installments := LoanProduct."Ordinary Default Intallments";

                                Loans."Repayment Start Date" := CalcDate(Format(1) + 'M', Loans."Disbursement Date");
                                Loans."Expected Date of Completion" := CalcDate(Format(Loans.Installments) + 'M', Loans."Disbursement Date");
                                Loans."Repayment Frequency" := LoanProduct."Repayment Frequency";
                                Loans."Installment Period" := LoanProduct."Installment Repayment Interval";
                                Loans."Interest Calculation Method" := LoanProduct."Interest Calculation Method";
                                Loans."Loan Span" := Loans."loan span"::"Short Term";
                                Loans."Approval Date" := Today;
                                Loans."Global Dimension 1 Code" := Dim1;
                                Loans."Global Dimension 2 Code" := Dim2;
                                Loans."Captured By" := UpperCase(UserId);
                                Loans.Source := Loans.Source::BANKING;
                                if LoanProduct."Salary Loans" then
                                    Loans."Recovery Mode" := Loans."recovery mode"::Salary;
                                Loans.Interest := LoanProduct."Interest Rate (Min.)";
                                if LoanProduct."Repay Mode" = LoanProduct."repay mode"::Dividend then
                                    Loans."Recovery Mode" := Loans."recovery mode"::Dividend;

                                //Loans.VALIDATE("Approved Amount");
                                if Loans."Loan Product Type" = '119' then
                                    Loans."Loan Interest Repayment" := ROUND((MobileLoan.Amount * ((LoanProduct."Interest Rate (Max.)" / 12) / 100)), 1, '>');
                                Loans."Loan Principle Repayment" := ROUND(Loans."Approved Amount" / Loans.Installments, 1, '>');
                                Loans.Repayment := Loans."Loan Interest Repayment" + Loans."Loan Principle Repayment";
                                Loans.Validate("Sub Sector Level2", MobileLoan."Loan Purpose");
                                Loans.Insert(true);

                                LoanNo := Loans."Loan No.";
                            end;

                            Loans.Reset;
                            Loans.SetRange("Loan No.", LoanNo);
                            Loans.SetRange("Member No.", MemberNo);
                            Loans.SetRange("Loan Product Type", MobileLoan."Loan Product Type");
                            if Loans.FindFirst then begin
                                UpfrontInterest := 0;

                                UpfrontInterest := ROUND(MobileLoan.Amount * LoanProduct."Interest Rate (Max.)" / 100, 1, '>');
                                if LoanProduct."Product ID" = '119' then
                                    UpfrontInterest := ROUND(MobileLoan.Amount * LoanProduct."Interest Rate (Max.)" / 1200, 1, '>');




                                //                        IF LoanProduct."Product ID" = '136' THEN BEGIN
                                //                            SameProduct.RESET;
                                //                            SameProduct.SETRANGE("Loan Product Type",LoanProduct."Product ID");
                                //                            SameProduct.SETRANGE("Member No.",MemberNo);
                                //                            SameProduct.SETFILTER("Outstanding Balance",'>0');
                                //                            SameProduct.SETFILTER("Disbursement Date",'>=%1',LoanProduct."DAdvance Limit Period");
                                //                            SameProduct.SETRANGE(Posted,TRUE);
                                //                            IF SameProduct.FINDFIRST THEN BEGIN
                                //                                PreviousLoanAmount := SameProduct."Approved Amount";
                                //                                InterestableAmount := MobileLoan.Amount - PreviousLoanAmount;
                                //                                UpfrontInterest:=ROUND(InterestableAmount*LoanProduct."Interest Rate (Max.)"/100,1,'>');
                                //                            END;
                                //                        END;

                                DocNo := Loans."Loan No.";
                                PDate := Today;

                                Dim1 := Loans."Global Dimension 1 Code";
                                Dim2 := Loans."Global Dimension 2 Code";
                                if Dim2 = '' then
                                    Dim2 := 'NBI';

                                AccNo := Loans."Disbursement Account No";
                                ExtDoc := '';
                                LoanNo := Loans."Loan No.";
                                TransType := Transtype::Loan;
                                SystCreated := true;

                                //IF LoanProduct."Appraisal Parameter Type" = LoanProduct."Appraisal Parameter Type"::Dividends THEN
                                //LoanProduct."Product Description" := FORMAT(CALCDATE('-1Y+CY',TODAY))+' '+LoanProduct."Product Description";

                                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(LoanProduct."Product Description" + ' Disbursement :' + LoanNo, 1, 50), Balacctype::"G/L Account",
                                              '', -MobileLoan.Amount, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                                if LoanProduct."Sky Income From Sacco Interest" = LoanProduct."sky income from sacco interest"::No then
                                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr('Processing Fee :' + LoanNo, 1, 50), Balacctype::"G/L Account",
                                              '', VendorCommission, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr('SMS Charge :' + LoanNo, 1, 50), Balacctype::"G/L Account",
                                  SMSAccount, SMSCharge, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                                if LoanProduct."Interest Recovered Upfront" then
                                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(LoanProduct."Product Description" + ' Interest :' + LoanNo, 1, 50), Balacctype::"G/L Account",
                                                  '', UpfrontInterest, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


                                AccNo := Loans."Loan Account";
                                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, AccNo, CopyStr(LoanProduct."Product Description" + ' Disbursement :' + LoanNo, 1, 50), Balacctype::"G/L Account",
                                              '', MobileLoan.Amount, ExtDoc, LoanNo, Transtype::Loan, Dim1, Dim2, SystCreated);


                                if not LoanProduct."No Principle Bills" then
                                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, AccNo, CopyStr(LoanProduct."Product Description" + ' Bill :' + LoanNo, 1, 50), Balacctype::"G/L Account",
                                                  LoanProduct."Billed Account", Loans."Loan Principle Repayment", ExtDoc, LoanNo, Transtype::Bills, Dim1, Dim2, SystCreated);


                                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, AccNo, CopyStr(LoanProduct."Product Description" + ' Interest Due :' + LoanNo, 1, 50), Balacctype::"G/L Account",
                                              '', UpfrontInterest, ExtDoc, LoanNo, Transtype::"Interest Due", Dim1, Dim2, SystCreated);

                                IntDue := UpfrontInterest;
                                if LoanProduct."Sky Income From Sacco Interest" = LoanProduct."sky income from sacco interest"::Yes then
                                    IntDue := (UpfrontInterest - VendorCommission);

                                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", LoanProduct."Loan Interest Account [G/L]", CopyStr(LoanProduct."Product Description" + ' Interest Due :' + LoanNo, 1, 50), Balacctype::"G/L Account",
                                              '', -IntDue, ExtDoc, LoanNo, Transtype::"Interest Due", Dim1, Dim2, SystCreated);


                                if LoanProduct."Interest Recovered Upfront" then
                                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, AccNo, CopyStr(LoanProduct."Product Description" + ' Interest :' + LoanNo, 1, 50), Balacctype::"G/L Account",
                                                  '', -UpfrontInterest, ExtDoc, LoanNo, Transtype::"Interest Paid", Dim1, Dim2, SystCreated);



                                AccNo := VendorAccount;
                                ExtDoc := Loans."Disbursement Account No";
                                LoanNo := '';
                                TransType := Transtype::" ";

                                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Vendor, AccNo, CopyStr(LoanProduct."Product Description" + ' Disbursement Commission :' + Loans."Loan No.", 1, 50), Balacctype::"G/L Account",
                                              '', -VendorCommission, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                                //Charge Account Activation fee

                                SavAcc.Reset;
                                SavAcc.SetRange("No.", MobileLoan."Account No");
                                SavAcc.SetRange(Status, SavAcc.Status::Dormant);
                                if SavAcc.FindFirst then begin
                                    TransactionCharges.Reset;
                                    TransactionCharges.SetRange("Transaction Type", 'ACTIVATION');
                                    if TransactionCharges.FindFirst then begin
                                        SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, MobileLoan."Account No", CopyStr('Automated Activation fee on Loan :' + Loans."Loan No.", 1, 50), Balacctype::"G/L Account",
                                                    '', TransactionCharges."Charge Amount", ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);
                                        SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", TransactionCharges."G/L Account", CopyStr('Auto-Activation fee on Loan :' + Loans."Loan No.", 1, 50), Balacctype::"G/L Account",
                                                    '', -TransactionCharges."Charge Amount", ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                                        //Exice Duty
                                        ExciseDutyRate := GetExciseRate();
                                        ExciseDuty := ROUND(TransactionCharges."Charge Amount" * (ExciseDutyRate / 100));
                                        ExciseDutyGL := GetExciseDutyGL();
                                        SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, MobileLoan."Account No", CopyStr('Excise Duty-' + TransactionCharges.Description + ' :' + Loans."Loan No.", 1, 50), Balacctype::"G/L Account",
                                                  ExciseDutyGL, ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);
                                    end;
                                end;

                                PCharges.Reset;
                                PCharges.SetRange(PCharges."Product Code", Loans."Loan Product Type");
                                PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::General);
                                if PCharges.Find('-') then begin
                                    ExciseDuty := 0;
                                    repeat

                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := PCharges."Charges G_L Account";
                                        TransType := Transtype::" ";
                                        AcctType := Accttype::Savings;
                                        AccNo := Loans."Disbursement Account No";

                                        if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                            Amt := (MobileLoan.Amount * (PCharges.Percentage / 100))
                                        else
                                            if PCharges."Charge Method" = PCharges."charge method"::"Flat Amount" then
                                                Amt := PCharges."Charge Amount"
                                            else
                                                if PCharges."Charge Method" = PCharges."charge method"::Staggered then begin

                                                    PCharges.TestField(PCharges."Staggered Charge Code");

                                                    TariffDetails.Reset;
                                                    TariffDetails.SetRange(TariffDetails.Code, PCharges."Staggered Charge Code");
                                                    if TariffDetails.Find('-') then begin
                                                        repeat
                                                            if (Loans."Approved Amount" >= TariffDetails."Lower Limit") and (Loans."Approved Amount" <= TariffDetails."Upper Limit") then begin
                                                                if TariffDetails."Use Percentage" = true then begin
                                                                    Amt := MobileLoan.Amount * TariffDetails.Percentage * 0.01;
                                                                end
                                                                else begin
                                                                    Amt := TariffDetails."Charge Amount";
                                                                end;
                                                            end;
                                                        until TariffDetails.Next = 0;
                                                    end;
                                                end;

                                        if PCharges.Minimum > 0 then
                                            if Amt < PCharges.Minimum then
                                                Amt := PCharges.Minimum;
                                        if PCharges.Maximum > 0 then
                                            if Amt > PCharges.Maximum then
                                                Amt := PCharges.Maximum;


                                        if Amt > 0 then
                                            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(PCharges."Charge Description" + ' :' + Loans."Loan No.", 1, 50), Balacctype::"G/L Account",
                                                      PCharges."Charges G_L Account", Amt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


                                        //If excise duty involved
                                        if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin

                                            ExciseDutyRate := GetExciseRate();
                                            ExciseDuty += Amt * ExciseDutyRate / 100;
                                        end;


                                    until PCharges.Next = 0;
                                    if ExciseDuty > 0 then begin
                                        ExciseDutyGL := GetExciseDutyGL();
                                        SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr('Excise Duty-' + PCharges."Charge Description" + ' :' + Loans."Loan No.", 1, 50), Balacctype::"G/L Account",
                                                  ExciseDutyGL, ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                                    end;
                                end;



                                LoanTopUp.Reset;
                                LoanTopUp.SetRange("Member No.", MemberNo);
                                if MobileLoan."Loan Product Type" = '136' then
                                    LoanTopUp.SetFilter("Loans Category-SASRA", '%1|%2|%3|%4', LoanTopUp."loans category-sasra"::Watch, LoanTopUp."loans category-sasra"::Substandard,
                                    LoanTopUp."loans category-sasra"::Doubtful, LoanTopUp."loans category-sasra"::Loss);
                                if MobileLoan."Loan Product Type" <> '136' then
                                    LoanTopUp.SetRange("Loan Product Type", MobileLoan."Loan Product Type");
                                LoanTopUp.SetFilter("Outstanding Balance", '>0');
                                if LoanTopUp.FindFirst then begin
                                    repeat
                                        LoanTopUp.CalcFields("Outstanding Balance", "Outstanding Interest", "Outstanding Bills");
                                        TopUpAmt := 0;
                                        if LoanTopUp."Outstanding Interest" > 0 then begin
                                            TopUpAmt += LoanTopUp."Outstanding Interest";
                                            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, MobileLoan."Account No", CopyStr('Loan Interest Top Up :' + Loans."Loan No.", 1, 50), Balacctype::"G/L Account",
                                                      '', LoanTopUp."Outstanding Interest", ExtDoc, LoanTopUp."Loan No.", TransType, Dim1, Dim2, SystCreated);
                                            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, LoanTopUp."Loan Account", CopyStr('Loan Interest Top Up :' + Loans."Loan No.", 1, 50), Balacctype::"G/L Account",
                                                      '', -LoanTopUp."Outstanding Interest", ExtDoc, LoanTopUp."Loan No.", Transtype::"Interest Paid", Dim1, Dim2, SystCreated);
                                        end;
                                        if LoanTopUp."Outstanding Balance" > 0 then begin
                                            TopUpAmt += LoanTopUp."Outstanding Balance";
                                            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, MobileLoan."Account No", CopyStr('Loan Principal Top Up :' + Loans."Loan No.", 1, 50), Balacctype::"G/L Account",
                                                      '', LoanTopUp."Outstanding Balance", ExtDoc, LoanTopUp."Loan No.", TransType, Dim1, Dim2, SystCreated);
                                            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, LoanTopUp."Loan Account", CopyStr('Loan Principal Top Up :' + Loans."Loan No.", 1, 50), Balacctype::"G/L Account",
                                                      '', -LoanTopUp."Outstanding Balance", ExtDoc, LoanTopUp."Loan No.", Transtype::Repayment, Dim1, Dim2, SystCreated);
                                            //Bills
                                            BillAmount := LoanTopUp."Outstanding Balance";
                                            if LoanTopUp."Outstanding Balance" > LoanTopUp."Outstanding Bills" then
                                                BillAmount := LoanTopUp."Outstanding Bills";
                                            Product.Get(LoanTopUp."Loan Product Type");
                                            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", Product."Billed Account", CopyStr('Loan Bills Top Up :' + Loans."Loan No.", 1, 50), Balacctype::"G/L Account",
                                                  '', BillAmount, ExtDoc, Loans."Loan No.", Transtype::" ", Dim1, Dim2, SystCreated);

                                            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, LoanTopUp."Loan Account", CopyStr('Loan Bills Top Up :' + Loans."Loan No.", 1, 50), Balacctype::"G/L Account",
                                                      '', -BillAmount, ExtDoc, LoanTopUp."Loan No.", Transtype::Bills, Dim1, Dim2, SystCreated);

                                        end;

                                        PCharges.Reset;
                                        PCharges.SetRange(PCharges."Product Code", LoanTopUp."Loan Product Type");
                                        PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"Top up");
                                        if PCharges.Find('-') then begin
                                            ExciseDuty := 0;
                                            repeat

                                                BalAccType := Balacctype::"G/L Account";
                                                BalAccNo := PCharges."Charges G_L Account";
                                                TransType := Transtype::" ";
                                                AcctType := Accttype::Savings;
                                                AccNo := Loans."Disbursement Account No";

                                                if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                                    Amt := (TopUpAmt * (PCharges.Percentage / 100))
                                                else
                                                    if PCharges."Charge Method" = PCharges."charge method"::"Flat Amount" then
                                                        Amt := PCharges."Charge Amount"
                                                    else
                                                        if PCharges."Charge Method" = PCharges."charge method"::Staggered then begin

                                                            PCharges.TestField(PCharges."Staggered Charge Code");

                                                            TariffDetails.Reset;
                                                            TariffDetails.SetRange(TariffDetails.Code, PCharges."Staggered Charge Code");
                                                            if TariffDetails.Find('-') then begin
                                                                repeat
                                                                    if (TopUpAmt >= TariffDetails."Lower Limit") and (TopUpAmt <= TariffDetails."Upper Limit") then begin
                                                                        if TariffDetails."Use Percentage" = true then begin
                                                                            Amt := TopUpAmt * TariffDetails.Percentage * 0.01;
                                                                        end
                                                                        else begin
                                                                            Amt := TariffDetails."Charge Amount";
                                                                        end;
                                                                    end;
                                                                until TariffDetails.Next = 0;
                                                            end;
                                                        end;

                                                if PCharges.Minimum > 0 then
                                                    if Amt < PCharges.Minimum then
                                                        Amt := PCharges.Minimum;
                                                if PCharges.Maximum > 0 then
                                                    if Amt > PCharges.Maximum then
                                                        Amt := PCharges.Maximum;


                                                if Amt > 0 then
                                                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, MobileLoan."Account No", CopyStr(PCharges."Charge Description" + ' :' + Loans."Loan No.", 1, 50), Balacctype::"G/L Account",
                                                              PCharges."Charges G_L Account", Amt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


                                                //If excise duty involved
                                                if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin

                                                    ExciseDutyRate := GetExciseRate();
                                                    ExciseDuty += Amt * ExciseDutyRate / 100;
                                                end;


                                            until PCharges.Next = 0;
                                            if ExciseDuty > 0 then begin
                                                ExciseDutyGL := GetExciseDutyGL();
                                                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, MobileLoan."Account No", CopyStr('Excise Duty-' + PCharges."Charge Description" + ' :' + Loans."Loan No.", 1, 50), Balacctype::"G/L Account",
                                                          ExciseDutyGL, ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                                            end;
                                        end;
                                    until LoanTopUp.Next = 0;
                                end;


                                //Top Up Advice
                                //                        LoansTopup.RESET;
                                //                        LoansTopup.SETRANGE("Loan No.",Loans."Loan No.");
                                //                        IF LoansTopup.FINDFIRST THEN BEGIN
                                //                          REPEAT
                                //                            LoansProcess.AdviceLoan(LoansTopup."Loan Top Up",TRUE);
                                //                          UNTIL LoansTopup.NEXT = 0;
                                //                        END;

                                MobileLoan.Remarks := 'Successful';
                                MobileLoan."Approved Amount" := Loans."Approved Amount";
                                MobileLoan.Status := MobileLoan.Status::Successful;
                                MobileLoan.Posted := true;
                                MobileLoan."Date Posted" := CurrentDatetime;//TODAY;
                                MobileLoan."Message Text" := msg;
                                MobileLoan.Modify;

                                if LoanProduct.Category = LoanProduct.Category::"FOSA Loan" then
                                    CreateGuarantors(Loans."Loan No.", MobileLoan."Entry No");

                                Loans.Posted := true;
                                Loans."Posted By" := UserId;
                                Loans.Modify;
                                LoanNo := Loans."Loan No.";


                                //Activate saving acc
                                SavAcc.Reset;
                                SavAcc.SetRange("No.", MobileLoan."Account No");
                                SavAcc.SetRange(Status, SavAcc.Status::Dormant);
                                if SavAcc.FindFirst then begin
                                    if SavAcc.Blocked = SavAcc.Blocked::" " then
                                        SavAcc.Blocked := SavAcc.Blocked::" ";
                                    SavAcc.Status := SavAcc.Status::Active;
                                    SavAcc."Status Change Reason" := 'Auto Activated on Loan Posting';
                                    SavAcc.Modify;
                                end;

                                SaccoTrans.PostJournal(JTemplate, JBatch);


                                Loans.Get(LoanNo);
                                Loans.CalcFields("Outstanding Balance", "Outstanding Interest");


                                HMember.Get(Loans."Member No.");
                                FName := HMember."First Name";
                                if FName = '' then
                                    FName := HMember."Second Name";

                                msg := 'Dear ' + FirstName(FName) +
                                ',' + NewLine + 'Your ' + LoanProduct."USSD Product Name" + ' of KES ' + Format(MobileLoan."Approved Amount") + ' has been approved and disbursed to your FOSA account.'
                                + NewLine + 'Your loan is due on ' + Format(ddMMyyyy(Loans."Expected Date of Completion")) + NewLine + 'REF: ' + MobileLoan."Entry Code";
                                ;

                                if LoanProduct."Product ID" = '136' then begin
                                    msg := 'Dear ' + FirstName(FName) +
                                    ',' + NewLine + 'Your ' + LoanProduct."USSD Product Name" + ' of KES ' + Format(MobileLoan."Approved Amount") + ' has been approved and disbursed to your FOSA account.' +
                                    NewLine + 'REF: ' + MobileLoan."Entry Code";
                                end;
                                SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);


                                if LoanProduct."Product ID" <> '136' then begin
                                    msg := 'Dear ' + FirstName(FName) +
                                    ',' + NewLine + 'To repay your ' + LoanProduct."USSD Product Name" + ' Kindly deposit money to your FOSA A/C No ' + Format(MobileLoan."Account No") + ' through paybill No. '
                                    + PaybillNo + NewLine + 'REF: ' + MobileLoan."Entry Code";
                                    SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);
                                end;


                            end;

                        end;
                    end;
                end;


            end;




        end;

    end;


    procedure AccountTransfer(EntryCode: Text[20]; TransactionID: Code[20]; MobileNo: Code[20]; ToAccount: Code[20]; Destination: Text; TransAmount: Decimal; PIN: Text; PayLoan: Boolean; ToBOSA: Boolean; DebitAccount: Code[30]) Response: Text
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52185482;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        SLedger: Record 52185732;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        AccountBookBalance: Decimal;
        AccountAvailableBalance: Decimal;
        Loans: Record 52185729;
        IntAmt: Decimal;
        PrAmt: Decimal;
        RunBal: Decimal;
        DrAmt: Decimal;
        TransactionDate: DateTime;
        IntRate: Decimal;
        msg: Text;
        NewLoanBal: Decimal;
        LoanType: Record 52185690;
        LT: Text;
        FromAccount: Code[20];
        MemberNo: Code[20];
        RecMemberNo: Code[20];
        RecMobileNo: Code[20];
        MemberName: Text;
        RecMemberName: Text;
        BusinessAccount: Record 52185730;
        ItsABusinesAccount: Boolean;
    begin
        MobileTrans.LockTable(true);
        TransactionDate := CurrentDatetime;
        Response := 'ERROR';

        if (ToBOSA <> true) then begin
            if not PayLoan then begin
                ToAccount := GetAccountTransferRecipient(ToAccount, Destination);

                if ToAccount = '' then begin
                    Error('Destination Account Not Found');
                end;
            end;
        end;

        MobileNo := '+' + MobileNo;

        if not CorrectPin(MobileNo, PIN) then begin
            Response := 'INCORRECT_PIN';
            exit;
        end;


        MobileTrans.Reset;
        MobileTrans.SetRange("Entry No.", EntryCode);
        if MobileTrans.FindFirst then begin
            Response := '<Response>';
            Response += '<Status>TRANSACTION_EXISTS</Status>';
            Response += '<StatusDescription>Transaction Already Exists</StatusDescription>';
            Response += '<Reference>' + Format(EntryCode) + '</Reference>';
            Response += '</Response>';
            exit;
        end;



        MemberNo := '';
        FromAccount := '';
        RecMemberNo := '';

        MemberName := '';
        ItsABusinesAccount := false;
        if PayLoan then begin
            SavAcc.Reset;
            SavAcc.SetRange("Transactional Mobile No", MobileNo);
            SavAcc.SetRange("Product Type", '505');
            if SavAcc.FindFirst then begin
                FromAccount := SavAcc."No.";
            end;
        end else begin
            if SavAcc.Get(DebitAccount) then begin
                FromAccount := SavAcc."No.";
            end else begin
                BusinessAccount.Reset;
                BusinessAccount.SetRange("Business Account Code", DebitAccount);
                if BusinessAccount.FindFirst then begin
                    FromAccount := BusinessAccount."No.";
                    ItsABusinesAccount := true;
                end;
            end;
        end;

        if SavAcc.Get(FromAccount) then begin
            HMember.Get(SavAcc."Member No.");
            FName := HMember."First Name";
            if FName = '' then
                FName := HMember."Second Name";

            MemberNo := SavAcc."Member No.";
            MemberName := FName;
        end;



        // Get Excise duty G/L
        ExciseDutyGL := GetExciseDutyGL();
        ExciseDutyRate := GetExciseRate();
        ExciseDuty := 0;

        SaccoAccount := '';
        SaccoFee := 0;
        VendorAccount := '';
        VendorCommission := 0;
        RecMobileNo := '';

        if PayLoan then
            Loans.Get(ToAccount)
        else begin
            SavAcc.Get(ToAccount);
            RecMemberNo := SavAcc."Member No.";
            RecMemberName := SavAcc.Name;
            RecMobileNo := SavAcc."Transactional Mobile No";
            if RecMobileNo = '' then
                RecMobileNo := SavAcc."Mobile Phone No";
        end;

        SMSAccount := '';
        SMSCharge := 0;

        CoopSetup.Reset;
        if PayLoan then
            CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Pay Loan From Account")
        else
            CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Account Transfer");
        if CoopSetup.FindFirst then begin

            SMSAccount := CoopSetup."SMS Account";
            SMSCharge := CoopSetup."SMS Charge";


            SaccoAccount := CoopSetup."Sacco Fee Account";
            SaccoFee := CoopSetup."Sacco Fee";
            VendorAccount := CoopSetup."Vendor Commission Account";
            VendorCommission := CoopSetup."Vendor Commission";

            TotalCharge := SaccoFee + VendorCommission + SMSCharge;
            if ItsABusinesAccount then begin
                TotalCharge := 0;
                SaccoFee := 0;
                VendorCommission := 0;
                SMSCharge := 0;
            end;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
        end
        else begin
            if PayLoan then
                Error('Setup Missing for %1', CoopSetup."transaction type"::"Pay Loan From Account")
            else
                Error('Setup Missing for %1', CoopSetup."transaction type"::"Account Transfer");
        end;



        if SavAcc.Get(FromAccount) then begin

            ProdFact.Get(SavAcc."Product Type");

            if (ProdFact."Product ID" <> '513') and (ProdFact."Product ID" <> '511') then
                if (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::"Deposits Only") or
                    (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::" ") then begin
                    Error('The Account to Charge is not a Withdrawable Account');

                end;

            RunBal := TransAmount;
            AccBal := GetAccountBalance(SavAcc."No.");
            SavAcc.CalcFields(Balance);
            if ProdFact."Product ID" = '513' then
                AccBal := SavAcc.Balance - 1000;

            if AccBal >= TransAmount + TotalCharge + ExciseDuty then begin

                //RunBal := RunBal - (TotalCharge+ExciseDuty);

                //BUser.GET(USERID);

                //BUser.TESTFIELD("Cashier Journal Template");
                //BUser.TESTFIELD("Cashier Journal Batch");

                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';

                GenJournalBatch.Reset;
                GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                GenJournalBatch.SetRange(Name, JBatch);
                if not GenJournalBatch.FindFirst then begin
                    GenJournalBatch.Init;
                    GenJournalBatch."Journal Template Name" := JTemplate;
                    GenJournalBatch.Name := JBatch;
                    GenJournalBatch.Description := 'Sky World Batch';
                    GenJournalBatch.Init;
                end;

                MobileTrans.Reset;
                MobileTrans.SetRange("Entry No.", EntryCode);
                if MobileTrans.FindFirst then begin
                    Response := '<Response>';
                    Response += '<Status>TRANSACTION_EXISTS</Status>';
                    Response += '<StatusDescription>Transaction Already Exists</StatusDescription>';
                    Response += '<Reference>' + Format(EntryCode) + '</Reference>';
                    Response += '</Response>';
                    exit;
                end;


                MobileTrans.Init;
                MobileTrans."Entry No." := EntryCode;
                MobileTrans."Transaction ID" := TransactionID;
                MobileTrans."Session ID" := TransactionID;
                MobileTrans."Transaction Date" := Dt2Date(TransactionDate);
                MobileTrans."Transaction Time" := Dt2Time(TransactionDate);
                MobileTrans."Member Account" := SavAcc."No.";
                MobileTrans.Amount := TransAmount;
                MobileTrans."Transaction Type" := MobileTrans."transaction type"::"Account Transfer";
                MobileTrans.Description := CopyStr('Acc Trans. ' + FromAccount + ' -> ' + ToAccount, 1, 50);
                MobileTrans."Account to Check" := ToAccount;
                if not MobileTrans.Insert then begin

                    Response := '<Response>';
                    Response += '<Status>TRANSACTION_EXISTS</Status>';
                    Response += '<StatusDescription>Transaction Already Exists</StatusDescription>';
                    Response += '<Reference>' + Format(EntryCode) + '</Reference>';
                    Response += '</Response>';
                    exit;
                end;


                //        MobileTrans.RESET;
                //        MobileTrans.SETRANGE("Transaction ID",TransactionID);
                //        MobileTrans.SETRANGE(Posted,FALSE);
                //        IF MobileTrans.FINDFIRST THEN BEGIN
                //
                //            DocNo := MobileTrans."Transaction ID";
                //            PDate := MobileTrans."Transaction Date";
                //            AccNo := MobileTrans."Member Account";
                //            ExtDoc := '';
                //            LoanNo := '';
                //            TransType := TransType::" ";
                //            Dim1 := SavAcc."Global Dimension 1 Code";
                //            Dim2 := SavAcc."Global Dimension 2 Code";
                //            SystCreated := TRUE;
                //
                //            SaccoTrans.InitJournal(JTemplate,JBatch);
                //
                //            DrAmt:=MobileTrans.Amount;
                //
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                //                          '',DrAmt,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //
                //
                //            IF PayLoan THEN BEGIN
                //                IF Loans.GET(ToAccount) THEN BEGIN
                //                    Loans.CALCFIELDS("Outstanding Balance","Outstanding Interest");
                //                    IntRate := Loans.Interest/12;
                //
                //                    IntAmt := Loans."Outstanding Interest";
                //
                //
                //                    IF IntAmt > 0 THEN BEGIN
                //
                //                        IF IntAmt > RunBal THEN
                //                            IntAmt := RunBal;
                //
                //                        MobileTrans."Interest Paid" := IntAmt;
                //                        SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Credit,Loans."Loan Account",COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                //                                      '',-IntAmt,ExtDoc,Loans."Loan No.",TransType::"Interest Paid",Dim1,Dim2,SystCreated);
                //
                //                        RunBal -= IntAmt;
                //
                //                    END;
                //
                //                    IF Loans."Outstanding Balance" > 0 THEN BEGIN
                //                        PrAmt:=Loans."Outstanding Balance";
                //                        IF PrAmt > RunBal THEN
                //                            PrAmt := RunBal;
                //
                //
                //                        MobileTrans."Principal Paid" := PrAmt;
                //                        SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Credit,Loans."Loan Account",COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                //                                      '',-PrAmt,ExtDoc,Loans."Loan No.",TransType::Repayment,Dim1,Dim2,SystCreated);
                //
                //                        RunBal -= PrAmt;
                //
                //
                //                        IF BillProdFac.GET(Loans."Loan Product Type") THEN BEGIN
                //                            IF NOT BillProdFac."No Principle Bills" THEN BEGIN
                //                                SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Credit,Loans."Loan Account",COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                //                                        BillProdFac."Billed Account",-PrAmt,ExtDoc,Loans."Loan No.",TransType::Bills,Dim1,Dim2,SystCreated);
                //
                //                            END;
                //                        END;
                //
                //
                //
                //
                //
                //                    END;
                //                    Loans.VALIDATE(Repayment);
                //                //(Loans."Loan No.",FALSE);
                //
                //                    IF RunBal > 0 THEN BEGIN
                //
                //                        SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Excess - '+MobileTrans.Description,1,50),BalAccType::"G/L Account",
                //                                      '',-RunBal,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //
                //                    END;
                //
                //                END;
                //            END
                //            ELSE BEGIN
                //                SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,ToAccount,COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                //                              '',-MobileTrans.Amount,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //            END;
                //
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR(FORMAT(MobileTrans."Transaction Type")+' Charge',1,50),BalAccType::"G/L Account",
                //                          '',TotalCharge+ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //            {
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Transfer Charge',1,50),BalAccType::"G/L Account",
                //                          '',SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Notification Charge',1,50),BalAccType::"G/L Account",
                //                          SMSAccount,SMSCharge,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Excise Duty',1,50),BalAccType::"G/L Account",
                //                          ExciseDutyGL,ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //            }
                //
                //
                //            AccNo := VendorAccount;
                //            ExtDoc := MobileTrans."Member Account";
                //            LoanNo := '';
                //            TransType := TransType::" ";
                //
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Vendor,AccNo,COPYSTR(MobileTrans.Description+' Commission',1,50),BalAccType::"G/L Account",
                //                          '',-VendorCommission,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //
                //            AccNo := SaccoAccount;
                //            ExtDoc := MobileTrans."Member Account";
                //            LoanNo := '';
                //            TransType := TransType::" ";
                //
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::"G/L Account",AccNo,COPYSTR(MobileTrans.Description+' Fee',1,50),BalAccType::"G/L Account",
                //                          '',-SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::"G/L Account",ExciseDutyGL,COPYSTR(MobileTrans.Description+' Excise Duty',1,50),BalAccType::"G/L Account",
                //                          '',-ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                //
                //
                //            MobileTrans.Posted:=TRUE;
                //            MobileTrans."Posted By":=USERID;
                //            MobileTrans."Date Posted":=TODAY;
                //            MobileTrans.MODIFY;
                //
                //            SaccoTrans.PostJournal(JTemplate,JBatch);
                //
                //            Priority:=232;
                //            IF PayLoan THEN BEGIN
                //                IF Loans.GET(ToAccount) THEN BEGIN
                //                    Loans.CALCFIELDS("Outstanding Balance");
                //                    LT:=Loans."Loan Product Type Name";
                //                    IF LoanType.GET(Loans."Loan Product Type") THEN
                //                      LT := LoanType."USSD Product Name";
                //
                //                    NewLoanBal := Loans."Outstanding Balance";
                //                    msg := FORMAT(MobileTrans."Transaction Type")+' of KES '+FORMAT(MobileTrans.Amount)+' has been processed successfully. Interest Paid is '+FORMAT(MobileTrans."Interest Paid")+
                //                    ', Principal Paid is '+FORMAT(MobileTrans."Principal Paid")+', New '+LT+' Balance is '+FORMAT(NewLoanBal)+NewLine+'REF: '+MobileTrans."Transaction ID";
                //                END;
                //            END
                //            ELSE BEGIN
                //
                //                IF RecMemberNo<>MemberNo THEN BEGIN
                //                    IF RecMobileNo<>'' THEN BEGIN
                //                        msg := 'Dear '+RecMemberName+','+NewLine+'You have successfully received KES '+FORMAT(MobileTrans.Amount)+' from '+SavAcc.Name+' - '+
                //                        SavAcc."Mobile Phone No"+' on '+FORMAT(ddMMyyyy(TODAY))+' '+FORMAT(TIME) +'.'+NewLine+'REF: '+MobileTrans."Transaction ID";
                //                        SendSms(Source::MBANKING,RecMobileNo,msg,FORMAT(MobileTrans."Transaction ID"),'',TRUE,Priority,FALSE);
                //
                //                    END;
                //
                //                    msg :='Dear '+FirstName(MemberName)+','+NewLine+'You have successfully transferred KES. '+FORMAT(MobileTrans.Amount)+
                //                          ' to '+RecMemberName+' - '+RecMobileNo+' on '+FORMAT(ddMMyyyy(TODAY))+' '+FORMAT(TIME) +'.'+NewLine+'REF: '+MobileTrans."Transaction ID";;
                //                END
                //                ELSE BEGIN
                //                    msg :='Dear '+FirstName(MemberName)+','+NewLine+'You have successfully transferred KES. '+FORMAT(MobileTrans.Amount)+
                //                          ' to A/C '+ToAccount+' on '+FORMAT(ddMMyyyy(TODAY))+' '+FORMAT(TIME) +'.'+NewLine+'REF: '+MobileTrans."Transaction ID";
                //                END;
                //
                //
                //            END;
                //
                //
                //            SendSms(Source::MBANKING,SavAcc."Transactional Mobile No",msg,FORMAT(MobileTrans."Transaction ID"),'',TRUE,Priority,FALSE);
                //
                //
                //            Response:='SUCCESS';
                //        END;

                Response := 'SUCCESS';
            end
            else begin


                Priority := 241;
                if MobileTrans.Amount > 0 then begin
                    msg := Format(MobileTrans."Transaction Type") + ' of KES ' + Format(MobileTrans.Amount) + ' has failed because you have insufficient balance.';
                    SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileTrans."Transaction ID"), '', true, Priority, false);
                end;
                Response := 'INSUFFICIENT_BAL';

            end;
        end
        else begin
            Error('Account not found');
        end;
    end;


    procedure GetLoanGuarantors(TransactionID: Code[20]; LoanNo: Code[20]) Response: Text
    var
        MobileNo: Code[20];
        Loans: Record 52185729;
        LoanProduct: Record 52185690;
        SavAcc: Record 52185730;
        MemberNo: Code[20];
        MaxLoan: Decimal;
        LoanGuarantors: Record 52185739;
        Members: Record 52185700;
    begin

        Response := '';

        Loans.Reset;
        Loans.SetRange("Loan No.", LoanNo);
        if Loans.FindFirst then begin
            Loans.CalcFields("Outstanding Balance");
            CheckDate := Today;
            RemInst := 0;
            while CheckDate < Loans."Expected Date of Completion" do begin
                RemInst += 1;
                CheckDate := CalcDate('1M', CheckDate);
            end;

            LoanGuarantors.Reset;
            LoanGuarantors.SetRange("Loan No", Loans."Loan No.");
            LoanGuarantors.SetRange(Substituted, false);
            if LoanGuarantors.Find('-') then begin
                Response := '<Loan>';
                LGCount := LoanGuarantors.Count;
                if (LGCount = 0) then
                    LGCount := 1;
                repeat

                    Response += '<Security>';
                    Response += '<LoanNo>' + Loans."Loan No." + '</LoanNo>';
                    Response += '<Type>' + Format(LoanGuarantors."Guarantor Type") + '</Type>';
                    Response += '<RemainingInstallment>' + Format(RemInst) + ' Month(s)</RemainingInstallment>';
                    Response += '<Name>' + LoanGuarantors.Name + '</Name>';
                    MobileNo := '';
                    if Members.Get(LoanGuarantors."Member No") then begin
                        MobileNo := Members."Mobile Phone No";
                    end;
                    Response += '<MobileNo>' + MobileNo + '</MobileNo>';
                    Response += '<AmountGuaranteed>' + Format(ROUND(Loans."Approved Amount" / LGCount)) + '</AmountGuaranteed>';
                    Response += '<CurrentCommitment>' + Format(ROUND(Loans."Outstanding Balance" / LGCount)) + '</CurrentCommitment>';

                    Response += '</Security>';

                until LoanGuarantors.Next = 0;
                Response += '</Loan>';
            end;
        end
        else begin
            Response := '<Response>';
            Response += '<Status>LOAN_NOT_FOUND</Status>';
            Response += '<StatusDescription>Member Loan not found</StatusDescription>';
            Response += '<Reference>' + TransactionID + '</Reference>';
            Response += '</Response>';
        end;
    end;


    procedure GetLoansGuaranteed(TransactionID: Code[20]; Phone: Code[20]) Response: Text
    var
        MobileNo: Code[20];
        Loans: Record 52185729;
        LoanProduct: Record 52185690;
        SavAcc: Record 52185730;
        MemberNo: Code[20];
        MaxLoan: Decimal;
        LoanGuarantors: Record 52185739;
        Members: Record 52185700;
        DefAmt: Decimal;
    begin
        MobileNo := '+' + Phone;

        Response := '';

        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", MobileNo);
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        if SavAcc.FindFirst then begin
            MemberNo := SavAcc."Member No.";

            LoanGuarantors.Reset;
            LoanGuarantors.SetRange("Member No", MemberNo);
            LoanGuarantors.SetFilter("Outstanding Balance", '>0');
            if LoanGuarantors.Find('-') then begin
                Response := '<Security>';
                CheckDate := Today;
                RemInst := 0;
                /*WHILE CheckDate < Loans."Expected Date of Completion" DO BEGIN
                    RemInst+=1;
                    CheckDate:=CALCDATE('1M',CheckDate);
                END;*/
                LGCount := LoanGuarantors.Count;
                if (LGCount = 0) then
                    LGCount := 1;
                repeat
                    if Loans.Get(LoanGuarantors."Loan No") then begin

                        Loans.CalcFields("Outstanding Balance");
                        if Loans."Outstanding Balance" > 0 then begin
                            LoanProduct.Get(Loans."Loan Product Type");
                            DefAmt := 0;

                            Response += '<Loan>';
                            Response += '<Loanee>' + Loans."Member Name" + '</Loanee>';
                            Response += '<LoanNo>' + Loans."Loan No." + '</LoanNo>';
                            Response += '<LoanType>' + LoanProduct."USSD Product Name" + '</LoanType>';
                            //Response += '<RemainingInstallment>'+FORMAT(Loans."Expected Date of Completion")+'</RemainingInstallment>';
                            MobileNo := '';
                            if Members.Get(LoanGuarantors."Member No") then begin
                                MobileNo := Members."Mobile Phone No";
                            end;
                            Response += '<MobileNo>' + MobileNo + '</MobileNo>';
                            Response += '<GuarantorType>' + Format(LoanGuarantors."Guarantor Type") + '</GuarantorType>';
                            Response += '<IssuedDate>' + Format(Loans."Disbursement Date") + '</IssuedDate>';
                            Response += '<EndDate>' + Format(Loans."Expected Date of Completion") + '</EndDate>';
                            Loans.CalcFields(/*"Loans Category-SASRA",*/"Outstanding Balance");
                            if (Loans."Loans Category-SASRA" = Loans."loans category-sasra"::Perfoming) or
                                (Loans."Loans Category-SASRA" = Loans."loans category-sasra"::Watch) then
                                Response += '<Status>Performing</Status>'
                            else
                                Response += '<Status>Defaulter</Status>';
                            Response += '<LoanAmount>' + Format(Loans."Approved Amount") + '</LoanAmount>';
                            Response += '<Installments>' + Format(Loans.Installments) + '</Installments>';
                            Response += '<LoanBalance>' + Format(Loans."Outstanding Balance") + '</LoanBalance>';
                            Response += '<DefaultedAmount>' + Format(0) + '</DefaultedAmount>';

                            Response += '<AmountGuaranteed>' + Format(ROUND(Loans."Approved Amount" / LGCount)) + '</AmountGuaranteed>';
                            Response += '<CurrentCommitment>' + Format(ROUND(Loans."Outstanding Balance" / LGCount)) + '</CurrentCommitment>';
                            Response += '<Status>PENDING</Status>';

                            Response += '</Loan>';
                        end;
                    end;

                until LoanGuarantors.Next = 0;
                Response += '</Security>';

            end;

        end
        else begin
            Response := '<Response>';
            Response += '<Status>ACC_NOT_FOUND</Status>';
            Response += '<StatusDescription>Member Account not found</StatusDescription>';
            Response += '<Reference>' + TransactionID + '</Reference>';
            Response += '</Response>';
        end;

    end;


    procedure GetMemberLoanList(Phone: Code[20]) Response: Text
    var
        MobileNo: Code[20];
        Loans: Record 52185729;
        LoanProduct: Record 52185690;
        SavAcc: Record 52185730;
        MemberNo: Code[20];
        MaxLoan: Decimal;
        Found: Boolean;
        LoanBalance: Decimal;
    begin

        MobileNo := '+' + Phone;


        Response := '';
        Found := false;
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", MobileNo);
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        if SavAcc.FindFirst then begin

            MemberNo := SavAcc."Member No.";

            LoanProduct.Reset;
            LoanProduct.SetRange("Product Class Type", LoanProduct."product class type"::Loan);
            if LoanProduct.Find('-') then begin
                Response := '<Loans>';
                repeat

                    MaxLoan := LoanProduct."Maximum Loan Amount";
                    Loans.Reset;
                    Loans.SetRange("Member No.", MemberNo);
                    Loans.SetRange("Loan Product Type", LoanProduct."Product ID");
                    Loans.SetFilter("Outstanding Balance", '>0');
                    if Loans.FindFirst then begin
                        Found := true;
                        repeat
                            Loans.CalcFields("Outstanding Balance", "Outstanding Interest");
                            LoanBalance := ROUND((Loans."Outstanding Balance" + Loans."Outstanding Interest"), 1, '>');
                            Response += '<Product>';
                            Response += '<LoanNo>' + Loans."Loan No." + '</LoanNo>';
                            Response += '<Type>' + LoanProduct."USSD Product Name" + '</Type>';
                            Response += '<Balance>' + Format(LoanBalance) + '</Balance>';

                            Response += '</Product>';
                        until Loans.Next = 0;
                    end;
                until LoanProduct.Next = 0;
                Response += '</Loans>';

            end;

        end;
        if not Found then
            Response := '';
    end;


    procedure GetBosaAccountList(PhoneNo: Text[30]; Withdrawable: Boolean) Response: Text
    var
        SavAcc: Record 52185730;
        ProdFact: Record 52185690;
        Found: Boolean;
        MemberNo: Code[20];
    begin

        PhoneNo := '+' + PhoneNo;
        Response := '';
        Found := false;



        MemberNo := '';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        if SavAcc.FindFirst then
            MemberNo := SavAcc."Member No.";

        if MemberNo = '' then
            exit;



        SavAcc.Reset;
        SavAcc.SetRange("Member No.", MemberNo);
        SavAcc.SetFilter("Product Category", '%1|%2', SavAcc."product category"::"Share Capital", SavAcc."product category"::"Deposit Contribution");
        if SavAcc.Find('-') then begin
            Response := '<Accounts>';
            repeat
                ProdFact.Get(SavAcc."Product Type");
                Found := true;
                Response += '<Account>';
                Response += '<AccNo>' + SavAcc."No." + '</AccNo>';
                Response += '<AccName>' + SavAcc."Product Name" + '</AccName>';
                Response += '</Account>';

            until SavAcc.Next = 0;
            Response += '</Accounts>';
        end;


        if not Found then
            Response := '';
    end;


    procedure GetLoanQualifiedAmount(AccountNo: Code[20]; LoanProductType: Code[20]): Decimal
    var
        DefaultedAmount: Integer;
        saccoAccount: Record 52185730;
        ProdFac: Record 52185690;
        salStartString: Text;
        SalStart: Date;
        SalEnd: Date;
        SalBuffer: Record 52185784;
        Salary1: Decimal;
        Salary2: Decimal;
        Date1: Date;
        Date2: Date;
        NetSal: Decimal;
        Loans: Record 52185729;
        LoanRep: Decimal;
        IntAmt: Decimal;
        PrAmt: Decimal;
        STODed: Decimal;
        StandingOrders: Record 52185717;
        MaxLoanAmount: Decimal;
        ExpInt: Decimal;
        LoanType: Record 52185690;
        DepAcc: Record 52185730;
        Salary3: Decimal;
        Date3: Date;
    begin


        saccoAccount.Reset;
        saccoAccount.SetRange("No.", AccountNo);
        if saccoAccount.Find('-') then begin

            if LoanType.Get(LoanProductType) then begin

                Salary1 := 0;
                Salary2 := 0;
                Salary3 := 0;

                SalEnd := Today;
                SalStart := CalcDate('-45D', SalEnd);



                SalBuffer.Reset;
                SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer.Date);
                SalBuffer.SetRange(SalBuffer."Account No.", AccountNo);
                if SalBuffer.FindLast then begin
                    Date3 := SalBuffer."Posting Date";
                    Salary3 := SalBuffer.Amount;
                    if SalBuffer.Count = 2 then begin

                        SalBuffer.Reset;
                        SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer.Date);
                        SalBuffer.SetRange(SalBuffer."Account No.", AccountNo);
                        if SalBuffer.FindFirst then begin
                            Date2 := SalBuffer."Posting Date";
                            Salary2 := SalBuffer.Amount;
                        end
                    end;
                end
                else
                    exit(0);


                //MESSAGE('Salary 3 - %1\Date 3 - %3',Salary3,Date3);


                if Date3 = 0D then
                    exit(0);

                SalEnd := CalcDate('-1M+CM', Date3);
                SalStart := CalcDate('-45D', SalEnd);

                if Salary2 = 0 then begin
                    SalBuffer.Reset;
                    SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer.Date);
                    SalBuffer.SetRange(SalBuffer."Account No.", AccountNo);
                    SalBuffer.SetFilter("Posting Date", '%1..%2', SalStart, SalEnd);
                    if SalBuffer.FindLast then begin
                        Date2 := SalBuffer."Posting Date";
                        Salary2 := SalBuffer.Amount;
                        if SalBuffer.Count = 2 then begin
                            SalBuffer.Reset;
                            SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer.Date);
                            SalBuffer.SetRange(SalBuffer."Account No.", AccountNo);
                            SalBuffer.SetFilter("Posting Date", '%1..%2', SalStart, SalEnd);
                            if SalBuffer.FindFirst then begin
                                Date1 := SalBuffer."Posting Date";
                                Salary1 := SalBuffer.Amount;
                            end
                        end;
                    end
                    else
                        exit(0);
                end;

                //MESSAGE('Salary 2 - %1\Date 2 - %3',Salary2,Date2);

                if Date2 = 0D then
                    exit(0);

                SalEnd := CalcDate('-1M+CM', Date2);
                SalStart := CalcDate('-45D', SalEnd);

                if Salary1 = 0 then begin
                    SalBuffer.Reset;
                    SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer.Date);
                    SalBuffer.SetRange(SalBuffer."Account No.", AccountNo);
                    SalBuffer.SetFilter("Posting Date", '%1..%2', SalStart, SalEnd);
                    if SalBuffer.FindLast then begin
                        Date1 := SalBuffer."Posting Date";
                        Salary1 := SalBuffer.Amount;
                    end
                    else
                        exit(0);
                end;


                //MESSAGE('Salary 1 - %1\Date 1 - %3',Salary1,Date1);

                if Salary1 = 0 then
                    exit(0);
                if Salary2 = 0 then
                    exit(0);
                if Salary3 = 0 then
                    exit(0);


                if Date3 < CalcDate('-CM', Today) then
                    if Date3 < CalcDate('-1M-CM', Today) then
                        exit(0);



                NetSal := Salary1;
                if NetSal > Salary2 then
                    NetSal := Salary2;

                if NetSal > Salary3 then
                    NetSal := Salary3;


                //MESSAGE('Net %1',NetSal);

                LoanRep := 0;

                Loans.Reset;
                Loans.SetRange("Member No.", saccoAccount."Member No.");
                Loans.SetRange("Recovery Mode", Loans."recovery mode"::Salary);
                Loans.SetRange("Disbursement Date", 0D, Dmy2date(20, Date2dmy(Today, 2), Date2dmy(Today, 3)));
                Loans.SetRange("Mobile Loan", false);
                Loans.SetFilter("Outstanding Balance", '>0');
                if Loans.FindFirst then begin
                    repeat
                        Loans.CalcFields("Outstanding Balance");


                        IntAmt := 0;
                        case Loans."Interest Calculation Method" of
                            Loans."interest calculation method"::"Reducing Flat":
                                begin

                                    if ProdFac.Get(Loans."Loan Product Type") then begin
                                        //IF ProdFac."Flat Rate[ 1 %]"=TRUE THEN
                                        //  IntAmt:=ROUND((Loans."Approved Amount"*0.5)*(Loans.Installments+1)/(Loans.Installments*100),1,'=')
                                        //ELSE
                                        IntAmt := ROUND((Loans."Approved Amount" * 0.6) * (Loans.Installments + 1) / (Loans.Installments * 100), 1, '=');
                                    end;
                                end;

                            Loans."interest calculation method"::"Reducing Balance":
                                begin
                                    IntAmt := ROUND(Loans."Outstanding Balance" * (Loans.Interest / 1200), 1, '=');
                                end;

                            Loans."interest calculation method"::"Straight Line":
                                begin
                                    IntAmt := ROUND(Loans."Approved Amount" * (Loans.Interest / 1200), 1, '=');
                                end
                            else begin
                                IntAmt := ROUND(Loans."Outstanding Balance" * (Loans.Interest / 1200), 1, '=');
                            end;
                        end;

                        PrAmt := Loans."Loan Principle Repayment";

                        case Loans."Interest Calculation Method" of
                            Loans."interest calculation method"::"Reducing Flat",
                            Loans."interest calculation method"::"Reducing Balance",
                            Loans."interest calculation method"::"Straight Line":
                                begin
                                    PrAmt := (Loans."Approved Amount" / Loans.Installments);
                                end else begin
                                PrAmt := (Loans.Repayment - IntAmt);
                            end;
                        end;


                        /*
                        IF Loans."Adjusted Amount">0 THEN BEGIN
                            IF Loans."Adjusted Amount" > PrAmt THEN
                                PrAmt:=Loans."Adjusted Amount";
        
                        END;
                        */


                        if PrAmt > Loans."Outstanding Balance" then
                            PrAmt := Loans."Outstanding Balance";

                        LoanRep += PrAmt + IntAmt;

                    until Loans.Next = 0;
                end;



                Loans.Reset;
                Loans.SetRange("Member No.", saccoAccount."Member No.");
                Loans.SetRange("Recovery Mode", Loans."recovery mode"::Salary);
                Loans.SetRange("Mobile Loan", true);
                Loans.SetFilter("Outstanding Balance", '>0');
                if Loans.FindFirst then begin
                    repeat
                        Loans.CalcFields("Outstanding Balance");
                        LoanRep += Loans."Outstanding Balance";
                    until Loans.Next = 0;
                end;



                STODed := 0;
                StandingOrders.Reset;
                StandingOrders.SetRange(StandingOrders."Source Account No.", saccoAccount."No.");
                StandingOrders.SetRange(StandingOrders.Status, StandingOrders.Status::Approved);
                StandingOrders.SetFilter("End Date", '>%1', Today);
                if StandingOrders.Find('-') then begin
                    repeat
                        STODed := STODed + StandingOrders.Amount;
                    until StandingOrders.Next = 0;
                end;

                //MESSAGE('NetSal %1 LoanRep %2 STODed %3',NetSal,LoanRep,STODed);

                NetSal := NetSal - LoanRep - STODed;

                //MESSAGE('Net %1',NetSal);

                if NetSal < 0 then
                    NetSal := 0;

                NetSal := ROUND(LoanType."Net Salary Multiplier %" / 100 * NetSal);


                //MESSAGE('90% NetSal %1 ',NetSal);

                DepAcc.Reset;
                DepAcc.SetRange("Member No.", saccoAccount."Member No.");
                DepAcc.SetRange("Product Category", DepAcc."product category"::"Deposit Contribution");
                if DepAcc.FindFirst then begin
                    DepAcc.CalcFields("Balance (LCY)");
                    if NetSal > DepAcc."Balance (LCY)" then
                        NetSal := DepAcc."Balance (LCY)";

                    if NetSal < 0 then
                        NetSal := 0;
                end
                else begin
                    NetSal := 0;
                end;


                //MESSAGE('NetSal %1 DepAcc."Balance (LCY)" %2 ',NetSal,DepAcc."Balance (LCY)");


                /*
                        ExpInt := ROUND(ProdFac."Interest Rate (Max.)"/1200 * NetSal);

                        NetSal -= ExpInt;
                */


                MaxLoanAmount := LoanType."Maximum Loan Amount";

                if NetSal > MaxLoanAmount then
                    NetSal := MaxLoanAmount;


                Loans.Reset;
                Loans.SetRange("Member No.", saccoAccount."Member No.");
                Loans.SetRange("Recovery Mode", Loans."recovery mode"::Salary);
                Loans.SetRange("Mobile Loan", true);
                Loans.SetFilter("Outstanding Balance", '>0');
                if Loans.FindFirst then begin
                    LoanRep := 0;
                    repeat
                        Loans.CalcFields("Outstanding Balance");
                        LoanRep += Loans."Outstanding Balance";
                    until Loans.Next = 0;
                    if LoanRep + NetSal > MaxLoanAmount then
                        NetSal := 0;
                end;


                //MESSAGE('NetSal %1 MaxLoanAmount %2 ',NetSal,MaxLoanAmount);


                exit(ROUND(NetSal, 1, '<'));
            end;
        end;

        exit(0);

    end;


    procedure GenerateNewPin(MobileNo: Code[20]) PinSent: Boolean
    var
        SkyworldUSSDAuth: Record 52185476;
        NewPin: Text;
        NewIntPin: Integer;
        SavAcc: Record 52185730;
        Msg: Text;
    begin
        MobileNo := '+' + MobileNo;

        PinSent := false;
        SkyworldUSSDAuth.Reset;
        SkyworldUSSDAuth.SetRange("Mobile No.", MobileNo);
        if SkyworldUSSDAuth.FindFirst then begin
            Priority := 201;
            NewPin := RandomPIN;
            SavAcc.Reset;
            SavAcc.SetRange("Transactional Mobile No", SkyworldUSSDAuth."Mobile No.");
            if SavAcc.FindFirst then begin
                Msg := 'Dear ' + SavAcc.Name + ' your Harambee M-Cash PIN is ' + NewPin + '. Dial ' + UssdCode + ' to access this service.';
                SendSms(Source::MOBILE_PIN, SkyworldUSSDAuth."Mobile No.", Msg, SavAcc."No.", '', true, Priority, false);

                SkyworldUSSDAuth."PIN No." := NewPin;
                SkyworldUSSDAuth."Pin Sent" := true;
                SkyworldUSSDAuth."Reset PIN" := false;
                SkyworldUSSDAuth."Initial PIN Sent" := true;
                SkyworldUSSDAuth."Force PIN" := true;
                SkyworldUSSDAuth."PIN Encrypted" := false;
                SkyworldUSSDAuth.Modify;
                PinSent := true;
            end;

        end;
    end;


    procedure PinReset() CurrentUSSDPIN: Text
    var
        SkyworldUSSDAuth: Record 52185476;
        NewPin: Text;
        NewIntPin: Integer;
        SavAcc: Record 52185730;
        Msg: Text;
    begin

        SkyworldUSSDAuth.Reset;
        SkyworldUSSDAuth.SetRange(SkyworldUSSDAuth."Reset PIN", true);//IMSI blank
        if SkyworldUSSDAuth.FindFirst then begin
            Priority := 211;
            repeat
                NewPin := RandomPIN;
                SavAcc.Reset;
                SavAcc.SetRange("Product Type", '505');
                SavAcc.SetRange("Transactional Mobile No", SkyworldUSSDAuth."Mobile No.");
                if SavAcc.FindFirst then begin

                    Msg := 'Dear ' + SavAcc.Name + ' your Harambee Sacco Mobile Banking (M-Cash) start PIN is ' + NewPin + '. Dial ' + UssdCode + ' to access this service. For help Call 0709943000';
                    SendSms(Source::MOBILE_PIN, SkyworldUSSDAuth."Mobile No.", Msg, SavAcc."No.", '', true, Priority, false);

                    SkyworldUSSDAuth."PIN No." := NewPin;
                    SkyworldUSSDAuth."Date Updated" := Today;
                    SkyworldUSSDAuth."Pin Sent" := true;
                    SkyworldUSSDAuth."Reset PIN" := false;
                    SkyworldUSSDAuth."Initial PIN Sent" := false;
                    SkyworldUSSDAuth."Force PIN" := true;
                    SkyworldUSSDAuth."PIN Encrypted" := false;
                    SkyworldUSSDAuth."Charge Pin" := true;//remove
                    SkyworldUSSDAuth.Modify;

                end;
            until SkyworldUSSDAuth.Next = 0;
        end
        else begin
            RedirectSMS;
            //CallServiceFunction(1);
        end;
    end;


    procedure GetCurrentUSSDPIN("MobileNo.": Code[30]) CurrentUSSDPIN: Text
    var
        SkyworldUSSDAuth: Record 52185476;
    begin
        "MobileNo." := '+' + "MobileNo.";

        CurrentUSSDPIN := '';

        SkyworldUSSDAuth.Reset;
        SkyworldUSSDAuth.SetRange(SkyworldUSSDAuth."Mobile No.", "MobileNo.");
        if SkyworldUSSDAuth.FindFirst then begin
            CurrentUSSDPIN := SkyworldUSSDAuth."PIN No.";
        end;
    end;


    procedure UpdateCurrentUSSDPIN("MobileNo.": Code[30]; "NewPINNo.": Text) USSDPINUpdated: Boolean
    var
        SkyworldUSSDAuth: Record 52185476;
    begin
        "MobileNo." := '+' + "MobileNo.";
        USSDPINUpdated := false;

        SkyworldUSSDAuth.Reset;
        SkyworldUSSDAuth.SetRange(SkyworldUSSDAuth."Mobile No.", "MobileNo.");
        if SkyworldUSSDAuth.FindFirst then begin
            SkyworldUSSDAuth."PIN No." := "NewPINNo.";
            SkyworldUSSDAuth."Force PIN" := false;
            SkyworldUSSDAuth."Initial PIN Sent" := false;
            SkyworldUSSDAuth."Reset PIN" := false;
            SkyworldUSSDAuth.Modify;
            USSDPINUpdated := true;
        end;
    end;


    procedure CheckKYCByAccountNo(PhoneNo: Text[30]; AccountNo: Code[20]) KYCValid: Boolean
    var
        SavAcc: Record 52185730;
    begin
        PhoneNo := '+' + PhoneNo;

        KYCValid := false;

        SavAcc.Reset;
        SavAcc.SetRange("No.", AccountNo);
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        SavAcc.SetRange(Blocked, SavAcc.Blocked::" ");
        if SavAcc.FindFirst then begin
            KYCValid := true;
        end
    end;


    procedure GetMemberName(PhoneNo: Text[30]) Name: Text
    var
        SavAcc: Record 52185730;
        SkyworldUSSDAuth: Record 52185924;
    begin
        PhoneNo := '+' + PhoneNo;

        Name := '';
        SavAcc.Reset;
        SavAcc.SetRange(SavAcc."Transactional Mobile No", PhoneNo);
        if SavAcc.FindFirst then begin
            Name := SavAcc.Name;
        end;
    end;


    procedure ActiveMobileMember(PhoneNo: Text[30]) AccNo: Text
    var
        SavAcc: Record 52185730;
        SkyworldUSSDAuth: Record 52185476;
    begin
        PhoneNo := '+' + PhoneNo;

        AccNo := '';
        SkyworldUSSDAuth.Reset;
        SkyworldUSSDAuth.SetRange(SkyworldUSSDAuth."Mobile No.", PhoneNo);
        SkyworldUSSDAuth.SetRange("User Status", SkyworldUSSDAuth."user status"::Active);
        if SkyworldUSSDAuth.FindFirst then begin
            AccNo := SkyworldUSSDAuth."Account No.";
        end;
    end;


    procedure CheckKYCByNationalIDNo("PhoneNo.": Text[30]; "NationalIDNo.": Code[20]; CurrentPIN: Text) KYCValid: Boolean
    var
        SkyworldUSSDAuth: Record 52185476;
        SavAcc: Record 52185730;
    begin
        "PhoneNo." := '+' + "PhoneNo.";

        KYCValid := false;

        if StrLen("NationalIDNo.") > 11 then
            exit;

        SavAcc.Reset;
        SavAcc.SetRange(SavAcc."ID No.", "NationalIDNo.");
        SavAcc.SetRange("Transactional Mobile No", "PhoneNo.");
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        SavAcc.SetRange(SavAcc.Blocked, SavAcc.Blocked::" ");
        if SavAcc.FindFirst then begin
            SkyworldUSSDAuth.Reset;
            SkyworldUSSDAuth.SetRange(SkyworldUSSDAuth."Mobile No.", "PhoneNo.");
            SkyworldUSSDAuth.SetRange(SkyworldUSSDAuth."PIN No.", CurrentPIN);
            if SkyworldUSSDAuth.FindFirst then
                KYCValid := true;
        end
    end;


    procedure CheckForcePin(Phone: Text) ForcePin: Boolean
    var
        PinAuth: Record 52185476;
    begin
        Phone := '+' + Phone;
        ForcePin := false;

        PinAuth.Reset;
        PinAuth.SetRange(PinAuth."Mobile No.", Phone);
        PinAuth.SetRange(PinAuth."Force PIN", true);
        PinAuth.SetRange(PinAuth."Reset PIN", false);
        if PinAuth.FindFirst then begin
            ForcePin := true;
        end;
    end;


    procedure GetUnsetPin() Phone: Text
    var
        PinAuth: Record 52185476;
    begin
        Phone := '';

        PinAuth.Reset;
        PinAuth.SetRange(PinAuth."Reset PIN", true);
        PinAuth.SetRange(PinAuth."Force PIN", false);
        if PinAuth.FindFirst then begin
            Phone := PinAuth."Mobile No.";
            exit(Phone);

        end;
    end;


    procedure GetForcePin() Phone: Text
    var
        PinAuth: Record 52185476;
    begin
        Phone := '';

        PinAuth.Reset;
        PinAuth.SetRange(PinAuth."Reset PIN", true);
        PinAuth.SetRange(PinAuth."Force PIN", true);
        if PinAuth.FindFirst then begin
            Phone := PinAuth."Mobile No.";
            exit(Phone);
        end;
    end;


    procedure SetNewPin(PhoneNo: Text; OldPin: Text; NewPin: Text) Response: Text
    var
        SkyworldUSSDAuth: Record 52185476;
    begin
        PhoneNo := '+' + PhoneNo;

        Response := 'ERROR';

        SkyworldUSSDAuth.Reset;
        SkyworldUSSDAuth.SetRange("Mobile No.", PhoneNo);
        if SkyworldUSSDAuth.FindFirst then begin
            if SkyworldUSSDAuth."PIN No." = OldPin then begin
                if NewPin = '' then begin
                    Response := 'INVALID_NEW_PIN';
                end
                else begin
                    SkyworldUSSDAuth."PIN No." := NewPin;
                    SkyworldUSSDAuth.Modify;
                    Commit;
                    Response := 'SUCCESS';
                end;
            end
            else begin
                Response := 'INCORRECT_PIN';
            end;
        end
        else begin
            Response := 'INVALID_ACCOUNT';
        end;
    end;


    procedure SetForcePin(PhoneNo: Text; PIN: Text) Response: Boolean
    var
        SkyworldUSSDAuth: Record 52185476;
    begin
        PhoneNo := '+' + PhoneNo;

        Response := false;

        SkyworldUSSDAuth.Reset;
        SkyworldUSSDAuth.SetRange(SkyworldUSSDAuth."Mobile No.", PhoneNo);
        if SkyworldUSSDAuth.FindFirst then begin
            SkyworldUSSDAuth."PIN No." := PIN;
            SkyworldUSSDAuth."Reset PIN" := false;
            SkyworldUSSDAuth."Force PIN" := true;
            if SkyworldUSSDAuth.Modify then
                Response := true;
        end;
    end;


    procedure GetPinStatus(PhoneNo: Text) Response: Boolean
    var
        SkyworldUSSDAuth: Record 52185476;
    begin
        PhoneNo := '+' + PhoneNo;

        Response := false;

        SkyworldUSSDAuth.Reset;
        SkyworldUSSDAuth.SetRange(SkyworldUSSDAuth."Mobile No.", PhoneNo);
        if SkyworldUSSDAuth.FindFirst then begin
            Response := SkyworldUSSDAuth."Reset PIN";
        end;
    end;


    procedure ResendCurrentPin() Pin: Text
    var
        SkyworldUSSDAuth: Record 52185476;
    begin

        Pin := '';

        SkyworldUSSDAuth.Reset;
        SkyworldUSSDAuth.SetRange(SkyworldUSSDAuth."Pin Sent", false);
        SkyworldUSSDAuth.SetFilter(SkyworldUSSDAuth."PIN No.", '<>%1', '');
        if SkyworldUSSDAuth.FindFirst then begin
            Pin := SkyworldUSSDAuth."Mobile No." + ':::' + SkyworldUSSDAuth."PIN No.";
            SkyworldUSSDAuth."Pin Sent" := true;
            SkyworldUSSDAuth.Modify;
        end;
    end;


    procedure GetSMSNotSent() SMStxt: Text
    var
        smses: Record 52185764;
    begin
        SMStxt := '';

        //254706405989:::New Message Content:::MSGID4235

        smses.Reset;
        smses.SetRange(smses."Sent To Server", smses."sent to server"::No);
        smses.SetFilter(smses."Telephone No", '%1', '');
        if smses.FindFirst then begin
            smses.ModifyAll("Sent To Server", smses."sent to server"::Failed);
        end;

        smses.Reset;
        smses.SetRange(smses."Sent To Server", smses."sent to server"::No);
        smses.SetFilter(smses."SMS Message", '%1', '');
        if smses.FindFirst then begin
            smses.ModifyAll("Sent To Server", smses."sent to server"::Failed);
        end;



        smses.Reset;
        smses.SetRange(smses."Sent To Server", smses."sent to server"::No);
        //smses.SETFILTER(smses."Telephone No",'<>%1','');
        smses.SetFilter(smses."SMS Message", '<>%1', '');
        if smses.FindFirst then begin
            SMStxt := Format(smses."Telephone No") + ':::' + smses."SMS Message" + ':::' + Format(smses."Entry No");

        end;
    end;


    procedure UpdateSMSSent("EntryNo.": Integer; MsgSent: Boolean) SMSRecUpdated: Boolean
    var
        smses: Record 52185764;
    begin
        SMSRecUpdated := false;

        smses.Reset;
        smses.SetRange(smses."Entry No", "EntryNo.");
        if smses.FindFirst then begin
            if MsgSent then
                smses."Sent To Server" := smses."sent to server"::Yes
            else
                smses."Sent To Server" := smses."sent to server"::Failed;

            if smses.Modify then
                SMSRecUpdated := true;
        end;
    end;


    procedure AccountBalanceEnquiry(EntryCode: Text[20]; TransactionID: Code[20]; PhoneNo: Code[20]; PIN: Text; AccType: Text) Response: Text[1024]
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52185482;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        SLedger: Record 52185732;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        AccountBookBalance: Decimal;
        AccountAvailableBalance: Decimal;
        AccountToCharge: Code[20];
        Found: Boolean;
        MemberNo: Code[20];
        TransactionDate: DateTime;
        Loans: Record 52185729;
        LoanType: Text;
        BalStmt: Text;
        msg: Text;
        SafcomCharges: Record 52185475;
        SafcomFee: Decimal;
        BalEnqCharge: Decimal;
        LoanBalance: Decimal;
    begin
        MobileTrans.LockTable(true);
        PostingLog(TransactionID, 1);

        TransactionDate := CurrentDatetime;

        Response := 'ERROR';

        Found := false;


        PhoneNo := '+' + PhoneNo;

        if not CorrectPin(PhoneNo, PIN) then begin
            Response := 'INCORRECT_PIN';
            exit;
        end;


        MobileTrans.Reset;
        MobileTrans.SetRange("Entry No.", EntryCode);
        if MobileTrans.FindFirst then begin
            Response := '<Response>';
            Response += '<Status>TRANSACTION_EXISTS</Status>';
            Response += '<StatusDescription>Transaction Already Exists</StatusDescription>';
            Response += '<Reference>' + Format(EntryCode) + '</Reference>';
            Response += '</Response>';
            exit;
        end;



        AccountToCharge := '';
        MemberNo := '';

        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then begin
            PostingLog(TransactionID, 2);
            AccountToCharge := SavAcc."No.";
            MemberNo := SavAcc."Member No.";
            if SavAcc.Blocked <> SavAcc.Blocked::" " then
                exit;
        end;


        if MemberNo = '' then
            exit('Member No. Missing');

        if AccountToCharge = '' then
            exit('Account to charge missing');


        // Get Excise duty G/L
        ExciseDutyGL := GetExciseDutyGL();
        ExciseDutyRate := GetExciseRate();
        ExciseDuty := 0;

        SaccoAccount := '';
        SaccoFee := 0;
        VendorAccount := '';
        VendorCommission := 0;


        SMSAccount := '';
        SMSCharge := 0;
        PostingLog(TransactionID, 3);

        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Balance Enquiry");
        if CoopSetup.FindFirst then begin
            PostingLog(TransactionID, 4);

            SMSAccount := CoopSetup."SMS Account";
            SMSCharge := CoopSetup."SMS Charge";


            SaccoAccount := CoopSetup."Sacco Fee Account";
            SaccoFee := CoopSetup."Sacco Fee";
            VendorAccount := CoopSetup."Vendor Commission Account";
            VendorCommission := CoopSetup."Vendor Commission";

            TotalCharge := SaccoFee + VendorCommission + SMSCharge;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);

        end
        else begin
            Error('Setup Missing for %1', CoopSetup."Transaction Type");
        end;



        if SavAcc.Get(AccountToCharge) then begin
            PostingLog(TransactionID, 5);

            ProdFact.Get(SavAcc."Product Type");

            if (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::"Deposits Only") or
                (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::" ") then begin
                Error('The Account to Charge is not a Withdrawable Account');

            end;

            BalEnqCharge := 0;
            AccBal := GetAccountBalance(SavAcc."No.");
            if AccBal >= TotalCharge + ExciseDuty then begin
                PostingLog(TransactionID, 6);

                BalEnqCharge := TotalCharge + ExciseDuty;
                //BUser.GET(USERID);

                //BUser.TESTFIELD("Cashier Journal Template");
                //BUser.TESTFIELD("Cashier Journal Batch");

                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';

                GenJournalBatch.Reset;
                GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                GenJournalBatch.SetRange(Name, JBatch);
                if not GenJournalBatch.FindFirst then begin
                    GenJournalBatch.Init;
                    GenJournalBatch."Journal Template Name" := JTemplate;
                    GenJournalBatch.Name := JBatch;
                    GenJournalBatch.Description := 'Sky World Batch';
                    GenJournalBatch.Init;
                end;

                PostingLog(TransactionID, 7);

                MobileTrans.Init;
                MobileTrans."Entry No." := EntryCode;
                MobileTrans."Transaction ID" := TransactionID;
                MobileTrans."Session ID" := TransactionID;
                MobileTrans."Transaction Date" := Dt2Date(TransactionDate);
                MobileTrans."Transaction Time" := Dt2Time(TransactionDate);
                MobileTrans."Member Account" := SavAcc."No.";
                MobileTrans."Transaction Type" := MobileTrans."transaction type"::"Balance Enquiry";
                MobileTrans.Description := Format(MobileTrans."Transaction Type") + ': ' + AccType;
                MobileTrans.Insert;
                //PostingLog(TransactionID, 8);

                Response := 'SUCCESS';

            end else
                Response := 'INSUFFICIENT_BAL';
        end else
            Response := 'INVALID_ACCOUNT';


        if (Response = 'SUCCESS') then begin

            if SavAcc.Get(AccType) then begin

                ProdFact.Get(SavAcc."Product Type");

                HMember.Get(SavAcc."Member No.");
                FName := HMember."First Name";
                if FName = '' then
                    FName := HMember."Second Name";
                msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + ProdFact."USSD Product Name" + ' Balance as at ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) + ' is KES';

                SavAcc.CalcFields("Balance (LCY)");
                AccountBookBalance := SavAcc."Balance (LCY)";
                AccountAvailableBalance := GetAccountBalance(SavAcc."No.");
                if SavAcc."Product Type" = '505' then begin

                    SMSCharge := 0;

                    CoopSetup.Reset;
                    CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Balance Enquiry");
                    if CoopSetup.FindFirst then begin

                        SMSCharge := CoopSetup."SMS Charge";

                        SaccoFee := CoopSetup."Sacco Fee";

                        if CoopSetup."Charge Type" = CoopSetup."charge type"::Staggered then begin
                            SacAcc := '';
                            GetChargeAmount(CoopSetup."Staggered Charge Code", AccountAvailableBalance, SaccoFee, VendorCommission);
                        end;

                        SafcomCharges.Reset;
                        SafcomCharges.SetFilter(Charge, '>0');
                        SafcomCharges.SetFilter(Minimum, '<=%1', AccountAvailableBalance);
                        SafcomCharges.SetFilter(Maximum, '>=%1', AccountAvailableBalance);
                        if SafcomCharges.FindFirst then begin
                            SafcomFee := SafcomCharges.Charge;
                        end;

                        VendorCommission := CoopSetup."Vendor Commission";
                        TotalCharge := SaccoFee + VendorCommission + SafcomFee + SMSCharge;
                        ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);

                        //AccountBookBalance -= BalEnqCharge;
                        AccountAvailableBalance -= (TotalCharge + ExciseDuty);
                    end;
                end;


                BalStmt := Format(AccountAvailableBalance) + '.';
                msg += BalStmt;
                msg += NewLine + 'REF: ' + TransactionID;



                // if StrLen(msg + NewLine + MobileAppLink) < 250 then
                //     msg := msg + NewLine + MobileAppLink;


                Response := 'SUCCESS';
                Priority := 221;
                SendSms(Source::MBANKING, PhoneNo, msg, 'ACC_BAL', '', true, Priority, false);
            end
            else begin
                if AccType = 'BUSINESS' then begin
                    SavAcc.Reset;
                    SavAcc.SetRange("Member No.", MemberNo);
                    SavAcc.SetRange("Product Type", '513');
                    if SavAcc.FindFirst then begin
                        repeat
                            ProdFact.Get('513');
                            HMember.Get(MemberNo);
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";
                            msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + ProdFact."USSD Product Name" + '(' + SavAcc."Business Account Code" + ') Balance as at ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) + ' is KES';

                            SavAcc.CalcFields("Balance (LCY)");
                            AccountBookBalance := SavAcc."Balance (LCY)";
                            AccountAvailableBalance := GetAccountBalance(SavAcc."No.");

                            SavAcc.CalcFields("Balance (LCY)");
                            AccountBookBalance := SavAcc."Balance (LCY)";
                            AccountAvailableBalance := GetAccountBalance(SavAcc."No.");

                            BalStmt := Format(AccountAvailableBalance) + '.';
                            msg += BalStmt;
                            msg += NewLine + 'REF: ' + TransactionID;

                            // if StrLen(msg + NewLine + MobileAppLink) < 250 then
                            //     msg := msg + NewLine + MobileAppLink;

                            Response := 'SUCCESS';
                            Priority := 221;
                            SendSms(Source::MBANKING, PhoneNo, msg, 'ACC_BAL', '', true, Priority, false);
                        until SavAcc.Next = 0;
                    end;
                end else begin
                    Loans.Reset;
                    Loans.SetRange("Loan No.", AccType);
                    //Loans.SETFILTER("Outstanding Balance",'>0');
                    if Loans.Find('-') then begin
                        HMember.Get(Loans."Member No.");
                        FName := HMember."First Name";
                        if FName = '' then
                            FName := HMember."Second Name";

                        LoanType := Loans."Loan Product Type";

                        if ProdFact.Get(Loans."Loan Product Type") then
                            LoanType := ProdFact."USSD Product Name";

                        Loans.CalcFields("Outstanding Balance", "Outstanding Interest", "Loans Category-SASRA");

                        LoanBalance := ROUND((Loans."Outstanding Balance" + Loans."Outstanding Interest"), 1, '>');

                        msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + ProdFact."USSD Product Name" + ' balance as at ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) + ' is KES';
                        BalStmt := Format(LoanBalance) + '.' + NewLine + 'Status: ' + Format(Loans."Loans Category-SASRA");
                        msg += BalStmt;


                        msg += NewLine + 'REF: ' + TransactionID;



                        // if StrLen(msg + NewLine + MobileAppLink) < 250 then
                        //     msg := msg + NewLine + MobileAppLink;

                        Response := 'SUCCESS';
                        Priority := 231;
                        SendSms(Source::MBANKING, PhoneNo, msg, 'LOAN_BAL', '', true, Priority, false);

                    end;
                end;
            end;
        end;
        PostingLog(TransactionID, 9);
    end;


    procedure RandomPIN(): Text
    var
        NewPin: Text;
        NewIntPin: Integer;
    begin


        NewPin := '';
        NewIntPin := Random(9);
        NewPin += Format(NewIntPin);
        NewIntPin := Random(9);
        NewPin += Format(NewIntPin);
        NewIntPin := Random(9);
        NewPin += Format(NewIntPin);
        NewIntPin := Random(9);
        NewPin += Format(NewIntPin);


        exit(NewPin);
    end;


    procedure GetAccounts(PhoneNo: Code[20]; Source: Text) Response: Text[1024]
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52186142;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[10];
        Dim2: Code[10];
        SystCreated: Boolean;
        SLedger: Record 52185732;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        AccountBookBalance: Decimal;
        AccountAvailableBalance: Decimal;
        AccountToCharge: Code[20];
        Found: Boolean;
        MemberNo: Code[20];
        TransactionDate: DateTime;
        Loans: Record 52185729;
        LoanType: Text;
    begin
        PhoneNo := '+' + PhoneNo;
        Response := '';
        Found := false;

        MemberNo := '';
        AccountToCharge := '';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        if SavAcc.FindFirst then begin
            MemberNo := SavAcc."Member No.";
            AccountToCharge := SavAcc."No.";
        end;

        if MemberNo = '' then
            exit('Member No. Missing');


        if (Source = 'FOSA') or (Source = 'BOSA') or (Source = 'ALL') then begin

            ProdFact.Reset;
            ProdFact.SetFilter("Mobile Transaction", '<>%1', ProdFact."mobile transaction"::" ");
            if Source = 'BOSA' then
                ProdFact.SetFilter("Savings Type", '%1|%2', ProdFact."savings type"::"Non-Withdrawable", ProdFact."savings type"::"Retained Shares")
            else
                if Source = 'FOSA' then
                    ProdFact.SetRange("Savings Type", ProdFact."savings type"::Withdrawable);
            if ProdFact.FindFirst then begin
                repeat

                    SavAcc.Reset;
                    SavAcc.SetRange("Member No.", MemberNo);
                    SavAcc.SetFilter("Product Type", ProdFact."Product ID");
                    if SavAcc.Find('-') then begin
                        Response := '<Accounts>';
                        repeat
                            ProdFact.Get(SavAcc."Product Type");
                            SavAcc.CalcFields("Balance (LCY)");

                            if ProdFact."Mobile Transaction" <> ProdFact."mobile transaction"::" " then begin
                                Found := true;
                                Response += '<Account>';
                                Response += '<ProductID>' + ProdFact."Product ID" + '</ProductID>';
                                Response += '<ProductName>' + ProdFact."USSD Product Name" + '</ProductName>';
                                Response += '<AccountNo>' + SavAcc."No." + '</AccountNo>';
                                Response += '</Account>';
                            end;

                        until SavAcc.Next = 0;
                        Response += '</Accounts>';

                    end;
                until ProdFact.Next = 0;
            end;

        end
        else
            if Source = 'LOAN' then begin

                Loans.Reset;
                Loans.SetRange("Member No.", MemberNo);
                Loans.SetFilter("Outstanding Balance", '>0');
                if Loans.Find('-') then begin
                    Response := '<Accounts>';
                    repeat
                        LoanType := Loans."Loan Product Type";

                        ProdFact.Get(Loans."Loan Product Type");
                        LoanType := ProdFact."USSD Product Name";


                        Response += '<Account>';
                        Response += '<ProductID>' + ProdFact."Product ID" + '</ProductID>';
                        Response += '<ProductName>' + LoanType + '</ProductName>';
                        Response += '<AccountNo>' + Loans."Loan No." + '</AccountNo>';
                        Response += '</Account>';

                    until Loans.Next = 0;
                    Response += '</Accounts>';

                end;
            end;


        if not Found then
            Response := '';
    end;


    procedure GetAccountTransferRecipient(Criteria: Code[20]; Source: Text) Response: Text
    var
        SavAcc: Record 52185730;
        PFact: Record 52185690;
        xmlWriter: code[100];//dotnet XmlTextWriter;
        EncodingText: code[100];//dotnet Encoding;
        XMLDOMMgt: Codeunit "XML DOM Management";
        BodyContentXmlDoc: code[100];//dotnet XmlDocument;
        EnvelopeXmlNode: code[100];//dotnet XmlNode;
        CreatedXmlNode: code[100];//dotnet XmlNode;
    begin

        Response := '';


        if Source = 'Mobile' then begin

            if StrLen(Criteria) = 10 then
                if CopyStr(Criteria, 1, 1) = '0' then
                    Criteria := CopyStr(Criteria, 2, 9);

            SavAcc.Reset;
            SavAcc.SetFilter("Transactional Mobile No", '*' + Criteria);
            SavAcc.SetRange("Product Type", '505');
            SavAcc.SetFilter(Blocked, '<>%1', SavAcc.Blocked::All);
            if SavAcc.FindFirst then begin
                Response := SavAcc."No.";
            end
            else begin

                SavAcc.Reset;
                SavAcc.SetFilter("Mobile Phone No", '*%1', '*' + Criteria);
                SavAcc.SetRange("Product Type", '505');
                SavAcc.SetFilter(Blocked, '<>%1', SavAcc.Blocked::All);
                if SavAcc.FindFirst then begin
                    Response := SavAcc."No.";
                end;
            end
        end
        else
            if Source = 'ID' then begin
                if StrLen(Criteria) > 11 then
                    exit;

                SavAcc.Reset;
                SavAcc.SetRange("ID No.", Criteria);
                SavAcc.SetRange("Product Type", '505');
                SavAcc.SetFilter(Blocked, '<>%1', SavAcc.Blocked::All);
                if SavAcc.FindFirst then begin
                    Response := SavAcc."No.";
                end
            end
            else
                if Source = 'ACCOUNT' then begin
                    SavAcc.Reset;
                    SavAcc.SetRange("No.", Criteria);
                    if SavAcc.FindFirst then begin
                        Response := SavAcc."No.";
                    end
                end
        //Response:='';
    end;


    procedure ReverseWithdrawalRequest(EntryCode: Text[20]): Boolean
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        MpesaTrans: Record 52185482;
        TransAmt: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[10];
        Dim2: Code[10];
        SystCreated: Boolean;
        RunBal: Decimal;
        AccBal: Decimal;
        Loans: Record 52185729;
        IntAmt: Decimal;
        PrAmt: Decimal;
        ATMTrans: Record 52185755;
        SafcomAcc: Code[20];
        SafcomFee: Decimal;
        MobileWithdrawalsBuffer: Record 52185755;
        Msg: Text;
    begin
        MobileWithdrawalsBuffer.Reset;
        MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer."Trace ID", EntryCode);
        MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer.Source, MobileWithdrawalsBuffer.Source::"M-PESA");
        //MobileWithdrawalsBuffer.SETRANGE(MobileWithdrawalsBuffer."Account No",SavAcc."No.");
        //MobileWithdrawalsBuffer.SETRANGE(MobileWithdrawalsBuffer.Amount,Amount);
        MobileWithdrawalsBuffer.SetRange(Posted, false);
        MobileWithdrawalsBuffer.SetRange(Reversed, false);
        if MobileWithdrawalsBuffer.Find('-') then begin

            MobileWithdrawalsBuffer.Posted := true;
            MobileWithdrawalsBuffer."Posting Date" := Today;
            MobileWithdrawalsBuffer.Reversed := true;
            //MobileWithdrawalsBuffer."Date Reversed":=TODAY;
            MobileWithdrawalsBuffer."Customer Names" := CopyStr('Reversed By:' + UserId, 1, 100);
            MobileWithdrawalsBuffer.Modify;

            if SavAcc.Get(MobileWithdrawalsBuffer."Account No") then begin
                HMember.Get(SavAcc."Member No.");
                FName := HMember."First Name";
                if FName = '' then
                    FName := HMember."Second Name";
                Msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + MobileWithdrawalsBuffer.Description + ' of KES ' + Format(MobileWithdrawalsBuffer.Amount) +
                ' was unsuccessful. Please try again later' + NewLine + 'REF: ' + MobileWithdrawalsBuffer."Trace ID";
                SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", Msg, SavAcc."No.", '', true, Priority, false);
            end;

            exit(true);
        end
        else begin
            MobileWithdrawalsBuffer.Reset;
            MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer."Trace ID", EntryCode);
            MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer.Source, MobileWithdrawalsBuffer.Source::"M-PESA");
            //MobileWithdrawalsBuffer.SETRANGE(MobileWithdrawalsBuffer."Account No",SavAcc."No.");
            //MobileWithdrawalsBuffer.SETRANGE(MobileWithdrawalsBuffer.Amount,Amount);
            MobileWithdrawalsBuffer.SetRange(Posted, true);
            MobileWithdrawalsBuffer.SetRange(Reversed, true);
            if MobileWithdrawalsBuffer.Find('-') then begin

                if SavAcc.Get(MobileWithdrawalsBuffer."Account No") then begin
                    HMember.Get(SavAcc."Member No.");
                    FName := HMember."First Name";
                    if FName = '' then
                        FName := HMember."Second Name";
                    Msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'The ' + MobileWithdrawalsBuffer.Description + ' of KES ' + Format(MobileWithdrawalsBuffer.Amount) +
                    ' was unsuccessful. Please try again later' + NewLine + 'REF: ' + MobileWithdrawalsBuffer."Trace ID";
                    SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", Msg, SavAcc."No.", '', true, Priority, false);
                end;

                exit(true);
            end
        end;


        exit(false);
    end;


    procedure CreateMobileLoanAccount(MemberNo: Code[20]; ProdType: Code[20]) LoanAcc: Code[20]
    var
        ProdFac: Record 52185690;
        Loans: Record 52185729;
        Accounts: Record 52185731;
        Member: Record 52185700;
        AcctNo: Code[20];
    begin

        if ProdFac.Get(ProdType) then begin

            AcctNo := ProdFac."Account No. Prefix" + MemberNo + ProdFac."Account No. Suffix";



            if Accounts.Get(AcctNo) then
                exit(AcctNo);

            if Member.Get(MemberNo) then begin

                Accounts.Init;
                Accounts."No." := AcctNo;
                Accounts."Date of Birth" := Member."Date of Birth";
                Accounts.Name := Member."First Name" + ' ' + Member."Second Name" + ' ' + Member."Last Name";
                Accounts.Validate(Accounts.Name);
                Accounts."ID No." := Member."ID No.";
                Accounts."Mobile Phone No" := Member."Mobile Phone No";
                Accounts."Member No." := MemberNo;
                Accounts."Payroll/Staff No." := Member."Payroll/Staff No.";
                Accounts."Passport No." := Member."Passport No.";
                Accounts."Employer Code" := Member."Employer Code";
                Accounts.Status := Accounts.Status::New;
                Accounts."Account Category" := Member."Account Category";
                Accounts."Date of Birth" := Member."Date of Birth";
                Accounts."Current Address" := Member."Current Address";
                Accounts.City := Member.City;
                Accounts."Phone No." := Member."Phone No.";
                Accounts."Post Code" := Member."Post Code";
                Accounts.County := Member.County;
                Accounts."E-Mail" := Member."E-Mail";
                Accounts."Product Type" := ProdFac."Product ID";
                Accounts."Product Name" := ProdFac."Product Description";
                Accounts."Customer Posting Group" := ProdFac."Product Posting Group";
                Accounts.Insert(true);
            end;
            exit(AcctNo);
        end;
    end;


    procedure GetLoanLimit(PhoneNo: Code[20]; LoanProductType: Code[20]) Response: Text
    var
        SavAcc: Record 52185730;
        PFact: Record 52185690;
        xmlWriter: code[100];//dotnet XmlTextWriter;
        EncodingText: code[100];//dotnet Encoding;
        XMLDOMMgt: Codeunit "XML DOM Management";
        BodyContentXmlDoc: code[100];//dotnet XmlDocument;
        EnvelopeXmlNode: code[100];//dotnet XmlNode;
        CreatedXmlNode: code[100];//dotnet XmlNode;
        MaxLoan: Decimal;
        msg: Text;
    begin

        PhoneNo := '+' + PhoneNo;

        Response := 'ERROR';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        if SavAcc.FindFirst then begin
            //MESSAGE(SavAcc.Name);
            PFact.Get(LoanProductType);


            MaxLoan := GetLoanQualifiedAmount(SavAcc."No.", LoanProductType);


            HMember.Get(SavAcc."Member No.");
            FName := HMember."First Name";
            if FName = '' then
                FName := HMember."Second Name";


            msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + PFact."USSD Product Name" + ' Loan Limit as at ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) + '  is KES ' + Format(MaxLoan);

            if not SavAcc."Salary Through FOSA" then
                if PFact."Mobile Loan" then
                    msg += '. Channel salary through FOSA to access more';

            SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, LoanProductType, '', true, Priority, false);

            Response := 'SUCCESS';
            //MESSAGE(msg);
        end;
    end;


    procedure IMSIConfirm(PhoneNo: Text[30]; IMSI: Text): Boolean
    var
        SavAcc: Record 52185730;
        SkyworldUSSDAuth: Record 52185476;
        msg: Text;
    begin
        PhoneNo := '+' + PhoneNo;

        //IMSI
        if IMSI <> '' then begin
            SkyworldUSSDAuth.Reset;
            SkyworldUSSDAuth.SetRange(SkyworldUSSDAuth."Mobile No.", PhoneNo);
            if SkyworldUSSDAuth.FindFirst then begin
                if SkyworldUSSDAuth.IMSI = '' then begin
                    SkyworldUSSDAuth.IMSI := IMSI;
                    SkyworldUSSDAuth.Modify;
                    exit(true);
                end
                else begin
                    if SkyworldUSSDAuth.IMSI = IMSI then
                        exit(true);
                end;
            end;
        end;

        msg := 'Dear Member, please note that you have changed your sim card. Please visit one of our branches or contact us for assistance';

        Priority := 241;
        SendSms(Source::MBANKING, PhoneNo, msg, 'IMSI', '', true, Priority, false);

        exit(false);
    end;


    procedure UpdateIMSI(PhoneNo: Text[30]; IMSI: Text): Boolean
    var
        SavAcc: Record 52185730;
        SkyworldUSSDAuth: Record 52185476;
        msg: Text;
    begin
        PhoneNo := '+' + PhoneNo;

        //IMSI
        SkyworldUSSDAuth.Reset;
        SkyworldUSSDAuth.SetRange(SkyworldUSSDAuth."Mobile No.", PhoneNo);
        if SkyworldUSSDAuth.FindFirst then begin
            SkyworldUSSDAuth.IMSI := IMSI;
            SkyworldUSSDAuth.Modify;
            exit(true);
        end;

        exit(false);
    end;


    procedure TestLogin(MobileNo: Code[30]) Response: Text
    var
        SkyAuth: Record 52185476;
    begin
        MobileNo := '+' + MobileNo;

        SkyAuth.Reset;
        SkyAuth.SetRange(SkyAuth."Mobile No.", MobileNo);
        if SkyAuth.FindFirst then begin

            Response := '<Login>';

            Response += '<MobileNo>' + SkyAuth."Mobile No." + '</MobileNo>';
            Response += '<AccountNo>' + SkyAuth."Account No." + '</AccountNo>';
            Response += '<PIN>' + SkyAuth."PIN No." + '</PIN>';
            Response += '<ResetPin>' + Format(SkyAuth."Reset PIN") + '</ResetPin>';
            Response += '<Status>' + Format(SkyAuth."User Status") + '</Status>';
            Response += '<ForcePin>' + Format(SkyAuth."Force PIN") + '</ForcePin>';
            Response += '<IMSI>' + SkyAuth.IMSI + '</IMSI>';
            Response += '<IMEI>' + SkyAuth.IMEI + '</IMEI>';

            Response += '</Login>';

        end;
    end;


    procedure UpdateAuthAttempts(MobileNo: Code[30]; Type: Text; "Count": Integer; Tag: Text; "Action": Text; Validity: DateTime; ClearValidity: Boolean) Response: Text
    var
        SkyAuth: Record 52185476;
        SavAcc: Record 52185730;
    begin
        MobileNo := '+' + MobileNo;

        Response := 'ERROR';

        SkyAuth.Reset;
        SkyAuth.SetRange(SkyAuth."Mobile No.", MobileNo);
        if SkyAuth.FindFirst then begin
            if (Type = 'LOGIN') then begin
                SkyAuth."Login Attempts Action" := Action;
                SkyAuth."Login Attempts Count" := Count;
                SkyAuth."Login Attempts Tag" := Tag;
                if (ClearValidity) then begin
                    Clear(SkyAuth."Login Attempts Action Expiry");
                end
                else begin
                    SkyAuth."Login Attempts Action Expiry" := Validity;
                end;
                SkyAuth.Modify;
                Response := 'SUCCESS';
            end;
            if (Type = 'OTP') then begin
                SkyAuth."OTP Attempts Action" := Action;
                SkyAuth."OTP Attempts Count" := Count;
                SkyAuth."OTP Attempts Tag" := Tag;
                if (ClearValidity) then begin
                    Clear(SkyAuth."OTP Attempts Action Expiry");
                end
                else begin
                    SkyAuth."OTP Attempts Action Expiry" := Validity;
                end;
                SkyAuth.Modify;
                Response := 'SUCCESS';
            end;
        end
        else begin
            Response := 'NOT_FOUND';
        end;
    end;


    procedure GetUserLoginAttemptExpiry(MobileNo: Code[30]; Type: Text) Response: DateTime
    var
        SkyAuth: Record 52185476;
        CurrentTime: DateTime;
    begin
        MobileNo := '+' + MobileNo;

        Response := CurrentDatetime;

        SkyAuth.Reset;
        SkyAuth.SetRange(SkyAuth."Mobile No.", MobileNo);
        if SkyAuth.FindFirst then begin
            if (Type = 'LOGIN') then begin
                Response := SkyAuth."Login Attempts Action Expiry";
            end;
            if (Type = 'OTP') then begin
                Response := SkyAuth."OTP Attempts Action Expiry";
            end;
        end;
    end;


    procedure GetUserLoginAttemptAction(MobileNo: Code[30]; Type: Text) Response: Code[10]
    var
        SkyAuth: Record 52185476;
    begin
        MobileNo := '+' + MobileNo;

        Response := '';

        SkyAuth.Reset;
        SkyAuth.SetRange(SkyAuth."Mobile No.", MobileNo);
        if SkyAuth.FindFirst then begin
            if (Type = 'LOGIN') then begin
                if (SkyAuth."Login Attempts Action" = 'SUSPEND') then begin
                    if (SkyAuth."Login Attempts Action Expiry" > CurrentDatetime) then begin
                        Response := 'SUSPENDED'
                    end;
                end;
            end;
            if (Type = 'OTP') then begin
                if (SkyAuth."OTP Attempts Action" = 'SUSPEND') then begin
                    if (SkyAuth."OTP Attempts Action Expiry" > CurrentDatetime) then begin
                        Response := 'SUSPENDED'
                    end;
                end;
            end;
        end;
    end;


    procedure GetUserLoginAttemptCount(MobileNo: Code[30]; Type: Text) Response: Integer
    var
        SkyAuth: Record 52185476;
    begin
        MobileNo := '+' + MobileNo;

        Response := 0;

        SkyAuth.Reset;
        SkyAuth.SetRange(SkyAuth."Mobile No.", MobileNo);
        if SkyAuth.FindFirst then begin
            if (Type = 'LOGIN') then begin
                Response := SkyAuth."Login Attempts Count";
            end;
            if (Type = 'OTP') then begin
                Response := SkyAuth."OTP Attempts Count";
            end;
        end
        else begin
            Response := 0;
        end;
    end;


    procedure UserCheck(MobileNo: Code[30]; IMSI_IMEI: Code[50]; USSD: Boolean; SessionID: Code[20]) Response: Text
    var
        SkyAuth: Record 52185476;
        SavAcc: Record 52185730;
    begin
        MobileNo := '+' + MobileNo;

        Response := 'ERROR';

        SkyAuth.Reset;
        SkyAuth.SetRange(SkyAuth."Mobile No.", MobileNo);
        if SkyAuth.FindFirst then begin
            if (SkyAuth."User Status" = SkyAuth."user status"::Inactive) or (SkyAuth."User Status" = SkyAuth."user status"::" ") then
                Response := 'BLOCKED'
            else begin
                if ((SkyAuth."Login Attempts Action" = 'SUSPEND') or (SkyAuth."OTP Attempts Action" = 'SUSPEND')) then begin
                    if ((SkyAuth."Login Attempts Action" = 'SUSPEND') and (SkyAuth."OTP Attempts Action" <> 'SUSPEND')) then begin
                        if (SkyAuth."Login Attempts Action Expiry" > CurrentDatetime) then begin
                            Response := 'SUSPENDED';
                            exit(Response);
                        end;
                    end;
                    if ((SkyAuth."Login Attempts Action" <> 'SUSPEND') and (SkyAuth."OTP Attempts Action" = 'SUSPEND')) then begin
                        if (SkyAuth."OTP Attempts Action Expiry" > CurrentDatetime) then begin
                            Response := 'SUSPENDED';
                            exit(Response);
                        end;
                    end;
                    if ((SkyAuth."Login Attempts Action" = 'SUSPEND') and (SkyAuth."OTP Attempts Action" = 'SUSPEND')) then begin
                        if (SkyAuth."Login Attempts Action Expiry" > SkyAuth."OTP Attempts Action Expiry") then begin
                            if (SkyAuth."Login Attempts Action Expiry" > CurrentDatetime) then begin
                                Response := 'SUSPENDED';
                                exit(Response);
                            end;
                        end
                        else begin
                            if (SkyAuth."OTP Attempts Action Expiry" > CurrentDatetime) then begin
                                Response := 'SUSPENDED';
                                exit(Response);
                            end;
                        end;
                    end;
                end;
                if USSD then begin
                    if (IMSI_IMEI = '') then begin
                        Response := 'INVALID_IMSI';
                        exit;
                    end;
                    if (SkyAuth.IMSI = '') or (SkyAuth.IMSI = IMSI_IMEI) then begin
                        Response := 'ACTIVE';
                    end
                    else begin
                        Response := 'INVALID_IMSI';
                    end;
                end
                else begin
                    if (IMSI_IMEI = '') then begin
                        Response := 'INVALID_IMEI';
                        exit;
                    end;
                    if not SkyAuth."Mobile App Activated" then begin
                        Response := 'MOBILEAPP_INACTIVE';
                        exit;
                    end;

                    if (SkyAuth.IMEI = IMSI_IMEI) then begin
                        Response := 'ACTIVE';
                    end
                    else begin
                        Response := 'INVALID_IMEI';
                    end;
                end;
            end;


            SavAcc.Reset;
            SavAcc.SetRange("Transactional Mobile No", MobileNo);
            if SavAcc.FindFirst then
                if SavAcc.Blocked <> SavAcc.Blocked::" " then
                    Response := 'BLOCKED';

            SavAcc.Reset;
            SavAcc.SetRange("Transactional Mobile No", MobileNo);
            SavAcc.SetRange(Status, SavAcc.Status::Deceased);
            if SavAcc.FindFirst then
                Response := 'DECEASED';


            SavAcc.Reset;
            SavAcc.SetRange("Transactional Mobile No", MobileNo);
            SavAcc.SetFilter(Status, '<>%1&<>%2&<>%3', SavAcc.Status::Active, SavAcc.Status::New, SavAcc.Status::Dormant);
            if SavAcc.FindFirst then
                Response := 'BLOCKED';

            /*SavAcc.RESET;
            SavAcc.SETRANGE("Transactional Mobile No",MobileNo);
            SavAcc.SETFILTER(Status,'<>%1&<>%2<>%3',SavAcc.Status::Active,SavAcc.Status::New,SavAcc.Status::Dormant);
            IF SavAcc.FINDFIRST THEN
                Response := 'BLOCKED';*/


            SavAcc.Reset;
            SavAcc.SetRange("Transactional Mobile No", MobileNo);
            if SavAcc.FindFirst then
                if SavAcc.Count <> 1 then
                    Response := 'BLOCKED';


            SavAcc.Reset;
            SavAcc.SetRange("Transactional Mobile No", MobileNo);
            if SavAcc.FindFirst then begin
                if CheckBlackList(SavAcc."Transactional Mobile No", SavAcc."No.", SavAcc.Name) then
                    Response := 'BLOCKED';
            end;


        end
        else begin
            Response := 'NOT_FOUND';
        end;

        if not USSD then begin
            if Response = 'ACTIVE' then begin
                Response := MobileAppLogin(SessionID, MobileNo);
            end;
        end;

    end;


    procedure MAPPSetIMEI(MobileNo: Code[30]; IMEI: Text) Response: Text
    var
        SkyAuth: Record 52185476;
    begin
        MobileNo := '+' + MobileNo;

        Response := 'ERROR';

        SkyAuth.Reset;
        SkyAuth.SetRange(SkyAuth."Mobile No.", MobileNo);

        if SkyAuth.FindFirst then begin
            if not (IMEI = '') then begin
                SkyAuth.IMEI := IMEI;
                SkyAuth."Mobile App Activated" := true;
                SkyAuth.Modify;
                Response := 'SUCCESS';
            end;

        end
        else begin
            Response := 'NOT_FOUND';
        end;
    end;


    procedure USSDLogin(MobileNo: Code[30]; PIN: Text; IMSI_IMEI: Text; USSD: Boolean; SessionID: Code[20]) Response: Text
    var
        SkyAuth: Record 52185476;
        SavAcc: Record 52185730;
        Name: Text;
        AttemptsCount: Integer;
    begin
        MobileNo := '+' + MobileNo;

        Response := 'ERROR';
        Name := ' ';

        SkyAuth.Reset;
        SkyAuth.SetRange(SkyAuth."Mobile No.", MobileNo);
        if SkyAuth.FindFirst then begin
            SavAcc.Reset;
            SavAcc.SetRange(SavAcc."No.", SkyAuth."Account No.");
            if (SavAcc.FindFirst) then begin
                Name := SavAcc.Name;
            end;

            if ((SkyAuth."Login Attempts Action" = 'SUSPEND') or (SkyAuth."OTP Attempts Action" = 'SUSPEND')) then begin
                if ((SkyAuth."Login Attempts Action" = 'SUSPEND') and (SkyAuth."OTP Attempts Action" <> 'SUSPEND')) then begin
                    if (SkyAuth."Login Attempts Action Expiry" > CurrentDatetime) then begin
                        Response := 'SUSPENDED' + ':::' + Name + ':::' + Format(SkyAuth."Login Attempts Action Expiry") + ':::' + Format(SkyAuth."Login Attempts Count");
                        exit(Response);
                    end;
                end;
                if ((SkyAuth."Login Attempts Action" <> 'SUSPEND') and (SkyAuth."OTP Attempts Action" = 'SUSPEND')) then begin
                    if (SkyAuth."OTP Attempts Action Expiry" > CurrentDatetime) then begin
                        Response := 'SUSPENDED' + ':::' + Name + ':::' + Format(SkyAuth."OTP Attempts Action Expiry") + ':::' + Format(SkyAuth."OTP Attempts Count");
                        exit(Response);
                    end;
                end;
                if ((SkyAuth."Login Attempts Action" = 'SUSPEND') and (SkyAuth."OTP Attempts Action" = 'SUSPEND')) then begin
                    if (SkyAuth."Login Attempts Action Expiry" > SkyAuth."OTP Attempts Action Expiry") then begin
                        if (SkyAuth."Login Attempts Action Expiry" > CurrentDatetime) then begin
                            Response := 'SUSPENDED' + ':::' + Name + ':::' + Format(SkyAuth."Login Attempts Action Expiry") + ':::' + Format(SkyAuth."Login Attempts Count");
                            exit(Response);
                        end;
                    end
                    else begin
                        if (SkyAuth."OTP Attempts Action Expiry" > CurrentDatetime) then begin
                            Response := 'SUSPENDED' + ':::' + Name + ':::' + Format(SkyAuth."OTP Attempts Action Expiry") + ':::' + Format(SkyAuth."OTP Attempts Count");
                            exit(Response);
                        end;
                    end;
                end;
            end;

            if USSD and (SkyAuth."Force PIN") then begin
                Response := 'SET_PIN';
            end
            else begin

                if USSD then begin
                    if (SkyAuth."PIN No." = PIN) and ((SkyAuth.IMSI = '') or (SkyAuth.IMSI = IMSI_IMEI)) then begin
                        Response := 'SUCCESS';
                        if (SkyAuth.IMSI = '') then begin
                            SkyAuth.IMSI := IMSI_IMEI;
                            SkyAuth.Modify;
                        end;
                    end
                    else begin
                        if (SkyAuth."PIN No." <> PIN) then begin
                            Response := 'INCORRECT_PIN';
                        end;
                    end;
                end
                else begin
                    if (SkyAuth."User Status" = SkyAuth."user status"::Inactive) or (SkyAuth."User Status" = SkyAuth."user status"::" ") then begin
                        Response := 'BLOCKED';
                        exit;
                    end;

                    if (SkyAuth."PIN No." = PIN) then begin
                        Response := 'SUCCESS';
                        if (SkyAuth."Mobile App KYC Login Enabled") then begin
                            if not (SkyAuth."Mobile App Activated" = true) then begin
                                Response := 'MOBILEAPP_INACTIVE_WITH_KYC';
                            end
                            else
                                if not (SkyAuth.IMEI = IMSI_IMEI) then begin
                                    Response := 'INVALID_IMEI_WITH_KYC';
                                end;
                        end
                        else begin
                            if not (SkyAuth."Mobile App Activated" = true) then begin
                                Response := 'MOBILEAPP_INACTIVE';
                            end
                            else
                                if not (SkyAuth.IMEI = IMSI_IMEI) then begin
                                    Response := 'INVALID_IMEI';
                                end;
                        end;
                    end
                    else
                        if (IMSI_IMEI = '') then begin
                            Response := 'INVALID_IMEI';
                        end
                        else begin
                            if not SkyAuth."Mobile App Activated" then
                                Response := 'MOBILEAPP_INACTIVE'
                            else
                                Response := 'INCORRECT_PIN';

                        end;
                    if (SkyAuth."PIN No." <> PIN) then begin
                        Response := 'INCORRECT_PIN';
                    end;
                end;
            end;
        end
        else begin
            Response := 'NOT_FOUND';
        end;

        if not USSD then begin
            if Response = 'SUCCESS' then begin
                MobileAppLogin(SessionID, MobileNo);
            end;
        end;

        if (Response = 'SUCCESS') then begin
            SkyAuth."Login Attempts Action" := 'NONE';
            SkyAuth."Login Attempts Tag" := '';
            Clear(SkyAuth."Login Attempts Action Expiry");
            SkyAuth."Login Attempts Count" := 0;
            SkyAuth.Modify;
        end;

        if (Response = 'INCORRECT_PIN') then begin
            SkyAuth."Login Attempts Count" := SkyAuth."Login Attempts Count" + 1;
            SkyAuth.Modify;
            AttemptsCount := SkyAuth."Login Attempts Count";
            Response := Response + ':::' + Format(AttemptsCount) + ':::' + Name;
        end;
    end;


    procedure ValidateKYCdetails(MobileNo: Code[30]; IDNo: Code[50]; NewPIN: Text; OTCPIN: Text; IMEI_IMSI: Text; USSD: Boolean) Response: Text
    var
        SkyAuth: Record 52185476;
        SavAcc: Record 52185730;
        NewIMEI_IMSI: Code[20];
    begin
        MobileNo := '+' + MobileNo;

        Response := 'ERROR';


        if StrLen(IDNo) > 11 then
            exit;

        SavAcc.Reset;
        SavAcc.SetRange("ID No.", IDNo);
        SavAcc.SetRange("Transactional Mobile No", MobileNo);
        if SavAcc.FindFirst then begin

            SkyAuth.Reset;
            SkyAuth.SetRange("Mobile No.", MobileNo);
            if SkyAuth.FindFirst then begin
                if SkyAuth."PIN No." <> OTCPIN then
                    Response := 'INCORRECT_PIN'
                else begin

                    if NewPIN = '' then
                        Response := 'INVALID_NEW_PIN'
                    else begin
                        SkyAuth."PIN No." := NewPIN;
                        SkyAuth."Force PIN" := false;

                        if USSD then begin
                            if SkyAuth.IMSI = '' then
                                SkyAuth.IMSI := IMEI_IMSI;
                        end
                        else begin
                            if SkyAuth.IMEI = '' then
                                SkyAuth.IMEI := IMEI_IMSI;
                        end;
                        SkyAuth.Modify;
                        Response := 'SUCCESS';
                    end;
                end;
            end
            else begin
                Response := 'INVALID_ACCOUNT';
            end;

        end
        else begin
            Response := 'INVALID_ACCOUNT';
        end;
    end;


    procedure CorrectPin(MobileNo: Code[30]; PIN: Text) Response: Boolean
    var
        SkyAuth: Record 52185476;
    begin


        Response := false;

        SkyAuth.Reset;
        SkyAuth.SetRange(SkyAuth."Mobile No.", MobileNo);
        if SkyAuth.FindFirst then begin
            if SkyAuth."PIN No." = PIN then
                Response := true
            else
                Response := false;
        end;
    end;


    procedure LoanMiniStatement(EntryCode: Text[20]; TransactionID: Code[20]; MaxNumberRows: Integer; LoanType: Code[20]; MobileNo: Code[20]; Pin: Text) Response: Text
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        PhoneNo: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52185482;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        CLedger: Record 52185733;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        TransactionDate: DateTime;
        Msg: Text;
        Stmt: Text;
        StatementAccount: Code[20];
        AccountToCharge: Code[20];
        MemberNo: Code[20];
        Loans: Record 52185729;
    begin
        MobileTrans.LockTable(true);
        TransactionDate := CurrentDatetime;
        MobileNo := '+' + MobileNo;

        Response := 'ERROR';

        if not CorrectPin(MobileNo, Pin) then begin
            Response := 'INCORRECT_PIN';
            exit;
        end;


        // Get Excise duty G/L
        ExciseDutyGL := GetExciseDutyGL();
        ExciseDutyRate := GetExciseRate();
        ExciseDuty := 0;

        SaccoAccount := '';
        SaccoFee := 0;
        VendorAccount := '';
        VendorCommission := 0;

        MemberNo := '';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", MobileNo);
        if SavAcc.FindFirst then
            MemberNo := SavAcc."Member No.";

        if SavAcc.Blocked <> SavAcc.Blocked::" " then
            exit;

        StatementAccount := '';
        AccountToCharge := '';

        Loans.Reset;
        Loans.SetRange("Loan No.", LoanType);
        if Loans.FindFirst then
            StatementAccount := Loans."Loan No.";

        SavAcc.Reset;
        SavAcc.SetRange("Member No.", MemberNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then
            AccountToCharge := SavAcc."No.";

        SMSAccount := '';
        SMSCharge := 0;

        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Mini-Statement");
        if CoopSetup.FindFirst then begin

            SMSAccount := CoopSetup."SMS Account";
            SMSCharge := CoopSetup."SMS Charge";


            SaccoAccount := CoopSetup."Sacco Fee Account";
            SaccoFee := CoopSetup."Sacco Fee";
            VendorAccount := CoopSetup."Vendor Commission Account";
            VendorCommission := CoopSetup."Vendor Commission";

            TotalCharge := SaccoFee + VendorCommission + SMSCharge;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
        end
        else begin
            Error('Setup Missing for %1', CoopSetup."Transaction Type");
        end;


        //PhoneNo:='+'+MobileNo;

        SavAcc.Reset;
        SavAcc.SetRange("No.", AccountToCharge);
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        if SavAcc.FindFirst then begin


            ProdFact.Get(SavAcc."Product Type");

            if (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::"Deposits Only") or
                (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::" ") then begin
                Error('The Account to Charge is not a Withdrawable Account');
            end;



            AccBal := GetAccountBalance(SavAcc."No.");
            if AccBal >= TotalCharge + ExciseDuty then begin

                //BUser.GET(USERID);

                //BUser.TESTFIELD("Cashier Journal Template");
                //BUser.TESTFIELD("Cashier Journal Batch");

                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';

                GenJournalBatch.Reset;
                GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                GenJournalBatch.SetRange(Name, JBatch);
                if not GenJournalBatch.FindFirst then begin
                    GenJournalBatch.Init;
                    GenJournalBatch."Journal Template Name" := JTemplate;
                    GenJournalBatch.Name := JBatch;
                    GenJournalBatch.Description := 'Sky World Batch';
                    GenJournalBatch.Init;
                end;

                MobileTrans.Init;
                MobileTrans."Entry No." := EntryCode;
                MobileTrans."Transaction ID" := TransactionID;
                MobileTrans."Session ID" := TransactionID;
                MobileTrans."Transaction Date" := Dt2Date(TransactionDate);
                MobileTrans."Transaction Time" := Dt2Time(TransactionDate);
                MobileTrans."Member Account" := SavAcc."No.";
                MobileTrans."Statement Max Rows" := MaxNumberRows;
                //MobileTrans."Statement Start Date":=StartDate;
                //MobileTrans."Statement End Date":=EndDate;
                MobileTrans."Account to Check" := StatementAccount;
                MobileTrans."Transaction Type" := MobileTrans."transaction type"::"Mini-Statement";
                MobileTrans.Description := Format(MobileTrans."Transaction Type");
                MobileTrans.Insert;


                MobileTrans.Reset;
                MobileTrans.SetRange("Transaction ID", TransactionID);
                MobileTrans.SetRange(Posted, false);
                if MobileTrans.FindFirst then begin

                    DocNo := MobileTrans."Transaction ID";
                    PDate := MobileTrans."Transaction Date";
                    AccNo := MobileTrans."Member Account";
                    ExtDoc := '';
                    LoanNo := '';
                    TransType := Transtype::" ";
                    Dim1 := SavAcc."Global Dimension 1 Code";
                    Dim2 := SavAcc."Global Dimension 2 Code";
                    SystCreated := true;

                    SaccoTrans.InitJournal(JTemplate, JBatch);


                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(MobileTrans.Description, 1, 50), Balacctype::"G/L Account",
                                  '', TotalCharge + ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    /*
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                                  '',SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccountToCharge,COPYSTR('SMS Charges',1,50),BalAccType::"G/L Account",
                                  SMSAccount,SMSCharge,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Excise Duty',1,50),BalAccType::"G/L Account",
                                  ExciseDutyGL,ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    */

                    AccNo := VendorAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := Transtype::" ";

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Vendor, AccNo, CopyStr(MobileTrans.Description + ' Commission', 1, 50), Balacctype::"G/L Account",
                                  '', -VendorCommission, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    AccNo := SaccoAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := Transtype::" ";

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", AccNo, CopyStr(MobileTrans.Description + ' Fee', 1, 50), Balacctype::"G/L Account",
                                  '', -ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", ExciseDutyGL, CopyStr(MobileTrans.Description + ' Excise Duty', 1, 50), Balacctype::"G/L Account",
                                  '', -SaccoFee, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    MobileTrans.Posted := true;
                    MobileTrans."Posted By" := UserId;
                    MobileTrans."Date Posted" := Today;
                    MobileTrans.Modify;

                    SaccoTrans.PostJournal(JTemplate, JBatch);

                end
                else begin
                    Error('Transaction Not Found');
                end;

            end
            else begin
                Response := 'INSUFFICIENT_BAL';
            end;


            if Response = 'ERROR' then begin
                MobileTrans.Reset;
                MobileTrans.SetRange("Transaction ID", TransactionID);
                //MobileTrans.SETRANGE(Posted,TRUE);
                if MobileTrans.FindFirst then begin
                    Loans.Get(StatementAccount);

                    CLedger.Reset;
                    CLedger.SetCurrentkey("Entry No.");
                    CLedger.Ascending(false);
                    CLedger.SetRange("Customer No.", Loans."Loan Account");
                    CLedger.SetRange(Reversed, false);
                    if CLedger.FindFirst then begin
                        AccBal := 0;
                        ProdFact.Get(Loans."Loan Product Type");
                        HMember.Get(SavAcc."Member No.");
                        FName := HMember."First Name";
                        if FName = '' then
                            FName := HMember."Second Name";
                        Msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + ProdFact."USSD Product Name" + ' Statement as at ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) + ': ';
                        repeat
                            LedgerCount += 1;
                            Stmt := NewLine + Format(CLedger."Posting Date") + ': ' + Format(CLedger."Transaction Type") + ': ' + Format(CLedger."Amount (LCY)") + ';';
                            if StrLen(Msg + Stmt) < 150 then begin
                                Msg += Stmt;
                            end;

                        until (CLedger.Next = 0) or (CLedger.Count = MaxNumberRows);
                        Msg += '.' + NewLine + 'REF: ' + TransactionID;
                        Priority := 221;
                        SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", Msg, StatementAccount, '', true, Priority, false);

                        Response := 'SUCCESS';
                    end;
                end;
            end;
        end
        else begin
            Response := 'INVALID_ACCOUNT';
        end;

    end;


    procedure SendSmsWithID(Source: Option NEW_MEMBER,NEW_ACCOUNT,LOAN_ACCOUNT_APPROVAL,DEPOSIT_CONFIRMATION,CASH_WITHDRAWAL_CONFIRM,LOAN_APPLICATION,LOAN_APPRAISAL,LOAN_GUARANTORS,LOAN_REJECTED,LOAN_POSTED,LOAN_DEFAULTED,SALARY_PROCESSING,TELLER_CASH_DEPOSIT,TELLER_CASH_WITHDRAWAL,TELLER_CHEQUE_DEPOSIT,FIXED_DEPOSIT_MATURITY,INTERACCOUNT_TRANSFER,ACCOUNT_STATUS,STATUS_ORDER,EFT_EFFECTED,ATM_APPLICATION_FAILED,ATM_COLLECTION,MBANKING,MEMBER_CHANGES,CASHIER_BELOW_LIMIT,CASHIER_ABOVE_LIMIT,INTERNETBANKING,CRM,MOBILE_PIN,WITHDRAWAL; Telephone: Text[200]; Textsms: Text; Reference: Text[30]; AccNo: Text[30]; Chargeable: Boolean; Priority: Integer; ChargeMember: Boolean; RequestApplication: Text[30]; RequestCorrelationID: Text[50]; SourceApplication: Text[30])
    var
        EntryNo: Integer;
        SkySMS: Record 52185478;
        Category: Code[100];
        SMSLength: Integer;
        SMSLoop: Integer;
        CurrSMS: Text;
        NewSMS: Text;
        SkySMSN: Record 52185505;
    begin

        EntryNo := EntryNo + 1;


        if StrLen(Telephone) = 13 then begin
            Telephone := CopyStr(Telephone, 2, 12);
        end;

        if StrLen(Telephone) = 10 then begin
            if CopyStr(Telephone, 1, 1) = '0' then
                Telephone := '254' + CopyStr(Telephone, 2, 9);
        end;

        if StrLen(Telephone) = 9 then begin
            if CopyStr(Telephone, 1, 1) = '7' then
                Telephone := '254' + Telephone
        end;



        Category := Format(Source);

        Priority := GetSMSPriority(Category);

        if Priority = 0 then
            Priority := 250;

        GeneralLedgerSetup.Get;

        if StrLen(Telephone) = 12 then begin


            SkySMS.Init;
            SkySMS.originator_id := CreateGuid;
            SkySMS.msg_id := 0;
            GeneralLedgerSetup.TestField("SMS Sender ID");
            GeneralLedgerSetup.TestField("SMS Sender Name");

            SkySMS.msg_product_id := GeneralLedgerSetup."SMS Sender ID";
            SkySMS.msg_provider_code := '0';
            SkySMS.msg_charge := '';
            SkySMS.msg_status_code := 10;
            SkySMS.msg_status_description := 'New MSG';
            SkySMS.msg_status_date := CurrentDatetime;
            SkySMS.sender := GeneralLedgerSetup."SMS Sender Name";
            SkySMS.receiver := Telephone;
            SkySMS.msg := Textsms;
            SkySMS.msg_type := 'MT';
            SkySMS.msg_source_reference := '';
            SkySMS.msg_destination_reference := '';
            SkySMS.msg_xml_data := '<OTHER_DETAILS/>';
            SkySMS.msg_category := Category;
            SkySMS.msg_priority := Priority;
            SkySMS.msg_mode := 'SAF';

            SkySMS.msg_send_count := 0;
            SkySMS.schedule_msg := 'NO';
            SkySMS.date_scheduled := CurrentDatetime;
            SkySMS.msg_send_integrity_hash := '';
            //SkySMS.msg_response_date:=CURRENTDATETIME;
            //SkySMS.msg_response_xml_data:='';
            //SkySMS.msg_response_integrity_hash:='';
            SkySMS.transaction_date := CurrentDatetime;
            SkySMS.date_created := CurrentDatetime;
            SkySMS."SMS Date" := Today;
            if Chargeable then
                SkySMS."Account To Charge" := AccNo;

            SkySMS.msg_request_application := RequestApplication;
            SkySMS.msg_request_correlation_id := RequestCorrelationID;
            SkySMS.msg_source_application := SourceApplication;

            SkySMS.transaction_id := 0;
            SkySMS.server_id := 0;
            SkySMS.msg_charge_applied := '';
            SkySMS.msg_format := 'TEXT';
            SkySMS.msg_command := 'BulkSMS';
            SkySMS.msg_sensitivity := 'NORMAL';
            SkySMS.msg_response_description := '';
            SkySMS.msg_result_description := '';
            SkySMS.msg_result_xml_data := '';
            SkySMS.msg_result_date := CurrentDatetime;
            SkySMS.msg_result_integrity_hash := '';
            SkySMS.msg_result_submit_count := 0;
            SkySMS.msg_result_submit_status := 'PENDING';
            SkySMS.msg_result_submit_description := '';
            SkySMS.msg_result_submit_date := CurrentDatetime;
            SkySMS.sender_type := 'SENDER_ID';
            SkySMS.receiver_type := 'MSISDN';
            if Source = Source::MOBILE_PIN then begin
                SkySMS.msg_general_flag := 'NOT_MASKED';
            end;
            SkySMS."Charge Member" := ChargeMember;
            if Source = Source::CASH_WITHDRAWAL_CONFIRM then
                SkySMS."Split Charge" := true;

            SkySMS.Insert;
        end;
    end;


    procedure SendSms(Source: Option NEW_MEMBER,NEW_ACCOUNT,LOAN_ACCOUNT_APPROVAL,DEPOSIT_CONFIRMATION,CASH_WITHDRAWAL_CONFIRM,LOAN_APPLICATION,LOAN_APPRAISAL,LOAN_GUARANTORS,LOAN_REJECTED,LOAN_POSTED,LOAN_DEFAULTED,SALARY_PROCESSING,TELLER_CASH_DEPOSIT,TELLER_CASH_WITHDRAWAL,TELLER_CHEQUE_DEPOSIT,FIXED_DEPOSIT_MATURITY,INTERACCOUNT_TRANSFER,ACCOUNT_STATUS,STATUS_ORDER,EFT_EFFECTED,ATM_APPLICATION_FAILED,ATM_COLLECTION,MBANKING,MEMBER_CHANGES,CASHIER_BELOW_LIMIT,CASHIER_ABOVE_LIMIT,INTERNETBANKING,CRM,MOBILE_PIN,WITHDRAWAL; Telephone: Text[200]; Textsms: Text; Reference: Text[30]; AccNo: Text[30]; Chargeable: Boolean; Priority: Integer; ChargeMember: Boolean) Sent: Boolean
    var
        EntryNo: Integer;
        SkySMS: Record 52185478;
        Category: Code[100];
        SMSLength: Integer;
        SMSLoop: Integer;
        CurrSMS: Text;
        NewSMS: Text;
    begin

        EntryNo := EntryNo + 1;

        Sent := false;

        if StrLen(Telephone) = 13 then begin
            Telephone := CopyStr(Telephone, 2, 12);
        end;

        if StrLen(Telephone) = 10 then begin
            if CopyStr(Telephone, 1, 1) = '0' then
                Telephone := '254' + CopyStr(Telephone, 2, 9);
        end;

        if StrLen(Telephone) = 9 then begin
            if CopyStr(Telephone, 1, 1) = '7' then
                Telephone := '254' + Telephone
        end;



        Category := Format(Source);

        if Priority = 0 then
            Priority := 250;

        Priority := GetSMSPriority(Category);

        GeneralLedgerSetup.Get;
        GeneralLedgerSetup.TestField("SMS Sender ID");
        GeneralLedgerSetup.TestField("SMS Sender Name");

        if StrLen(Telephone) = 12 then begin





            SkySMS.Init;
            SkySMS.originator_id := CreateGuid;
            SkySMS.msg_id := 0;
            SkySMS.msg_product_id := GeneralLedgerSetup."SMS Sender ID";
            SkySMS.msg_provider_code := '0';
            SkySMS.msg_charge := '';
            SkySMS.msg_status_code := 10;
            SkySMS.msg_status_description := 'New MSG';
            SkySMS.msg_status_date := CurrentDatetime;
            SkySMS.sender := GeneralLedgerSetup."SMS Sender Name";
            SkySMS.receiver := Telephone;
            SkySMS.msg := Textsms;
            SkySMS.msg_type := 'MT';
            SkySMS.msg_source_reference := '';
            SkySMS.msg_destination_reference := '';
            SkySMS.msg_xml_data := '<OTHER_DETAILS/>';
            SkySMS.msg_category := Category;
            SkySMS.msg_priority := Priority;
            SkySMS.msg_mode := 'SAF';
            SkySMS.msg_request_application := 'CBS';
            SkySMS.msg_request_correlation_id := '';
            SkySMS.msg_source_application := 'CBS';
            SkySMS.msg_send_count := 0;
            SkySMS.schedule_msg := 'NO';
            SkySMS.date_scheduled := CurrentDatetime;
            SkySMS.msg_send_integrity_hash := '';
            //SkySMS.msg_response_date:=CURRENTDATETIME;
            //SkySMS.msg_response_xml_data:='';
            //SkySMS.msg_response_integrity_hash:='';
            SkySMS.transaction_date := CurrentDatetime;
            SkySMS.date_created := CurrentDatetime;
            SkySMS."SMS Date" := Today;
            if Chargeable then
                SkySMS."Account To Charge" := AccNo;

            SkySMS.transaction_id := 0;
            SkySMS.server_id := 0;
            SkySMS.msg_charge_applied := '';
            SkySMS.msg_format := 'TEXT';
            SkySMS.msg_command := 'BulkSMS';
            SkySMS.msg_sensitivity := 'NORMAL';
            SkySMS.msg_response_description := '';
            SkySMS.msg_result_description := '';
            SkySMS.msg_result_xml_data := '';
            SkySMS.msg_result_date := CurrentDatetime;
            SkySMS.msg_result_integrity_hash := '';
            SkySMS.msg_result_submit_count := 0;
            SkySMS.msg_result_submit_status := 'PENDING';
            SkySMS.msg_result_submit_description := '';
            SkySMS.msg_result_submit_date := CurrentDatetime;
            SkySMS.sender_type := 'SENDER_ID';
            SkySMS.receiver_type := 'MSISDN';
            if Source = Source::MOBILE_PIN then begin
                SkySMS.msg_general_flag := 'NOT_MASKED';
            end;
            SkySMS."Charge Member" := ChargeMember;
            if Source = Source::CASH_WITHDRAWAL_CONFIRM then
                SkySMS."Split Charge" := true;

            if SkySMS.Insert then
                Sent := true;

        end;
    end;


    procedure GetAccountTransferRecipientXML(Criteria: Code[20]; Source: Text) Response: Text
    var
        SavAcc: Record 52185730;
        PFact: Record 52185690;
        xmlWriter: code[100];//dotnet XmlTextWriter;
        EncodingText: code[100];//dotnet Encoding;
        XMLDOMMgt: Codeunit "XML DOM Management";
        BodyContentXmlDoc: code[100];//dotnet XmlDocument;
        EnvelopeXmlNode: code[100];//dotnet XmlNode;
        CreatedXmlNode: code[100];//dotnet XmlNode;
        Members: Record 52185700;
    begin

        Response := '';


        if Source = 'Mobile' then begin

            if StrLen(Criteria) = 10 then
                if CopyStr(Criteria, 1, 1) = '0' then
                    Criteria := CopyStr(Criteria, 2, 9);

            SavAcc.Reset;
            SavAcc.SetFilter("Transactional Mobile No", '*' + Criteria);
            SavAcc.SetRange("Product Type", '505');
            SavAcc.SetFilter(Blocked, '<>%1', SavAcc.Blocked::All);
            if SavAcc.FindFirst then begin
                Response := SavAcc."No.";
                Response := '<Account>';
                Response += '<AccountNo>' + SavAcc."No." + '</AccountNo>';
                Response += '<AccountName>' + SavAcc.Name + '</AccountName>';
                Response += '<Name>' + SavAcc.Name + '</Name>';
                Response += '<MemberNo>' + SavAcc."Member No." + '</MemberNo>';
                Response += '<PhoneNo>' + SavAcc."Transactional Mobile No" + '</PhoneNo>';
                Members.Get(SavAcc."Member No.");
                Response += '<Email>' + Members."E-Mail" + '</Email>';
                Response += '</Account>';

            end
            else begin

                SavAcc.Reset;
                SavAcc.SetFilter("Mobile Phone No", '*%1', '*' + Criteria);
                SavAcc.SetRange("Product Type", '505');
                SavAcc.SetFilter(Blocked, '<>%1', SavAcc.Blocked::All);
                if SavAcc.FindFirst then begin
                    Response := SavAcc."No.";
                    Response := '<Account>';
                    Response += '<AccountNo>' + SavAcc."No." + '</AccountNo>';
                    Response += '<AccountName>' + SavAcc.Name + '</AccountName>';
                    Response += '<Name>' + SavAcc.Name + '</Name>';
                    Response += '<MemberNo>' + SavAcc."Member No." + '</MemberNo>';
                    Response += '<PhoneNo>' + SavAcc."Transactional Mobile No" + '</PhoneNo>';
                    Members.Get(SavAcc."Member No.");
                    Response += '<Email>' + Members."E-Mail" + '</Email>';
                    Response += '</Account>';

                end;
            end
        end
        else
            if Source = 'ID' then begin

                if StrLen(Criteria) > 11 then
                    exit;

                SavAcc.Reset;
                SavAcc.SetRange("ID No.", Criteria);
                SavAcc.SetRange("Product Type", '505');
                SavAcc.SetFilter(Blocked, '<>%1', SavAcc.Blocked::All);
                if SavAcc.FindFirst then begin
                    Response := SavAcc."No.";
                    Response := '<Account>';
                    Response += '<AccountNo>' + SavAcc."No." + '</AccountNo>';
                    Response += '<AccountName>' + SavAcc.Name + '</AccountName>';
                    Response += '<Name>' + SavAcc.Name + '</Name>';
                    Response += '<MemberNo>' + SavAcc."Member No." + '</MemberNo>';
                    Response += '<PhoneNo>' + SavAcc."Transactional Mobile No" + '</PhoneNo>';
                    Members.Get(SavAcc."Member No.");
                    Response += '<Email>' + Members."E-Mail" + '</Email>';
                    Response += '</Account>';

                end
            end
            else
                if Source = 'ACCOUNT' then begin
                    SavAcc.Reset;
                    SavAcc.SetRange("No.", Criteria);
                    if SavAcc.FindFirst then begin
                        Response := SavAcc."No.";
                        Response := '<Account>';
                        Response += '<AccountNo>' + SavAcc."No." + '</AccountNo>';
                        Response += '<AccountName>' + SavAcc.Name + '</AccountName>';
                        Response += '<Name>' + SavAcc.Name + '</Name>';
                        Response += '<MemberNo>' + SavAcc."Member No." + '</MemberNo>';
                        Response += '<PhoneNo>' + SavAcc."Transactional Mobile No" + '</PhoneNo>';
                        Members.Get(SavAcc."Member No.");
                        Response += '<Email>' + Members."E-Mail" + '</Email>';
                        Response += '</Account>';

                    end
                end
        //Response:='';
    end;


    procedure AccountBalanceEnquiryMobileApp(EntryCode: Text[20]; TransactionID: Code[20]; PhoneNo: Code[20]; PIN: Text; AccountToCheck: Code[20]) Response: Text[1024]
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52185482;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        SLedger: Record 52185732;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        AccountBookBalance: Decimal;
        AccountAvailableBalance: Decimal;
        AccountToCharge: Code[20];
        Found: Boolean;
        MemberNo: Code[20];
        TransactionDate: DateTime;
        Loans: Record 52185729;
        LoanType: Text;
        BalStmt: Text;
        msg: Text;
        SafcomCharges: Record 52185475;
        SafcomFee: Decimal;
        BalEnqCharge: Decimal;
    begin
        TransactionDate := CurrentDatetime;
        MobileTrans.LockTable(true);
        Response := '';
        Found := false;


        PhoneNo := '+' + PhoneNo;

        if not CorrectPin(PhoneNo, PIN) then begin

            Response := '<Response>';
            Response += '<Status>INCORRECT_PIN</Status>';
            Response += '<StatusDescription>Incorrect PIN</StatusDescription>';
            Response += '<Reference>' + TransactionID + '</Reference>';
            Response += '</Response>';

            exit;
        end;

        MobileTrans.Reset;
        MobileTrans.SetRange("Entry No.", EntryCode);
        if MobileTrans.FindFirst then begin
            Response := '<Response>';
            Response += '<Status>TRANSACTION_EXISTS</Status>';
            Response += '<StatusDescription>Transaction Already Exists</StatusDescription>';
            Response += '<Reference>' + Format(EntryCode) + '</Reference>';
            Response += '</Response>';
            exit;
        end;



        AccountToCharge := '';
        MemberNo := '';

        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then begin
            AccountToCharge := SavAcc."No.";
            MemberNo := SavAcc."Member No.";
            if SavAcc.Blocked <> SavAcc.Blocked::" " then
                exit;
        end;


        SavAcc.Get(AccountToCheck);
        if MemberNo = '' then
            Error('Member No. Missing');

        if AccountToCharge = '' then
            Error('Account to charge missing');


        // Get Excise duty G/L
        ExciseDutyGL := GetExciseDutyGL();
        ExciseDutyRate := GetExciseRate();
        ExciseDuty := 0;

        SaccoAccount := '';
        SaccoFee := 0;
        VendorAccount := '';
        VendorCommission := 0;


        SMSAccount := '';
        SMSCharge := 0;

        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Balance Enquiry");
        if CoopSetup.FindFirst then begin

            SMSAccount := CoopSetup."SMS Account";
            SMSCharge := CoopSetup."SMS Charge";


            SaccoAccount := CoopSetup."Sacco Fee Account";
            SaccoFee := CoopSetup."Sacco Fee";
            VendorAccount := CoopSetup."Vendor Commission Account";
            VendorCommission := CoopSetup."Vendor Commission";

            TotalCharge := SaccoFee + VendorCommission + SMSCharge;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);

        end
        else begin
            Error('Setup Missing for %1', CoopSetup."Transaction Type");
        end;



        if SavAcc.Get(AccountToCharge) then begin

            ProdFact.Get(SavAcc."Product Type");

            if (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::"Deposits Only") or
                (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::" ") then begin
                Error('The Account to Charge is not a Withdrawable Account');

            end;
            BalEnqCharge := 0;
            AccBal := GetAccountBalance(SavAcc."No.");
            if AccBal >= TotalCharge + ExciseDuty then begin
                BalEnqCharge := TotalCharge + ExciseDuty;
                //BUser.GET(USERID);

                //BUser.TESTFIELD("Cashier Journal Template");
                //BUser.TESTFIELD("Cashier Journal Batch");

                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';

                GenJournalBatch.Reset;
                GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                GenJournalBatch.SetRange(Name, JBatch);
                if not GenJournalBatch.FindFirst then begin
                    GenJournalBatch.Init;
                    GenJournalBatch."Journal Template Name" := JTemplate;
                    GenJournalBatch.Name := JBatch;
                    GenJournalBatch.Description := 'Sky World Batch';
                    GenJournalBatch.Init;
                end;


                MobileTrans.Init;
                MobileTrans."Entry No." := EntryCode;
                MobileTrans."Transaction ID" := TransactionID;
                MobileTrans."Session ID" := TransactionID;
                MobileTrans."Transaction Date" := Dt2Date(TransactionDate);
                MobileTrans."Transaction Time" := Dt2Time(TransactionDate);
                MobileTrans."Member Account" := SavAcc."No.";
                MobileTrans.MobileApp := true;
                MobileTrans."Transaction Type" := MobileTrans."transaction type"::"Balance Enquiry";
                MobileTrans.Description := Format(MobileTrans."Transaction Type") + ': ' + AccountToCheck;
                MobileTrans.Posted := true;
                MobileTrans.Insert;
                Commit;


                MobileTrans.Reset;
                MobileTrans.SetRange("Transaction ID", TransactionID);
                MobileTrans.SetRange(Posted, false);
                if MobileTrans.FindFirst then begin

                    DocNo := MobileTrans."Transaction ID";
                    PDate := MobileTrans."Transaction Date";
                    AccNo := MobileTrans."Member Account";
                    ExtDoc := '';
                    LoanNo := '';
                    TransType := Transtype::" ";
                    Dim1 := SavAcc."Global Dimension 1 Code";
                    Dim2 := SavAcc."Global Dimension 2 Code";
                    SystCreated := true;

                    SaccoTrans.InitJournal(JTemplate, JBatch);

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(MobileTrans.Description, 1, 50), Balacctype::"G/L Account",
                                  '', TotalCharge + ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    /*
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                                  '',SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccountToCharge,COPYSTR('SMS Charges ',1,50),BalAccType::"G/L Account",
                                  SMSAccount,SMSCharge,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Excise Duty',1,50),BalAccType::"G/L Account",
                                  ExciseDutyGL,ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    */


                    AccNo := VendorAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := Transtype::" ";

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Vendor, AccNo, CopyStr(MobileTrans.Description + ' Commission', 1, 50), Balacctype::"G/L Account",
                                  '', -VendorCommission, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    AccNo := SaccoAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := Transtype::" ";

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", AccNo, CopyStr(MobileTrans.Description + ' Fee', 1, 50), Balacctype::"G/L Account",
                                  '', -SaccoFee, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, MobileTrans."Member Account", CopyStr(MobileTrans.Description + ' Excise Duty', 1, 50), Balacctype::"G/L Account",
                                  '', -ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


                    MobileTrans.Posted := true;
                    MobileTrans."Posted By" := UserId;
                    MobileTrans."Date Posted" := Today;
                    MobileTrans.Modify;


                    SaccoTrans.PostJournal(JTemplate, JBatch);

                end;

            end
            else begin
                Response := 'INSUFFICIENT_BAL';

                Response := '<Response>';
                Response += '<Status>INSUFFICIENT_BAL</Status>';
                Response += '<StatusDescription>Insufficient Balance</StatusDescription>';
                Response += '<Reference>' + TransactionID + '</Reference>';
                Response += '</Response>';

            end;
        end
        else begin
            Response := '<Response>';
            Response += '<Status>INVALID_ACCOUNT</Status>';
            Response += '<StatusDescription>Invalid Account</StatusDescription>';
            Response += '<Reference>' + TransactionID + '</Reference>';
            Response += '</Response>';
        end;


        if (Response = '') then begin

            BalEnqCharge := 0;
            SavAcc.Reset;
            SavAcc.SetRange("Member No.", MemberNo);
            SavAcc.SetRange("No.", AccountToCheck);
            if SavAcc.Find('-') then begin
                Response := '<Balances>';
                repeat
                    ProdFact.Get(SavAcc."Product Type");

                    if ProdFact."Mobile Transaction" <> ProdFact."mobile transaction"::" " then begin
                        SavAcc.CalcFields("Balance (LCY)");

                        AccountBookBalance := SavAcc."Balance (LCY)";
                        AccountAvailableBalance := GetAccountBalance(SavAcc."No.");


                        if SavAcc."Product Type" = '5050' then begin

                            SMSCharge := 0;

                            CoopSetup.Reset;
                            CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Mpesa Withdrawal");
                            if CoopSetup.FindFirst then begin

                                SMSCharge := CoopSetup."SMS Charge";

                                SaccoFee := CoopSetup."Sacco Fee";

                                if CoopSetup."Charge Type" = CoopSetup."charge type"::Staggered then begin
                                    SacAcc := '';
                                    GetChargeAmount(CoopSetup."Staggered Charge Code", AccountAvailableBalance, SaccoFee, VendorCommission);
                                end;

                                SafcomCharges.Reset;
                                SafcomCharges.SetFilter(Charge, '>0');
                                SafcomCharges.SetFilter(Minimum, '<=%1', AccountAvailableBalance);
                                SafcomCharges.SetFilter(Maximum, '>=%1', AccountAvailableBalance);
                                if SafcomCharges.FindFirst then begin
                                    SafcomFee := SafcomCharges.Charge;
                                end;

                                VendorCommission := CoopSetup."Vendor Commission";
                                TotalCharge := SaccoFee + VendorCommission + SafcomFee + SMSCharge;
                                ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);

                                AccountBookBalance -= BalEnqCharge;
                                AccountAvailableBalance -= (BalEnqCharge + TotalCharge + ExciseDuty);
                            end;
                        end;




                        Response += '<Account>';
                        Response += '<Product>' + ProdFact."USSD Product Name" + '</Product>';
                        Response += '<Date>' + Format(MobileTrans."Transaction Date") + '</Date>';
                        Response += '<BookBalance>' + Format(AccountBookBalance) + '</BookBalance>';
                        Response += '<AvailableBalance>' + Format(AccountAvailableBalance) + '</AvailableBalance>';
                        Response += '</Account>';



                    end;
                until SavAcc.Next = 0;
                Response += '</Balances>';
            end;

        end;

    end;


    procedure GetMemberLoanListMobileApp(Phone: Code[20]) Response: Text
    var
        MobileNo: Code[20];
        Loans: Record 52185729;
        LoanProduct: Record 52185690;
        SavAcc: Record 52185730;
        MemberNo: Code[20];
        MaxLoan: Decimal;
        Found: Boolean;
    begin

        MobileNo := '+' + Phone;


        Response := '';
        Found := false;
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", MobileNo);
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        if SavAcc.FindFirst then begin

            MemberNo := SavAcc."Member No.";

            LoanProduct.Reset;
            LoanProduct.SetRange("Product Class Type", LoanProduct."product class type"::Loan);
            if LoanProduct.Find('-') then begin
                Response := '<Loans>';
                repeat

                    MaxLoan := LoanProduct."Maximum Loan Amount";
                    Loans.Reset;
                    Loans.SetRange("Member No.", MemberNo);
                    Loans.SetRange("Loan Product Type", LoanProduct."Product ID");
                    Loans.SetFilter("Outstanding Balance", '>0');
                    if Loans.FindFirst then begin
                        Found := true;
                        repeat
                            Loans.CalcFields("Outstanding Balance");
                            Response += '<Product>';
                            Response += '<LoanNo>' + Loans."Loan No." + '</LoanNo>';
                            Response += '<Type>' + LoanProduct."USSD Product Name" + '</Type>';
                            Response += '<LoanBalance>' + Format(Loans."Outstanding Balance") + '</LoanBalance>';
                            Response += '</Product>';
                        until Loans.Next = 0;
                    end;
                until LoanProduct.Next = 0;
                Response += '</Loans>';

            end;

        end;
        if not Found then
            Response := '';
    end;


    procedure AccountMiniStatementMobileApp(EntryCode: Code[30]; TransactionID: Code[20]; MaxNumberRows: Integer; StartDate: Date; EndDate: Date; StatementAccount: Code[20]; MobileNo: Code[20]; Pin: Text) Response: Text
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        PhoneNo: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52186221;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[10];
        Dim2: Code[10];
        SystCreated: Boolean;
        SLedger: Record 52185732;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        TransactionDate: DateTime;
        Msg: Text;
        Stmt: Text;
        AccountToCharge: Code[20];
        MemberNo: Code[20];
        RCount: Integer;
    begin
        MobileTrans.LockTable(true);
        TransactionDate := CurrentDatetime;
        MobileNo := '+' + MobileNo;

        Response := '';


        if not CorrectPin(MobileNo, Pin) then begin
            Response := 'INCORRECT_PIN';
            Response := '<Response>';
            Response += '<Status>INCORRECT_PIN</Status>';
            Response += '<StatusDescription>Incorrect PIN</StatusDescription>';
            Response += '<Reference>' + TransactionID + '</Reference>';
            Response += '</Response>';
            exit;
        end;


        MobileTrans.Reset;
        MobileTrans.SetRange("Entry No.", EntryCode);
        if MobileTrans.FindFirst then begin
            Response := '<Response>';
            Response += '<Status>TRANSACTION_EXISTS</Status>';
            Response += '<StatusDescription>Transaction Already Exists</StatusDescription>';
            Response += '<Reference>' + Format(EntryCode) + '</Reference>';
            Response += '</Response>';
            exit;
        end;



        // Get Excise duty G/L
        ExciseDutyGL := GetExciseDutyGL();
        ExciseDutyRate := GetExciseRate();
        ExciseDuty := 0;

        SaccoAccount := '';
        SaccoFee := 0;
        VendorAccount := '';
        VendorCommission := 0;

        MemberNo := '';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", MobileNo);
        if SavAcc.FindFirst then
            MemberNo := SavAcc."Member No.";

        if SavAcc.Blocked <> SavAcc.Blocked::" " then
            exit;

        AccountToCharge := '';

        SavAcc.Get(StatementAccount);


        SavAcc.Reset;
        SavAcc.SetRange("Member No.", MemberNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then
            AccountToCharge := SavAcc."No.";

        SMSAccount := '';
        SMSCharge := 0;

        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Mini-Statement");
        if CoopSetup.FindFirst then begin

            SMSAccount := CoopSetup."SMS Account";
            SMSCharge := CoopSetup."SMS Charge";

            SaccoAccount := CoopSetup."Sacco Fee Account";
            SaccoFee := CoopSetup."Sacco Fee";
            VendorAccount := CoopSetup."Vendor Commission Account";
            VendorCommission := CoopSetup."Vendor Commission";

            TotalCharge := SaccoFee + VendorCommission + SMSCharge;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
        end
        else begin
            Error('Setup Missing for %1', CoopSetup."Transaction Type");
        end;


        //PhoneNo:='+'+MobileNo;

        SavAcc.Reset;
        SavAcc.SetRange("No.", AccountToCharge);
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        if SavAcc.FindFirst then begin


            ProdFact.Get(SavAcc."Product Type");

            if (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::"Deposits Only") or
                (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::" ") then begin
                Error('The Account to Charge is not a Withdrawable Account');
            end;



            AccBal := GetAccountBalance(SavAcc."No.");
            if AccBal >= TotalCharge + ExciseDuty then begin

                //BUser.GET(USERID);

                //BUser.TESTFIELD("Cashier Journal Template");
                //BUser.TESTFIELD("Cashier Journal Batch");

                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';

                GenJournalBatch.Reset;
                GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                GenJournalBatch.SetRange(Name, JBatch);
                if not GenJournalBatch.FindFirst then begin
                    GenJournalBatch.Init;
                    GenJournalBatch."Journal Template Name" := JTemplate;
                    GenJournalBatch.Name := JBatch;
                    GenJournalBatch.Description := 'Sky World Batch';
                    GenJournalBatch.Init;
                end;


                MobileTrans.Init;
                MobileTrans."Entry No." := EntryCode;
                MobileTrans."Transaction ID" := TransactionID;
                MobileTrans."Session ID" := TransactionID;
                MobileTrans."Transaction Date" := Dt2Date(TransactionDate);
                MobileTrans."Transaction Time" := Dt2Time(TransactionDate);
                MobileTrans."Member Account" := SavAcc."No.";
                MobileTrans."Statement Max Rows" := MaxNumberRows;
                MobileTrans."Statement Start Date" := StartDate;
                MobileTrans."Statement End Date" := EndDate;
                MobileTrans.MobileApp := true;
                MobileTrans."Account to Check" := StatementAccount;
                MobileTrans."Transaction Type" := MobileTrans."transaction type"::"Mini-Statement";
                MobileTrans.Description := Format(MobileTrans."Transaction Type");
                MobileTrans.Posted := true;
                MobileTrans.Insert;
                Commit;


                /*
                MobileTrans.RESET;
                MobileTrans.SETRANGE("Transaction ID",TransactionID);
                MobileTrans.SETRANGE(Posted,FALSE);
                IF MobileTrans.FINDFIRST THEN BEGIN
        
                    DocNo := MobileTrans."Transaction ID";
                    PDate := MobileTrans."Transaction Date";
                    AccNo := MobileTrans."Member Account";
                    ExtDoc := '';
                    LoanNo := '';
                    TransType := TransType::" ";
                    Dim1 := SavAcc."Global Dimension 1 Code";
                    Dim2 := SavAcc."Global Dimension 2 Code";
                    SystCreated := TRUE;
        
        
                    SaccoTrans.InitJournal(JTemplate,JBatch);
        
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                                  '',VendorCommission,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccountToCharge,COPYSTR('SMS Charge',1,50),BalAccType::"G/L Account",
                                  SMSAccount,SMSCharge,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Sacco Fee ',1,50),BalAccType::"G/L Account",
                                  '',SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Excise Duty ',1,50),BalAccType::"G/L Account",
                                  ExciseDutyGL,ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
        
                    AccNo := VendorAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := TransType::" ";
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Vendor,AccNo,COPYSTR(MobileTrans.Description+' Commission',1,50),BalAccType::"G/L Account",
                                  '',-VendorCommission,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
                    AccNo := SaccoAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := TransType::" ";
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::"G/L Account",AccNo,COPYSTR(MobileTrans.Description+' Fee',1,50),BalAccType::"G/L Account",
                                  '',-SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
        
                    MobileTrans.Posted:=TRUE;
                    MobileTrans."Posted By":=USERID;
                    MobileTrans."Date Posted":=TODAY;
                    MobileTrans.MODIFY;
        
                    SaccoTrans.PostJournal(JTemplate,JBatch);
        
                END
                ELSE BEGIN
                    ERROR('Transaction Not Found');
                END;
                */
            end
            else begin
                Response := 'INSUFFICIENT_BAL';

                Response := '<Response>';
                Response += '<Status>INSUFFICIENT_BAL</Status>';
                Response += '<StatusDescription>Insufficient Balance</StatusDescription>';
                Response += '<Reference>' + TransactionID + '</Reference>';
                Response += '</Response>';
                exit;
            end;


            if Response = '' then begin

                MobileTrans.Reset;
                MobileTrans.SetRange("Transaction ID", TransactionID);
                MobileTrans.SetRange(Posted, true);
                if MobileTrans.FindFirst then begin
                    SLedger.Reset;
                    SLedger.SetCurrentkey("Entry No.");
                    SLedger.Ascending(true);
                    SLedger.SetRange("Customer No.", StatementAccount);
                    SLedger.SetRange("Posting Date", StartDate, EndDate);
                    SLedger.SetRange(Reversed, false);
                    if SLedger.FindFirst then begin
                        RCount := 0;
                        AccBal := 0;
                        SavAcc.Reset;
                        SavAcc.SetRange("No.", StatementAccount);
                        SavAcc.SetRange("Date Filter", 0D, CalcDate('-1D', StartDate));
                        if SavAcc.FindFirst then begin
                            SavAcc.CalcFields("Balance (LCY)");
                            AccBal := SavAcc."Balance (LCY)";
                        end;
                        Message('OpenBal %1', AccBal);
                        Response := '<Response>';
                        repeat
                            RCount += 1;
                            LedgerCount += 1;
                            AccBal += (SLedger.Amount * -1);
                            Response += '<Transaction>';
                            Response += '<Date>' + Format(SLedger."Posting Date") + '</Date>';
                            Response += '<Desc>' + SLedger.Description + '</Desc>';
                            Response += '<Amount>' + Format(SLedger.Amount * -1) + '</Amount>';
                            Response += '<Reference>' + Format(SLedger."Entry No.") + '</Reference>';
                            Response += '<RunningBalance>' + Format(AccBal) + '</RunningBalance>';
                            Response += '</Transaction>';


                        until (SLedger.Next = 0) or (RCount = MaxNumberRows);

                        Response += '</Response>';
                    end;
                end;
            end;
        end
        else begin

            Response := '<Response>';
            Response += '<Status>INVALID_ACCOUNT</Status>';
            Response += '<StatusDescription>Invalid Account</StatusDescription>';
            Response += '<Reference>' + TransactionID + '</Reference>';
            Response += '</Response>';
        end;

    end;


    procedure GetLoanLimitMobileApp(PhoneNo: Code[20]; LoanProductType: Code[20]) Response: Text
    var
        SavAcc: Record 52185730;
        PFact: Record 52185690;
        xmlWriter: code[100];//dotnet XmlTextWriter;
        EncodingText: code[100];//dotnet Encoding;
        XMLDOMMgt: Codeunit "XML DOM Management";
        BodyContentXmlDoc: code[100];//dotnet XmlDocument;
        EnvelopeXmlNode: code[100];//dotnet XmlNode;
        CreatedXmlNode: code[100];//dotnet XmlNode;
        MaxLoan: Decimal;
        msg: Text;
    begin

        PhoneNo := '+' + PhoneNo;

        Response := 'ERROR';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        if SavAcc.FindFirst then begin
            Message(SavAcc.Name);
            MaxLoan := GetLoanQualifiedAmount(SavAcc."No.", LoanProductType);

            PFact.Get(LoanProductType);


            msg := 'Dear ' + SavAcc.Name + ', your Loan Limit for ' + PFact."USSD Product Name" + ' is KES ' + Format(MaxLoan);
            //SendSms(Source::MBANKING,SavAcc."Transactional Mobile No",msg,LoanProductType,SavAcc."No.",FALSE,Priority);
            Response := msg;

        end;
    end;


    procedure LoanMiniStatementMobileApp(EntryCode: Code[20]; TransactionID: Code[20]; MaxNumberRows: Integer; SDate: Date; EDate: Date; LoanType: Code[20]; MobileNo: Code[20]; Pin: Text) Response: Text
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        PhoneNo: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52185482;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[10];
        Dim2: Code[10];
        SystCreated: Boolean;
        CLedger: Record 52185733;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        TransactionDate: DateTime;
        Msg: Text;
        Stmt: Text;
        StatementAccount: Code[20];
        AccountToCharge: Code[20];
        MemberNo: Code[20];
        Loans: Record 52185729;
    begin
        MobileTrans.LockTable(true);
        TransactionDate := CurrentDatetime;
        MobileNo := '+' + MobileNo;

        Response := '';

        if not CorrectPin(MobileNo, Pin) then begin
            Response := 'INCORRECT_PIN';
            Response := '<Response>';
            Response += '<Status>INCORRECT_PIN</Status>';
            Response += '<StatusDescription>Insufficient Balance</StatusDescription>';
            Response += '<Reference>' + TransactionID + '</Reference>';
            Response += '</Response>';
            exit;
        end;


        MobileTrans.Reset;
        MobileTrans.SetRange("Entry No.", EntryCode);
        if MobileTrans.FindFirst then begin
            Response := '<Response>';
            Response += '<Status>TRANSACTION_EXISTS</Status>';
            Response += '<StatusDescription>Transaction Already Exists</StatusDescription>';
            Response += '<Reference>' + Format(EntryCode) + '</Reference>';
            Response += '</Response>';
            exit;
        end;


        // Get Excise duty G/L
        ExciseDutyGL := GetExciseDutyGL();
        ExciseDutyRate := GetExciseRate();
        ExciseDuty := 0;

        SaccoAccount := '';
        SaccoFee := 0;
        VendorAccount := '';
        VendorCommission := 0;

        MemberNo := '';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", MobileNo);
        if SavAcc.FindFirst then
            MemberNo := SavAcc."Member No.";


        if SavAcc.Blocked <> SavAcc.Blocked::" " then
            exit;

        StatementAccount := '';
        AccountToCharge := '';

        Loans.Reset;
        Loans.SetRange("Loan No.", LoanType);
        if Loans.FindFirst then
            StatementAccount := Loans."Loan No.";

        SavAcc.Reset;
        SavAcc.SetRange("Member No.", MemberNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then
            AccountToCharge := SavAcc."No.";

        SMSAccount := '';
        SMSCharge := 0;

        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Mini-Statement");
        if CoopSetup.FindFirst then begin

            SMSAccount := CoopSetup."SMS Account";
            SMSCharge := CoopSetup."SMS Charge";


            SaccoAccount := CoopSetup."Sacco Fee Account";
            SaccoFee := CoopSetup."Sacco Fee";
            VendorAccount := CoopSetup."Vendor Commission Account";
            VendorCommission := CoopSetup."Vendor Commission";

            TotalCharge := SaccoFee + VendorCommission + SMSCharge;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
        end
        else begin
            Error('Setup Missing for %1', CoopSetup."Transaction Type");
        end;


        //PhoneNo:='+'+MobileNo;

        SavAcc.Reset;
        SavAcc.SetRange("No.", AccountToCharge);
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        if SavAcc.FindFirst then begin


            ProdFact.Get(SavAcc."Product Type");

            if (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::"Deposits Only") or
                (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::" ") then begin
                Error('The Account to Charge is not a Withdrawable Account');
            end;



            AccBal := GetAccountBalance(SavAcc."No.");
            if AccBal >= TotalCharge + ExciseDuty then begin

                //BUser.GET(USERID);

                //BUser.TESTFIELD("Cashier Journal Template");
                //BUser.TESTFIELD("Cashier Journal Batch");

                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';

                GenJournalBatch.Reset;
                GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                GenJournalBatch.SetRange(Name, JBatch);
                if not GenJournalBatch.FindFirst then begin
                    GenJournalBatch.Init;
                    GenJournalBatch."Journal Template Name" := JTemplate;
                    GenJournalBatch.Name := JBatch;
                    GenJournalBatch.Description := 'Sky World Batch';
                    GenJournalBatch.Init;
                end;

                MobileTrans.Init;
                MobileTrans."Entry No." := EntryCode;
                MobileTrans."Transaction ID" := TransactionID;
                MobileTrans."Session ID" := TransactionID;
                MobileTrans."Transaction Date" := Dt2Date(TransactionDate);
                MobileTrans."Transaction Time" := Dt2Time(TransactionDate);
                MobileTrans."Member Account" := SavAcc."No.";
                MobileTrans."Statement Max Rows" := 10000;
                //MobileTrans."Statement Start Date":=StartDate;
                //MobileTrans."Statement End Date":=EndDate;
                MobileTrans."Account to Check" := StatementAccount;
                MobileTrans.MobileApp := true;
                MobileTrans."Transaction Type" := MobileTrans."transaction type"::"Mini-Statement";
                MobileTrans.Description := Format(MobileTrans."Transaction Type");
                MobileTrans.Insert;

                /*
                MobileTrans.RESET;
                MobileTrans.SETRANGE("Transaction ID",TransactionID);
                MobileTrans.SETRANGE(Posted,FALSE);
                IF MobileTrans.FINDFIRST THEN BEGIN
        
                    DocNo := MobileTrans."Transaction ID";
                    PDate := MobileTrans."Transaction Date";
                    AccNo := MobileTrans."Member Account";
                    ExtDoc := '';
                    LoanNo := '';
                    TransType := TransType::" ";
                    Dim1 := SavAcc."Global Dimension 1 Code";
                    Dim2 := SavAcc."Global Dimension 2 Code";
                    SystCreated := TRUE;
        
                    SaccoTrans.InitJournal(JTemplate,JBatch);
        
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                                  '',VendorCommission,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                                  '',SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccountToCharge,COPYSTR('SMS Charges',1,50),BalAccType::"G/L Account",
                                  SMSAccount,SMSCharge,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Excise Duty',1,50),BalAccType::"G/L Account",
                                  ExciseDutyGL,ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
        
                    AccNo := VendorAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := TransType::" ";
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Vendor,AccNo,COPYSTR(MobileTrans.Description+' Commission',1,50),BalAccType::"G/L Account",
                                  '',-VendorCommission,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
                    AccNo := SaccoAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := TransType::" ";
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::"G/L Account",AccNo,COPYSTR(MobileTrans.Description+' Fee',1,50),BalAccType::"G/L Account",
                                  '',-SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
        
                    MobileTrans.Posted:=TRUE;
                    MobileTrans."Posted By":=USERID;
                    MobileTrans."Date Posted":=TODAY;
                    MobileTrans.MODIFY;
        
                    SaccoTrans.PostJournal(JTemplate,JBatch);
        
                END
                ELSE BEGIN
                    ERROR('Transaction Not Found');
                END;
                */
            end
            else begin
                Response := 'INSUFFICIENT_BAL';

                Response := '<Response>';
                Response += '<Status>INSUFFICIENT_BAL</Status>';
                Response += '<StatusDescription>Insufficient Balance</StatusDescription>';
                Response += '<Reference>' + TransactionID + '</Reference>';
                Response += '</Response>';
                exit;

            end;


            if Response = '' then begin
                MobileTrans.Reset;
                MobileTrans.SetRange("Transaction ID", TransactionID);
                //MobileTrans.SETRANGE(Posted,TRUE);
                if MobileTrans.FindFirst then begin
                    Loans.Get(StatementAccount);

                    CLedger.Reset;
                    CLedger.SetCurrentkey("Entry No.");
                    CLedger.Ascending(false);
                    CLedger.SetRange("Customer No.", Loans."Loan Account");
                    CLedger.SetRange("Posting Date", SDate, EDate);
                    CLedger.SetRange(Reversed, false);
                    if CLedger.FindFirst then begin
                        AccBal := 0;
                        Loans.Reset;
                        Loans.SetRange("Loan No.", StatementAccount);
                        Loans.SetRange("Date Filter", 0D, CalcDate('-1D', SDate));
                        if Loans.FindFirst then begin
                            Loans.CalcFields("Outstanding Balance");
                            AccBal := Loans."Outstanding Balance";
                        end;

                        Response := '<Response>';

                        repeat
                            LedgerCount += 1;
                            if (CLedger."Transaction Type" = CLedger."transaction type"::Repayment) or (CLedger."Transaction Type" = CLedger."transaction type"::Loan) then
                                AccBal += (CLedger.Amount);

                            Response += '<Transaction>';
                            Response += '<Date>' + Format(CLedger."Posting Date") + '</Date>';
                            Response += '<Desc>' + CLedger.Description + '</Desc>';
                            Response += '<Amount>' + Format(CLedger.Amount) + '</Amount>';
                            Response += '<Reference>' + Format(CLedger."Entry No.") + '</Reference>';
                            Response += '<RunningBalance>' + Format(AccBal) + '</RunningBalance>';
                            Response += '</Transaction>';

                        until (CLedger.Next = 0) or (CLedger.Count = MaxNumberRows);
                        Response += '</Response>';

                        Priority := 231;
                    end;
                end;
            end;
        end
        else begin
            Response := 'INVALID_ACCOUNT';

            Response := '<Response>';
            Response += '<Status>INVALID_ACCOUNT</Status>';
            Response += '<StatusDescription>Insufficient Balance</StatusDescription>';
            Response += '<Reference>' + TransactionID + '</Reference>';
            Response += '</Response>';

        end;

    end;


    procedure ShowQualifiedAmount(AccountNo: Code[20]): Decimal
    var
        DefaultedAmount: Integer;
        saccoAccount: Record 52185730;
        ProdFac: Record 52185690;
        salStartString: Text;
        SalStart: Date;
        SalEnd: Date;
        SalBuffer: Record 52185784;
        Salary1: Decimal;
        Salary2: Decimal;
        Date1: Date;
        Date2: Date;
        NetSal: Decimal;
        Loans: Record 52185729;
        LoanRep: Decimal;
        IntAmt: Decimal;
        PrAmt: Decimal;
        STODed: Decimal;
        StandingOrders: Record 52185717;
        MaxLoanAmount: Decimal;
        ExpInt: Decimal;
        LoanType: Record 52185690;
        DepAcc: Record 52185730;
        Salary3: Decimal;
        Date3: Date;
        LoanProductType: Code[20];
    begin

        LoanProductType := '';
        ProdFac.Reset;
        ProdFac.SetRange(AvailableOnMobile, true);
        if ProdFac.FindFirst then
            LoanProductType := ProdFac."Product ID";

        if LoanProductType = '' then
            exit;

        saccoAccount.Reset;
        saccoAccount.SetRange("No.", AccountNo);
        if saccoAccount.Find('-') then begin

            if LoanType.Get(LoanProductType) then begin

                Salary1 := 0;
                Salary2 := 0;
                Salary3 := 0;

                SalEnd := Today;
                SalStart := CalcDate('-45D', SalEnd);




                SalBuffer.Reset;
                SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer.Date);
                SalBuffer.SetRange(SalBuffer."Account No.", AccountNo);
                if SalBuffer.FindLast then begin
                    Date3 := SalBuffer."Posting Date";
                    Salary3 := SalBuffer.Amount;
                    if SalBuffer.Count = 2 then begin

                        SalBuffer.Reset;
                        SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer.Date);
                        SalBuffer.SetRange(SalBuffer."Account No.", AccountNo);
                        if SalBuffer.FindFirst then begin
                            Date2 := SalBuffer."Posting Date";
                            Salary2 := SalBuffer.Amount;
                        end
                    end;
                end
                else
                    exit(0);


                Message('Salary 3 - %1\Date 3 - %2', Salary3, Date3);


                SalEnd := CalcDate('-1M+CM', Date3);
                SalStart := CalcDate('-45D', SalEnd);

                if Salary2 = 0 then begin
                    SalBuffer.Reset;
                    SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer.Date);
                    SalBuffer.SetRange(SalBuffer."Account No.", AccountNo);
                    SalBuffer.SetFilter("Posting Date", '%1..%2', SalStart, SalEnd);
                    if SalBuffer.FindLast then begin
                        Date2 := SalBuffer."Posting Date";
                        Salary2 := SalBuffer.Amount;
                        if SalBuffer.Count = 2 then begin
                            SalBuffer.Reset;
                            SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer.Date);
                            SalBuffer.SetRange(SalBuffer."Account No.", AccountNo);
                            SalBuffer.SetFilter("Posting Date", '%1..%2', SalStart, SalEnd);
                            if SalBuffer.FindFirst then begin
                                Date1 := SalBuffer."Posting Date";
                                Salary1 := SalBuffer.Amount;
                            end
                        end;
                    end
                    else
                        exit(0);
                end;


                Message('Salary 2 - %1\Date 2 - %2', Salary2, Date2);


                SalEnd := CalcDate('-1M+CM', Date2);
                SalStart := CalcDate('-45D', SalEnd);


                if Salary1 = 0 then begin
                    SalBuffer.Reset;
                    SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer.Date);
                    SalBuffer.SetRange(SalBuffer."Account No.", AccountNo);
                    SalBuffer.SetFilter("Posting Date", '%1..%2', SalStart, SalEnd);
                    if SalBuffer.FindLast then begin
                        Date1 := SalBuffer."Posting Date";
                        Salary1 := SalBuffer.Amount;
                    end
                    else
                        exit(0);
                end;

                Message('Salary 1 - %1\Date 1 - %2', Salary1, Date1);

                if Salary1 = 0 then
                    exit(0);
                if Salary2 = 0 then
                    exit(0);
                if Salary3 = 0 then
                    exit(0);


                if Date3 < CalcDate('-CM', Today) then
                    if Date3 < CalcDate('-1M-CM', Today) then
                        exit(0);



                NetSal := Salary1;
                if NetSal > Salary2 then
                    NetSal := Salary2;

                if NetSal > Salary3 then
                    NetSal := Salary3;


                Message('Net Salary %1', NetSal);

                LoanRep := 0;
                Loans.Reset;
                Loans.SetRange("Member No.", saccoAccount."Member No.");
                Loans.SetRange("Recovery Mode", Loans."recovery mode"::Salary);
                Loans.SetRange("Disbursement Date", 0D, Dmy2date(20, Date2dmy(Today, 2), Date2dmy(Today, 3)));
                Loans.SetRange("Mobile Loan", false);
                Loans.SetFilter("Outstanding Balance", '>0');
                if Loans.FindFirst then begin
                    repeat
                        Loans.CalcFields("Outstanding Balance");


                        IntAmt := 0;
                        case Loans."Interest Calculation Method" of
                            Loans."interest calculation method"::"Reducing Flat":
                                begin

                                    if ProdFac.Get(Loans."Loan Product Type") then begin
                                        IntAmt := ROUND((Loans."Approved Amount" * 0.6) * (Loans.Installments + 1) / (Loans.Installments * 100), 1, '=');
                                    end;
                                end;

                            Loans."interest calculation method"::"Reducing Balance":
                                begin
                                    IntAmt := ROUND(Loans."Outstanding Balance" * (Loans.Interest / 1200), 1, '=');
                                end;

                            Loans."interest calculation method"::"Straight Line":
                                begin
                                    IntAmt := ROUND(Loans."Approved Amount" * (Loans.Interest / 1200), 1, '=');
                                end
                            else begin
                                IntAmt := ROUND(Loans."Outstanding Balance" * (Loans.Interest / 1200), 1, '=');
                            end;
                        end;

                        PrAmt := Loans."Loan Principle Repayment";

                        case Loans."Interest Calculation Method" of
                            Loans."interest calculation method"::"Reducing Flat",
                            Loans."interest calculation method"::"Reducing Balance",
                            Loans."interest calculation method"::"Straight Line":
                                begin
                                    PrAmt := (Loans."Approved Amount" / Loans.Installments);
                                end else begin
                                PrAmt := (Loans.Repayment - IntAmt);
                            end;
                        end;


                        if PrAmt > Loans."Outstanding Balance" then
                            PrAmt := Loans."Outstanding Balance";


                        LoanRep += PrAmt + IntAmt;

                    until Loans.Next = 0;
                end;



                Loans.Reset;
                Loans.SetRange("Member No.", saccoAccount."Member No.");
                Loans.SetRange("Recovery Mode", Loans."recovery mode"::Salary);
                Loans.SetRange("Mobile Loan", true);
                Loans.SetFilter("Outstanding Balance", '>0');
                if Loans.FindFirst then begin
                    repeat
                        Loans.CalcFields("Outstanding Balance");
                        LoanRep += Loans."Outstanding Balance";
                    until Loans.Next = 0;
                end;


                STODed := 0;
                StandingOrders.Reset;
                StandingOrders.SetRange(StandingOrders."Source Account No.", saccoAccount."No.");
                StandingOrders.SetRange(StandingOrders.Status, StandingOrders.Status::Approved);
                StandingOrders.SetFilter("End Date", '>%1', Today);
                if StandingOrders.Find('-') then begin
                    repeat
                        STODed := STODed + StandingOrders.Amount;
                    until StandingOrders.Next = 0;
                end;

                Message('Net Sal: %1\Loan Rep: %2 \STO Ded: %3', NetSal, LoanRep, STODed);

                NetSal := NetSal - LoanRep - STODed;

                Message('New Net after Deductions: %1', NetSal);

                if NetSal < 0 then
                    NetSal := 0;

                NetSal := ROUND(LoanType."Net Salary Multiplier %" / 100 * NetSal);


                Message('90% NetSal %1 ', NetSal);

                DepAcc.Reset;
                DepAcc.SetRange("Member No.", saccoAccount."Member No.");
                DepAcc.SetRange("Product Category", DepAcc."product category"::"Deposit Contribution");
                if DepAcc.FindFirst then begin
                    DepAcc.CalcFields("Balance (LCY)");
                    if NetSal > DepAcc."Balance (LCY)" then
                        NetSal := DepAcc."Balance (LCY)";

                    if NetSal < 0 then
                        NetSal := 0;
                end
                else begin
                    NetSal := 0;
                end;


                Message('NetSal: %1 \Member Deposits: %2 ', NetSal, DepAcc."Balance (LCY)");


                /*
                        ExpInt := ROUND(ProdFac."Interest Rate (Max.)"/1200 * NetSal);

                        NetSal -= ExpInt;
                */


                MaxLoanAmount := LoanType."Maximum Loan Amount";

                if NetSal > MaxLoanAmount then
                    NetSal := MaxLoanAmount;



                Loans.Reset;
                Loans.SetRange("Member No.", saccoAccount."Member No.");
                Loans.SetRange("Recovery Mode", Loans."recovery mode"::Salary);
                Loans.SetRange("Mobile Loan", true);
                Loans.SetFilter("Outstanding Balance", '>0');
                if Loans.FindFirst then begin
                    LoanRep := 0;
                    repeat
                        Loans.CalcFields("Outstanding Balance");
                        LoanRep += Loans."Outstanding Balance";
                    until Loans.Next = 0;
                    if LoanRep + NetSal > MaxLoanAmount then
                        NetSal := 0;
                end;


                Message('NetSal %1 \Max Loan Amount as per Setup: %2 ', NetSal, MaxLoanAmount);


                exit(ROUND(NetSal, 1, '<'));
            end;
        end;

        exit(0);

    end;


    procedure PostSMSAlertCharges()
    var
        Blocked: Option " ",All,Credit,Debit;
        SMSALERTS: Record 52185478;
        saccoAccount: Record 52185730;
        Bal: Decimal;
        Docno: Code[20];
        Charges: Record 52185774;
        TotalCharges: Decimal;
        SMSAlertsAccount: Code[20];
        JTemplate: Code[10];
        JBatch: Code[10];
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        ExtDoc: Code[20];
        SystCreated: Boolean;
        RCount: Integer;
        GenSetup: Record 52185689;
        SaccoIncomeAcc: Code[20];
    begin


        SMSALERTS.Reset;
        SMSALERTS.SetRange(Posted, true);
        SMSALERTS.SetRange(Finalized, false);
        SMSALERTS.SetFilter("Account To Charge", '<>%1', '');
        SMSALERTS.SetFilter(msg_status_code, '102');
        if SMSALERTS.Find('-') then begin
            SMSALERTS.ModifyAll(Finalized, true);
        end;


        SMSALERTS.Reset;
        SMSALERTS.SetRange(Finalized, false);
        SMSALERTS.SetFilter("Account To Charge", '');
        SMSALERTS.SetFilter(msg_status_code, '102');
        if SMSALERTS.Find('-') then begin
            SMSALERTS.ModifyAll(Finalized, true);
        end;



        // Get SMS G/L and Charge Amount
        Charges.Reset;
        Charges.SetRange(Charges."Transaction Type", 'SMS CHARGES');
        if Charges.Find('-') then begin
            Charges.TestField(Charges."G/L Account");
            TotalCharges := Charges."Charge Amount";
        end;
        SMSALERTS.Reset;
        SMSALERTS.SetCurrentkey(date_created);
        SMSALERTS.SetRange(Finalized, false);
        SMSALERTS.SetFilter(msg_status_code, '102');
        SMSALERTS.SetRange("Split Charge", true);
        SMSALERTS.SetFilter("Balance (LCY)", '>=%1', TotalCharges);
        if SMSALERTS.Find('+') then begin
            RCount := 0;
            GenSetup.Get;
            //REPEAT
            RCount += 1;



            Docno := Format(SMSALERTS.msg_id);
            SaccoIncomeAcc := '';

            // Get SMS G/L and Charge Amount
            Charges.Reset;
            Charges.SetRange(Charges."Transaction Type", 'SMS CHARGES');
            if Charges.Find('-') then begin
                Charges.TestField(Charges."G/L Account");
                TotalCharges := Charges."Charge Amount";
            end;

            GenSetup.TestField("Sacco SMS Expense GL");
            GenSetup.TestField("Mobile Vendor Account");
            SaccoIncomeAcc := GenSetup."Sacco SMS Income GL";

            if not SMSALERTS."Charge Member" then begin

                SMSAlertsAccount := GenSetup."Sacco SMS Expense GL";
                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';
                ExtDoc := '';

                SaccoTrans.InitJournal(JTemplate, JBatch);
                SystCreated := true;

                SaccoTrans.JournalInsert(JTemplate, JBatch, Docno, Today, Accttype::Vendor, GenSetup."Mobile Vendor Account", CopyStr('SMS Alert - ' + Format(SMSALERTS.msg_id), 1, 50), Balacctype::"G/L Account",
                      SMSAlertsAccount, -TotalCharges, ExtDoc, '', TransType, saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", SystCreated);

                SMSALERTS.Posted := true;
                SMSALERTS.Finalized := true;
                SMSALERTS.Modify;

                SaccoTrans.PostJournal(JTemplate, JBatch);

            end
            else begin

                SMSAlertsAccount := GenSetup."Mobile Vendor Account";
                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."No.", SMSALERTS."Account To Charge");
                if saccoAccount.Find('-') then begin

                    Bal := GetAccountBalance(saccoAccount."No.");

                    if Bal >= TotalCharges then begin

                        Blocked := Blocked::" ";
                        if saccoAccount.Blocked <> saccoAccount.Blocked::" " then begin
                            Blocked := saccoAccount.Blocked;
                            saccoAccount.Blocked := saccoAccount.Blocked::" ";
                            saccoAccount.Modify;
                        end;


                        JTemplate := 'RECEIPT';
                        JBatch := 'SKYWORLD';
                        ExtDoc := '';

                        SaccoTrans.InitJournal(JTemplate, JBatch);
                        SystCreated := true;


                        SaccoTrans.JournalInsert(JTemplate, JBatch, Docno, Today, Accttype::Savings, saccoAccount."No.", CopyStr('SMS Alert', 1, 50), Balacctype::"G/L Account",
                              '', TotalCharges, ExtDoc, '', TransType, saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", SystCreated);
                        if not SMSALERTS."Split Charge" then begin

                            SaccoTrans.JournalInsert(JTemplate, JBatch, Docno, Today, Accttype::Vendor, GenSetup."Mobile Vendor Account", CopyStr('SMS Alert', 1, 50), Balacctype::"G/L Account",
                                  '', -TotalCharges, ExtDoc, '', TransType, saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", SystCreated);
                        end
                        else begin
                            GenSetup.TestField("Vendor SMS Split Amount");
                            GenSetup.TestField("Sacco SMS Income GL");
                            SaccoTrans.JournalInsert(JTemplate, JBatch, Docno, Today, Accttype::Vendor, GenSetup."Mobile Vendor Account", CopyStr('SMS Alert', 1, 50), Balacctype::"G/L Account",
                                  '', -(GenSetup."Vendor SMS Split Amount"), ExtDoc, '', TransType, saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", SystCreated);

                            SaccoTrans.JournalInsert(JTemplate, JBatch, Docno, Today, Accttype::"G/L Account", GenSetup."Sacco SMS Income GL", CopyStr('SMS Alert', 1, 50), Balacctype::"G/L Account",
                                  '', -(TotalCharges - GenSetup."Vendor SMS Split Amount"), ExtDoc, '', TransType, saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", SystCreated);

                        end;

                        SMSALERTS.Posted := true;
                        SMSALERTS.Finalized := true;
                        SMSALERTS.Modify;

                        SaccoTrans.PostJournal(JTemplate, JBatch);



                        if Blocked <> saccoAccount.Blocked then begin
                            saccoAccount.Blocked := Blocked;
                            saccoAccount.Modify;
                        end;
                    end;

                end
                else begin
                    SMSALERTS.Posted := true;
                    SMSALERTS.Finalized := true;
                    SMSALERTS.Modify;
                end;
            end;

            //UNTIL (SMSALERTS.NEXT =0) OR (RCount>=10);
        end;
    end;


    procedure CallServiceFunction(i: Integer)
    var
        SkyTransactions: Record 52185482;
        MobileLoan: Record 52185483;
        RandNo: Integer;
        Loans: Record 52185729;
        SavAcc: Record 52185730;
        GenSetup: Record 52185689;
        CoopProcessing: Codeunit "Coop Processing";
        CoopTrans: Record 52185459;
        CallSkyMobile: Codeunit "Call Sky Mobile";
        "Count": array[3] of Integer;
        LogTimes: Record 52186220;
    begin
        RandNo := Random(9);

        case i of
            1:
                begin
                    Count[1] := 0;
                    Count[2] := 0;
                    Count[3] := 0;
                    SkyTransactions.Reset;
                    SkyTransactions.SetFilter("Transaction ID", '<>%1', '');
                    SkyTransactions.SetRange(Posted, false);
                    if SkyTransactions.FindSet then begin
                        repeat

                            if SkyTransactions."Needs Change" = false then begin
                                if (SkyTransactions."Transaction Type" = SkyTransactions."transaction type"::"Balance Enquiry") or
                                    (SkyTransactions."Transaction Type" = SkyTransactions."transaction type"::"Account Transfer") or
                                    (SkyTransactions."Transaction Type" = SkyTransactions."transaction type"::"Mini-Statement") then begin
                                    Count[1] += 1;
                                    PostLightTransactions(SkyTransactions."Transaction ID");
                                end;
                            end;

                            if SkyTransactions."Transaction Type" = SkyTransactions."transaction type"::Paybill then begin
                                Count[2] += 1;
                                if SkyTransactions."Needs Change" then begin
                                    if SavAcc.Get(SkyTransactions."Member Account") then begin
                                        SkyTransactions."Needs Change" := false;
                                        SkyTransactions.Modify;
                                    end;


                                    SavAcc.Reset;
                                    SavAcc.SetRange("Transactional Mobile No", SkyTransactions."Mobile No.");
                                    SavAcc.SetRange("Product Type", '505');
                                    if SavAcc.FindFirst then begin
                                        SkyTransactions."Member Account" := SavAcc."No.";
                                        SkyTransactions."Needs Change" := false;
                                        SkyTransactions.Modify;
                                    end;

                                    SavAcc.Reset;
                                    SavAcc.SetRange("Mobile Phone No", SkyTransactions."Mobile No.");
                                    SavAcc.SetRange("Product Type", '505');
                                    if SavAcc.FindFirst then begin
                                        SkyTransactions."Member Account" := SavAcc."No.";
                                        SkyTransactions."Needs Change" := false;
                                        SkyTransactions.Modify;
                                    end;
                                end;

                                if Loans.Get(SkyTransactions."Member Account") then begin
                                    SavAcc.Reset;
                                    SavAcc.SetRange("Member No.", Loans."Member No.");
                                    SavAcc.SetRange("Product Type", '505');
                                    if SavAcc.FindFirst then begin
                                        SkyTransactions.Description := 'Loan Repayment ' + SkyTransactions."Member Account";
                                        SkyTransactions."Member Account" := SavAcc."No.";
                                        SkyTransactions."Loan No." := Loans."Loan No.";
                                        SkyTransactions."Transaction Type" := SkyTransactions."transaction type"::"Loan Repayment";
                                        SkyTransactions."Needs Change" := false;
                                        SkyTransactions.Modify;
                                    end;
                                end;
                                SkyTransactions.SetRange("Needs Change", false);
                                PostMpesaTransaction(SkyTransactions."Transaction ID", SkyTransactions."Session ID");
                            end;
                            SkyTransactions.SetRange("Needs Change", false);
                            if SkyTransactions."Transaction Type" <> SkyTransactions."transaction type"::Paybill then begin
                                Count[3] += 1;
                                PostMpesaTransaction(SkyTransactions."Transaction ID", SkyTransactions."Session ID");
                            end;
                        until (Count[1] + Count[2] + Count[3] = 150) or (SkyTransactions.Next = 0);
                    end;
                end;
            2:
                begin
                    Count[1] := 0;
                    Count[2] := 0;
                    MobileLoan.Reset;
                    MobileLoan.SetRange(Status, MobileLoan.Status::Pending);
                    MobileLoan.SetRange(Blocked, false);
                    MobileLoan.SetRange(Posted, false);
                    MobileLoan.SetRange(Deactivated, false);
                    if MobileLoan.Find('-') then begin
                        repeat
                            Count[1] += 1;
                            //ERROR('%1',MobileLoan."Entry No");
                            ProcessMobileLoan(MobileLoan."Entry No");
                        until (Count[1] = 50) or (MobileLoan.Next = 0);
                    end;

                    Count[2] := 0;
                    MobileLoan.Reset;
                    MobileLoan.SetRange(Status, MobileLoan.Status::"Pending Guarantors");
                    MobileLoan.SetRange(Blocked, false);
                    MobileLoan.SetRange(Posted, false);
                    MobileLoan.SetRange(Deactivated, false);
                    if MobileLoan.Find('-') then begin
                        repeat
                            Count[2] += 1;
                            //ERROR('%1',MobileLoan."Entry No");
                            ProcessMobileLoan(MobileLoan."Entry No");
                        until (Count[2] = 50) or (MobileLoan.Next = 0);
                    end;

                    PostBosaLoans;
                end;
            3:
                begin
                    /*-----------------------Separates business accouts creation, credititng from FOSA and messaging--------------*/
                    CreditBusinessAccounts;
                    SMSBusinessAccounts;
                    /*-----------------------Separates business accouts creation, credititng from FOSA and messaging--------------*/
                    GenSetup.Get();

                    if GenSetup."Sky Mobile Next Run Date" = Today then begin
                        MboostaRecovery;
                        MboosterAlerts;
                        //CallSkyMobile.UpdateSalaryLoanAppraisal;
                        GenSetup."Sky Mobile Next Run Date" := CalcDate('1D', Today);
                        GenSetup.Modify;
                    end;



                    /*
                    LoanReminders;
                    LoanPenalty;
                    RecoverLoanPenalty;
                    UpdateNextMahitajiDate;
                    COMMIT;
                    RecoverSalariedLoanPenalty;
                    */
                end;
            4:
                begin
                    PostATM.Run;
                    CoopTrans.Reset;
                    CoopTrans.SetRange(Skipped, false);
                    CoopTrans.SetRange(Posted, false);
                    if CoopTrans.FindFirst then begin
                        repeat
                            CoopProcessing.PostATM(CoopTrans."Transaction ID");
                        until CoopTrans.Next = 0;
                    end;
                end;
            5:
                begin
                    //Activate Business Account
                    //ActivateBusinessAccount();
                    RedirectSMS;
                    PinReset;
                    LoanExpiry;
                    ChargeMemberPINReset;
                end;
        end;

    end;


    procedure PortalPinReset(MobileNo: Code[30]) Response: Text
    var
        SkyAuth: Record 52185476;
        SavAcc: Record 52185730;
    begin
        MobileNo := '+' + MobileNo;

        Response := 'ERROR';

        SkyAuth.Reset;
        SkyAuth.SetRange(SkyAuth."Mobile No.", MobileNo);
        if SkyAuth.FindFirst then begin

            SavAcc.Reset;
            SavAcc.SetRange("Transactional Mobile No", MobileNo);
            SavAcc.SetRange(Blocked, SavAcc.Blocked::" ");
            if not SavAcc.FindFirst then begin
                Response := 'BLOCKED';
                exit;
            end;

            SavAcc.Reset;
            SavAcc.SetRange("Transactional Mobile No", MobileNo);
            SavAcc.SetRange(Status, SavAcc.Status::Deceased);
            if SavAcc.FindFirst then begin
                Response := 'DECEASED';
                exit;
            end;

            if (SkyAuth."User Status" = SkyAuth."user status"::Inactive) or (SkyAuth."User Status" = SkyAuth."user status"::" ") then
                Response := 'BLOCKED'
            else begin

                SkyAuth."Reset PIN" := true;
                SkyAuth.Modify;
                Commit;
                PinReset;
                Response := 'SUCCESS'
            end;


        end
        else begin
            Response := 'NOT_FOUND';
        end;
    end;


    procedure DeactivateMobileApp(MobileNo: Code[30]) Response: Text
    var
        SkyAuth: Record 52185476;
        SavAcc: Record 52185730;
    begin
        MobileNo := '+' + MobileNo;

        Response := 'ERROR';

        SkyAuth.Reset;
        SkyAuth.SetRange(SkyAuth."Mobile No.", MobileNo);
        if SkyAuth.FindFirst then begin

            SkyAuth.IMEI := '';
            SkyAuth."Mobile App Activated" := false;
            SkyAuth.Modify;
            Response := 'SUCCESS';

        end
        else begin
            Response := 'NOT_FOUND';
        end;
    end;


    procedure CheckBlackList(PhoneNo: Code[20]; AcctNo: Code[20]; Name: Text): Boolean
    var
        BPhoneNos: Record 52185472;
        BAccountNos: Record 52185473;
        BNames: Record 52185474;
    begin

        if PhoneNo <> '' then begin
            if BPhoneNos.Get(PhoneNo) then
                if BPhoneNos."Black-Listed" then
                    exit(true);
        end;



        if AcctNo <> '' then begin
            if BAccountNos.Get(AcctNo) then
                if BAccountNos."Black-Listed" then
                    exit(true);
        end;



        if Name <> '' then begin
            if BNames.Get(Name) then
                if BNames."Black-Listed" then
                    exit(true);
        end;

        exit(false);
    end;


    procedure CheckLinkHealth() Response: Text
    begin
        Response := 'OK';
    end;


    procedure MobileAppLogin(TransactionID: Code[20]; MobileNo: Code[20]) Response: Text
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        PhoneNo: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52185482;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[10];
        Dim2: Code[10];
        SystCreated: Boolean;
        SLedger: Record 52185732;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        TransactionDate: DateTime;
        Msg: Text;
        Stmt: Text;
        AccountToCharge: Code[20];
        MemberNo: Code[20];
        EntryCode: Code[20];
    begin
        MobileTrans.LockTable(true);
        EntryCode := TransactionID;
        TransactionDate := CurrentDatetime;

        Response := 'ERROR';


        // Get Excise duty G/L
        ExciseDutyGL := GetExciseDutyGL();
        ExciseDutyRate := GetExciseRate();
        ExciseDuty := 0;

        SaccoAccount := '';
        SaccoFee := 0;
        VendorAccount := '';
        VendorCommission := 0;

        MemberNo := '';

        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", MobileNo);
        if SavAcc.FindFirst then
            MemberNo := SavAcc."Member No.";

        //MESSAGE(MemberNo);
        if SavAcc.Blocked <> SavAcc.Blocked::" " then
            exit;

        AccountToCharge := '';

        SavAcc.Reset;
        SavAcc.SetRange("Member No.", MemberNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then
            AccountToCharge := SavAcc."No.";
        //MESSAGE(AccountToCharge);
        SMSAccount := '';
        SMSCharge := 0;

        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Mobile App Login");
        if CoopSetup.FindFirst then begin

            SMSAccount := CoopSetup."SMS Account";
            SMSCharge := CoopSetup."SMS Charge";


            SaccoAccount := CoopSetup."Sacco Fee Account";
            SaccoFee := CoopSetup."Sacco Fee";
            VendorAccount := CoopSetup."Vendor Commission Account";
            VendorCommission := CoopSetup."Vendor Commission";

            TotalCharge := SaccoFee + VendorCommission + SMSCharge;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
        end
        else begin
            Error('Setup Missing for %1', CoopSetup."Transaction Type");
        end;


        //PhoneNo:='+'+MobileNo;

        SavAcc.Reset;
        SavAcc.SetRange("No.", AccountToCharge);
        SavAcc.SetFilter(Status, '<>%1', SavAcc.Status::Deceased);
        if SavAcc.FindFirst then begin


            ProdFact.Get(SavAcc."Product Type");

            if (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::"Deposits Only") or
                (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::" ") then begin
                Error('The Account to Charge is not a Withdrawable Account');
            end;



            AccBal := GetAccountBalance(SavAcc."No.");
            if AccBal >= TotalCharge + ExciseDuty then begin

                //BUser.GET(USERID);

                //BUser.TESTFIELD("Cashier Journal Template");
                //BUser.TESTFIELD("Cashier Journal Batch");

                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';

                GenJournalBatch.Reset;
                GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                GenJournalBatch.SetRange(Name, JBatch);
                if not GenJournalBatch.FindFirst then begin
                    GenJournalBatch.Init;
                    GenJournalBatch."Journal Template Name" := JTemplate;
                    GenJournalBatch.Name := JBatch;
                    GenJournalBatch.Description := 'Sky World Batch';
                    GenJournalBatch.Init;
                end;


                MobileTrans.Init;
                MobileTrans."Entry No." := EntryCode;
                MobileTrans."Transaction ID" := TransactionID;
                MobileTrans."Session ID" := TransactionID;
                MobileTrans."Transaction Date" := Dt2Date(TransactionDate);
                MobileTrans."Transaction Time" := Dt2Time(TransactionDate);
                MobileTrans."Member Account" := SavAcc."No.";
                //MobileTrans."Statement Max Rows":=MaxNumberRows;
                //MobileTrans."Statement Start Date":=StartDate;
                //MobileTrans."Statement End Date":=EndDate;
                //MobileTrans."Account to Check":=StatementAccount;
                MobileTrans."Transaction Type" := MobileTrans."transaction type"::"Mobile App Login";
                MobileTrans.Description := Format(MobileTrans."Transaction Type");
                MobileTrans.Insert;
                Response := 'ACTIVE';
                /*
                MobileTrans.RESET;
                MobileTrans.SETRANGE("Transaction ID",TransactionID);
                MobileTrans.SETRANGE(Posted,FALSE);
                IF MobileTrans.FINDFIRST THEN BEGIN
        
                    DocNo := MobileTrans."Transaction ID";
                    PDate := MobileTrans."Transaction Date";
                    AccNo := MobileTrans."Member Account";
                    ExtDoc := '';
                    LoanNo := '';
                    TransType := TransType::" ";
                    Dim1 := SavAcc."Global Dimension 1 Code";
                    Dim2 := SavAcc."Global Dimension 2 Code";
                    SystCreated := TRUE;
        
                    SaccoTrans.InitJournal(JTemplate,JBatch);
        
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                                  '',VendorCommission,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccountToCharge,COPYSTR('SMS Charge',1,50),BalAccType::"G/L Account",
                                  SMSAccount,SMSCharge,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Sacco Fee ',1,50),BalAccType::"G/L Account",
                                  '',SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Excise Duty ',1,50),BalAccType::"G/L Account",
                                  ExciseDutyGL,ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
        
                    AccNo := VendorAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := TransType::" ";
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Vendor,AccNo,COPYSTR(MobileTrans.Description+' Commission',1,50),BalAccType::"G/L Account",
                                  '',-VendorCommission,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
                    AccNo := SaccoAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := TransType::" ";
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::"G/L Account",AccNo,COPYSTR(MobileTrans.Description+' Fee',1,50),BalAccType::"G/L Account",
                                  '',-SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
        
                    MobileTrans.Posted:=TRUE;
                    MobileTrans."Posted By":=USERID;
                    MobileTrans."Date Posted":=TODAY;
                    MobileTrans.MODIFY;
        
                    SaccoTrans.PostJournal(JTemplate,JBatch);
        
                END
                ELSE BEGIN
                    ERROR('Transaction Not Found');
                END;
                */

            end
            else begin
                Response := 'INSUFFICIENT_BAL';
            end;

        end
        else begin
            Response := 'INVALID_ACCOUNT';
        end;

    end;


    procedure GetAmountTransacted(Transaction: Text; AccountNo: Code[20]; Date: Date; Type: Option Daily,Weekly,Monthly) Amt: Decimal
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TransactionType: Option " ","Mpesa Withdrawal","Mpesa Deposit","Utility Payment","Loan Repayment","Balance Enquiry","Mini-Statement","Loan Disbursement","Account Transfer","Pay Loan From Account",Paybill,"Mobile App Login","Bank Transfer";
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        Continue: Boolean;
        MobileWithdrawalsBuffer: Record 52185755;
        AccBal: Decimal;
        SafcomAcc: Code[20];
        SafcomFee: Decimal;
        TransactionDate: DateTime;
        MemberID: Code[20];
        PrePaymentGL: Code[20];
        Loans: Record 52185729;
        LoanNo: Code[20];
        MemberNo: Code[20];
    begin
        Amt := 0;

        if (Transaction = 'Withdrawal Request') or (Transaction = 'Utility Request') or (Transaction = 'Pesalink Transfer Request') or (Transaction = 'Bank Transfer Request') then begin
            MobileWithdrawalsBuffer.Reset;
            MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer.Reversed, false);
            MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer."Account No", AccountNo);
            MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer.Source, MobileWithdrawalsBuffer.Source::"M-PESA");
            if Type = Type::Daily then
                MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer."Transaction Date", Date);
            if Type = Type::Weekly then
                MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer."Transaction Date", CalcDate('-CW', Date), CalcDate('CW', Date));
            if Type = Type::Monthly then
                MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer."Transaction Date", CalcDate('-CM', Date), CalcDate('CM', Date));
            if MobileWithdrawalsBuffer.Find('-') then begin
                MobileWithdrawalsBuffer.CalcSums(Amount);
                Amt := MobileWithdrawalsBuffer.Amount;
            end;
        end;
    end;


    procedure AddRemoveMobileLoanGuarantor(LoanEntryNo: Integer; MobileNo: Code[20]; "Action": Code[20]) Return: Text
    var
        SkyMobileLoans: Record 52185483;
        Members: Record 52185700;
        SavingsAccounts: Record 52185730;
        LoanType: Record 52185690;
        MobileLoanGuarantors: Record 52185470;
        RemGuar: Integer;
        SavAcc: Record 52185730;
        msg: Text;
        Loans: Record 52185729;
        LoanG: Record 52185739;
        DepAc: Code[20];
        successText: Text;
    begin

        Return := 'ERROR';

        MobileNo := GetGuarantorMobileNo(MobileNo);

        if StrLen(MobileNo) <> 13 then begin
            Return := 'ERROR::::Invalid Phone No.';
            exit;
        end;


        Members.Reset;
        Members.SetFilter("Mobile Phone No", '*' + MobileNo);
        if Members.FindFirst then begin
            /*
            IF Members.Status<>Members.Status::Active THEN BEGIN
                Return := 'ERROR::::1.'+Members.Name+' is not qualified to Guarantee';
                EXIT;
            END;
        
        
            Loans.RESET;
            Loans.SETRANGE("Member No.",Members."No.");
            Loans.SETFILTER("Outstanding Balance",'>0');
            Loans.SETFILTER("Loans Category-SASRA",'<>%1&<>%2',Loans."Loans Category-SASRA"::Perfoming,Loans."Loans Category-SASRA"::Watch);
            IF Loans.FINDFIRST THEN BEGIN
                Return := 'ERROR::::2.'+Members.Name+' is not qualified to Guarantee';
                EXIT;
            END;
        
        
            LoanG.RESET;
            LoanG.SETRANGE("Member No",Members."No.");
            LoanG.SETFILTER("Outstanding Balance",'>0');
            LoanG.SETRANGE("Self Guarantee",FALSE);
            IF LoanG.FINDFIRST THEN BEGIN
                IF LoanG.COUNT > 20  THEN BEGIN
                    Return := 'ERROR::::3.'+Members.Name+' is not qualified to Guarantee';
                    EXIT;
                END;
            END;
        
        
        
            LoanG.RESET;
            LoanG.SETRANGE("Member No",Members."No.");
            LoanG.SETFILTER("Outstanding Balance",'>0');
            LoanG.SETRANGE("Self Guarantee",TRUE);
            IF LoanG.FINDFIRST THEN BEGIN
                Return := 'ERROR::::4.'+Members.Name+' is not qualified to Guarantee';
                EXIT;
            END;
            */


        end
        else begin
            Return := 'ERROR::::Members Not Found';
            exit;
        end;



        if SkyMobileLoans.Get(LoanEntryNo) then begin
            LoanType.Get(SkyMobileLoans."Loan Product Type");

            if Action = 'DISCARD' then begin

                HMember.Get(SkyMobileLoans."Member No.");
                FName := HMember."First Name";
                if FName = '' then
                    FName := HMember."Second Name";
                Salute := 'Dear ' + FirstName(FName) + ',' + NewLine;

                msg := Salute + 'Your ' + LoanType."USSD Product Name" + ' request has been cancelled.';
                SkyMobileLoans.Remarks := 'Loan Discarded';
                SkyMobileLoans.Status := SkyMobileLoans.Status::Failed;
                SkyMobileLoans.Posted := true;
                SkyMobileLoans."Date Posted" := CurrentDatetime;//TODAY;
                SkyMobileLoans."Message Text" := msg;
                SendSms(Source::MBANKING, SkyMobileLoans."Telephone No", msg, Format(SkyMobileLoans."Entry No"), '', true, Priority, false);
                SkyMobileLoans.Modify;
                Return := 'SUCCESS::::' + successText;
                exit;
            end;
            if SkyMobileLoans."Member No." = Members."No." then begin
                Return := 'ERROR::::You are not allowed to guarantee your own loan';
                exit;
            end;

            DepAc := '';
            if LoanType."Minimum Guarantor Deposits" > 0 then begin
                SavAcc.Reset;
                SavAcc.SetRange("Member No.", Members."No.");
                SavAcc.SetRange("Product Category", SavAcc."product category"::"Deposit Contribution");
                if SavAcc.FindFirst then begin
                    SavAcc.CalcFields("Balance (LCY)");
                    if SavAcc."Balance (LCY)" < LoanType."Minimum Guarantor Deposits" then begin
                        Return := 'ERROR::::5' + Members.Name + ' is not qualified to Guarantee';
                        exit;
                    end;
                    DepAc := SavAcc."No.";
                end;

                if DepAc = '' then begin

                    Return := 'ERROR::::6' + Members.Name + ' is not qualified to Guarantee';
                    exit;
                end;
            end;


            successText := 'Your Request to add ' + Members.Name + ' has been received successfully';

            MobileLoanGuarantors.Reset;
            MobileLoanGuarantors.SetRange("Loan Entry No.", LoanEntryNo);
            MobileLoanGuarantors.SetRange("Guarantor Member No.", Members."No.");
            if MobileLoanGuarantors.FindFirst then begin
                if Action = 'REMOVE' then begin
                    MobileLoanGuarantors.Delete;
                    Return := 'SUCCESS::::' + 'Your Request to Remove ' + Members.Name + ' has been received successfully';


                    if SavAcc.Get(SkyMobileLoans."Account No") then begin
                        Priority := 211;
                        msg := 'Dear ' + Format(SkyMobileLoans."Account Name") + NewLine + 'You have removed ' + MobileLoanGuarantors."Guarantor Name" +
                        ' from your guarantorship request on ' + SkyMobileLoans."Loan Name" + ' loan amounting to KES ' + Format(SkyMobileLoans.Amount) + ' on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) +
                        NewLine + 'REF: ' + Format(SkyMobileLoans."Entry No");
                        SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, SavAcc."No.", '', true, Priority, false);



                        Priority := 211;
                        msg := 'Dear ' + Format(MobileLoanGuarantors."Guarantor Name") + NewLine + SkyMobileLoans."Account Name" +
                        ' has cancelled your guarantorship request on ' + SkyMobileLoans."Loan Name" + ' loan amounting to KES ' + Format(SkyMobileLoans.Amount) + ' on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) +
                        ' Please Accept/Decline By dialing ' + UssdCode + '.' + NewLine + 'REF: ' + Format(SkyMobileLoans."Entry No");
                        SendSms(Source::MBANKING, MobileLoanGuarantors."Guarantor Mobile No.", msg, SavAcc."No.", '', true, Priority, false);

                    end;


                end
                else
                    if Action = 'ADD' then begin
                        MobileLoanGuarantors."Loan Entry No." := LoanEntryNo;
                        MobileLoanGuarantors."Guarantor Mobile No." := MobileNo;
                        MobileLoanGuarantors."Guarantor Dep. A/C" := DepAc;
                        MobileLoanGuarantors.Validate("Guarantor Member No.", Members."No.");
                        MobileLoanGuarantors."Loan Product" := SkyMobileLoans."Loan Product Type";
                        MobileLoanGuarantors."Loan Product Name" := '';
                        MobileLoanGuarantors."Guarantor Name" := Members.Name;
                        MobileLoanGuarantors."Date Created" := CurrentDatetime;
                        MobileLoanGuarantors.Modify;

                        if MobileLoanGuarantors."Guarantor Accepted" = MobileLoanGuarantors."guarantor accepted"::Pending then
                            Return := 'SUCCESS::::' + successText;
                        if MobileLoanGuarantors."Guarantor Accepted" = MobileLoanGuarantors."guarantor accepted"::No then begin
                            MobileLoanGuarantors."Guarantor Accepted" := MobileLoanGuarantors."guarantor accepted"::Pending;
                            MobileLoanGuarantors.Modify;
                            Return := 'SUCCESS::::' + successText;
                        end;
                        if MobileLoanGuarantors."Guarantor Accepted" = MobileLoanGuarantors."guarantor accepted"::Yes then begin
                            Return := 'SUCCESS::::' + successText;
                        end;


                        if SavAcc.Get(SkyMobileLoans."Account No") then begin
                            Priority := 211;
                            msg := 'Dear ' + Format(SkyMobileLoans."Account Name") + NewLine + 'You have Requested ' + MobileLoanGuarantors."Guarantor Name" +
                            ' to be your Guarantor on ' + SkyMobileLoans."Loan Name" + ' amounting to KES ' + Format(SkyMobileLoans.Amount) + ' on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) +
                            ' Please notify them to Accept By dialing ' + UssdCode + '.' + NewLine + 'REF: ' + Format(SkyMobileLoans."Entry No");
                            SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, SavAcc."No.", '', true, Priority, false);



                            Priority := 211;
                            msg := 'Dear ' + Format(MobileLoanGuarantors."Guarantor Name") + NewLine + ', ' + SkyMobileLoans."Account Name" +
                            ' is Requesting your Guarantorship on ' + SkyMobileLoans."Loan Name" + ' amounting to KES ' + Format(SkyMobileLoans.Amount) + ' on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) +
                            ' Please Accept by dialing ' + UssdCode + ', Select Loans Option.' + NewLine + 'REF: ' + Format(SkyMobileLoans."Entry No");
                            SendSms(Source::MBANKING, MobileLoanGuarantors."Guarantor Mobile No.", msg, SavAcc."No.", '', true, Priority, false);

                        end;


                    end;
            end
            else begin
                MobileLoanGuarantors.Init;
                MobileLoanGuarantors."Loan Entry No." := LoanEntryNo;
                MobileLoanGuarantors."Guarantor Mobile No." := MobileNo;
                MobileLoanGuarantors.Validate("Guarantor Member No.", Members."No.");
                MobileLoanGuarantors."Loan Product" := SkyMobileLoans."Loan Product Type";
                MobileLoanGuarantors."Loan Product Name" := '';
                MobileLoanGuarantors."Guarantor Name" := Members."First Name" + ' ' + Members."Last Name";
                MobileLoanGuarantors."Date Created" := CurrentDatetime;
                MobileLoanGuarantors.Insert;
                Return := 'SUCCESS::::' + successText;


                if SavAcc.Get(SkyMobileLoans."Account No") then begin
                    Priority := 211;
                    msg := 'Dear ' + Format(SkyMobileLoans."Account Name") + NewLine + 'You have Requested ' + MobileLoanGuarantors."Guarantor Name" +
                    ' to be your Guarantor on ' + SkyMobileLoans."Loan Name" + ' amounting to KES ' + Format(SkyMobileLoans.Amount) + ' on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) +
                    ' Please notify them to Accept By dialing ' + UssdCode + '.' + NewLine + 'REF: ' + Format(SkyMobileLoans."Entry No");
                    SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, SavAcc."No.", '', true, Priority, false);



                    Priority := 211;
                    msg := 'Dear ' + Format(MobileLoanGuarantors."Guarantor Name") + NewLine + SkyMobileLoans."Account Name" +
                    ' is Requesting your Guarantorship on ' + SkyMobileLoans."Loan Name" + ' amounting to KES ' + Format(SkyMobileLoans.Amount) + ' on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) +
                    ' Please Accept/Decline By dialing ' + UssdCode + '.' + NewLine + 'REF: ' + Format(SkyMobileLoans."Entry No");
                    SendSms(Source::MBANKING, MobileLoanGuarantors."Guarantor Mobile No.", msg, SavAcc."No.", '', true, Priority, false);

                end;

            end;
        end;

    end;


    procedure GetRemainingGuarantorCount(LoanEntryNo: Integer): Integer
    var
        SkyMobileLoans: Record 52185483;
        Members: Record 52185700;
        SavingsAccounts: Record 52185730;
        LoanType: Record 52185690;
        MobileLoanGuarantors: Record 52185470;
        RemGuar: Integer;
    begin

        SkyMobileLoans.Get(LoanEntryNo);

        LoanType.Get(SkyMobileLoans."Loan Product Type");
        RemGuar := SkyMobileLoans."Expected Guarantors";

        MobileLoanGuarantors.Reset;
        MobileLoanGuarantors.SetRange("Loan Entry No.", LoanEntryNo);
        MobileLoanGuarantors.SetRange("Guarantor Accepted", MobileLoanGuarantors."guarantor accepted"::Yes);
        if MobileLoanGuarantors.FindFirst then begin
            RemGuar -= MobileLoanGuarantors.Count;
            if RemGuar < 0 then
                RemGuar := 0;
        end;
        exit(RemGuar);
    end;


    procedure MobileGuarantorsAccepted(LoanEntryNo: Integer): Boolean
    var
        SkyMobileLoans: Record 52185483;
        Members: Record 52185700;
        SavingsAccounts: Record 52185730;
        LoanType: Record 52185690;
        MobileLoanGuarantors: Record 52185470;
        RemGuar: Integer;
        TotalGuaranteed: Decimal;
        LoaneeDeposits: Decimal;
        MNo: Code[20];
        GCount: Integer;
        msg: Text;
    begin

        SkyMobileLoans.Get(LoanEntryNo);

        LoanType.Get(SkyMobileLoans."Loan Product Type");
        GCount := SkyMobileLoans."Expected Guarantors";
        TotalGuaranteed := 0;

        MobileLoanGuarantors.Reset;
        MobileLoanGuarantors.SetRange("Loan Entry No.", LoanEntryNo);
        MobileLoanGuarantors.SetRange("Guarantor Accepted", MobileLoanGuarantors."guarantor accepted"::Yes);
        if MobileLoanGuarantors.FindFirst then begin
            MobileLoanGuarantors.CalcSums("Amount Guaranteed");
            TotalGuaranteed := MobileLoanGuarantors."Amount Guaranteed";
        end;

        LoaneeDepAcc := '';
        LoaneeDeposits := 0;
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange("No.", SkyMobileLoans."Account No");
        if SavingsAccounts.FindFirst then begin
            MNo := SavingsAccounts."Member No.";
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange("Member No.", MNo);
            SavingsAccounts.SetRange("Product Type", '02');
            if SavingsAccounts.FindFirst then
                LoaneeDepAcc := SavingsAccounts."No.";
        end;

        if LoaneeDepAcc <> '' then
            LoaneeDeposits := GetAccountBalance(LoaneeDepAcc);


        if SkyMobileLoans."Requested Amount" > (TotalGuaranteed + LoaneeDeposits) then begin
            //Add Expected Guarantors
            SkyMobileLoans."Expected Guarantors" += 1;
            SkyMobileLoans.Modify;
            //Message the Lonee
            msg := GetSMSSalutation(SkyMobileLoans."Member No.") +
                  NewLine + 'The guarantors to your ' + SkyMobileLoans."Loan Name" + ' request of KES ' + Format(SkyMobileLoans.Amount) + ', are insufficient. Please add one'
                  + ' more.' + NewLine + 'REF: ' + SkyMobileLoans."Entry Code";
            SendSms(Source::MBANKING, SkyMobileLoans."Telephone No", msg, Format(SkyMobileLoans."Entry Code"), '', true, 205, false);
            exit(false);
        end else begin

            MobileLoanGuarantors.Reset;
            MobileLoanGuarantors.SetRange("Loan Entry No.", LoanEntryNo);
            MobileLoanGuarantors.SetRange("Guarantor Accepted", MobileLoanGuarantors."guarantor accepted"::Yes);
            if MobileLoanGuarantors.FindFirst then begin
                MobileLoanGuarantors.ModifyAll(Status, MobileLoanGuarantors.Status::Approved);
            end;
            exit(true);
        end;
    end;


    procedure UpdateAmountGuaranteed(LoanEntryNo: Integer)
    var
        SkyMobileLoans: Record 52185483;
        Members: Record 52185700;
        SavingsAccounts: Record 52185730;
        LoanType: Record 52185690;
        MobileLoanGuarantors: Record 52185470;
        RemGuar: Integer;
        TotalGuaranteed: Decimal;
        LoaneeDeposits: Decimal;
        MNo: Code[20];
    begin

        SkyMobileLoans.Get(LoanEntryNo);

        if SkyMobileLoans."Expected Guarantors" > 0 then begin
            MobileLoanGuarantors.Reset;
            MobileLoanGuarantors.SetRange("Loan Entry No.", LoanEntryNo);
            MobileLoanGuarantors.SetRange("Guarantor Accepted", MobileLoanGuarantors."guarantor accepted"::Yes);
            //MobileLoanGuarantors.SETRANGE(Status,MobileLoanGuarantors.Status::Approved);
            if MobileLoanGuarantors.FindFirst then begin
                repeat
                    MobileLoanGuarantors.Validate("Guarantor Member No.");
                    //MobileLoanGuarantors."Amount Guaranteed" := ROUND(SkyMobileLoans."Requested Amount"/SkyMobileLoans."Expected Guarantors",0.01,'>');
                    MobileLoanGuarantors.Modify;
                until MobileLoanGuarantors.Next = 0;
            end;
        end;
    end;


    procedure GetMicroLoanQualifiedAmount(AccountNo: Code[20]; LoanProductType: Code[20]): Decimal
    var
        DefaultedAmount: Integer;
        saccoAccount: Record 52185730;
        ProdFac: Record 52185690;
        salStartString: Text;
        SalStart: Date;
        SalEnd: Date;
        SalBuffer: Record 52185784;
        Salary1: Decimal;
        Salary2: Decimal;
        Date1: Date;
        Date2: Date;
        NetSal: Decimal;
        Loans: Record 52185729;
        LoanRep: Decimal;
        IntAmt: Decimal;
        PrAmt: Decimal;
        STODed: Decimal;
        StandingOrders: Record 52185717;
        MaxLoanAmount: Decimal;
        ExpInt: Decimal;
        LoanType: Record 52185690;
        DepAcc: Record 52185730;
        Salary3: Decimal;
        Date3: Date;
    begin

        saccoAccount.Reset;
        saccoAccount.SetRange("No.", AccountNo);
        if saccoAccount.Find('-') then begin

            if LoanType.Get(LoanProductType) then begin


                MaxLoanAmount := LoanType."Maximum Loan Amount";

                Loans.Reset;
                Loans.SetRange("Member No.", saccoAccount."Member No.");
                Loans.SetRange("Loan Product Type", LoanType."Product ID");
                Loans.SetRange(Posted, true);
                if not Loans.FindFirst then
                    MaxLoanAmount := MaxLoanAmount / 2;

                exit(MaxLoanAmount);

                LoanRep := 0;

                Loans.Reset;
                Loans.SetRange("Member No.", saccoAccount."Member No.");
                Loans.SetRange("Recovery Mode", Loans."recovery mode"::Salary);
                Loans.SetRange("Disbursement Date", 0D, Dmy2date(20, Date2dmy(Today, 2), Date2dmy(Today, 3)));
                Loans.SetRange("Mobile Loan", false);
                Loans.SetFilter("Outstanding Balance", '>0');
                if Loans.FindFirst then begin
                    repeat
                        Loans.CalcFields("Outstanding Balance");


                        IntAmt := 0;
                        case Loans."Interest Calculation Method" of
                            Loans."interest calculation method"::"Reducing Flat":
                                begin

                                    if ProdFac.Get(Loans."Loan Product Type") then begin
                                        IntAmt := ROUND((Loans."Approved Amount" * 0.6) * (Loans.Installments + 1) / (Loans.Installments * 100), 1, '=');
                                    end;
                                end;

                            Loans."interest calculation method"::"Reducing Balance":
                                begin
                                    IntAmt := ROUND(Loans."Outstanding Balance" * (Loans.Interest / 1200), 1, '=');
                                end;

                            Loans."interest calculation method"::"Straight Line":
                                begin
                                    IntAmt := ROUND(Loans."Approved Amount" * (Loans.Interest / 1200), 1, '=');
                                end
                            else begin
                                IntAmt := ROUND(Loans."Outstanding Balance" * (Loans.Interest / 1200), 1, '=');
                            end;
                        end;

                        PrAmt := Loans."Loan Principle Repayment";

                        case Loans."Interest Calculation Method" of
                            Loans."interest calculation method"::"Reducing Flat",
                            Loans."interest calculation method"::"Reducing Balance",
                            Loans."interest calculation method"::"Straight Line":
                                begin
                                    PrAmt := (Loans."Approved Amount" / Loans.Installments);
                                end else begin
                                PrAmt := (Loans.Repayment - IntAmt);
                            end;
                        end;



                        if PrAmt > Loans."Outstanding Balance" then
                            PrAmt := Loans."Outstanding Balance";

                        LoanRep += PrAmt + IntAmt;

                    until Loans.Next = 0;
                end;



                Loans.Reset;
                Loans.SetRange("Member No.", saccoAccount."Member No.");
                Loans.SetRange("Recovery Mode", Loans."recovery mode"::Salary);
                Loans.SetRange("Mobile Loan", true);
                Loans.SetFilter("Outstanding Balance", '>0');
                if Loans.FindFirst then begin
                    repeat
                        Loans.CalcFields("Outstanding Balance");
                        LoanRep += Loans."Outstanding Balance";
                    until Loans.Next = 0;
                end;



                STODed := 0;
                StandingOrders.Reset;
                StandingOrders.SetRange(StandingOrders."Source Account No.", saccoAccount."No.");
                StandingOrders.SetRange(StandingOrders.Status, StandingOrders.Status::Approved);
                StandingOrders.SetFilter("End Date", '>%1', Today);
                if StandingOrders.Find('-') then begin
                    repeat
                        STODed := STODed + StandingOrders.Amount;
                    until StandingOrders.Next = 0;
                end;

                //MESSAGE('NetSal %1 LoanRep %2 STODed %3',NetSal,LoanRep,STODed);

                NetSal := NetSal - LoanRep - STODed;

                //MESSAGE('Net %1',NetSal);

                if NetSal < 0 then
                    NetSal := 0;

                NetSal := ROUND(LoanType."Net Salary Multiplier %" / 100 * NetSal);


                //MESSAGE('90% NetSal %1 ',NetSal);

                DepAcc.Reset;
                DepAcc.SetRange("Member No.", saccoAccount."Member No.");
                DepAcc.SetRange("Product Category", DepAcc."product category"::"Deposit Contribution");
                if DepAcc.FindFirst then begin
                    DepAcc.CalcFields("Balance (LCY)");
                    if NetSal > DepAcc."Balance (LCY)" then
                        NetSal := DepAcc."Balance (LCY)";

                    if NetSal < 0 then
                        NetSal := 0;
                end
                else begin
                    NetSal := 0;
                end;


                //MESSAGE('NetSal %1 DepAcc."Balance (LCY)" %2 ',NetSal,DepAcc."Balance (LCY)");


                /*
                        ExpInt := ROUND(ProdFac."Interest Rate (Max.)"/1200 * NetSal);

                        NetSal -= ExpInt;
                */



                if NetSal > MaxLoanAmount then
                    NetSal := MaxLoanAmount;


                Loans.Reset;
                Loans.SetRange("Member No.", saccoAccount."Member No.");
                Loans.SetRange("Recovery Mode", Loans."recovery mode"::Salary);
                Loans.SetRange("Mobile Loan", true);
                Loans.SetFilter("Outstanding Balance", '>0');
                if Loans.FindFirst then begin
                    LoanRep := 0;
                    repeat
                        Loans.CalcFields("Outstanding Balance");
                        LoanRep += Loans."Outstanding Balance";
                    until Loans.Next = 0;
                    if LoanRep + NetSal > MaxLoanAmount then
                        NetSal := 0;
                end;


                //MESSAGE('NetSal %1 MaxLoanAmount %2 ',NetSal,MaxLoanAmount);


                exit(ROUND(NetSal, 1, '<'));
            end;
        end;

        exit(0);

    end;


    procedure ActionLoanGuarantorship(MobileNo: Code[20]; LoanEntryNo: Integer; PIN: Text; "Action": Code[20]) Response: Text
    var
        SkyMobileLoans: Record 52185483;
        Members: Record 52185700;
        SavingsAccounts: Record 52185730;
        LoanType: Record 52185690;
        MobileLoanGuarantors: Record 52185470;
        RemGuar: Integer;
        TotalGuaranteed: Decimal;
        LoaneeDeposits: Decimal;
        MNo: Code[20];
        SavAcc: Record 52185730;
        msg: Text;
        GMNo: Code[20];
    begin
        Response := 'ERROR';


        if CopyStr(MobileNo, 1, 1) <> '+' then
            MobileNo := '+' + MobileNo;

        if not CorrectPin(MobileNo, PIN) then begin
            Response := 'INCORRECT_PIN';
            exit;
        end;

        GMNo := '';

        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", MobileNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then
            GMNo := SavAcc."Member No.";

        SkyMobileLoans.Get(LoanEntryNo);


        MobileLoanGuarantors.Reset;
        MobileLoanGuarantors.SetRange("Loan Entry No.", LoanEntryNo);
        MobileLoanGuarantors.SetRange("Guarantor Member No.", GMNo);
        if MobileLoanGuarantors.FindFirst then begin
            if Action = 'ACCEPT' then begin
                MobileLoanGuarantors."Guarantor Accepted" := MobileLoanGuarantors."guarantor accepted"::Yes;

                if SavAcc.Get(SkyMobileLoans."Account No") then begin

                    Priority := 211;
                    msg := 'Dear ' + Format(SkyMobileLoans."Account Name") + ', ' + MobileLoanGuarantors."Guarantor Name" +
                    ' has accepted to guarantee the ' + SkyMobileLoans."Loan Name" + ' amounting to KES ' + Format(SkyMobileLoans.Amount) + ' on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) +
                    NewLine + 'REF: ' + Format(SkyMobileLoans."Entry No");
                    SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, SavAcc."No.", '', true, Priority, false);

                    Priority := 211;
                    msg := 'Dear ' + Format(MobileLoanGuarantors."Guarantor Name") + ', you have successfully accepted to guarantee ' + SkyMobileLoans."Account Name" +
                    ' ' + SkyMobileLoans."Loan Name" + ' of KES ' + Format(SkyMobileLoans.Amount) + ' on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) + '.' + NewLine + 'REF: ' + Format(SkyMobileLoans."Entry No");
                    SendSms(Source::MBANKING, MobileLoanGuarantors."Guarantor Mobile No.", msg, SavAcc."No.", '', true, Priority, false);

                    Response := 'SUCCESS';
                end;
            end
            else
                if Action = 'REJECT' then begin
                    MobileLoanGuarantors."Guarantor Accepted" := MobileLoanGuarantors."guarantor accepted"::No;
                    if SavAcc.Get(SkyMobileLoans."Account No") then begin
                        Priority := 211;
                        msg := 'Dear ' + Format(SkyMobileLoans."Account Name") + ', ' + MobileLoanGuarantors."Guarantor Name" +
                        ' has rejected your request to guarantee your ' + SkyMobileLoans."Loan Name" + ' on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) +
                        ' Kindly add a new guarantor.' + NewLine + 'REF: ' + Format(SkyMobileLoans."Entry No");
                        SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, SavAcc."No.", '', true, Priority, false);

                        Priority := 211;
                        msg := 'Dear ' + Format(MobileLoanGuarantors."Guarantor Name") + ', you have rejected ' + SkyMobileLoans."Account Name" + '''s request to guarantee ' +
                        ' ' + SkyMobileLoans."Loan Name" + ' on ' + Format(ddMMyyyy(Today)) + ' ' + Format(Time) + '.' + NewLine + 'REF: ' + Format(SkyMobileLoans."Entry No");
                        SendSms(Source::MBANKING, MobileLoanGuarantors."Guarantor Mobile No.", msg, SavAcc."No.", '', true, Priority, false);
                        Response := 'SUCCESS';
                    end;
                end;
            MobileLoanGuarantors.Modify;
        end
        else
            Error('Guarantor Not Found');

        Commit;
        ProcessMobileLoan(LoanEntryNo);
    end;


    procedure GetMaximumMobileLoanLimit(): Decimal
    var
        GenSetup: Record 52185689;
    begin


        GenSetup.Get;
        //EXIT(GenSetup."Maximum Mobile Loan Limit");
    end;


    procedure GetDividendLoanQualifiedAmount(AccountNo: Code[20]; LoanProductType: Code[20]): Decimal
    var
        DefaultedAmount: Integer;
        saccoAccount: Record 52185730;
        ProdFac: Record 52185690;
        salStartString: Text;
        SalStart: Date;
        SalEnd: Date;
        DividendProgression: Record 52185713;
        Salary1: Decimal;
        Salary2: Decimal;
        Date1: Date;
        Date2: Date;
        NetSal: Decimal;
        Loans: Record 52185729;
        LoanRep: Decimal;
        IntAmt: Decimal;
        PrAmt: Decimal;
        STODed: Decimal;
        StandingOrders: Record 52185717;
        MaxLoanAmount: Decimal;
        ExpInt: Decimal;
        LoanType: Record 52185690;
        DepAcc: Record 52185730;
        Salary3: Decimal;
        Date3: Date;
        Cust: Record 52185700;
        AccumilatedNetTakeHome: Decimal;
        TheYear: Integer;
    begin

        saccoAccount.Reset;
        saccoAccount.SetRange("No.", AccountNo);
        if saccoAccount.Find('-') then begin

            if LoanType.Get(LoanProductType) then begin


                Cust.Get(saccoAccount."Member No.");
                if (LoanType."Restrict to Emp. Code" <> '') and (LoanType."Restrict to Emp. Code" <> Cust."Employer Code") then
                    exit(0);


                TheYear := LoanType."Dividend Advance Year";

                DividendProgression.Reset;
                DividendProgression.SetFilter("Product Type", '=%1|=%2', '02', '03');
                DividendProgression.SetRange("Member No", saccoAccount."Member No.");
                //DividendProgression.SETRANGE("End Date",CALCDATE('-2Y+CY',TODAY));
                DividendProgression.SetRange(Year, TheYear);//here
                if DividendProgression.FindFirst then begin
                    DividendProgression.CalcSums("Net Dividends");
                    MaxLoanAmount := ROUND(DividendProgression."Net Dividends" * LoanType."Net Salary Multiplier %" / 100);
                end
                else
                    MaxLoanAmount := 0;


                LoanRep := 0;


                Loans.Reset;
                Loans.SetRange("Member No.", saccoAccount."Member No.");
                Loans.SetRange("Recovery Mode", Loans."recovery mode"::Dividend);
                Loans.SetFilter("Disbursement Date", '>=%1', LoanType."DAdvance Limit Period");
                Loans.SetFilter("Outstanding Balance", '>0');
                if Loans.FindFirst then begin
                    repeat
                        Loans.CalcFields("Outstanding Balance");
                        LoanRep += Loans."Outstanding Balance";
                    until Loans.Next = 0;
                end else begin
                    Loans.Reset;
                    Loans.SetRange("Member No.", saccoAccount."Member No.");
                    Loans.SetRange("Loan Product Type", LoanType."Product ID");
                    Loans.SetFilter("Disbursement Date", '>=%1', LoanType."DAdvance Limit Period");
                    Loans.SetFilter("Outstanding Balance", '>0');
                    if Loans.FindFirst then begin
                        repeat
                            Loans.CalcFields("Outstanding Balance");
                            LoanRep += Loans."Outstanding Balance";
                        until Loans.Next = 0;
                    end
                end;

                //        Loans.RESET;
                //        Loans.SETCURRENTKEY("Disbursement Date");
                //        Loans.SETRANGE("Member No.",saccoAccount."Member No.");
                //        Loans.SETRANGE("Loan Product Type",LoanType."Product ID");
                //        Loans.SETFILTER("Disbursement Date",'>=%1',LoanType."DAdvance Limit Period");
                //        IF Loans.FINDLAST THEN
                //            AccumilatedNetTakeHome := Loans."Approved Amount";

                MaxLoanAmount := MaxLoanAmount - LoanRep;
                //        IF AccumilatedNetTakeHome >= MaxLoanAmount THEN MaxLoanAmount := 0;
                if MaxLoanAmount <= 0 then MaxLoanAmount := 0;

                if MaxLoanAmount > LoanType."Mobile Max. Loan Amount" then
                    MaxLoanAmount := LoanType."Mobile Max. Loan Amount";

                exit(ROUND(MaxLoanAmount, 1, '<'));
            end;
        end;

        exit(0);
    end;


    procedure CheckDividendLoanMobileStatus() Response: Text
    var
        DefaultedAmount: Integer;
        saccoAccount: Record 52185730;
        ProdFac: Record 52185690;
        salStartString: Text;
        SalStart: Date;
        SalEnd: Date;
        DividendProgression: Record 52185713;
        Salary1: Decimal;
        Salary2: Decimal;
        Date1: Date;
        Date2: Date;
        NetSal: Decimal;
        Loans: Record 52185729;
        LoanRep: Decimal;
        IntAmt: Decimal;
        PrAmt: Decimal;
        STODed: Decimal;
        StandingOrders: Record 52185717;
        MaxLoanAmount: Decimal;
        ExpInt: Decimal;
        LoanType: Record 52185690;
        DepAcc: Record 52185730;
        Salary3: Decimal;
        Date3: Date;
        Cust: Record 52185700;
        ProductFactory: Record 52185690;
    begin
        ProductFactory.Reset;
        ProductFactory.SetFilter("Product ID", '416');
        if ProductFactory.Find('-') then begin
            if (ProductFactory.AvailableOnMobile = true) then begin
                Response := 'TRUE';
            end
            else begin
                Response := 'FALSE';
            end
        end
        else begin
            Response := 'FALSE';
        end;
    end;


    procedure GetNonSalariedLoanQualifiedAmount(AccountNo: Code[20]; LoanProductType: Code[20]; var MobileLoan: Record 52185483): Decimal
    var
        DefaultedAmount: Integer;
        saccoAccount: Record 52185730;
        ProdFac: Record 52185690;
        salStartString: Text;
        SalStart: Date;
        SalEnd: Date;
        SalBuffer: Record 52185784;
        Salary1: Decimal;
        Salary2: Decimal;
        Date1: Date;
        Date2: Date;
        NetSal: Decimal;
        Loans: Record 52185729;
        LoanRep: Decimal;
        IntAmt: Decimal;
        PrAmt: Decimal;
        STODed: Decimal;
        StandingOrders: Record 52185717;
        MaxLoanAmount: Decimal;
        ExpInt: Decimal;
        LoanType: Record 52185690;
        DepAcc: Record 52185730;
        Salary3: Decimal;
        Date3: Date;
        msg: Text;
        LBal: Decimal;
        Members: Record 52185700;
    begin

        /*
        saccoAccount.RESET;
        saccoAccount.SETRANGE("No.",AccountNo);
        IF saccoAccount.FIND('-') THEN BEGIN
        
            IF LoanType.GET(LoanProductType) THEN BEGIN
                MaxLoanAmount := 0;
        
                IF LoanType."Restrict to Emp. Code" <> '' THEN BEGIN
                    IF saccoAccount."Employer Code" <> LoanType."Restrict to Emp. Code" THEN
                        EXIT;
        
                    IF saccoAccount."Employer Code" = '' THEN
                        EXIT;
                END;
        
        
                IF LoanType."Available To Member" <> '' THEN BEGIN
                    IF saccoAccount."Member No." <> LoanType."Available To Member" THEN
                        EXIT;
        
                END;
        
                Members.GET(saccoAccount."Member No.");
                IF Members."Next Mahitaji Date" <> 0D THEN BEGIN
        
                    Rating.RESET;
                    Rating.SETRANGE("Loan Product",LoanProductType);
                    Rating.SETRANGE("Member No.",saccoAccount."Member No.");
                    IF Rating.FINDLAST THEN
                        Rating.DELETEALL;
        
                    IF Members."Next Mahitaji Date" > TODAY THEN BEGIN
        
                        msg:='Your '+LoanType."USSD Product Name"+' request has failed, your account has been blacklisted for 3 months up to '+FORMAT(Members."Next Mahitaji Date");
                        MobileLoan.Remarks:='Member account has been blacklisted for 3 months up to '+FORMAT(Members."Next Mahitaji Date");
                        MobileLoan.Status:=MobileLoan.Status::Failed;
                        MobileLoan.Posted:=TRUE;
                        MobileLoan."Date Posted":=CURRENTDATETIME;//TODAY;
                        MobileLoan.Message:=msg;
                        SendSms(Source::MBANKING,saccoAccount."Transactional Mobile No",msg,FORMAT(MobileLoan."Entry No"),'',TRUE,Priority,FALSE);
                        MobileLoan.MODIFY;
                        EXIT;
        
                    END
                    ELSE BEGIN
                        Members."Next Mahitaji Date" := 0D;
                        Members."Mahitaji Defaulter" := FALSE;
                        Members.MODIFY;
                    END;
                END;
        
                DepAcc.RESET;
                DepAcc.SETRANGE("Member No.",saccoAccount."Member No.");
                DepAcc.SETRANGE("Product Category",DepAcc."Product Category"::"Deposit Contribution");
                IF DepAcc.FINDFIRST THEN BEGIN
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < LoanType."Non-Salaried Min. Deposits" THEN BEGIN
        
                        msg:='Your '+LoanType."USSD Product Name"+' request has failed, your deposit contribution is below the minimum of KES. '+FORMAT(LoanType."Non-Salaried Min. Deposits");
                        MobileLoan.Remarks:='Member Deposits are below minimum of KES'+FORMAT(LoanType."Non-Salaried Min. Deposits");
                        MobileLoan.Status:=MobileLoan.Status::Failed;
                        MobileLoan.Posted:=TRUE;
                        MobileLoan."Date Posted":=CURRENTDATETIME;//TODAY;
                        MobileLoan.Message:=msg;
                        SendSms(Source::MBANKING,saccoAccount."Transactional Mobile No",msg,FORMAT(MobileLoan."Entry No"),'',TRUE,Priority,FALSE);
                        MobileLoan.MODIFY;
                        EXIT;
                    END;
                END
                ELSE
                    EXIT(0);
        
                DepAcc.RESET;
                DepAcc.SETRANGE("Member No.",saccoAccount."Member No.");
                DepAcc.SETRANGE("Product Category",DepAcc."Product Category"::"Share Capital");
                IF DepAcc.FINDFIRST THEN BEGIN
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < LoanType."Non-Salaried Min. Share Cap" THEN BEGIN
        
                        msg:='Your '+LoanType."USSD Product Name"+' request has failed, your Share Capital is below the minimum of KES. '+FORMAT(LoanType."Non-Salaried Min. Share Cap");
                        MobileLoan.Remarks:='Member Share Capital are below minimum of KES'+FORMAT(LoanType."Non-Salaried Min. Share Cap");
                        MobileLoan.Status:=MobileLoan.Status::Failed;
                        MobileLoan.Posted:=TRUE;
                        MobileLoan."Date Posted":=CURRENTDATETIME;//TODAY;
                        MobileLoan.Message:=msg;
                        SendSms(Source::MBANKING,saccoAccount."Transactional Mobile No",msg,FORMAT(MobileLoan."Entry No"),'',TRUE,Priority,FALSE);
                        MobileLoan.MODIFY;
                        EXIT;
                    END;
                END
                ELSE
                    EXIT(0);
        
                DepAcc.RESET;
                DepAcc.SETRANGE("Member No.",saccoAccount."Member No.");
                DepAcc.SETRANGE("Product Category",DepAcc."Product Category"::"Deposit Contribution");
                IF DepAcc.FINDFIRST THEN BEGIN
                    DepAcc.SETRANGE("Date Filter",CALCDATE('-180D',TODAY),TODAY);
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < 12500 THEN BEGIN
        
                        STOFound := FALSE;
                        StandingOrders.RESET;
                        StandingOrders.SETRANGE(StandingOrders."Source Account No.",saccoAccount."No.");
                        StandingOrders.SETRANGE(StandingOrders.Status , StandingOrders.Status::Approved);
                        StandingOrders.SETFILTER("End Date" ,'>%1',TODAY);
                        IF StandingOrders.FIND('-') THEN BEGIN
                            REPEAT
                                STOLines.RESET;
                                STOLines.SETRANGE("Document No.",StandingOrders."No.");
                                STOLines.SETRANGE("Destination Account No.",DepAcc."No.");
                                STOLines.SETRANGE(Amount,500);
                                IF STOLines.FINDFIRST THEN
                                  STOFound := TRUE;
                            UNTIL StandingOrders.NEXT = 0;
                        END;
        
                        IF (NOT STOFound) OR ((STOFound)AND(DepAcc."Balance (LCY)"<2500)) THEN BEGIN
                            msg:='Your '+LoanType."USSD Product Name"+' request has failed, You are not upto date in your Deposit contribution.';
                            MobileLoan.Remarks:='Member not upto date in Deposit contribution. Amount Contributed in 180Days is '+FORMAT(DepAcc."Balance (LCY)");
                            MobileLoan.Status:=MobileLoan.Status::Failed;
                            MobileLoan.Posted:=TRUE;
                            MobileLoan."Date Posted":=CURRENTDATETIME;//TODAY;
                            MobileLoan.Message:=msg;
                            SendSms(Source::MBANKING,saccoAccount."Transactional Mobile No",msg,FORMAT(MobileLoan."Entry No"),'',TRUE,Priority,FALSE);
                            MobileLoan.MODIFY;
                            EXIT;
                        END;
                    END;
                    DepAcc.SETRANGE("Date Filter",CALCDATE('-60D',TODAY),TODAY);
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < 2500 THEN BEGIN
        
                        STOFound := FALSE;
                        StandingOrders.RESET;
                        StandingOrders.SETRANGE(StandingOrders."Source Account No.",saccoAccount."No.");
                        StandingOrders.SETRANGE(StandingOrders.Status , StandingOrders.Status::Approved);
                        StandingOrders.SETFILTER("End Date" ,'>%1',TODAY);
                        IF StandingOrders.FIND('-') THEN BEGIN
                            REPEAT
                                STOLines.RESET;
                                STOLines.SETRANGE("Document No.",StandingOrders."No.");
                                STOLines.SETRANGE("Destination Account No.",DepAcc."No.");
                                STOLines.SETRANGE(Amount,500);
                                IF STOLines.FINDFIRST THEN
                                  STOFound := TRUE;
                            UNTIL StandingOrders.NEXT = 0;
                        END;
        
                        IF (NOT STOFound) OR ((STOFound)AND(DepAcc."Balance (LCY)"<500)) THEN BEGIN
                            msg:='Your '+LoanType."USSD Product Name"+' request has failed, You are not upto date in your Deposit contribution.';
                            MobileLoan.Remarks:='Member not upto date in Deposit contribution. Amount Contributed in 60Days is '+FORMAT(DepAcc."Balance (LCY)");
                            MobileLoan.Status:=MobileLoan.Status::Failed;
                            MobileLoan.Posted:=TRUE;
                            MobileLoan."Date Posted":=CURRENTDATETIME;//TODAY;
                            MobileLoan.Message:=msg;
                            SendSms(Source::MBANKING,saccoAccount."Transactional Mobile No",msg,FORMAT(MobileLoan."Entry No"),'',TRUE,Priority,FALSE);
                            MobileLoan.MODIFY;
                            EXIT;
                        END;
                    END;
                END
                ELSE
                    EXIT(0);
        
        
                DepAcc.RESET;
                DepAcc.SETRANGE("Member No.",saccoAccount."Member No.");
                DepAcc.SETRANGE("Product Category",DepAcc."Product Category"::"Benevolent Fund");
                IF DepAcc.FINDFIRST THEN BEGIN
                    DepAcc.SETRANGE("Date Filter",CALCDATE('-180D',TODAY),TODAY);
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < 1500 THEN BEGIN
                        msg:='Your '+LoanType."USSD Product Name"+' request has failed, You are not upto date in your benevolent contribution.';
                        MobileLoan.Remarks:='Member not upto date in benevolent contribution. Amount Contributed in 180Days is '+FORMAT(DepAcc."Balance (LCY)");
                        MobileLoan.Status:=MobileLoan.Status::Failed;
                        MobileLoan.Posted:=TRUE;
                        MobileLoan."Date Posted":=CURRENTDATETIME;//TODAY;
                        MobileLoan.Message:=msg;
                        SendSms(Source::MBANKING,saccoAccount."Transactional Mobile No",msg,FORMAT(MobileLoan."Entry No"),'',TRUE,Priority,FALSE);
                        MobileLoan.MODIFY;
                        EXIT;
                    END;
                    DepAcc.SETRANGE("Date Filter",CALCDATE('-60D',TODAY),TODAY);
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < 300 THEN BEGIN
                        msg:='Your '+LoanType."USSD Product Name"+' request has failed, You are not upto date in your benevolent contribution.';
                        MobileLoan.Remarks:='Member not upto date in benevolent contribution. Amount Contributed in 60Days is '+FORMAT(DepAcc."Balance (LCY)");
                        MobileLoan.Status:=MobileLoan.Status::Failed;
                        MobileLoan.Posted:=TRUE;
                        MobileLoan."Date Posted":=CURRENTDATETIME;//TODAY;
                        MobileLoan.Message:=msg;
                        SendSms(Source::MBANKING,saccoAccount."Transactional Mobile No",msg,FORMAT(MobileLoan."Entry No"),'',TRUE,Priority,FALSE);
                        MobileLoan.MODIFY;
                        EXIT;
                    END;
                END
                ELSE
                    EXIT(0);
        
        
                MaxLoanAmount := LoanType."Non-Salaried Max Loan Amt";
                CreditLimit := LoanCreditRating(saccoAccount."Member No.",LoanType."Product ID",FALSE);
                CreditLimit := LoanCreditRating(saccoAccount."Member No.",LoanType."Product ID",FALSE);
        
                IF MaxLoanAmount > CreditLimit THEN
                  MaxLoanAmount := CreditLimit;
        
                Loans.RESET;
                Loans.SETRANGE("Member No.",saccoAccount."Member No.");
                Loans.SETRANGE("Loan Product Type",LoanType."Product ID");
                Loans.SETRANGE("Non-Salaried",TRUE);
                Loans.SETRANGE("Mobile Loan",TRUE);
                Loans.SETFILTER("Outstanding Balance",'>0');
                IF Loans.FINDFIRST THEN BEGIN
                  REPEAT
                      Loans.CALCFIELDS("Outstanding Balance","Outstanding Penalty");
                      LBal := Loans."Outstanding Balance"+Loans."Outstanding Penalty";
                      MaxLoanAmount -= LBal;
        
                      IF MaxLoanAmount <= 0 THEN BEGIN
                          msg:='Your '+LoanType."USSD Product Name"+' request has failed, You have exceeded your loan limit';
                          MobileLoan.Remarks:='Member has exceeded loan limit';
                          MobileLoan.Status:=MobileLoan.Status::Failed;
                          MobileLoan.Posted:=TRUE;
                          MobileLoan."Date Posted":=CURRENTDATETIME;//TODAY;
                          MobileLoan.Message:=msg;
                          SendSms(Source::MBANKING,saccoAccount."Transactional Mobile No",msg,FORMAT(MobileLoan."Entry No"),'',TRUE,Priority,FALSE);
                          MobileLoan.MODIFY;
                          EXIT;
                      END;
        
                  UNTIL Loans.NEXT = 0;
                END;
        
                IF MaxLoanAmount < 0 THEN
                  MaxLoanAmount := 0;
        
        
        
        
        
                EXIT(ROUND(MaxLoanAmount,1,'<'));
            END;
        END;
        */

        exit(0);

    end;


    procedure LoanReminders()
    var
        Loans: Record 52185729;
        msg: Text;
        SavAcc: Record 52185730;
        LBal: Decimal;
        ProductFactory: Record 52185690;
    begin
        Loans.Reset;
        Loans.SetRange("Mobile Loan", true);
        Loans.SetFilter("Loan Product Type", '<>%1', '416');
        Loans.SetFilter("Outstanding Balance", '>0');
        Loans.SetFilter("Disbursement Date", '<%1', CalcDate('-18D', Today));
        Loans.SetFilter("Last Mobile Loan Rem. Date", '<%1', Today);
        Loans.SetFilter("Mobile Loan Reminder", '%1|%2|%3',
                        Loans."mobile loan reminder"::" ",
                        Loans."mobile loan reminder"::"1",
                        Loans."mobile loan reminder"::"2");
        if Loans.FindFirst then begin
            repeat
                if ProductFactory.Get(Loans."Loan Product Type") then begin
                    if ProductFactory."Auto Send SMS Alerts" then begin
                        Loans.CalcFields("Outstanding Balance");
                        LBal := Loans."Outstanding Balance";
                        Priority := 241;
                        Loans."Last Mobile Loan Rem. Date" := Today;

                        HMember.Get(Loans."Member No.");
                        FName := HMember."First Name";
                        if FName = '' then
                            FName := HMember."Second Name";

                        if SavAcc.Get(Loans."Disbursement Account No") then begin
                            if Loans."Mobile Loan Reminder" = Loans."mobile loan reminder"::" " then begin
                                if CalcDate('19D', Loans."Disbursement Date") <= Today then begin
                                    msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your Mahitaji Mobile Loan Balance of Kshs ' + Format(LBal) + ' is due on ' + ddMMyyyy(Loans."Repayment Start Date") + '. To pay, Dial ' + UssdCode + ' or go to Harambee M-Cash App';
                                    SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Loans."Loan No.", SavAcc."No.", false, Priority, false);
                                    Loans."Mobile Loan Reminder" := Loans."mobile loan reminder"::"1";
                                    Loans.Modify;
                                    Commit;
                                end;
                            end
                            else
                                if Loans."Mobile Loan Reminder" = Loans."mobile loan reminder"::"1" then begin
                                    if CalcDate('27D', Loans."Disbursement Date") <= Today then begin
                                        msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your Mahitaji Mobile Loan Balance of Kshs ' + Format(LBal) + ' is due on ' + ddMMyyyy(Loans."Repayment Start Date") + '. To pay, Dial ' + UssdCode + ' or go to Harambee M-Cash App';
                                        SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Loans."Loan No.", SavAcc."No.", false, Priority, false);
                                        Loans."Mobile Loan Reminder" := Loans."mobile loan reminder"::"2";
                                        Loans.Modify;
                                        Commit;
                                    end;
                                end
                                else
                                    if Loans."Mobile Loan Reminder" = Loans."mobile loan reminder"::"2" then begin
                                        if CalcDate('29D', Loans."Disbursement Date") <= Today then begin
                                            msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your Mahitaji Mobile Loan Balance is Kshs ' + Format(LBal) + '. Kindly settle by ' + ddMMyyyy(Loans."Repayment Start Date") + ' to avoid 10% penalty and product black-list.';
                                            SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Loans."Loan No.", SavAcc."No.", false, Priority, false);
                                            Loans."Mobile Loan Reminder" := Loans."mobile loan reminder"::"3";
                                            Loans.Modify;
                                            Commit;
                                        end;
                                    end;
                        end;
                    end;
                end;
                Loans."Last Mobile Loan Rem. Date" := Today;
                Loans.Modify;
            until Loans.Next = 0;
        end;
    end;


    procedure MboostaRecovery()
    var
        msg: Text;
        SavAcc: Record 52185730;
        Loans: Record 52185729;
        LoanType: Record 52185690;
        CLedger: Record 52185733;
        PenaltyAmt: Decimal;
        JTemplate: Code[10];
        JBatch: Code[10];
        DocNo: Code[20];
        PDate: Date;
        AccNo: Code[20];
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal,"Penalty Due","Penalty Paid";
        Dim1: Code[10];
        Dim2: Code[10];
        SystCreated: Boolean;
        LoanNo: Code[20];
        FullyRecovered: Integer;
        LBal: Decimal;
        Members: Record 52185700;
    begin
        Loans.Reset;
        Loans.SetFilter("Loan Product Type", '126');
        Loans.SetFilter("Outstanding Balance", '>0');
        Loans.SetFilter("Disbursement Date", '<%1', CalcDate('-30D', Today));
        if Loans.FindFirst then begin
            repeat
                LoanNo := Loans."Loan No.";
                if CreditAccounts.Get(Loans."Loan Account") then;
                if (CreditAccounts.Blocked = CreditAccounts.Blocked::" ") then begin
                    LoanType.Get(Loans."Loan Product Type");
                    RecoverLoanFromSavings(Loans."Loan No.");
                end;
            until Loans.Next = 0;
        end;

        Loans.Reset;
        Loans.SetFilter("Loan Product Type", '126');
        Loans.SetFilter("Outstanding Balance", '>0');
        Loans.SetFilter("Disbursement Date", '<=%1', CalcDate('-35D', Today));
        Loans.SetFilter("Next Penalty Date", '<=%1', Today);
        if Loans.FindFirst then begin
            repeat
                LoanNo := Loans."Loan No.";

                if CreditAccounts.Get(Loans."Loan Account") then;


                if (CreditAccounts.Blocked = CreditAccounts.Blocked::" ") then begin
                    LoanType.Get(Loans."Loan Product Type");
                    LoanType.TestField("Penalty Percentage");



                    if LoanType."Penalty Percentage" > 0 then begin
                        Loans.CalcFields("Outstanding Balance");

                        CLedger.Reset;
                        CLedger.SetRange("Loan No", Loans."Loan No.");
                        CLedger.SetRange("Transaction Type", CLedger."transaction type"::"Interest Due");
                        CLedger.SetRange("Posting Date", CalcDate('-CM', Today), CalcDate('CM', Today));
                        CLedger.SetRange(Reversed, false);
                        if not CLedger.FindFirst then begin
                            PenaltyAmt := ROUND((LoanType."Penalty Percentage" / 100 * Loans."Outstanding Balance"), 1, '>');
                            if PenaltyAmt > 0 then begin

                                JTemplate := 'RECEIPT';
                                JBatch := 'SKYWORLD';
                                DocNo := Loans."Loan No.";
                                PDate := Today;
                                LoanType.TestField("Penalty Paid Account");
                                Dim1 := Loans."Global Dimension 1 Code";
                                Dim2 := Loans."Global Dimension 2 Code";
                                SystCreated := true;
                                AccNo := Loans."Loan Account";

                                SaccoTrans.InitJournal(JTemplate, JBatch);
                                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, AccNo, CopyStr(LoanType."Product Description" + ' Interest Due', 1, 50), Balacctype::"G/L Account",
                                              LoanType."Penalty Paid Account", PenaltyAmt, '', LoanNo, Transtype::"Interest Due", Dim1, Dim2, SystCreated);
                                SaccoTrans.PostJournal(JTemplate, JBatch);

                                Loans."Penalty Charge" := true;
                                Loans.Defaulted := true;
                                Loans."Next Penalty Date" := CalcDate('1M', Today);
                                Loans."Maximum Limit" := LoanType."MLoan Appraisal Start Point";
                                Loans.Modify;

                                Loans.CalcFields("Outstanding Balance", "Outstanding Interest");
                                LBal := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                                SavAcc.Reset;
                                SavAcc.SetRange("Member No.", Loans."Member No.");
                                SavAcc.SetRange("Product Type", '505');
                                if SavAcc.FindFirst then begin
                                    msg := 'Dear Member, a penalty of KES ' + Format(PenaltyAmt) + ' has been charged on your ' + LoanType."USSD Product Name" + '. Current Loan Balance is KES ' + Format(LBal);
                                    SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Loans."Loan No.", SavAcc."No.", false, Priority, false);
                                end;
                            end;
                        end;

                    end;
                end;
            until Loans.Next = 0;
        end;
    end;


    procedure RecoverLoanPenalty()
    var
        msg: Text;
        SavAcc: Record 52185730;
        Loans: Record 52185729;
        LoanType: Record 52185690;
        CLedger: Record 52185733;
        PenaltyAmt: Decimal;
        JTemplate: Code[10];
        JBatch: Code[10];
        DocNo: Code[20];
        PDate: Date;
        AccNo: Code[20];
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal,"Penalty Due","Penalty Paid";
        Dim1: Code[10];
        Dim2: Code[10];
        SystCreated: Boolean;
        RunBal: Decimal;
        RecAmt: Decimal;
        LoanNo: Code[20];
        LBal: Decimal;
        FullyRec: Boolean;
        CreditAccounts: Record 52185731;
        Savings: Record 52185730;
    begin
        Loans.Reset;
        //Loans.SETRANGE("Loan No.",LoanNo);
        //Loans.SETRANGE("Non-Salaried",TRUE);
        Loans.SetRange("Mobile Loan", true);
        Loans.SetFilter("Loan Product Type", '<>%1', '416');
        Loans.SetFilter("Outstanding Balance", '>0');
        Loans.SetFilter("Repayment Start Date", '<%1', Today);
        if Loans.FindFirst then begin
            repeat
                LoanType.Get(Loans."Loan Product Type");
                LoanNo := Loans."Loan No.";
                Loans.CalcFields("Outstanding Balance");
                LBal := Loans."Outstanding Balance";
                FullyRec := false;
                if CreditAccounts.Get(Loans."Loan Account") then begin
                    if CreditAccounts.Blocked = CreditAccounts.Blocked::" " then begin
                        /*
                        CLedger.RESET;
                        CLedger.SETRANGE("Loan No",Loans."Loan No.");
                        CLedger.SETRANGE("Transaction Type",CLedger."Transaction Type"::"Penalty Due");
                        CLedger.SETRANGE(Reversed,FALSE);
                        IF CLedger.FINDFIRST THEN BEGIN
        
                            SavAcc.RESET;
                            SavAcc.SETRANGE("Member No.",Loans."Member No.");
                            SavAcc.SETRANGE("No.",Loans."Disbursement Account No");
                            SavAcc.SETFILTER("Balance (LCY)",'>0');
                            SavAcc.SETRANGE(Blocked,SavAcc.Blocked::" ");
                            IF SavAcc.FINDFIRST THEN BEGIN
        
                                SavAcc.CALCFIELDS("Balance (LCY)");
                                RunBal := GetAccountBalance(SavAcc."No.");
        
                                IF RunBal > LBal THEN
                                  FullyRec := TRUE
                                ELSE
                                  FullyRec := FALSE;
        
                                JTemplate:='RECEIPT';
                                JBatch:='SKYWORLD';
                                DocNo := Loans."Loan No.";
                                PDate := TODAY;
                                Dim1 := Loans."Global Dimension 1 Code";
                                Dim2 := Loans."Global Dimension 2 Code";
                                SystCreated := TRUE;
                                AccNo := Loans."Loan Account";
        
                                SaccoTrans.InitJournal(JTemplate,JBatch);
        
                                IF RunBal > 0 THEN BEGIN
                                    RecAmt := Loans."Outstanding Penalty";
                                    IF RecAmt < 0 THEN
                                      RecAmt := 0;
        
                                    IF RecAmt > RunBal THEN
                                        RecAmt := RunBal;
                                    RunBal -= RecAmt;
        
                                    IF RecAmt > 0 THEN BEGIN
        
                                        SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Credit,AccNo,COPYSTR(LoanType."Product Description"+' Penalty Offset',1,50),BalAccType::"G/L Account",
                                              '',-RecAmt,'',LoanNo,TransType::"Penalty Paid",Dim1,Dim2,SystCreated);
        
                                        SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,SavAcc."No.",COPYSTR(LoanType."Product Description"+' Penalty Offset',1,50),BalAccType::"G/L Account",
                                              '',RecAmt,'',LoanNo,TransType::"Penalty Paid",Dim1,Dim2,SystCreated);
        
                                    END;
        
        
        
                                    IF RunBal > 0 THEN BEGIN
                                        RecAmt := Loans."Outstanding Balance";
                                        IF RecAmt < 0 THEN
                                          RecAmt := 0;
        
                                        IF RecAmt > RunBal THEN
                                            RecAmt := RunBal;
                                        RunBal -= RecAmt;
        
                                        IF RecAmt > 0 THEN BEGIN
        
                                            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Credit,AccNo,COPYSTR(LoanType."Product Description"+' Principal Offset',1,50),BalAccType::"G/L Account",
                                                  '',-RecAmt,'',LoanNo,TransType::Repayment,Dim1,Dim2,SystCreated);
        
                                            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,SavAcc."No.",COPYSTR(LoanType."Product Description"+' Principal Offset',1,50),BalAccType::"G/L Account",
                                                  '',RecAmt,'',LoanNo,TransType::Repayment,Dim1,Dim2,SystCreated);
        
                                        END;
                                    END;
        
        
                                    SaccoTrans.PostJournal(JTemplate,JBatch);
        
        
                                    IF FullyRec THEN BEGIN
                                        msg:='Dear '+FirstName(Loans."Member Name")+', your Mahitaji Mobile Loan has been fully recovered from your savings account.';
                                        SendSms(Source::MBANKING,SavAcc."Transactional Mobile No",msg,Loans."Loan No.",SavAcc."No.",FALSE,Priority,FALSE);
        
                                    END
                                    ELSE BEGIN
        
                                        Loans.CALCFIELDS("Outstanding Balance","Outstanding Penalty");
                                        LBal := Loans."Outstanding Balance"+Loans."Outstanding Penalty";
                                        msg:='Dear '+FirstName(Loans."Member Name")+', your Mahitaji Mobile Loan has been partially recovered from your savings account. Current Loan Balance is KES '+FORMAT(LBal);
                                        SendSms(Source::MBANKING,SavAcc."Transactional Mobile No",msg,Loans."Loan No.",SavAcc."No.",FALSE,Priority,FALSE);
        
                                    END;
                                END;
                            END;
                        END;
                        */
                    end;
                end;
            until Loans.Next = 0;
        end;






        Loans.Reset;
        //Loans.SETRANGE("Loan No.",LoanNo);
        //Loans.SETRANGE("Non-Salaried",TRUE);
        Loans.SetRange("Mobile Loan", true);
        Loans.SetFilter("Loan Product Type", '<>%1', '416');
        Loans.SetFilter("Outstanding Balance", '>0');
        Loans.SetFilter("Repayment Start Date", '<%1', Today);
        if Loans.FindFirst then begin
            repeat
                LoanType.Get(Loans."Loan Product Type");
                LoanNo := Loans."Loan No.";
                Loans.CalcFields("Outstanding Balance");
                LBal := Loans."Outstanding Balance";
                FullyRec := false;
            /*
            CLedger.RESET;
            CLedger.SETRANGE("Loan No",Loans."Loan No.");
            CLedger.SETRANGE("Transaction Type",CLedger."Transaction Type"::"Penalty Due");
            CLedger.SETRANGE(Reversed,FALSE);
            IF CLedger.FINDFIRST THEN BEGIN

                SavAcc.RESET;
                SavAcc.SETRANGE("Member No.",Loans."Member No.");
                SavAcc.SETRANGE("Product Category",SavAcc."Product Category"::"Deposit Contribution");
                SavAcc.SETFILTER("Balance (LCY)",'>0');
                SavAcc.SETRANGE(Blocked,SavAcc.Blocked::" ");
                IF SavAcc.FINDFIRST THEN BEGIN

                    SavAcc.CALCFIELDS("Balance (LCY)");
                    RunBal := GetAccountBalance(SavAcc."No.");

                    IF RunBal > LBal THEN
                      FullyRec := TRUE
                    ELSE
                      FullyRec := FALSE;

                    JTemplate:='RECEIPT';
                    JBatch:='SKYWORLD';
                    DocNo := Loans."Loan No.";
                    PDate := TODAY;
                    Dim1 := Loans."Global Dimension 1 Code";
                    Dim2 := Loans."Global Dimension 2 Code";
                    SystCreated := TRUE;
                    AccNo := Loans."Loan Account";

                    SaccoTrans.InitJournal(JTemplate,JBatch);

                    IF RunBal > 0 THEN BEGIN
                        RecAmt := Loans."Outstanding Penalty";
                        IF RecAmt < 0 THEN
                          RecAmt := 0;

                        IF RecAmt > RunBal THEN
                            RecAmt := RunBal;
                        RunBal -= RecAmt;

                        IF RecAmt > 0 THEN BEGIN

                            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Credit,AccNo,COPYSTR(LoanType."Product Description"+' Penalty Offset',1,50),BalAccType::"G/L Account",
                                  '',-RecAmt,'',LoanNo,TransType::"Penalty Paid",Dim1,Dim2,SystCreated);

                            SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,SavAcc."No.",COPYSTR(LoanType."Product Description"+' Penalty Offset',1,50),BalAccType::"G/L Account",
                                  '',RecAmt,'',LoanNo,TransType::"Penalty Paid",Dim1,Dim2,SystCreated);

                        END;



                        IF RunBal > 0 THEN BEGIN
                            RecAmt := Loans."Outstanding Balance";
                            IF RecAmt < 0 THEN
                              RecAmt := 0;

                            IF RecAmt > RunBal THEN
                                RecAmt := RunBal;
                            RunBal -= RecAmt;

                            IF RecAmt > 0 THEN BEGIN

                                SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Credit,AccNo,COPYSTR(LoanType."Product Description"+' Principal Offset',1,50),BalAccType::"G/L Account",
                                      '',-RecAmt,'',LoanNo,TransType::Repayment,Dim1,Dim2,SystCreated);

                                SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,SavAcc."No.",COPYSTR(LoanType."Product Description"+' Principal Offset',1,50),BalAccType::"G/L Account",
                                      '',RecAmt,'',LoanNo,TransType::Repayment,Dim1,Dim2,SystCreated);

                            END;
                        END;


                        SaccoTrans.PostJournal(JTemplate,JBatch);

                        IF Savings.GET(Loans."Disbursement Account No") THEN BEGIN
                            IF FullyRec THEN BEGIN
                                msg:='Dear '+FirstName(Loans."Member Name")+', your Mahitaji Mobile Loan has been fully recovered from your deposit account.';
                                SendSms(Source::MBANKING,Savings."Transactional Mobile No",msg,Loans."Loan No.",Savings."No.",FALSE,Priority,FALSE);

                            END
                            ELSE BEGIN

                                Loans.CALCFIELDS("Outstanding Balance","Outstanding Penalty");
                                LBal := Loans."Outstanding Balance"+Loans."Outstanding Penalty";
                                msg:='Dear '+FirstName(Loans."Member Name")+', your Mahitaji Mobile Loan has been partially recovered from your deposit account. Current Loan Balance is KES '+FORMAT(LBal);
                                SendSms(Source::MBANKING,Savings."Transactional Mobile No",msg,Loans."Loan No.",Savings."No.",FALSE,Priority,FALSE);

                            END;
                        END;
                    END;
                END;
            END;
            */
            until Loans.Next = 0;
        end;

    end;


    procedure FirstName(Text: Text[100]) FName: Text[100]
    var
        Pos: Integer;
    begin
        /*
        //New Code for Last Name
        Pos:=1;
        FName := Text;
        WHILE (Pos > 0) DO BEGIN
            Token(FName,' ');
            Pos := STRPOS(FName,' ');
        END;
        */



        //Old Code For First Name
        Pos := StrPos(Text, ' ');

        if Pos > 0 then begin
            FName := CopyStr(Text, 1, Pos - 1);
        end else begin
            FName := Text;
        end;

    end;


    procedure GetNonSalariedLoanQualifiedAmountAlert(AccountNo: Code[20]): Decimal
    var
        DefaultedAmount: Integer;
        saccoAccount: Record 52185730;
        ProdFac: Record 52185690;
        salStartString: Text;
        SalStart: Date;
        SalEnd: Date;
        SalBuffer: Record 52185784;
        Salary1: Decimal;
        Salary2: Decimal;
        Date1: Date;
        Date2: Date;
        NetSal: Decimal;
        Loans: Record 52185729;
        LoanRep: Decimal;
        IntAmt: Decimal;
        PrAmt: Decimal;
        STODed: Decimal;
        StandingOrders: Record 52185717;
        MaxLoanAmount: Decimal;
        ExpInt: Decimal;
        LoanType: Record 52185690;
        DepAcc: Record 52185730;
        Salary3: Decimal;
        Date3: Date;
        msg: Text;
        LBal: Decimal;
        LoanProductType: Code[20];
    begin
        /*
        LoanProductType:='';
        ProdFac.RESET;
        ProdFac.SETRANGE(AvailableOnMobile,TRUE);
        IF ProdFac.FINDFIRST THEN
            LoanProductType:= ProdFac."Product ID";
        
        IF LoanProductType = '' THEN
          EXIT;
        
         MaxLoanAmount :=0;
        saccoAccount.RESET;
        saccoAccount.SETRANGE("No.",AccountNo);
        saccoAccount.SETRANGE("Salary Through FOSA",FALSE);
        IF saccoAccount.FIND('-') THEN BEGIN
        
            IF LoanType.GET(LoanProductType) THEN BEGIN
        
        
                Members.GET(saccoAccount."Member No.");
                IF Members."Next Mahitaji Date" <> 0D THEN BEGIN
        
                    Rating.RESET;
                    Rating.SETRANGE("Loan Product",LoanProductType);
                    Rating.SETRANGE("Member No.",saccoAccount."Member No.");
                    IF Rating.FINDLAST THEN
                        Rating.DELETEALL;
        
                    IF Members."Next Mahitaji Date" > TODAY THEN BEGIN
        
                        msg:='Member account has been blacklisted for 3 months up to '+FORMAT(Members."Next Mahitaji Date");
                        MESSAGE(msg);
                        EXIT;
                    END
                    ELSE BEGIN
                        Members."Next Mahitaji Date" := 0D;
                        Members."Mahitaji Defaulter" := FALSE;
                        Members.MODIFY;
                    END;
                END;
        
                DepAcc.RESET;
                DepAcc.SETRANGE("Member No.",saccoAccount."Member No.");
                DepAcc.SETRANGE("Product Category",DepAcc."Product Category"::"Deposit Contribution");
                IF DepAcc.FINDFIRST THEN BEGIN
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < LoanType."Non-Salaried Min. Deposits" THEN BEGIN
        
                        msg:='Member Deposits are below minimum of KES'+FORMAT(LoanType."Non-Salaried Min. Deposits");
                        MESSAGE(msg);
                        EXIT;
                    END;
                END
                ELSE
                    EXIT(0);
        
                DepAcc.RESET;
                DepAcc.SETRANGE("Member No.",saccoAccount."Member No.");
                DepAcc.SETRANGE("Product Category",DepAcc."Product Category"::"Share Capital");
                IF DepAcc.FINDFIRST THEN BEGIN
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < LoanType."Non-Salaried Min. Share Cap" THEN BEGIN
        
                        msg:='Member Share Capital are below minimum of KES'+FORMAT(LoanType."Non-Salaried Min. Share Cap");
                        MESSAGE(msg);
                        EXIT;
                    END;
                END
                ELSE
                    EXIT(0);
        
                DepAcc.RESET;
                DepAcc.SETRANGE("Member No.",saccoAccount."Member No.");
                DepAcc.SETRANGE("Product Category",DepAcc."Product Category"::"Deposit Contribution");
                IF DepAcc.FINDFIRST THEN BEGIN
                    DepAcc.SETRANGE("Date Filter",CALCDATE('-180D',TODAY),TODAY);
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < 12500 THEN BEGIN
        
        
                        STOFound := FALSE;
                        StandingOrders.RESET;
                        StandingOrders.SETRANGE(StandingOrders."Source Account No.",saccoAccount."No.");
                        StandingOrders.SETRANGE(StandingOrders.Status , StandingOrders.Status::Approved);
                        StandingOrders.SETFILTER("End Date" ,'>%1',TODAY);
                        IF StandingOrders.FIND('-') THEN BEGIN
                            REPEAT
                                STOLines.RESET;
                                STOLines.SETRANGE("Document No.",StandingOrders."No.");
                                STOLines.SETRANGE("Destination Account No.",DepAcc."No.");
                                STOLines.SETRANGE(Amount,500);
                                IF STOLines.FINDFIRST THEN
                                  STOFound := TRUE;
                            UNTIL StandingOrders.NEXT = 0;
                        END;
        
                        IF (NOT STOFound) OR ((STOFound)AND(DepAcc."Balance (LCY)"<2500)) THEN BEGIN
                            msg:='Member not upto date in Deposit contribution. Amount Contributed in 180Days is '+FORMAT(DepAcc."Balance (LCY)");
                            MESSAGE(msg);
                            EXIT;
                        END;
                    END;
        
        
                    DepAcc.SETRANGE("Date Filter",CALCDATE('-60D',TODAY),TODAY);
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < 2500 THEN BEGIN
        
                        STOFound := FALSE;
                        StandingOrders.RESET;
                        StandingOrders.SETRANGE(StandingOrders."Source Account No.",saccoAccount."No.");
                        StandingOrders.SETRANGE(StandingOrders.Status , StandingOrders.Status::Approved);
                        StandingOrders.SETFILTER("End Date" ,'>%1',TODAY);
                        IF StandingOrders.FIND('-') THEN BEGIN
                            REPEAT
                                STOLines.RESET;
                                STOLines.SETRANGE("Document No.",StandingOrders."No.");
                                STOLines.SETRANGE("Destination Account No.",DepAcc."No.");
                                STOLines.SETRANGE(Amount,500);
                                IF STOLines.FINDFIRST THEN
                                  STOFound := TRUE;
                            UNTIL StandingOrders.NEXT = 0;
                        END;
        
                        IF (NOT STOFound) OR ((STOFound)AND(DepAcc."Balance (LCY)"<500)) THEN BEGIN
                            msg:='Member not upto date in Deposit contribution. Amount Contributed in 60Days is '+FORMAT(DepAcc."Balance (LCY)");
                            MESSAGE(msg);
                            EXIT;
                        END;
                    END;
                END
                ELSE
                    EXIT(0);
        
        
                DepAcc.RESET;
                DepAcc.SETRANGE("Member No.",saccoAccount."Member No.");
                DepAcc.SETRANGE("Product Category",DepAcc."Product Category"::"Benevolent Fund");
                IF DepAcc.FINDFIRST THEN BEGIN
                    DepAcc.SETRANGE("Date Filter",CALCDATE('-180D',TODAY),TODAY);
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < 1500 THEN BEGIN
                        msg:='Member not upto date in benevolent contribution. Amount Contributed in 180Days is '+FORMAT(DepAcc."Balance (LCY)");
                        MESSAGE(msg);
                        EXIT;
                    END;
                    DepAcc.SETRANGE("Date Filter",CALCDATE('-60D',TODAY),TODAY);
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < 300 THEN BEGIN
                        msg:='Member not upto date in benevolent contribution. Amount Contributed in 60Days is '+FORMAT(DepAcc."Balance (LCY)");
                        MESSAGE(msg);
                        EXIT;
                    END;
                END
                ELSE
                    EXIT(0);
        
        
                MaxLoanAmount := LoanType."Non-Salaried Max Loan Amt";
                CreditLimit := LoanCreditRating(saccoAccount."Member No.",LoanType."Product ID",FALSE);
                CreditLimit := LoanCreditRating(saccoAccount."Member No.",LoanType."Product ID",FALSE);
        
                IF MaxLoanAmount > CreditLimit THEN
                  MaxLoanAmount := CreditLimit;
        
                Loans.RESET;
                Loans.SETRANGE("Member No.",saccoAccount."Member No.");
                Loans.SETRANGE("Loan Product Type",LoanType."Product ID");
                //Loans.SETRANGE("Non-Salaried",TRUE);
                Loans.SETRANGE("Mobile Loan",TRUE);
                Loans.SETFILTER("Outstanding Balance",'>0');
                IF Loans.FINDFIRST THEN BEGIN
                  REPEAT
                      Loans.CALCFIELDS("Outstanding Balance","Outstanding Penalty");
                      LBal := Loans."Outstanding Balance"+Loans."Outstanding Penalty";
                      MaxLoanAmount -= LBal;
                      //MESSAGE('%1',LBal);
                  UNTIL Loans.NEXT = 0;
                END;
        
                IF MaxLoanAmount < 0 THEN
                  MaxLoanAmount := 0;
        
            END;
        END;
        */
        Message('Amount Qualified: %1', MaxLoanAmount);

    end;


    procedure GetNonSalariedLoanQualifiedLimit(AccountNo: Code[20]; LoanProductType: Code[20]): Decimal
    var
        DefaultedAmount: Integer;
        saccoAccount: Record 52185730;
        ProdFac: Record 52185690;
        salStartString: Text;
        SalStart: Date;
        SalEnd: Date;
        SalBuffer: Record 52185784;
        Salary1: Decimal;
        Salary2: Decimal;
        Date1: Date;
        Date2: Date;
        NetSal: Decimal;
        Loans: Record 52185729;
        LoanRep: Decimal;
        IntAmt: Decimal;
        PrAmt: Decimal;
        STODed: Decimal;
        StandingOrders: Record 52185717;
        MaxLoanAmount: Decimal;
        ExpInt: Decimal;
        LoanType: Record 52185690;
        DepAcc: Record 52185730;
        Salary3: Decimal;
        Date3: Date;
        msg: Text;
        LBal: Decimal;
    begin

        /*
        saccoAccount.RESET;
        saccoAccount.SETRANGE("No.",AccountNo);
        IF saccoAccount.FIND('-') THEN BEGIN
        
            IF LoanType.GET(LoanProductType) THEN BEGIN
        
        
                Members.GET(saccoAccount."Member No.");
                IF Members."Next Mahitaji Date" <> 0D THEN BEGIN
        
                    Rating.RESET;
                    Rating.SETRANGE("Loan Product",LoanProductType);
                    Rating.SETRANGE("Member No.",saccoAccount."Member No.");
                    IF Rating.FINDLAST THEN
                        Rating.DELETEALL;
        
                    IF Members."Next Mahitaji Date" > TODAY THEN BEGIN
                        EXIT(0);
                    END
                    ELSE BEGIN
                        Members."Next Mahitaji Date" := 0D;
                        Members."Mahitaji Defaulter" := FALSE;
                        Members.MODIFY;
                    END;
                END;
        
                DepAcc.RESET;
                DepAcc.SETRANGE("Member No.",saccoAccount."Member No.");
                DepAcc.SETRANGE("Product Category",DepAcc."Product Category"::"Deposit Contribution");
                IF DepAcc.FINDFIRST THEN BEGIN
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < LoanType."Non-Salaried Min. Deposits" THEN BEGIN
        
                        EXIT(0);
                    END;
                END
                ELSE
                    EXIT(0);
        
                DepAcc.RESET;
                DepAcc.SETRANGE("Member No.",saccoAccount."Member No.");
                DepAcc.SETRANGE("Product Category",DepAcc."Product Category"::"Share Capital");
                IF DepAcc.FINDFIRST THEN BEGIN
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < LoanType."Non-Salaried Min. Share Cap" THEN BEGIN
        
                        EXIT(0);
                    END;
                END
                ELSE
                    EXIT(0);
        
                DepAcc.RESET;
                DepAcc.SETRANGE("Member No.",saccoAccount."Member No.");
                DepAcc.SETRANGE("Product Category",DepAcc."Product Category"::"Deposit Contribution");
                IF DepAcc.FINDFIRST THEN BEGIN
                    DepAcc.SETRANGE("Date Filter",CALCDATE('-180D',TODAY),TODAY);
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < 12500 THEN BEGIN
        
                        STOFound := FALSE;
                        StandingOrders.RESET;
                        StandingOrders.SETRANGE(StandingOrders."Source Account No.",saccoAccount."No.");
                        StandingOrders.SETRANGE(StandingOrders.Status , StandingOrders.Status::Approved);
                        StandingOrders.SETFILTER("End Date" ,'>%1',TODAY);
                        IF StandingOrders.FIND('-') THEN BEGIN
                            REPEAT
                                STOLines.RESET;
                                STOLines.SETRANGE("Document No.",StandingOrders."No.");
                                STOLines.SETRANGE("Destination Account No.",DepAcc."No.");
                                STOLines.SETFILTER(Amount,'>=500');
                                IF STOLines.FINDFIRST THEN
                                    IF (DepAcc."Balance (LCY)" >= STOLines.Amount*5) THEN
                                        STOFound := TRUE;
                            UNTIL StandingOrders.NEXT = 0;
                        END;
        
                        IF (NOT STOFound) THEN
                            EXIT(0);
                    END;
                    DepAcc.SETRANGE("Date Filter",CALCDATE('-60D',TODAY),TODAY);
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < 2500 THEN BEGIN
        
                        STOFound := FALSE;
                        StandingOrders.RESET;
                        StandingOrders.SETRANGE(StandingOrders."Source Account No.",saccoAccount."No.");
                        StandingOrders.SETRANGE(StandingOrders.Status , StandingOrders.Status::Approved);
                        StandingOrders.SETFILTER("End Date" ,'>%1',TODAY);
                        IF StandingOrders.FIND('-') THEN BEGIN
                            REPEAT
                                STOLines.RESET;
                                STOLines.SETRANGE("Document No.",StandingOrders."No.");
                                STOLines.SETRANGE("Destination Account No.",DepAcc."No.");
                                STOLines.SETFILTER(Amount,'>=500');
                                IF STOLines.FINDFIRST THEN
                                    IF (DepAcc."Balance (LCY)" >= STOLines.Amount) THEN
                                        STOFound := TRUE;
                            UNTIL StandingOrders.NEXT = 0;
                        END;
        
                        IF (NOT STOFound)  THEN
                        EXIT(0);
                    END;
                END
                ELSE
                    EXIT(0);
        
        
                DepAcc.RESET;
                DepAcc.SETRANGE("Member No.",saccoAccount."Member No.");
                DepAcc.SETRANGE("Product Category",DepAcc."Product Category"::"Benevolent Fund");
                IF DepAcc.FINDFIRST THEN BEGIN
                    DepAcc.SETRANGE("Date Filter",CALCDATE('-180D',TODAY),TODAY);
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < 1500 THEN BEGIN
                        EXIT(0);
                    END;
                    DepAcc.SETRANGE("Date Filter",CALCDATE('-60D',TODAY),TODAY);
                    DepAcc.CALCFIELDS("Balance (LCY)");
                    IF DepAcc."Balance (LCY)" < 300 THEN BEGIN
                        EXIT(0);
                    END;
                END
                ELSE
                    EXIT(0);
        
        
                MaxLoanAmount := LoanType."Non-Salaried Max Loan Amt";
                CreditLimit := LoanCreditRating(saccoAccount."Member No.",LoanType."Product ID",FALSE);
                CreditLimit := LoanCreditRating(saccoAccount."Member No.",LoanType."Product ID",FALSE);
        
                IF MaxLoanAmount > CreditLimit THEN
                  MaxLoanAmount := CreditLimit;
        
                Loans.RESET;
                Loans.SETRANGE("Member No.",saccoAccount."Member No.");
                Loans.SETRANGE("Loan Product Type",LoanType."Product ID");
                //Loans.SETRANGE("Non-Salaried",TRUE);
                Loans.SETRANGE("Mobile Loan",TRUE);
                Loans.SETFILTER("Outstanding Balance",'>0');
                IF Loans.FINDFIRST THEN BEGIN
                  REPEAT
                      Loans.CALCFIELDS("Outstanding Balance","Outstanding Penalty");
                      LBal := Loans."Outstanding Balance"+Loans."Outstanding Penalty";
                      MaxLoanAmount -= LBal;
                  UNTIL Loans.NEXT = 0;
                END;
        
                IF MaxLoanAmount < 0 THEN
                  MaxLoanAmount := 0;
        
        
        
        
        
                EXIT(ROUND(MaxLoanAmount,1,'<'));
            END;
        END;
        */

        exit(0);

    end;

    local procedure UpdateNextMahitajiDate()
    var
        Loans: Record 52185729;
        Members: Record 52185700;
    begin


        /*
        Loans.RESET;
        Loans.SETCURRENTKEY("Disbursement Date");
        //Loans.SETRANGE("Non-Salaried",TRUE);
        Loans.SETRANGE("Mobile Loan",TRUE);
        Loans.SETRANGE("Mahitaji Defaulted",TRUE);
        Loans.SETFILTER("Last Pay Date",'<>%1',0D);
        Loans.SETFILTER("Next Mahitaji Date",'%1',0D);
        Loans.SETFILTER("Outstanding Balance",'<=0');
        IF Loans.FINDFIRST THEN BEGIN
            REPEAT
                Loans.CALCFIELDS("Last Pay Date");
                Loans."Next Mahitaji Date" := CALCDATE('3M',Loans."Last Pay Date");
                Loans.MODIFY;
        
                Rating.RESET;
                Rating.SETRANGE("Loan Product",Loans."Loan Product Type");
                Rating.SETRANGE("Member No.",Loans."Member No.");
                IF Rating.FINDLAST THEN
                    Rating.DELETEALL;
        
                Members.GET(Loans."Member No.");
                Members."Next Mahitaji Date" := Loans."Next Mahitaji Date";
                Members.MODIFY;
            UNTIL Loans.NEXT = 0;
        END;
        */

    end;

    local procedure CreditRating(MemberNo: Code[20]; Product: Code[20]) Limit: Decimal
    var
        ProductFactory: Record 52185690;
        Loans: Record 52185729;
        Days: Integer;
    begin
        /*
        Limit := 0;
        IF (Product <> '') AND (ProductFactory.GET(Product)) THEN BEGIN
        
            IF (MemberNo <>'') AND (Members.GET(MemberNo)) THEN BEGIN
        
                Rating.RESET;
                Rating.SETRANGE("Loan Product",Product);
                Rating.SETRANGE("Member No.",MemberNo);
                IF NOT Rating.FINDFIRST THEN BEGIN
        
                    IF ProductFactory."Credit Rating Start Point" > 0 THEN BEGIN
        
                        Loans.RESET;
                        Loans.SETRANGE("Member No.",MemberNo);
                        Loans.SETRANGE("Loan Product Type",Product);
                        Loans.SETRANGE(Posted,TRUE);
                        IF NOT Loans.FINDFIRST THEN BEGIN
                            Rating.INIT;
                            Rating."Member No." := MemberNo;
                            Rating.Name := Members.Name;
                            Rating."Loan Product" := Product;
                            Rating."Product Name" := ProductFactory."Product Description";
                            Rating.Date := TODAY;
                            Rating."Loan Limit" := ProductFactory."Credit Rating Start Point";
                            Rating."Amount In" := Rating."Loan Limit";
                            IF Rating."Loan Limit" > 0 THEN
                                IF Rating.INSERT THEN;
                        END
                        ELSE BEGIN
                            Loans.RESET;
                            Loans.SETCURRENTKEY("Disbursement Date");
                            Loans.SETRANGE("Member No.",MemberNo);
                            Loans.SETRANGE("Loan Product Type",Product);
                            Loans.SETRANGE(Posted,TRUE);
                            Loans.SETRANGE(Defaulted,TRUE);
                            IF Loans.FINDLAST THEN BEGIN
                                Loans.CALCFIELDS("Last Pay Date","Outstanding Balance");
                                IF Loans."Outstanding Balance" <= 0 THEN BEGIN
                                    IF CALCDATE('3M',Loans."Last Pay Date") <= TODAY THEN BEGIN
                                        Rating.INIT;
                                        Rating."Member No." := MemberNo;
                                        Rating.Name := Members.Name;
                                        Rating."Loan Product" := Product;
                                        Rating."Product Name" := ProductFactory."Product Description";
                                        Rating.Date := CALCDATE('3M',Loans."Last Pay Date");
                                        Rating."Loan Limit" := ProductFactory."Credit Rating Start Point";
                                        Rating."Amount In" := Rating."Loan Limit";
                                        IF Rating."Loan Limit" > 0 THEN
                                            IF Rating.INSERT THEN;
                                    END;
                                END;
                            END
                            ELSE BEGIN
                                Loans.RESET;
                                Loans.SETCURRENTKEY("Disbursement Date");
                                Loans.SETRANGE("Member No.",MemberNo);
                                Loans.SETRANGE("Loan Product Type",Product);
                                Loans.SETRANGE(Posted,TRUE);
                                IF Loans.FINDFIRST THEN BEGIN
                                    Rating.INIT;
                                    Rating."Member No." := MemberNo;
                                    Rating.Name := Members.Name;
                                    Rating."Loan Product" := Product;
                                    Rating."Product Name" := ProductFactory."Product Description";
                                    Rating.Date := Loans."Disbursement Date";
                                    Rating."Loan Limit" := ProductFactory."Credit Rating Start Point";
                                    Rating."Amount In" := Rating."Loan Limit";
                                    IF Rating."Loan Limit" > 0 THEN
                                        IF Rating.INSERT THEN;
                                END;
                            END;
                        END;
        
                    END;
                END;
        
        
        
                Loans.RESET;
                Loans.SETCURRENTKEY("Disbursement Date");
                Loans.SETRANGE("Member No.",MemberNo);
                Loans.SETRANGE("Loan Product Type",Product);
                Loans.SETRANGE(Posted,TRUE);
                Loans.SETRANGE(Defaulted,TRUE);
                IF Loans.FINDLAST THEN BEGIN
                    Loans.CALCFIELDS("Last Pay Date","Outstanding Balance");
                    IF (Loans."Outstanding Balance" > 0) THEN BEGIN
                        Rating.RESET;
                        Rating.SETRANGE("Loan Product",Product);
                        Rating.SETRANGE("Member No.",MemberNo);
                        IF Rating.FINDLAST THEN
                            Rating.DELETEALL;
                    END
                    ELSE BEGIN
                        IF CALCDATE('3M',Loans."Last Pay Date") > TODAY THEN BEGIN
                            Rating.RESET;
                            Rating.SETRANGE("Loan Product",Product);
                            Rating.SETRANGE("Member No.",MemberNo);
                            IF Rating.FINDLAST THEN
                                Rating.DELETEALL;
                        END;
                    END;
                END;
        
        
                Loans.RESET;
                Loans.SETCURRENTKEY("Disbursement Date");
                Loans.SETRANGE("Member No.",MemberNo);
                Loans.SETRANGE("Loan Product Type",Product);
                Loans.SETFILTER("Outstanding Balance",'>0');
                IF NOT Loans.FINDFIRST THEN BEGIN
        
                    Rating.RESET;
                    Rating.SETRANGE("Loan Product",Product);
                    Rating.SETRANGE("Member No.",MemberNo);
                    IF Rating.FINDLAST THEN BEGIN
        
                        IF (Rating.Date <> 0D) AND (Rating.Date <> TODAY) THEN BEGIN
                            Days := TODAY - Rating.Date;
        
                            TestDate := 0D;
                            Loans.RESET;
                            Loans.SETCURRENTKEY("Disbursement Date");
                            Loans.SETRANGE("Member No.",MemberNo);
                            Loans.SETRANGE("Loan Product Type",Product);
                            Loans.SETRANGE(Posted,TRUE);
                            IF Loans.FINDLAST THEN BEGIN
                                IF Loans.COUNT = 1 THEN BEGIN
                                    Loans.CALCFIELDS("Last Pay Date");
                                    TestDate := Loans."Repayment Start Date";
                                    IF TestDate > Loans."Last Pay Date" THEN BEGIN
                                        TestDate := Loans."Last Pay Date";
                                        IF Loans.Defaulted THEN
                                            TestDate := CALCDATE('3M',TestDate);
                                    END;
                                END;
                            END;
        
                            IF TestDate <> 0D THEN BEGIN
        
                            END;
        
                            IF Days >= 5 THEN BEGIN
        
        
                                NewRating.INIT;
                                NewRating."Member No." := MemberNo;
                                NewRating.Name := Members.Name;
                                NewRating."Loan Product" := Product;
                                NewRating."Product Name" := ProductFactory."Product Description";
                                NewRating.Date := TODAY;
                                NewRating."Amount In" := Days*ProductFactory."Credit Rating Daily Increase";
                                NewRating."Loan Limit" := Rating."Loan Limit" + NewRating."Amount In";
                                IF NewRating."Loan Limit" > 0 THEN
                                    IF NewRating.INSERT THEN;
                            END;
                        END;
        
                    END;
                END;
        
                Rating.RESET;
                Rating.SETRANGE("Loan Product",Product);
                Rating.SETRANGE("Member No.",MemberNo);
                IF Rating.FINDLAST THEN BEGIN
                    Limit := Rating."Loan Limit";
                END;
        
        
        
                Loans.RESET;
                Loans.SETCURRENTKEY("Disbursement Date");
                Loans.SETRANGE("Member No.",MemberNo);
                Loans.SETRANGE("Loan Product Type",Product);
                Loans.SETRANGE(Posted,TRUE);
                IF NOT Loans.FINDFIRST THEN BEGIN
                    IF Limit > ProductFactory."Credit Rating Start Point" THEN
                        Limit := ProductFactory."Credit Rating Start Point";
        
                    Rating.RESET;
                    Rating.SETRANGE("Loan Product",Product);
                    Rating.SETRANGE("Member No.",MemberNo);
                    IF Rating.FINDLAST THEN
                        Rating.DELETEALL;
                END;
        
            END;
        
        END;
        */

    end;

    local procedure LoanCreditRating(MemberNo: Code[20]; Product: Code[20]; Alert: Boolean) Limit: Decimal
    var
        ProductFactory: Record 52185690;
        Loans: Record 52185729;
        Days: Integer;
    begin
        /*
        Limit := 0;
        IF (Product <> '') AND (ProductFactory.GET(Product)) THEN BEGIN
        
            IF (MemberNo <>'') AND (Members.GET(MemberNo)) THEN BEGIN
        
        
        
                IF (Members."Mahitaji Defaulter") OR (Members."Advantage Defaulter") THEN BEGIN
                    Rating.RESET;
                    Rating.SETRANGE("Loan Product",Product);
                    Rating.SETRANGE("Member No.",MemberNo);
                    IF Rating.FINDLAST THEN BEGIN
                        Rating.DELETEALL;
                    END;
                    IF Alert THEN
                    MESSAGE('Credit Rating Limit: %1',Limit);
                    EXIT;
                END;
        
        
                Loans.RESET;
                Loans.SETCURRENTKEY("Disbursement Date");
                Loans.SETRANGE("Member No.",MemberNo);
                Loans.SETRANGE("Loan Product Type",Product);
                Loans.SETRANGE(Posted,TRUE);
                Loans.SETRANGE(Defaulted,TRUE);
                IF Loans.FINDLAST THEN BEGIN
                    Loans.CALCFIELDS("Last Pay Date","Outstanding Balance");
                    IF (Loans."Outstanding Balance" > 0) THEN BEGIN
                        Rating.RESET;
                        Rating.SETRANGE("Loan Product",Product);
                        Rating.SETRANGE("Member No.",MemberNo);
                        IF Rating.FINDLAST THEN
                            Rating.DELETEALL;
                    END
                    ELSE BEGIN
                        IF CALCDATE('3M',Loans."Last Pay Date") > TODAY THEN BEGIN
                            Rating.RESET;
                            Rating.SETRANGE("Loan Product",Product);
                            Rating.SETRANGE("Member No.",MemberNo);
                            IF Rating.FINDLAST THEN
                                Rating.DELETEALL;
                        END;
                    END;
                END;
        
        
        
                Rating.RESET;
                Rating.SETRANGE("Loan Product",Product);
                Rating.SETRANGE("Member No.",MemberNo);
                IF NOT Rating.FINDFIRST THEN BEGIN
        
                    IF ProductFactory."Credit Rating Start Point" > 0 THEN BEGIN
                        Limit := ProductFactory."Credit Rating Start Point";
        
                        Loans.RESET;
                        Loans.SETCURRENTKEY("Disbursement Date");
                        Loans.SETRANGE("Member No.",MemberNo);
                        Loans.SETRANGE("Loan Product Type",Product);
                        Loans.SETRANGE(Posted,TRUE);
                        IF Loans.FINDLAST THEN BEGIN
                            Loans.CALCFIELDS("Outstanding Balance","Last Pay Date");
        
                            IF Loans."Outstanding Balance" <= 0  THEN BEGIN
                                TestDate := Loans."Repayment Start Date";
        
                                IF Loans.Defaulted THEN
                                    TestDate := CALCDATE('3M',Loans."Last Pay Date");
        
                                IF (TestDate <= TODAY) AND (TestDate<>0D) THEN BEGIN
                                    IF Loans.Defaulted THEN BEGIN
                                        Limit := ProductFactory."Credit Rating Start Point";
                                        EXIT;
                                    END;
        
                                    Rating.INIT;
                                    Rating."Member No." := MemberNo;
                                    Rating.Name := Members.Name;
                                    Rating."Loan Product" := Product;
                                    Rating."Product Name" := ProductFactory."Product Description";
                                    Rating.Date := TestDate;
        
                                    Rating."Loan Limit" := ProductFactory."Credit Rating Start Point";
                                    Rating."Amount In" := Rating."Loan Limit";
                                    Rating."To Date" := TestDate;
                                    IF Rating."Loan Limit" > 0 THEN
                                        IF Rating.INSERT THEN;
                                END;
                            END;
                        END;
        
                    END;
                END
                ELSE BEGIN
        
                    Loans.RESET;
                    Loans.SETCURRENTKEY("Disbursement Date");
                    Loans.SETRANGE("Member No.",MemberNo);
                    Loans.SETRANGE("Loan Product Type",Product);
                    Loans.SETFILTER("Outstanding Balance",'>0');
                    IF NOT Loans.FINDFIRST THEN BEGIN
        
                        Rating.RESET;
                        Rating.SETRANGE("Loan Product",Product);
                        Rating.SETRANGE("Member No.",MemberNo);
                        IF Rating.FINDLAST THEN BEGIN
        
                            IF (Rating.Date <> 0D) AND (Rating.Date <> TODAY) THEN BEGIN
                                Days := TODAY - Rating.Date;
        
                                IF (Days >= 5) OR (ProductFactory."Credit Rating Fixed Increase">0) THEN BEGIN
        
                                    NewRating.INIT;
                                    NewRating."Member No." := MemberNo;
                                    NewRating.Name := Members.Name;
                                    NewRating."Loan Product" := Product;
                                    NewRating."Product Name" := ProductFactory."Product Description";
                                    NewRating.Date := TODAY;
                                    IF ProductFactory."Credit Rating Daily Increase" > 0 THEN
                                      NewRating."Amount In" := Days*ProductFactory."Credit Rating Daily Increase"
                                    ELSE
                                      NewRating."Amount In" := ProductFactory."Credit Rating Fixed Increase";
        
                                    NewRating."Loan Limit" := Rating."Loan Limit" + NewRating."Amount In";
                                    NewRating."To Date" := TODAY;
                                    NewRating."From Date" := Rating.Date;
                                    NewRating.Days := Days;
        
                                    IF NewRating."Loan Limit" > 0 THEN
                                        IF NewRating.INSERT THEN;
                                END;
                            END;
        
                        END;
                    END;
                END;
                Rating.RESET;
                Rating.SETRANGE("Loan Product",Product);
                Rating.SETRANGE("Member No.",MemberNo);
                IF Rating.FINDLAST THEN BEGIN
                    Limit := Rating."Loan Limit";
                END;
        
        
                Loans.RESET;
                Loans.SETCURRENTKEY("Disbursement Date");
                Loans.SETRANGE("Member No.",MemberNo);
                Loans.SETRANGE("Loan Product Type",Product);
                Loans.SETRANGE(Posted,TRUE);
                IF NOT Loans.FINDFIRST THEN BEGIN
                    IF Limit > ProductFactory."Credit Rating Start Point" THEN
                        Limit := ProductFactory."Credit Rating Start Point";
        
                    Rating.RESET;
                    Rating.SETRANGE("Loan Product",Product);
                    Rating.SETRANGE("Member No.",MemberNo);
                    IF Rating.FINDLAST THEN
                        Rating.DELETEALL;
                END;
        
        
            END;
        
        END;
        IF Alert THEN
        MESSAGE('Credit Rating Limit: %1',Limit);
        */

    end;


    procedure ddMMyyyy(Date: Date) NewDate: Text
    var
        d: Text;
        m: Text;
        y: Text;
    begin

        d := Format(Date2dmy(Date, 1));
        m := Format(Date2dmy(Date, 2));
        y := Format(Date2dmy(Date, 3));

        if StrLen(d) = 1 then
            d := '0' + d;

        if StrLen(m) = 1 then
            m := '0' + m;

        NewDate := d + '/' + m + '/' + y;
    end;


    procedure RecoverSalariedLoanPenalty()
    var
        msg: Text;
        SavAcc: Record 52185730;
        Loans: Record 52185729;
        LoanType: Record 52185690;
        CLedger: Record 52185733;
        PenaltyAmt: Decimal;
        JTemplate: Code[10];
        JBatch: Code[10];
        DocNo: Code[20];
        PDate: Date;
        AccNo: Code[20];
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal,"Penalty Due","Penalty Paid";
        Dim1: Code[10];
        Dim2: Code[10];
        SystCreated: Boolean;
        RunBal: Decimal;
        RecAmt: Decimal;
        LoanNo: Code[20];
        LBal: Decimal;
        FullyRec: Boolean;
        CreditAccounts: Record 52185731;
    begin
        /*
        Loans.RESET;
        //Loans.SETRANGE("Loan No.",LoanNo);
        Loans.SETRANGE("Non-Salaried",FALSE);
        Loans.SETRANGE("Mobile Loan",TRUE);
        Loans.SETFILTER("Loan Product Type",'<>%1','416');
        Loans.SETFILTER("Outstanding Balance",'>0');
        Loans.SETFILTER("Disbursement Date",'<=%1',CALCDATE('-60D',TODAY));
        Loans.SETFILTER("Last Fosa Check Date",'<%1',TODAY);
        IF Loans.FINDFIRST THEN BEGIN
            REPEAT
        
                LoanType.GET(Loans."Loan Product Type");
                IF LoanType."Auto Recover from Savings" THEN BEGIN
                    LoanNo := Loans."Loan No.";
                    Loans.CALCFIELDS("Outstanding Balance","Outstanding Penalty");
                    LBal := Loans."Outstanding Balance"+Loans."Outstanding Penalty";
                    FullyRec := FALSE;
        
                    IF CreditAccounts.GET(Loans."Loan Account") THEN;
        
                    IF (LBal>0) AND (CreditAccounts.Blocked = CreditAccounts.Blocked::" " ) THEN BEGIN
        
                        SavAcc.RESET;
                        SavAcc.SETRANGE("Member No.",Loans."Member No.");
                        SavAcc.SETRANGE("No.",Loans."Disbursement Account No");
                        SavAcc.SETFILTER("Balance (LCY)",'>0');
                        SavAcc.SETRANGE(Blocked,SavAcc.Blocked::" ");
                        IF SavAcc.FINDFIRST THEN BEGIN
        
                            SavAcc.CALCFIELDS("Balance (LCY)");
                            RunBal := GetAccountBalance(SavAcc."No.");
        
                            IF RunBal > LBal THEN
                              FullyRec := TRUE
                            ELSE
                              FullyRec := FALSE;
        
                            JTemplate:='RECEIPT';
                            JBatch:='SKYWORLD';
                            DocNo := Loans."Loan No.";
                            PDate := TODAY;
                            Dim1 := Loans."Global Dimension 1 Code";
                            Dim2 := Loans."Global Dimension 2 Code";
                            SystCreated := TRUE;
                            AccNo := Loans."Loan Account";
        
                            SaccoTrans.InitJournal(JTemplate,JBatch);
        
                            IF RunBal > 0 THEN BEGIN
                                RecAmt := Loans."Outstanding Penalty";
                                IF RecAmt < 0 THEN
                                  RecAmt := 0;
        
                                IF RecAmt > RunBal THEN
                                    RecAmt := RunBal;
                                RunBal -= RecAmt;
        
                                IF RecAmt > 0 THEN BEGIN
        
                                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Credit,AccNo,COPYSTR(LoanType."Product Description"+' Penalty Offset',1,50),BalAccType::"G/L Account",
                                          '',-RecAmt,'',LoanNo,TransType::"Penalty Paid",Dim1,Dim2,SystCreated);
        
                                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,SavAcc."No.",COPYSTR(LoanType."Product Description"+' Penalty Offset',1,50),BalAccType::"G/L Account",
                                          '',RecAmt,'',LoanNo,TransType::"Penalty Paid",Dim1,Dim2,SystCreated);
        
                                END;
        
        
        
                                IF RunBal > 0 THEN BEGIN
                                    RecAmt := Loans."Outstanding Balance";
                                    IF RecAmt < 0 THEN
                                      RecAmt := 0;
        
                                    IF RecAmt > RunBal THEN
                                        RecAmt := RunBal;
                                    RunBal -= RecAmt;
        
                                    IF RecAmt > 0 THEN BEGIN
        
                                        SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Credit,AccNo,COPYSTR(LoanType."Product Description"+' Principal Offset',1,50),BalAccType::"G/L Account",
                                              '',-RecAmt,'',LoanNo,TransType::Repayment,Dim1,Dim2,SystCreated);
        
                                        SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,SavAcc."No.",COPYSTR(LoanType."Product Description"+' Principal Offset',1,50),BalAccType::"G/L Account",
                                              '',RecAmt,'',LoanNo,TransType::Repayment,Dim1,Dim2,SystCreated);
        
                                    END;
                                END;
        
        
                                SaccoTrans.PostJournal(JTemplate,JBatch);
        
        
                                IF FullyRec THEN BEGIN
                                    msg:='Dear '+FirstName(Loans."Member Name")+', your Salary Advance Loan has been fully recovered from your savings account.';
                                    SendSms(Source::MBANKING,SavAcc."Transactional Mobile No",msg,Loans."Loan No.",SavAcc."No.",FALSE,Priority,FALSE);
        
                                END
                                ELSE BEGIN
        
                                    Loans.CALCFIELDS("Outstanding Balance","Outstanding Penalty");
                                    LBal := Loans."Outstanding Balance"+Loans."Outstanding Penalty";
                                    msg:='Dear '+FirstName(Loans."Member Name")+', your your Salary Advance Mobile Loan has been partially recovered from your savings account. Current Loan Balance is KES '+FORMAT(LBal);
                                    SendSms(Source::MBANKING,SavAcc."Transactional Mobile No",msg,Loans."Loan No.",SavAcc."No.",FALSE,Priority,FALSE);
        
                                END;
                            END;
                        END;
                    END;
                END;
            UNTIL Loans.NEXT = 0;
        END;
        
        
        
        
        Loans.RESET;
        //Loans.SETRANGE("Loan No.",LoanNo);
        Loans.SETRANGE("Non-Salaried",FALSE);
        Loans.SETRANGE("Mobile Loan",TRUE);
        Loans.SETFILTER("Loan Product Type",'<>%1','416');
        Loans.SETFILTER("Outstanding Balance",'>0');
        Loans.SETFILTER("Disbursement Date",'<=%1',CALCDATE('-60D',TODAY));
        Loans.SETFILTER("Last Fosa Check Date",'<%1',TODAY);
        IF Loans.FINDFIRST THEN BEGIN
            REPEAT
                Loans."Last Fosa Check Date" := TODAY;
                Loans.MODIFY;
        
                LoanType.GET(Loans."Loan Product Type");
                IF LoanType."Auto Recover from Savings" THEN BEGIN
                    LoanNo := Loans."Loan No.";
                    Loans.CALCFIELDS("Outstanding Balance","Outstanding Penalty");
                    LBal := Loans."Outstanding Balance"+Loans."Outstanding Penalty";
                    FullyRec := FALSE;
        
                    IF CreditAccounts.GET(Loans."Loan Account") THEN;
        
                    IF (LBal>0) AND (CreditAccounts.Blocked = CreditAccounts.Blocked::" " ) THEN BEGIN
        
                        SavAcc.RESET;
                        SavAcc.SETRANGE("Member No.",Loans."Member No.");
                        SavAcc.SETRANGE("Product Category",SavAcc."Product Category"::"Deposit Contribution");
                        SavAcc.SETFILTER("Balance (LCY)",'>0');
                        SavAcc.SETRANGE(Blocked,SavAcc.Blocked::" ");
                        IF SavAcc.FINDFIRST THEN BEGIN
        
                            SavAcc.CALCFIELDS("Balance (LCY)");
                            RunBal := GetAccountBalance(SavAcc."No.");
        
                            IF RunBal > LBal THEN
                              FullyRec := TRUE
                            ELSE
                              FullyRec := FALSE;
        
                            JTemplate:='RECEIPT';
                            JBatch:='SKYWORLD';
                            DocNo := Loans."Loan No.";
                            PDate := TODAY;
                            Dim1 := Loans."Global Dimension 1 Code";
                            Dim2 := Loans."Global Dimension 2 Code";
                            SystCreated := TRUE;
                            AccNo := Loans."Loan Account";
        
                            SaccoTrans.InitJournal(JTemplate,JBatch);
        
                            IF RunBal > 0 THEN BEGIN
                                RecAmt := Loans."Outstanding Penalty";
                                IF RecAmt < 0 THEN
                                  RecAmt := 0;
        
                                IF RecAmt > RunBal THEN
                                    RecAmt := RunBal;
                                RunBal -= RecAmt;
        
                                IF RecAmt > 0 THEN BEGIN
        
                                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Credit,AccNo,COPYSTR(LoanType."Product Description"+' Penalty Offset',1,50),BalAccType::"G/L Account",
                                          '',-RecAmt,'',LoanNo,TransType::"Penalty Paid",Dim1,Dim2,SystCreated);
        
                                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,SavAcc."No.",COPYSTR(LoanType."Product Description"+' Penalty Offset',1,50),BalAccType::"G/L Account",
                                          '',RecAmt,'',LoanNo,TransType::"Penalty Paid",Dim1,Dim2,SystCreated);
        
                                END;
        
        
        
                                IF RunBal > 0 THEN BEGIN
                                    RecAmt := Loans."Outstanding Balance";
                                    IF RecAmt < 0 THEN
                                      RecAmt := 0;
        
                                    IF RecAmt > RunBal THEN
                                        RecAmt := RunBal;
                                    RunBal -= RecAmt;
        
                                    IF RecAmt > 0 THEN BEGIN
        
                                        SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Credit,AccNo,COPYSTR(LoanType."Product Description"+' Principal Offset',1,50),BalAccType::"G/L Account",
                                              '',-RecAmt,'',LoanNo,TransType::Repayment,Dim1,Dim2,SystCreated);
        
                                        SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,SavAcc."No.",COPYSTR(LoanType."Product Description"+' Principal Offset',1,50),BalAccType::"G/L Account",
                                              '',RecAmt,'',LoanNo,TransType::Repayment,Dim1,Dim2,SystCreated);
        
                                    END;
                                END;
        
        
                                SaccoTrans.PostJournal(JTemplate,JBatch);
        
        
                                IF FullyRec THEN BEGIN
                                    msg:='Dear '+FirstName(Loans."Member Name")+', your Salary Advance Loan has been fully recovered from your deposit account.';
                                    SendSms(Source::MBANKING,SavAcc."Mobile Phone No",msg,Loans."Loan No.",SavAcc."No.",FALSE,Priority,FALSE);
        
                                END
                                ELSE BEGIN
        
                                    Loans.CALCFIELDS("Outstanding Balance","Outstanding Penalty");
                                    LBal := Loans."Outstanding Balance"+Loans."Outstanding Penalty";
                                    msg:='Dear '+FirstName(Loans."Member Name")+', your your Salary Advance Mobile Loan has been partially recovered from your deposit account. Current Loan Balance is KES '+FORMAT(LBal);
                                    SendSms(Source::MBANKING,SavAcc."Mobile Phone No",msg,Loans."Loan No.",SavAcc."No.",FALSE,Priority,FALSE);
        
                                END;
                            END;
                        END;
                    END;
                END;
            UNTIL Loans.NEXT = 0;
        END;
        */

    end;


    procedure GetChargeAmount(ChargeCode: Code[20]; TransactionAmount: Decimal; var SaccoCharge: Decimal; var VendorCharge: Decimal)
    var
        SkyMobileTieredLines: Record 52186234;
    begin
        SaccoCharge := 0;
        VendorCharge := 0;

        SkyMobileTieredLines.Reset;
        SkyMobileTieredLines.SetRange(Code, ChargeCode);
        SkyMobileTieredLines.SetFilter("Lower Limit", '<=%1', TransactionAmount);
        SkyMobileTieredLines.SetFilter("Upper Limit", '>=%1', TransactionAmount);
        SkyMobileTieredLines.SetRange("Band Active", true);
        if SkyMobileTieredLines.FindFirst then begin
            //Sacco Charge
            if SkyMobileTieredLines."Use Percentage (Sacco)" then begin
                SaccoCharge := ROUND(SkyMobileTieredLines."Percentage (Sacco)" * TransactionAmount, 1, '>');
            end else begin
                SaccoCharge := SkyMobileTieredLines."Sacco Charge";
            end;

            //Vendor Charge
            if SkyMobileTieredLines."Use Percentage (Vendor)" then begin
                VendorCharge := ROUND(SkyMobileTieredLines."Percentage (Vendor)" * TransactionAmount, 1, '>');
            end else begin
                VendorCharge := SkyMobileTieredLines."Vendor Charge";
            end;
        end else
            Error('Transaction of %1 KES is not allowed', TransactionAmount);
    end;


    procedure EmployerRestriction(PhoneNo: Code[20]; Transaction: Text) Restricted: Boolean
    var
        TransactionType: Option " ","Mpesa Withdrawal","Mpesa Deposit","Utility Payment","Loan Repayment","Balance Enquiry","Mini-Statement","Loan Disbursement","Account Transfer","Pay Loan From Account",Paybill,"Mobile App Login","Pesalink Transfer",Airtime,"Bank Deposit","Bank Agent Deposit","Bank Transfer";
        SavAcc: Record 52185730;
    begin
        Restricted := true;
        PhoneNo := '+' + PhoneNo;


        if Transaction = 'Balance Enquiry' then
            TransactionType := Transactiontype::"Balance Enquiry";

        if Transaction = 'Loan Repayment' then
            TransactionType := Transactiontype::"Loan Repayment";

        if Transaction = 'Mini-Statement' then
            TransactionType := Transactiontype::"Mini-Statement";

        if Transaction = 'Mpesa Deposit' then
            TransactionType := Transactiontype::"Mpesa Deposit";

        if Transaction = 'Bank Deposit' then
            TransactionType := Transactiontype::"Bank Deposit";

        if Transaction = 'Bank Agent Deposit' then
            TransactionType := Transactiontype::"Bank Agent Deposit";

        if Transaction = 'Mpesa Withdrawal' then
            TransactionType := Transactiontype::"Mpesa Withdrawal";


        if Transaction = 'Utility Request' then
            TransactionType := Transactiontype::"Utility Payment";

        if Transaction = 'Utility Payment' then
            TransactionType := Transactiontype::"Utility Payment";

        if Transaction = 'Withdrawal Request' then
            TransactionType := Transactiontype::"Mpesa Withdrawal";

        if Transaction = 'Paybill' then
            TransactionType := Transactiontype::Paybill;


        if Transaction = 'Bank Transfer' then
            TransactionType := Transactiontype::"Bank Transfer";


        if Transaction = 'Bank Transfer Request' then
            TransactionType := Transactiontype::"Bank Transfer";

        if Transaction = 'Pesalink Transfer' then
            TransactionType := Transactiontype::"Pesalink Transfer";


        if Transaction = 'Pesalink Transfer Request' then
            TransactionType := Transactiontype::"Pesalink Transfer";


        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", TransactionType);
        if CoopSetup.FindFirst then begin
            SavAcc.Reset;
            SavAcc.SetRange("Transactional Mobile No", PhoneNo);
            if SavAcc.FindFirst then begin
                if CoopSetup."Restrict to Employer" = '' then
                    Restricted := false
                else begin
                    if SavAcc."Employer Code" = CoopSetup."Restrict to Employer" then
                        Restricted := false;
                end;
            end;
        end;
    end;

    local procedure GetGuarantorMobileNo(MobileNo: Code[20]): Text
    begin

        if StrLen(MobileNo) = 10 then begin
            if CopyStr(MobileNo, 1, 1) = '0' then
                MobileNo := '+254' + CopyStr(MobileNo, 2, 9);
        end
        else
            if StrLen(MobileNo) = 12 then begin
                if CopyStr(MobileNo, 1, 3) = '254' then
                    MobileNo := '+' + MobileNo;
            end
            else
                if StrLen(MobileNo) = 13 then begin
                    if CopyStr(MobileNo, 1, 4) = '+254' then
                        MobileNo := MobileNo;
                end;

        exit(MobileNo);
    end;


    procedure GetLoanPendingGuarantor(PhoneNo: Code[20]) Response: Text
    var
        SkyMobileLoans: Record 52185483;
        Members: Record 52185700;
        SavingsAccounts: Record 52185730;
        LoanType: Record 52185690;
        MobileLoanGuarantors: Record 52185470;
        RemGuar: Integer;
        SavAcc: Record 52185730;
        msg: Text;
        Loans: Record 52185729;
        LoanG: Record 52185739;
        ProductName: Text;
    begin

        PhoneNo := '+' + PhoneNo;
        Response := 'NULL';

        SkyMobileLoans.Reset;
        SkyMobileLoans.SetRange("Telephone No", PhoneNo);
        SkyMobileLoans.SetRange(Status, SkyMobileLoans.Status::"Pending Guarantors");
        if SkyMobileLoans.FindFirst then begin

            LoanType.Get(SkyMobileLoans."Loan Product Type");
            ProductName := LoanType."USSD Product Name";
            if ProductName = '' then
                ProductName := LoanType."Product Description";

            Response := '<Loan>';
            Response += '<EntryNo>' + Format(SkyMobileLoans."Entry No") + '</EntryNo>';
            Response += '<ProductName>' + ProductName + '</ProductName>';
            Response += '<RequestedAmount>' + Format(SkyMobileLoans."Requested Amount") + '</RequestedAmount>';
            Response += '<LoanStatus>' + Format(SkyMobileLoans.Status) + '</LoanStatus>';
            Response += '<Guarantors>';
            MobileLoanGuarantors.Reset;
            MobileLoanGuarantors.SetRange("Loan Entry No.", SkyMobileLoans."Entry No");
            if MobileLoanGuarantors.FindFirst then begin
                repeat
                    Response += '<GuarantorDetail>';
                    Response += '<GuarantorName>' + Format(MobileLoanGuarantors."Guarantor Name") + '</GuarantorName>';
                    Response += '<MemberNo>' + MobileLoanGuarantors."Guarantor Member No." + '</MemberNo>';
                    Response += '<PhoneNo>' + MobileLoanGuarantors."Guarantor Mobile No." + '</PhoneNo>';
                    Response += '<LoanStatus>' + Format(MobileLoanGuarantors.Status) + '</LoanStatus>';
                    Response += '</GuarantorDetail>';
                until MobileLoanGuarantors.Next = 0;

            end;
            Response += '</Guarantors>';
            Response += '</Loan>';
        end;
    end;


    procedure GetUnhashedPINs() Response: Text
    var
        SkyAuth: Record 52185476;
        SavAcc: Record 52185730;
    begin
        Response := 'ERROR';

        SkyAuth.Reset;
        SkyAuth.SetRange(SkyAuth."PIN Encrypted", false);
        if SkyAuth.FindFirst then begin
            Response := '<ACCOUNTS>';
            repeat
                Response += '<ACCOUNT ACCOUNT_NUMBER="' + SkyAuth."Account No." + '" PHONE_NUMBER="' + SkyAuth."Mobile No." + '" PIN="' + SkyAuth."PIN No." + '"/>'
            until SkyAuth.Next = 0;
            Response += '</ACCOUNTS>';
        end
        else begin
            Response := '<ACCOUNTS/>';
        end;
    end;


    procedure SetHashedPIN("Account Number": Text; "Phone Number": Text; "PIN Number": Text) Response: Text
    var
        SkyAuth: Record 52185476;
        SavAcc: Record 52185730;
        MobileNo: Text;
    begin
        Response := 'ERROR';
        MobileNo := "Phone Number";
        SkyAuth.Reset;
        //SkyAuth.SETRANGE(SkyAuth."PIN Encrypted",FALSE);
        SkyAuth.SetRange(SkyAuth."Account No.", "Account Number");
        //SkyAuth.SETRANGE(SkyAuth."Mobile No.",MobileNo);
        if SkyAuth.Find('-') then begin
            SkyAuth."PIN No." := "PIN Number";
            SkyAuth."PIN Encrypted" := true;
            SkyAuth.Modify;
            Response := 'SUCCESS';
        end
        else begin
            Response := 'NOT_FOUND';
        end;
    end;


    procedure GetLoanToConfirmGuarantoship(PhoneNo: Code[20]) Response: Text
    var
        LoanFound: Boolean;
        SkyMobileLoans: Record 52185483;
        Members: Record 52185700;
        SavingsAccounts: Record 52185730;
        LoanType: Record 52185690;
        MobileLoanGuarantors: Record 52185470;
        RemGuar: Integer;
        SavAcc: Record 52185730;
        msg: Text;
        Loans: Record 52185729;
        LoanG: Record 52185739;
        ProductName: Text;
        GMNo: Code[20];
    begin
        PhoneNo := '+' + PhoneNo;

        Response := 'NULL';

        GMNo := '';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then begin
            GMNo := SavAcc."Member No.";
        end;


        PhoneNo := GetGuarantorMobileNo(PhoneNo);

        LoanFound := false;
        MobileLoanGuarantors.Reset;
        MobileLoanGuarantors.SetRange("Guarantor Member No.", GMNo);
        MobileLoanGuarantors.SetRange("Guarantor Accepted", MobileLoanGuarantors."guarantor accepted"::Pending);
        if MobileLoanGuarantors.FindFirst then begin
            Response := '<Loans>';

            repeat
                SkyMobileLoans.Reset;
                SkyMobileLoans.SetRange("Entry No", MobileLoanGuarantors."Loan Entry No.");
                SkyMobileLoans.SetRange(Status, SkyMobileLoans.Status::"Pending Guarantors");
                if SkyMobileLoans.FindFirst then begin
                    LoanFound := true;
                    LoanType.Get(SkyMobileLoans."Loan Product Type");
                    ProductName := LoanType."USSD Product Name";
                    if ProductName = '' then
                        ProductName := LoanType."Product Description";

                    SavingsAccounts.Get(SkyMobileLoans."Account No");
                    Response += '<Loan>';
                    Response += '<LoaneeName>' + SavingsAccounts.Name + '</LoaneeName>';
                    Response += '<EntryNo>' + Format(SkyMobileLoans."Entry No") + '</EntryNo>';
                    Response += '<LoaneePhoneNo>' + SavingsAccounts."Transactional Mobile No" + '</LoaneePhoneNo>';
                    Response += '<ProductName>' + ProductName + '</ProductName>';
                    Response += '<RequestedAmount>' + Format(SkyMobileLoans."Requested Amount") + '</RequestedAmount>';
                    Response += '<LoanStatus>' + Format(SkyMobileLoans.Status) + '</LoanStatus>';
                    Response += '</Loan>';
                end;
            until MobileLoanGuarantors.Next = 0;
            Response += '</Loans>';
        end;

        if not LoanFound then
            Response := 'NULL';
    end;

    local procedure UpdateMicroLoan()
    var
        SkyMobileLoans: Record 52185483;
        Members: Record 52185700;
        SavingsAccounts: Record 52185730;
        RemGuar: Integer;
        ProductName: Text;
        LoanFound: Boolean;
    begin

        SkyMobileLoans.Reset;
        SkyMobileLoans.SetRange(Status, SkyMobileLoans.Status::"Pending Guarantors");
        SkyMobileLoans.SetRange(Posted, false);
        if SkyMobileLoans.FindFirst then begin
            if GetRemainingGuarantorCount(SkyMobileLoans."Entry No") <= 0 then begin
                UpdateAmountGuaranteed(SkyMobileLoans."Entry No");
                if MobileGuarantorsAccepted(SkyMobileLoans."Entry No") then begin
                    SkyMobileLoans.Status := SkyMobileLoans.Status::Pending;
                    SkyMobileLoans.Modify;
                end;
            end;
        end;
    end;

    local procedure GetSMSPriority(Category: Text) Priority: Integer
    begin
        if (Category = 'ATM_COLLECTION') then
            Priority := 211
        else
            if (Category = 'B2B_WITHDRAWAL') then
                Priority := 211
            else
                if (Category = 'CASH_WITHDRAWAL_CONFIRM') then
                    Priority := 211
                else
                    if (Category = 'DEPOSIT_CONFIRMATION') then
                        Priority := 220
                    else
                        if (Category = 'FIXED_DEPOSIT_MATURITY') then
                            Priority := 240
                        else
                            if (Category = 'LOAN_APPLICATION') then
                                Priority := 230
                            else
                                if (Category = 'LOAN_DEFAULTED') then
                                    Priority := 240
                                else
                                    if (Category = 'LOAN_GUARANTORS') then
                                        Priority := 240
                                    else
                                        if (Category = 'LOAN_POSTED') then
                                            Priority := 240
                                        else
                                            if (Category = 'LOW_FLOAT_ALERT') then
                                                Priority := 203
                                            else
                                                if (Category = 'LOW_FLOAT_INFO') then
                                                    Priority := 202
                                                else
                                                    if (Category = 'LOW_FLOAT_MIN') then
                                                        Priority := 200
                                                    else
                                                        if (Category = 'LOW_FLOAT_WARNING') then
                                                            Priority := 204
                                                        else
                                                            if (Category = 'MAPP_ACTIVATION') then
                                                                Priority := 200
                                                            else
                                                                if (Category = 'MAPP_DEACTIVATION') then
                                                                    Priority := 205
                                                                else
                                                                    if (Category = 'MBANKING') then
                                                                        Priority := 220
                                                                    else
                                                                        if (Category = 'MEMBER_CHANGES') then
                                                                            Priority := 240
                                                                        else
                                                                            if (Category = 'MOBILE_PIN') then
                                                                                Priority := 208
                                                                            else
                                                                                if (Category = 'NEW_ACCOUNT') then
                                                                                    Priority := 230
                                                                                else
                                                                                    if (Category = 'NEW_MEMBER') then
                                                                                        Priority := 230
                                                                                    else
                                                                                        if (Category = 'ONE_TIME_PASSWORD') then
                                                                                            Priority := 200
                                                                                        else
                                                                                            if (Category = 'SALARY_PROCESSING') then
                                                                                                Priority := 245
                                                                                            else
                                                                                                if (Category = 'WITHDRAWAL') then
                                                                                                    Priority := 214
                                                                                                else
                                                                                                    if (Category = 'LOAN_ACCOUNT_APPROVAL') then
                                                                                                        Priority := 245
                                                                                                    else
                                                                                                        if (Category = 'LOAN_APPRAISAL') then
                                                                                                            Priority := 230
                                                                                                        else
                                                                                                            if (Category = 'LOAN_REJECTED') then
                                                                                                                Priority := 225
                                                                                                            else
                                                                                                                if (Category = 'TELLER_CASH_DEPOSIT') then
                                                                                                                    Priority := 215
                                                                                                                else
                                                                                                                    if (Category = 'TELLER_CAS') then
                                                                                                                        Priority := 225
                                                                                                                    else
                                                                                                                        Priority := 250;
    end;


    procedure RecoverLoanFromSavings(LoanNo: Code[20])
    var
        msg: Text;
        SavAcc: Record 52185730;
        Loans: Record 52185729;
        LoanType: Record 52185690;
        CLedger: Record 52185733;
        PenaltyAmt: Decimal;
        JTemplate: Code[10];
        JBatch: Code[10];
        DocNo: Code[20];
        PDate: Date;
        AccNo: Code[20];
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal,"Penalty Due","Penalty Paid";
        Dim1: Code[10];
        Dim2: Code[10];
        SystCreated: Boolean;
        RunBal: Decimal;
        RecAmt: Decimal;
        LBal: Decimal;
        FullyRec: Boolean;
        CreditAccounts: Record 52185731;
        BillsAmount: Decimal;
    begin
        Loans.Reset;//here20
        Loans.SetRange("Loan No.", LoanNo);
        //Loans.SETRANGE("Non-Salaried",TRUE);
        //Loans.SETRANGE("Mobile Loan",TRUE);
        Loans.SetFilter("Outstanding Balance", '>0');
        Loans.SetFilter("Disbursement Date", '<%1', CalcDate('-30D', Today));
        if Loans.FindFirst then begin
            repeat
                LoanType.Get(Loans."Loan Product Type");
                LoanNo := Loans."Loan No.";
                Loans.CalcFields("Outstanding Balance", "Outstanding Interest", "Outstanding Bills");
                if Loans."Outstanding Interest" < 0 then
                    Loans."Outstanding Interest" := 0;

                LBal := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                FullyRec := false;
                if CreditAccounts.Get(Loans."Loan Account") then begin
                    if CreditAccounts.Blocked = CreditAccounts.Blocked::" " then begin

                        begin

                            SavAcc.Reset;
                            SavAcc.SetRange("Member No.", Loans."Member No.");
                            SavAcc.SetRange("Product Type", '505');
                            SavAcc.SetFilter("Balance (LCY)", '>1000');
                            SavAcc.SetRange(Blocked, SavAcc.Blocked::" ");
                            if SavAcc.FindFirst then begin

                                HMember.Get(Loans."Member No.");
                                FName := HMember."First Name";
                                if FName = '' then
                                    FName := HMember."Second Name";

                                SavAcc.CalcFields("Balance (LCY)");
                                RunBal := GetAccountBalance(SavAcc."No.");

                                if RunBal > LBal then
                                    FullyRec := true
                                else
                                    FullyRec := false;

                                JTemplate := 'RECEIPT';
                                JBatch := 'SKYWORLD';
                                DocNo := Loans."Loan No.";
                                PDate := Today;
                                Dim1 := Loans."Global Dimension 1 Code";
                                Dim2 := Loans."Global Dimension 2 Code";
                                SystCreated := true;
                                AccNo := Loans."Loan Account";

                                SaccoTrans.InitJournal(JTemplate, JBatch);

                                if RunBal > 0 then begin
                                    RecAmt := Loans."Outstanding Interest";
                                    if RecAmt < 0 then
                                        RecAmt := 0;

                                    if RecAmt > RunBal then
                                        RecAmt := RunBal;
                                    RunBal -= RecAmt;

                                    if RecAmt > 0 then begin

                                        SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, AccNo, CopyStr(LoanType."Product Description" + ' Interest Offset', 1, 50), Balacctype::"G/L Account",
                                              '', -RecAmt, '', LoanNo, Transtype::"Interest Paid", Dim1, Dim2, SystCreated);

                                        SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, SavAcc."No.", CopyStr(LoanType."Product Description" + ' Interest Offset', 1, 50), Balacctype::"G/L Account",
                                              '', RecAmt, '', LoanNo, Transtype::"Interest Paid", Dim1, Dim2, SystCreated);

                                    end;



                                    if RunBal > 0 then begin
                                        RecAmt := Loans."Outstanding Balance";
                                        if RecAmt < 0 then
                                            RecAmt := 0;

                                        if RecAmt > RunBal then
                                            RecAmt := RunBal;
                                        RunBal -= RecAmt;

                                        if RecAmt > 0 then begin

                                            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, AccNo, CopyStr(LoanType."Product Description" + ' Principal Offset', 1, 50), Balacctype::"G/L Account",
                                                  '', -RecAmt, '', LoanNo, Transtype::Repayment, Dim1, Dim2, SystCreated);

                                            SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, SavAcc."No.", CopyStr(LoanType."Product Description" + ' Principal Offset', 1, 50), Balacctype::"G/L Account",
                                                  '', RecAmt, '', LoanNo, Transtype::Repayment, Dim1, Dim2, SystCreated);

                                            if Loans."Outstanding Bills" < RecAmt then
                                                BillsAmount := Loans."Outstanding Bills";
                                            if BillProdFac.Get(Loans."Loan Product Type") then begin

                                                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Credit, Loans."Loan Account", CopyStr('Bill Clearance', 1, 50), Balacctype::"G/L Account",
                                                        BillProdFac."Billed Account", -BillsAmount, '', Loans."Loan No.", Transtype::Bills, Dim1, Dim2, SystCreated);

                                            end;


                                        end;
                                    end;

                                    SaccoTrans.PostJournal(JTemplate, JBatch);


                                    if FullyRec then begin
                                        msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + LoanType."USSD Product Name" + ' has been fully recovered from your savings account.';
                                        SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Loans."Loan No.", SavAcc."No.", false, Priority, false);

                                    end
                                    else begin

                                        Loans.CalcFields("Outstanding Balance");
                                        LBal := Loans."Outstanding Balance";
                                        msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + LoanType."USSD Product Name" + ' has been partially recovered from your savings account. Current Loan Balance is KES ' + Format(LBal);
                                        SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Loans."Loan No.", SavAcc."No.", false, Priority, false);

                                    end;

                                    Loans.Validate(Repayment);
                                    //AdviceLoan(Loans."Loan No.",FALSE);
                                end;
                            end;
                        end;
                    end;
                end;
            until Loans.Next = 0;
        end;
    end;


    procedure UpdateDepositOffset()
    var
        DividendProgression: Record 52185713;
        Members: Record 52185700;
        Savings: Record 52185730;
    begin


        /*
        DividendProgression.RESET;
        DividendProgression.SETRANGE("Product Type",'111');
        DividendProgression.SETRANGE("End Date",CALCDATE('-2Y+CY',TODAY));
        IF DividendProgression.FINDFIRST THEN BEGIN
            REPEAT
                IF Savings.GET(DividendProgression."Account No") THEN BEGIN
                    Savings.CALCFIELDS("Balance (LCY)");
                    IF Savings."Balance (LCY)" < DividendProgression."Qualifying Shares" THEN BEGIN
                        IF Members.GET(Savings."Member No.") THEN BEGIN
                            Members."Deposit Offset" := TRUE;
                            Members.MODIFY;
                        END;
                    END;
                END;
            UNTIL DividendProgression.NEXT=0;
        END;
        */

    end;


    procedure GetDividendPayslip(MobileNumber: Text; DateGenerated: Text; DocumentReference: Text; DestinationEmaillAddress: Text) Response: Text
    var
        DividendProgression: Record 52185713;
        Members: Record 52185700;
        Savings: Record 52185730;
        CompInfo: Record "Company Information";
        Year: Integer;
        Cust: Record Customer;
        EmpName: Text;
        EndDate: Date;
        DividendSetUp: Record 52185708;
        ProductFactory: Record 52185690;
        eq: label '''=''';
    begin

        MobileNumber := '+' + MobileNumber;
        Response := '';

        Savings.Reset;
        Savings.SetRange("Transactional Mobile No", MobileNumber);
        if Savings.FindFirst then begin

            CompInfo.Get;
            EmpName := '';
            if Cust.Get(Savings."Employer Code") then
                EmpName := Cust.Name;

            DividendSetUp.Get;

            //EVALUATE(Year,DivYear);

            Year := Date2dmy(DividendSetUp."End Date", 3);

            EndDate := DividendSetUp."End Date";

            Response += '<table style="width: 100%" class="table">';
            Response += '<tr class="table-header">';
            Response += '<td colspan="6">' + CompInfo.Name + '</td>';
            Response += '</tr>';
            Response += '<tr class="table-header">';
            Response += '<td colspan="6">DIVIDEND SLIP YEAR ' + Format(Year) + '</td>';
            Response += '</tr>';
            Response += '<tr>';
            Response += '<td class="table-column-title">Name</td>';
            Response += '<td colspan="5">' + Savings.Name + '</td>';
            Response += '</tr>';
            Response += '<tr>';
            Response += '<td class="table-column-title">Member Number</td>';
            Response += '<td colspan="5">' + Savings."Member No." + '</td>';
            Response += '</tr>';
            Response += '<tr>';
            Response += '<td class="table-column-title">Staff Number</td>';
            Response += '<td colspan="5">' + Savings."Payroll/Staff No." + '</td>';
            Response += '</tr>';
            Response += '<tr>';
            Response += '<td class="table-column-title">Employer</td>';
            Response += '<td colspan="5">' + EmpName + '</td>';
            Response += '</tr>';



            Response += '<tr>';
            Response += '<td class="table-column-title">Product Name</td>';
            Response += '<td class="bold-text">Shares</td>';
            Response += '<td class="bold-text">Rate (%)</td>';
            Response += '<td class="bold-text">Gross Dividend</td>';
            Response += '<td class="bold-text">WTax</td>';
            Response += '<td class="bold-text">Net Payable</td>';
            Response += '</tr>';

            DividendProgression.Reset;
            DividendProgression.SetRange("Member No", Savings."Member No.");
            DividendProgression.SetRange("End Date", EndDate);
            if DividendProgression.FindFirst then begin
                repeat
                    ProductFactory.Get(DividendProgression."Product Type");
                    Response += '<tr class="right-align">';
                    Response += '<td class="left-align">' + ProductFactory."Product Description" + '</td>';
                    Response += '<td>' + Format(ROUND(DividendProgression.Shares, 0.01)) + '</td>';
                    Response += '<td>' + Format(ProductFactory."Interest Rate (Min.)") + '</td>';
                    Response += '<td>' + Format(ROUND(DividendProgression."Gross Dividends", 0.01)) + '</td>';
                    Response += '<td>' + Format(ROUND(DividendProgression."Witholding Tax", 0.01)) + '</td>';
                    Response += '<td>' + Format(ROUND(DividendProgression."Net Dividends", 0.01)) + '</td>';
                    Response += '</tr>';
                until DividendProgression.Next = 0;
                DividendProgression.CalcSums(Shares, "Gross Dividends", "Witholding Tax", "Net Dividends");
                Response += '<tr class="right-align">';
                Response += '<td></td>';
                Response += '<td class="bold-text">' + Format(ROUND(DividendProgression.Shares, 0.01)) + '</td>';
                Response += '<td class="bold-text">' + Format(ProductFactory."Interest Rate (Min.)") + '</td>';
                Response += '<td class="bold-text">' + Format(ROUND(DividendProgression."Gross Dividends", 0.01)) + '</td>';
                Response += '<td class="bold-text">' + Format(ROUND(DividendProgression."Witholding Tax", 0.01)) + '</td>';
                Response += '<td class="bold-text">' + Format(ROUND(DividendProgression."Net Dividends", 0.01)) + '</td>';
                Response += '</tr>';
            end;


            Response += '</table>';
            Response += '<table style="width: 100%" class="table">';
            Response += '<tr>';
            Response += '<td class="table-column-title" colspan="6">File Information</td>';
            Response += '</tr>';
            Response += '<tr>';
            Response += '<td class="table-column-title">Date Generated</td>';
            Response += '<td colspan="5">' + DateGenerated + '</td>';
            Response += '</tr>';
            Response += '<tr>';
            Response += '<td class="table-column-title">Document Reference</td>';
            Response += '<td colspan="5">' + DocumentReference + '</td>';
            Response += '</tr>';
            Response += '<tr>';
            Response += '<td class="table-column-title">Sent To</td>';
            Response += '<td colspan="5">' + DestinationEmaillAddress + '</td>';
            Response += '</tr>';
            Response += '</table>';
            Response += '<table style="width: 100%" class="table">';
            Response += '<tr>';
            Response += '<td colspan="6" class="bold-text">';
            Response += '<i>In case of any queries, please write to the Chief Executive Officer</i>';
            Response += '</td>';
            Response += '</tr>';
            Response += '</table>';

        end;
    end;


    procedure GetSalaryEntries(AcctNo: Code[20]; var SalDates: array[3] of Date; var SmallestSal: Decimal; var Salary: array[3] of Decimal; var SalaryThroughFosa: Boolean)
    var
        MCommission: Decimal;
        MInterest: Decimal;
        LoanProdCharge: Record 52185734;
        MComm: Integer;
        MInt: Decimal;
        LAccount: Code[50];
        SaccoMemberNo: Code[20];
        ContinueMB: Boolean;
        Members: Record 52185700;
        interestGL: Code[10];
        LoansOld: Record 52185729;
        TopupAmount: Decimal;
        TotalClearedAmount: Decimal;
        SavingsAccounts: Record 52185730;
        LoanProcessingGL: Code[20];
        vendorMboostaCommission: Decimal;
        vendorMboostaCommissionGL: Code[20];
        Loans: Record 52185729;
        ProdFac: Record 52185690;
        OutstandingAmount: Decimal;
        StartDate: array[3] of Date;
        EndDate: array[3] of Date;
        SalBuffer: Record 52185784;
        CurrSal: array[3] of Decimal;
        k: Integer;
    begin
        TotalClearedAmount := 0;
        SalaryThroughFosa := false;
        for k := 3 downto 1 do begin
            Salary[k] := 0;
            SalDates[k] := 0D;
        end;
        SmallestSal := 0;

        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."No.", AcctNo);
        if SavingsAccounts.Find('-') then begin

            EndDate[3] := CalcDate('CM', Today);
            StartDate[3] := CalcDate('-CM', EndDate[3]);

            SalBuffer.Reset;
            SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Account No.", SalBuffer."Posting Date");
            SalBuffer.SetRange(SalBuffer."Account No.", AcctNo);
            SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', StartDate[3], EndDate[3]);
            SalBuffer.SetRange(Posted, true);
            if not SalBuffer.Find('-') then begin
                EndDate[3] := CalcDate('-1M+CM', Today);
                StartDate[3] := CalcDate('-CM', EndDate[3]);
            end;


            EndDate[2] := CalcDate('-1M+CM', EndDate[3]);
            StartDate[2] := CalcDate('-CM', EndDate[2]);

            EndDate[1] := CalcDate('-1M+CM', EndDate[2]);
            StartDate[1] := CalcDate('-CM', EndDate[1]);

            for k := 3 downto 1 do begin
                SalBuffer.Reset;
                SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Account No.", SalBuffer."Posting Date");
                SalBuffer.SetRange(SalBuffer."Account No.", AcctNo);
                SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', StartDate[k], EndDate[k]);
                SalBuffer.SetRange(Posted, true);
                if SalBuffer.Find('+') then begin
                    SalaryThroughFosa := true;
                    SalBuffer.CalcSums(Amount);
                    Salary[k] := SalBuffer.Amount;
                    SalDates[k] := SalBuffer."Posting Date";
                end;
            end;
        end;
        SmallestSal := Salary[1];

        if SmallestSal > Salary[2] then
            SmallestSal := Salary[2];

        if SmallestSal > Salary[3] then
            SmallestSal := Salary[3];
        //5050020771000




        //MESSAGE('%1\%2\%3',Salary[1],Salary[2],Salary[3]);
    end;


    procedure MBoostaAppraisal(AcctNo: Code[20]; var Success: Boolean; var Msg: Text; var LoanLimit: Decimal; var QualifiedAmt: Decimal; var TopUp: Decimal)
    var
        MCommission: Decimal;
        MInterest: Decimal;
        LoanProdCharge: Record 52185734;
        MComm: Integer;
        MInt: Decimal;
        LAccount: Code[50];
        SaccoMemberNo: Code[20];
        ContinueMB: Boolean;
        Members: Record 52185700;
        interestGL: Code[10];
        LoansOld: Record 52185729;
        TotalClearedAmount: Decimal;
        SavingsAccounts: Record 52185730;
        LoanProcessingGL: Code[20];
        vendorMboostaCommission: Decimal;
        vendorMboostaCommissionGL: Code[20];
        Loans: Record 52185729;
        ProdFac: Record 52185690;
        OutstandingAmount: Decimal;
        StartDate: array[3] of Date;
        EndDate: array[3] of Date;
        SalBuffer: Record 52185784;
        CurrSal: array[3] of Decimal;
        k: Integer;
        SmallestSal: Decimal;
        Deposit: array[3] of Decimal;
        DepDates: array[3] of Date;
        SalaryThroughFosa: Boolean;
        BlaklistStartDate: Date;
        Limit: Decimal;
        LoanedBefore: Boolean;
        LastDate: Date;
        j: Integer;
        SLedger: Record 52185732;
        DepAccount: Record 52185730;
        LastDeposit: Decimal;
        DepProduct: Record 52185690;
        LoanNo: array[3] of Code[20];
        LoanAmount: array[3] of Decimal;
        LNo: Code[20];
        HighestAmt: Decimal;
        WithinTheMonth: Boolean;
    begin
        TotalClearedAmount := 0;


        ContinueMB := true;
        TopUp := 0;
        ProdFac.Get('126');
        Limit := ProdFac."MLoan Appraisal Start Point";
        Msg := 'Success';
        QualifiedAmt := Limit;


        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."No.", AcctNo);
        if SavingsAccounts.Find('-') then begin

            SaccoMemberNo := SavingsAccounts."Member No.";
            Members.Get(SaccoMemberNo);



            if (Members."Employer Code" = '9901') or (Members."Employer Code" = '9902') then begin
                Success := false;
                Msg := 'Please Visit the nearest branch to Apply for this loan';
                QualifiedAmt := 0;
                exit;
            end;

            SavingsAccounts.CalcFields(Balance);
            if SavingsAccounts.Balance < -500 then begin
                Success := false;
                Msg := 'Your FOSA Account is overdrawn with KES ' + Format(SavingsAccounts.Balance * -1);
                QualifiedAmt := 0;
                exit;
            end;



            //***sat
            if (Members.Status <> Members.Status::Active) and (Members.Status <> Members.Status::New) then begin
                Success := false;
                Msg := 'Your BOSA Account is Inactive';
                QualifiedAmt := 0;
                exit;
            end;

            //check if account is active
            if (SavingsAccounts.Status <> SavingsAccounts.Status::Active) and (SavingsAccounts.Status <> SavingsAccounts.Status::New) and (SavingsAccounts.Status <> SavingsAccounts.Status::Dormant) then begin
                Success := false;
                Msg := 'Your FOSA Account is Inactive';
                QualifiedAmt := 0;
                exit;
            end;


            DepAccount.Reset;
            DepAccount.SetRange(DepAccount."Member No.", Members."No.");
            DepAccount.SetRange("Product Category", DepAccount."product category"::"Deposit Contribution");
            if DepAccount.Find('-') then begin

                if not Members."Allow MBoosta Defaulter" then begin
                    SLedger.Reset;
                    SLedger.SetRange("Customer No.", DepAccount."No.");
                    SLedger.SetRange("Document No.", 'RECOVERY OF MB LOAN');
                    if SLedger.FindFirst then begin
                        SLedger.CalcSums(Amount);
                        if SLedger.Amount > 12000 then begin
                            Success := false;
                            Msg := 'You do not qualify for this product';
                            QualifiedAmt := 0;
                            exit;
                        end;
                    end;
                end;


                LastDeposit := 0;
                GetDepositEntries(SavingsAccounts."Member No.", DepDates, Deposit, LastDeposit, true);//here

                DepProduct.Get(DepAccount."Product Type");
                //check Deposits
                if (LastDeposit < 1000) then begin
                    Success := false;
                    Msg := 'You are not regular in your deposit contribution';
                    QualifiedAmt := 0;
                    exit;
                end;

            end
            else begin

                Success := false;
                Msg := 'Deposit Account Missing';
                QualifiedAmt := 0;
                exit;
            end;


            //check if blocked
            if (SavingsAccounts."Mobile Loan Blocked" = true) then begin
                Success := false;
                Msg := 'You are blocked from accessing this Product';
                QualifiedAmt := 0;
                exit;
            end;

            Loans.Reset;
            Loans.SetRange(Loans."Loan Product Type", ProdFac."Product ID");
            Loans.SetRange(Loans."Member No.", SaccoMemberNo);
            Loans.SetFilter("Outstanding Balance", '>0');
            if Loans.Find('-') then begin
                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                OutstandingAmount := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                OutstandingAmount := ROUND(OutstandingAmount, 1, '>');
                Success := false;
                QualifiedAmt := 0;
                Msg := 'You have an active ' + ProdFac."Product Description" + ' of KES ' + Format(OutstandingAmount);
                exit;
            end;

            //    Loans.RESET;
            //    Loans.SETRANGE(Loans."Member No.",SaccoMemberNo);
            //    Loans.SETFILTER(Loans."Loans Category-SASRA",'<>%1',Loans."Loans Category-SASRA"::Perfoming);
            //    Loans.SETFILTER("Outstanding Balance",'>0');
            //    IF Loans.FIND('-') THEN BEGIN
            //        Loans.CALCFIELDS(Loans."Outstanding Balance",Loans."Outstanding Interest");
            //        OutstandingAmount :=  Loans."Outstanding Balance" + Loans."Outstanding Interest";
            //        IF (OutstandingAmount > 0) THEN BEGIN
            //            Success := FALSE;
            //            QualifiedAmt := 0;
            //            Msg := 'Your Loan '+Loans."Loan No."+'. is in arrears';
            //            EXIT;
            //        END;
            //    END;

            LoanedBefore := false;
            Loans.Reset;
            Loans.SetRange(Loans."Loan Product Type", ProdFac."Product ID");
            Loans.SetRange(Loans."Member No.", SaccoMemberNo);
            Loans.SetRange(Posted, true);
            if Loans.FindFirst then begin
                LoanedBefore := true;
            end
            else begin
                Limit := ProdFac."MLoan Appraisal Start Point";
            end;

            LastDate := 0D;
            if LoanedBefore then begin

                for k := 3 downto 1 do begin
                    LoanNo[k] := '';
                    LoanAmount[k] := 0;
                end;


                WithinTheMonth := false;
                LastLoanAmount(LoanNo, LoanAmount, SaccoMemberNo, ProdFac."Product ID", WithinTheMonth);//here2
                HighestAmt := LoanAmount[1];
                LNo := LoanNo[1];

                if HighestAmt < LoanAmount[2] then begin
                    HighestAmt := LoanAmount[2];
                    LNo := LoanNo[2];
                end;
                if HighestAmt < LoanAmount[3] then begin
                    HighestAmt := LoanAmount[3];
                    LNo := LoanNo[3];
                end;

                Loans.Reset;
                Loans.SetCurrentkey("Disbursement Date");
                Loans.SetRange("Loan No.", LNo);
                Loans.SetRange(Loans."Loan Product Type", ProdFac."Product ID");
                Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                Loans.SetFilter("Outstanding Balance", '<=0');
                Loans.SetRange(Posted, true);
                if Loans.Find('+') then begin

                    if Loans."Maximum Limit" = 0 then begin
                        Loans."Maximum Limit" := Loans."Approved Amount";

                        //MESSAGE('%1\%2',Loans."Approved Amount",Loans."Maximum Limit");
                        if ProdFac."MLoan Appraisal Increment" > 0 then begin
                            j := ROUND(Loans."Maximum Limit" / ProdFac."MLoan Appraisal Increment", 1, '>');
                            //MESSAGE('%1\%2',ProdFac."MLoan Appraisal Increment",j);

                            Loans."Maximum Limit" := ProdFac."MLoan Appraisal Increment" * j;
                        end;

                    end;

                    Limit := Loans."Maximum Limit";
                    //MESSAGE(FORMAT(Limit)+'  LIMIT'+Loans."Loan No.");
                    if Limit < ProdFac."MLoan Appraisal Start Point" then
                        Limit := ProdFac."MLoan Appraisal Start Point";

                    if WithinTheMonth then begin
                        //IF (LoanAmount[1] <> LoanAmount[2]) OR (LoanAmount[1] = LoanAmount[2]) THEN Limit += ProdFac."MLoan Appraisal Increment";
                        if (Today - Loans."Disbursement Date") > 30 then
                            Limit += ProdFac."MLoan Appraisal Increment";
                    end else
                        Limit += ProdFac."MLoan Appraisal Increment";

                    if Loans."Penalty Charge" then
                        Limit := ProdFac."MLoan Appraisal Start Point";

                end;

            end;

            if Limit > ProdFac."Maximum Loan Amount" then
                Limit := ProdFac."Maximum Loan Amount";

            QualifiedAmt := Limit;
            //MESSAGE(FORMAT(QualifiedAmt));

            LoanLimit := Limit;

            if QualifiedAmt < 0 then
                QualifiedAmt := 0;
        end;
    end;


    procedure SalaryMobileLoanAppraisal(AcctNo: Code[20]; var Success: Boolean; var Msg: Text; var LoanLimit: Decimal; var QualifiedAmt: Decimal; var TopUp: Decimal; LoanProduct: Code[20]; var Salary: array[3] of Decimal; var SalDates: array[3] of Date)
    var
        MCommission: Decimal;
        MInterest: Decimal;
        LoanProdCharge: Record 52185734;
        MComm: Integer;
        MInt: Decimal;
        LAccount: Code[50];
        SaccoMemberNo: Code[20];
        ContinueMB: Boolean;
        Members: Record 52185700;
        interestGL: Code[10];
        LoansOld: Record 52185729;
        TotalClearedAmount: Decimal;
        SavingsAccounts: Record 52185730;
        LoanProcessingGL: Code[20];
        vendorMboostaCommission: Decimal;
        vendorMboostaCommissionGL: Code[20];
        Loans: Record 52185729;
        ProdFac: Record 52185690;
        OutstandingAmount: Decimal;
        StartDate: array[3] of Date;
        EndDate: array[3] of Date;
        SalBuffer: Record 52185784;
        CurrSal: array[3] of Decimal;
        k: Integer;
        SmallestSal: Decimal;
        SalaryThroughFosa: Boolean;
        BlaklistStartDate: Date;
        Limit: Decimal;
        LoanTypes: Record 52185690;
        LoanRepayments: Decimal;
        MonthlyInterest: Decimal;
        LPay: Decimal;
        StandingOrderHeader: Record 52185717;
        STOAmount: Decimal;
        StandingOrderLines: Record 52185718;
        STOLoans: Record 52185729;
        SameProductSTOAmount: Decimal;
    begin
        TotalClearedAmount := 0;


        ContinueMB := true;
        TopUp := 0;
        ProdFac.Get(LoanProduct);
        Limit := 0;
        STOAmount := 0;
        QualifiedAmt := Limit;
        Msg := 'Success';
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."No.", AcctNo);
        if SavingsAccounts.Find('-') then begin

            SaccoMemberNo := SavingsAccounts."Member No.";
            Members.Get(SaccoMemberNo);
            SalaryThroughFosa := false;
            SmallestSal := 0;



            if (Members."Employer Code" = '9901') or (Members."Employer Code" = '9902') then begin
                Success := false;
                Msg := 'Please Visit the nearest branch to Apply for this loan';
                exit;
            end;


            SavingsAccounts.CalcFields(Balance);
            if SavingsAccounts.Balance < -500 then begin
                Success := false;
                Msg := 'Your FOSA Account is overdrawn with KES ' + Format(SavingsAccounts.Balance * -1);
                exit;
            end;


            for k := 3 downto 1 do begin
                Salary[k] := 0;
                SalDates[k] := 0D;
            end;

            GetSalaryEntries(AcctNo, SalDates, SmallestSal, Salary, SalaryThroughFosa);
            SameProductSTOAmount := 0;
            StandingOrderHeader.Reset;
            StandingOrderHeader.SetRange("Source Account No.", AcctNo);
            StandingOrderHeader.SetRange(Status, StandingOrderHeader.Status::Approved);
            if StandingOrderHeader.FindFirst then begin
                repeat
                    StandingOrderHeader.CalcFields("Allocated Amount");
                    STOAmount += StandingOrderHeader."Allocated Amount";

                    StandingOrderLines.Reset;
                    StandingOrderLines.SetRange("Document No.", StandingOrderHeader."No.");
                    StandingOrderLines.SetRange("Destination Account Type", StandingOrderLines."destination account type"::Credit);
                    if StandingOrderLines.FindFirst then begin
                        repeat
                            if STOLoans.Get(StandingOrderLines."Loan No.") then begin
                                if STOLoans."Loan Product Type" = LoanProduct then begin
                                    SameProductSTOAmount += StandingOrderLines.Amount;
                                end;
                            end;
                        until StandingOrderLines.Next = 0;
                    end;
                until StandingOrderHeader.Next = 0;
            end;

            STOAmount := STOAmount - SameProductSTOAmount;

            SmallestSal := SmallestSal - STOAmount;

            if SmallestSal <= 0 then begin
                Success := false;
                Msg := 'Your commitments are greater than your net salary';
                exit;
            end;

            SmallestSal := ROUND(ProdFac."Mobile Loan Net %" / 100 * SmallestSal);

            if not SalaryThroughFosa then begin

                Success := false;
                Msg := ChannelThroughFosa;
                exit;
            end;

            Limit := SmallestSal;


            //***sat
            if (Members.Status <> Members.Status::Active) and (Members.Status <> Members.Status::New) then begin
                Success := false;
                Msg := 'Your BOSA Account is Inactive';
                exit;
            end;

            //check if account is active
            if (SavingsAccounts.Status <> SavingsAccounts.Status::Active) and (SavingsAccounts.Status <> SavingsAccounts.Status::New) then begin
                Success := false;
                Msg := 'Your FOSA Account is Inactive';
                exit;
            end;

            //check if blocked
            if (SavingsAccounts."Mobile Loan Blocked" = true) then begin
                Success := false;
                Msg := 'You are blocked from accessing this Product';
                exit;
            end;


            //check if defaulter

            Loans.Reset;
            Loans.SetRange(Loans.Status, Loans.Status::Approved);
            Loans.SetRange(Loans."Member No.", SaccoMemberNo);
            Loans.SetFilter(Loans."Loans Category-SASRA", '<>%1', Loans."loans category-sasra"::Perfoming);
            Loans.SetFilter("Outstanding Balance", '>0');
            if Loans.Find('-') then begin
                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                OutstandingAmount := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                if (OutstandingAmount > 0) and (Loans."Loans Category-SASRA" <> Loans."loans category-sasra"::Perfoming) then begin
                    Success := false;
                    Msg := 'Your Loan ' + Loans."Loan No." + ' is in arrears';
                    exit;
                end;
            end;


            Loans.Reset;
            Loans.SetRange(Loans."Loan Product Type", ProdFac."Product ID");
            Loans.SetRange(Loans."Member No.", SaccoMemberNo);
            Loans.SetRange("Penalty Charge", false);
            Loans.SetFilter("Outstanding Balance", '>0');
            if Loans.Find('+') then begin
                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                OutstandingAmount := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                TopUp := OutstandingAmount;
            end
            else begin
                /*
                Loans.RESET;
                Loans.SETRANGE(Loans."Loan Product Type",ProdFac."Product ID");
                Loans.SETRANGE(Loans."Member No.",SaccoMemberNo);
                Loans.SETRANGE("Penalty Charge",TRUE);
                IF Loans.FIND('+') THEN BEGIN
                    Loans.CALCFIELDS(Loans."Outstanding Balance",Loans."Outstanding Interest");
                    OutstandingAmount :=  Loans."Outstanding Balance" + Loans."Outstanding Interest";
                    IF OutstandingAmount > 0 THEN BEGIN
                        Success := FALSE;
                        Msg := 'You have defaulted an active '+ProdFac."Product Description"+' Loan';
                        EXIT;
                    END;
                END;
                */
            end;

            if SmallestSal < Limit then
                Limit := SmallestSal;


            if (not SalaryThroughFosa) or (SmallestSal = 0) then begin
                Success := false;
                Msg := '3 Months Salary missing';
                exit;
            end;



            LoanLimit := Limit;
            QualifiedAmt := (Limit);


            //IF LoanProduct = '119'then
            //  MESSAGE('SM %1-%2',QualifiedAmt,TopUp);

            /*
            LPay := 0;
            LoanTypes.RESET;
            LoanTypes.SETRANGE("Salary Loans",TRUE);
            LoanTypes.SETFILTER("Product ID",'%1',LoanProduct);
            IF LoanTypes.FINDFIRST THEN BEGIN
        
                Loans.RESET;
                Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                Loans.SETRANGE(Loans."Member No.",Members."No.");
                Loans.SETFILTER(Loans."Loan Product Type",LoanTypes."Product ID");
                Loans.SETFILTER("Outstanding Balance",'>0');
                IF Loans.FIND('-') THEN BEGIN
                    REPEAT
        
                        Loans.CALCFIELDS(Loans."Outstanding Balance",Loans."Outstanding Interest");
                        IF(Loans."Outstanding Balance" + Loans."Outstanding Interest")>0 THEN BEGIN
                            IF (Loans."Outstanding Balance" + Loans."Outstanding Interest")>Loans.Repayment THEN BEGIN
                                LPay += Loans.Repayment;
                            END
                            ELSE BEGIN
                                LPay+=(Loans."Outstanding Balance" + Loans."Outstanding Interest");
                            END;
                        END;
        
                    UNTIL Loans.NEXT = 0
                END;
            END;
            */
            LoanRepayments := 0;
            LoanTypes.Reset;
            LoanTypes.SetRange("Salary Loans", true);
            LoanTypes.SetFilter("Product ID", '<>%1', LoanProduct);
            if LoanTypes.FindFirst then begin
                repeat
                    Loans.Reset;
                    Loans.SetRange(Loans.Status, Loans.Status::Approved);
                    Loans.SetRange(Loans."Member No.", Members."No.");
                    Loans.SetFilter(Loans."Loan Product Type", LoanTypes."Product ID");
                    Loans.SetFilter("Outstanding Balance", '>0');
                    if Loans.Find('-') then begin
                        repeat

                            Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                            if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > 0 then begin
                                if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > Loans.Repayment then begin
                                    LoanRepayments += Loans.Repayment;
                                end
                                else begin
                                    LoanRepayments += (Loans."Outstanding Balance" + Loans."Outstanding Interest");
                                end;
                            end;

                        until Loans.Next = 0
                    end;
                until LoanTypes.Next = 0;
            end;

            //IF ProdFac."Product ID" = '119' THEN
            //  MESSAGE('%1\%2',LoanRepayments,QualifiedAmt);

            //QualifiedAmt += LPay;

            QualifiedAmt -= LoanRepayments;


            if ProdFac."Product ID" = '119' then begin
                MonthlyInterest := ROUND(ProdFac."Interest Rate (Max.)" / 12);

                //MESSAGE(ProdFac."Product ID"+'\QualifiedAmt %1\ProdFac."Interest Rate (Max.)" %2\MonthlyInterest %3',QualifiedAmt,ProdFac."Interest Rate (Max.)",MonthlyInterest);
                QualifiedAmt := ROUND(100 * QualifiedAmt / (100 + MonthlyInterest));
                LoanLimit := ROUND(100 * LoanLimit / (100 + MonthlyInterest));

                //MESSAGE(ProdFac."Product ID"+'\\\QualifiedAmt %1\ProdFac."Interest Rate (Max.)" %2\MonthlyInterest %3',QualifiedAmt,ProdFac."Interest Rate (Max.)",MonthlyInterest);
            end;

            QualifiedAmt := ProdFac."Ordinary Default Intallments" * QualifiedAmt;
            LoanLimit := LoanLimit * ProdFac."Ordinary Default Intallments";



            //QualifiedAmt -= TopUp;
            //MESSAGE('qualified last '+FORMAT(QualifiedAmt));
            if QualifiedAmt > ProdFac."Mobile Max. Loan Amount" then
                QualifiedAmt := ProdFac."Mobile Max. Loan Amount";

            if QualifiedAmt < 0 then
                QualifiedAmt := 0;

            if LoanRepayments > QualifiedAmt then begin
                Success := false;
                Msg := 'Existing loan repayments exceed what you qualify for';
                exit;
            end;
            Success := true;

        end;

    end;


    procedure CreateGuarantors(LoanNo: Code[20]; MLoanEntryNo: Integer)
    var
        LoanGuarantors: Record 52185739;
        SavingsAcc: Record 52185730;
        LEntry: Integer;
        MobileLoan: Record 52185483;
        Loans: Record 52185729;
        MobileLoanGuarantors: Record 52185470;
    begin
        MobileLoan.Reset;
        MobileLoan.SetRange("Entry No", MLoanEntryNo);
        if MobileLoan.Find('-') then begin
            //MESSAGE('1');
            Loans.Reset;
            //Loans.SETRANGE(Status,Loans.Status::Approved);
            Loans.SetRange("Loan No.", LoanNo);
            if Loans.Find('-') then begin
                //MESSAGE('2: %1',LoanNo);
                MobileLoanGuarantors.Reset;
                MobileLoanGuarantors.SetRange("Loan Entry No.", MLoanEntryNo);
                MobileLoanGuarantors.SetRange("Guarantor Accepted", MobileLoanGuarantors."guarantor accepted"::Yes);
                MobileLoanGuarantors.SetRange(Status, MobileLoanGuarantors.Status::Approved);
                if MobileLoanGuarantors.FindFirst then begin
                    repeat
                        //MESSAGE('3');
                        SavingsAcc.Reset;
                        SavingsAcc.SetRange("Member No.", MobileLoanGuarantors."Guarantor Member No.");
                        SavingsAcc.SetRange("Product Category", SavingsAcc."product category"::"Deposit Contribution");
                        if SavingsAcc.FindFirst then begin
                            MobileLoanGuarantors."Guarantor Dep. A/C" := SavingsAcc."No.";
                            SavingsAcc.CalcFields("Balance (LCY)");
                            //MESSAGE('4');
                            LoanGuarantors.Reset;
                            LoanGuarantors.SetRange("Loan No", Loans."Loan No.");
                            LoanGuarantors.SetRange("Savings Account No./Member No.", SavingsAcc."No.");
                            if LoanGuarantors.Find('-') then begin

                                //MESSAGE('5');
                                LoanGuarantors.Name := SavingsAcc.Name;
                                LoanGuarantors."Deposits/Shares" := SavingsAcc."Balance (LCY)";
                                //LoanGuarantors.ba:=SavingsAcc."Balance (LCY)";
                                LoanGuarantors."Amount Guaranteed" := ROUND(MobileLoan."Requested Amount" / MobileLoanGuarantors.Count, 1, '>');
                                LoanGuarantors."Account No." := SavingsAcc."Member No.";
                                LoanGuarantors."Member Guaranteed" := Loans."Member No.";
                                LoanGuarantors."Member No" := SavingsAcc."Member No.";
                                LoanGuarantors."Staff/Payroll No." := SavingsAcc."Payroll/Staff No.";
                                LoanGuarantors."Loan Type" := Loans."Loan Product Type";
                                LoanGuarantors."Loanee Name" := Loans."Member Name";
                                LoanGuarantors."Guarantor Type" := LoanGuarantors."guarantor type"::Guarantor;
                                if MobileLoanGuarantors.Modify() then begin
                                    MobileLoanGuarantors.Posted := true;
                                    MobileLoanGuarantors.Modify();
                                end;
                            end else begin

                                //MESSAGE('5');
                                LoanGuarantors.Init;
                                LoanGuarantors."Loan No" := Loans."Loan No.";
                                LoanGuarantors."Staff/Payroll No." := SavingsAcc."Payroll/Staff No.";
                                LoanGuarantors."Savings Account No./Member No." := SavingsAcc."No.";
                                LoanGuarantors.Name := SavingsAcc.Name;
                                LoanGuarantors."Deposits/Shares" := SavingsAcc."Balance (LCY)";
                                LoanGuarantors."Amount Guaranteed" := ROUND(MobileLoan."Requested Amount" / MobileLoanGuarantors.Count, 1, '>');
                                LoanGuarantors."Account No." := SavingsAcc."Member No.";
                                LoanGuarantors."Member Guaranteed" := Loans."Member No.";
                                LoanGuarantors."Member No" := SavingsAcc."Member No.";
                                LoanGuarantors."Loan Type" := Loans."Loan Product Type";
                                LoanGuarantors."Loanee Name" := Loans."Member Name";
                                LoanGuarantors."Guarantor Type" := LoanGuarantors."guarantor type"::Guarantor;
                                if LoanGuarantors.Insert then begin
                                    MobileLoanGuarantors.Posted := true;
                                    MobileLoanGuarantors.Modify();
                                    //MESSAGE(FORMAT(LoanGuarantors));
                                end;
                            end;
                        end;
                    until MobileLoanGuarantors.Next = 0;
                end;
            end;
        end;
    end;


    procedure Token(var Text: Text[100]; Separator: Text[1]) Token: Text[100]
    var
        Pos: Integer;
    begin
        Pos := StrPos(Text, Separator);


        if Pos > 0 then begin
            Token := CopyStr(Text, 1, Pos - 1);
            if Pos + 1 <= StrLen(Text) then
                Text := CopyStr(Text, Pos + 1)
            else
                Text := '';
        end else begin
            Token := Text;
            Text := '';
        end;
    end;


    procedure GetLoanPurpose() Response: Text
    var
        MobileNo: Code[20];
        Loans: Record 52185729;
        LoanProduct: Record 52185690;
        SavAcc: Record 52185730;
        MemberNo: Code[20];
        MaxLoan: Decimal;
    begin
        Response := '';


        Response := '<LoanApplicationPurposes>';
        Response += '<Purpose Id="1180" Title="Agriculture"/>';
        Response += '<Purpose Id="2220" Title="Trade"/>';
        Response += '<Purpose Id="3120" Title="Manufacturing and Services Industries"/>';
        Response += '<Purpose Id="4120" Title="Education"/>';
        Response += '<Purpose Id="5110" Title="Human Health"/>';
        Response += '<Purpose Id="6110" Title="Land and Housing"/>';
        Response += '<Purpose Id="7210" Title="Finance Investment and Insurance"/>';
        Response += '<Purpose Id="8210" Title="Consumption and Social activities"/>';
        Response += '</LoanApplicationPurposes>';
    end;


    procedure GetAgentDetails(AgentID: Code[20]) Response: Text
    var
        MobileNo: Code[20];
        Loans: Record 52185729;
        Agents: Record 52186104;
        MemberNo: Code[20];
        MaxLoan: Decimal;
        SavingsAccounts: Record 52185730;
    begin
        Response := '';
        Agents.Reset;
        Agents.SetRange("Agent Code", AgentID);
        if Agents.Find('-') then begin
            if SavingsAccounts.Get(Agents.Account) then begin
                Response += '<Agent>';
                Response += '<Number>' + Agents."Agent Code" + '</Number>';
                Response += '<AccountNo>' + Agents.Account + '</AccountNo>';
                Response += '<Name>' + Agents.Name + '</Name>';
                Response += '<Balance>' + Format(GetAccountBalance(SavingsAccounts."No.")) + '</Balance>';
                Response += '<WithdralLimit>' + Format(Agents."Withdrawal Limit Amount") + '</WithdralLimit>';
                Response += '</Agent>';
            end;
        end;
    end;


    procedure AgentWithdrawal(EntryCode: Text[20]; TransactionID: Code[20]; TransactionDate: DateTime; MobileNo: Code[20]; AgentAccount: Code[20]; Destination: Text; TransAmount: Decimal; PIN: Text) Response: Text
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52185482;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        SLedger: Record 52185732;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        AccountBookBalance: Decimal;
        AccountAvailableBalance: Decimal;
        Loans: Record 52185729;
        IntAmt: Decimal;
        PrAmt: Decimal;
        RunBal: Decimal;
        DrAmt: Decimal;
        IntRate: Decimal;
        msg: Text;
        NewLoanBal: Decimal;
        LoanType: Record 52185690;
        LT: Text;
        FromAccount: Code[20];
        MemberNo: Code[20];
        RecMemberNo: Code[20];
        RecMobileNo: Code[20];
        MemberName: Text;
        RecMemberName: Text;
        ToAccount: Code[20];
    begin

        Response := 'ERROR';


        MobileNo := '+' + MobileNo;

        if not CorrectPin(MobileNo, PIN) then begin
            Response := 'INCORRECT_PIN';
            exit;
        end;


        MemberNo := '';
        FromAccount := '';
        RecMemberNo := '';

        MemberName := '';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", MobileNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then begin
            HMember.Get(Loans."Member No.");
            FName := HMember."First Name";
            if FName = '' then
                FName := HMember."Second Name";

            FromAccount := SavAcc."No.";
            MemberNo := SavAcc."Member No.";
            MemberName := FName;
        end;


        // Get Excise duty G/L
        ExciseDutyGL := GetExciseDutyGL();
        ExciseDutyRate := GetExciseRate();
        ExciseDuty := 0;

        SaccoAccount := '';
        SaccoFee := 0;
        VendorAccount := '';
        VendorCommission := 0;
        RecMobileNo := '';


        SavAcc.Get(AgentAccount);
        RecMemberNo := SavAcc."Member No.";
        RecMemberName := SavAcc.Name;
        ToAccount := SavAcc."No.";
        RecMobileNo := SavAcc."Transactional Mobile No";
        if RecMobileNo = '' then
            RecMobileNo := SavAcc."Mobile Phone No";


        SMSAccount := '';
        SMSCharge := 0;

        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Agent Withdrawal");
        if CoopSetup.FindFirst then begin

            SMSAccount := CoopSetup."SMS Account";
            SMSCharge := CoopSetup."SMS Charge";


            SaccoAccount := CoopSetup."Sacco Fee Account";
            SaccoFee := CoopSetup."Sacco Fee";
            VendorAccount := CoopSetup."Vendor Commission Account";
            VendorCommission := CoopSetup."Vendor Commission";

            TotalCharge := SaccoFee + VendorCommission + SMSCharge;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
        end
        else begin
            Error('Setup Missing for %1', CoopSetup."transaction type"::"Agent Withdrawal");
        end;


        if SavAcc.Get(FromAccount) then begin

            ProdFact.Get(SavAcc."Product Type");

            if (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::"Deposits Only") or
                (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::" ") then begin
                Error('The Account to Charge is not a Withdrawable Account');

            end;

            RunBal := TransAmount;
            AccBal := GetAccountBalance(SavAcc."No.");
            if AccBal >= TransAmount + TotalCharge + ExciseDuty then begin

                //RunBal := RunBal - (TotalCharge+ExciseDuty);

                //BUser.GET(USERID);

                //BUser.TESTFIELD("Cashier Journal Template");
                //BUser.TESTFIELD("Cashier Journal Batch");

                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';

                GenJournalBatch.Reset;
                GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                GenJournalBatch.SetRange(Name, JBatch);
                if not GenJournalBatch.FindFirst then begin
                    GenJournalBatch.Init;
                    GenJournalBatch."Journal Template Name" := JTemplate;
                    GenJournalBatch.Name := JBatch;
                    GenJournalBatch.Description := 'Sky World Batch';
                    GenJournalBatch.Init;
                end;


                MobileTrans.Init;
                MobileTrans."Entry No." := EntryCode;
                MobileTrans."Transaction ID" := TransactionID;
                MobileTrans."Session ID" := TransactionID;
                MobileTrans."Transaction Date" := Dt2Date(TransactionDate);
                MobileTrans."Transaction Time" := Dt2Time(TransactionDate);
                MobileTrans."Member Account" := SavAcc."No.";
                MobileTrans.Amount := TransAmount;
                MobileTrans."Transaction Type" := MobileTrans."transaction type"::"Account Transfer";
                MobileTrans.Description := CopyStr('Agent Withdrawal: ' + FromAccount + ' -> ' + ToAccount, 1, 50);
                MobileTrans."Account to Check" := ToAccount;
                MobileTrans.Insert;


                MobileTrans.Reset;
                MobileTrans.SetRange("Transaction ID", TransactionID);
                MobileTrans.SetRange(Posted, false);
                if MobileTrans.FindFirst then begin

                    DocNo := MobileTrans."Transaction ID";
                    PDate := MobileTrans."Transaction Date";
                    AccNo := MobileTrans."Member Account";
                    ExtDoc := '';
                    LoanNo := '';
                    TransType := Transtype::" ";
                    Dim1 := SavAcc."Global Dimension 1 Code";
                    Dim2 := SavAcc."Global Dimension 2 Code";
                    SystCreated := true;

                    SaccoTrans.InitJournal(JTemplate, JBatch);

                    DrAmt := MobileTrans.Amount;

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(MobileTrans.Description, 1, 50), Balacctype::"G/L Account",
                                  '', DrAmt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, ToAccount, CopyStr(MobileTrans.Description, 1, 50), Balacctype::"G/L Account",
                                  '', -MobileTrans.Amount, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(Format(MobileTrans."Transaction Type") + ' Fee', 1, 50), Balacctype::"G/L Account",
                                  '', TotalCharge + ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    /*
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('SMS Charge',1,50),BalAccType::"G/L Account",
                                  '',VendorCommission,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Transfer Charge',1,50),BalAccType::"G/L Account",
                                  '',SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Notification Charge',1,50),BalAccType::"G/L Account",
                                  SMSAccount,SMSCharge,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Excise Duty',1,50),BalAccType::"G/L Account",
                                  ExciseDutyGL,ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    */


                    AccNo := VendorAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := Transtype::" ";

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Vendor, AccNo, CopyStr(MobileTrans.Description + ' Commission', 1, 50), Balacctype::"G/L Account",
                                  '', -VendorCommission, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    AccNo := SaccoAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := Transtype::" ";

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", AccNo, CopyStr(MobileTrans.Description + ' Fee', 1, 50), Balacctype::"G/L Account",
                                  '', -SaccoFee, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", ExciseDutyGL, CopyStr(MobileTrans.Description + ' Excise Duty', 1, 50), Balacctype::"G/L Account",
                                  '', -ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


                    MobileTrans.Posted := true;
                    MobileTrans."Posted By" := UserId;
                    MobileTrans."Date Posted" := Today;
                    MobileTrans.Modify;

                    SaccoTrans.PostJournal(JTemplate, JBatch);

                    Priority := 232;

                    if RecMemberNo <> MemberNo then begin
                        if RecMobileNo <> '' then begin
                            msg := 'You have successfully Received KES ' + Format(MobileTrans.Amount) + ' from ' + SavAcc.Name + ' - ' + SavAcc."No." + ' on ' + Format(Today, 0, '<Day,2>/<Month,2>/<Year4>') + ' ' + Format(Time);
                            SendSms(Source::MBANKING, RecMobileNo, msg, Format(MobileTrans."Transaction ID"), '', true, Priority, false);

                        end;

                        msg := 'Dear ' + FirstName(MemberName) + ', You have successfully Withdrawn KES. ' + Format(MobileTrans.Amount) +
                              'from ' + RecMemberName + ' on ' + Format(Today, 0, '<Day,2>/<Month,2>/<Year4>') + ' ' + Format(Time) + '.' + NewLine + 'REF: ' + MobileTrans."Transaction ID";
                        ;
                    end
                    else begin
                        msg := 'Dear ' + FirstName(MemberName) + ', You have successfully withdrawn KES. ' + Format(MobileTrans.Amount) +
                              'to A/C ' + ToAccount + ' on ' + Format(Today, 0, '<Day,2>/<Month,2>/<Year4>') + ' ' + Format(Time) + '.' + NewLine + 'REF: ' + MobileTrans."Transaction ID";
                    end;


                    SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileTrans."Transaction ID"), '', true, Priority, false);


                    Response := 'SUCCESS';
                end;
            end
            else begin


                Priority := 241;
                if MobileTrans.Amount > 0 then begin
                    msg := Format(MobileTrans."Transaction Type") + ' of KES ' + Format(MobileTrans.Amount) + ' has failed because you have insufficient balance.';
                    SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileTrans."Transaction ID"), '', true, Priority, false);
                end;
                Response := 'INSUFFICIENT_BAL';

            end;
        end
        else begin
            Error('Account not found');
        end;

    end;


    procedure GetDetailsForSpecificLoanGuaranteed(PhoneNo: Code[20]; LoanEntryNo: Integer) Response: Text
    var
        SkyMobileLoans: Record 52185483;
        Members: Record 52185700;
        SavingsAccounts: Record 52185730;
        LoanType: Record 52185690;
        MobileLoanGuarantors: Record 52185470;
        RemGuar: Integer;
        TotalGuaranteed: Decimal;
        LoaneeDeposits: Decimal;
        MNo: Code[20];
        GMNo: Code[20];
        SavAcc: Record 52185730;
    begin
        PhoneNo := '+' + PhoneNo;
        SkyMobileLoans.Get(LoanEntryNo);


        GMNo := '';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then begin
            GMNo := SavAcc."Member No.";
        end;


        Response := '';
        MobileLoanGuarantors.Reset;
        MobileLoanGuarantors.SetRange("Loan Entry No.", LoanEntryNo);
        //MobileLoanGuarantors.SETRANGE("Guarantor Accepted",MobileLoanGuarantors."Guarantor Accepted"::Pending);
        MobileLoanGuarantors.SetRange("Guarantor Member No.", GMNo);
        if MobileLoanGuarantors.FindFirst then begin

            Response += '<LoanGuaranteed>';
            Response += '<MemberName>' + SkyMobileLoans."Account Name" + '</MemberName>';
            Response += '<LoanName>' + SkyMobileLoans."Loan Name" + '</LoanName>';
            Response += '<Number>' + Format(SkyMobileLoans."Entry No") + '</Number>';
            Response += '<Amount>' + Format(SkyMobileLoans.Amount) + '</Amount>';
            Response += '<Date>' + Format(SkyMobileLoans.Date) + '</Date>';
            Response += '<Mobile>' + Format(SkyMobileLoans."Telephone No") + '</Mobile>';
            Response += '</LoanGuaranteed>';

        end;
    end;


    procedure GetLoanWithGuarantorDetails(LoanEntryNo: Integer) Response: Text
    var
        SkyMobileLoans: Record 52185483;
        Members: Record 52185700;
        SavingsAccounts: Record 52185730;
        LoanType: Record 52185690;
        MobileLoanGuarantors: Record 52185470;
        RemGuar: Integer;
        TotalGuaranteed: Decimal;
        LoaneeDeposits: Decimal;
        MNo: Code[20];
        A_R: Text;
    begin
        SkyMobileLoans.Get(LoanEntryNo);

        Response := '';

        Response += '<Loan>';
        Response += '<EntryCode>' + Format(SkyMobileLoans."Entry No") + '</EntryCode>';
        Response += '<Name>' + SkyMobileLoans."Loan Name" + '</Name>';
        Response += '<Amount>' + Format(SkyMobileLoans.Amount) + '</Amount>';

        MobileLoanGuarantors.Reset;
        MobileLoanGuarantors.SetRange("Loan Entry No.", LoanEntryNo);
        MobileLoanGuarantors.SetFilter("Guarantor Accepted", '<>%1', MobileLoanGuarantors."guarantor accepted"::No);
        //MobileLoanGuarantors.SETRANGE("Guarantor Mobile No.",PhoneNo);
        if MobileLoanGuarantors.FindFirst then begin
            Response += '<Guarantors Current="' + Format(MobileLoanGuarantors.Count) + '" Required="' + Format(SkyMobileLoans."Expected Guarantors") + '">';

            repeat
                A_R := '';
                if MobileLoanGuarantors."Guarantor Accepted" = MobileLoanGuarantors."guarantor accepted"::No then
                    A_R := '(R)';
                if MobileLoanGuarantors."Guarantor Accepted" = MobileLoanGuarantors."guarantor accepted"::Yes then
                    A_R := '(A)';

                Response += '<Guarantor>';
                Response += '<Name>' + MobileLoanGuarantors."Guarantor Name" + ' ' + A_R + '</Name>';
                Response += '<Mobile>' + MobileLoanGuarantors."Guarantor Mobile No." + '</Mobile>';
                Response += '<MemberNumber>' + MobileLoanGuarantors."Guarantor Member No." + '</MemberNumber>';
                Response += '<Accepted>' + Format(MobileLoanGuarantors."Guarantor Accepted") + '</Accepted>';
                Response += '</Guarantor>';

            until MobileLoanGuarantors.Next = 0;
        end
        else
            Response += '<Guarantors Current="' + Format(0) + '" Required="' + Format(SkyMobileLoans."Expected Guarantors") + '">';

        Response += '</Guarantors>';
        Response += '</Loan>';
    end;


    procedure GetLoanAccessSetup(PhoneNo: Code[20]) Response: Text
    var
        MCommission: Decimal;
        MInterest: Decimal;
        LoanProdCharge: Record 52185734;
        MComm: Integer;
        MInt: Decimal;
        LAccount: Code[50];
        SaccoMemberNo: Code[20];
        ContinueMB: Boolean;
        Members: Record 52185700;
        interestGL: Code[10];
        LoansOld: Record 52185729;
        TotalClearedAmount: Decimal;
        SavingsAccounts: Record 52185730;
        LoanProcessingGL: Code[20];
        vendorMboostaCommission: Decimal;
        vendorMboostaCommissionGL: Code[20];
        Loans: Record 52185729;
        ProdFac: Record 52185690;
        OutstandingAmount: Decimal;
        StartDate: array[3] of Date;
        EndDate: array[3] of Date;
        SalBuffer: Record 52185784;
        CurrSal: array[3] of Decimal;
        k: Integer;
        SmallestSal: Decimal;
        Salary: array[3] of Decimal;
        SalDates: array[3] of Date;
        SalaryThroughFosa: Boolean;
        BlaklistStartDate: Date;
        Limit: Decimal;
        LoanedBefore: Boolean;
        LastDate: Date;
        j: Integer;
        MobileLoanGuarantors: Record 52185470;
    begin
        PhoneNo := '+' + PhoneNo;
        Response := '';

        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."Transactional Mobile No", PhoneNo);
        if SavingsAccounts.Find('-') then begin

            Members.Get(SavingsAccounts."Member No.");

            if (Members."Employer Code" = '9901') or (Members."Employer Code" = '9902') then begin
                Response += '<LoansSetup>';
                Response += '<CanAccessLoans>' + 'FALSE' + '</CanAccessLoans>';
                Response += '<AccessMessage>' + 'Sorry, kindly visit your nearest branch or contact us to access loan services' + '</AccessMessage>';

                MobileLoanGuarantors.Reset;
                MobileLoanGuarantors.SetFilter("Guarantor Accepted", '%1', MobileLoanGuarantors."guarantor accepted"::Pending);
                MobileLoanGuarantors.SetRange("Guarantor Member No.", Members."No.");
                MobileLoanGuarantors.SetRange("Loan Status", MobileLoanGuarantors."loan status"::"Pending Guarantors");
                if MobileLoanGuarantors.FindFirst then
                    Response += '<HasPendingGuarantorship>' + 'TRUE' + '</HasPendingGuarantorship>'
                else
                    Response += '<HasPendingGuarantorship>' + 'FALSE' + '</HasPendingGuarantorship>';

                Response += '</LoansSetup>';
            end
            else begin

                Response += '<LoansSetup>';
                Response += '<CanAccessLoans>' + 'TRUE' + '</CanAccessLoans>';
                Response += '<AccessMessage>' + 'Success' + '</AccessMessage>';

                MobileLoanGuarantors.Reset;
                MobileLoanGuarantors.SetFilter("Guarantor Accepted", '%1', MobileLoanGuarantors."guarantor accepted"::Pending);
                MobileLoanGuarantors.SetRange("Guarantor Member No.", Members."No.");
                MobileLoanGuarantors.SetRange("Loan Status", MobileLoanGuarantors."loan status"::"Pending Guarantors");
                if MobileLoanGuarantors.FindFirst then
                    Response += '<HasPendingGuarantorship>' + 'TRUE' + '</HasPendingGuarantorship>'
                else
                    Response += '<HasPendingGuarantorship>' + 'FALSE' + '</HasPendingGuarantorship>';

                Response += '</LoansSetup>';
            end;
        end;
    end;


    procedure GetLoansWithGuarantors(PhoneNo: Code[20]) Response: Text
    var
        MCommission: Decimal;
        MInterest: Decimal;
        LoanProdCharge: Record 52185734;
        MComm: Integer;
        MInt: Decimal;
        LAccount: Code[50];
        SaccoMemberNo: Code[20];
        ContinueMB: Boolean;
        Members: Record 52185700;
        interestGL: Code[10];
        LoansOld: Record 52185729;
        TotalClearedAmount: Decimal;
        SavingsAccounts: Record 52185730;
        LoanProcessingGL: Code[20];
        vendorMboostaCommission: Decimal;
        vendorMboostaCommissionGL: Code[20];
        Loans: Record 52185729;
        ProdFac: Record 52185690;
        OutstandingAmount: Decimal;
        StartDate: array[3] of Date;
        EndDate: array[3] of Date;
        SalBuffer: Record 52185784;
        CurrSal: array[3] of Decimal;
        k: Integer;
        SmallestSal: Decimal;
        Salary: array[3] of Decimal;
        SalDates: array[3] of Date;
        SalaryThroughFosa: Boolean;
        BlaklistStartDate: Date;
        Limit: Decimal;
        LoanedBefore: Boolean;
        LastDate: Date;
        j: Integer;
        MobileLoanGuarantors: Record 52185470;
        SkyMobileLoans: Record 52185483;
    begin
        PhoneNo := '+' + PhoneNo;
        Response := '';

        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."Transactional Mobile No", PhoneNo);
        if SavingsAccounts.Find('-') then begin

            SkyMobileLoans.Reset;
            SkyMobileLoans.SetRange("Account No", SavingsAccounts."No.");
            SkyMobileLoans.SetRange(Status, SkyMobileLoans.Status::"Pending Guarantors");
            if SkyMobileLoans.FindFirst then begin
                Response += '<Loans>';
                repeat

                    Response += '<Loan>';
                    Response += '<EntryCode>' + Format(SkyMobileLoans."Entry No") + '</EntryCode>';
                    Response += '<Name>' + SkyMobileLoans."Loan Name" + '</Name>';
                    Response += '</Loan>';

                until SkyMobileLoans.Next = 0;
                Response += '</Loans>';
            end;

        end;
    end;


    procedure GetLoaneesAwaitingGuarantorship(PhoneNo: Code[20]; Status: Code[20]) Response: Text
    var
        SkyMobileLoans: Record 52185483;
        Members: Record 52185700;
        SavingsAccounts: Record 52185730;
        LoanType: Record 52185690;
        MobileLoanGuarantors: Record 52185470;
        RemGuar: Integer;
        TotalGuaranteed: Decimal;
        LoaneeDeposits: Decimal;
        MNo: Code[20];
        SavAcc: Record 52185730;
    begin
        PhoneNo := '+' + PhoneNo;

        Response := '';



        GMNo := '';
        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then begin
            GMNo := SavAcc."Member No.";
        end;



        MobileLoanGuarantors.Reset;
        if Status = 'ACCEPTED' then
            MobileLoanGuarantors.SetRange("Guarantor Accepted", MobileLoanGuarantors."guarantor accepted"::Yes);
        if Status = 'PENDING' then
            MobileLoanGuarantors.SetRange("Guarantor Accepted", MobileLoanGuarantors."guarantor accepted"::Pending);
        if Status = 'REJECTED' then
            MobileLoanGuarantors.SetRange("Guarantor Accepted", MobileLoanGuarantors."guarantor accepted"::No);
        MobileLoanGuarantors.SetRange("Guarantor Member No.", GMNo);
        MobileLoanGuarantors.SetRange("Loan Status", MobileLoanGuarantors."loan status"::"Pending Guarantors");
        if MobileLoanGuarantors.FindFirst then begin
            Response += '<Loanees>';
            repeat
                SkyMobileLoans.Get(MobileLoanGuarantors."Loan Entry No.");
                Response += '<Loanee Id="' + Format(MobileLoanGuarantors."Loan Entry No.") + '" Name="' + SkyMobileLoans."Account Name" + '"/>';

            until MobileLoanGuarantors.Next = 0;
            Response += '</Loanees>';

        end;
    end;


    procedure ChangeEmailAddress(PhoneNo: Text; Email: Text; PIN: Text) Response: Text[1024]
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52185482;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        SLedger: Record 52185732;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        AccountBookBalance: Decimal;
        AccountAvailableBalance: Decimal;
        AccountToCharge: Code[20];
        Found: Boolean;
        MemberNo: Code[20];
        TransactionDate: DateTime;
        Loans: Record 52185729;
        LoanType: Text;
        BalStmt: Text;
        msg: Text;
        SafcomCharges: Record 52185475;
        SafcomFee: Decimal;
        BalEnqCharge: Decimal;
        SkyEmailUpdateBuffer: Record 52185469;
    begin
        Response := 'ERROR';
        Found := false;


        PhoneNo := '+' + PhoneNo;

        if not CorrectPin(PhoneNo, PIN) then begin
            Response := 'INCORRECT_PIN';
            exit;
        end;


        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then begin
            SkyEmailUpdateBuffer.Init;
            SkyEmailUpdateBuffer."Member No." := SavAcc."Member No.";
            SkyEmailUpdateBuffer.Name := SavAcc.Name;
            SkyEmailUpdateBuffer.Email := Email;
            SkyEmailUpdateBuffer.Insert(true);
            Response := 'SUCCESS';
        end;
    end;


    procedure CheckBeneficiaries(EntryCode: Text[20]; TransactionID: Code[20]; PhoneNo: Code[20]; PIN: Text; Mode: Code[20]; EmailAddress: Text) Response: Text
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52185482;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        SLedger: Record 52185732;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        AccountBookBalance: Decimal;
        AccountAvailableBalance: Decimal;
        AccountToCharge: Code[20];
        Found: Boolean;
        MemberNo: Code[20];
        TransactionDate: DateTime;
        Loans: Record 52185729;
        LoanType: Text;
        BalStmt: Text;
        msg: Text;
        SafcomCharges: Record 52185475;
        SafcomFee: Decimal;
        BalEnqCharge: Decimal;
        NextofKIN: Record 52185701;
        i: Integer;
        First250: Text;
        ExtraSMS: Text;
    begin
        TransactionDate := CurrentDatetime;

        Response := 'ERROR';
        Found := false;


        PhoneNo := '+' + PhoneNo;

        /*
        IF NOT CorrectPin(PhoneNo,PIN) THEN BEGIN
            Response := 'INCORRECT_PIN';
            EXIT;
        END;
        */


        AccountToCharge := '';
        MemberNo := '';

        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then begin
            AccountToCharge := SavAcc."No.";
            MemberNo := SavAcc."Member No.";
            if SavAcc.Blocked <> SavAcc.Blocked::" " then
                exit;
        end;


        if MemberNo = '' then
            exit('Member No. Missing');

        if AccountToCharge = '' then
            exit('Account to charge missing');


        // Get Excise duty G/L
        ExciseDutyGL := GetExciseDutyGL();
        ExciseDutyRate := GetExciseRate();
        ExciseDuty := 0;

        SaccoAccount := '';
        SaccoFee := 0;
        VendorAccount := '';
        VendorCommission := 0;


        SMSAccount := '';
        SMSCharge := 0;

        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Check Beneficiary");
        if CoopSetup.FindFirst then begin

            SMSAccount := CoopSetup."SMS Account";
            SMSCharge := CoopSetup."SMS Charge";


            SaccoAccount := CoopSetup."Sacco Fee Account";
            SaccoFee := CoopSetup."Sacco Fee";
            VendorAccount := CoopSetup."Vendor Commission Account";
            VendorCommission := CoopSetup."Vendor Commission";

            TotalCharge := SaccoFee + VendorCommission + SMSCharge;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
        end
        else begin
            Error('Setup Missing for %1', CoopSetup."transaction type"::"Check Beneficiary");
        end;



        if SavAcc.Get(AccountToCharge) then begin

            ProdFact.Get(SavAcc."Product Type");

            if (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::"Deposits Only") or
                (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::" ") then begin
                Error('The Account to Charge is not a Withdrawable Account');

            end;

            BalEnqCharge := 0;
            AccBal := GetAccountBalance(SavAcc."No.");
            if AccBal >= TotalCharge + ExciseDuty then begin
                BalEnqCharge := TotalCharge + ExciseDuty;
                //BUser.GET(USERID);

                //BUser.TESTFIELD("Cashier Journal Template");
                //BUser.TESTFIELD("Cashier Journal Batch");

                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';

                GenJournalBatch.Reset;
                GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                GenJournalBatch.SetRange(Name, JBatch);
                if not GenJournalBatch.FindFirst then begin
                    GenJournalBatch.Init;
                    GenJournalBatch."Journal Template Name" := JTemplate;
                    GenJournalBatch.Name := JBatch;
                    GenJournalBatch.Description := 'Sky World Batch';
                    GenJournalBatch.Init;
                end;


                MobileTrans.Init;
                MobileTrans."Entry No." := EntryCode;
                MobileTrans."Transaction ID" := TransactionID;
                MobileTrans."Session ID" := TransactionID;
                MobileTrans."Transaction Date" := Dt2Date(TransactionDate);
                MobileTrans."Transaction Time" := Dt2Time(TransactionDate);
                MobileTrans."Member Account" := SavAcc."No.";
                MobileTrans."Transaction Type" := MobileTrans."transaction type"::"Check Beneficiary";
                MobileTrans.Description := Format(MobileTrans."Transaction Type");
                MobileTrans.Insert;


                MobileTrans.Reset;
                MobileTrans.SetRange("Transaction ID", TransactionID);
                MobileTrans.SetRange(Posted, false);
                if MobileTrans.FindFirst then begin

                    DocNo := MobileTrans."Transaction ID";
                    PDate := MobileTrans."Transaction Date";
                    AccNo := MobileTrans."Member Account";
                    ExtDoc := '';
                    LoanNo := '';
                    TransType := Transtype::" ";
                    Dim1 := SavAcc."Global Dimension 1 Code";
                    Dim2 := SavAcc."Global Dimension 2 Code";
                    SystCreated := true;

                    SaccoTrans.InitJournal(JTemplate, JBatch);

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr(MobileTrans.Description, 1, 50), Balacctype::"G/L Account",
                                  '', TotalCharge + ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);
                    /*
      SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                    '',SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
      SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccountToCharge,COPYSTR('SMS Charges ',1,50),BalAccType::"G/L Account",
                    SMSAccount,SMSCharge,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
      SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Excise Duty',1,50),BalAccType::"G/L Account",
                    ExciseDutyGL,ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    */

                    AccNo := VendorAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := Transtype::" ";

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Vendor, AccNo, CopyStr(MobileTrans.Description + ' Commission', 1, 50), Balacctype::"G/L Account",
                                  '', -VendorCommission, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);

                    AccNo := SaccoAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := Transtype::" ";

                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", AccNo, CopyStr(MobileTrans.Description + ' Fee', 1, 50), Balacctype::"G/L Account",
                                  '', -SaccoFee, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);



                    SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", ExciseDutyGL, CopyStr(MobileTrans.Description + ' Excise Duty', 1, 50), Balacctype::"G/L Account",
                                  '', -ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);


                    MobileTrans.Posted := true;
                    MobileTrans."Posted By" := UserId;
                    MobileTrans."Date Posted" := Today;
                    MobileTrans.Modify;

                    SaccoTrans.PostJournal(JTemplate, JBatch);

                end;

            end
            else begin
                Response := 'INSUFFICIENT_BAL';
            end;
        end
        else begin
            Response := 'INVALID_ACCOUNT';
        end;


        if (Response = 'ERROR') then begin

            NextofKIN.Reset;
            NextofKIN.SetRange("Account No", SavAcc."Member No.");
            NextofKIN.SetRange(Beneficiary, true);
            if NextofKIN.FindFirst then begin
                i := 0;
                if Mode = 'EMAIL' then begin
                    Response := '<Beneficiaries>';
                    repeat
                        Response += '<Beneficiary>';
                        Response += '<Name>' + NextofKIN.Name + '</MemberName>';
                        Response += '<Relationship>' + NextofKIN.Relationship + '</Relationship>';
                        Response += '</Beneficiary>';
                    until NextofKIN.Next = 0;
                    Response += '</Beneficiaries>';
                end
                else begin
                    Response := 'SUCCESS';

                    HMember.Get(SavAcc."Member No.");
                    FName := HMember."First Name";
                    if FName = '' then
                        FName := HMember."Second Name";

                    msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your Current Beneficiaries are:  ';

                    repeat
                        i += 1;
                        msg += NewLine + Format(i) + '. ' + NextofKIN.Name;


                    until NextofKIN.Next = 0;
                    msg += '.' + NewLine + 'REF: ' + TransactionID;

                    if StrLen(msg) > 250 then begin
                        First250 := CopyStr(msg, 1, StrPos(msg, '8') - 1);
                        ExtraSMS := CopyStr(msg, StrPos(msg, '8'), StrLen(msg));
                    end;

                    Response := 'SUCCESS';
                    Priority := 231;
                    //PhoneNo:='+254701365086';

                    if StrLen(msg) > 250 then begin
                        SendSms(Source::MBANKING, PhoneNo, First250, MobileTrans."Transaction ID", '', true, Priority, false);
                        SendSms(Source::MBANKING, PhoneNo, ExtraSMS, MobileTrans."Transaction ID", '', true, Priority, false);
                    end else
                        SendSms(Source::MBANKING, PhoneNo, msg, MobileTrans."Transaction ID", '', true, Priority, false);
                end;
            end;



        end;

    end;


    procedure BosaLoanApplication(Account: Text[30]; Amount: Decimal; LoanType: Code[50]; Password: Text; LoanPurpose: Text; Period: Integer) Response: Integer
    var
        MSACCOLoans: Record 52185761;
        Install: Decimal;
        LoanProduct: Code[10];
        ReferenceNo: Text;
        StringSplit: Text;
        SectoralClassification: Record 52186112;
        LoanProd: Text;
        Branch: Text;
        PhoneNo: Text;
        SavingsAccounts: Record 52185730;
        SkyMobileLoans: Record 52185483;
    begin

        /*
        SavingsAccounts.RESET;
        SavingsAccounts.SETRANGE("No.",Account);
        IF SavingsAccounts.FIND('-') THEN BEGIN
            Account:=SavingsAccounts."No.";
        
            Branch:=SavingsAccounts."Global Dimension 2 Code";
            PhoneNo:=SavingsAccounts."Transactional Mobile No";
        
            Install := Period;
        
            IF (LoanProduct<>'119') AND (LoanProduct<>'111') AND (LoanProduct<>'115') AND (LoanProduct<>'124') AND (LoanProduct<>'140')  THEN BEGIN
                IF Install>12 THEN
                      Install:=12;
            END;
        
        
            IF Branch='4' THEN
                  MobileLoan.RESET;
                  MobileLoan.SETRANGE("Account No",Account);
                  MobileLoan.SETRANGE("Loan Code",LoanProduct);
                  MobileLoan.SETRANGE(Posted,FALSE);
                  MobileLoan.SETFILTER(Status,'%1|%2',MobileLoan.Status::Pending,MobileLoan.Status::Appraisal);
                  IF NOT MobileLoan.FIND('-') THEN BEGIN
                    MSACCOLoanApp.INIT;
                    MSACCOLoanApp."Account No":=Account;
                    MSACCOLoanApp.Date:=CURRENTDATETIME;
                    MSACCOLoanApp."Requested Amount":=amount;
                    MSACCOLoanApp.Amount:=amount;
                    MSACCOLoanApp.Posted:=FALSE;
                    MSACCOLoanApp.Status:=MSACCOLoanApp.Status::Pending;
                    MSACCOLoanApp.DocumentNo:=PADSTR(ReferenceNo,20);
                    MSACCOLoanApp.Installment:=Install;
                    MSACCOLoanApp."Loan Code":=LoanProduct;
                    MSACCOLoanApp."Ghris Password":=pass;
                    MSACCOLoanApp.Branch:=Branch;
                    MSACCOLoanApp.VALIDATE(Branch);
        
        
        
                    IF LoanPurpose='1' THEN
                      MSACCOLoanApp."Loan Purpose":='1420'
                    ELSE IF LoanPurpose='2' THEN
                      MSACCOLoanApp."Loan Purpose":='2120'
                    ELSE IF LoanPurpose='3' THEN
                      MSACCOLoanApp."Loan Purpose":='3120'
                    ELSE IF LoanPurpose='4' THEN
                      MSACCOLoanApp."Loan Purpose":='4110'
                    ELSE IF LoanPurpose='5' THEN
                      MSACCOLoanApp."Loan Purpose":='5110'
                    ELSE IF LoanPurpose='6' THEN
                      MSACCOLoanApp."Loan Purpose":='6110'
                    ELSE IF LoanPurpose='7' THEN
                      MSACCOLoanApp."Loan Purpose":='7210'
                    ELSE IF LoanPurpose='8' THEN
                      MSACCOLoanApp."Loan Purpose":='8110';
        
                    //Get Account
                    saccoAccount.GET(Account);
        
                    IF LoanProduct='123' THEN BEGIN
                      MSACCOLoanApp."Loan Product Type":=MSACCOLoanApp."Loan Product Type"::"Salary In Advance";
                      END ELSE IF LoanProduct='119' THEN BEGIN
                        MSACCOLoanApp."Loan Product Type":=MSACCOLoanApp."Loan Product Type"::"Salary Advance";
                      END ELSE IF LoanProduct='136' THEN BEGIN
                        MSACCOLoanApp."Loan Product Type":=MSACCOLoanApp."Loan Product Type"::"Dividend Loan";
                      END ELSE IF LoanProduct='112' THEN BEGIN
                        IF (saccoAccount."Employer Code"<>'05') AND (saccoAccount."Employer Code"<>'99') THEN BEGIN
                        MSACCOLoanApp."Loan Product Type":=MSACCOLoanApp."Loan Product Type"::"Emergency Loan";
                        MSACCOLoanApp."Loan No":=CreateLoanRegister(Account,LoanProduct,amount,TODAY,Install,MSACCOLoanApp."Loan Purpose",Branch);
                        MSACCOLoanApp.Status:=MSACCOLoanApp.Status::Appraisal;
                        END;
                        MSACCOLoanApp."Loan Product Type":=MSACCOLoanApp."Loan Product Type"::"Emergency Loan";
                      END ELSE IF LoanProduct='113' THEN BEGIN
                        MSACCOLoanApp."Loan Product Type":=MSACCOLoanApp."Loan Product Type"::"School Fees Loan";
                        IF (saccoAccount."Employer Code"<>'05') AND (saccoAccount."Employer Code"<>'99') THEN BEGIN
                        MSACCOLoanApp."Loan Product Type":=MSACCOLoanApp."Loan Product Type"::"School Fees Loan";
                        MSACCOLoanApp."Loan No":=CreateLoanRegister(Account,LoanProduct,amount,TODAY,Install,MSACCOLoanApp."Loan Purpose",Branch);
                        MSACCOLoanApp.Status:=MSACCOLoanApp.Status::Appraisal;
                        END;
                      END ELSE IF (LoanProduct='111') OR (LoanProduct='115') OR (LoanProduct='124')OR (LoanProduct='140') THEN BEGIN
                        MSACCOLoanApp."Loan Product Type":=MSACCOLoanApp."Loan Product Type"::"Other Loans";
                        MSACCOLoanApp."Loan No":=CreateLoanRegister(Account,LoanProduct,amount,TODAY,Install,MSACCOLoanApp."Loan Purpose",Branch);
                        MSACCOLoanApp.Status:=MSACCOLoanApp.Status::Appraisal;
                      END ELSE IF (LoanProduct='120') OR (LoanProduct='121')  THEN BEGIN
                        MSACCOLoanApp."Loan Product Type":=MSACCOLoanApp."Loan Product Type"::"Other Loans";
                      END ELSE BEGIN
                          MSACCOLoanApp."Loan Product Type":=MSACCOLoanApp."Loan Product Type"::"Instant Loan";
                      END;
                    MSACCOLoanApp.INSERT;
                    Response:=0;
        
        
                END;
            END;
        END ELSE BEGIN
              Response:=1;
        END;
        */

    end;

    local procedure CreateLoanRegister(var MobileLoan: Record 52185483) LoanNoEm: Code[20]
    var
        LoansApp: Record 52185729;
        SavingsAccounts: Record 52185730;
        MembNoSeries: Record 52185688;
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        LoanNo: Code[20];
        Loans: Record 52185729;
        AccNo: Code[20];
        LoanCode: Code[20];
        RequestedAmount: Decimal;
        ApplicationDate: Date;
        Install: Integer;
        LoanPurpose: Code[10];
        Dim: Code[10];
        ProductFactory: Record 52185690;
        Dim1: Code[50];
        Dim2: Code[50];
        UserSetup: Record "User Setup";
    begin
        if SavingsAccounts.Get(MobileLoan."Account No") then begin

            LoanCode := MobileLoan."Loan Product Type";
            LoanNo := '';

            if LoanCode = '112' then begin
                MembNoSeries.Get;
                MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                // NoSeriesMgt.InitSeries(MembNoSeries."Loan No EM", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
            end
            else
                if LoanCode = '111' then begin
                    MembNoSeries.Get;
                    MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                    // NoSeriesMgt.InitSeries(MembNoSeries."Loan No DEV", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
                end
                else
                    if (LoanCode = '115') or (LoanCode = '124') then begin
                        MembNoSeries.Get;
                        MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                        // NoSeriesMgt.InitSeries(MembNoSeries."Loan No JS", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
                    end
                    else
                        if (LoanCode = '140') then begin
                            MembNoSeries.Get;
                            MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                            // NoSeriesMgt.InitSeries(MembNoSeries."Loan No Inuka", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
                        end
                        else
                            if (LoanCode = '143') then begin
                                //MembNoSeries.GET;
                                //MembNoSeries.TESTFIELD(MembNoSeries."Loan Nos.");
                                // NoSeriesMgt.InitSeries('INK72LN', Loans."No. Series", 0D, LoanNo, Loans."No. Series");
                            end
                            else begin
                                MembNoSeries.Get;
                                MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                                // NoSeriesMgt.InitSeries(MembNoSeries."Loan No SF", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
                            end;

            ProductFactory.Get(MobileLoan."Loan Product Type");


            Dim2 := MobileLoan.Branch;

            UserSetup.Reset;
            UserSetup.SetRange("User ID", UserId);
            if UserSetup.FindFirst then begin
                if Dim2 = '' then
                    Dim2 := UserSetup."Global Dimension 2 Code";
                Dim1 := UserSetup."Global Dimension 1 Code";
            end;

            Loans.Init;
            Loans."Loan No." := LoanNo;
            Loans."Member No." := SavingsAccounts."Member No.";
            Loans."Application Date" := Today;
            //Loans.VALIDATE("Member No.");
            Loans."Loan Product Type" := MobileLoan."Loan Product Type";
            //Loans.VALIDATE("Loan Product Type");
            Loans."Requested Amount" := MobileLoan."Requested Amount";
            Loans."Picked Mobile Loan" := true;
            Loans."Mobile Loan" := true;
            Loans.Installments := MobileLoan."Loan Period";
            //Loans."Sub Sector Level2":=MobileLoan."Loan Purpose";

            Loans.Validate("Sub Sector Level2", MobileLoan."Loan Purpose");
            Loans."Global Dimension 2 Code" := Dim2;
            Loans."Global Dimension 1 Code" := Dim1;
            //Loans.VALIDATE(Loans."Global Dimension 2 Code");
            Loans.Insert;
            //LoanNoEm:=LoanNo;
            MobileLoan."Loan No." := Loans."Loan No.";
            MobileLoan.Modify;

            CreateGuarantors(Loans."Loan No.", MobileLoan."Entry No");
            //ERROR('AZIZ');

        end;
    end;


    procedure PostBosaLoans()
    var
        MCommission: Decimal;
        MInterest: Decimal;
        LoanProdCharge: Record 52185734;
        MComm: Integer;
        MInt: Decimal;
        LAccount: Code[50];
        SaccoMemberNo: Code[20];
        ContinueMB: Boolean;
        NoOfGuarantors: Integer;
        OutstandingLoans: Record 52185729;
        outstandingPrinciple: Decimal;
        outstandingInterest: Decimal;
        loanCounter: Integer;
        InstallM: Integer;
        LoansProcess: Codeunit "Loans Process";
        MembNoSeries: Record 52185688;
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        "LNo.": Code[20];
        BalAcc: Code[20];
        ActivateDor: Boolean;
        SavingsAccounts1: Record 52185730;
        AcctNo: Code[20];
        DepAcc: Record 52185730;
        Temp: Record 52185782;
        Jtemplate: Code[20];
        JBatch: Code[20];
        EndMonth: Date;
        BatchLines: Record 52185737;
        CustomerRecord: Record 52185700;
        TopUp: Record 52185742;
        NetTopup: Decimal;
        GenBatch: Record "Gen. Journal Batch";
        TCharges: Decimal;
        LineNo: Integer;
        PaySched: Record 52185735;
        PCharges: Record 52185734;
        TotalComputedCharges: Decimal;
        TotalCleared: Decimal;
        OtherComms: Decimal;
        OtherCommitments: Record 52185743;
        Difference: Decimal;
        TotalSched: Decimal;
        RemainingDays: Integer;
        TMonthDays: Integer;
        GenJournalLine: Record "Gen. Journal Line";
        Batches: Record 52185736;
        TotOffset: Decimal;
        JournalPosting: Codeunit "Journal Posting";
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        AccNo: Code[20];
        BalAccNo: Code[20];
        Amt: Decimal;
        LoanProcess: Codeunit "Loans Process";
        ProdFac: Record 52185690;
        Loans2: Record 52185729;
        Descr: Text;
        GenSetup: Record 52185689;
        Members: Record 52185700;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        JournalPostingSucc: Codeunit "Journal Post Successful";
        Post: Boolean;
        FirstLoop: Integer;
        NewContr: Decimal;
        DaysPast: Integer;
        ChargeExtraComms: Boolean;
        Cust: Record Customer;
        ExcemptCharges: Boolean;
        TariffDetails: Record 52185777;
        GLEntry: Record "G/L Entry";
        TransactionCharges: Record 52185774;
        TransactionTypes: Record 52185773;
        AssetFinanceLoan: Record 52186143;
        AssetFinComms: Decimal;
        TotalAssetFin: Decimal;
        NetToVendor: Decimal;
        TaxAmnt: Decimal;
        SaccoIncome: Decimal;
        SavingsAccounts: Record 52185730;
        MobileLoan: Record 52185483;
        Loans: Record 52185729;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        ExtDoc: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        DocNo: Code[20];
        PDate: Date;
        LoanProduct: Record 52185690;
        SystCreated: Boolean;
        SavAcc: Record 52185730;
        VendorCommission: Decimal;
        VendorAccount: Code[20];
        BridgLoan: Decimal;
        LoanApp: Record 52185729;
        TopUPGL: Code[20];
        "Topup%": Decimal;
        BLoanNo: Code[20];
        BLoanRec: Record 52185729;
        msg: Text;
        OldLoan: Record 52185729;
    begin


        MobileLoan.Reset;
        MobileLoan.SetRange(MobileLoan.Posted, false);
        MobileLoan.SetRange(MobileLoan.Status, MobileLoan.Status::Appraisal);
        MobileLoan.SetRange(Source, 'BOSA');
        MobileLoan.SetFilter("Loan No.", '<>%1', '');
        if MobileLoan.Find('-') then begin
            repeat


                Loans.Reset;
                Loans.SetRange("Loan No.", MobileLoan."Loan No.");
                Loans.SetRange(Status, Loans.Status::Approved);
                Loans.SetRange(Posted, false);
                Loans.SetFilter("Approved Amount", '>0');
                if Loans.Find('-') then begin
                    TopUp.Reset;
                    TopUp.SetRange(TopUp."Loan No.", Loans."Loan No.");
                    if TopUp.Find('-') then begin
                        repeat
                            if TopUp."Principle Top Up" = 0 then begin
                                Loans.Status := Loans.Status::Open;
                                Loans.Remarks := 'Top Up Details Missing';
                                Loans.Modify;
                                exit;
                            end;
                        until TopUp.Next = 0;
                    end;
                    if OldLoan.Get(TopUp."Loan Top Up") then begin
                        OldLoan.CalcFields("Outstanding Balance", "Outstanding Interest");
                        if (OldLoan."Outstanding Balance" <= 0) and (OldLoan."Outstanding Interest" <= 0) then begin
                            TopUp.Delete;
                            exit;
                        end;
                    end;
                end;


                Loans.Reset;
                Loans.SetRange("Loan No.", MobileLoan."Loan No.");
                Loans.SetRange(Status, Loans.Status::Approved);
                Loans.SetRange(Posted, false);
                Loans.SetFilter("Approved Amount", '>0');
                if Loans.Find('-') then begin


                    EndMonth := CalcDate('CM', Today);
                    RemainingDays := (EndMonth - Today) + 1;
                    TMonthDays := Date2dmy(EndMonth, 1);
                    //PRORATED DAYS


                    Jtemplate := 'RECEIPT';
                    JBatch := 'SKYWORLD';

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                    GenJournalLine.SetRange("Journal Batch Name", JBatch);
                    GenJournalLine.DeleteAll;

                    GenSetup.Get;
                    if CustomerRecord.Get(Loans."Member No.") then begin

                        if Loans.Status <> Loans.Status::Approved then
                            Error('Loan status must be Approved for you to post Loan. - ' + Loans."Loan No.");


                        ///RunningDate:=Batches."Posting Date";

                        //Generate and post Approved Loan Amount
                        if not GenBatch.Get(Jtemplate, JBatch) then begin
                            GenBatch.Init;
                            GenBatch."Journal Template Name" := Jtemplate;
                            GenBatch.Name := JBatch;
                            GenBatch.Insert;
                        end;
                        DocNo := Loans."Loan No.";
                        PDate := Today;
                        if Loans."Global Dimension 2 Code" = '' then
                            Loans."Global Dimension 2 Code" := MobileLoan.Branch;

                        Dim1 := Loans."Global Dimension 1 Code";
                        Dim2 := Loans."Global Dimension 2 Code";


                        LoanProduct.Get(Loans."Loan Product Type");
                        SystCreated := true;


                        SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, Accttype::Credit, Loans."Loan Account", CopyStr(LoanProduct."Product Description" + ' Disbursement', 1, 50), Balacctype::"G/L Account",
                                      '', Loans."Amount To Disburse", ExtDoc, Loans."Loan No.", Transtype::Loan, Dim1, Dim2, SystCreated);


                        SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, Accttype::Savings, Loans."Disbursement Account No", CopyStr(LoanProduct."Product Description" + ' Disbursement', 1, 50), Balacctype::"G/L Account",
                                      '', -Loans."Amount To Disburse", ExtDoc, Loans."Loan No.", Transtype::Loan, Dim1, Dim2, SystCreated);




                        //Added
                        //Auto Activate Dormant On Loan Posting
                        SavAcc.Reset;
                        SavAcc.SetRange("No.", Loans."Disbursement Account No");
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
                                            SavAcc."Status Change Reason" := 'Auto Activated on Loan Posting';
                                            SavAcc.Modify;
                                        end;

                                        AcctType := Accttype::"G/L Account";
                                        AccNo := TransactionCharges."G/L Account";
                                        TransType := Transtype::" ";
                                        if Loans."All Posting through Savings Ac" = true then begin
                                            BalAccType := Balacctype::Savings;
                                            BalAccNo := Loans."Disbursement Account No";
                                        end else begin
                                            BalAccType := Balacctype::"G/L Account";
                                            BalAccNo := '';
                                        end;

                                        Amt := TransactionCharges."Charge Amount" * -1;



                                        SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr(TransactionCharges.Description + Loans."Disbursement Account No", 1, 50),
                                            BalAccType, BalAccNo, Amt, ExtDoc, Loans."Loan No.", Transtype::Loan, Dim1, Dim2, SystCreated);


                                        //If excise duty involved
                                        if TransactionCharges."Recover Excise Duty" = true then begin
                                            GenSetup.TestField("Excise Duty G/L");
                                            GenSetup.TestField("Excise Duty (%)");
                                            LineNo := LineNo + 10000;
                                            AcctType := Accttype::"G/L Account";
                                            AccNo := GenSetup."Excise Duty G/L";
                                            TransType := Transtype::" ";
                                            BalAccType := Balacctype::Savings;
                                            BalAccNo := Loans."Disbursement Account No";
                                            Amt := Amt * GenSetup."Excise Duty (%)" * 0.01;


                                            SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr(TransactionCharges.Description + Loans."Disbursement Account No" + '-Excise Duty', 1, 50),
                                                BalAccType, BalAccNo, Amt, ExtDoc, Loans."Loan No.", Transtype::Loan, Dim1, Dim2, SystCreated);
                                        end;
                                    until TransactionCharges.Next = 0;
                                end;
                            end;
                        end;
                        //End Auto Activate Dormant On Loan Posting




                        ///-----Shares Purchase **Start
                        //Deposit/share purchase
                        if Loans."Loans - Deposit Purchase" > 0 then begin

                            //debit savings
                            LineNo := LineNo + 10000;
                            AcctType := Accttype::Savings;
                            AccNo := Loans."Disbursement Account No";
                            TransType := Transtype::" ";
                            BalAccType := Balacctype::"G/L Account";
                            BalAccNo := '';
                            Amt := Loans."Loans - Deposit Purchase";

                            SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr('Deposit Purchase', 1, 50),
                                BalAccType, BalAccNo, Amt, ExtDoc, Loans."Loan No.", TransType, Dim1, Dim2, SystCreated);


                            //Credit deposits
                            AccNo := '';
                            DepAcc.Reset;
                            DepAcc.SetRange("Member No.", Loans."Member No.");
                            DepAcc.SetRange("Product Category", DepAcc."product category"::"Deposit Contribution");
                            if DepAcc.Find('-') then
                                AccNo := DepAcc."No."
                            else
                                Error('Member %1 Does not have a deposit Account', Loans."Member No.");


                            LineNo := LineNo + 10000;
                            AcctType := Accttype::Savings;
                            TransType := Transtype::" ";
                            BalAccType := Balacctype::"G/L Account";
                            BalAccNo := '';
                            Amt := Loans."Loans - Deposit Purchase";

                            SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr('Share Boost', 1, 50),
                                BalAccType, BalAccNo, -Amt, ExtDoc, Loans."Loan No.", TransType, Dim1, Dim2, SystCreated);



                            ///Advice ShareBoost
                            DepAcc.Reset;
                            DepAcc.SetRange("Member No.", Loans."Member No.");
                            DepAcc.SetRange("Product Category", DepAcc."product category"::"Deposit Contribution");
                            if DepAcc.Find('-') then
                                LoansProcess.AdviceShares(DepAcc, Loans."Loans - Deposit Purchase", DepAcc."Monthly Contribution");




                            PCharges.Reset;
                            PCharges.SetRange(PCharges."Product Code", Loans."Loan Product Type");
                            PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::Boosting);
                            if PCharges.Find('-') then begin
                                repeat
                                    LineNo := LineNo + 10000;
                                    AcctType := Accttype::"G/L Account";
                                    AccNo := PCharges."Charges G_L Account";
                                    TransType := Transtype::" ";
                                    BalAccType := Balacctype::Savings;
                                    BalAccNo := Loans."Disbursement Account No";
                                    if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                        Amt := (Loans."Loans - Deposit Purchase" * (PCharges.Percentage / 100))
                                    else
                                        if PCharges."Charge Method" = PCharges."charge method"::"Flat Amount" then
                                            Amt := PCharges."Charge Amount"
                                        else
                                            if PCharges."Charge Method" = PCharges."charge method"::Staggered then begin
                                                PCharges.TestField(PCharges."Staggered Charge Code");

                                                TariffDetails.Reset;
                                                TariffDetails.SetRange(TariffDetails.Code, PCharges."Staggered Charge Code");
                                                if TariffDetails.Find('-') then begin
                                                    repeat
                                                        if (Loans."Loans - Deposit Purchase" >= TariffDetails."Lower Limit") and (Loans."Loans - Deposit Purchase" <= TariffDetails."Upper Limit") then begin
                                                            if TariffDetails."Use Percentage" = true then begin
                                                                Amt := Loans."Loans - Deposit Purchase" * TariffDetails.Percentage * 0.01;
                                                            end
                                                            else begin
                                                                Amt := TariffDetails."Charge Amount";
                                                            end;
                                                        end;
                                                    until TariffDetails.Next = 0;
                                                end;
                                            end;


                                    if Amt < PCharges.Minimum then
                                        Amt := PCharges.Minimum;
                                    if Amt > PCharges.Maximum then
                                        Amt := PCharges.Maximum;

                                    Amt := Amt * -1;


                                    SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr(PCharges."Charge Description", 1, 50),
                                        BalAccType, BalAccNo, Amt, ExtDoc, Loans."Loan No.", Transtype::Loan, Dim1, Dim2, SystCreated);

                                    //If excise duty involved
                                    if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin
                                        GenSetup.TestField("Excise Duty G/L");
                                        GenSetup.TestField("Excise Duty (%)");
                                        LineNo := LineNo + 10000;
                                        AcctType := Accttype::"G/L Account";
                                        AccNo := GenSetup."Excise Duty G/L";
                                        TransType := Transtype::" ";
                                        BalAccType := Balacctype::Savings;
                                        BalAccNo := Loans."Disbursement Account No";
                                        Amt := Amt * GenSetup."Excise Duty (%)" * 0.01;


                                        SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr(PCharges."Charge Description" + '- Excise Duty', 1, 50),
                                            BalAccType, BalAccNo, Amt, ExtDoc, Loans."Loan No.", Transtype::Loan, Dim1, Dim2, SystCreated);
                                    end;


                                until PCharges.Next = 0;
                            end;


                        end;
                        ///-----Shares Purchase **End






                        PCharges.Reset;
                        PCharges.SetRange(PCharges."Product Code", Loans."Loan Product Type");
                        PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::General);
                        if PCharges.Find('-') then begin
                            repeat
                                LineNo := LineNo + 10000;
                                AcctType := Accttype::"G/L Account";
                                AccNo := PCharges."Charges G_L Account";
                                TransType := Transtype::" ";
                                BalAccType := Balacctype::Savings;
                                BalAccNo := Loans."Disbursement Account No";
                                if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                    Amt := (Loans."Approved Amount" * (PCharges.Percentage / 100))
                                else
                                    if PCharges."Charge Method" = PCharges."charge method"::"Flat Amount" then
                                        Amt := PCharges."Charge Amount"
                                    else
                                        if PCharges."Charge Method" = PCharges."charge method"::Staggered then begin
                                            PCharges.TestField(PCharges."Staggered Charge Code");

                                            TariffDetails.Reset;
                                            TariffDetails.SetRange(TariffDetails.Code, PCharges."Staggered Charge Code");
                                            if TariffDetails.Find('-') then begin
                                                repeat
                                                    if (Loans."Approved Amount" >= TariffDetails."Lower Limit") and (Loans."Approved Amount" <= TariffDetails."Upper Limit") then begin
                                                        if TariffDetails."Use Percentage" = true then begin
                                                            Amt := Loans."Approved Amount" * TariffDetails.Percentage * 0.01;
                                                        end
                                                        else begin
                                                            Amt := TariffDetails."Charge Amount";
                                                        end;
                                                    end;
                                                until TariffDetails.Next = 0;
                                            end;
                                        end;


                                if Amt < PCharges.Minimum then
                                    Amt := PCharges.Minimum;
                                if Amt > PCharges.Maximum then
                                    Amt := PCharges.Maximum;

                                Amt := Amt * -1;


                                SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr(PCharges."Charge Description", 1, 50),
                                    BalAccType, BalAccNo, Amt, ExtDoc, Loans."Loan No.", Transtype::Loan, Dim1, Dim2, SystCreated);

                                //If excise duty involved
                                if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin
                                    GenSetup.TestField("Excise Duty G/L");
                                    GenSetup.TestField("Excise Duty (%)");
                                    LineNo := LineNo + 10000;
                                    AcctType := Accttype::"G/L Account";
                                    AccNo := GenSetup."Excise Duty G/L";
                                    TransType := Transtype::" ";
                                    BalAccType := Balacctype::Savings;
                                    BalAccNo := Loans."Disbursement Account No";
                                    Amt := Amt * GenSetup."Excise Duty (%)" * 0.01;


                                    SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr(PCharges."Charge Description" + '- Excise Duty', 1, 50),
                                        BalAccType, BalAccNo, Amt, ExtDoc, Loans."Loan No.", Transtype::Loan, Dim1, Dim2, SystCreated);
                                end;


                            until PCharges.Next = 0;
                        end;


                        VendorAccount := '';
                        VendorCommission := CoopSetup."Vendor Commission";
                        if Loans."Picked Mobile Loan" = true then begin


                            CoopSetup.Reset;
                            CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Loan Disbursement");
                            if CoopSetup.FindFirst then begin
                                VendorAccount := CoopSetup."Vendor Commission Account";
                                VendorCommission := CoopSetup."Vendor Commission";


                                SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, Accttype::Vendor, VendorAccount, CopyStr('Fee on ' + LoanProduct."Product Description" + ' Disbursement', 1, 50),
                                    Balacctype::"G/L Account", '', -VendorCommission, ExtDoc, Loans."Loan No.", Transtype::" ", Dim1, Dim2, SystCreated);

                                SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, Accttype::Savings, Loans."Disbursement Account No", CopyStr('Fee on ' + LoanProduct."Product Description" + ' Disbursement', 1, 50),
                                    Balacctype::"G/L Account", '', VendorCommission, ExtDoc, Loans."Loan No.", Transtype::" ", Dim1, Dim2, SystCreated);

                            end;

                            TotalCleared := 0;
                            BridgLoan := 0;


                            TopUp.Reset;
                            TopUp.SetRange(TopUp."Loan No.", Loans."Loan No.");
                            if TopUp.Find('-') then begin
                                repeat
                                    TopUp.Validate(TopUp."Loan Top Up");

                                    //Loan repayment
                                    TotalCleared := TotalCleared + TopUp."Principle Top Up" + TopUp."Interest Top Up";

                                    LineNo := LineNo + 10000;
                                    AcctType := Accttype::Credit;
                                    AccNo := TopUp."Loan Account";
                                    TransType := Transtype::Repayment;
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    Amt := TopUp."Principle Top Up" * -1;


                                    SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr('Top up Principal' + Loans."Loan No.", 1, 50),
                                        BalAccType, BalAccNo, Amt, ExtDoc, TopUp."Loan Top Up", TransType, Dim1, Dim2, SystCreated);


                                    //Clear bills
                                    if LoanApp.Get(TopUp."Loan Top Up") then begin
                                        if ProdFac.Get(LoanApp."Loan Product Type") then begin
                                            LineNo := LineNo + 10000;
                                            AcctType := Accttype::Credit;
                                            AccNo := TopUp."Loan Account";
                                            TransType := Transtype::Bills;
                                            BalAccType := Balacctype::"G/L Account";
                                            BalAccNo := ProdFac."Billed Account";
                                            Amt := TopUp."Outstanding Bill" * -1;



                                            SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr('Bill Balance' + Loans."Loan No.", 1, 50),
                                                BalAccType, BalAccNo, Amt, ExtDoc, TopUp."Loan Top Up", TransType, Dim1, Dim2, SystCreated);
                                        end;
                                    end;

                                    //Interest
                                    LineNo := LineNo + 10000;
                                    AcctType := Accttype::Credit;
                                    AccNo := TopUp."Loan Account";
                                    TransType := Transtype::"Interest Paid";
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    Amt := (TopUp."Interest Top Up" + TopUp."Untransfered Interest") * -1;


                                    SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr('Top up Interest' + Loans."Loan No.", 1, 50),
                                        BalAccType, BalAccNo, Amt, ExtDoc, TopUp."Loan Top Up", TransType, Dim1, Dim2, SystCreated);


                                    //Top Up charges

                                    //****

                                    ///ad
                                    //Top Up charges
                                    TopUPGL := '';
                                    "Topup%" := 0;
                                    PCharges.Reset;
                                    PCharges.SetRange(PCharges."Product Code", Loans."Loan Product Type");
                                    PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"Top up");
                                    if PCharges.Find('-') then begin
                                        repeat
                                            PCharges.TestField(PCharges."Charges G_L Account");

                                            LineNo := LineNo + 10000;
                                            AcctType := Accttype::"G/L Account";
                                            AccNo := PCharges."Charges G_L Account";
                                            TopUPGL := PCharges."Charges G_L Account";
                                            "Topup%" := PCharges.Percentage;
                                            TransType := Transtype::" ";
                                            // BalAccType:=BalAccType::Savings;
                                            // BalAccNo :=Loans."Disbursement Account No";//Commented on 06.05.2021
                                            if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") and (PCharges."Charging Option" = PCharges."charging option"::"On Approved Amount") then begin
                                                if ChargeExtraComms = true then
                                                    Amt := (Loans."Approved Amount" * (PCharges.Percentage + PCharges."Additional Charge %") / 100)
                                                else
                                                    Amt := (Loans."Approved Amount" * (PCharges.Percentage / 100));
                                            end
                                            else
                                                if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") and (PCharges."Charging Option" = PCharges."charging option"::"On Net Amount") then begin
                                                    if ChargeExtraComms = true then
                                                        Amt := ((TopUp."Principle Top Up" + TopUp."Interest Top Up") * (PCharges.Percentage + PCharges."Additional Charge %") / 100)
                                                    else
                                                        Amt := ((TopUp."Principle Top Up" + TopUp."Interest Top Up") * (PCharges.Percentage / 100))
                                                end else
                                                    Amt := PCharges."Charge Amount";

                                            if Amt > 0 then begin
                                                if Amt < PCharges.Minimum then
                                                    Amt := PCharges.Minimum;

                                                if Amt > PCharges.Maximum then
                                                    Amt := PCharges.Maximum;
                                            end;
                                            Amt := Amt * -1;
                                            if ExcemptCharges = true then
                                                Amt := 0;
                                            //Added 06.05.2021
                                            BridgLoan += (Amt * -1);

                                        until PCharges.Next = 0;
                                    end;
                                until TopUp.Next = 0;
                            end;

                            //Balancing entry if disbursed via Savings
                            //IF Loans."All Posting through Savings Ac"=TRUE THEN BEGIN
                            if TotalCleared > 0 then begin
                                LineNo := LineNo + 10000;
                                AcctType := Accttype::Savings;
                                AccNo := Loans."Disbursement Account No";
                                TransType := Transtype::" ";
                                BalAccType := Balacctype::"G/L Account";
                                BalAccNo := '';

                                SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr('Total Loan Offset-' + Loans."Loan Product Type Name" + '-' + Loans."Loan No.", 1, 50),
                                    BalAccType, BalAccNo, TotalCleared, ExtDoc, Loans."Loan No.", TransType, Dim1, Dim2, SystCreated);
                            end;


                            //GL
                            //Added 06.05.2021
                            if BridgLoan > 0 then begin
                                if BridgLoan > 50000 then
                                    BridgLoan := 50000;


                                LineNo := LineNo + 10000;
                                AcctType := Accttype::Savings;
                                AccNo := Loans."Disbursement Account No";
                                TransType := Transtype::" ";
                                BalAccType := Balacctype::"G/L Account";
                                BalAccNo := '';



                                SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, Accttype::"G/L Account", TopUPGL, CopyStr(PCharges."Charge Description", 1, 50),
                                    BalAccType, BalAccNo, -BridgLoan, ExtDoc, Loans."Loan No.", TransType, Dim1, Dim2, SystCreated);

                                BLoanNo := LoansProcess.CreateBridgingLoan(Loans."Member No.", TotalCleared);
                                if BLoanNo <> '' then begin
                                    if BLoanRec.Get(BLoanNo) then begin

                                        AcctType := Accttype::Credit;
                                        AccNo := BLoanRec."Loan Account";
                                        TransType := Transtype::Loan;
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := '';

                                        LineNo := LineNo + 10001;
                                        Descr := BLoanRec."Loan Product Type Name";

                                        //Approved amount
                                        if BLoanRec."Approved Amount" > 0 then begin

                                            SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr(Descr, 1, 50),
                                                BalAccType, BalAccNo, TotalCleared, ExtDoc, BLoanRec."Loan No.", TransType, Dim1, Dim2, SystCreated);


                                            //TotalTopUpCharges += BLoanRec."Approved Amount";

                                            BLoanRec.Posted := true;
                                            BLoanRec.Modify;
                                            //Bridging Loan Recovery

                                            Members.Get(BLoanRec."Member No.");
                                            /*IF MemberCat.GET(Members."Member Category") THEN
                                            BEGIN*/
                                            //MESSAGE(MemberCat."No.");
                                            //ERROR(FORMAT(BLoanRec."Approved Amount"));
                                            //IF MemberCat."Recover Fully on Bridging"=TRUE THEN BEGIN
                                            LineNo := LineNo + 10001;
                                            Descr := BLoanRec."Loan Product Type Name" + '- Repayment';

                                            SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, Accttype::Credit, BLoanRec."Loan Account", CopyStr(Descr, 1, 50),
                                                BalAccType, BalAccNo, TotalCleared * -1, ExtDoc, BLoanRec."Loan No.", TransType, Dim1, Dim2, SystCreated);

                                            //Debit Fosa

                                            LineNo := LineNo + 10001;
                                            Descr := BLoanRec."Loan Product Type Name" + '-Interest Paid';
                                            SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, Accttype::Savings, Loans."Disbursement Account No", CopyStr(Descr, 1, 50),
                                                BalAccType, '', BridgLoan * 1, ExtDoc, BLoanRec."Loan No.", TransType, Dim1, Dim2, SystCreated);


                                            //Interest Due
                                            LineNo := LineNo + 10000;
                                            Descr := BLoanRec."Loan Product Type Name" + '- Interest Due';
                                            TransType := Transtype::"Interest Due";

                                            SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, Accttype::Credit, BLoanRec."Loan Account", CopyStr(Descr, 1, 50),
                                                BalAccType, BalAccNo, BridgLoan, ExtDoc, BLoanRec."Loan No.", TransType, Dim1, Dim2, SystCreated);

                                            //Interest Paid
                                            LineNo := LineNo + 10000;
                                            Descr := BLoanRec."Loan Product Type Name" + '- Interest Paid';
                                            TransType := Transtype::"Interest Paid";

                                            SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, Accttype::Credit, BLoanRec."Loan Account", CopyStr(Descr, 1, 50),
                                                BalAccType, BalAccNo, BridgLoan * -1, ExtDoc, BLoanRec."Loan No.", TransType, Dim1, Dim2, SystCreated);


                                        end;
                                    end;
                                end;

                            end;

                            ///ad
                            //****

                            OtherComms := 0;
                            //Clearing external debts
                            OtherCommitments.Reset;
                            OtherCommitments.SetRange(OtherCommitments."Loan No.", Loans."Loan No.");
                            if OtherCommitments.Find('-') then begin
                                repeat
                                    Temp.Get(UserId);
                                    Temp.TestField(Temp."Bankers Cheque Account");

                                    TotalCleared := TotalCleared + TopUp."Principle Top Up" + TopUp."Interest Top Up";
                                    LineNo := LineNo + 10000;
                                    AcctType := Accttype::"Bank Account";
                                    AccNo := Temp."Bankers Cheque Account";
                                    TransType := Transtype::" ";
                                    if Loans."All Posting through Savings Ac" = true then begin
                                        BalAccType := Balacctype::Savings;
                                        BalAccNo := Loans."Disbursement Account No";
                                    end else begin
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := '';
                                    end;


                                    SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr('External Loan Cleared', 1, 50),
                                        BalAccType, BalAccNo, OtherCommitments.Amount * -1, ExtDoc, Loans."Loan No.", TransType, Dim1, Dim2, SystCreated);


                                    PCharges.Reset;
                                    PCharges.SetRange(PCharges."Product Code", Loans."Loan Product Type");
                                    PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"External Loan");
                                    if PCharges.Find('-') then begin
                                        repeat
                                            PCharges.TestField(PCharges."Charges G_L Account");

                                            LineNo := LineNo + 10000;
                                            AcctType := Accttype::"G/L Account";
                                            AccNo := PCharges."Charges G_L Account";
                                            TransType := Transtype::" ";
                                            if Loans."All Posting through Savings Ac" = true then begin
                                                BalAccType := Balacctype::Savings;
                                                BalAccNo := Loans."Disbursement Account No";
                                            end
                                            else begin
                                                BalAccType := Balacctype::"G/L Account";
                                                BalAccNo := '';
                                            end;

                                            if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                                Amt := (OtherCommitments.Amount * (PCharges.Percentage / 100))
                                            else
                                                Amt := PCharges."Charge Amount";

                                            if Amt < PCharges.Minimum then
                                                Amt := PCharges.Minimum;

                                            if Amt > PCharges.Maximum then
                                                Amt := PCharges.Maximum;

                                            Amt := Amt * -1;


                                            SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr(PCharges."Charge Description", 1, 50),
                                                BalAccType, BalAccNo, Amt, ExtDoc, Loans."Loan No.", Transtype::Loan, Dim1, Dim2, SystCreated);


                                            if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin
                                                GenSetup.TestField("Excise Duty G/L");
                                                GenSetup.TestField("Excise Duty (%)");
                                                LineNo := LineNo + 10000;
                                                AcctType := Accttype::"G/L Account";
                                                AccNo := GenSetup."Excise Duty G/L";
                                                TransType := Transtype::" ";
                                                BalAccType := Balacctype::Savings;
                                                BalAccNo := Loans."Disbursement Account No";
                                                Amt := Amt * GenSetup."Excise Duty (%)" * 0.01;

                                                SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr(PCharges."Charge Description", 1, 50),
                                                    BalAccType, BalAccNo, Amt, ExtDoc, Loans."Loan No.", Transtype::Loan, Dim1, Dim2, SystCreated);

                                            end;
                                        until PCharges.Next = 0;
                                    end;
                                until OtherCommitments.Next = 0;
                            end;

                            //Get if interest due is posted on disbursement from setups

                            if ProdFac.Get(Loans."Loan Product Type") then begin
                                if ProdFac."Compute Interest Due on Postin" = ProdFac."compute interest due on postin"::"Full Interest" then begin
                                    Amt := 0;
                                    LineNo := LineNo + 10000;
                                    AcctType := Accttype::Credit;
                                    AccNo := Loans."Loan Account";
                                    TransType := Transtype::"Interest Due";
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := ProdFac."Loan Interest Account [G/L]";
                                    Amt := Loans."Amount To Disburse" * Loans.Interest / 12 * 0.01;

                                    SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr('Interest Due' + Loans."Loan No.", 1, 50),
                                        BalAccType, BalAccNo, Amt, ExtDoc, Loans."Loan No.", TransType, Dim1, Dim2, SystCreated);

                                end
                                else
                                    if ProdFac."Compute Interest Due on Postin" = ProdFac."compute interest due on postin"::"Pro-rata" then begin
                                        //PRORATED DAYS
                                        EndMonth := CalcDate('-1D', CalcDate('1M', Dmy2date(1, Date2dmy(Today, 2), Date2dmy(Today, 3))));
                                        RemainingDays := DaysPast + (EndMonth - Today) + 1;
                                        TMonthDays := Date2dmy(EndMonth, 1);
                                        Amt := 0;
                                        LineNo := LineNo + 10000;
                                        AcctType := Accttype::Credit;
                                        AccNo := Loans."Loan Account";
                                        TransType := Transtype::"Interest Due";
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := ProdFac."Loan Interest Account [G/L]";
                                        Amt := Loans."Amount To Disburse" * Loans.Interest / 12 * 0.01 * RemainingDays / TMonthDays;

                                        SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr('Interest Due' + Loans."Loan No.", 1, 50),
                                            BalAccType, BalAccNo, Amt, ExtDoc, Loans."Loan No.", TransType, Dim1, Dim2, SystCreated);

                                    end;

                                //Bill if Upfront Bill
                                if ProdFac."Compute Bills on Posting" = ProdFac."compute bills on posting"::"Full Amount" then begin
                                    Amt := 0;
                                    LineNo := LineNo + 10000;
                                    AcctType := Accttype::Credit;
                                    AccNo := Loans."Loan Account";
                                    TransType := Transtype::Bills;
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := ProdFac."Billed Account";
                                    Amt := Loans."Amount To Disburse";

                                    SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr('Bills' + Loans."Loan No.", 1, 50),
                                        BalAccType, BalAccNo, Amt, ExtDoc, Loans."Loan No.", TransType, Dim1, Dim2, SystCreated);


                                end
                                else
                                    if ProdFac."Compute Bills on Posting" = ProdFac."compute bills on posting"::"One Installment" then begin
                                        Amt := 0;
                                        LineNo := LineNo + 10000;
                                        AcctType := Accttype::Credit;
                                        AccNo := Loans."Loan Account";
                                        TransType := Transtype::Bills;
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := ProdFac."Billed Account";
                                        Amt := Loans.Repayment - Loans."Loan Interest Repayment";
                                        if Amt > 0 then begin
                                            SaccoTrans.JournalInsert(Jtemplate, JBatch, DocNo, PDate, AcctType, AccNo, CopyStr('Bills' + Loans."Loan No.", 1, 50),
                                                BalAccType, BalAccNo, Amt, ExtDoc, Loans."Loan No.", TransType, Dim1, Dim2, SystCreated);
                                        end;
                                    end;

                            end;

                            GenSetup.Get;


                            HMember.Get(Loans."Member No.");
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";

                            SavAcc.Get(Loans."Disbursement Account No");
                            msg := 'Dear ' + FirstName(FName) +
                            ',' + NewLine + 'Your ' + LoanProduct."USSD Product Name" + ' of KES ' + Format(Loans."Amount To Disburse") + ' has been approved and disbursed to your FOSA account.'
                            + NewLine + 'Your loan is due on ' + Format(Loans."Expected Date of Completion", 0, '<Day,2>/<Month,2>/<Year4>') + NewLine + 'REF: ' + MobileLoan."Entry Code";
                            ;
                            SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);




                            Loans.Advice := true;
                            Loans."Advice Type" := Loans."advice type"::"Fresh Loan";
                            Loans."Disbursement Date" := Today;
                            Loans."Posted By" := UserId;
                            Loans.Validate("Disbursement Date");
                            Loans.Posted := true;
                            Loans.Modify;

                        end;
                    end;
                    //MESSAGE('t');
                    //ERROR('xxxxx');
                    SaccoTrans.PostJournal(Jtemplate, JBatch);

                    //

                    //Advice Loan
                    TopUp.Reset;
                    TopUp.SetRange(TopUp."Loan No.", Loans."Loan No.");
                    if TopUp.Find('-') then begin
                        repeat
                            if LoanApp.Get(TopUp."Loan Top Up") then begin
                                LoanApp.Validate(Repayment);
                                LoansProcess.AdviceLoan(TopUp."Loan Top Up", true);
                            end;
                        until TopUp.Next = 0;
                    end;
                    //Loans.VALIDATE(Repayment);
                    AdviceLoan(Loans."Loan No.", false);

                    MobileLoan.Posted := true;
                    MobileLoan.Status := MobileLoan.Status::Successful;
                    MobileLoan."Date Posted" := CurrentDatetime;
                    MobileLoan."Approved Amount" := Loans."Approved Amount";
                    MobileLoan.Password := '';
                    MobileLoan.Remarks := 'Successful';
                    MobileLoan.Modify;
                end;


                Loans.Reset;
                Loans.SetRange("Loan No.", MobileLoan."Loan No.");
                Loans.SetRange(Status, Loans.Status::Approved);
                Loans.SetRange(Posted, true);
                if Loans.Find('-') then begin
                    MobileLoan.Posted := true;
                    MobileLoan.Status := MobileLoan.Status::Successful;
                    MobileLoan."Date Posted" := CurrentDatetime;
                    MobileLoan."Approved Amount" := Loans."Approved Amount";
                    MobileLoan.Remarks := 'Successful';
                    MobileLoan.Password := '';
                    MobileLoan.Modify;
                end;

                Loans.Reset;
                Loans.SetRange("Loan No.", MobileLoan."Loan No.");
                Loans.SetRange(Status, Loans.Status::Rejected);
                Loans.SetRange(Posted, false);
                if Loans.Find('-') then begin
                    MobileLoan.Posted := true;
                    MobileLoan.Status := MobileLoan.Status::Failed;
                    MobileLoan."Date Posted" := CurrentDatetime;
                    MobileLoan.Password := '';
                    //MobileLoan."Approved Amount":= Loans."Approved Amount";
                    MobileLoan.Remarks := 'Loan Rejected';
                    MobileLoan.Modify;
                end;
            until MobileLoan.Next = 0;
        end;

    end;


    procedure AdviceLoan(LoanNo: Code[20]; Topup: Boolean)
    var
        iEntryNo: Integer;
        CheckoffAdvice: Record 52185818;
        PaymentMethods: Record 52186122;
        Memb: Record 52185700;
        Loans: Record 52185729;
        InterestAmount: Decimal;
        InterestTotalsFlat: Decimal;
        NoOfMonths: Integer;
    begin

        if Loans.Get(LoanNo) then begin
            if Loans."Recovery Mode" = Loans."recovery mode"::Checkoff then begin //KIgen Added to block non checkoff from advising
                Loans.CalcFields(Loans."Outstanding Balance");
                if Loans.Installments > 0 then
                    InterestAmount := ((Loans."Outstanding Balance" * Loans.Interest / 1200) / Loans.Installments);
                if InterestAmount < 0 then
                    InterestAmount := 0;

                CheckoffAdvice.Reset;
                CheckoffAdvice.SetRange(CheckoffAdvice."Advice Date", Today);
                CheckoffAdvice.SetRange(CheckoffAdvice."Loan No.", Loans."Loan No.");
                if CheckoffAdvice.Find('-') then
                    CheckoffAdvice.DeleteAll;

                iEntryNo := 0;
                CheckoffAdvice.Reset;
                if CheckoffAdvice.Find('+') then
                    iEntryNo := CheckoffAdvice."Entry No" + 1;

                CheckoffAdvice.Init;
                CheckoffAdvice."Entry No" := iEntryNo;
                CheckoffAdvice."Account No." := Loans."Loan Account";
                CheckoffAdvice."Product Type" := Loans."Loan Product Type";
                CheckoffAdvice.Type := CheckoffAdvice.Type::Credit;
                CheckoffAdvice.Validate("Product Type");
                CheckoffAdvice."Loan No." := Loans."Loan No.";
                if Memb.Get(Loans."Member No.") then
                    CheckoffAdvice."ID No." := Memb."ID No.";
                CheckoffAdvice."Member No." := Loans."Member No.";
                CheckoffAdvice.Validate("Member No.");
                CheckoffAdvice."Employer Code" := Memb."Employer Code";
                //CheckoffAdvice.VALIDATE(CheckoffAdvice."Member No.");
                CheckoffAdvice.Names := Loans."Member Name";
                if Loans."Employer Loan No." <> '' then
                    CheckoffAdvice."Employer Account No." := Loans."Employer Loan No."
                else
                    CheckoffAdvice."Employer Account No." := Loans."Loan No.";
                CheckoffAdvice."Loan No." := Loans."Loan No.";

                //Different Mode of Payment***************
                PaymentMethods.Reset;
                PaymentMethods.SetRange(PaymentMethods."Loan No.", Loans."Loan No.");
                PaymentMethods.SetRange(PaymentMethods."Member No.", Loans."Member No.");
                PaymentMethods.SetRange(PaymentMethods."Payment Method", PaymentMethods."payment method"::Checkoff);
                if PaymentMethods.Find('-') then
                    CheckoffAdvice."Amount On" := PaymentMethods.Amount
                else
                    CheckoffAdvice."Amount On" := Loans.Repayment;//-InterestAmount;

                if Topup = true then begin
                    CheckoffAdvice."Amount Off" := Loans.Repayment;
                    CheckoffAdvice."Amount On" := 0;

                    if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Reducing Flat" then begin
                        InterestTotalsFlat := ((Loans.Repayment * Loans.Installments) - Loans."Approved Amount") / Loans.Installments;
                        NoOfMonths := ROUND((Loans."Approved Amount" - Loans."Outstanding Balance") / (Loans.Repayment - InterestTotalsFlat), 1, '>');
                        CheckoffAdvice."Balance Off" := Loans.Repayment * NoOfMonths;//Loans."Outstanding Balance";
                    end
                    else
                        CheckoffAdvice."Balance Off" := Loans."Outstanding Balance";

                    CheckoffAdvice.Interest := 0;
                    CheckoffAdvice."Balance On" := 0;
                end
                else begin
                    /* IF Loans."Outstanding Interest">InterestAmount THEN
                    CheckoffAdvice.Interest:=Loans."Outstanding Interest"
        
                    ELSE*/
                    CheckoffAdvice.Interest := InterestAmount;
                    CheckoffAdvice."Balance On" := Loans.Repayment * Loans.Installments;//Loans."Outstanding Balance";
                    CheckoffAdvice."Balance Off" := 0;
                    CheckoffAdvice."Amount Off" := 0;
                end;

                if Loans."Employer Balance" <> 0 then
                    CheckoffAdvice."Balance Off" := Loans."Employer Balance";

                CheckoffAdvice."Advice Date" := Today;
                CheckoffAdvice."Payroll No" := Memb."Payroll/Staff No.";
                CheckoffAdvice.Interest := Loans."Loan Interest Repayment";
                if Topup = false then
                    CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::"New Loan"
                else
                    CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Stoppage;

                CheckoffAdvice.Validate("Advice Type");
                CheckoffAdvice.Insert;
            end;
        end;

    end;


    procedure TestTransactionalSMS(SessionID: Text) Response: Text
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        MpesaTrans: Record 52185482;
        TransAmt: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal,"Penalty Due","Penalty Paid";
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        RunBal: Decimal;
        AccBal: Decimal;
        Loans: Record 52185729;
        IntAmt: Decimal;
        PrAmt: Decimal;
        ATMTrans: Record 52185755;
        SafcomCharges: Record 52185475;
        SafcomAcc: Code[20];
        SafcomFee: Decimal;
        MobileWithdrawalsBuffer: Record 52185755;
        msg: Text;
        PrePaymentGL: Code[20];
        NewLoanBal: Decimal;
        LoanType: Record 52185690;
        LT: Text;
        AccountToCharge: Code[20];
        BillAcc: Record 52185730;
        IntRate: Decimal;
        MemberName: Text;
        Depositor: Text;
        GenSetup: Record 52185689;
        DepDesc: Text;
        MobileNo: Code[20];
    begin

        MpesaTrans.Reset;
        MpesaTrans.SetRange("Member Account", '5050138496000');
        MpesaTrans.SetRange("Transaction ID", 'PF26NZTFJA');
        MpesaTrans.SetRange(Posted, true);
        MpesaTrans.SetRange("Needs Change", false);

        GenSetup.Get;
        if GenSetup."MBanking Posting Date" <> 0D then
            MpesaTrans.SetRange("Transaction Date", GenSetup."MBanking Posting Date");



        if MpesaTrans.FindFirst then begin
            GenSetup.Get;


            // Get Excise duty G/L
            ExciseDutyGL := GetExciseDutyGL();
            ExciseDutyRate := GetExciseRate();
            ExciseDuty := 0;


            SaccoAccount := '';
            SaccoFee := 0;
            VendorAccount := '';
            VendorCommission := 0;
            SafcomAcc := '';
            SafcomFee := 0;
            PrePaymentGL := '';
            SMSAccount := '';
            SMSCharge := 0;

            CoopSetup.Reset;
            CoopSetup.SetRange("Transaction Type", MpesaTrans."Transaction Type");
            if CoopSetup.FindFirst then begin

                SMSAccount := CoopSetup."SMS Account";
                SMSCharge := CoopSetup."SMS Charge";

                if MpesaTrans.MobileApp then
                    SMSCharge := 0;

                if MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Mpesa Withdrawal" then begin
                    SafcomCharges.Reset;
                    SafcomCharges.SetFilter(Charge, '>0');
                    SafcomCharges.SetFilter(Minimum, '<=%1', MpesaTrans.Amount);
                    SafcomCharges.SetFilter(Maximum, '>=%1', MpesaTrans.Amount);
                    SafcomCharges.SetRange(Category, SafcomCharges.Category::Safaricom);
                    if SafcomCharges.FindFirst then begin
                        SafcomFee := SafcomCharges.Charge;
                    end;
                end;

                if MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Mpesa Withdrawal" then begin
                    SafcomCharges.Reset;
                    SafcomCharges.SetFilter(Charge, '>0');
                    SafcomCharges.SetFilter(Minimum, '<=%1', MpesaTrans.Amount);
                    SafcomCharges.SetFilter(Maximum, '>=%1', MpesaTrans.Amount);
                    SafcomCharges.SetRange(Category, SafcomCharges.Category::Bank);
                    if SafcomCharges.FindFirst then begin
                        SafcomFee := SafcomCharges.Charge;
                    end;
                end;

                PrePaymentGL := CoopSetup."Pre-Payment Account";
                SafcomAcc := CoopSetup."Safaricom Account";
                SaccoAccount := CoopSetup."Sacco Fee Account";
                SaccoFee := CoopSetup."Sacco Fee";
                VendorAccount := CoopSetup."Vendor Commission Account";
                VendorCommission := CoopSetup."Vendor Commission";

                if CoopSetup."Charge Type" = CoopSetup."charge type"::Staggered then begin
                    SacAcc := '';
                    GetChargeAmount(CoopSetup."Staggered Charge Code", MpesaTrans.Amount, SaccoFee, VendorCommission);
                    //MESSAGE('%1',SafcomFee);
                end;
                TotalCharge := SaccoFee + VendorCommission + SafcomFee + SMSCharge;
                ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
            end
            else begin
                if MpesaTrans."Transaction Type" <> MpesaTrans."transaction type"::"Pay Loan From Account" then
                    Error('Setup Missing for %1', MpesaTrans."Transaction Type");
            end;

            //ERROR('SafcomFee %1\SaccoFee %2',SafcomFee,SaccoFee);

            if SavAcc.Get(MpesaTrans."Member Account") then begin
                MemberName := SavAcc."No.";
                TransAmt := MpesaTrans.Amount;
                AccountToCharge := '';

                BillAcc.Reset;
                BillAcc.SetRange("Member No.", SavAcc."Member No.");
                BillAcc.SetRange("Product Type", '505');
                if BillAcc.FindFirst then
                    AccountToCharge := BillAcc."No.";

                if (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Loan Repayment") or
                    (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::Paybill) or
                    (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Mpesa Deposit") or
                    (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Bank Deposit") or
                    (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Bank Agent Deposit") or
                    (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Pay Loan From Account")
                    then
                    TransAmt := TransAmt * -1;

                if TransAmt >= 0 then begin
                    if SavAcc.Blocked = SavAcc.Blocked::Debit then begin
                        MpesaTrans."Needs Change" := true;
                        MpesaTrans.Modify;
                        exit;
                    end;
                end;

                if TransAmt < 0 then begin
                    if (SavAcc.Blocked <> SavAcc.Blocked::" ") then begin
                        MpesaTrans."Needs Change" := true;
                        MpesaTrans.Modify;
                        exit;
                    end;
                end;

                if (SavAcc.Blocked = SavAcc.Blocked::All) then begin
                    MpesaTrans."Needs Change" := true;
                    MpesaTrans.Modify;
                    exit;
                end;

                //BUser.GET(USERID);

                //BUser.TESTFIELD("Cashier Journal Template");
                //BUser.TESTFIELD("Cashier Journal Batch");


                DocNo := MpesaTrans."Transaction ID";
                PDate := MpesaTrans."Transaction Date";

                AccNo := MpesaTrans."Member Account";
                ExtDoc := '';
                LoanNo := '';
                TransType := Transtype::" ";
                Dim1 := SavAcc."Global Dimension 1 Code";
                Dim2 := SavAcc."Global Dimension 2 Code";
                SystCreated := true;

                Priority := 211;

                if MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Mpesa Withdrawal" then
                    Priority := 211;
                if MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Utility Payment" then
                    Priority := 211;


                if MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Loan Repayment" then begin
                    if Loans.Get(LoanNo) then begin
                        Loans.CalcFields("Outstanding Balance");
                        LT := Loans."Loan Product Type Name";
                        if LoanType.Get(Loans."Loan Product Type") then
                            LT := LoanType."USSD Product Name";

                        NewLoanBal := Loans."Outstanding Balance";
                        msg := Format(MpesaTrans."Transaction Type") + ' of KES ' + Format(MpesaTrans.Amount) + ' done on ' + Format(ddMMyyyy(MpesaTrans."Transaction Date")) + ' has been processed successfully. Interest Paid is ' + Format(MpesaTrans."Interest Paid")
        +
                        ', Principal Paid is ' + Format(MpesaTrans."Principal Paid") + ', New ' + LT + ' Balance is ' + Format(NewLoanBal) + NewLine + 'REF: ' + MpesaTrans."Transaction ID";
                    end;
                end
                else begin
                    if MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::Paybill then begin
                        Depositor := CopyStr(MpesaTrans.Description, 24, StrLen(MpesaTrans.Description));

                        //MemberName
                        msg := 'Dear ' + Format(SavAcc.Name) + ', ' + Depositor + ' has successfully deposited KES ' + Format(MpesaTrans.Amount) +
                                  'to your ' + SavAcc."Product Name" + ' on ' + Format(ddMMyyyy(MpesaTrans."Transaction Date")) + '.' + NewLine + 'REF: ' + MpesaTrans."Transaction ID";
                        ;
                    end
                    else begin
                        msg := Format(MpesaTrans."Transaction Type") + ' of KES ' + Format(MpesaTrans.Amount) + ' done on ' + Format(ddMMyyyy(MpesaTrans."Transaction Date")) + '  has been processed successfully.';
                    end;
                end;


                HMember.Get(SavAcc."Member No.");
                FName := HMember."First Name";
                if FName = '' then
                    FName := HMember."Second Name";

                if (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Mpesa Withdrawal") or
                  (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Utility Payment") or
                  (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Bank Transfer") or
                  (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Pesalink Transfer") then begin

                    msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + Format(MpesaTrans."Transaction Type") + ' request of KSHS ' + Format(MpesaTrans.Amount) +
                          ' MPESA Ref: ' + MpesaTrans."Transaction ID" + ' has been processed successfully on ' + Format(Today, 0, '<Day,2>/<Month,2>/<Year4>') + ' ' + Format(Time) + '.' + NewLine + 'REF: ' + MpesaTrans."Transaction ID";

                end;


                if (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Utility Payment") then begin

                    msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + Format(MpesaTrans."Transaction Type") + ' request of KSHS ' + Format(MpesaTrans.Amount) +
                          ' MPESA Ref: ' + MpesaTrans."Transaction ID" + ' has been processed successfully on ' + Format(Today, 0, '<Day,2>/<Month,2>/<Year4>') + ' ' + Format(Time) + '.' + NewLine + 'REF: ' + MpesaTrans."Transaction ID";

                end;

                if (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::Airtime) then begin

                    msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'you have successfully purchased Airtime of KSHS ' + Format(MpesaTrans.Amount) +
                          ' on ' + Format(Today, 0, '<Day,2>/<Month,2>/<Year4>') + ' ' + Format(Time) + '.' + NewLine + 'REF: ' + MpesaTrans."Transaction ID";

                end;



                MobileNo := SavAcc."Transactional Mobile No";
                if MobileNo = '' then
                    MobileNo := SavAcc."Mobile Phone No";
                //MESSAGE(MobileNo);



                //ERROR(msg);
                if (MpesaTrans."Transaction Type" <> MpesaTrans."transaction type"::"Mini-Statement") and (MpesaTrans."Transaction Type" <> MpesaTrans."transaction type"::"Balance Enquiry") then
                    if (MpesaTrans."Transaction Type" <> MpesaTrans."transaction type"::"Mobile App Login") then
                        SendSmsWithID(Source::MBANKING, MobileNo, msg, Format(MpesaTrans."Transaction ID"), '', true, Priority, false, 'CBS', SessionID, 'CBS');

            end
            else begin

                if (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::Paybill) or (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Bank Agent Deposit") or
                  (MpesaTrans."Transaction Type" = MpesaTrans."transaction type"::"Bank Deposit") then begin
                    SavAcc.Reset;
                    SavAcc.SetRange("Transactional Mobile No", MpesaTrans."Member Account");
                    SavAcc.SetRange("Product Type", '505');
                    if SavAcc.FindFirst then begin
                        MpesaTrans."Member Account" := SavAcc."No.";
                        MpesaTrans."Paybill Member ID" := SavAcc."ID No.";
                        MpesaTrans.Modify;

                    end
                    else begin

                        if Loans.Get(MpesaTrans."Member Account") then begin
                            SavAcc.Reset;
                            SavAcc.SetRange("Member No.", Loans."Member No.");
                            SavAcc.SetRange("Product Type", '505');
                            if SavAcc.FindFirst then begin
                                MpesaTrans.Description := 'Loan Repayment ' + MpesaTrans."Member Account";
                                MpesaTrans."Member Account" := SavAcc."No.";
                                MpesaTrans."Loan No." := Loans."Loan No.";
                                MpesaTrans."Transaction Type" := MpesaTrans."transaction type"::"Loan Repayment";
                                MpesaTrans."Needs Change" := false;
                                MpesaTrans.Modify;
                            end
                            else begin
                                MpesaTrans."Needs Change" := true;
                                MpesaTrans.Modify;
                            end
                        end
                        else begin
                            MpesaTrans."Needs Change" := true;
                            MpesaTrans.Modify;
                        end;
                    end;
                end
                else begin
                    MpesaTrans."Needs Change" := true;
                    MpesaTrans.Modify;
                end;
            end;
        end;
    end;


    procedure ChargePinReset(AcctNo: Code[20]; PhoneNo: Code[20]) Response: Text[1024]
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        SLedger: Record 52185732;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        AccountBookBalance: Decimal;
        AccountAvailableBalance: Decimal;
        AccountToCharge: Code[20];
        Found: Boolean;
        MemberNo: Code[20];
        TransactionDate: DateTime;
        Loans: Record 52185729;
        LoanType: Text;
        BalStmt: Text;
        msg: Text;
        SafcomCharges: Record 52185475;
        SafcomFee: Decimal;
        BalEnqCharge: Decimal;
        NextofKIN: Record 52185701;
    begin
        TransactionDate := CurrentDatetime;

        Response := 'ERROR';
        Found := false;


        AccountToCharge := '';
        MemberNo := '';

        SavAcc.Reset;
        SavAcc.SetRange("No.", AcctNo);
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then begin
            AccountToCharge := SavAcc."No.";
            MemberNo := SavAcc."Member No.";
            if SavAcc.Blocked <> SavAcc.Blocked::" " then
                exit;
        end;


        if AccountToCharge = '' then
            exit('Account to charge missing');


        // Get Excise duty G/L
        ExciseDutyGL := GetExciseDutyGL();
        ExciseDutyRate := GetExciseRate();
        ExciseDuty := 0;

        SaccoAccount := '';
        SaccoFee := 0;
        VendorAccount := '';
        VendorCommission := 0;


        SMSAccount := '';
        SMSCharge := 0;

        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Pin Reset");
        if CoopSetup.FindFirst then begin

            SMSAccount := CoopSetup."SMS Account";
            SMSCharge := CoopSetup."SMS Charge";


            SaccoAccount := CoopSetup."Sacco Fee Account";
            SaccoFee := CoopSetup."Sacco Fee";
            VendorAccount := CoopSetup."Vendor Commission Account";
            VendorCommission := CoopSetup."Vendor Commission";

            TotalCharge := SaccoFee + VendorCommission + SMSCharge;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);

        end
        else begin
            Error('Setup Missing for %1', CoopSetup."transaction type"::"Pin Reset");
        end;



        if SavAcc.Get(AccountToCharge) then begin

            ProdFact.Get(SavAcc."Product Type");

            if (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::"Deposits Only") or
                (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::" ") then begin
                Error('The Account to Charge is not a Withdrawable Account');

            end;

            BalEnqCharge := 0;
            AccBal := GetAccountBalance(SavAcc."No.");
            if (AccBal >= TotalCharge + ExciseDuty) or true then begin
                BalEnqCharge := TotalCharge + ExciseDuty;


                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';

                GenJournalBatch.Reset;
                GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                GenJournalBatch.SetRange(Name, JBatch);
                if not GenJournalBatch.FindFirst then begin
                    GenJournalBatch.Init;
                    GenJournalBatch."Journal Template Name" := JTemplate;
                    GenJournalBatch.Name := JBatch;
                    GenJournalBatch.Description := 'Sky World Batch';
                    GenJournalBatch.Init;
                end;

                DocNo := SavAcc."No.";
                PDate := Today;
                AccNo := SavAcc."No.";
                ExtDoc := '';
                LoanNo := '';
                TransType := Transtype::" ";
                Dim1 := SavAcc."Global Dimension 1 Code";
                Dim2 := SavAcc."Global Dimension 2 Code";
                SystCreated := true;

                SaccoTrans.InitJournal(JTemplate, JBatch);

                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr('PIN Reset Charge', 1, 50), Balacctype::"G/L Account",
                              '', VendorCommission, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);
                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr('PIN Reset Charge', 1, 50), Balacctype::"G/L Account",
                              SaccoAccount, SaccoFee, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);
                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccountToCharge, CopyStr('SMS Charges ', 1, 50), Balacctype::"G/L Account",
                              SMSAccount, SMSCharge, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);
                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Savings, AccNo, CopyStr('Excise Duty on PIN Reset', 1, 50), Balacctype::"G/L Account",
                              ExciseDutyGL, ExciseDuty, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);



                AccNo := VendorAccount;
                ExtDoc := SavAcc."No.";
                LoanNo := '';
                TransType := Transtype::" ";

                SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, Accttype::Vendor, AccNo, CopyStr('PIN Reset Commission', 1, 50), Balacctype::"G/L Account",
                              '', -VendorCommission, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystCreated);



                SaccoTrans.PostJournal(JTemplate, JBatch);

            end
            else begin
                Response := 'INSUFFICIENT_BAL';
            end;
        end
        else begin
            Response := 'INVALID_ACCOUNT';
        end;
    end;


    procedure GetBranches() Response: Text
    var
        MCommission: Decimal;
        MInterest: Decimal;
        LoanProdCharge: Record 52185734;
        MComm: Integer;
        MInt: Decimal;
        LAccount: Code[50];
        SaccoMemberNo: Code[20];
        ContinueMB: Boolean;
        Members: Record 52185700;
        interestGL: Code[10];
        LoansOld: Record 52185729;
        TotalClearedAmount: Decimal;
        SavingsAccounts: Record 52185730;
        LoanProcessingGL: Code[20];
        vendorMboostaCommission: Decimal;
        vendorMboostaCommissionGL: Code[20];
        Loans: Record 52185729;
        ProdFac: Record 52185690;
        OutstandingAmount: Decimal;
        StartDate: array[3] of Date;
        EndDate: array[3] of Date;
        SalBuffer: Record 52185784;
        CurrSal: array[3] of Decimal;
        k: Integer;
        SmallestSal: Decimal;
        Salary: array[3] of Decimal;
        SalDates: array[3] of Date;
        SalaryThroughFosa: Boolean;
        BlaklistStartDate: Date;
        Limit: Decimal;
        LoanedBefore: Boolean;
        LastDate: Date;
        j: Integer;
        MobileLoanGuarantors: Record 52185470;
        SkyMobileLoans: Record 52185483;
        DimensionValue: Record "Dimension Value";
    begin

        Response := '';

        DimensionValue.Reset;
        DimensionValue.SetRange("Dimension Code", 'BRANCH');
        if DimensionValue.FindFirst then begin
            Response += '<Branches>';
            repeat

                Response += '<Branch>';
                Response += '<Code>' + DimensionValue.Code + '</Code>';
                Response += '<Name>' + DimensionValue.Name + '</Name>';
                Response += '</Branch>';

            until DimensionValue.Next = 0;
            Response += '</Branches>';
        end;
    end;

    local procedure TestBalanceEnq()
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52185482;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        SLedger: Record 52185732;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        AccountBookBalance: Decimal;
        AccountAvailableBalance: Decimal;
        AccountToCharge: Code[20];
        Found: Boolean;
        MemberNo: Code[20];
        TransactionDate: DateTime;
        Loans: Record 52185729;
        LoanType: Text;
        BalStmt: Text;
        msg: Text;
        SafcomCharges: Record 52185475;
        SafcomFee: Decimal;
        BalEnqCharge: Decimal;
    begin
        if SavAcc.Get('5050123278000') then begin

            ProdFact.Get(SavAcc."Product Type");

            HMember.Get(SavAcc."Member No.");
            FName := HMember."First Name";
            if FName = '' then
                FName := HMember."Second Name";
            msg := 'Dear ' + FirstName(FName) + ',' + NewLine + 'Your ' + ProdFact."USSD Product Name" + ' Balance as at ' + Format(CurrentDatetime) + ': ';

            SavAcc.CalcFields("Balance (LCY)");
            AccountBookBalance := SavAcc."Balance (LCY)";
            AccountAvailableBalance := GetAccountBalance(SavAcc."No.");
            if SavAcc."Product Type" = '505' then begin

                SMSCharge := 0;

                CoopSetup.Reset;
                CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Mpesa Withdrawal");
                if CoopSetup.FindFirst then begin

                    SMSCharge := CoopSetup."SMS Charge";

                    SaccoFee := CoopSetup."Sacco Fee";

                    if CoopSetup."Charge Type" = CoopSetup."charge type"::Staggered then begin
                        SacAcc := '';
                        GetChargeAmount(CoopSetup."Staggered Charge Code", AccountAvailableBalance, SaccoFee, VendorCommission);
                    end;

                    SafcomCharges.Reset;
                    SafcomCharges.SetFilter(Charge, '>0');
                    SafcomCharges.SetFilter(Minimum, '<=%1', AccountAvailableBalance);
                    SafcomCharges.SetFilter(Maximum, '>=%1', AccountAvailableBalance);
                    if SafcomCharges.FindFirst then begin
                        SafcomFee := SafcomCharges.Charge;
                    end;

                    VendorCommission := CoopSetup."Vendor Commission";
                    Message('SaccoFee %1\VendorCommission %2\SafcomFee %3\SMSCharge %4\', SaccoFee, VendorCommission, SafcomFee, SMSCharge);
                    TotalCharge := SaccoFee + VendorCommission + SafcomFee + SMSCharge;
                    ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);

                    AccountBookBalance -= BalEnqCharge;
                    AccountAvailableBalance -= (TotalCharge + ExciseDuty);
                end;
            end;


        end
    end;


    procedure NewLine() NewLine: Text
    var
        nL: Char;
    begin

        nL := 13;
        NewLine := Format(nL, 0, '<CHAR>');
    end;


    procedure GetLoanBalance(LoanNo: Code[20]) Bal: Text
    var
        MobileNo: Code[20];
        Loans: Record 52185729;
        LoanProduct: Record 52185690;
        SavAcc: Record 52185730;
        MemberNo: Code[20];
        MaxLoan: Decimal;
        Found: Boolean;
        arrears: Decimal;
        balance: Decimal;
    begin

        Bal := '';

        Loans.Reset;
        Loans.SetRange("Loan No.", LoanNo);
        if Loans.FindFirst then begin

            Loans.CalcFields("Outstanding Balance", "Outstanding Interest", "Outstanding Bills");
            if Loans."Outstanding Bills" < 0 then
                Loans."Outstanding Bills" := 0;
            if Loans."Outstanding Interest" < 0 then
                Loans."Outstanding Interest" := 0;

            arrears := ROUND((Loans."Outstanding Bills" + Loans."Outstanding Interest"), 1, '>');
            balance := ROUND((Loans."Outstanding Balance" + Loans."Outstanding Interest"), 1, '>');

            Bal := 'Loan Arrears: KES ' + Format(arrears) + NewLine + 'Loan Balance: KES ' + Format(balance);
        end;
    end;


    procedure GetLoanSource() Response: Text
    var
        MobileNo: Code[20];
        Loans: Record 52185729;
        LoanProduct: Record 52185690;
        SavAcc: Record 52185730;
        MemberNo: Code[20];
        MaxLoan: Decimal;
    begin
        Response := '';


        Response := '<Sources>';
        Response += '<Source>';
        Response += '<Code>FOSA</Code>';
        Response += '<Name>FOSA Loans</Name>';
        Response += '</Source>';
        Response += '<Source>';
        Response += '<Code>BOSA</Code>';
        Response += '<Name>BOSA Loans</Name>';
        Response += '</Source>';
        Response += '</Sources>';
    end;

    local procedure GetSMSSalutation(MemberNo: Code[20]) Salute: Text
    var
        FName: Text;
    begin

        HMember.Get(MemberNo);
        FName := HMember."First Name";
        if FName = '' then
            FName := HMember."Second Name";
        Salute := 'Dear ' + FirstName(FName) + ',' + NewLine;
    end;


    procedure GetLocalIP() IP: Text
    var
        ActiveSession: Record "Active Session";
        Dns: code[100];//dotnet Dns;
        IPAddresses: code[100];//dotnet List_Of_T;
        i: Integer;
    begin
        IP := '';
        ActiveSession.Get(ServiceInstanceId, SessionId);
        // IPAddresses := IPAddresses.List;
        // IPAddresses.AddRange(Dns.GetHostAddresses(ActiveSession."Client Computer Name"));
        // for i := 0 to IPAddresses.Count - 1 do begin
        //     //MESSAGE('%1', IPAddresses.Item(i));
        //     IP := IPAddresses.Item(i);
        // end;
    end;


    procedure MobileAppCheckBeneficiaries(EntryCode: Text[20]; TransactionID: Code[20]; PhoneNo: Code[20]; PIN: Text; Mode: Code[20]; EmailAddress: Text) Response: Text[1024]
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        AccBal: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        MobileTrans: Record 52185482;
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        SLedger: Record 52185732;
        LedgerCount: Integer;
        CurrRecord: Integer;
        DFilter: Text;
        DebitCreditFlag: Code[10];
        FirstEntry: Boolean;
        ProdFact: Record 52185690;
        AccountBookBalance: Decimal;
        AccountAvailableBalance: Decimal;
        AccountToCharge: Code[20];
        Found: Boolean;
        MemberNo: Code[20];
        TransactionDate: DateTime;
        Loans: Record 52185729;
        LoanType: Text;
        BalStmt: Text;
        msg: Text;
        SafcomCharges: Record 52185475;
        SafcomFee: Decimal;
        BalEnqCharge: Decimal;
        NextofKIN: Record 52185701;
        i: Integer;
    begin
        TransactionDate := CurrentDatetime;

        Response := 'ERROR';
        Found := false;


        PhoneNo := '+' + PhoneNo;


        if not CorrectPin(PhoneNo, PIN) then begin
            Response := 'INCORRECT_PIN';
            exit;
        end;



        AccountToCharge := '';
        MemberNo := '';

        SavAcc.Reset;
        SavAcc.SetRange("Transactional Mobile No", PhoneNo);
        SavAcc.SetRange("Product Type", '505');
        if SavAcc.FindFirst then begin
            AccountToCharge := SavAcc."No.";
            MemberNo := SavAcc."Member No.";
            if SavAcc.Blocked <> SavAcc.Blocked::" " then
                exit;
        end;


        if MemberNo = '' then
            exit('Member No. Missing');

        if AccountToCharge = '' then
            exit('Account to charge missing');


        // Get Excise duty G/L
        ExciseDutyGL := GetExciseDutyGL();
        ExciseDutyRate := GetExciseRate();
        ExciseDuty := 0;

        SaccoAccount := '';
        SaccoFee := 0;
        VendorAccount := '';
        VendorCommission := 0;


        SMSAccount := '';
        SMSCharge := 0;

        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Check Beneficiary");
        if CoopSetup.FindFirst then begin

            SMSAccount := CoopSetup."SMS Account";
            SMSCharge := CoopSetup."SMS Charge";


            SaccoAccount := CoopSetup."Sacco Fee Account";
            SaccoFee := CoopSetup."Sacco Fee";
            VendorAccount := CoopSetup."Vendor Commission Account";
            VendorCommission := CoopSetup."Vendor Commission";

            TotalCharge := SaccoFee + VendorCommission + SMSCharge;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
        end
        else begin
            Error('Setup Missing for %1', CoopSetup."transaction type"::"Check Beneficiary");
        end;



        if SavAcc.Get(AccountToCharge) then begin

            ProdFact.Get(SavAcc."Product Type");

            if (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::"Deposits Only") or
                (ProdFact."Mobile Transaction" = ProdFact."mobile transaction"::" ") then begin
                Error('The Account to Charge is not a Withdrawable Account');

            end;

            BalEnqCharge := 0;
            AccBal := GetAccountBalance(SavAcc."No.");
            if AccBal >= TotalCharge + ExciseDuty then begin
                BalEnqCharge := TotalCharge + ExciseDuty;
                //BUser.GET(USERID);

                //BUser.TESTFIELD("Cashier Journal Template");
                //BUser.TESTFIELD("Cashier Journal Batch");

                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';

                GenJournalBatch.Reset;
                GenJournalBatch.SetRange("Journal Template Name", JTemplate);
                GenJournalBatch.SetRange(Name, JBatch);
                if not GenJournalBatch.FindFirst then begin
                    GenJournalBatch.Init;
                    GenJournalBatch."Journal Template Name" := JTemplate;
                    GenJournalBatch.Name := JBatch;
                    GenJournalBatch.Description := 'Sky World Batch';
                    GenJournalBatch.Init;
                end;


                MobileTrans.Init;
                MobileTrans."Entry No." := EntryCode;
                MobileTrans."Transaction ID" := TransactionID;
                MobileTrans."Session ID" := TransactionID;
                MobileTrans."Transaction Date" := Dt2Date(TransactionDate);
                MobileTrans."Transaction Time" := Dt2Time(TransactionDate);
                MobileTrans."Member Account" := SavAcc."No.";
                MobileTrans."Transaction Type" := MobileTrans."transaction type"::"Check Beneficiary";
                MobileTrans.Description := Format(MobileTrans."Transaction Type");
                MobileTrans.Posted := true;
                MobileTrans.Insert;


                MobileTrans.Reset;
                MobileTrans.SetRange("Transaction ID", TransactionID);
                MobileTrans.SetRange(Posted, false);
                if MobileTrans.FindFirst then begin
                    /*
                    DocNo := MobileTrans."Transaction ID";
                    PDate := MobileTrans."Transaction Date";
                    AccNo := MobileTrans."Member Account";
                    ExtDoc := '';
                    LoanNo := '';
                    TransType := TransType::" ";
                    Dim1 := SavAcc."Global Dimension 1 Code";
                    Dim2 := SavAcc."Global Dimension 2 Code";
                    SystCreated := TRUE;
        
                    SaccoTrans.InitJournal(JTemplate,JBatch);
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                                  '',TotalCharge+ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                                  {
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR(MobileTrans.Description,1,50),BalAccType::"G/L Account",
                                  '',SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccountToCharge,COPYSTR('SMS Charges ',1,50),BalAccType::"G/L Account",
                                  SMSAccount,SMSCharge,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Savings,AccNo,COPYSTR('Excise Duty',1,50),BalAccType::"G/L Account",
                                  ExciseDutyGL,ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
                                  }
        
                    AccNo := VendorAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := TransType::" ";
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::Vendor,AccNo,COPYSTR(MobileTrans.Description+' Commission',1,50),BalAccType::"G/L Account",
                                  '',-VendorCommission,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
                    AccNo := SaccoAccount;
                    ExtDoc := MobileTrans."Member Account";
                    LoanNo := '';
                    TransType := TransType::" ";
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::"G/L Account",AccNo,COPYSTR(MobileTrans.Description+' Fee',1,50),BalAccType::"G/L Account",
                                  '',-SaccoFee,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
        
        
                    SaccoTrans.JournalInsert(JTemplate,JBatch,DocNo,PDate,AcctType::"G/L Account",ExciseDutyGL,COPYSTR(MobileTrans.Description+' Excise Duty',1,50),BalAccType::"G/L Account",
                                  '',-ExciseDuty,ExtDoc,LoanNo,TransType,Dim1,Dim2,SystCreated);
        
        
                    MobileTrans.Posted:=TRUE;
                    MobileTrans."Posted By":=USERID;
                    MobileTrans."Date Posted":=TODAY;
                    MobileTrans.MODIFY;
        
                    SaccoTrans.PostJournal(JTemplate,JBatch);
                    */
                end;

            end
            else begin
                Response := 'INSUFFICIENT_BAL';
            end;
        end
        else begin
            Response := 'INVALID_ACCOUNT';
        end;


        if (Response = 'ERROR') then begin

            NextofKIN.Reset;
            NextofKIN.SetRange("Account No", SavAcc."Member No.");
            NextofKIN.SetRange(Beneficiary, true);
            if NextofKIN.FindFirst then begin
                Response := '<TABLE>';
                Response += '<TR>';
                Response += '<TH>Name</TH>';
                Response += '<TH>Relationship</TH>';
                Response += '</TR>';
                repeat
                    Response += '<TR>';
                    Response += '<TD>' + NextofKIN.Name + '</TD>';
                    Response += '<TD>' + NextofKIN.Relationship + '</TD>';
                    Response += '</TR>';
                until NextofKIN.Next = 0;
                Response += '</TABLE>';

            end;
        end;

    end;

    local procedure RedirectSMS()
    var
        SMS: Record 52185764;
    begin
        SMS.Reset;
        SMS.SetFilter("Date Entered", '>=%1', Dmy2date(17, 6, 2021));
        SMS.SetRange("Sent To Server", SMS."sent to server"::No);
        if SMS.FindFirst then begin
            repeat
                if SendSms(SMS.Source, SMS."Telephone No", SMS."SMS Message", SMS."Document No", SMS."Account No", SMS.IsChargeable, 210, false) then
                    SMS."Sent To Server" := SMS."sent to server"::Redirected
                else
                    SMS."Sent To Server" := SMS."sent to server"::Failed;

                SMS.Modify;
            until SMS.Next = 0;
        end;
    end;


    procedure MboosterAlerts() Response: Integer
    var
        Days: Integer;
        Balance: Decimal;
        Loans: Record 52185729;
        ProdFac: Record 52185690;
        saccoAccount: Record 52185730;
        Msg: Text;
    begin
        Response := 1;

        Loans.Reset;
        Loans.SetRange(Loans."Loan Product Type", '126');
        Loans.SetRange(Loans."Repayment Method Alert", false);
        Loans.SetRange(Loans.Posted, true);
        Loans.SetFilter(Loans."Disbursement Date", '>%1', CalcDate('-1M', Today));
        Loans.SetFilter(Loans."Outstanding Balance", '>0');
        if Loans.Find('-') then begin
            repeat
                Loans.CalcFields(Loans."Outstanding Balance");
                if ((Loans."Outstanding Balance" > 0)) then begin
                    ProdFac.Reset;
                    ProdFac.SetRange(ProdFac."Product ID", '126');
                    if ProdFac.Find('-') then begin
                        saccoAccount.Reset;
                        saccoAccount.SetRange(saccoAccount."Member No.", Loans."Member No.");
                        saccoAccount.SetRange(saccoAccount."Product Type", '505');
                        if saccoAccount.Find('-') then begin

                            HMember.Get(saccoAccount."Member No.");
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";


                            Priority := 211;
                            Msg := 'Dear ' + FName + ',';

                            Msg += 'To repay your M-Boosta Loan kindly deposit money to your FOSA A/C No ' +
                            saccoAccount."No." + ' through paybill No ' + PaybillNo + NewLine + 'REF: ' + Loans."Loan No.";
                            /*
                              /*
                                Commented on 24/11/2021 to remove the mboosta message having loan number
                              */
                            SendSms(Source::MBANKING, saccoAccount."Transactional Mobile No", Msg, saccoAccount."No.", '', false, Priority, false);
                            Response := 0;
                            Loans."Repayment Method Alert" := true;
                            Loans.Modify;
                        end;
                    end;
                end;
            until Loans.Next = 0;
        end;


        Response := 1;
        Loans.Reset;
        Loans.SetRange(Loans."Loan Product Type", '126');
        //Loans.SETRANGE(Loans."Loan No.",'MB_10');
        Loans.SetRange(Loans."Repayment Alert", false);
        Loans.SetRange(Loans.Posted, true);
        Loans.SetFilter(Loans."Disbursement Date", '>%1', CalcDate('-1M', Today));
        Loans.SetFilter(Loans."Outstanding Balance", '>0');
        if Loans.Find('-') then begin
            repeat
                Loans.CalcFields(Loans."Outstanding Balance");
                Days := 0;
                Days := Today - Loans."Disbursement Date";
                if ((Days >= 28) and (Loans."Outstanding Balance" > 0)) then begin
                    //MESSAGE(FORMAT(Loans."Outstanding Balance"));
                    ProdFac.Reset;
                    ProdFac.SetRange(ProdFac."Product ID", '126');
                    if ProdFac.Find('-') then begin
                        saccoAccount.Reset;
                        saccoAccount.SetRange(saccoAccount."Member No.", Loans."Member No.");
                        saccoAccount.SetRange(saccoAccount."Product Type", '505');
                        if saccoAccount.Find('-') then begin


                            HMember.Get(saccoAccount."Member No.");
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";


                            Priority := 211;
                            Msg := 'Dear ' + FName + ',';

                            Msg += 'Kindly note your Mboosta loan balance of KES' + Format(Loans."Outstanding Balance")
                            + ' is due on ' + Format(CalcDate('30D', Loans."Disbursement Date"), 0, '<Day>-<Month>-<Year>') + '. Late payment'
                            + '  reduces your loan limit. Repay the loan through Paybill no:' + PaybillNo + ' and borrow again.';

                            SendSms(Source::MBANKING, saccoAccount."Transactional Mobile No", Msg, saccoAccount."No.", '', false, Priority, false);

                            Response := 0;
                            Loans."Repayment Alert" := true;
                            Loans.Modify;
                        end;
                    end;
                end;
            until Loans.Next = 0;
        end;



        Response := 1;
        Loans.Reset;
        Loans.SetRange(Loans."Loan Product Type", '126');
        //Loans.SETRANGE(Loans."Loan No.",'MB_10');
        Loans.SetRange(Loans."Non Performance Alert", false);
        Loans.SetRange(Loans.Posted, true);
        Loans.SetFilter(Loans."Disbursement Date", '=%1', CalcDate('-35D', Today));
        if Loans.Find('-') then begin
            repeat
                Loans.CalcFields(Loans."Outstanding Balance");
                Days := 0;
                Days := Today - Loans."Disbursement Date";
                if ((Days = 35) and (Loans."Outstanding Balance" > 0)) then begin
                    ProdFac.Reset;
                    ProdFac.SetRange(ProdFac."Product ID", '126');
                    if ProdFac.Find('-') then begin
                        saccoAccount.Reset;
                        saccoAccount.SetRange(saccoAccount."Member No.", Loans."Member No.");
                        saccoAccount.SetRange(saccoAccount."Product Type", '505');
                        if saccoAccount.Find('-') then begin



                            HMember.Get(saccoAccount."Member No.");
                            FName := HMember."First Name";
                            if FName = '' then
                                FName := HMember."Second Name";


                            Priority := 211;
                            Msg := 'Dear ' + FName + ',';

                            Msg += 'Your M-Boosta loan of KES ' + Format(Loans."Outstanding Balance")
                            + ' is overdue, you risk being penalized and listed on CRB. Urgently repay and borrow again';

                            SendSms(Source::MBANKING, saccoAccount."Transactional Mobile No", Msg, saccoAccount."No.", '', false, Priority, false);

                            Response := 0;
                            Loans."Non Performance Alert" := true;
                            Loans.Modify;
                        end;
                    end;
                end;
            until Loans.Next = 0;
        end;

    end;


    procedure GetDepositEntries(AcctNo: Code[20]; var DepDates: array[3] of Date; var Deposit: array[3] of Decimal; var LastDeposits: Decimal; UseLastDeposits: Boolean)
    var
        MCommission: Decimal;
        MInterest: Decimal;
        LoanProdCharge: Record 52185734;
        MComm: Integer;
        MInt: Decimal;
        LAccount: Code[50];
        SaccoMemberNo: Code[20];
        ContinueMB: Boolean;
        Members: Record 52185700;
        interestGL: Code[10];
        LoansOld: Record 52185729;
        TopupAmount: Decimal;
        TotalClearedAmount: Decimal;
        SavingsAccounts: Record 52185730;
        LoanProcessingGL: Code[20];
        vendorMboostaCommission: Decimal;
        vendorMboostaCommissionGL: Code[20];
        Loans: Record 52185729;
        ProdFac: Record 52185690;
        OutstandingAmount: Decimal;
        StartDate: array[3] of Date;
        EndDate: array[3] of Date;
        SLedger: Record 52185732;
        CurrSal: array[3] of Decimal;
        k: Integer;
    begin
        TotalClearedAmount := 0;
        for k := 3 downto 1 do begin
            Deposit[k] := 0;
            DepDates[k] := 0D;
        end;

        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."Member No.", AcctNo);
        SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Deposit Contribution");
        if SavingsAccounts.Find('-') then begin

            if not UseLastDeposits then begin
                EndDate[3] := CalcDate('CM', Today);
                StartDate[3] := CalcDate('-CM', EndDate[3]);

                SLedger.Reset;
                SLedger.SetCurrentkey(SLedger."Member No.", SLedger."Customer No.", SLedger."Posting Date");
                SLedger.SetRange(SLedger."Customer No.", SavingsAccounts."No.");
                SLedger.SetFilter(SLedger."Posting Date", '%1..%2', StartDate[3], EndDate[3]);
                SLedger.SetRange(Reversed, false);
                if not SLedger.Find('-') then begin
                    EndDate[3] := CalcDate('-1M+CM', Today);
                    StartDate[3] := CalcDate('-CM', EndDate[3]);
                end;


                EndDate[2] := CalcDate('-1M+CM', EndDate[3]);
                StartDate[2] := CalcDate('-CM', EndDate[2]);

                EndDate[1] := CalcDate('-1M+CM', EndDate[2]);
                StartDate[1] := CalcDate('-CM', EndDate[1]);

                for k := 3 downto 1 do begin

                    SLedger.Reset;
                    SLedger.SetCurrentkey(SLedger."Member No.", SLedger."Customer No.", SLedger."Posting Date");
                    SLedger.SetRange(SLedger."Customer No.", SavingsAccounts."No.");
                    SLedger.SetFilter(SLedger."Posting Date", '%1..%2', StartDate[k], EndDate[k]);
                    SLedger.SetRange(Reversed, false);
                    if SLedger.Find('+') then begin
                        SLedger.CalcSums(Amount);
                        Deposit[k] := SLedger.Amount * -1;
                        DepDates[k] := SLedger."Posting Date";
                    end;
                end;
            end
            else begin
                LastDeposits := 0;

                SLedger.Reset;
                SLedger.SetCurrentkey(SLedger."Member No.", SLedger."Customer No.", SLedger."Posting Date");
                SLedger.SetRange(SLedger."Customer No.", SavingsAccounts."No.");
                SLedger.SetFilter(SLedger."Posting Date", '%1..%2', CalcDate('-45D', Today), Today);
                SLedger.SetRange(Reversed, false);
                if SLedger.Find('+') then begin
                    SLedger.CalcSums(Amount);
                    LastDeposits := SLedger.Amount * -1;
                end;
            end;

        end;





        //MESSAGE('%1\%2\%3',DepDates[1],DepDates[2],DepDates[3]);
        //MESSAGE('%1\%2\%3',Deposit[1],Deposit[2],Deposit[3]);
    end;


    procedure MBoostaPenalty() Response: Integer
    var
        Days: Integer;
        Balance: Decimal;
        Penalty: Decimal;
        Loans: Record 52185729;
        saccoAccount: Record 52185730;
        JTemplate: Code[20];
        JBatch: Code[20];
        RunBal: Decimal;
        FullyRec: Boolean;
        DocNo: Code[20];
        PDate: Date;
        Dim1: Code[10];
        Dim2: Code[10];
        SystCreated: Boolean;
        AccNo: Code[20];
        RecAmt: Decimal;
    begin
        /*
        Response:=1;
             Loans.RESET;
             Loans.SETRANGE(Loans."Loan Product Type",'126');
             //Loans.SETRANGE(Loans."Loan No.",'MB_11438');
             Loans.SETRANGE(Loans."Penalty Charge",FALSE);
             Loans.SETRANGE(Loans.Posted,TRUE);
             Loans.SETFILTER(Loans."Penalty Frequency",'<%1',1);
             Loans.SETFILTER(Loans."Disbursement Date",'<%1',CALCDATE('-35D',TODAY));
             IF Loans.FIND('-')  THEN BEGIN
         REPEAT
           Loans.CALCFIELDS(Loans."Outstanding Balance",Loans."Outstanding Interest");
           Days:=0;
           Days:=TODAY-Loans."Disbursement Date";
           IF( (Days>35) AND (Loans."Penalty Frequency"=0) AND (Loans."Outstanding Balance">0)) THEN BEGIN

             ProdFac.RESET;
             ProdFac.SETRANGE(ProdFac."Product ID",'126');
              IF ProdFac.FIND('-') THEN BEGIN
                  saccoAccount.RESET;
                  saccoAccount.SETRANGE(saccoAccount."Member No.",Loans."Member No.");
                  saccoAccount.SETRANGE(saccoAccount."Product Type",'505');
                  IF saccoAccount.FIND('-') THEN BEGIN

                    Balance:=Loans."Outstanding Balance"+Loans."Outstanding Interest";
                    Penalty:=Balance*0.05;

                                  //start posting

                               GenJournalLine.RESET;
                               GenJournalLine.SETRANGE("Journal Template Name",'MSACCO');
                               GenJournalLine.SETRANGE("Journal Batch Name",'MSACCOLN');
                               GenJournalLine.DELETEALL;

                                   DocumentNo := Loans."Loan No.";

                                   // Dr LOAN Account

                                   LineNo:=LineNo+10000;
                                   GenJournalLine.INIT;
                                   GenJournalLine."Journal Template Name":='MSACCO';
                                   GenJournalLine."Journal Batch Name":='MSACCOLN';
                                   GenJournalLine."Line No.":=LineNo;
                                   GenJournalLine."Account Type":=GenJournalLine."Account Type"::Credit;
                                   GenJournalLine."Account No.":= ProdFac."Account No. Prefix"+saccoAccount."Member No."+ProdFac."Account No. Suffix";
                                   GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                   GenJournalLine."Document No.":= DocumentNo;
                                   GenJournalLine."External Document No.":='MSACCO LN PENALTY';
                                   GenJournalLine."Posting Date":=TODAY;
                                   GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::"Interest Due" ;
                                   GenJournalLine."Loan No":=Loans."Loan No.";
                                   GenJournalLine.Amount:= Penalty;
                                   GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                   GenJournalLine.Description:='MBOOSTA LOAN '+ Loans."Loan No.";
                                   GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                                   GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                                   GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                   GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                   IF GenJournalLine.Amount<>0 THEN
                                   GenJournalLine.INSERT;

                                 // Cr Member FOSA Account - less Interest

                                 LineNo:=LineNo+10000;
                                 GenJournalLine.INIT;
                                 GenJournalLine."Journal Template Name":='MSACCO';
                                 GenJournalLine."Journal Batch Name":='MSACCOLN';
                                 GenJournalLine."Line No.":=LineNo;
                                 GenJournalLine."Account Type":=GenJournalLine."Account Type"::"G/L Account";
                                 GenJournalLine."Account No.":= ProdFac."Penalty Paid Account";
                                 GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                 GenJournalLine."Document No.":=DocumentNo;
                                 GenJournalLine."External Document No.":='MSACCO LN';
                                 GenJournalLine."Posting Date":=TODAY;
                                 GenJournalLine."Loan No":=Loans."Loan No.";
                                 GenJournalLine.Amount:= -Penalty;// - Loans."Loan Interest Repayment") * -1;
                                 GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                 GenJournalLine.Description:='MBOOSTA LOAN '+ Loans."Loan No.";;
                                 GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                                 GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                                 GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                 GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                 IF GenJournalLine.Amount<>0 THEN
                                 GenJournalLine.INSERT;

                                 POSTJOURNAL.CompletePosting('MSACCO','MSACCOLN');

                    //Loans.Interest:=Penalty;
                    Loans."Penalty Charge" :=TRUE;
                    Loans."Penalty Frequency":=1;
                    Loans.MODIFY;
                    Response:=0;

                        Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Transactional Mobile No",'Dear member, you have been charged a penalty of Kes '
                        + FORMAT(ROUND(Penalty,0.01,'>')) +' on your defaulted MBoosta Loan no. ' + Loans."Loan No." + '.','',saccoAccount."No.",FALSE);

                 END;
               END;
               END;

               {
                   IF((Days>65) AND (Days<95)  AND (Loans."Penalty Frequency"=1) AND (Loans."Outstanding Balance">0)) THEN BEGIN

             ProdFac.RESET;
             ProdFac.SETRANGE(ProdFac."Product ID",'126');
              IF ProdFac.FIND('-') THEN BEGIN
                  saccoAccount.RESET;
                  saccoAccount.SETRANGE(saccoAccount."Member No.",Loans."Member No.");
                  saccoAccount.SETRANGE(saccoAccount."Product Type",'505');
                  IF saccoAccount.FIND('-') THEN BEGIN

                    Balance:=Loans."Outstanding Balance"+Loans."Outstanding Interest";
                    Penalty:=Balance*0.05;
                    post
                                  //start posting

                               GenJournalLine.RESET;
                               GenJournalLine.SETRANGE("Journal Template Name",'MSACCO');
                               GenJournalLine.SETRANGE("Journal Batch Name",'MSACCOLN');
                               GenJournalLine.DELETEALL;

                                   DocumentNo := Loans."Loan No.";

                                   // Dr LOAN Account

                                   LineNo:=LineNo+10000;
                                   GenJournalLine.INIT;
                                   GenJournalLine."Journal Template Name":='MSACCO';
                                   GenJournalLine."Journal Batch Name":='MSACCOLN';
                                   GenJournalLine."Line No.":=LineNo;
                                   GenJournalLine."Account Type":=GenJournalLine."Account Type"::Credit;
                                   GenJournalLine."Account No.":= ProdFac."Account No. Prefix"+saccoAccount."Member No."+ProdFac."Account No. Suffix";
                                   GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                   GenJournalLine."Document No.":= DocumentNo;
                                   GenJournalLine."External Document No.":='MSACCO LN PENALTY';
                                   GenJournalLine."Posting Date":=TODAY;
                                   GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::"Interest Due" ;
                                   GenJournalLine."Loan No":= AcctNo;
                                   GenJournalLine.Amount:= Penalty;
                                   GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                   GenJournalLine.Description:='MBOOSTA LOAN '+ Loans."Loan No.";
                                   GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                                   GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                                   GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                   GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                   IF GenJournalLine.Amount<>0 THEN
                                   GenJournalLine.INSERT;

                                 // Cr Member FOSA Account - less Interest

                                 LineNo:=LineNo+10000;
                                 GenJournalLine.INIT;
                                 GenJournalLine."Journal Template Name":='MSACCO';
                                 GenJournalLine."Journal Batch Name":='MSACCOLN';
                                 GenJournalLine."Line No.":=LineNo;
                                 GenJournalLine."Account Type":=GenJournalLine."Account Type"::"G/L Account";
                                 GenJournalLine."Account No.":= ProdFac."Penalty Paid Account";
                                 GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                 GenJournalLine."Document No.":=DocumentNo;
                                 GenJournalLine."External Document No.":='MSACCO LN';
                                 GenJournalLine."Posting Date":=TODAY;
                                 GenJournalLine.Amount:= (Penalty)*-1;// - Loans."Loan Interest Repayment") * -1;
                                 GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                 GenJournalLine.Description:='MBOOSTA LOAN '+ Loans."Loan No.";;
                                 GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                                 GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                                 GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                 GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                 IF GenJournalLine.Amount<>0 THEN
                                 GenJournalLine.INSERT;

                                 POSTJOURNAL.CompletePosting('MSACCO','MSACCOLN');

                    //Loans.Interest:=Penalty;
                    Loans."Penalty Charge" :=FALSE;
                    Loans."Penalty Frequency":=2;
                    Loans.MODIFY;
                    Response:=0;

                        Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Transactional Mobile No",'Dear member, you have been charged a penalty of Kes '
                        + FORMAT(Loans."Outstanding Balance") +' on your MBoosta Loan.' ,'',saccoAccount."No.",FALSE);

                 END;
               END;


               END;
           IF((Days>95) AND (Days<125)  AND (Loans."Penalty Frequency"=2) AND (Loans."Outstanding Balance">0)) THEN BEGIN

             ProdFac.RESET;
             ProdFac.SETRANGE(ProdFac."Product ID",'126');
              IF ProdFac.FIND('-') THEN BEGIN
                  saccoAccount.RESET;
                  saccoAccount.SETRANGE(saccoAccount."Member No.",Loans."Member No.");
                  saccoAccount.SETRANGE(saccoAccount."Product Type",'505');
                  IF saccoAccount.FIND('-') THEN BEGIN

                    Balance:=Loans."Outstanding Balance"+Loans."Outstanding Interest";
                    Penalty:=Balance*0.05;

                                  //start posting

                               GenJournalLine.RESET;
                               GenJournalLine.SETRANGE("Journal Template Name",'MSACCO');
                               GenJournalLine.SETRANGE("Journal Batch Name",'MSACCOLN');
                               GenJournalLine.DELETEALL;

                                   DocumentNo := Loans."Loan No.";

                                   // Dr LOAN Account

                                   LineNo:=LineNo+10000;
                                   GenJournalLine.INIT;
                                   GenJournalLine."Journal Template Name":='MSACCO';
                                   GenJournalLine."Journal Batch Name":='MSACCOLN';
                                   GenJournalLine."Line No.":=LineNo;
                                   GenJournalLine."Account Type":=GenJournalLine."Account Type"::Credit;
                                   GenJournalLine."Account No.":= ProdFac."Account No. Prefix"+saccoAccount."Member No."+ProdFac."Account No. Suffix";
                                   GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                   GenJournalLine."Document No.":= DocumentNo;
                                   GenJournalLine."External Document No.":='MSACCO LN PENALTY';
                                   GenJournalLine."Posting Date":=TODAY;
                                   GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::"Interest Due" ;
                                   GenJournalLine."Loan No":= AcctNo;
                                   GenJournalLine.Amount:= Penalty;
                                   GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                   GenJournalLine.Description:='MBOOSTA LOAN '+ Loans."Loan No.";
                                   GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                                   GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                                   GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                   GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                   IF GenJournalLine.Amount<>0 THEN
                                   GenJournalLine.INSERT;

                                 // Cr Member FOSA Account - less Interest

                                 LineNo:=LineNo+10000;
                                 GenJournalLine.INIT;
                                 GenJournalLine."Journal Template Name":='MSACCO';
                                 GenJournalLine."Journal Batch Name":='MSACCOLN';
                                 GenJournalLine."Line No.":=LineNo;
                                 GenJournalLine."Account Type":=GenJournalLine."Account Type"::"G/L Account";
                                 GenJournalLine."Account No.":= ProdFac."Penalty Paid Account";
                                 GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                 GenJournalLine."Document No.":=DocumentNo;
                                 GenJournalLine."External Document No.":='MSACCO LN';
                                 GenJournalLine."Posting Date":=TODAY;
                                 GenJournalLine.Amount:= (Penalty)*-1;// - Loans."Loan Interest Repayment") * -1;
                                 GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                 GenJournalLine.Description:='MBOOSTA LOAN '+ Loans."Loan No.";;
                                 GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                                 GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                                 GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                 GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                 IF GenJournalLine.Amount<>0 THEN
                                 GenJournalLine.INSERT;

                                 POSTJOURNAL.CompletePosting('MSACCO','MSACCOLN');

                    //Loans.Interest:=Penalty;
                    Loans."Penalty Charge" :=TRUE;
                    Loans."Penalty Frequency":=3;
                    Loans.MODIFY;
                    Response:=0;

                        Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Transactional Mobile No",'Dear member, you have been charged a penalty of Kes '
                        + FORMAT(Loans."Outstanding Balance") +' on your MBoosta Loan.' ,'',saccoAccount."No.",FALSE);

                 END;
               END;
               END;
               }
                UNTIL Loans.NEXT = 0;
             END;
             */

    end;


    procedure UndoReversal(EntryCode: Text[20]): Boolean
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record 52185730;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        MpesaTrans: Record 52185482;
        TransAmt: Decimal;
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[10];
        Dim2: Code[10];
        SystCreated: Boolean;
        RunBal: Decimal;
        AccBal: Decimal;
        Loans: Record 52185729;
        IntAmt: Decimal;
        PrAmt: Decimal;
        ATMTrans: Record 52185755;
        SafcomAcc: Code[20];
        SafcomFee: Decimal;
        MobileWithdrawalsBuffer: Record 52185755;
        Msg: Text;
    begin
        MobileWithdrawalsBuffer.Reset;
        MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer."Trace ID", EntryCode);
        MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer.Source, MobileWithdrawalsBuffer.Source::"M-PESA");
        //MobileWithdrawalsBuffer.SETRANGE(MobileWithdrawalsBuffer."Account No",SavAcc."No.");
        //MobileWithdrawalsBuffer.SETRANGE(MobileWithdrawalsBuffer.Amount,Amount);
        MobileWithdrawalsBuffer.SetRange(Posted, true);
        MobileWithdrawalsBuffer.SetRange(Reversed, true);
        if MobileWithdrawalsBuffer.Find('-') then begin

            MobileWithdrawalsBuffer.Posted := false;
            MobileWithdrawalsBuffer."Posting Date" := Today;
            MobileWithdrawalsBuffer.Reversed := false;
            //MobileWithdrawalsBuffer."Date Reversed":=TODAY;
            MobileWithdrawalsBuffer."Customer Names" := CopyStr('Un-reversed By:' + UserId, 1, 100);
            MobileWithdrawalsBuffer.Modify;


            exit(true);
        end;


        exit(false);
    end;


    procedure MobileBankingReports() Response: Text
    var
        SkyAuth: Record 52185476;
        TotalUsers: Integer;
        TotalUSSDUsers: Integer;
        TotalMAPPUsers: Integer;
        FirstSuspension: Integer;
        SecondSuspension: Integer;
        Blocked: Integer;
        OTPFirstSuspension: Integer;
        OTPSecondSuspension: Integer;
        OTPBlocked: Integer;
        TodayCount: Integer;
        WeekCount: Integer;
        MonthCount: Integer;
    begin

        Response := '';

        SkyAuth.Reset;
        if SkyAuth.FindFirst then begin
            TotalUsers := SkyAuth.Count;
            repeat
                if SkyAuth."Date Created" = 0D then begin
                    SkyAuth."Date Created" := Dmy2date(17, 6, 2021);
                    SkyAuth.Modify;
                end;

                if SkyAuth.IMSI <> '' then
                    TotalUSSDUsers += 1;

                if SkyAuth.IMEI <> '' then
                    TotalMAPPUsers += 1;

                if SkyAuth."Login Attempts Tag" = 'FIRST_SUSPENSION' then
                    FirstSuspension += 1;

                if SkyAuth."Login Attempts Tag" = 'SECOND_SUSPENSION' then
                    SecondSuspension += 1;

                if SkyAuth."Login Attempts Tag" = 'DEFAULT_SUSPEND' then
                    Blocked += 1;


                if SkyAuth."OTP Attempts Tag" = 'FIRST_SUSPENSION' then
                    OTPFirstSuspension += 1;

                if SkyAuth."OTP Attempts Tag" = 'SECOND_SUSPENSION' then
                    OTPSecondSuspension += 1;

                if SkyAuth."OTP Attempts Tag" = 'DEFAULT_SUSPEND' then
                    OTPBlocked += 1;


                if SkyAuth."Date Created" = Today then
                    TodayCount += 1;

                if (SkyAuth."Date Created" >= CalcDate('-CW', Today)) and (SkyAuth."Date Created" <= CalcDate('CW', Today)) then
                    WeekCount += 1;

                if (SkyAuth."Date Created" >= CalcDate('-CM', Today)) and (SkyAuth."Date Created" <= CalcDate('CM', Today)) then
                    MonthCount += 1;


            until SkyAuth.Next = 0;
        end;

        Response := '<Reports>';
        Response += '<TotalUsers>' + Format(TotalUsers) + '</TotalUsers>';
        Response += '<TotalUSSDUsers>' + Format(TotalUSSDUsers) + '</TotalUSSDUsers>';
        Response += '<TotalMAPPUsers>' + Format(TotalMAPPUsers) + '</TotalMAPPUsers>';

        Response += '<Security>';
        Response += '<Login>';
        Response += '<FirstSuspension>' + Format(FirstSuspension) + '</FirstSuspension>';
        Response += '<SecondSuspension>' + Format(SecondSuspension) + '</SecondSuspension>';
        Response += '<Blocked>' + Format(Blocked) + '</Blocked>';
        Response += '</Login>';

        Response += '<OTP>';
        Response += '<FirstSuspension>' + Format(OTPFirstSuspension) + '</FirstSuspension>';
        Response += '<SecondSuspension>' + Format(OTPSecondSuspension) + '</SecondSuspension>';
        Response += '<Blocked>' + Format(OTPBlocked) + '</Blocked>';
        Response += '</OTP>';

        Response += '</Security>';


        Response += '<Progress>';
        Response += '<Growth>';
        Response += '<Today>' + Format(TodayCount) + '</Today>';
        Response += '<Week>' + Format(WeekCount) + '</Week>';
        Response += '<Month>' + Format(MonthCount) + '</Month>';
        Response += '</Growth>';
        Response += '</Progress>';


        Response += '</Reports>';


        /*
        DEFAULT_SUSPEND
        DEFAULT_WARN
        DEFAULT_LOCK
        FIRST_WARNING
        FIRST_SUSPENSION
        SECOND_WARNING
        SECOND_SUSPENSION
        THIRD_WARNING
        */

    end;


    procedure CheckService(ServiceName: Text): Boolean
    var
        SkyServices: Record 52185463;
    begin

        if not SkyServices.Get then begin
            SkyServices.Init;
            SkyServices."Mpesa Withdrawal" := true;
            SkyServices."Utility Bill Payment" := true;
            SkyServices."Bank Transfer" := true;
            SkyServices.Insert;


            SkyServices.Reset;
            SkyServices.Get;
        end;


        if ServiceName = 'Cash Withdrawal' then
            exit(SkyServices."Mpesa Withdrawal");
        if ServiceName = 'Utility Bill Payment' then
            exit(SkyServices."Utility Bill Payment");
        if ServiceName = 'Bank Transfer' then
            exit(SkyServices."Bank Transfer");
        if ServiceName = 'Transfer to Other Account' then
            exit(SkyServices."Transfer to Other Account");
        if ServiceName = 'Agent Withdrawal' then
            exit(SkyServices."Agent Withdrawal");




        exit(false);
    end;


    procedure LoanExpiry()
    var
        MobileNo: Code[20];
        Loans: Record 52185729;
        LoanProduct: Record 52185690;
        SavAcc: Record 52185730;
        MemberNo: Code[20];
        MaxLoan: Decimal;
        LoanAccountNo: Code[20];
        CreateLoanAccount: Codeunit "Loans Process";
        CreditAccount: Record 52185731;
        LoanType: Code[20];
        LoanAmount: Decimal;
        MobileLoan: Record 52185483;
        Continue: Boolean;
        msg: Text;
        Product: Record 52185690;
        nDays: Integer;
        SavingsAccounts: Record 52185730;
        ShareCap: Decimal;
        Members: Record 52185700;
        LoanNo: Code[20];
        BUser: Record 52185782;
        JTemplate: Code[10];
        JBatch: Code[10];
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        Dim1: Code[20];
        Dim2: Code[20];
        SystCreated: Boolean;
        TransactionType: Option " ","Mpesa Withdrawal","Mpesa Deposit","Utility Payment","Loan Repayment","Balance Enquiry","Mini-Statement","Loan Disbursement";
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        UpfrontInterest: Decimal;
        PCharges: Record 52185734;
        Amt: Decimal;
        TariffDetails: Record 52185777;
        LoanRec: Record 52185829;
        LoanLimit: Decimal;
        QualifiedAmt: Decimal;
        TopUp: Decimal;
        LoanTopUp: Record 52185729;
        RunBal: Decimal;
        Salary: array[3] of Decimal;
        SalDates: array[3] of Date;
        Salute: Text;
        IntDue: Decimal;
        TopUpAmt: Decimal;
    begin

        MobileLoan.Reset;
        MobileLoan.SetRange(Status, MobileLoan.Status::"Pending Guarantors");
        MobileLoan.SetRange(Posted, false);
        MobileLoan.SetFilter("Date Entered", '<%1', CalcDate('-2D', Today));
        if MobileLoan.FindFirst then begin
            repeat
                HMember.Get(MobileLoan."Member No.");
                FName := HMember."First Name";
                if FName = '' then
                    FName := HMember."Second Name";
                Salute := 'Dear ' + FirstName(FName) + ',' + NewLine;

                msg := Salute + 'Your ' + LoanProduct."USSD Product Name" + ' request has failed because your loan guarantors did not respond in time';
                MobileLoan.Remarks := 'Loan Expired';
                MobileLoan.Status := MobileLoan.Status::Failed;
                MobileLoan.Posted := true;
                MobileLoan."Date Posted" := CurrentDatetime;//TODAY;
                MobileLoan."Message Text" := msg;
                SendSms(Source::MBANKING, MobileLoan."Telephone No", msg, Format(MobileLoan."Entry No"), '', true, Priority, false);
                MobileLoan.Modify;
                Continue := false;
            until MobileLoan.Next = 0;
        end;
    end;


    procedure LastLoanAmount(var LoanNo: array[3] of Code[20]; var LoanAmount: array[3] of Decimal; SaccoMemberNo: Code[20]; Product: Code[20]; var WithinTheMonth: Boolean)
    var
        LNo: Code[20];
        Loans: Record 52185729;
        LatestDate: Date;
        PreviousDate: Date;
    begin
        //WithinTheMonth -> checks if last two loans were posted in the same month
        LatestDate := 0D;
        PreviousDate := 0D;

        Loans.Reset;
        Loans.SetCurrentkey("Disbursement Date");
        Loans.SetRange(Loans."Loan Product Type", Product);
        Loans.SetRange(Loans."Member No.", SaccoMemberNo);
        Loans.SetFilter("Outstanding Balance", '<=0');
        Loans.SetRange(Posted, true);
        if Loans.Find('+') then begin
            LoanNo[1] := Loans."Loan No.";
            LoanAmount[1] := Loans."Approved Amount";
            LatestDate := Loans."Disbursement Date";
        end;


        Loans.Reset;
        Loans.SetCurrentkey("Disbursement Date");
        Loans.SetFilter("Loan No.", '<>%1', LoanNo[1]);
        Loans.SetRange(Loans."Loan Product Type", Product);
        Loans.SetRange(Loans."Member No.", SaccoMemberNo);
        Loans.SetFilter("Outstanding Balance", '<=0');
        Loans.SetRange(Posted, true);
        if Loans.Find('+') then begin
            LoanNo[2] := Loans."Loan No.";
            LoanAmount[2] := Loans."Approved Amount";
            PreviousDate := Loans."Disbursement Date";
        end;




        Loans.Reset;
        Loans.SetCurrentkey("Disbursement Date");
        Loans.SetFilter("Loan No.", '<>%1&<>%2', LoanNo[1], LoanNo[2]);
        Loans.SetRange(Loans."Loan Product Type", Product);
        Loans.SetRange(Loans."Member No.", SaccoMemberNo);
        Loans.SetFilter("Outstanding Balance", '<=0');
        Loans.SetRange(Posted, true);
        if Loans.Find('+') then begin
            LoanNo[3] := Loans."Loan No.";
            LoanAmount[3] := Loans."Approved Amount";
        end;

        WithinTheMonth := false;
        if PreviousDate <> 0D then
            if LatestDate - PreviousDate < 30 then WithinTheMonth := true;
    end;

    local procedure UpdateSectorials()
    var
        MobileLoans: Record 52185483;
        Loans: Record 52185729;
    begin

        MobileLoans.Reset;
        MobileLoans.SetFilter("Loan Purpose", '<>%1', '');
        MobileLoans.SetFilter(Status, '%1', MobileLoans.Status::Successful);
        if MobileLoans.FindFirst then begin
            repeat
                Loans.Reset;
                Loans.SetRange("Disbursement Account No", MobileLoans."Account No");
                Loans.SetRange("Application Date", MobileLoans."Date Entered");
                Loans.SetRange("Loan Product Type", MobileLoans."Loan Product Type");
                Loans.SetRange("Approved Amount", MobileLoans."Requested Amount");
                Loans.SetFilter("Sub Sector Level2", '');
                if Loans.FindFirst then begin
                    repeat
                        if MobileLoans."Loan Purpose" = '7220' then
                            MobileLoans."Loan Purpose" := '7210';

                        Loans.Validate("Sub Sector Level2", MobileLoans."Loan Purpose");
                        Loans.Modify;
                    until Loans.Next = 0;
                end;

            until MobileLoans.Next = 0;
        end;
    end;


    procedure ChargeMemberPINReset()
    var
        SkyworldUSSDAuth: Record 52185476;
        NewPin: Text;
        NewIntPin: Integer;
        SavAcc: Record 52185730;
        Msg: Text;
    begin

        SkyworldUSSDAuth.Reset;
        SkyworldUSSDAuth.SetRange(SkyworldUSSDAuth."Charge Pin", true);
        if SkyworldUSSDAuth.FindFirst then begin
            Priority := 211;
            repeat

                SavAcc.Reset;
                SavAcc.SetRange("Transactional Mobile No", SkyworldUSSDAuth."Mobile No.");
                if SavAcc.FindFirst then begin
                    SkyworldUSSDAuth."Charge Pin" := false;
                    SkyworldUSSDAuth.Modify;

                    ChargePinReset(SkyworldUSSDAuth."Account No.", SkyworldUSSDAuth."Mobile No.");
                end;
            until SkyworldUSSDAuth.Next = 0;
        end;
    end;


    procedure DividendAdvanceChecks(MemberNo: Code[30]; var MinimumQualification: Decimal; var MaximumQualification: Decimal; UserCanApply: Boolean; var Msg: Text)
    var
        Continue: Boolean;
        Members: Record 52185700;
        Loans: Record 52185729;
        LoanRep: Decimal;
        ProductFactory: Record 52185690;
        SavingsAccounts: Record 52185730;
        FOSAAcc: Code[30];
        SavingsLedgerEntry: Record 52185732;
        NonPerformingBalances: Decimal;
        TotalDefaulted: Decimal;
        TopUpAmt: Decimal;
        TopUpCharges: Decimal;
        OutstandingInterest: Decimal;
    begin
        Continue := true;
        if Members.Get(MemberNo) then begin

            ProductFactory.Get('136');

            SavingsAccounts.Reset;
            SavingsAccounts.SetRange("Member No.", Members."No.");
            SavingsAccounts.SetRange("Product Type", '505');
            if SavingsAccounts.FindFirst then begin
                FOSAAcc := SavingsAccounts."No.";
            end;
            MaximumQualification := 0;
            MinimumQualification := 0;
            MaximumQualification := GetDividendLoanQualifiedAmount(FOSAAcc, ProductFactory."Product ID");
            if MaximumQualification > ProductFactory."Mobile Max. Loan Amount" then
                MaximumQualification := ProductFactory."Mobile Max. Loan Amount";

            MinimumQualification := ProductFactory."Mobile Min. Loan Amount";
            if MaximumQualification < ProductFactory."Mobile Min. Loan Amount" then begin
                MinimumQualification := 0;
                MaximumQualification := 0;
                Continue := false;
                MaximumQualification := 0;
                MinimumQualification := 0;
                Msg := 'You are not eligible for this loan';
            end;


            //Dividend action field pay check
            if Continue then begin
                if Members."Dividend Action" <> Members."dividend action"::Pay then begin
                    Continue := false;
                    MaximumQualification := 0;
                    MinimumQualification := 0;
                    Msg := 'You are not eligible for this loan';
                end;
            end;

            //Active member check
            if Continue then begin
                if Members.Status <> Members.Status::Active then begin
                    Continue := false;
                    MaximumQualification := 0;
                    MinimumQualification := 0;
                    Msg := 'You are not eligible for this loan';
                end;
            end;


            if Continue then begin
                Loans.Reset;
                Loans.SetRange("Member No.", MemberNo);
                Loans.SetFilter("Loans Category-SASRA", '%1|%2|%3|%4', Loans."loans category-sasra"::Watch, Loans."loans category-sasra"::Substandard,
                Loans."loans category-sasra"::Doubtful, Loans."loans category-sasra"::Loss);
                Loans.SetFilter("Outstanding Balance", '>0');
                if Loans.FindFirst then begin
                    repeat
                        TopUpAmt := 0;
                        Loans.CalcFields("Outstanding Balance", "Outstanding Interest");
                        OutstandingInterest := Loans."Outstanding Interest";
                        if OutstandingInterest <= 0 then OutstandingInterest := 0;
                        TotalDefaulted += Loans."Outstanding Balance" + OutstandingInterest;
                        TopUpAmt := Loans."Outstanding Balance" + OutstandingInterest;
                        TopUpCharges += GetTopUpCharges(Loans."Loan Product Type", TopUpAmt);
                    until Loans.Next = 0;
                end;
            end;

            if Continue = true then begin
                if (TotalDefaulted + TopUpCharges + ProductFactory."Min. Net after Topup") >= MaximumQualification then begin
                    MinimumQualification := 0;
                    MaximumQualification := 0;
                    Msg := 'You have a loan in default';
                    Continue := false;
                end;
            end;

            MinimumQualification := TotalDefaulted + TopUpCharges + ProductFactory."Min. Net after Topup";
            if MinimumQualification <= 0 then
                MinimumQualification := ProductFactory."Mobile Min. Loan Amount";


            if Continue then begin
                if MaximumQualification <= 0 then begin
                    MinimumQualification := 0;
                    MaximumQualification := 0;
                    Msg := 'You have a loan in default';
                    Continue := false;
                end;
            end;
        end;
    end;

    local procedure CalculateDividends()
    var
        DividendProgression: Record 52185713;
        MaxLoanAmount: Decimal;
        LoanType: Record 52185690;
    begin
        LoanType.Get('136');
        DividendProgression.Reset;
        DividendProgression.SetFilter("Product Type", '=%1|=%2', '02', '03');
        DividendProgression.SetRange("Member No", '0123278');
        DividendProgression.SetRange(Year, LoanType."Dividend Advance Year");//here
        if DividendProgression.FindFirst then begin
            DividendProgression.CalcSums("Net Dividends");
            MaxLoanAmount := ROUND(DividendProgression."Net Dividends" * LoanType."Net Salary Multiplier %" / 100);
        end;
        Message(Format(MaxLoanAmount));
    end;

    local procedure PinResetLocal() CurrentUSSDPIN: Text
    var
        SkyworldUSSDAuth: Record 52185476;
        NewPin: Text;
        NewIntPin: Integer;
        SavAcc: Record 52185730;
        Msg: Text;
    begin

        SkyworldUSSDAuth.Reset;
        SkyworldUSSDAuth.SetRange(IMSI, '');//IMSI blank
        //SkyworldUSSDAuth.SETRANGE("Account No.",'5050123278000');
        if SkyworldUSSDAuth.FindFirst then begin
            Priority := 211;
            repeat
                NewPin := RandomPIN;
                SavAcc.Reset;
                SavAcc.SetRange("Product Type", '505');
                SavAcc.SetRange("Transactional Mobile No", SkyworldUSSDAuth."Mobile No.");
                if SavAcc.FindFirst then begin

                    Msg := 'Dear ' + SavAcc.Name + ' your Harambee Sacco Mobile Banking (M-Cash) start PIN is ' + NewPin + '. Dial ' + UssdCode + ' to access this service. For help Call 0709943000';
                    SendSms(Source::MOBILE_PIN, SkyworldUSSDAuth."Mobile No.", Msg, SavAcc."No.", '', true, Priority, false);

                    SkyworldUSSDAuth."PIN No." := NewPin;
                    SkyworldUSSDAuth."Date Updated" := Today;
                    SkyworldUSSDAuth."Pin Sent" := true;
                    SkyworldUSSDAuth."Reset PIN" := false;
                    SkyworldUSSDAuth."Initial PIN Sent" := false;
                    SkyworldUSSDAuth."Force PIN" := true;
                    SkyworldUSSDAuth."PIN Encrypted" := false;
                    SkyworldUSSDAuth."Charge Pin" := false;//remove
                    SkyworldUSSDAuth.Modify;

                end;
            until SkyworldUSSDAuth.Next = 0;
        end
        else begin
            RedirectSMS;
            //CallServiceFunction(1);
        end;
    end;

    local procedure CalculateNetTakeHome(EntryNo: Integer) NetTakeHome: Decimal
    var
        SkyMobileLoans: Record 52185483;
        ProductFactory: Record 52185690;
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        ExciseDuty: Decimal;
        UpfrontInterest: Decimal;
        LoanTopUp: Record 52185729;
        TopUpAmt: Decimal;
        GeneralExpence: Decimal;
    begin
        //here2
        if SkyMobileLoans.Get(EntryNo) then begin
            ProductFactory.Get(SkyMobileLoans."Loan Product Type");

            CoopSetup.Reset;
            CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Loan Disbursement");
            if CoopSetup.FindFirst then begin
                SMSCharge := CoopSetup."SMS Charge";
                SaccoFee := CoopSetup."Sacco Fee";
                VendorCommission := CoopSetup."Vendor Commission";
                TotalCharge := SaccoFee + VendorCommission + SMSCharge;
                ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
            end else begin
                Error('Setup Missing for %1', CoopSetup."transaction type"::"Loan Disbursement");
            end;

            UpfrontInterest := ROUND(SkyMobileLoans.Amount * ProductFactory."Interest Rate (Max.)" / 100, 1, '>');
            if ProductFactory."Product ID" = '119' then
                UpfrontInterest := ROUND(SkyMobileLoans.Amount * ProductFactory."Interest Rate (Max.)" / 1200, 1, '>');

            LoanTopUp.Reset;
            LoanTopUp.SetRange("Member No.", SkyMobileLoans."Member No.");
            LoanTopUp.SetRange("Loan Product Type", SkyMobileLoans."Loan Product Type");
            LoanTopUp.SetFilter("Outstanding Balance", '>0');
            if SkyMobileLoans."Loan Product Type" = '136' then
                LoanTopUp.SetFilter("Disbursement Date", '>=%1', ProductFactory."DAdvance Limit Period");
            if LoanTopUp.FindFirst then begin
                LoanTopUp.CalcFields("Outstanding Balance", "Outstanding Interest", "Outstanding Bills");
                TopUpAmt := 0;
                if LoanTopUp."Outstanding Interest" > 0 then
                    TopUpAmt += LoanTopUp."Outstanding Interest";

                if LoanTopUp."Outstanding Balance" > 0 then
                    TopUpAmt += LoanTopUp."Outstanding Balance";
            end;

            if ProductFactory."Interest Recovered Upfront" = false then UpfrontInterest := 0;

            GeneralExpence := TotalCharge + ExciseDuty + UpfrontInterest + TopUpAmt;
            NetTakeHome := SkyMobileLoans.Amount - GeneralExpence;
        end;
    end;


    procedure VirtualMemberRegistration(SessionID: Text; Telephone: Text; "ID No": Code[10]; Names: Text; DOB: Date; "Recruited By": Code[20]; Email: Text; "Service Number": Text; Employer: Text; NameOnIPRS: Code[50]; Gender: Code[10]) Response: Text
    var
        SkyVirtualMember: Record 52185499;
        CreditNosSeries: Record 52185688;
        MemberApplication: Record 52185691;
        Members: Record 52185700;
        GenderOption: Option "  ",Male,Female;
        msg: Text;
        MobileNo: Text;
        Priority: Integer;
        MemberNo: Code[30];
    begin
        Priority := 205;

        Members.Reset;
        Members.SetRange("Mobile Phone No", '+' + Telephone);
        if Members.FindFirst then begin
            Response := 'You are already a member of Harambee SACCO';
            //EXIT;
        end;

        Members.Reset;
        Members.SetRange("Mobile Phone No", '+' + "Recruited By");
        if Members.FindFirst then begin
            MemberNo := Members."No.";
        end;

        // IF Gender = 'male' THEN
        // GenderOption := GenderOption::Male
        // ELSE
        // GenderOption := GenderOption::Female;
        SkyVirtualMember.Reset;
        SkyVirtualMember.SetRange(Telephone, Telephone);
        if not SkyVirtualMember.FindFirst then begin
            SkyVirtualMember.Init;
            SkyVirtualMember.Telephone := Telephone;
            SkyVirtualMember."ID Number" := "ID No";
            SkyVirtualMember.Names := Names;
            SkyVirtualMember."Date Of Birth" := DOB;
            SkyVirtualMember.Gender := GenderOption;
            //SkyVirtualMember.Citizenship:=Citizenship;
            SkyVirtualMember."Entry Date" := Today;
            SkyVirtualMember."Entry Time" := Time;
            SkyVirtualMember."Referer Member No" := MemberNo;
            //    SkyVirtualMember."Employer Name":=Employer;
            //    SkyVirtualMember."Payroll Number":=PayrollNumber;

            SkyVirtualMember."Session ID" := SessionID;
            SkyVirtualMember.Email := Email;
            SkyVirtualMember."Service Number" := "Service Number";
            SkyVirtualMember.Employer := Employer;
            SkyVirtualMember."Reffered By" := "Recruited By";

            SkyVirtualMember."Name on IPRS" := NameOnIPRS;

            if Gender = 'MALE' then begin
                SkyVirtualMember.Gender := SkyVirtualMember.Gender::Male;
            end
            else begin
                SkyVirtualMember.Gender := SkyVirtualMember.Gender::Female;
            end;

            SkyVirtualMember.Insert(true);

            msg := 'Dear ' + Names + ', your virtual member application has been received successfully. Download registration form from www.harambeesacco.com' +
            NewLine + 'Request ID: ' + SessionID;
            MobileNo := Telephone;
            SendSmsWithID(Source::MBANKING, MobileNo, msg, Format(Names), '', true, Priority, false, 'CBS', Format(SkyVirtualMember."Entry No"), 'CBS');


            Members.Reset;
            Members.SetRange("Mobile Phone No", '+' + "Recruited By");
            if Members.FindFirst then begin
                MobileNo := "Recruited By";
                msg := 'Dear ' + Members.Name + ', we have received ' + Names + '''s (' + Telephone + ') request for virtual member registration.' + NewLine + 'Request ID: ' + SessionID;
                SendSmsWithID(Source::MBANKING, MobileNo, msg, Format(Names), '', true, Priority, false, 'CBS', Format(SkyVirtualMember."Entry No"), 'CBS');
            end;

            Response := 'Success';
        end
        else begin
            Response := 'Error: Your application already exists';
        end;
    end;


    procedure CreateBusinessAcount(PhoneNumber: Text[13]; BusinessName: Text[50]; BusinessLocation: Text[50]) Response: Text
    var
        Members: Record 52185700;
        SavingsAccounts: Record 52185730;
        SkyBusinessAccounts: Record 52185500;
        ProductFactory: Record 52185690;
        SuffixText: Code[30];
        SkyUSSDAuth: Record 52185476;
        AccountNo: Code[30];
        SavingsAcc: Record 52185730;
        AvailableAccounts: Integer;
        BusinessAcountNo: Code[30];
        MemberNo: Code[30];
        msg: Text;
        AccBal: Decimal;
        JTemplate: Code[10];
        JBatch: Code[10];
        Dim1: Code[10];
        Dim2: Code[10];
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal,"Penalty Due","Penalty Paid";
        BalAccNo: Code[20];
        BusinessProdCode: Code[30];
        BusinessAccountCode: Code[30];
    begin
        ProductFactory.Reset;
        ProductFactory.SetRange("Product Category", ProductFactory."product category"::"Business Account");
        if ProductFactory.FindFirst then BusinessProdCode := ProductFactory."Product ID";

        PhoneNumber := '+' + PhoneNumber;
        SkyUSSDAuth.Reset;
        SkyUSSDAuth.SetRange("Mobile No.", PhoneNumber);
        if SkyUSSDAuth.FindFirst then begin
            AccountNo := SkyUSSDAuth."Account No.";
            if SavingsAccounts.Get(AccountNo) then begin
                MemberNo := SavingsAccounts."Member No.";
                Members.Get(SavingsAccounts."Member No.");
                if Members.Status <> Members.Status::Active then begin
                    Response := 'Member not active';
                    exit;
                end;
            end;
        end;

        //Confirm FOSA account balance
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange("Product Type", '505');
        SavingsAccounts.SetRange("Member No.", MemberNo);
        if SavingsAccounts.FindFirst then begin
            AccBal := GetAccountBalance(SavingsAccounts."No.");
            if AccBal < ProductFactory."Minimum Amt B/s Accnt" then begin
                Response := 'Dear member, your application for a business account has FAILED. You have insufficient balance in your FOSA Savings Account.' +
                ' Kindly deposit KES ' + Format(ProductFactory."Minimum Amt B/s Accnt") + ' and try again.';
                exit;
            end;
        end;

        Members.Get(MemberNo);

        if ProductFactory.Get(BusinessProdCode) then begin

            SavingsAccounts.Reset;
            SavingsAccounts.SetRange("Product Type", ProductFactory."Product ID");
            SavingsAccounts.SetRange("Member No.", Members."No.");
            if SavingsAccounts.FindFirst then begin
                AvailableAccounts := SavingsAccounts.Count();
                Response := 'You already have a bussiness account. Acc no: ' + SavingsAccounts."Business Account Code";
                exit;
            end;

            SuffixText := ProductFactory."Account No. Suffix";
            BusinessAcountNo := ProductFactory."Account No. Prefix" + Members."No." + SuffixText + '0' + Format(AvailableAccounts + 1);
            BusinessAccountCode := CreateBusinessAccountCode;

            SavingsAcc.Init;
            SavingsAcc."Business Account Code" := BusinessAccountCode;
            SavingsAcc."No." := BusinessAcountNo;
            SavingsAcc.Validate(SavingsAcc.Name, BusinessName);
            SavingsAcc."ID No." := Members."ID No.";
            SavingsAcc."Passport No." := Members."Passport No.";
            SavingsAcc."Customer Posting Group" := ProductFactory."Product Posting Group";
            SavingsAcc.County := Members.City;
            SavingsAcc."Phone No." := Members."Phone No.";
            SavingsAcc."Mobile Phone No" := Members."Mobile Phone No";
            SavingsAcc."Current Address" := Members."Current Address";
            SavingsAcc."Post Code" := Members."Post Code";
            SavingsAcc.City := Members.City;
            SavingsAcc.Status := SavingsAcc.Status::Active;
            SavingsAcc."Country/Region Code" := Members.Nationality;
            SavingsAcc."Home Address" := Members."Home Address";
            SavingsAcc."Registration Date" := Today;
            SavingsAcc."Recruited by Type" := Members."Recruited by Type";
            SavingsAcc."Relationship Manager" := Members."Relationship Manager";
            SavingsAcc."Date of Birth" := Members."Date of Birth";
            SavingsAcc."Birth Certificate No." := Members."Birth Certificate No.";
            SavingsAcc."Payroll/Staff No." := Members."Payroll/Staff No.";
            //SavingsAcc."Recruited By":='HARAMBEESACCO\MBANKING';
            SavingsAcc.Gender := Members.Gender;
            SavingsAcc."Member Category" := Members."Member Category";
            SavingsAcc."Marital Status" := Members."Marital Status";
            SavingsAcc."Old Member No." := Members."Old Member No.";
            SavingsAcc."Associated Member No." := Members."Associated Member No.";
            SavingsAcc."Responsibility Center" := Members."Responsibility Center";
            SavingsAcc."Company Registration No." := Members."Company Registration No.";
            SavingsAcc."Employer Code" := Members."Employer Code";
            SavingsAcc."Single Party/Multiple/Business" := Members."Single Party/Multiple";
            SavingsAcc."Global Dimension 1 Code" := Members."Global Dimension 1 Code";
            SavingsAcc."Global Dimension 2 Code" := Members."Global Dimension 2 Code";
            SavingsAcc."Group Account No" := Members."Group Account No.";
            SavingsAcc."Created By" := 'HARAMBEESACCO\MBANKING';
            SavingsAcc."Loan Disbursement Account" := false;
            SavingsAcc."Product Category" := SavingsAcc."product category"::"Business Account";
            SavingsAcc."Product Type" := ProductFactory."Product ID";
            SavingsAcc."Product Name" := ProductFactory."Product Description";
            SavingsAcc."Member No." := Members."No.";
            SavingsAcc.Status := SavingsAcc.Status::Active;
            SavingsAcc.Insert;

            SkyBusinessAccounts.Init;
            SkyBusinessAccounts."Member No" := Members."No.";
            SkyBusinessAccounts."Account No" := BusinessAcountNo;
            SkyBusinessAccounts.Status := SkyBusinessAccounts.Status::Active;
            SkyBusinessAccounts."Business Name" := BusinessName;
            SkyBusinessAccounts."Business Location" := BusinessLocation;
            SkyBusinessAccounts."Application Date" := CurrentDatetime;
            SkyBusinessAccounts."Bussiness Code" := BusinessAccountCode;
            SkyBusinessAccounts.Insert;

            Commit;

            //Deposit Money
            JTemplate := 'RECEIPT';
            JBatch := 'SKYWORLD';
            Dim1 := SavingsAcc."Global Dimension 1 Code";
            Dim2 := SavingsAccounts."Global Dimension 2 Code";

            SaccoTrans.JournalInsert(JTemplate, JBatch, BusinessAcountNo, Today, Accttype::Savings, AccountNo, CopyStr('Business Account Opening', 1, 50), Balacctype::"G/L Account",
                                    '', ProductFactory."Minimum Amt B/s Accnt", BusinessAcountNo, '', TransType, Dim1, Dim2, true);

            SaccoTrans.JournalInsert(JTemplate, JBatch, BusinessAcountNo, Today, Accttype::Savings, BusinessAcountNo, CopyStr('Business Account Opening', 1, 50), Balacctype::"G/L Account",
                                  '', ProductFactory."Minimum Amt B/s Accnt" * -1, BusinessAcountNo, '', TransType, Dim1, Dim2, true);

            SaccoTrans.PostJournal(JTemplate, JBatch);

            msg := 'Dear Member, your Business Account ' + BusinessName + ' has been created and activated successfully.' +
              ' Kindly advise your clients to make payments to your Business A/C using Paybill ' + PaybillNo + ', A/C No: ' +
              BusinessAccountCode + '. For help ' + HelpDesk;

            SendSmsWithID(Source::MBANKING, PhoneNumber, msg, Format(SavingsAcc.Name), '', true, 205, false, 'CBS', Format(PhoneNumber), 'CBS');
            Response := 'Dear member, your application for a business account has been COMPLETED SUCCESSFULLY';


        end;
    end;


    procedure CreateSavingsAcounts(PhoneNumber: Text[13]; AccountName: Text[100]; BusinessLocation: Text[50]; ProductCode: Text[50]; DateOfBirth: Date; BirthCertificateNumber: Code[50]; Gender: Text[10]; STOAmount: Decimal) Response: Text
    var
        Members: Record 52185700;
        SavingsAccounts: Record 52185730;
        SkyBusinessAccounts: Record 52185500;
        ProductFactory: Record 52185690;
        SuffixText: Code[30];
        SkyUSSDAuth: Record 52185476;
        AccountNo: Code[30];
        SavingsAcc: Record 52185730;
        AvailableAccounts: Integer;
        NewAcountNo: Code[30];
        MemberNo: Code[30];
        msg: Text;
        AccBal: Decimal;
        JTemplate: Code[10];
        JBatch: Code[10];
        Dim1: Code[10];
        Dim2: Code[10];
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal,"Penalty Due","Penalty Paid";
        BalAccNo: Code[20];
        BusinessAccountCode: Code[30];
        BusinessAccount: Boolean;
        TotoSavings: Boolean;
        FixedDeposit: Boolean;
        SeriesSetup: Record 52185781;
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        StandingOrderHeader: Record 52185717;
        STONo: Code[50];
        UserSetUp: Record "User Setup";
        STOInserted: Boolean;
        StandingOrderLines: Record 52185718;
        Frequency: DateFormula;
        STOLinesInserted: Boolean;
        OneYearChallange: Boolean;
    begin
        BusinessAccount := false;
        TotoSavings := false;
        FixedDeposit := false;
        if ProductFactory.Get(ProductCode) then begin
            if ProductFactory."Product Category" = ProductFactory."product category"::"Business Account" then
                BusinessAccount := true;
            if ProductFactory."Product Category" = ProductFactory."product category"::"Junior Savings" then
                TotoSavings := true;
            if ProductFactory."Product Category" = ProductFactory."product category"::"Fixed Deposit" then
                FixedDeposit := true;
            if ProductFactory."Product ID" = '514' then
                OneYearChallange := true;
        end else begin
            Response := 'Product code not found';
            exit;
        end;
        PhoneNumber := '+' + PhoneNumber;
        SkyUSSDAuth.Reset;
        SkyUSSDAuth.SetRange("Mobile No.", PhoneNumber);
        if SkyUSSDAuth.FindFirst then begin
            AccountNo := SkyUSSDAuth."Account No.";
            if SavingsAccounts.Get(AccountNo) then begin
                MemberNo := SavingsAccounts."Member No.";
                Members.Get(SavingsAccounts."Member No.");
                if Members.Status <> Members.Status::Active then begin
                    Response := 'Member not active';
                    exit;
                end;
            end;
        end;



        if BusinessAccount then begin
            //Confirm FOSA account balance
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange("Product Type", '505');
            SavingsAccounts.SetRange("Member No.", MemberNo);
            if SavingsAccounts.FindFirst then begin
                AccBal := GetAccountBalance(SavingsAccounts."No.");
                if AccBal < ProductFactory."Minimum Amt B/s Accnt" then begin
                    Response := 'Dear member, your application for a business account has FAILED. You have insufficient balance in your FOSA Savings Account.' +
                    ' Kindly deposit KES ' + Format(ProductFactory."Minimum Amt B/s Accnt") + ' and try again.';
                    exit;
                end;
            end;
        end;

        Members.Get(MemberNo);

        if ProductFactory.Get(ProductCode) then begin

            SavingsAccounts.Reset;
            SavingsAccounts.SetRange("Product Type", ProductFactory."Product ID");
            SavingsAccounts.SetRange("Member No.", Members."No.");
            if SavingsAccounts.FindFirst then begin
                AvailableAccounts := SavingsAccounts.Count();
                if BusinessAccount then begin
                    Response := 'You already have a business account. Acc no: ' + SavingsAccounts."Business Account Code";
                    exit;
                end;
                if OneYearChallange then begin
                    Response := 'You already have a 52 weeks challange account. Acc no: ' + SavingsAccounts."No.";
                    exit;
                end;
            end;
            SuffixText := ProductFactory."Account No. Suffix";
            NewAcountNo := ProductFactory."Account No. Prefix" + Members."No." + SuffixText + Format(AvailableAccounts + 1);
            if OneYearChallange then
                NewAcountNo := ProductFactory."Account No. Prefix" + Members."No." + SuffixText;

            if BusinessAccount then
                BusinessAccountCode := CreateBusinessAccountCode;

            SavingsAcc.Init;
            SavingsAcc."Business Account Code" := BusinessAccountCode;
            SavingsAcc."No." := NewAcountNo;
            SavingsAcc.Validate(SavingsAcc.Name, AccountName);
            if (FixedDeposit) or (OneYearChallange) then
                SavingsAcc.Validate(SavingsAcc.Name, Members.Name);
            SavingsAcc."ID No." := Members."ID No.";
            SavingsAcc."Passport No." := Members."Passport No.";
            SavingsAcc."Customer Posting Group" := ProductFactory."Product Posting Group";
            SavingsAcc.County := Members.City;
            SavingsAcc."Phone No." := Members."Phone No.";
            SavingsAcc."Mobile Phone No" := Members."Mobile Phone No";
            SavingsAcc."Current Address" := Members."Current Address";
            SavingsAcc."Post Code" := Members."Post Code";
            SavingsAcc.City := Members.City;
            SavingsAcc.Status := SavingsAcc.Status::Active;
            SavingsAcc."Country/Region Code" := Members.Nationality;
            SavingsAcc."Home Address" := Members."Home Address";
            SavingsAcc."Registration Date" := Today;
            SavingsAcc."Recruited by Type" := Members."Recruited by Type";
            SavingsAcc."Relationship Manager" := Members."Relationship Manager";


            SavingsAcc."Date of Birth" := Members."Date of Birth";
            SavingsAcc."Birth Certificate No." := Members."Birth Certificate No.";
            SavingsAcc.Gender := Members.Gender;
            SavingsAcc."Marital Status" := Members."Marital Status";
            if TotoSavings then begin
                SavingsAcc."Date of Birth" := DateOfBirth;
                SavingsAcc."Birth Certificate No." := BirthCertificateNumber;
                if Gender = 'male' then
                    SavingsAcc.Gender := SavingsAcc.Gender::Male
                else
                    SavingsAcc.Gender := SavingsAcc.Gender::Female;
                SavingsAcc."Marital Status" := SavingsAccounts."marital status"::Single;
                SavingsAcc."Product Category" := SavingsAcc."product category"::"Junior Savings";
                SavingsAcc."ID No." := BirthCertificateNumber;
            end;
            if BusinessAccount then
                SavingsAcc."Product Category" := SavingsAcc."product category"::"Business Account";
            if FixedDeposit then
                SavingsAcc."Product Category" := SavingsAcc."product category"::"Fixed Deposit";


            SavingsAcc."Payroll/Staff No." := Members."Payroll/Staff No.";
            SavingsAcc."Member Category" := Members."Member Category";
            SavingsAcc."Old Member No." := Members."Old Member No.";
            SavingsAcc."Associated Member No." := Members."Associated Member No.";
            SavingsAcc."Responsibility Center" := Members."Responsibility Center";
            SavingsAcc."Company Registration No." := Members."Company Registration No.";
            SavingsAcc."Employer Code" := Members."Employer Code";
            SavingsAcc."Single Party/Multiple/Business" := Members."Single Party/Multiple";
            SavingsAcc."Global Dimension 1 Code" := Members."Global Dimension 1 Code";
            SavingsAcc."Global Dimension 2 Code" := Members."Global Dimension 2 Code";
            SavingsAcc."Group Account No" := Members."Group Account No.";
            SavingsAcc."Created By" := UserId;
            SavingsAcc."Loan Disbursement Account" := false;
            SavingsAcc."Product Type" := ProductFactory."Product ID";
            SavingsAcc."Product Name" := ProductFactory."Product Description";
            SavingsAcc."Member No." := Members."No.";
            SavingsAcc.Status := SavingsAcc.Status::Active;
            SavingsAcc.Insert;

            if BusinessAccount then begin
                SkyBusinessAccounts.Init;
                SkyBusinessAccounts."Member No" := Members."No.";
                SkyBusinessAccounts."Account No" := NewAcountNo;
                SkyBusinessAccounts.Status := SkyBusinessAccounts.Status::Active;
                SkyBusinessAccounts."Business Name" := AccountName;
                SkyBusinessAccounts."Business Location" := BusinessLocation;
                SkyBusinessAccounts."Application Date" := CurrentDatetime;
                SkyBusinessAccounts."Bussiness Code" := BusinessAccountCode;
                SkyBusinessAccounts.Insert;
            end;

            Commit;


            if TotoSavings then begin
                SeriesSetup.Get;
                SeriesSetup.TestField(SeriesSetup."Standing Order Nos.");
                // NoSeriesMgt.InitSeries(SeriesSetup."Standing Order Nos.", StandingOrderHeader."No. Series", 0D, STONo, StandingOrderHeader."No. Series");

                StandingOrderHeader.Init;
                StandingOrderHeader."No." := STONo;
                StandingOrderHeader."Application Date" := Today;
                StandingOrderHeader."Created By" := UserId;
                UserSetUp.Reset;
                UserSetUp.SetRange(UserSetUp."User ID", UserId);
                if UserSetUp.FindFirst then begin
                    StandingOrderHeader."Global Dimension 1 Code" := UserSetUp."Global Dimension 1 Code";
                    StandingOrderHeader."Global Dimension 2 Code" := UserSetUp."Global Dimension 2 Code";
                end;
                StandingOrderHeader."Income Type" := StandingOrderHeader."income type"::Salary;
                StandingOrderHeader."Transaction Type" := 'STANDING ORDER';
                StandingOrderHeader."Source Account Type" := StandingOrderHeader."source account type"::Savings;
                StandingOrderHeader."Source Account No." := AccountNo;
                StandingOrderHeader.Validate("Source Account No.");
                StandingOrderHeader.Description := 'Auto-USSD STO on TOTO Junior Acct. opening';
                StandingOrderHeader.Amount := STOAmount;
                StandingOrderHeader.Status := StandingOrderHeader.Status::Approved;
                StandingOrderHeader."Effective/Start Date" := Today;
                Evaluate(Frequency, '1M');
                StandingOrderHeader."Frequency (Months)" := Frequency;
                StandingOrderHeader.Validate("Frequency (Months)");
                if StandingOrderHeader.Insert then
                    STOInserted := true;

                StandingOrderLines.Reset;
                StandingOrderLines.SetRange("Document No.", STONo);
                if StandingOrderLines.FindFirst then
                    StandingOrderLines.DeleteAll;

                StandingOrderLines.Init;
                StandingOrderLines."Destination Account Type" := StandingOrderLines."destination account type"::Internal;
                StandingOrderLines."Destination Account No." := NewAcountNo;
                StandingOrderLines."Document No." := STONo;
                StandingOrderLines.Amount := STOAmount;
                StandingOrderLines.Validate("Destination Account Type");
                StandingOrderLines.Validate("Destination Account No.");
                if StandingOrderLines.Insert then
                    STOLinesInserted := true;
            end;

            if BusinessAccount then begin
                //Deposit Money
                JTemplate := 'RECEIPT';
                JBatch := 'SKYWORLD';
                Dim1 := SavingsAcc."Global Dimension 1 Code";
                Dim2 := SavingsAccounts."Global Dimension 2 Code";

                SaccoTrans.JournalInsert(JTemplate, JBatch, NewAcountNo, Today, Accttype::Savings, AccountNo, CopyStr('Business Account Opening', 1, 50), Balacctype::"G/L Account",
                                        '', ProductFactory."Minimum Amt B/s Accnt", NewAcountNo, '', TransType, Dim1, Dim2, true);

                SaccoTrans.JournalInsert(JTemplate, JBatch, NewAcountNo, Today, Accttype::Savings, NewAcountNo, CopyStr('Business Account Opening', 1, 50), Balacctype::"G/L Account",
                                      '', ProductFactory."Minimum Amt B/s Accnt" * -1, NewAcountNo, '', TransType, Dim1, Dim2, true);

                SaccoTrans.PostJournal(JTemplate, JBatch);

            end;


            FName := Members."First Name";
            if FName = '' then
                FName := Members."Second Name";

            Response := 'Dear ' + FirstName(FName) + ', your application for a ' + ProductFactory."Product Description" + ' has been completed successfully';
            if OneYearChallange then begin
                msg := 'Dear ' + FirstName(FName) + ', your ' + ProductFactory."Product Description" + ' account has been created and activated successfully.' +
                ', A/C No: ' + NewAcountNo + '. For help ' + HelpDesk;

                SendSmsWithID(Source::MBANKING, PhoneNumber, msg, Format(SavingsAcc.Name), '', true, 205, false, 'CBS', Format(PhoneNumber), 'CBS');
            end;
        end;
    end;


    procedure CreatInsuranceEntry(SessionID: Text; "Phone Number": Text; Names: Text; Purpose: Text; Email: Text) Response: Text
    var
        SkyVirtualMember: Record 52185499;
        CreditNosSeries: Record 52185688;
        MemberApplication: Record 52185691;
        Members: Record 52185700;
        GenderOption: Option "  ",Male,Female;
        msg: Text;
        MobileNo: Text;
        Priority: Integer;
        SkyInsurance: Record 52185502;
    begin
        Priority := 205;
        SkyInsurance.Reset;
        SkyInsurance.SetRange("Phone Number", "Phone Number");
        SkyInsurance.SetRange(Purpose, Purpose);
        if not SkyInsurance.FindFirst then begin
            SkyInsurance.Init;
            SkyInsurance."Phone Number" := "Phone Number";
            SkyInsurance.Names := Names;
            SkyInsurance."Entry Date" := Today;
            SkyInsurance."Entry Time" := Time;
            SkyInsurance."Session ID" := SessionID;
            SkyInsurance.Email := Email;
            SkyInsurance.Insert(true);
            Response := 'SUCCESS';
        end else
            Response := 'ERROR: Record Exists';

        msg := 'Dear member, your request on insurance have been received successfully. We will reach out to you as soon as possible. Request ID: ' + SessionID;

        MobileNo := "Phone Number";
        SendSmsWithID(Source::MBANKING, MobileNo, msg, Format(Names), '', true, Priority, false, 'CBS', Format(SkyInsurance."Entry No"), 'CBS');

        Response := 'Success';
    end;


    procedure CreatMortgageEntry(SessionID: Text; ProductType: Text; Names: Text; AgeGroup: Text; SourceOfIncome: Text; GrossMonthlyIncome: Text; CountyOfResidence: Text; PhoneNumber: Text; Email: Text) Response: Text
    var
        SkyVirtualMember: Record 52185499;
        CreditNosSeries: Record 52185688;
        MemberApplication: Record 52185691;
        Members: Record 52185700;
        GenderOption: Option "  ",Male,Female;
        msg: Text;
        MobileNo: Text;
        Priority: Integer;
        SkyMorgage: Record 52185503;
        MemberNo: Code[30];
    begin
        Members.Reset;
        Members.SetRange("Mobile Phone No", '+' + PhoneNumber);
        if Members.FindFirst then
            MemberNo := Members."No.";

        if MemberNo = '' then
            Members.Reset;
        Members.SetRange("Phone No.", '+' + PhoneNumber);
        if Members.FindFirst then
            MemberNo := Members."No.";

        Priority := 205;
        SkyMorgage.Reset;
        SkyMorgage.SetRange("Phone Number", PhoneNumber);
        SkyMorgage.SetRange("Product Type", ProductType);
        if not SkyMorgage.FindFirst then begin
            SkyMorgage.Init;
            SkyMorgage."Product Type" := ProductType;
            SkyMorgage."Age Group" := AgeGroup;
            SkyMorgage."Source Of Income" := SourceOfIncome;
            SkyMorgage."Gross Monthly Income" := GrossMonthlyIncome;
            SkyMorgage."County Of Residence" := CountyOfResidence;
            SkyMorgage."Phone Number" := PhoneNumber;
            SkyMorgage."Full Name" := Names;
            SkyMorgage."Entry Date" := Today;
            SkyMorgage."Entry Time" := Time;
            SkyMorgage."Session ID" := SessionID;
            SkyMorgage.Email := Email;
            SkyMorgage."Member Number" := MemberNo;
            SkyMorgage.Insert(true);
            Response := 'SUCCESS';
        end else
            Response := 'ERROR: Record Exists';

        msg := 'Dear member, your request on mortgage have been received successfully. We will reach out to you as soon as possible. Request ID: ' + SessionID;

        MobileNo := PhoneNumber;
        SendSmsWithID(Source::MBANKING, MobileNo, msg, Format(Names), '', true, Priority, false, 'CBS', Format(SkyMorgage."Entry No"), 'CBS');

        Response := 'Success';
    end;


    procedure GetBusinessAccounts(PhoneNumber: Text[13]) Response: Text
    var
        SkyUSSDAuth: Record 52185476;
        SavingsAccounts: Record 52185730;
        SavAccount: Record 52185730;
        BusinessAccounts: Record 52185500;
        BusinessProdCode: Code[30];
        ProductFactory: Record 52185690;
    begin
        ProductFactory.Reset;
        ProductFactory.SetRange("Product Category", ProductFactory."product category"::"Business Account");
        if ProductFactory.FindFirst then BusinessProdCode := ProductFactory."Product ID";

        SkyUSSDAuth.Reset;
        SkyUSSDAuth.SetRange("Mobile No.", '+' + PhoneNumber);
        if SkyUSSDAuth.FindFirst then begin
            SavingsAccounts.Get(SkyUSSDAuth."Account No.");
            Response := '<Accounts>';
            SavAccount.Reset;
            SavAccount.SetRange("Member No.", SavingsAccounts."Member No.");
            SavAccount.SetRange("Product Type", BusinessProdCode);
            if SavAccount.FindFirst then begin
                SavAccount.CalcFields(Balance);
                repeat
                    //        BusinessAccounts.RESET;
                    //        BusinessAccounts.SETRANGE("Account No", SavAccount."No.");
                    //        IF BusinessAccounts.FINDFIRST THEN BEGIN
                    Response += '<Account>';
                    Response += '<AccountNo>' + SavAccount."Business Account Code" + '</AccountNo>';
                    Response += '<AccountName>' + SavAccount.Name + '</AccountName>';
                    Response += '<AccountStatus>' + Format(SavAccount.Status) + '</AccountStatus>';
                    Response += '<Balance>' + Format(SavAccount.Balance) + '</Balance>';
                    Response += '</Account>';
                //        END;
                until SavAccount.Next = 0;
            end else
                Response := 'Record Not Found';
            Response += '</Accounts>'
        end else
            Response := 'Record Not Found';
    end;


    procedure GetBusinessAccountDetails(PhoneNumber: Text[13]; AccountNumber: Text) Response: Text
    var
        SkyUSSDAuth: Record 52185476;
        SavingsAccounts: Record 52185730;
        SavAccount: Record 52185730;
        BusinessAccounts: Record 52185500;
        msg: Text;
        ProductFactory: Record 52185690;
        BusinessProdCode: Code[30];
    begin
        ProductFactory.Reset;
        ProductFactory.SetRange("Product Category", ProductFactory."product category"::"Business Account");
        if ProductFactory.FindFirst then BusinessProdCode := ProductFactory."Product ID";


        SkyUSSDAuth.Reset;
        SkyUSSDAuth.SetRange("Mobile No.", '+' + PhoneNumber);
        if SkyUSSDAuth.FindFirst then begin
            SavingsAccounts.Get(SkyUSSDAuth."Account No.");
            Response := '';
            SavAccount.Reset;
            SavAccount.SetRange("Member No.", SavingsAccounts."Member No.");
            SavAccount.SetRange("Product Type", BusinessProdCode);
            SavAccount.SetRange("Business Account Code", AccountNumber);
            if SavAccount.FindFirst then begin
                SavAccount.CalcFields(Balance);
                //      BusinessAccounts.RESET;
                //      BusinessAccounts.SETRANGE("Account No", SavAccount."No.");
                //      IF BusinessAccounts.FINDFIRST THEN BEGIN
                Response += '<Account>';
                Response += '<AccountNo>' + SavAccount."Business Account Code" + '</AccountNo>';
                Response += '<AccountName>' + SavAccount.Name + '</AccountName>';
                Response += '<AccountStatus>' + Format(SavAccount.Status) + '</AccountStatus>';
                Response += '<Balance>' + Format(SavAccount.Balance) + '</AccountStatus>';
                Response += '</Account>';
                //      END;
                msg := 'Savings account creation successful';
                SendSmsWithID(Source::MBANKING, PhoneNumber, msg, Format(SavAccount.Name), '', true, Priority, false, 'CBS', Format(PhoneNumber), 'CBS');
            end else
                Response := 'Record Not Found';
        end else
            Response := 'Record Not Found';
    end;


    procedure CreateBusinessAccountCode(): Text
    var
        ProductFactory: Record 52185690;
        SavingsAccounts: Record 52185730;
        Pin: Code[10];
        BusinessProdCode: Code[30];
    begin
        ProductFactory.Reset;
        ProductFactory.SetRange("Product Category", ProductFactory."product category"::"Business Account");
        if ProductFactory.FindFirst then begin
            BusinessProdCode := ProductFactory."Product ID";
            Pin := ProductFactory."Bussiness Acc Prefix" + RandomPIN + ProductFactory."Business Acc Surfix";
            while CheckIfCodeExists(Pin) do begin
                Pin := ProductFactory."Bussiness Acc Prefix" + RandomPIN + ProductFactory."Business Acc Surfix";
            end;
        end;
        exit(Pin);
    end;

    local procedure CheckIfCodeExists(BusCode: Text): Boolean
    var
        SavingsAccounts: Record 52185730;
    begin
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange("Business Account Code", BusCode);
        if SavingsAccounts.FindFirst then
            exit(true)
        else
            exit(false);
    end;

    local procedure CreditBusinessAccounts()
    var
        Sav: Record 52185730;
        msg: Text;
        OdiAccount: Record 52185730;
        PhoneNumber: Text;
        SkyBusinessAccounts: Record 52185500;
        SessionID: Code[30];
        Product: Record 52185690;
        SkySMSMessages: Record 52185478;
        ProductFactory: Record 52185690;
        BusinessProdCode: Code[30];
        JTemplate: Code[10];
        JBatch: Code[10];
        Dim1: Code[10];
        Dim2: Code[10];
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal,"Penalty Due","Penalty Paid";
        FOSA: Record 52185730;
        FosaBal: Decimal;
        SkyMbanking: Codeunit "Sky Mbanking";
        Amount: Decimal;
    begin
        Product.Reset;
        Product.SetRange("Product Category", Product."product category"::"Business Account");
        if Product.FindFirst then begin
            Sav.Reset;
            Sav.SetRange("Product Type", Product."Product ID");
            Sav.SetRange(Status, Sav.Status::Active);
            Sav.SetFilter(Balance, '<%1', Product."Minimum Amt B/s Accnt");
            if Sav.FindFirst then begin
                repeat
                    JTemplate := 'RECEIPT';
                    JBatch := 'SKYWORLD';
                    Dim1 := Sav."Global Dimension 1 Code";
                    Dim2 := Sav."Global Dimension 2 Code";

                    Sav.CalcFields(Balance);

                    FOSA.Reset;
                    FOSA.SetRange("Member No.", Sav."Member No.");
                    FOSA.SetRange("Product Type", '505');
                    if FOSA.FindFirst then begin
                        FosaBal := SkyMbanking.GetAccountBalance(FOSA."No.");
                        Amount := Product."Minimum Amt B/s Accnt" - Sav.Balance;

                        if Amount > FosaBal then Amount := FosaBal;



                        SaccoTrans.InitJournal(JTemplate, JBatch);

                        SaccoTrans.JournalInsert(JTemplate, JBatch, Sav."No.", Today, Accttype::Savings, FOSA."No.", CopyStr('Business Account Opening', 1, 50), Balacctype::"G/L Account",
                                                '', Amount, Sav."No.", '', TransType, Dim1, Dim2, true);

                        SaccoTrans.JournalInsert(JTemplate, JBatch, Sav."No.", Today, Accttype::Savings, Sav."No.", CopyStr('Business Account Opening', 1, 50), Balacctype::"G/L Account",
                                              '', Amount * -1, Sav."No.", '', TransType, Dim1, Dim2, true);

                        SaccoTrans.PostJournal(JTemplate, JBatch);

                    end;
                until Sav.Next = 0;
            end;
        end;

        // msg := 'Dear Member, your Business Account '+BusinessName+' has been created and activated successfully. Kindly advise your clients to make payments to your Business '+
        //  'A/C using Paybill '+PaybillNo+', A/C No: '+SavingsAcc."Business Account Code"+
        //  '. For help '+HelpDesk;
        //
        //  SendSmsWithID(Source::MBANKING,PhoneNumber,msg,FORMAT(Members.Name),'',TRUE,Priority,FALSE, 'CBS', FORMAT(PhoneNumber), 'CBS');
    end;

    local procedure SMSBusinessAccounts()
    var
        Sav: Record 52185730;
        msg: Text;
        OdiAccount: Record 52185730;
        PhoneNumber: Text;
        SkyBusinessAccounts: Record 52185500;
        SessionID: Code[30];
        Product: Record 52185690;
        SkySMSMessages: Record 52185478;
        ProductFactory: Record 52185690;
        BusinessProdCode: Code[30];
        JTemplate: Code[10];
        JBatch: Code[10];
        Dim1: Code[10];
        Dim2: Code[10];
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal,"Penalty Due","Penalty Paid";
        FOSA: Record 52185730;
        FosaBal: Decimal;
        SkyMbanking: Codeunit "Sky Mbanking";
        Amount: Decimal;
        BusinessAccount: Record 52185730;
    begin
        SkyBusinessAccounts.Reset;
        SkyBusinessAccounts.SetRange("SMS Sent", false);
        if SkyBusinessAccounts.FindFirst then begin
            if Dt2Date(SkyBusinessAccounts."Application Date") = Today then begin
                BusinessAccount.Get(SkyBusinessAccounts."Account No");
                Sav.Reset;
                Sav.SetRange("Member No.", SkyBusinessAccounts."Member No");
                Sav.SetRange("Product Type", '505');
                if Sav.FindFirst then PhoneNumber := Sav."Transactional Mobile No";
                msg := 'Dear Member, your Business Account ' + SkyBusinessAccounts."Business Name" + ' has been created and activated successfully.' +
                ' Kindly advise your clients to make payments to your Business A/C using Paybill ' + PaybillNo + ', A/C No: ' +
                BusinessAccount."Business Account Code" + '. For help ' + HelpDesk;

                SendSmsWithID(Source::MBANKING, PhoneNumber, msg, Format(Sav.Name), '', true, 205, false, 'CBS', Format(PhoneNumber), 'CBS');

                SkyBusinessAccounts."SMS Sent" := true;
                SkyBusinessAccounts.Modify;
            end;
        end;
    end;

    local procedure PostingLog(TransactionID: Text; Stage: Integer)
    var
        LogTimes: Record 52186220;
    begin
        /*LogTimes.INIT;
        LogTimes.ID := TransactionID+'-'+FORMAT(Stage);
        LogTimes."Transaction ID" := TransactionID;
        LogTimes."Log Time" := CURRENTDATETIME;
        LogTimes.Stage := Stage;
        LogTimes.INSERT;
        COMMIT;*/

    end;

    local procedure SplitString(Text: Text; Separator: Text) Token: Text
    var
        Pos: Integer;
    begin
        Pos := StrPos(Text, Separator);
        if Pos > 0 then begin
            Token := CopyStr(Text, 1, Pos - 1);
            if Pos + 1 <= StrLen(Text) then
                Text := CopyStr(Text, Pos + 1)
            else
                Text := '';
        end else begin
            Token := Text;
            Text := '';
        end;
    end;


    procedure GetNumberOfGuarantors(ProductID: Code[30]; AppliedAmount: Decimal) Guarantors: Decimal
    var
        MobileGuarantorsSetup: Record 52186222;
        ProductFactory: Record 52185690;
    begin
        MobileGuarantorsSetup.Reset;
        MobileGuarantorsSetup.SetRange("Product Code", ProductID);
        MobileGuarantorsSetup.SetFilter("Lower Limit", '<%1', AppliedAmount);
        MobileGuarantorsSetup.SetFilter("Upper Limit", '>=%1', AppliedAmount);
        if MobileGuarantorsSetup.FindFirst then
            Guarantors := MobileGuarantorsSetup."No. of Guarantors"
        else begin
            if ProductFactory.Get(ProductID) then begin
                Guarantors := ProductFactory."Mobile Max. Guarantors";
            end;
        end;
    end;


    procedure SalaryThroughFOSA()
    begin
    end;

    local procedure GetTopUpCharges(ProductID: Code[30]; TopUpAmt: Decimal) Charge: Decimal
    var
        ProductFactory: Record 52185690;
        PCharges: Record 52185734;
        TariffDetails: Record 52185777;
        Amt: Decimal;
        ExciseDutyRate: Decimal;
        ExciseDuty: Decimal;
        VendorCommission: Decimal;
    begin
        VendorCommission := 0;

        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Loan Disbursement");
        if CoopSetup.FindFirst then begin
            VendorCommission := CoopSetup."Vendor Commission";
        end;

        ProductFactory.Get(136);

        PCharges.Reset;
        PCharges.SetRange(PCharges."Product Code", ProductID);
        PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"Top up");
        if PCharges.Find('-') then begin
            repeat
                if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                    Amt += (TopUpAmt * (PCharges.Percentage / 100))
                else
                    if PCharges."Charge Method" = PCharges."charge method"::"Flat Amount" then
                        Amt += PCharges."Charge Amount"
                    else
                        if PCharges."Charge Method" = PCharges."charge method"::Staggered then begin

                            PCharges.TestField(PCharges."Staggered Charge Code");

                            TariffDetails.Reset;
                            TariffDetails.SetRange(TariffDetails.Code, PCharges."Staggered Charge Code");
                            if TariffDetails.Find('-') then begin
                                repeat
                                    if (TopUpAmt >= TariffDetails."Lower Limit") and (TopUpAmt <= TariffDetails."Upper Limit") then begin
                                        if TariffDetails."Use Percentage" = true then begin
                                            Amt += TopUpAmt * TariffDetails.Percentage * 0.01;
                                        end
                                        else begin
                                            Amt += TariffDetails."Charge Amount";
                                        end;
                                    end;
                                until TariffDetails.Next = 0;
                            end;
                        end;

                if PCharges.Maximum > 0 then
                    if Amt > PCharges.Maximum then
                        Amt := PCharges.Maximum;

                if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin

                    ExciseDutyRate := GetExciseRate();
                    ExciseDuty += Amt * ExciseDutyRate / 100;
                end;
            until PCharges.Next = 0;
        end;

        Charge := ExciseDuty + Amt + VendorCommission;
    end;


    procedure GetSavingsAccountChallangeNumber(MobileNumber: Text) Response: Text
    var
        SavingsAccounts: Record 52185730;
        AccountNumber: Code[50];
        ProductFactory: Record 52185690;
        SavAcc: Record 52185730;
    begin
        Response := '<DATA>';
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange("Transactional Mobile No", '+' + MobileNumber);
        SavingsAccounts.SetFilter(Status, '<>%1', SavingsAccounts.Status::Deceased);
        if SavingsAccounts.FindFirst then begin
            if ProductFactory.Get('514') then begin
                AccountNumber := ProductFactory."Account No. Prefix" + SavingsAccounts."Member No." + ProductFactory."Account No. Suffix";

                if SavAcc.Get(AccountNumber) then begin
                    Response += '<STATUS>ERROR</STATUS>';
                    Response += '<MESSAGE>You already have this account type</MESSAGE>';
                    Response += '<ACCOUNT_NO>' + AccountNumber + '</ACCOUNT_NO>';
                    Response += '<AMOUNT>0</AMOUNT>';
                end else begin
                    Response += '<STATUS>SUCCESS</STATUS>';
                    Response += '<MESSAGE>Success</MESSAGE>';
                    Response += '<ACCOUNT_NO>' + AccountNumber + '</ACCOUNT_NO>';
                    Response += '<AMOUNT>50</AMOUNT>';
                end;
            end else begin
                Response += '<STATUS>ERROR</STATUS>';
                Response += '<MESSAGE>Product type not found</MESSAGE>';
                Response += '<ACCOUNT_NO>' + AccountNumber + '</ACCOUNT_NO>';
                Response += '<AMOUNT>0</AMOUNT>';
            end;
        end else begin
            Response += '<STATUS>ERROR</STATUS>';
            Response += '<MESSAGE>Account number not found</MESSAGE>';
            Response += '<ACCOUNT_NO>' + AccountNumber + '</ACCOUNT_NO>';
            Response += '<AMOUNT>0</AMOUNT>';
        end;
        Response += '</DATA>';

        exit(Response);
    end;
}

