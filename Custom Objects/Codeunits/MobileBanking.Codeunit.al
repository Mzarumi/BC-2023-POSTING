#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52185465 MobileBanking
{
    // cal


    trigger OnRun()
    var
        msisdn: Text[30];
    begin
        //EmailRequestedStatement;
        //ClearOldTransactions();
        msisdn := '254722578423';
        // MESSAGE(GetDebitableAccounts('254720884815'));
        //MESSAGE(FORMAT(GetAppraisaOrdinaryLoans('+254722658402','113')));
        // msisdnt := '254720884815';
        //msisdntt := '254720335660';
        //PostSalaryAdvanceIILoan();l
        //MESSAGE(GetSalaryInAdvance(msisdn,1));
        //MESSAGE(FORMAT(GetPremierRegFee('070123278','060123278','MJ451R00OD.')));
        //MESSAGE(FORMAT(GetPremierRegFee('070123278','060123278','MJ451R00OD.TEST')));
        //PostSalaryAdvanceLoan();
        //PostUtilityPayment();
        //ATMCardLinking();
        //5050123278000fomatf
        // CreateGuarantors();

        //VirtualRegistrations('+25472985495','10202027','Daniel Arap Troitch','Daniel Arap Troitich',20680101D,'President','KENYA','M','Komothai','','','');

        //MESSAGE(GetBaneficiaryEnquiry(msisdn,'TEST'));
        //MESSAGE(FORMAT(GetLoanQualifiedAmount('254722368794','136')));
        //saccoAccount.RESET;/
        //saccoAccount.SETRANGE("No.",'5050123278000');
        //IF saccoAccount.FIND('-') THEN
        //GetSalaryInAdvance
        //MESSAGE(GetSalaryAdvance(COPYSTR('+254728506463',2,12),24));
        //PostDividendLoan();
        //MESSAGE(FORMAT(GetLoanQualifiedAmount('+254705899805','136')));
        //account := '1234567890';fff
        // ClearOldTransactions()

        //InstantLoanAlerts();
        //PostMBOOSTALoan();
        //ClearTransactions();
        //GetPendingTransLOAactions();
        //MESSAGE(FORMAT(MBoostaRecovery()));
        //PostMobileLoanRepayments('2665203874578_192327');
        //MESSAGE(GetPostedInstantLoans());
        //MESSAGE(MSaccoNewRegistration());
        //MESSAGE(GetBalanceEnquiry(msisdn,account));
        //MESSAGE(MSaccoNewRegistration());
        //PostMobileLoanRepayments();
        //MESSAGE(GetBalanceEnquiry(msisdn,'201708010737')); // PASSED
        // PostDeposits(); / PASSED , KEYWORD NOT TESTED
        //MESSAGE(FORMAT(GetAvailableBalance('060123278'))); //PASSED
        // MESSAGE(GetMinistatement('5050195843000','201703290743')); //PASSED
        //MESSAGE(GetAllAccounts(msisdnt));
        //MESSAGE(GetLoanStatus(msisdn)); // PASSED
        //PostMobileLoanRepayments();
        // MESSAGE(GetAllAccounts(msisdn)); //PASSED
        //MESSAGE(GetDebitableAccounts(msisdn));  //PASSED
        // TRANSFER TO MEMBER DEPOSITS // PASSED
        // TRANSFER TO SHARES CONTRIBUTION // PASSED
        //PostWithdrawals();
        // PostDeposits();
        //GenJournalLine
        //PostDeposits();
        // PostMobileLoanRepayments(); // PASSED
        //MESSAGE(FORMAT(GetAccountBalance('5050195843000')));
        //+254723123456
        //MESSAGE(FORMAT(GetLoanQualifiedAmount(msisdntt,'123')));

        // MESSAGE(CallManualFunctions('10'));
        //InsertMsaccoOtherServices('123377','L01-0000112Nakuru','+254725391340','Request ATM','0','0',CURRENTDATETIME);
        //MESSAGE(MsaccoLoanRepayment('L194834',1000,'801001480200','201701091547'));
        //MESSAGE(MSaccoNewRegistration());

        //CallManualFunctions('1');

        //PostFundsTransfer();

        //CallManualFunctions('1');
        //ATMCardLinking();
        //ChequeBookRequests();
        //BlockATM();
        //MESSAGE(GetDashboardData(msisdn,1)); // MOBILE APP
        //PostWithdrawals();
        //MESSAGE(GetPendingTransactions());
        //MESSAGE(GetCreditableAccounts(msisdn));
        //MESSAGE(GetBalanceEnquiry(msisdn,'12345678909876543'));
        //PostMBOOSTALoan();
        //MESSAGE(AppraiseGuarantors(''));
        //CreateGuarantors();
        //PostSalaryAdvanceIILoan();
        // PostMBOOSTALoanEdited
        //MESSAGE(FORMAT(GetLoanQualifiedAmount('254725992665','140')));
        //MESSAGE(GetCurrentEmail('254725992665'));
        //PostMobileLoanRepayments('8794661947108');
        //MESSAGE(GetGuarantorsInformation('254725992665'));
        // PostSalaryAdvanceIILoan();
        //MESSAGE('tEST %1',GetSalaryAdvance('254724411786',24));
        //MESSAGE('first day of the month'+FORMAT(CALCDATE('<CM>',TODAY)))
        //Test();

        //PostMobileLoan('LN00174828','NI54DRAUB87');

        //MESSAGE('%1',RevenueCollection(20190807D,1));
        //PostFailedDeposits();
        //postmanual();
        //PostMobileLoan('SA_58633','NIQ9U8NK1HH');

        //MESSAGE(FORMAT(GetSaccoBranches()));
        //PostFailedDeposits();//

        //**MESSAGE(FORMAT(MsaccoLoanApplication('finje2~3~yuh~4','5050123278000',30000,'1','121')));
        //PostDividendLoan();
        //CreateGuarantors();

        PostEmergencyLoan();

        PostScoolFeesLoan();
        ///PostFinjeJisortLoans();
        //PostSalaryAdvanceIILoan();
    end;

    var
        No: Text[30];
        saccoAccount: Record 52185730;
        BufferTable: Record 52185755;
        Loans: Record 52185729;
        LoanBalance: Decimal;
        Member: Record 52185730;
        GenJournalLine: Record "Gen. Journal Line";
        GenBatches: Record "Gen. Journal Batch";
        GenLedgerSetup: Record 52185689;
        LineNo: Integer;
        MPesaAccount: Code[50];
        MPesaCharges: Decimal;
        MPesaChargesAccount: Code[50];
        MPESAPaybill: Code[50];
        Charges: Record 52185774;
        TotalCharges: Decimal;
        TariffHeader: Record 52185777;
        TariffDetails: Record 52185777;
        TariffCharges: Decimal;
        AmountToCharge: Decimal;
        ATMTrans: Record 52185755;
        ///GLPosting: Codeunit "Gen. Jnl.-Post Line";
        Transtype: Text[30];
        description: Text[150];
        transdate: Date;
        account: Text[30];
        Amount: Integer;
        Accounttypes: Record 52185690;
        MiniBalance: Decimal;
        MpesaApplications: Record 52185757;
        LoanProcess: Codeunit "Loans Process";
        plus: Text[30];
        smses: Record 52185764;
        RunBal: Decimal;
        AccBalance: Decimal;
        source: Code[10];
        Lastenquiry: Integer;
        Venderdetails: Record 52185732;
        minicount: Integer;
        Docno: Code[20];
        Msaccocharge: Decimal;
        Msaccoacc: Code[20];
        MsaccoTransactions: Record 52185770;
        Exceciseduty: Decimal;
        Interest: Decimal;
        LoanType: Record 52185685;
        PostAtm: Codeunit "HR Leave Jnl.- Check Line";
        Loankeywords: Record 52185756;
        TRAmount: Decimal;
        Sendsms: Codeunit SendSms;
        loanno: Code[20];
        LoanAppForm2: Record 52185729;
        LoanAppForm: Record 52185729;
        MPESATRANS1: Record 52185759;
        MPESATRANS: Record 52185759;
        POSTMPESATransactions: Codeunit "HR Leave Jnl Management";
        MpesaAppNo: Text;
        datelimit: Date;
        memberNumber: Text;
        ProdFac: Record 52185690;
        AcctNo: Code[50];
        maxLimit: Decimal;
        SharesAccount: Code[20];
        PostATMtrans: Codeunit "POST ATM Transactions";
        ExciseDutyGL: Text[50];
        UtilityPaymentsGL: Text[50];
        MsaccoServices: Record 52185762;
        SaccoAccMemberNo: Text[30];
        LoanDed: Record 52185729;
        TotSalarieies: Decimal;
        AverageSal: Decimal;
        QualifyingbeforeDed: Decimal;
        QualifyingAfterDed: Decimal;
        NoOfEntriesExisting: Integer;
        TotLoanDed: Decimal;
        TotSTOs: Decimal;
        Minimum: Decimal;
        Maximum: Decimal;
        CurrSal: array[3] of Decimal;
        PeriodStartDate: array[5] of Date;
        NoOfEntries: Integer;
        OutsInt: Decimal;
        GenSetUp: Record 52185689;
        MSACCORegistrations: Record 52185763;
        DepositsAccount: Code[20];
        SMSAlertsAccount: Text[30];
        MSACCOLoanApp: Record 52185761;
        SMSALERTS: Record 52185764;
        POSTJOURNAL: Codeunit "Journal Posting";
        saccoAccountBOSA: Record 52185730;
        MpesaAppD: Record 52185758;
        MApps: Record 52185763;
        Accounts: Record 52185730;
        MsaccoGuarantors: Record 52185767;
        MsaccoLoans: Record 52185761;
        OptionsAccounts: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        OptionTransactionTypes: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills;
        OptionSMS: Option "Membership Approval","Savings Approval","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Guarantors","Loan Posted","Loan defaulted","Salary Posted","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO;
        MsaccoChargesSetup: Record 52185772;
        msisdnt: Text;
        DateExpression: Text[20];
        DashboardDataFilter: Date;
        SalBuffer: Record 52185784;
        Continue: Boolean;
        DefaultedAmount: Decimal;
        monthlydeduction: Decimal;
        StandingOrders: Record 52185717;
        TotalDeductions: Decimal;
        OutstandingAmount: Decimal;
        CreditAccounts: Record 52185731;
        DocumentNo: Text[30];
        salStartString: Text[40];
        salStartDate: Date;
        PeriodEndDate: array[5] of Date;
        month: Decimal;
        MaxLoanAmount: Decimal;
        Salary1: Decimal;
        Salary2: Decimal;
        Salary3: Decimal;
        ProcessingFee: Decimal;
        LoanProductCharges: Record 52185734;
        LoanProcessingGL: Text[30];
        ExciseDuty: Decimal;
        msisdntt: Text[30];
        MsaccoPinApplications: Record 52185768;
        SaccoAccount1: Record 52185730;
        i: Integer;
        DebitPhone: Text;
        vendorMboostaCommission: Decimal;
        vendorMboostaCommissionGL: Text;
        premiumRegAccount: Text;
        premiumRegFee: Decimal;
        RegBalanceAmount: Decimal;
        premiumBalanceAmount: Decimal;
        MemberTable: Record 52185700;
        JournalPost: Codeunit "Journal Posting";
        CompanyInformation: Record "Company Information";
        MemberCategory: Record 52185723;
        Members: Record 52185700;
        BLoanRec: Record 52185729;
        TopUPGL: Code[20];
        "Topup%": Decimal;
        BridgLoan: Decimal;
        BLoanNo: Code[20];
        TotalClearedAmount: Decimal;


    procedure GetBalanceEnquiry(var PhoneNo: Text[30]; DocumentNo: Text[30]) Balance: Text[1000]
    var
        MsaccoChargesSetup: Record 52185772;
        i: Decimal;
        MemberNo: Text[30];
    begin

        PhoneNo := '+' + PhoneNo;
        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."Transactional Mobile No", PhoneNo);
        saccoAccount.SetRange(saccoAccount."Product Name", 'FOSA Savings Account');

        if saccoAccount.Find('-') then begin

            AccBalance := GetAccountBalance(saccoAccount."No.");
            Docno := DocumentNo;

            MemberNo := saccoAccount."Member No.";



            // Get Balance Enquiry G/L and Charge Amount

            Charges.Reset;
            Charges.SetRange(Charges."Transaction Type", 'MSACCOBAL');
            if Charges.Find('-') then begin
                Charges.TestField(Charges."G/L Account");
                MPesaCharges := Charges."Charge Amount";
                MPesaChargesAccount := Charges."G/L Account";
            end;



            // Get Coretec Vendor Account and Charge Amount
            // Msaccocharge :=10;

            MsaccoChargesSetup.Reset;
            MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
            if MsaccoChargesSetup.Find('-') then begin
                MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
                Msaccocharge := MsaccoChargesSetup.ChargeAmount;
                Msaccoacc := MsaccoChargesSetup."Vendor No";
            end;
            //


            // Get Excise duty G/L
            ExciseDutyGL := GetExciseDutyGL();
            Exceciseduty := (MPesaCharges + Msaccocharge) * (GetExciseDuty() / 100);

            TotalCharges := MPesaCharges + Msaccocharge;

            if (AccBalance > TotalCharges) then begin
                //MESSAGE('found'+ saccoAccount."No.");
                //start posting
                POSTJOURNAL.ClearJournalLines('MSACCO', 'MSBAL-OL');

                // prevent double posting
                Venderdetails.Reset;
                Venderdetails.SetRange(Venderdetails."Document No.", DocumentNo);
                Venderdetails.SetRange(Venderdetails.Description, 'MSacco Balance Charges');
                Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
                if Venderdetails.Find('-') then begin

                end else begin
                    // Cr Msacco Charges (Sacco G/L Account)
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSBAL-OL', LineNo, Optionsaccounts::"G/L Account", DocumentNo, 'MSacco Balance Charges', (MPesaCharges) * -1
                    , MPesaChargesAccount, Today, Optionsaccounts::"G/L Account", '', '', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    // Cr Coretec Vendor with Msacco Charge
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSBAL-OL', LineNo, Optionsaccounts::Vendor, DocumentNo, 'MSacco Balance Charges', Msaccocharge * -1
                    , Msaccoacc, Today, Optionsaccounts::"G/L Account", '', saccoAccount."No.", saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);


                    //Dr Member Total Charges
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSBAL-OL', LineNo, Optionsaccounts::Savings, DocumentNo, 'MSacco Balance Charges', TotalCharges
                    , saccoAccount."No.", Today, Optionsaccounts::"G/L Account", '', 'MSACCO BAL', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);
                    Message(saccoAccount."No.");

                    //Dr Member Exercise Duty
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSBAL-OL', LineNo, Optionsaccounts::Savings, DocumentNo, 'Excise Duty', Exceciseduty
                    , saccoAccount."No.", Today, Optionsaccounts::"G/L Account", '', 'MSACCO BAL', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    //Cr Exercise Duty
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSBAL-OL', LineNo, Optionsaccounts::"G/L Account", DocumentNo, 'Excise Duty', Exceciseduty * -1
                    , ExciseDutyGL, Today, Optionsaccounts::"G/L Account", '', 'MSACCO BAL', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    POSTJOURNAL.LinesCompletePosting('MSACCO', 'MSBAL-OL');

                end;

                AccBalance := GetAccountBalance(saccoAccount."No.");

                Balance := 'Your ';

                // saccoAccount.SETFILTER(saccoAccount."Product Category",'<>%1',saccoAccount."Product Category"::"Registration Fee");

                // PRIME ACCOUNT BALANCE
                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."Member No.", MemberNo);
                //saccoAccount.SETRANGE(saccoAccount.Status, saccoAccount.Status::Active);
                saccoAccount.SetFilter(saccoAccount.Status, '%1|%2', saccoAccount.Status::Active, saccoAccount.Status::New);
                saccoAccount.SetRange(saccoAccount."Product Type", '505');
                if saccoAccount.Find('-') then begin

                    Balance := Balance + saccoAccount."Product Name" + ' a/c Bal ' + ':' + Format(GetAccountBalance(saccoAccount."No.")) + ',';

                end;

                // OTHER ACCOUNT BALANCES

                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."Member No.", MemberNo);
                //saccoAccount.SETRANGE(saccoAccount.Status, saccoAccount.Status::Active);
                saccoAccount.SetFilter(saccoAccount.Status, '%1|%2', saccoAccount.Status::Active, saccoAccount.Status::New);
                saccoAccount.SetFilter(saccoAccount."Product Type", '<>%1', '505');
                saccoAccount.SetFilter(saccoAccount."Product Category", '<>%1&<>%2&<>%3', saccoAccount."product category"::"Registration Fee", saccoAccount."product category"::"Unallocated Fund", saccoAccount."product category"::Benevolent);
                //saccoAccount.SETFILTER(saccoAccount."Product Category",'<>%1',saccoAccount."Product Category"::"Unallocated Fund");
                //saccoAccount.SETFILTER(saccoAccount."Product Category",'<>%1',saccoAccount."Product Category"::Benevolent);
                if saccoAccount.Find('-') then begin
                    repeat

                        saccoAccount.CalcFields(saccoAccount."Balance (LCY)");
                        Balance := Balance + saccoAccount."Product Name" + ' a/c Bal ' + ':' + Format(saccoAccount."Balance (LCY)") + ' ';

                    until saccoAccount.Next = 0;
                end;

            end else begin
                Balance := 'You have insufficient balance.';
            end;


            // END OF BALANCE ENQUIRY MESSAGE //


            MsaccoTransactions.Reset;
            if MsaccoTransactions.Find('+')
            then begin
                i := MsaccoTransactions."Entry No";
            end;

            i := i + 1;
            MsaccoTransactions.Init;
            MsaccoTransactions."Entry No" := i;
            MsaccoTransactions."Document No." := DocumentNo;
            MsaccoTransactions.Description := 'MSacco Balance Charges';
            MsaccoTransactions."Transaction Date" := Today;
            MsaccoTransactions."Account No." := saccoAccount."No.";
            MsaccoTransactions.Amount := Msaccocharge;
            MsaccoTransactions.Posted := true;
            MsaccoTransactions."Transaction Type" := MsaccoTransactions."transaction type"::Balance;
            MsaccoTransactions."Transaction Time" := Time;
            MsaccoTransactions.Insert(true);

        end;
    end;


    procedure GetBaneficiaryEnquiry(var PhoneNo: Text[30]; DocumentNo: Text[30]) Balance: Text[1000]
    var
        MsaccoChargesSetup: Record 52185772;
        i: Decimal;
        MemberNo: Text[30];
        NextofKIN: Record 52185701;
        CounNo: Integer;
    begin

        PhoneNo := '+' + PhoneNo;
        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."Transactional Mobile No", PhoneNo);
        saccoAccount.SetRange(saccoAccount."Product Name", 'FOSA Savings Account');

        if saccoAccount.Find('-') then begin

            AccBalance := GetAccountBalance(saccoAccount."No.");
            Docno := DocumentNo;

            MemberNo := saccoAccount."Member No.";



            // Get Balance Enquiry G/L and Charge Amount

            Charges.Reset;
            Charges.SetRange(Charges."Transaction Type", 'MSACCOBAL');
            if Charges.Find('-') then begin
                Charges.TestField(Charges."G/L Account");
                MPesaCharges := Charges."Charge Amount";
                MPesaChargesAccount := Charges."G/L Account";
            end;



            // Get Coretec Vendor Account and Charge Amount
            // Msaccocharge :=10;

            MsaccoChargesSetup.Reset;
            MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
            if MsaccoChargesSetup.Find('-') then begin
                MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
                Msaccocharge := MsaccoChargesSetup.ChargeAmount;
                Msaccoacc := MsaccoChargesSetup."Vendor No";
            end;
            //


            // Get Excise duty G/L
            ExciseDutyGL := GetExciseDutyGL();
            Exceciseduty := (MPesaCharges + Msaccocharge) * (GetExciseDuty() / 100);

            TotalCharges := MPesaCharges + Msaccocharge;

            if (AccBalance > TotalCharges) then begin
                //MESSAGE('found'+ saccoAccount."No.");
                //start posting
                POSTJOURNAL.ClearJournalLines('MSACCO', 'MSBAL-OL');

                // prevent double posting
                Venderdetails.Reset;
                Venderdetails.SetRange(Venderdetails."Document No.", DocumentNo);
                ///Venderdetails.SETRANGE(Venderdetails.Description,'MSacco Balance Charges');
                Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
                if Venderdetails.Find('-') then begin

                end else begin
                    // Cr Msacco Charges (Sacco G/L Account)
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSBAL-OL', LineNo, Optionsaccounts::"G/L Account", DocumentNo, 'MSacco Beneficiary Request  Charges', (MPesaCharges) * -1
                    , MPesaChargesAccount, Today, Optionsaccounts::"G/L Account", '', '', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    // Cr Coretec Vendor with Msacco Charge
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSBAL-OL', LineNo, Optionsaccounts::Vendor, DocumentNo, 'MSacco Beneficiary Request  Charges', Msaccocharge * -1
                    , Msaccoacc, Today, Optionsaccounts::"G/L Account", '', saccoAccount."No.", saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);


                    //Dr Member Total Charges
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSBAL-OL', LineNo, Optionsaccounts::Savings, DocumentNo, 'MSacco Beneficiary Request Charges', TotalCharges
                    , saccoAccount."No.", Today, Optionsaccounts::"G/L Account", '', 'MSACCO BAL', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);
                    Message(saccoAccount."No.");

                    //Dr Member Exercise Duty
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSBAL-OL', LineNo, Optionsaccounts::Savings, DocumentNo, 'Excise Duty', Exceciseduty
                    , saccoAccount."No.", Today, Optionsaccounts::"G/L Account", '', 'MSACCO BAL', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    //Cr Exercise Duty
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSBAL-OL', LineNo, Optionsaccounts::"G/L Account", DocumentNo, 'Excise Duty', Exceciseduty * -1
                    , ExciseDutyGL, Today, Optionsaccounts::"G/L Account", '', 'MSACCO BAL', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    POSTJOURNAL.LinesCompletePosting('MSACCO', 'MSBAL-OL');

                end;

                AccBalance := GetAccountBalance(saccoAccount."No.");

                Balance := 'Your Beneficiaries are ';

                // saccoAccount.SETFILTER(saccoAccount."Product Category",'<>%1',saccoAccount."Product Category"::"Registration Fee");

                // PRIME ACCOUNT BALANCE
                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."Member No.", MemberNo);
                //saccoAccount.SETRANGE(saccoAccount.Status, saccoAccount.Status::Active);
                saccoAccount.SetFilter(saccoAccount.Status, '%1|%2', saccoAccount.Status::Active, saccoAccount.Status::New);
                saccoAccount.SetRange(saccoAccount."Product Type", '505');
                if saccoAccount.Find('-') then begin

                    //Balance := Balance + saccoAccount."Product Name" + ' a/c Bal '+':'+ FORMAT(GetAccountBalance(saccoAccount."No.")) +',';

                end;

                // OTHER ACCOUNT BALANCES

                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."Member No.", MemberNo);
                //saccoAccount.SETRANGE(saccoAccount.Status, saccoAccount.Status::Active);
                saccoAccount.SetFilter(saccoAccount.Status, '%1|%2', saccoAccount.Status::Active, saccoAccount.Status::New);
                saccoAccount.SetFilter(saccoAccount."Product Type", '<>%1', '505');
                saccoAccount.SetFilter(saccoAccount."Product Category", '<>%1&<>%2&<>%3', saccoAccount."product category"::"Registration Fee", saccoAccount."product category"::"Unallocated Fund", saccoAccount."product category"::Benevolent);
                //saccoAccount.SETFILTER(saccoAccount."Product Category",'<>%1',saccoAccount."Product Category"::"Unallocated Fund");
                //saccoAccount.SETFILTER(saccoAccount."Product Category",'<>%1',saccoAccount."Product Category"::Benevolent);
                if saccoAccount.Find('-') then begin
                    repeat

                        saccoAccount.CalcFields(saccoAccount."Balance (LCY)");
                    //Balance := Balance + saccoAccount."Product Name" + ' a/c Bal '+':'+ FORMAT(saccoAccount."Balance (LCY)")+' ';

                    until saccoAccount.Next = 0;
                end;

                CounNo := 1;


                NextofKIN.Reset;
                NextofKIN.SetRange("Account No", saccoAccount."Member No.");
                NextofKIN.SetRange(Type, NextofKIN.Type::"Benevolent Beneficiary");
                if NextofKIN.Find('-') then begin
                    repeat

                        Balance := Balance + Format(CounNo) + '.' + NextofKIN.Name + ' ';
                        CounNo += 1;
                    until NextofKIN.Next = 0;
                end else begin
                    Balance := 'You do not have any beneficiaries. To update go to members portal on our website www.harambeesacco.com or complete update form and send it to our offices. Call 070994300/100 for assistance. '
                end;


            end else begin
                Balance := 'You have insufficient balance.';
            end;





            MsaccoTransactions.Reset;
            if MsaccoTransactions.Find('+')
            then begin
                i := MsaccoTransactions."Entry No";
            end;

            i := i + 1;
            MsaccoTransactions.Init;
            MsaccoTransactions."Entry No" := i;
            MsaccoTransactions."Document No." := DocumentNo;
            MsaccoTransactions.Description := 'MSacco Balance Charges';
            MsaccoTransactions."Transaction Date" := Today;
            MsaccoTransactions."Account No." := saccoAccount."No.";
            MsaccoTransactions.Amount := Msaccocharge;
            MsaccoTransactions.Posted := true;
            MsaccoTransactions."Transaction Type" := MsaccoTransactions."transaction type"::Balance;
            MsaccoTransactions."Transaction Time" := Time;
            MsaccoTransactions.Insert(true);

        end;
    end;


    procedure GetAccountBalance(Account: Text[30]) AccountBal: Decimal
    var
        cashierTransactions: Record 52185776;
        lienAmount: Decimal;
    begin

        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."No.", Account);
        saccoAccount.SetRange(saccoAccount."Product Type", '505');
        if saccoAccount.Find('-') then begin
            Accounttypes.Reset;
            Accounttypes.SetRange(Accounttypes."Product ID", saccoAccount."Product Type");
            if Accounttypes.Find('-') then begin
                MiniBalance := Accounttypes."Minimum Balance";
            end;
            saccoAccount.CalcFields(saccoAccount."Balance (LCY)");
            saccoAccount.CalcFields(saccoAccount."ATM Transactions");
            saccoAccount.CalcFields(saccoAccount."Uncleared Cheques");
            saccoAccount.CalcFields(saccoAccount."Coop Transactions");


            cashierTransactions.Reset;
            cashierTransactions.SetRange("Account No", saccoAccount."No.");
            cashierTransactions.SetRange(Posted, true);
            cashierTransactions.SetRange(Type, cashierTransactions.Type::Lien);
            cashierTransactions.SetRange("Cheque Status", cashierTransactions."cheque status"::Pending);
            if cashierTransactions.Find('-') then begin
                repeat
                    lienAmount += cashierTransactions.Amount;
                until cashierTransactions.Next = 0;
            end;





            AccountBal := saccoAccount."Balance (LCY)" - (saccoAccount."ATM Transactions" + saccoAccount."Uncleared Cheques" + MiniBalance + lienAmount + saccoAccount."Coop Transactions");

        end
        else begin
            AccountBal := 0;
        end
    end;


    procedure GetAccountName(Account: Text[30]) AccountName: Text[30]
    begin

        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."No.", Account);
        saccoAccount.SetRange(saccoAccount."Product Type", '505');
        if saccoAccount.Find('-') then begin

            AccountName := PadStr(saccoAccount.Name, 30);

        end
        else begin

            AccountName := '';

        end
    end;


    procedure MsaccoWithdrawalRequest(Account: Text[30]; Amount: Decimal; Trace: Text[30]; Telephone: Text[30]) Response: Integer
    begin

        BufferTable.SetRange(BufferTable."Trace ID", Trace);
        BufferTable.SetRange(BufferTable.Posted, false);
        if BufferTable.Find('-') then begin
            Response := 1;
        end else begin
            BufferTable.Init;
            BufferTable."Trace ID" := Trace;
            BufferTable."Account No" := Account;
            BufferTable."Posting Date" := Today;
            BufferTable.Description := 'MPESA Withdrawal - ' + Telephone;
            BufferTable.Amount := Amount;
            BufferTable."Unit ID" := 'M-PESA';
            BufferTable."Transaction Type" := 'Withdrawal';
            BufferTable."Transaction Date" := Today; //TODAY;
            BufferTable."Transaction Time" := Time;
            BufferTable.Source := BufferTable.Source::"M-PESA";
            BufferTable.Insert;
            Response := 0;
        end
    end;


    procedure MsaccoWithdrawalReversal(Trace: Text[30]) Response: Integer
    begin

        BufferTable.SetRange(BufferTable."Trace ID", Trace);
        BufferTable.SetRange(BufferTable.Posted, false);
        if BufferTable.Find('-') then begin
            BufferTable.Posted := true;
            BufferTable."Posting Date" := Today;
            BufferTable.Modify;
            Response := 0;
        end
    end;


    procedure MsaccoWithdrawalConfirm(DocumentNo: Text[30]; TransType: Text[30]; Description: Text[150]; TranDate: Date; Account: Text[30]; Amount: Decimal; Otherd: Text[100]; TelephoneNo: Text[20]; MpesaNames: Text[30]) Response: Integer
    begin

        MPESATRANS.Reset;
        MPESATRANS.SetRange(MPESATRANS."Document No.", DocumentNo);
        MPESATRANS.SetRange(MPESATRANS.Description, Description);
        if MPESATRANS.Find('-') then begin
            Response := 1;
        end else begin
            MPESATRANS.Init;
            MPESATRANS."Document No." := DocumentNo;
            MPESATRANS.Description := Description;
            MPESATRANS."Telephone No" := TelephoneNo;
            MPESATRANS."Account No." := Account;
            MPESATRANS.Amount := Amount;
            MPESATRANS."Transaction Type" := TransType;
            MPESATRANS."Document Date" := TranDate;
            MPESATRANS."Transaction Date" := TranDate;
            MPESATRANS."Key Word" := Otherd;
            MPESATRANS.Posted := false;
            MPESATRANS.Insert;
            MPESATRANS."Mpesa Names" := MpesaNames;
            Response := 0;
        end;
    end;


    procedure GetCreditableAccounts(Phone: Text[30]) Accounts: Text[200]
    begin

        Phone := '+' + Phone;
        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."Transactional Mobile No", Phone);
        saccoAccount.SetFilter(saccoAccount.Status, '%1|%2', saccoAccount.Status::Active, saccoAccount.Status::New);
        saccoAccount.SetFilter(saccoAccount."Product Type", '%1', '505');
        saccoAccount.SetRange(saccoAccount.Blocked, saccoAccount.Blocked::" ");
        if saccoAccount.FindFirst() then begin
            SaccoAccount1.Reset;
            SaccoAccount1.SetFilter(SaccoAccount1.Status, '%1|%2', saccoAccount.Status::Active, saccoAccount.Status::New);
            SaccoAccount1.SetRange(SaccoAccount1."Member No.", saccoAccount."Member No.");
            SaccoAccount1.SetFilter(SaccoAccount1."Product Type", '%1', '505');
            SaccoAccount1.SetRange(SaccoAccount1.Blocked, SaccoAccount1.Blocked::" ");
            if SaccoAccount1.Find('-') then begin
                repeat
                    Accounts := Accounts + SaccoAccount1."No." + '|' + SaccoAccount1."Product Name" + '|' + SaccoAccount1."Member No." + '~';
                until SaccoAccount1.Next = 0;
            end
        end
    end;


    procedure GetMinistatement(Account: Text[50]; DocumentNo: Text[30]) statement: Text[500]
    begin

        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."No.", Account);
        if saccoAccount.Find('-') then begin

            minicount := 1;
            Docno := DocumentNo;
            saccoAccount.CalcFields(saccoAccount."Balance (LCY)");

            // Get Excise duty G/L
            ExciseDutyGL := GetExciseDutyGL();

            // Get Balance Enquiry G/L and Charge Amount
            Charges.Reset;
            Charges.SetRange(Charges."Transaction Type", 'MSACCOMIN');
            if Charges.Find('-') then begin
                Charges.TestField(Charges."G/L Account");
                MPesaCharges := Charges."Charge Amount";
                MPesaChargesAccount := Charges."G/L Account";
            end;

            // Get Coretec Vendor Account and Charge Amount
            MsaccoChargesSetup.Reset;
            MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
            if MsaccoChargesSetup.Find('-') then begin

                MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
                Msaccocharge := MsaccoChargesSetup.ChargeAmount;
                Msaccoacc := MsaccoChargesSetup."Vendor No";

            end;


            TotalCharges := MPesaCharges + Msaccocharge;

            Message('total charges ' + Format(TotalCharges));

            if (GetAccountBalance(saccoAccount."No.") > TotalCharges) then begin

                // start posting
                POSTJOURNAL.ClearJournalLines('MSACCO', 'MSBAL-OL');


                Venderdetails.Reset;
                Venderdetails.SetRange(Venderdetails."Document No.", DocumentNo);
                Venderdetails.SetRange(Venderdetails.Description, 'MSacco Balance Charges');
                Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
                if Venderdetails.Find('-') then begin

                end else begin
                    // Cr Sacco G/L with Charge
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSBAL-OL', LineNo, Optionsaccounts::"G/L Account", Docno, 'MSacco ministatement Charges', MPesaCharges * -1
                    , MPesaChargesAccount, Today, Optionsaccounts::"G/L Account", '', '', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    // Cr Coretec Vendor with Msacco Charge
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSBAL-OL', LineNo, Optionsaccounts::Vendor, Docno, 'MSacco Ministatement Charges', Msaccocharge * -1
                    , Msaccoacc, Today, Optionsaccounts::"G/L Account", '', saccoAccount."No.", saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    //DR Member - total Charges

                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSBAL-OL', LineNo, Optionsaccounts::Savings, Docno, 'MSacco Ministatement Charges', TotalCharges
                    , saccoAccount."No.", Today, Optionsaccounts::"G/L Account", '', 'MSACCO MINI', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    // complete posting
                    POSTJOURNAL.LinesCompletePosting('MSACCO', 'MSBAL-OL');
                end;

                Venderdetails.Reset;
                Venderdetails.SetCurrentkey(Venderdetails."Entry No.");
                Venderdetails.Ascending(false);

                Venderdetails.SetRange(Venderdetails."Customer No.", saccoAccount."No.");
                Venderdetails.SetRange(Venderdetails.Reversed, false);
                if Venderdetails.Find('-') then begin
                    statement := 'Dear member, ';
                    repeat
                        statement := statement + Format(Venderdetails."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>') + ':' +
                                      CopyStr(Venderdetails.Description, 1, 20) +
                                      ':KES' + Format(Venderdetails.Amount) + '; ';
                        minicount := minicount + 1;
                        if minicount > 4 then begin
                            exit
                        end;
                    until Venderdetails.Next = 0
                end;

            end;

            MsaccoTransactions.Reset;
            if MsaccoTransactions.Find('+')
            then begin
                i := MsaccoTransactions."Entry No";
            end;

            i := i + 1;
            MsaccoTransactions.Init;
            MsaccoTransactions."Entry No" := i;
            MsaccoTransactions."Document No." := Docno;
            MsaccoTransactions.Description := 'Msacco ministatement Charges';
            MsaccoTransactions."Transaction Date" := Today;
            MsaccoTransactions."Account No." := saccoAccount."No.";
            MsaccoTransactions.Amount := Msaccocharge;
            MsaccoTransactions.Posted := true;
            MsaccoTransactions."Transaction Type" := MsaccoTransactions."transaction type"::Ministatement;
            MsaccoTransactions."Transaction Time" := Time;
            MsaccoTransactions.Insert;

        end
        else begin

            statement := 'Insufficient funds in your account to enquire for ministatement';

        end;
    end;


    procedure MSaccoNewRegistration() Registrations: Text
    begin
        MpesaApplications.Reset;
        MpesaApplications.SetRange(MpesaApplications."Sent To Server", MpesaApplications."sent to server"::No);
        MpesaApplications.SetRange(MpesaApplications.Status, MpesaApplications.Status::Approved);
        //i:=1;


        if MpesaApplications.Find('-') then begin
            repeat

                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."Transactional Mobile No", MpesaApplications."MPESA Mobile No");
                saccoAccount.SetRange(saccoAccount."Product Type", '505');
                if saccoAccount.Find('-') then begin

                    Registrations := Registrations + MpesaApplications."MPESA Mobile No" + '~' + MpesaApplications."Customer Name" + '|';
                    MpesaApplications."Sent To Server" := MpesaApplications."sent to server"::Yes;
                    MpesaApplications.Modify;
                    i := i + 1;
                    if i >= 5 then
                        exit;

                end;

            until MpesaApplications.Next = 0;
        end;

        MsaccoPinApplications.Reset;
        MsaccoPinApplications.SetRange(MsaccoPinApplications."Sent To Server", MsaccoPinApplications."sent to server"::No);
        MsaccoPinApplications.SetRange(MsaccoPinApplications.Status, MsaccoPinApplications.Status::Approved);
        if MsaccoPinApplications.Find('-') then begin

            repeat
                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."Transactional Mobile No", MsaccoPinApplications."MPESA Mobile No");
                saccoAccount.SetRange(saccoAccount."Product Type", '505');
                if saccoAccount.Find('-') then begin

                    Registrations := Registrations + MsaccoPinApplications."MPESA Mobile No" + '~' + MsaccoPinApplications."Customer Name" + '|';
                    MsaccoPinApplications."Sent To Server" := MsaccoPinApplications."sent to server"::Yes;
                    MsaccoPinApplications.Modify;
                    i := i + 1;
                    if i >= 5 then
                        exit;
                end;

            until MsaccoPinApplications.Next = 0;
        end;
    end;


    procedure GetLoanStatus(Phone: Text[30]) Loansbalances: Text[1000]
    var
        OutstandingLoanBalance: Decimal;
    begin

        Phone := '+' + Phone;
        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."Transactional Mobile No", Phone);
        if saccoAccount.Find('-') then begin
            Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
            if Loans.Find('-') then begin
                repeat
                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");

                    OutstandingLoanBalance := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                    if (OutstandingLoanBalance > 0) then begin

                        ProdFac.Reset;
                        ProdFac.SetRange(ProdFac."Product ID", Loans."Loan Product Type");
                        if ProdFac.Find('-') then begin

                            Loansbalances := Loansbalances + '|' + Loans."Loan No." + ';' + ProdFac."Product Description" + ';' +
                                            Format(Loans."Outstanding Balance" + Loans."Outstanding Interest") + ';' + Format(Loans."Outstanding Interest");

                        end;

                    end;
                until Loans.Next = 0;
            end;
        end;
    end;


    procedure GetSms() Sms: Text[1000]
    begin
        /*
          smses.RESET;
          smses.SETRANGE(smses."Sent To Server",smses."Sent To Server"::No);
          smses.SETFILTER(smses.Source,'<>%1',smses.Source::"Cashier Below Limit");
          IF smses.FIND('-') THEN BEGIN
            Sms:=FORMAT(smses."Entry No") +'~'+smses."Telephone No" + '~' + smses."SMS Message";
            smses."Sent To Server":= smses."Sent To Server"::Yes;
            smses.MODIFY;
          END;
          */

    end;


    procedure MsaccoLoanApplication(Reference: Text[50]; Account: Text[30]; amount: Decimal; LoanType: Code[50]; LoanCode: Text) Response: Integer
    var
        MSACCOLoans: Record 52185761;
        Install: Decimal;
        LoanProduct: Code[10];
        ReferenceNo: Text;
        LoanPurpose: Text;
        StringSplit: Text;
        SectoralClassification: Record 52186112;
        pass: Text;
        LoanProd: Text;
        Branch: Text;
        PhoneNo: Text;
    begin
        if amount > 0 then begin

            //Split Code
            PhoneNo := '';
            StringSplit := Reference;

            ReferenceNo := Token(StringSplit, '~');
            LoanPurpose := Token(StringSplit, '~');
            pass := Token(StringSplit, '~');
            Branch := Token(StringSplit, '~');
            PhoneNo := Token(StringSplit, '~');

            //Domant Account Address  Start**** Francis
            if (Account = '') and (PhoneNo <> '') then begin
                SaccoAccount1.Reset;
                SaccoAccount1.SetRange("Transactional Mobile No", PhoneNo);
                if SaccoAccount1.Find('-') then begin
                    Account := SaccoAccount1."No.";
                end;
            end;

            //Domant Account Adreess End------



            MSACCOLoanApp.Reset;
            MSACCOLoanApp.SetRange(MSACCOLoanApp.DocumentNo, ReferenceNo);
            MSACCOLoanApp.SetRange(MSACCOLoanApp."Account No", Account);
            if MSACCOLoanApp.Find('-') then begin
                Response := 0;
            end else begin

                //Added By Francis
                LoanProduct := CopyStr(LoanCode, 1, 3);
                if DelStr(LoanCode, 1, 3) <> '' then begin
                    Evaluate(Install, DelStr(LoanCode, 1, 3));
                end else
                    Install := 12;
                if (LoanProduct <> '119') and (LoanProduct <> '111') and (LoanProduct <> '115') and (LoanProduct <> '124') and (LoanProduct <> '140') then begin
                    if Install > 12 then
                        Install := 12;
                end;

                if Branch = '4' then
                    MSACCOLoans.Reset;
                MSACCOLoans.SetRange("Account No", Account);
                MSACCOLoans.SetRange("Loan Code", LoanProduct);
                MSACCOLoans.SetRange(Posted, false);
                MSACCOLoans.SetFilter(Status, '%1|%2', MSACCOLoans.Status::Pending, MSACCOLoans.Status::Appraisal);
                if not MSACCOLoans.Find('-') then begin
                    MSACCOLoanApp.Init;
                    MSACCOLoanApp."Account No" := Account;
                    MSACCOLoanApp.Date := CurrentDatetime;
                    MSACCOLoanApp."Requested Amount" := amount;
                    MSACCOLoanApp.Amount := amount;
                    MSACCOLoanApp.Posted := false;
                    MSACCOLoanApp.Status := MSACCOLoanApp.Status::Pending;
                    MSACCOLoanApp.DocumentNo := PadStr(ReferenceNo, 20);
                    MSACCOLoanApp.Installment := Install;
                    MSACCOLoanApp."Loan Code" := LoanProduct;
                    MSACCOLoanApp."Ghris Password" := pass;
                    MSACCOLoanApp.Branch := Branch;
                    MSACCOLoanApp.Validate(Branch);



                    if LoanPurpose = '1' then
                        MSACCOLoanApp."Loan Purpose" := '1420'
                    else
                        if LoanPurpose = '2' then
                            MSACCOLoanApp."Loan Purpose" := '2120'
                        else
                            if LoanPurpose = '3' then
                                MSACCOLoanApp."Loan Purpose" := '3120'
                            else
                                if LoanPurpose = '4' then
                                    MSACCOLoanApp."Loan Purpose" := '4110'
                                else
                                    if LoanPurpose = '5' then
                                        MSACCOLoanApp."Loan Purpose" := '5110'
                                    else
                                        if LoanPurpose = '6' then
                                            MSACCOLoanApp."Loan Purpose" := '6110'
                                        else
                                            if LoanPurpose = '7' then
                                                MSACCOLoanApp."Loan Purpose" := '7210'
                                            else
                                                if LoanPurpose = '8' then
                                                    MSACCOLoanApp."Loan Purpose" := '8110';

                    //Get Account
                    saccoAccount.Get(Account);

                    if LoanProduct = '123' then begin
                        MSACCOLoanApp."Loan Product Type" := MSACCOLoanApp."loan product type"::"Salary In Advance";
                    end else
                        if LoanProduct = '119' then begin
                            MSACCOLoanApp."Loan Product Type" := MSACCOLoanApp."loan product type"::"Salary Advance";
                        end else
                            if LoanProduct = '136' then begin
                                MSACCOLoanApp."Loan Product Type" := MSACCOLoanApp."loan product type"::"Dividend Loan";
                            end else
                                if LoanProduct = '112' then begin
                                    if (saccoAccount."Employer Code" <> '05') and (saccoAccount."Employer Code" <> '99') then begin
                                        MSACCOLoanApp."Loan Product Type" := MSACCOLoanApp."loan product type"::"Emergency Loan";
                                        MSACCOLoanApp."Loan No" := CreateLoanRegister(Account, LoanProduct, amount, Today, Install, MSACCOLoanApp."Loan Purpose", Branch);
                                        MSACCOLoanApp.Status := MSACCOLoanApp.Status::Appraisal;
                                    end;
                                    MSACCOLoanApp."Loan Product Type" := MSACCOLoanApp."loan product type"::"Emergency Loan";
                                end else
                                    if LoanProduct = '113' then begin
                                        MSACCOLoanApp."Loan Product Type" := MSACCOLoanApp."loan product type"::"School Fees Loan";
                                        if (saccoAccount."Employer Code" <> '05') and (saccoAccount."Employer Code" <> '99') then begin
                                            MSACCOLoanApp."Loan Product Type" := MSACCOLoanApp."loan product type"::"School Fees Loan";
                                            MSACCOLoanApp."Loan No" := CreateLoanRegister(Account, LoanProduct, amount, Today, Install, MSACCOLoanApp."Loan Purpose", Branch);
                                            MSACCOLoanApp.Status := MSACCOLoanApp.Status::Appraisal;
                                        end;
                                    end else
                                        if (LoanProduct = '111') or (LoanProduct = '115') or (LoanProduct = '124') or (LoanProduct = '140') then begin
                                            MSACCOLoanApp."Loan Product Type" := MSACCOLoanApp."loan product type"::"Other Loans";
                                            MSACCOLoanApp."Loan No" := CreateLoanRegister(Account, LoanProduct, amount, Today, Install, MSACCOLoanApp."Loan Purpose", Branch);
                                            MSACCOLoanApp.Status := MSACCOLoanApp.Status::Appraisal;
                                        end else
                                            if (LoanProduct = '120') or (LoanProduct = '121') then begin
                                                MSACCOLoanApp."Loan Product Type" := MSACCOLoanApp."loan product type"::"Other Loans";
                                            end else begin
                                                MSACCOLoanApp."Loan Product Type" := MSACCOLoanApp."loan product type"::"Instant Loan";
                                            end;
                    MSACCOLoanApp.Insert;
                    Response := 0;


                end;
            end;
        end else begin
            Response := 1;
        end;
    end;


    procedure Minicharge() charge: Decimal
    begin

        // Get MiniStatement Charge

        Charges.Reset;
        Charges.SetRange(Charges."Transaction Type", 'MSACCOMIN');
        if Charges.Find('-') then begin
            charge := Charges."Charge Amount";
        end
        else
            charge := 0;
    end;


    procedure Balcharge() charge: Decimal
    begin

        // Get MiniStatement Charge

        Charges.Reset;
        Charges.SetRange(Charges."Transaction Type", 'MSACCOBAL');
        if Charges.Find('-') then begin
            charge := Charges."Charge Amount";
        end
        else
            charge := 0;
    end;


    procedure Msacocharge() charge: Decimal
    begin

        // Get Coretec Charge Amount

        Charges.Reset;
        Charges.SetRange(Charges."Transaction Type", 'MSACCOC');
        if Charges.Find('-') then begin
            charge := Charges."Charge Amount";

        end
        else
            charge := 0;
    end;


    procedure Transfercharge() charge: Decimal
    begin
        // Get MiniStatement Charge

        Charges.Reset;
        Charges.SetRange(Charges."Transaction Type", 'MSACCOT');
        if Charges.Find('-') then begin
            charge := Charges."Charge Amount";
        end
        else
            charge := 0;
    end;


    procedure smsupdate(EntryNo: Integer; Status: Text[30]; Balance: Integer) Update: Boolean
    begin

        smses.Reset;
        smses.SetRange(smses."Entry No", EntryNo);
        if (smses.Find('-')) then begin
            smses."Bulk SMS Balance" := Balance;
            smses.Modify;
            Update := true;
        end
    end;


    procedure postmanual()
    begin
        MPESATRANS1.Reset;
        MPESATRANS1.SetRange(MPESATRANS1.Posted, false);
        //MPESATRANS1.SETRANGE("Document No.",'NI59EBYUB');
        MPESATRANS1.SetFilter(MPESATRANS1."Transaction Type", '<>%1', 'UtilityPayment');
        //MPESATRANS1.SETFILTER(MPESATRANS1."Transaction Date",'>=%1',DMY2DATE(1,12,2015));
        if MPESATRANS1.FindFirst then begin
            repeat
                if MPESATRANS1."Transaction Type" <> 'UtilityPayment' then begin
                    if MPESATRANS1."Transaction Type" = 'Withdrawal' then begin

                        InsertToJournalMWithdrawals(MPESATRANS1."Document No."
                                    , MPESATRANS1."Transaction Type"
                                    , MPESATRANS1.Description
                                    , MPESATRANS1."Transaction Date"
                                    , MPESATRANS1."Account No."
                                    , MPESATRANS1.Amount
                                    , MPESATRANS1."Key Word");

                    end else
                        if MPESATRANS1."Transaction Type" = 'Deposit' then begin
                            InsertToJournalMDeposits(MPESATRANS1."Document No."
                                , MPESATRANS1."Transaction Type"
                                , MPESATRANS1.Description
                                , MPESATRANS1."Transaction Date"
                                , MPESATRANS1."Account No."
                                , MPESATRANS1.Amount
                                , MPESATRANS1."Key Word");
                        end;
                end;
            until MPESATRANS1.Next = 0;
        end;
    end;


    procedure PostDeposits()
    var
        countNo: Integer;
    begin
        countNo := 0;
        MPESATRANS1.Reset;
        MPESATRANS1.SetRange(MPESATRANS1.Posted, false);
        MPESATRANS1.SetRange(MPESATRANS1."Transaction Type", 'Deposit');
        // MPESATRANS1.SETFILTER("Transaction Date",'%1..%2',20210223D,TODAY);
        //MPESATRANS1.SETRANGE("Document No.",'PBN9ZDW3T7');
        if MPESATRANS1.FindFirst then begin
            repeat

                InsertToJournalMDeposits(MPESATRANS1."Document No.", MPESATRANS1."Transaction Type", MPESATRANS1.Description
                        , MPESATRANS1."Transaction Date", MPESATRANS1."Account No.", MPESATRANS1.Amount, MPESATRANS1."Key Word");
                countNo += 1;
            // IF countNo>30 THEN
            //  EXIT;
            until MPESATRANS1.Next = 0;
        end;
        /*
      countNo:=0;

       MPESATRANS1.RESET;
       MPESATRANS1.SETRANGE(MPESATRANS1.Posted,FALSE);
       MPESATRANS1.SETRANGE(MPESATRANS1."Transaction Type",'Deposit');
        //MPESATRANS1.SETFILTER("Transaction Date",'%1..%2',20210224D,TODAY);
       MPESATRANS1.SETRANGE("Needs Change",TRUE);
       IF  MPESATRANS1.FINDLAST THEN BEGIN
          REPEAT

            InsertToJourlFailedDeposits(MPESATRANS1."Document No.",MPESATRANS1."Transaction Type",MPESATRANS1.Description
                    ,MPESATRANS1."Transaction Date",MPESATRANS1."Account No.",MPESATRANS1.Amount,MPESATRANS1."Key Word");
            countNo+=1;
          //IF countNo>10 THEN
           // EXIT;
          UNTIL MPESATRANS1.NEXT =0;
        END;
        */

    end;


    procedure PostFailedDeposits()
    begin
        MPESATRANS1.Reset;
        MPESATRANS1.SetRange(MPESATRANS1.Posted, false);
        MPESATRANS1.SetRange(MPESATRANS1."Transaction Type", 'Deposit');
        MPESATRANS1.SetRange(MPESATRANS1."Needs Change", true);
        MPESATRANS1.SetFilter("Transaction Date", '%1..%2', 20210225D, Today);
        if MPESATRANS1.FindFirst then begin
            repeat
                // MESSAGE('%1',MPESATRANS1."Document No.");
                InsertToJourlFailedDeposits(MPESATRANS1."Document No.", MPESATRANS1."Transaction Type", MPESATRANS1.Description
                        , MPESATRANS1."Transaction Date", MPESATRANS1."Account No.", MPESATRANS1.Amount, MPESATRANS1."Key Word");

            until MPESATRANS1.Next = 0;
        end;
    end;


    procedure PostWithdrawals()
    var
        countNo: Integer;
    begin
        countNo := 0;
        MPESATRANS1.Reset;
        MPESATRANS1.SetRange(MPESATRANS1.Posted, false);
        MPESATRANS1.SetRange(MPESATRANS1."Transaction Type", 'Withdrawal');
        MPESATRANS1.SetRange("Transaction Date", 20210302D, Today);
        //MPESATRANS1.SETRANGE(MPESATRANS1."Account No." ,'5050126663000');
        //MPESATRANS1.SETRANGE(MPESATRANS1."Document No.",'LI192JW4CP');
        if MPESATRANS1.FindFirst then begin
            Message(MPESATRANS1."Document No.");
            repeat
                Message(Format(InsertToJournalMWithdrawals(MPESATRANS1."Document No."
                            , MPESATRANS1."Transaction Type"
                            , MPESATRANS1.Description
                            , MPESATRANS1."Transaction Date"
                            , MPESATRANS1."Account No."
                            , MPESATRANS1.Amount
                            , MPESATRANS1."Key Word")));
                countNo += 1;
            //IF countNo>20 THEN
            // EXIT;
            until MPESATRANS1.Next = 0;
        end else begin
            //MESSAGE(' not found')
        end;
    end;

    local procedure InsertToJournalMWithdrawals(DocumentNo: Text[30]; TransType: Text[30]; Description: Text[100]; TranDate: Date; Account: Text[30]; Amount: Decimal; Otherd: Text[100]) Response: Integer
    begin

        Response := 1;
        Continue := true;
        MPESATRANS.Reset;
        MPESATRANS.SetRange(MPESATRANS."Document No.", DocumentNo);
        MPESATRANS.SetRange(MPESATRANS.Description, Description);

        if MPESATRANS.FindFirst() then begin

            // prevent double posting
            Venderdetails.Reset;
            Venderdetails.SetRange(Venderdetails."Document No.", MPESATRANS."Document No.");
            Venderdetails.SetRange(Venderdetails.Description, Description);
            Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
            if Venderdetails.Find('-') then begin
                Message('double posting');
                MPESATRANS."Date Posted" := Today;
                MPESATRANS."Time Posted" := Time;
                MPESATRANS.Posted := true;
                MPESATRANS.Messages := 'Double Posting';
                MPESATRANS.Modify;
                Response := 0;
                Continue := false;

            end;


            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
            GenJournalLine.SetRange("Journal Batch Name", 'MPESA-OL');
            GenJournalLine.DeleteAll;

            GenBatches.Reset;
            GenBatches.SetRange(GenBatches."Journal Template Name", 'MSACCO');
            GenBatches.SetRange(GenBatches.Name, 'MPESA-OL');
            if GenBatches.Find('-') = false then begin
                GenBatches.Init;
                GenBatches."Journal Template Name" := 'MSACCO';
                GenBatches.Name := 'MPESA-OL';
                GenBatches.Description := 'M-PESA Transactions';
                GenBatches.Validate(GenBatches."Journal Template Name");
                GenBatches.Validate(GenBatches.Name);
                GenBatches.Insert;

            end;

            MPesaCharges := 0;
            MPesaChargesAccount := '';
            Msaccocharge := 0;
            Msaccoacc := '';
            TotalCharges := 0;
            MPesaAccount := '';

            //Get Utility Bank Account

            MsaccoChargesSetup.Reset;
            MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'UTILITYBANK');
            if MsaccoChargesSetup.Find('-') then begin
                MsaccoChargesSetup.TestField(MsaccoChargesSetup."Bank Account No");
                MPesaAccount := MsaccoChargesSetup."Bank Account No";
            end;

            //Get Sacco Withdrawal Charges G/L

            Charges.Reset;
            Charges.SetRange(Charges."Transaction Type", 'MSACCOW');
            if Charges.Find('-') then begin
                Charges.TestField(Charges."G/L Account");
                MPesaCharges := Charges."Charge Amount";
                MPesaChargesAccount := Charges."G/L Account";
            end;

            MPESATRANS1.Reset;
            MPESATRANS1.SetRange(MPESATRANS1."Document No.", DocumentNo);
            MPESATRANS1.SetFilter(MPESATRANS1.Description, '<>%1', 'Business Payment Charge');
            if MPESATRANS1.Find('-') then begin

                TariffDetails.Reset;
                TariffDetails.SetRange(TariffDetails.Code, 'WITHDRAWAL');
                if TariffDetails.Find('-') then begin
                    repeat
                        if (MPESATRANS1.Amount >= TariffDetails."Lower Limit") and (MPESATRANS1.Amount <= TariffDetails."Upper Limit") then begin
                            MPesaCharges := TariffDetails."Charge Amount";
                        end;
                    until TariffDetails.Next = 0;
                end;
            end;


            // Get Excise duty G/L
            ExciseDutyGL := GetExciseDutyGL();
            Exceciseduty := MPesaCharges * (GetExciseDuty() / 100);


            //Get Coretec Vendor Account and Charge Amount

            MsaccoChargesSetup.Reset;
            MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
            if MsaccoChargesSetup.Find('-') then begin
                MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
                Msaccocharge := MsaccoChargesSetup.ChargeAmount;
                Msaccoacc := MsaccoChargesSetup."Vendor No";
            end;
            //MESSAGE('found');
            TotalCharges := MPesaCharges + Msaccocharge;

            saccoAccount.Reset;
            saccoAccount.SetRange(saccoAccount.Blocked, saccoAccount.Blocked::" ");
            //saccoAccount.SETRANGE(saccoAccount.Status,saccoAccount.Status::Active);
            //saccoAccount.SETFILTER(saccoAccount.Status,'%1|%2',saccoAccount.Status::Active,saccoAccount.Status::New);
            saccoAccount.SetRange(saccoAccount."No.", Account);


            if saccoAccount.Find('-') then begin

                if Description <> 'Business Payment Charge' then begin

                    //Dr Savings Account
                    LineNo := LineNo + 10000;
                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := 'MSACCO';
                    GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                    GenJournalLine."Account No." := Account;
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine."Document No." := DocumentNo;
                    GenJournalLine."External Document No." := 'MPESA W/D';
                    GenJournalLine."Posting Date" := Today;
                    GenJournalLine.Description := Description;
                    GenJournalLine.Amount := Amount;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                    GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;

                    //Cr Bank
                    LineNo := LineNo + 10000;
                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := 'MSACCO';
                    GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                    GenJournalLine."Account No." := MPesaAccount;
                    GenJournalLine."External Document No." := 'MPESA W/D';
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine."Document No." := DocumentNo;
                    GenJournalLine."Posting Date" := Today;
                    GenJournalLine.Description := Description;
                    GenJournalLine.Amount := Amount * -1;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                    GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;

                end;
                //MESSAGE('found');

                if Description = 'Business Payment Charge' then begin

                    TotalCharges := 0;
                    TotalCharges := MPesaCharges + MPESATRANS.Amount + Msaccocharge + Exceciseduty;

                    //Dr Bank
                    LineNo := LineNo + 10000;
                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := 'MSACCO';
                    GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                    GenJournalLine."Account No." := MPesaAccount;
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine."Document No." := DocumentNo;
                    GenJournalLine."Posting Date" := Today;
                    GenJournalLine.Description := 'MPESA Corporate Charges';
                    GenJournalLine.Amount := Amount * -1;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                    GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;

                    //Dr Member - total Charges
                    LineNo := LineNo + 10000;
                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := 'MSACCO';
                    GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                    GenJournalLine."Account No." := Account;
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine."Document No." := DocumentNo;
                    GenJournalLine."Posting Date" := Today;
                    GenJournalLine.Description := 'MPESA W/D Charges';
                    GenJournalLine.Amount := TotalCharges;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                    GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;


                    //Cr Exercise Duty
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MPESA-OL', LineNo, Optionsaccounts::"G/L Account", DocumentNo, 'Excise Duty', Exceciseduty * -1
                    , ExciseDutyGL, Today, Optionsaccounts::"G/L Account", '', 'MPESA W/D', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    //Cr Revenue
                    LineNo := LineNo + 10000;
                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := 'MSACCO';
                    GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                    GenJournalLine."Document No." := DocumentNo;
                    GenJournalLine."Posting Date" := Today;
                    GenJournalLine."Account No." := MPesaChargesAccount;
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine.Description := 'MPESA W/D Charges';
                    GenJournalLine.Amount := (MPesaCharges) * -1;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                    GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;

                    //Cr CoreTEC
                    LineNo := LineNo + 10000;
                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := 'MSACCO';
                    GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                    GenJournalLine."Document No." := DocumentNo;
                    GenJournalLine."Posting Date" := Today;
                    GenJournalLine."Account No." := Msaccoacc;
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine.Description := 'MSACCO W/D Charges';
                    GenJournalLine.Amount := Msaccocharge * -1;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                    GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;

                end;

                if Continue = true then begin

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                    GenJournalLine.SetRange("Journal Batch Name", 'MPESA-OL');
                    if GenJournalLine.Find('-') then begin
                        repeat
                            // GLPosting.Run(GenJournalLine);
                        until GenJournalLine.Next = 0;
                    end;

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                    GenJournalLine.SetRange("Journal Batch Name", 'MPESA-OL');
                    GenJournalLine.DeleteAll;

                    MPESATRANS.Posted := true;
                    MPESATRANS."Needs Change" := false;
                    MPESATRANS."Date Posted" := Today;
                    MPESATRANS."Time Posted" := Time;
                    MPESATRANS.Modify;

                    //MARK BUFFER AS POSTED
                    ATMTrans.Reset;
                    ATMTrans.SetRange(ATMTrans.Posted, false);
                    ATMTrans.SetRange(ATMTrans."Unit ID", 'M-PESA');
                    ATMTrans.SetRange(ATMTrans."Account No", Account);
                    ATMTrans.SetRange(ATMTrans.Amount, Amount);
                    if ATMTrans.Find('-') then begin
                        repeat
                            ATMTrans.Posted := true;
                            ATMTrans."Posting Date" := Today;
                            ATMTrans.Modify;
                        until ATMTrans.Next = 0
                    end;
                    Response := 0;
                end;
            end;
        end;
    end;


    procedure MsaccoUtilityPaymentConfirm(DocumentNo: Text[30]; TransType: Text[30]; Description: Text[100]; TranDate: Date; Account: Text[30]; Amount: Decimal; Otherd: Text[30]) Response: Integer
    begin
        //Response :=1;
        MPESATRANS.Reset;
        MPESATRANS.SetRange(MPESATRANS."Document No.", DocumentNo);
        if MPESATRANS.Find('-') then begin
            Response := 1;
        end
        else begin

            MPESATRANS.Init;
            MPESATRANS."Document No." := DocumentNo;
            MPESATRANS.Description := Description;
            MPESATRANS."Account No." := Account;
            MPESATRANS.Amount := Amount;
            MPESATRANS."Transaction Type" := TransType;
            MPESATRANS."Document Date" := TranDate;
            MPESATRANS."Transaction Date" := TranDate;
            MPESATRANS."Key Word" := Otherd;
            MPESATRANS.Posted := false;
            MPESATRANS.Insert;

            /*

            GenJournalLine.RESET;
            GenJournalLine.SETRANGE("Journal Template Name",'MSACCO');
            GenJournalLine.SETRANGE("Journal Batch Name",'MPESA-OL');
            GenJournalLine.DELETEALL;

            GenBatches.RESET;
            GenBatches.SETRANGE(GenBatches."Journal Template Name",'MSACCO');
            GenBatches.SETRANGE(GenBatches.Name,'MPESA-OL');
            IF GenBatches.FIND('-') = FALSE THEN BEGIN
              GenBatches.INIT;
              GenBatches."Journal Template Name":='MSACCO';
              GenBatches.Name:='MPESA-OL';
              GenBatches.Description:='M-PESA Transactions';
              GenBatches.VALIDATE(GenBatches."Journal Template Name");
              GenBatches.VALIDATE(GenBatches.Name);
              GenBatches.INSERT;
            END;

            //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ FOSA ACCOUNT ~~~~~~~~~~~~~~~

            saccoAccount.RESET;
            saccoAccount.SETRANGE(saccoAccount."No.",Account);
            IF saccoAccount.FIND('-') THEN BEGIN//IF vendor.GET(Account) THEN BEGIN

              IF TransType<>'Withdrawal' THEN BEGIN

                MPesaCharges:=0;
                MPesaChargesAccount:='';
                UtilityPaymentsGL:='';


                // Get Msacco Utility Payment G/L
                Charges.RESET;
                Charges.SETRANGE(Charges."Transaction Type",'MSACCOU');
                IF Charges.FIND('-') THEN BEGIN
                  Charges.TESTFIELD(Charges."G/L Account");
                  UtilityPaymentsGL:=Charges."G/L Account";
                END;


                   //Dr Member
                 LineNo:=LineNo+10000;
                 GenJournalLine.INIT;
                 GenJournalLine."Journal Template Name":='MSACCO';
                 GenJournalLine."Journal Batch Name":='MPESA-OL';
                 GenJournalLine."Line No.":=LineNo;
                 GenJournalLine."Account Type":=GenJournalLine."Account Type"::Savings;
                 GenJournalLine."Account No.":=Account;
                 GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                 GenJournalLine."Document No.":=DocumentNo;
                 GenJournalLine."External Document No.":='MSACCO W/D';
                 GenJournalLine."Posting Date":=TODAY;
                 GenJournalLine.Description:=Description;
                 GenJournalLine.Amount:=Amount;
                 GenJournalLine.VALIDATE(GenJournalLine.Amount);
                 GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                 GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                 GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                 GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                 IF GenJournalLine.Amount<>0 THEN
                 GenJournalLine.INSERT;


                  //Cr GL

                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='MSACCO';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::"G/L Account";
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."Posting Date":=TODAY;
                  GenJournalLine."Account No.":=UtilityPaymentsGL;// UtilityPaymentsGL;//GenJournalLine."Account No.":=GLAccount;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine.Description:=Description;
                  GenJournalLine.Amount:=Amount *-1;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;

                  MPESATRANS.Posted:=TRUE;
                  MPESATRANS."Needs Change":=FALSE;
                  MPESATRANS."Date Posted":=TODAY;
                  MPESATRANS."Time Posted":=TIME;
                  MPESATRANS.MODIFY;

                  ATMTrans.RESET;
                  ATMTrans.SETRANGE(ATMTrans.Posted,FALSE);
                  ATMTrans.SETRANGE(ATMTrans."Unit ID",'M-PESA');
                  ATMTrans.SETRANGE(ATMTrans."Account No",Account);
                  ATMTrans.SETRANGE(ATMTrans.Amount,Amount);
                  IF ATMTrans.FIND('-') THEN BEGIN
                    REPEAT
                    ATMTrans.Posted:=TRUE;
                    ATMTrans."Posting Date":=TODAY;
                    ATMTrans.MODIFY;
                    UNTIL ATMTrans.NEXT=0
                  END;

                  GenJournalLine.RESET;
                  GenJournalLine.SETRANGE("Journal Template Name",'MSACCO');
                  GenJournalLine.SETRANGE("Journal Batch Name",'MPESA-OL');
                  IF GenJournalLine.FIND('-') THEN BEGIN
                    REPEAT
                      GLPosting.RUN(GenJournalLine);
                    UNTIL GenJournalLine.NEXT = 0;
                  END;

                  GenJournalLine.RESET;
                  GenJournalLine.SETRANGE("Journal Template Name",'MSACCO');
                  GenJournalLine.SETRANGE("Journal Batch Name",'MPESA-OL');
                  GenJournalLine.DELETEALL;


                END;
              END;
              */
            Response := 0
        end;

    end;


    procedure PostUtilityPayment()
    var
        PostDesc: Text;
    begin
        MPESATRANS.Reset;
        MPESATRANS.SetRange(MPESATRANS."Transaction Type", 'UtilityPayment');
        MPESATRANS.SetRange(MPESATRANS.Posted, false);
        if MPESATRANS.Find('-') then begin

            //~~~~~~~~~~~ FOSA ACCOUNT ~~~~~~~~~~~~~~~//
            //MESSAGE('YEI'+ MPESATRANS."Account No.");
            saccoAccount.Reset;
            saccoAccount.SetRange(saccoAccount."No.", MPESATRANS."Account No.");
            if saccoAccount.Find('-') then begin
                if MPESATRANS."Transaction Type" = 'UtilityPayment' then begin
                    Message('YEI2');
                    MPesaCharges := 0;
                    MPesaChargesAccount := '';
                    UtilityPaymentsGL := '';

                    MsaccoChargesSetup.Reset;
                    MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
                    if MsaccoChargesSetup.Find('-') then begin
                        MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
                        Msaccoacc := MsaccoChargesSetup."Vendor No";
                    end;
                    // Dr Member
                    if StrPos(UpperCase(MPESATRANS.Description), 'AIRTIME') > 0 then begin
                        PostDesc := 'MSacco Airtime Purchase';
                    end else begin
                        PostDesc := 'MSacco Utility Payment';
                    end;

                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MPESA-OL', LineNo, Optionsaccounts::Savings, MPESATRANS."Document No.", PostDesc, MPESATRANS.Amount
                    , saccoAccount."No.", Today, Optionsaccounts::"G/L Account", '', 'MSACCO UTILITY', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    // Utility G/L Account

                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MPESA-OL', LineNo, Optionsaccounts::Vendor, MPESATRANS."Document No.", PostDesc, MPESATRANS.Amount * -1
                    , Msaccoacc, Today, Optionsaccounts::"G/L Account", '', 'MSACCO UTILITY', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);



                    ATMTrans.Reset;
                    ATMTrans.SetRange(ATMTrans.Posted, false);
                    ATMTrans.SetRange(ATMTrans."Unit ID", 'M-PESA');
                    ATMTrans.SetRange(ATMTrans."Account No", MPESATRANS."Account No.");
                    ATMTrans.SetRange(ATMTrans.Amount, MPESATRANS.Amount);
                    if ATMTrans.Find('-') then begin
                        repeat
                            ATMTrans.Posted := true;
                            ATMTrans."Posting Date" := Today;
                            ATMTrans.Modify();
                        until ATMTrans.Next = 0
                    end;

                    MPESATRANS.Posted := true;
                    MPESATRANS."Needs Change" := false;
                    MPESATRANS."Date Posted" := Today;
                    MPESATRANS."Time Posted" := Time;
                    MPESATRANS.Modify;
                    // Complete Posting
                    POSTJOURNAL.LinesCompletePosting('MSACCO', 'MPESA-OL');
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                    GenJournalLine.SetRange("Journal Batch Name", 'MPESA-OL');
                    GenJournalLine.DeleteAll;


                end;
            end;
        end;
    end;


    procedure InsertMsaccoOtherServices(TraceID: Code[100]; AccountNo: Code[100]; TelephoneNo: Text[30]; TransactionType: Code[50]; ChequeLeafFrom: Code[50]; ChequeLeafTo: Code[50]; TransactionDate: DateTime) Response: Integer
    var
        Text0001: label 'Dear %1  Your application for %2  has been received and is being processed. Your %3 will be ready in 14 Days and Ready for collection at %4. For more information please call %5';
        BranchName: Text;
        AccNo: Code[20];
    begin

        //MESSAGE(TransactionType);
        AccNo := DelChr(AccountNo, '=', 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM');
        BranchName := DelChr(AccountNo, '=', '1234567890-');
        BranchName := CopyStr(BranchName, 1, 1) + '' + Lowercase(DelStr(BranchName, 1, 1));
        MsaccoServices.Reset;
        MsaccoServices.SetRange(MsaccoServices."Account No", AccountNo);
        MsaccoServices.SetRange(MsaccoServices.Posted, false);
        if MsaccoServices.Find('-') then begin
            Response := 1;
        end else begin
            MsaccoServices.Init;
            MsaccoServices."Trace ID" := TraceID;
            MsaccoServices."Account No" := AccNo;
            MsaccoServices."Telephone No" := TelephoneNo;
            if (TransactionType = 'STOP ATM') then begin
                MsaccoServices."Transaction Type" := MsaccoServices."transaction type"::"Stop ATM"
            end;
            if (TransactionType = 'ATM REQUEST') then begin
                MsaccoServices."Transaction Type" := MsaccoServices."transaction type"::"ATM Request"
            end;
            if (TransactionType = 'CHEQUE REQUEST') then begin
                MsaccoServices."Transaction Type" := MsaccoServices."transaction type"::"Cheque Request"
            end;
            MsaccoServices."Cheque Leaf From" := Format(ChequeLeafFrom);
            MsaccoServices."Cheque Leaf To" := ChequeLeafTo;
            MsaccoServices."Transaction Date" := TransactionDate;
            MsaccoServices.Comment := BranchName;
            MsaccoServices.Posted := false;
            MsaccoServices.Insert;

            Response := 0;

        end;
    end;


    procedure GetLoanQualifiedAmount(TelephoneNo: Text[30]; LoanProductType: Text) QualifiedAmountFinal: Text[200]
    var
        DefaultedAmount: Integer;
        Members: Record 52185700;
        LoanProductTypeName: Text;
        DividendProgression: Record 52185713;
        PreviousDep: Decimal;
        CurrentDep: Decimal;
        SavAcc: Record 52185730;
        ATMNos: Record 52185432;
        Loans: Record 52185729;
        LoanBalance: Decimal;
    begin
        GenSetUp.Get;
        Continue := true;

        if StrLen(TelephoneNo) = 12 then
            TelephoneNo := '+' + TelephoneNo;

        QualifiedAmountFinal := '0';
        QualifyingAfterDed := 0;
        OutstandingAmount := 0;

        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."Transactional Mobile No", TelephoneNo);
        saccoAccount.SetFilter(saccoAccount.Blocked, '%1'/*|%2'*/, saccoAccount.Blocked::" ");//   ::Active,saccoAccount.Status::New);
        if saccoAccount.Find('-') then begin
            //MESSAGE('Hehe');


            // Dividend
            if LoanProductType = '136' then begin
                ProdFac.Get(LoanProductType);
                if ProdFac.Status = ProdFac.Status::Active then begin
                    SaccoAccMemberNo := saccoAccount."No.";


                    if Members.Get(saccoAccount."Member No.") then begin
                        if Members.Status <> Members.Status::Active then begin
                            QualifiedAmountFinal := '-1|0|0|Blocked Account';
                            exit;
                        end;
                    end;

                    if Members.Get(saccoAccount."Member No.") then begin
                        if Members."Dividend Action" <> Members."dividend action"::Pay then begin
                            QualifiedAmountFinal := '-1|0|0|You do not qualify';
                            exit;
                        end;
                    end;



                    SaccoAccount1.Reset;
                    SaccoAccount1.SetRange("Member No.", saccoAccount."Member No.");
                    SaccoAccount1.SetRange("Mobile Loan Blocked", true);
                    if SaccoAccount1.Find('-') then begin
                        Continue := false;
                        QualifiedAmountFinal := '-1|0|0|You are blocked from accessing this product';
                        exit;
                    end;


                    //.....................................
                    SavAcc.Reset;
                    SavAcc.SetRange("No.", saccoAccount."No.");
                    SavAcc.SetRange(Status, SavAcc.Status::Dormant);
                    if SavAcc.Find('-') then begin
                        if SavAcc.Blocked = SavAcc.Blocked::" " then begin
                            SavAcc.Blocked := SavAcc.Blocked::" ";
                            SavAcc.Status := SavAcc.Status::Active;
                            SavAcc."Status Change Reason" := 'Auto Activated on Dividend Posting2020';
                            SavAcc.Modify;
                        end;
                    end;


                    if Continue = true then begin
                        // Check if defaulter //

                        DefaultedAmount := 0;

                        Loans.Reset;
                        Loans.SetRange(Loans.Posted, true);//Loans.Status::Approved);
                        Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                        Loans.SetFilter("Outstanding Balance", '>%1', 0);
                        Loans.SetFilter(Loans."Loans Category-SASRA", '<>%1', Loans."loans category-sasra"::Perfoming);
                        if Loans.Find('-') then begin
                            repeat
                                Continue := false;
                                QualifiedAmountFinal := '-1|0|0|You have a defaulted loan';
                            until Loans.Next = 0;
                        end;
                    end;

                    if Continue = true then begin

                        // check if member has existing Salary Advance & M-Boosta Loan

                        Loans.Reset;
                        Loans.SetRange(Loans.Status, Loans.Status::Approved);
                        Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                        Loans.SetFilter(Loans."Loan Product Type", '%1', '136');
                        if Loans.Find('-') then begin
                            repeat

                                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                                if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > 0 then begin
                                    OutstandingAmount += (Loans."Outstanding Balance" + Loans."Outstanding Interest");
                                    LoanProductTypeName := Loans."Loan Product Type Name";
                                end;
                            until Loans.Next = 0
                        end;

                        if OutstandingAmount < 0 then begin
                            // Outstanding Dividend Loan
                            /*IF OutstandingAmount>0 THEN BEGIN
                               Continue := FALSE;
                               QualifiedAmountFinal := '-1|0|0|You have an existing Dividend loan';
                            END;*/
                            OutstandingAmount := 0;
                        end;
                    end;

                    /*IF Continue = TRUE THEN BEGIN
                       //Check Deposit
                       SaccoAccount1.RESET;
                       SaccoAccount1.SETRANGE("Member No.",saccoAccount."Member No.");
                       SaccoAccount1.SETRANGE("Product Category",SaccoAccount1."Product Category"::"Deposit Contribution");
                       SaccoAccount1.SETFILTER("Date Filter",'%1..',TODAY);
                       IF SaccoAccount1.FIND('-') THEN BEGIN
                         SaccoAccount1.CALCFIELDS("Balance (LCY)");
                         CurrentDep:=SaccoAccount1."Balance (LCY)";
                       END;

                       SaccoAccount1.RESET;
                       SaccoAccount1.SETRANGE("Member No.",saccoAccount."Member No.");
                       SaccoAccount1.SETRANGE("Product Category",SaccoAccount1."Product Category"::"Deposit Contribution");
                       SaccoAccount1.SETFILTER("Date Filter",'%1..',CALCDATE('1Y',TODAY));
                       IF SaccoAccount1.FIND('-') THEN BEGIN
                         SaccoAccount1.CALCFIELDS("Balance (LCY)");
                         PreviousDep:=SaccoAccount1."Balance (LCY)";
                       END;
                       IF CurrentDep<PreviousDep THEN BEGIN
                           Continue:=FALSE;
                           QualifiedAmountFinal := '-1|0|0|You do not qualify since your Deposits are inconsistent';
                         EXIT;
                         END;
                    END;*/
                    //Progression
                    if Continue = true then begin

                        DividendProgression.Reset;
                        DividendProgression.SetRange("Member No", saccoAccount."Member No.");
                        DividendProgression.SetFilter(Year, '2019');
                        if DividendProgression.Find('-') then begin
                            DividendProgression.CalcSums("Net Dividends", "Witholding Tax");
                            QualifyingAfterDed := ROUND((DividendProgression."Net Dividends"/*-DividendProgression."Witholding Tax"*/) * (GenSetUp."Div. Advance Rate" / 100), 100, '<');
                            if QualifyingAfterDed < ProdFac."Minimum Loan Amount" then begin
                                Continue := false;
                                QualifiedAmountFinal := '-1|0|0|You do not qualify for this product';
                            end;
                            if QualifyingAfterDed > ProdFac."Maximum Loan Amount" then
                                QualifyingAfterDed := ProdFac."Maximum Loan Amount";
                            // MESSAGE(FORMAT(QualifyingAfterDed));
                        end;
                    end;
                    if Continue = true then begin
                        QualifiedAmountFinal := '1|' + Format(QualifyingAfterDed) + '|' + Format(OutstandingAmount) + '|0'
                    end;
                end else begin
                    QualifiedAmountFinal := '-1|0|0|This product has been discontinued';
                end;
                // Dividend

                //Emergency
            end else
                if LoanProductType = '112' then begin
                    ProdFac.Get(LoanProductType);

                    if ProdFac.Status = ProdFac.Status::Active then begin
                        SaccoAccMemberNo := saccoAccount."No.";


                        if Members.Get(saccoAccount."Member No.") then begin
                            if Members.Status <> Members.Status::Active then begin
                                QualifiedAmountFinal := '-1|0|0|Blocked Account';
                                exit;
                            end;
                        end;

                        if Members.Get(saccoAccount."Member No.") then begin
                            if (Members."Employer Code" = '05') or (Members."Employer Code" = '99') or (Members."Employer Code" = '97') then begin

                                if GetAppraisaOrdinaryLoans(saccoAccount."Transactional Mobile No", LoanProductType) <= 0 then begin
                                    QualifiedAmountFinal := '-1|0|0|You do not qualify for this product';
                                    exit;
                                end;
                            end;
                            if (Members."Employer Code" = '9901') or (Members."Employer Code" = '9902') then
                                QualifiedAmountFinal := '-1|0|0|You do not qualify for this product';
                        end;


                        SaccoAccount1.Reset;
                        SaccoAccount1.SetRange("Member No.", saccoAccount."Member No.");
                        SaccoAccount1.SetRange("Mobile Loan Blocked", true);
                        if SaccoAccount1.Find('-') then begin
                            Continue := false;
                            QualifiedAmountFinal := '-1|0|0|You are blocked from accessing this product';
                            exit;
                        end;

                        if Continue = true then begin
                            // Check if defaulter //

                            DefaultedAmount := 0;

                            Loans.Reset;
                            Loans.SetRange(Loans.Posted, true);//Loans.Status::Approved);
                            Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                            Loans.SetFilter("Outstanding Balance", '>%1', 0);
                            Loans.SetFilter(Loans."Loans Category-SASRA", '<>%1', Loans."loans category-sasra"::Perfoming);
                            if Loans.Find('-') then begin
                                repeat
                                    Continue := false;
                                    QualifiedAmountFinal := '-1|0|0|You have a defaulted loan';
                                until Loans.Next = 0;
                            end;
                        end;

                        //Pending Application
                        if Continue = true then begin

                            DefaultedAmount := 0;
                            MsaccoLoans.Reset;
                            MsaccoLoans.SetRange("Account No", SaccoAccMemberNo);
                            MsaccoLoans.SetRange("Loan Code", LoanProductType);
                            MsaccoLoans.SetRange(Posted, false);
                            if MsaccoLoans.FindFirst then begin
                                QualifiedAmountFinal := '-1|0|0|You have a pending Emergency Loan application under processing';
                                Continue := false;
                                exit;
                            end;
                        end;

                        if Continue = true then begin

                            LoanBalance := 0;
                            Loans.Reset;
                            Loans.SetRange("Member No.", saccoAccount."Member No.");
                            Loans.SetRange(Posted, true);
                            Loans.SetRange("Loan Product Type", ProdFac."Product ID");
                            Loans.SetFilter("Outstanding Balance", '>0');
                            if Loans.Find('-') then begin
                                repeat
                                    Loans.CalcFields("Outstanding Balance", "Outstanding Interest");
                                    LoanBalance := LoanBalance + Loans."Outstanding Balance" + Loans."Outstanding Interest";
                                until Loans.Next = 0;
                            end;
                            QualifyingAfterDed := ProdFac."Maximum Loan Amount";//-ROUND((Loans."Outstanding Balance"+Loans."Outstanding Interest"),100,'>');
                            if QualifyingAfterDed > ProdFac."Maximum Loan Amount" then
                                QualifyingAfterDed := ProdFac."Maximum Loan Amount";
                        end else
                            QualifyingAfterDed := ProdFac."Maximum Loan Amount";

                        Members.Get(saccoAccount."Member No.");

                        if (Members."Employer Code" = '05') or (Members."Employer Code" = '99') then begin
                            if GetAppraisaOrdinaryLoans(saccoAccount."Transactional Mobile No", LoanProductType) > 0 then
                                QualifyingAfterDed := GetAppraisaOrdinaryLoans(saccoAccount."Transactional Mobile No", LoanProductType);
                        end;

                        // MESSAGE(FORMAT(QualifyingAfterDed));
                        //MESSAGE('we %1',ProdFac."Maximum Loan Amount");
                        //END;
                        if Continue = true then begin
                            QualifiedAmountFinal := '1|' + Format(QualifyingAfterDed) + '|' + Format(LoanBalance) + '|0'
                        end;
                    end else begin
                        QualifiedAmountFinal := '-1|0|0|This product has been discontinued';
                    end;


                    //Jisort
                end else
                    if (LoanProductType = '120') or (LoanProductType = '121') then begin
                        ProdFac.Get(LoanProductType);

                        if ProdFac.Status = ProdFac.Status::Active then begin
                            SaccoAccMemberNo := saccoAccount."No.";


                            if Members.Get(saccoAccount."Member No.") then begin
                                if Members.Status <> Members.Status::Active then begin
                                    QualifiedAmountFinal := '-1|0|0|Blocked Account';
                                    exit;
                                end;
                            end;

                            if Members.Get(saccoAccount."Member No.") then begin
                                if GetAppraisaFinjeJisort(saccoAccount."Transactional Mobile No", LoanProductType) <= ProdFac."Minimum Loan Amount" then begin
                                    QualifiedAmountFinal := '-1|0|0|You do not qualify for this product';
                                    exit;
                                end;
                                if (Members."Employer Code" = '9901') or (Members."Employer Code" = '9902') then
                                    QualifiedAmountFinal := '-1|0|0|You do not qualify for this product';
                            end;


                            SaccoAccount1.Reset;
                            SaccoAccount1.SetRange("Member No.", saccoAccount."Member No.");
                            SaccoAccount1.SetRange("Mobile Loan Blocked", true);
                            if SaccoAccount1.Find('-') then begin
                                Continue := false;
                                QualifiedAmountFinal := '-1|0|0|You are blocked from accessing this product';
                                exit;
                            end;

                            if Continue = true then begin
                                // Check if defaulter //

                                DefaultedAmount := 0;

                                Loans.Reset;
                                Loans.SetRange(Loans.Posted, true);//Loans.Status::Approved);
                                Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                                Loans.SetFilter("Outstanding Balance", '>%1', 0);
                                Loans.SetFilter(Loans."Loans Category-SASRA", '<>%1', Loans."loans category-sasra"::Perfoming);
                                if Loans.Find('-') then begin
                                    repeat
                                        Continue := false;
                                        QualifiedAmountFinal := '-1|0|0|You have a defaulted loan';
                                    until Loans.Next = 0;
                                end;
                            end;

                            //Pending Application
                            if Continue = true then begin

                                DefaultedAmount := 0;
                                MsaccoLoans.Reset;
                                MsaccoLoans.SetRange("Account No", SaccoAccMemberNo);
                                MsaccoLoans.SetRange("Loan Code", LoanProductType);
                                MsaccoLoans.SetRange(Posted, false);
                                if MsaccoLoans.FindFirst then begin
                                    QualifiedAmountFinal := '-1|0|0|You have a pending ' + ProdFac."Product Description" + ' Loan application under processing';
                                    Continue := false;
                                    exit;
                                end;
                            end;

                            if Continue = true then begin

                                LoanBalance := 0;
                                Loans.Reset;
                                Loans.SetRange("Member No.", saccoAccount."Member No.");
                                Loans.SetRange(Posted, true);
                                Loans.SetRange("Loan Product Type", ProdFac."Product ID");
                                Loans.SetFilter("Outstanding Balance", '>0');
                                if Loans.Find('-') then begin
                                    repeat
                                        Loans.CalcFields("Outstanding Balance", "Outstanding Interest");
                                        LoanBalance := LoanBalance + Loans."Outstanding Balance" + Loans."Outstanding Interest";
                                    until Loans.Next = 0;
                                end;


                                Members.Get(saccoAccount."Member No.");

                                if GetAppraisaFinjeJisort(saccoAccount."Transactional Mobile No", LoanProductType) > 0 then
                                    QualifyingAfterDed := GetAppraisaFinjeJisort(saccoAccount."Transactional Mobile No", LoanProductType);
                                if QualifyingAfterDed > ProdFac."Maximum Loan Amount" then
                                    QualifyingAfterDed := ProdFac."Maximum Loan Amount";
                                if QualifyingAfterDed < ProdFac."Minimum Loan Amount" then begin
                                    QualifiedAmountFinal := '-1|0|0|You do not qualify for this product';
                                    exit;
                                    Continue := false;
                                end;

                            end;
                            if Continue = true then begin
                                QualifiedAmountFinal := '1|' + Format(QualifyingAfterDed) + '|' + Format(LoanBalance) + '|0'
                            end;
                        end else begin
                            QualifiedAmountFinal := '-1|0|0|This product has been discontinued';
                        end;

                        //INUKA Loan
                    end else
                        if (LoanProductType = '140') then begin
                            ProdFac.Get(LoanProductType);

                            if ProdFac.Status = ProdFac.Status::Active then begin
                                SaccoAccMemberNo := saccoAccount."No.";


                                if Members.Get(saccoAccount."Member No.") then begin
                                    if Members.Status <> Members.Status::Active then begin
                                        QualifiedAmountFinal := '-1|0|0|Blocked Account';
                                        exit;
                                    end;
                                end;

                                if Members.Get(saccoAccount."Member No.") then begin
                                    /*IF GetAppraisaFinjeJisort(saccoAccount."Transactional Mobile No",LoanProductType)<=ProdFac."Minimum Loan Amount" THEN BEGIN
                                     QualifiedAmountFinal := '-1|0|0|You do not qualify for this product';
                                     EXIT;
                                   END;*/
                                    if (Members."Employer Code" = '9901') or (Members."Employer Code" = '9902') or (Members."Employer Code" = '05')
                                    or (Members."Employer Code" = '99') then begin
                                        QualifiedAmountFinal := '-1|0|0|You do not qualify for this product';
                                        exit;
                                    end;
                                end;


                                SaccoAccount1.Reset;
                                SaccoAccount1.SetRange("Member No.", saccoAccount."Member No.");
                                SaccoAccount1.SetRange("Mobile Loan Blocked", true);
                                if SaccoAccount1.Find('-') then begin
                                    Continue := false;
                                    QualifiedAmountFinal := '-1|0|0|You are blocked from accessing this product';
                                    exit;
                                end;

                                if Continue = true then begin
                                    // Check if defaulter //

                                    DefaultedAmount := 0;

                                    Loans.Reset;
                                    Loans.SetRange(Loans.Posted, true);//Loans.Status::Approved);
                                    Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                                    Loans.SetFilter("Outstanding Balance", '>%1', 0);
                                    Loans.SetFilter(Loans."Loans Category-SASRA", '<>%1', Loans."loans category-sasra"::Perfoming);
                                    if Loans.Find('-') then begin
                                        repeat
                                            Continue := false;
                                            QualifiedAmountFinal := '-1|0|0|You have a defaulted loan';
                                        until Loans.Next = 0;
                                    end;
                                end;

                                //Pending Application
                                if Continue = true then begin

                                    DefaultedAmount := 0;
                                    MsaccoLoans.Reset;
                                    MsaccoLoans.SetRange("Account No", SaccoAccMemberNo);
                                    MsaccoLoans.SetRange("Loan Code", LoanProductType);
                                    MsaccoLoans.SetRange(Posted, false);
                                    if MsaccoLoans.FindFirst then begin
                                        QualifiedAmountFinal := '-1|0|0|You have a pending ' + ProdFac."Product Description" + ' Loan application under processing';
                                        Continue := false;
                                        exit;
                                    end;
                                end;

                                //Check Salary
                                if Continue = true then begin
                                    SalBuffer.Reset;
                                    SalBuffer.SetRange("Account No.", SaccoAccMemberNo);
                                    SalBuffer.SetRange(Posted, true);
                                    if not SalBuffer.Find('-') then begin

                                        QualifiedAmountFinal := '-1|0|0|You do not qualify, Salary not channelled through Sacco';
                                        Continue := false;
                                        exit;
                                    end;
                                end;

                                if Continue = true then begin

                                    LoanBalance := 0;
                                    Loans.Reset;
                                    Loans.SetRange("Member No.", saccoAccount."Member No.");
                                    Loans.SetRange(Posted, true);
                                    Loans.SetRange("Loan Product Type", ProdFac."Product ID");
                                    Loans.SetFilter("Outstanding Balance", '>0');
                                    if Loans.Find('-') then begin
                                        repeat
                                            Loans.CalcFields("Outstanding Balance", "Outstanding Interest");
                                            LoanBalance := LoanBalance + Loans."Outstanding Balance" + Loans."Outstanding Interest";
                                        until Loans.Next = 0;
                                    end;


                                    Members.Get(saccoAccount."Member No.");

                                    QualifyingAfterDed := ProdFac."Maximum Loan Amount";// GetAppraisaFinjeJisort(saccoAccount."Transactional Mobile No",LoanProductType);
                                    if QualifyingAfterDed > ProdFac."Maximum Loan Amount" then
                                        QualifyingAfterDed := ProdFac."Maximum Loan Amount";
                                    if QualifyingAfterDed < ProdFac."Minimum Loan Amount" then begin
                                        QualifiedAmountFinal := '-1|0|0|You do not qualify for this product';
                                        exit;
                                        Continue := false;
                                    end;

                                end;
                                if Continue = true then begin
                                    QualifiedAmountFinal := '1|' + Format(QualifyingAfterDed) + '|' + Format(LoanBalance) + '|0'
                                end;
                            end else begin
                                QualifiedAmountFinal := '-1|0|0|This product has been discontinued';
                            end;

                            //School Fees Loan
                        end else
                            if (LoanProductType = '113') or (LoanProductType = '111') or (LoanProductType = '115') or (LoanProductType = '124') then begin
                                ProdFac.Get(LoanProductType);
                                // MESSAGE('we %1',ProdFac."Product ID");
                                if ProdFac.Status = ProdFac.Status::Active then begin
                                    SaccoAccMemberNo := saccoAccount."No.";


                                    if Members.Get(saccoAccount."Member No.") then begin
                                        if Members.Status <> Members.Status::Active then begin
                                            QualifiedAmountFinal := '-1|0|0|Blocked Account';
                                            exit;
                                        end;
                                    end;

                                    if Members.Get(saccoAccount."Member No.") then begin
                                        if (LoanProductType <> '115') and (LoanProductType <> '124') then begin
                                            if (Members."Employer Code" = '05') or (Members."Employer Code" = '99') or (Members."Employer Code" = '97') then begin
                                                if GetAppraisaOrdinaryLoans(saccoAccount."Transactional Mobile No", LoanProductType) <= 0 then begin
                                                    QualifiedAmountFinal := '-1|0|0|You do not qualify for this product';
                                                    exit;
                                                end;
                                            end;
                                        end;
                                    end;
                                    //**QualifyNOT Jisaidie
                                    if Members.Get(saccoAccount."Member No.") then begin
                                        if (LoanProductType = '115') or (LoanProductType = '124') then begin
                                            if (Members."Employer Code" = '05') or (Members."Employer Code" = '99') or (Members."Employer Code" = '97') then begin
                                                QualifiedAmountFinal := '-1|0|0|You do not qualify for this product';
                                                exit;
                                            end;
                                        end;
                                        if (Members."Employer Code" = '9901') or (Members."Employer Code" = '9902') then
                                            QualifiedAmountFinal := '-1|0|0|You do not qualify for this product';
                                    end;


                                    SaccoAccount1.Reset;
                                    SaccoAccount1.SetRange("Member No.", saccoAccount."Member No.");
                                    SaccoAccount1.SetRange("Mobile Loan Blocked", true);
                                    if SaccoAccount1.Find('-') then begin
                                        Continue := false;
                                        QualifiedAmountFinal := '-1|0|0|You are blocked from accessing this product';
                                        exit;
                                    end;

                                    if Continue = true then begin
                                        // Check if defaulter //

                                        DefaultedAmount := 0;

                                        Loans.Reset;
                                        Loans.SetRange(Loans.Posted, true);//Loans.Status::Approved);
                                        Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                                        Loans.SetFilter("Outstanding Balance", '>%1', 0);
                                        Loans.SetFilter(Loans."Loans Category-SASRA", '<>%1', Loans."loans category-sasra"::Perfoming);
                                        if Loans.Find('-') then begin
                                            repeat
                                                Continue := false;
                                                QualifiedAmountFinal := '-1|0|0|You have a defaulted loan';
                                            until Loans.Next = 0;
                                        end;
                                    end;

                                    //Pending Application
                                    if Continue = true then begin

                                        DefaultedAmount := 0;
                                        MsaccoLoans.Reset;
                                        MsaccoLoans.SetRange("Account No", SaccoAccMemberNo);
                                        MsaccoLoans.SetRange("Loan Code", LoanProductType);
                                        MsaccoLoans.SetRange(Posted, false);
                                        if MsaccoLoans.FindFirst then begin
                                            QualifiedAmountFinal := '-1|0|0|You have a pending Loan application under processing';
                                            Continue := false;
                                            exit;
                                        end;
                                    end;

                                    //** Jisaidie72
                                    if LoanProductType = '124' then begin
                                        SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                                        SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                                        SalBuffer.SetRange(SalBuffer.Posted, true);
                                        if not SalBuffer.Find('-') then begin
                                            QualifiedAmountFinal := '-1|0|0|Your salary is not processed through Harambee FOSA';
                                            Continue := false;
                                            exit;
                                        end;
                                    end;
                                    if Continue = true then begin
                                        LoanBalance := 0;
                                        Loans.Reset;
                                        Loans.SetRange("Member No.", saccoAccount."Member No.");
                                        Loans.SetRange(Posted, true);
                                        Loans.SetRange("Loan Product Type", ProdFac."Product ID");
                                        Loans.SetFilter("Outstanding Balance", '>0');
                                        if Loans.Find('-') then begin
                                            repeat
                                                Loans.CalcFields("Outstanding Balance", "Outstanding Interest");
                                                LoanBalance := LoanBalance + Loans."Outstanding Balance" + Loans."Outstanding Interest";
                                            until Loans.Next = 0;
                                        end;
                                        QualifyingAfterDed := ProdFac."Maximum Loan Amount";//-ROUND((Loans."Outstanding Balance"+Loans."Outstanding Interest"),100,'>');
                                        if QualifyingAfterDed > ProdFac."Maximum Loan Amount" then
                                            QualifyingAfterDed := ProdFac."Maximum Loan Amount";
                                        if ProdFac."Maximum Loan Amount(Mobile)" <> 0 then
                                            QualifyingAfterDed := ProdFac."Maximum Loan Amount(Mobile)"
                                    end else
                                        QualifyingAfterDed := ProdFac."Maximum Loan Amount";

                                    Members.Get(saccoAccount."Member No.");

                                    if (Members."Employer Code" = '05') or (Members."Employer Code" = '99') then begin
                                        if LoanProductType = '113' then begin
                                            if GetAppraisaOrdinaryLoans(saccoAccount."Transactional Mobile No", LoanProductType) > 0 then
                                                QualifyingAfterDed := GetAppraisaOrdinaryLoans(saccoAccount."Transactional Mobile No", LoanProductType);
                                        end;
                                    end;

                                    //MESSAGE(FORMAT(QualifyingAfterDed));
                                    //MESSAGE('we %1',ProdFac."Maximum Loan Amount");
                                    //END;
                                    if Continue = true then begin
                                        QualifiedAmountFinal := '1|' + Format(QualifyingAfterDed) + '|' + Format(LoanBalance) + '|' + Format(ProdFac."Minimum Loan Amount")
                                    end;
                                end else begin
                                    QualifiedAmountFinal := '-1|0|0|This product has been discontinued';
                                end;

                            end else begin
                                QualifiedAmountFinal := '-1|0|0|Product not found';
                            end;
        end else begin
            ATMNos.Init;
            ATMNos."Loan Namber" := TelephoneNo;
            ATMNos."EMployer LN" := 'YOU000';
            ATMNos.Insert;

            QualifiedAmountFinal := '-1|0|0|Member status should be active and not blocked';
        end;
        //MESSAGE(FORMAT(QualifiedAmountFinal));

    end;


    procedure VirtualRegistrations(TelephoneNo: Text[50]; IdNo: Code[30]; MpesaNames: Text[100]; IPRSNames: Text[100]; DateOfBirth: Date; Occupation: Text[100]; Citizenship: Text[50]; Gender: Text[3]; PlaceOfBirth: Text[100]; RegOffice: Text[150]; MemberType: Text[100]; PostalAddress: Text[250]) Response: Integer
    begin

        MSACCORegistrations.Reset;
        MSACCORegistrations.SetRange(MSACCORegistrations."Id No", IdNo);
        if MSACCORegistrations.Find('-') then begin
            Response := 1;
        end
        else begin

            MSACCORegistrations.Init;
            MSACCORegistrations."Telephone No" := TelephoneNo;
            MSACCORegistrations."Id No" := IdNo;
            MSACCORegistrations."Mpesa Names" := MpesaNames;
            MSACCORegistrations."IPRS Names" := IPRSNames;
            MSACCORegistrations."Date of Birth" := DateOfBirth;
            MSACCORegistrations.Occupation := Occupation;
            MSACCORegistrations.Citizenship := Citizenship;
            MSACCORegistrations.Gender := Gender;
            MSACCORegistrations."Place Birth" := PlaceOfBirth;
            MSACCORegistrations."Reg Office" := RegOffice;
            MSACCORegistrations.Posted := false;//TRUE;
            MSACCORegistrations.IDisValid := true;
            MSACCORegistrations."Postal Address" := PostalAddress;
            MSACCORegistrations."Entry Date" := Today;
            MSACCORegistrations."Entry Time" := Time;
            MSACCORegistrations."Reffered By" := PostalAddress;
            MSACCORegistrations.Insert;

            //Create Record.
            if IPRSNames <> '' then begin
                MemberVirtualReg(IdNo, IPRSNames, Gender, DateOfBirth, TelephoneNo, Citizenship, PostalAddress);
            end;

            Response := 0;
        end;
    end;


    procedure PostSMSAlertCharges()
    begin
        SMSALERTS.Reset;
        SMSALERTS.SetRange(SMSALERTS.Posted, false);
        SMSALERTS.SetRange(SMSALERTS.IsChargeable, true);
        SMSALERTS.SetRange(SMSALERTS."Sent To Server", SMSALERTS."sent to server"::Yes);
        SMSALERTS.SetFilter(SMSALERTS."Account No", '<>%1', '');
        SMSALERTS.SetFilter(SMSALERTS."Telephone No", '<>%1', '');
        if SMSALERTS.Find('-') then begin
            repeat

                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."No.", SMSALERTS."Account No");
                if saccoAccount.Find('-') then begin
                    Docno := Format(SMSALERTS."Entry No");
                    saccoAccount.CalcFields(saccoAccount.Balance);

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                    GenJournalLine.SetRange("Journal Batch Name", 'BULKSMS');
                    GenJournalLine.DeleteAll;

                    // Get SMS G/L and Charge Amount
                    Charges.Reset;
                    Charges.SetRange(Charges."Transaction Type", 'MSACCOSMS');
                    if Charges.Find('-') then begin
                        Charges.TestField(Charges."G/L Account");
                        TotalCharges := Charges."Charge Amount";
                        SMSAlertsAccount := Charges."G/L Account";
                    end;


                    //================================================================

                    GenBatches.Reset;
                    GenBatches.SetRange(GenBatches."Journal Template Name", 'MSACCO');
                    GenBatches.SetRange(GenBatches.Name, 'BULKSMS');
                    if GenBatches.Find('-') = false then begin
                        GenBatches.Init;
                        GenBatches."Journal Template Name" := 'MSACCO';
                        GenBatches.Name := 'BULKSMS';
                        GenBatches.Description := 'SMS alert charges';
                        GenBatches.Validate(GenBatches."Journal Template Name");
                        GenBatches.Validate(GenBatches.Name);
                        GenBatches.Insert;
                    end;

                    //CR SMS Alert G/L - total Charges
                    LineNo := LineNo + 10000;
                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := 'MSACCO';
                    GenJournalLine."Journal Batch Name" := 'BULKSMS';
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                    GenJournalLine."Account No." := SMSAlertsAccount;
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine."Document No." := Docno;
                    GenJournalLine."Posting Date" := Today;
                    GenJournalLine.Description := 'SMS alert charges';
                    GenJournalLine.Amount := TotalCharges * -1;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                    GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;

                    //DR Member - total Charges
                    LineNo := LineNo + 10000;
                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := 'MSACCO';
                    GenJournalLine."Journal Batch Name" := 'BULKSMS';
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                    GenJournalLine."Account No." := saccoAccount."No.";
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine."External Document No." := 'SMS CHARGES';
                    GenJournalLine."Document No." := Docno;
                    GenJournalLine."Posting Date" := Today;
                    GenJournalLine.Description := 'SMS alert charges';
                    GenJournalLine.Amount := TotalCharges;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                    GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;

                    SMSALERTS.Posted := true;
                    SMSALERTS.Modify;

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                    GenJournalLine.SetRange("Journal Batch Name", 'BULKSMS');
                    if GenJournalLine.Find('-') then begin
                        repeat
                            // GLPosting.Run(GenJournalLine);
                        until GenJournalLine.Next = 0;
                    end;
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                    GenJournalLine.SetRange("Journal Batch Name", 'BULKSMS');
                    GenJournalLine.DeleteAll;
                    //================================================================

                end;

            until SMSALERTS.Next = 0;
        end;
    end;


    procedure MSaccoApplications(TelephoneNo: Text[50]; AccountNo: Code[50]; TraceId: Code[50]; Names: Text[250]; IdNo: Text[10]) Response: Integer
    begin

        TelephoneNo := TelephoneNo;

        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."No.", AccountNo);
        saccoAccount.SetRange(saccoAccount."ID No.", IdNo);
        if saccoAccount.Find('-') then begin

            MpesaApplications.Reset;
            MpesaApplications.SetRange(MpesaApplications."MPESA Mobile No", TelephoneNo);

            if MpesaApplications.Find('-') then begin
                Response := 1;
            end
            else begin
                MpesaAppD.Reset;
                MpesaAppD.SetRange(MpesaAppD."Application No", AccountNo);
                if MpesaAppD.Find('-') then begin
                    Response := 1;
                end else begin
                    MpesaApplications.Init;
                    MpesaApplications."Date Entered" := Today;
                    MpesaApplications."Time Entered" := Time;
                    MpesaApplications."Entered By" := UserId;
                    MpesaApplications."Document Serial No" := saccoAccount."ID No.";
                    MpesaApplications."Document Date" := Today;
                    MpesaApplications."Customer ID No" := saccoAccount."ID No.";
                    MpesaApplications."Customer Name" := saccoAccount.Name;
                    MpesaApplications."MPESA Mobile No" := TelephoneNo;
                    MpesaApplications."MPESA Corporate No" := '651474';
                    MpesaApplications."App Status" := MpesaApplications."app status"::Approved;
                    MpesaApplications."Approved By" := UserId;
                    MpesaApplications."Sent To Server" := MpesaApplications."sent to server"::No;
                    MpesaApplications."1st Approval By" := UserId;
                    MpesaApplications.Status := MpesaApplications.Status::Pending;
                    MpesaApplications."Application Type" := MpesaApplications."application type"::Initial;
                    MpesaApplications."Virtual Registration" := true;
                    MpesaApplications.Insert(true);

                    MpesaAppD.Init;
                    MpesaAppD."Application No" := MpesaApplications.No;
                    MpesaAppD."Account Type" := MpesaAppD."account type"::Creditor;
                    MpesaAppD."Account No." := saccoAccount."No.";
                    MpesaAppD.Description := saccoAccount.Name;
                    MpesaAppD.Insert;

                    Response := 0;
                end;
            end;

        end else begin
            Response := 1;
        end;
    end;


    procedure CreateAccounts() Account: Text[200]
    var
        Dimension: Record "Dimension Value";
        AccountNo: Code[30];
        Cust: Record 52185730;
        Msacco: Record 52185757;
        Msaccodet: Record 52185758;
    begin

        MApps.Reset;
        MApps.SetRange(MApps.Posted, false);
        if MApps.FindFirst then begin
            repeat

                Cust.Reset;
                Cust.SetRange(Cust."ID No.", MApps."Id No");
                if Cust.FindFirst then begin
                    Sendsms.SendSms(Optionsms::MSACCO, MApps."Telephone No", 'Dear ' + MApps."IPRS Names" + ', similar id already exist, Please contact Stima SACCO.', '', Cust."No.", false);
                    MApps.Posted := true;
                    MApps.Modify;
                    exit;
                end;

                if MApps."IPRS Names" <> '' then begin
                    GenSetUp.Get;


                    //Create a member account
                    Cust.Reset;
                    Cust.Init;
                    Cust."No." := '';
                    Cust.Name := UpperCase(MApps."IPRS Names");//UPPERCASE(Name);
                    Cust.City := MApps."Place Birth";//City;
                    Cust.County := MApps."Place Birth";//City;
                    Cust."Phone No." := MApps."Telephone No";//"Phone No.";
                    Cust."Registration Date" := Today;
                    Cust.Status := Cust.Status::New;
                    Cust."Date of Birth" := MApps."Date of Birth";//"Date of Birth";
                    Cust."ID No." := MApps."Id No";//"ID No.";
                    Cust."Mobile Phone No" := MApps."Telephone No";//"Mobile Phone No";
                    Cust."Global Dimension 1 Code" := 'BOSA';
                    Cust."Global Dimension 2 Code" := 'MOMBASA';
                    if MApps.Gender = 'M' then
                        Cust.Gender := Cust.Gender::Male
                    else
                        Cust.Gender := Cust.Gender::Female;

                    Cust."Virtual Member" := true;
                    Cust.Insert(true);

                    //create bosa DEPOSIT CONTRIBUTION account
                    if ProdFac.Get('S02') then begin

                        AcctNo := ProdFac."Account No. Prefix" + Cust."No.";//"Member No.";

                        Accounts.Init;
                        Accounts."No." := AcctNo;
                        Accounts."Date of Birth" := MApps."Date of Birth";//"Date of Birth";
                        Accounts.Name := UpperCase(MApps."IPRS Names");//UPPERCASE(MApp."IPRS Names");//"First Name"+' '+"Second Name"+' '+"Last Name";
                        Accounts.Validate(Accounts.Name);
                        Accounts."ID No." := MApps."Id No";//"ID No.";
                        Accounts."Mobile Phone No" := MApps."Telephone No";//"Mobile Phone No";
                        Accounts."Member No." := Cust."No.";//"Member No.";
                        Accounts.Status := Accounts.Status::" ";
                        Accounts."Account Category" := Accounts."account category"::Member;
                        Accounts."Phone No." := MApps."Telephone No";//"Phone No.";
                        Accounts."Registration Date" := Today;
                        Accounts.Status := Accounts.Status::New;
                        Accounts."Customer Posting Group" := ProdFac."Product Posting Group";
                        Accounts."Can Guarantee Loan" := ProdFac."Can Guarantee Loan";
                        Accounts."Product Type" := ProdFac."Product ID";
                        Accounts."Product Category" := ProdFac."Product Category";
                        Accounts."Loan Security Inclination" := ProdFac."Loan Security Inclination";
                        Accounts."Product Name" := ProdFac."Product Description";
                        Accounts."Loan Disbursement Account" := ProdFac."Loan Disbursement Account";
                        Accounts."Can Guarantee Loan" := ProdFac."Can Guarantee Loan";
                        Accounts.Insert(true);
                    end;


                    //create Bosa SHARES account
                    if ProdFac.Get('S01') then begin
                        AcctNo := ProdFac."Account No. Prefix" + Cust."No.";//"Member No.";

                        Accounts.Init;
                        Accounts."No." := AcctNo;
                        Accounts."Date of Birth" := MApps."Date of Birth";
                        Accounts.Name := UpperCase(MApps."IPRS Names");//"First Name"+' '+"Second Name"+' '+"Last Name";
                        Accounts.Validate(Accounts.Name);
                        Accounts."ID No." := MApps."Id No";//"ID No.";
                        Accounts."Mobile Phone No" := MApps."Telephone No";//"Mobile Phone No";
                        Accounts."Member No." := Cust."No.";//"Member No.";
                        Accounts.Status := Accounts.Status::New;
                        Accounts."Account Category" := Accounts."account category"::Member;
                        Accounts."Phone No." := MApps."Telephone No";//"Phone No.";
                        Accounts."Registration Date" := Today;
                        Accounts.Status := Accounts.Status::New;
                        Accounts."Customer Posting Group" := ProdFac."Product Posting Group";
                        Accounts."Can Guarantee Loan" := ProdFac."Can Guarantee Loan";
                        Accounts."Product Type" := ProdFac."Product ID";
                        Accounts."Product Category" := ProdFac."Product Category";
                        Accounts."Loan Security Inclination" := ProdFac."Loan Security Inclination";
                        Accounts."Product Name" := ProdFac."Product Description";
                        Accounts."Loan Disbursement Account" := ProdFac."Loan Disbursement Account";
                        Accounts."Can Guarantee Loan" := ProdFac."Can Guarantee Loan";
                        Accounts.Insert(true);
                    end;

                    //end create bosa shares account

                    // Create MSACCO Application - Link Savings Account to MSACCO

                    Msacco.Init;
                    Msacco."Date Entered" := Today;
                    Msacco."Time Entered" := Time;
                    Msacco."Entered By" := UserId;
                    Msacco."Document Serial No" := MApps."Telephone No"; // FORMAT(MApps."Entry No");
                    Msacco."Document Date" := Today;
                    Msacco."Customer ID No" := MApps."Id No";
                    Msacco."Customer Name" := MApps."IPRS Names";
                    Msacco."MPESA Mobile No" := MApps."Telephone No";
                    Msacco."MPESA Corporate No" := '651474';
                    Msacco."Date Approved" := Today;
                    Msacco."Time Approved" := Time;
                    Msacco."App Status" := Msacco."app status"::Approved;
                    Msacco."Approved By" := UserId;
                    Msacco."Sent To Server" := Msacco."sent to server"::No;
                    Msacco."1st Approval By" := UserId;
                    Msacco."Date 1st Approval" := Today;
                    Msacco."Time First Approval" := Time;
                    Msacco.Status := Msacco.Status::Approved;
                    Msacco."Application Type" := Msacco."application type"::Initial;
                    Msacco."I agree information is true" := true;
                    Msacco."Virtual Registration" := true;
                    Msacco.Insert(true);

                    Msaccodet.Init;
                    Msaccodet."Application No" := Msacco.No;
                    Msaccodet."Account Type" := Msaccodet."account type"::Creditor;
                    Msaccodet."Account No." := Accounts."No.";
                    Msaccodet.Description := MApps."IPRS Names";
                    Msaccodet.Insert;

                    MApps.Posted := true;
                    MApps.Modify;

                    Sendsms.SendSms(Optionsms::MSACCO, MApps."Telephone No", 'Dear ' + MApps."IPRS Names" + ', Welcome to Harambee SACCO your Member Number is ' + Cust."No.", '', '', false);

                end;

            until MApps.Next = 0;
        end;
    end;


    procedure GetGuarantorsInformation(PhoneNo: Text) GuarantorsInfo: Text[100]
    begin

        PhoneNo := '+' + PhoneNo;
        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."Transactional Mobile No", PhoneNo);
        if saccoAccount.Find('-') then begin
            /*MsaccoGuarantors.RESET;
            MsaccoGuarantors.SETRANGE("Guarontor Telephone No",PhoneNo);
            IF MsaccoGuarantors.COUNT<5 THEN*/
            GuarantorsInfo := saccoAccount."No." + '|' + saccoAccount.Name + '|' + saccoAccount."Transactional Mobile No"
        end;

    end;


    procedure MsaccoDeposit(DocumentNo: Text[30]; TransType: Text[30]; Description: Text[50]; TranDate: Date; Account: Text[30]; Amount: Decimal; Otherd: Text[100]; Phone: Text[50]) Response: Integer
    begin

        MPESATRANS.Reset;
        MPESATRANS.SetRange(MPESATRANS."Document No.", DocumentNo);
        if MPESATRANS.Find('-') then begin
            Response := 1
        end else begin
            MPESATRANS.Init;
            MPESATRANS."Document No." := DocumentNo;
            MPESATRANS.Description := Description;
            MPESATRANS."Account No." := Account;
            MPESATRANS.Amount := Amount;
            MPESATRANS."Transaction Type" := TransType;
            MPESATRANS."Document Date" := TranDate;
            MPESATRANS."Transaction Date" := TranDate;
            MPESATRANS."Key Word" := Otherd;
            MPESATRANS.Posted := false;
            MPESATRANS."Telephone No" := Phone;
            MPESATRANS.Insert;
        end;
    end;


    procedure MsaccoCreateGuarantors(Session: Text; GuarontorTelephoneNo: Code[100]; ApplicantTelephoneNo: Code[20]) Response: Integer
    begin
        MsaccoLoans.Reset;
        MsaccoLoans.SetRange(DocumentNo, Session);
        if MsaccoLoans.Find('-') then begin
            MsaccoGuarantors.Reset;
            MsaccoGuarantors.SetRange(MsaccoGuarantors."Msacco Loans Entry No", Format(MsaccoLoans."Entry no"));
            MsaccoGuarantors.SetRange(MsaccoGuarantors."Guarontor Telephone No", GuarontorTelephoneNo);
            if MsaccoGuarantors.Find('-') then begin
                Response := 1;
            end else begin

                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."Transactional Mobile No", GuarontorTelephoneNo);
                if saccoAccount.Find('-') then begin

                    MsaccoLoans.Reset;
                    MsaccoLoans.SetRange(MsaccoLoans.DocumentNo, Session);
                    if MsaccoLoans.Find('-') then begin

                        MsaccoGuarantors.Init;
                        MsaccoGuarantors."Msacco Loans Entry No" := Format(MsaccoLoans."Entry no");
                        MsaccoGuarantors."Guarontor Telephone No" := GuarontorTelephoneNo;
                        MsaccoGuarantors."Applicant Telephone No" := ApplicantTelephoneNo;
                        MsaccoGuarantors."Guarontor Account No" := saccoAccount."No.";
                        MsaccoGuarantors."Guarontor Name" := saccoAccount.Name;
                        MsaccoGuarantors."Loan No" := MsaccoLoans."Loan No";
                        MsaccoGuarantors.Posted := false;
                        MsaccoGuarantors.Insert;

                        Response := 0;
                    end;
                end;
            end;
        end;
    end;


    procedure CallManualFunctions(Type: Text) Results: Text[30]
    begin
        /*
        
        //PostATMtrans.RUN();
        IF (Type = '1') THEN BEGIN
          //PostWithdrawals();
        InstantLoanAlerts();
          //**PostDividendLoan();
        
         // PostMBOOSTALoanEdited();
        END
        ELSE IF (Type = '2') THEN BEGIN
          PostFundsTransfer();
          //**- PostWithdrawals()
         //** PostDividendLoan();
         // PostMBOOSTALoanEdited();
        END
        ELSE IF Type = '3' THEN BEGIN
        PostSMSAlertCharges();
          //**- PostWithdrawals()
        END
        ELSE IF Type = '4' THEN BEGIN
        PostATMtrans.RUN();
        END
        ELSE IF Type = '5' THEN BEGIN
        //PostMobileLoanRepayments();
        PostUtilityPayment();
        END
        ELSE IF Type = '6' THEN BEGIN
        PostSalaryAdvanceLoan();
        END
        ELSE IF Type = '7' THEN BEGIN
        PostMBOOSTALoanEdited();
          PostEmergencyLoan();
        END
        ELSE IF Type = '8' THEN BEGIN
        MBoostaPenalty();
        PostScoolFeesLoan();
        END
        ELSE IF Type = '9' THEN BEGIN
        MBoostaRecovery();
          //**PostEmergencyLoan();
        END
        ELSE IF Type = '10' THEN BEGIN
        PostMBOOSTALoan();
         PostEmergencyLoan();
        //PostDividendLoan();
        END
        ELSE IF Type = '11' THEN BEGIN
        //PostMobileLoanRepayments();
          CreateGuarantors();
        //**BlockATM();
        //**ATMCardLinking();
        //**ChequeBookRequests();
        //**-PostEmergencyLoan();
        PostSalaryAdvanceIILoan();
        END
        ELSE IF (Type = '12') THEN BEGIN
          PostATMtrans.RUN();
          PostFinjeJisortLoans();
          PostEmergencyLoan();
        END
        ELSE IF (Type = '13') THEN BEGIN
        
        //**-PostEmergencyLoan();
        PostSalaryAdvanceIILoan();
        
        END
        
        ELSE IF (Type='14') THEN BEGIN
        //PostMBOOSTALoan();
        //PostATMtrans.RUN();
         //PostEmergencyLoan();
        
         PostScoolFeesLoan();
         PostSalaryOrdinaryLoans();
         PostFinjeJisortLoans();
        
         //PostDeposits();
         PostFailedDeposits();
         END ELSE BEGIN
        END;
        //PostSMSAlertCharges();
        //CreateAccounts(); // create virtual members
        */

    end;


    procedure GetMobileLoans() Loans: Text
    begin

        ProdFac.Reset;
        ProdFac.SetRange(ProdFac."Product Class Type", ProdFac."product class type"::Loan);
        ProdFac.SetRange(ProdFac."Mobile Loan", true);
        if ProdFac.Find('-') then begin
            repeat
                Loans := Loans + ProdFac."Product ID" + '|' + ProdFac."Product Description" + ';';
            until ProdFac.Next = 0;
        end;
    end;


    procedure GetExciseDutyGL() account: Text[20]
    begin

        GenLedgerSetup.Reset;
        GenLedgerSetup.Get;
        GenLedgerSetup.TestField(GenLedgerSetup."Excise Duty G/L");
        account := GenLedgerSetup."Excise Duty G/L";
    end;


    procedure GetDebitableAccounts(Phone: Text[30]) Accounts: Text[1020]
    begin

        Phone := '+' + Phone;
        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."Transactional Mobile No", Phone);
        saccoAccount.SetRange(saccoAccount.Blocked, saccoAccount.Blocked::" ");
        saccoAccount.SetRange(saccoAccount.Status, saccoAccount.Status::Active);
        saccoAccount.SetFilter(saccoAccount.Status, '%1|%2', saccoAccount.Status::Active, saccoAccount.Status::New);
        if saccoAccount.Find('-') then begin
            repeat
                Accounts := Accounts + saccoAccount."No." + '|' + saccoAccount."Product Name" + '|' + saccoAccount."Member No." + '~';
            until saccoAccount.Next = 0;
        end
    end;


    procedure BlockATM()
    var
        Result: Text[30];
    begin

        MsaccoServices.Reset;
        MsaccoServices.SetRange(MsaccoServices."Transaction Type", MsaccoServices."transaction type"::"Stop ATM");
        MsaccoServices.SetRange(MsaccoServices.Posted, false);
        if MsaccoServices.Find('-') then begin
            Result := 'Pending';
            saccoAccount.Reset;
            saccoAccount.SetRange(saccoAccount."No.", MsaccoServices."Account No");
            if saccoAccount.Find('-') then begin
                saccoAccount."ATM No." := '';
                saccoAccount.Modify;
                Result := '0';
                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', you have succesfully blocked your ATM.', '', '', false);

            end;
            if Result = '0' then begin
                MsaccoServices.Posted := true;
                MsaccoServices.Modify;
            end;
        end;
    end;


    procedure PostManualMPESAPayments()
    begin
        /*
        MPESATRANS.RESET;
        MPESATRANS.SETRANGE(MPESATRANS.Posted,FALSE);
        MPESATRANS.SETRANGE(MPESATRANS."Transaction Type",'MpesaPayBill');
        IF  MPESATRANS1.FINDFIRST THEN BEGIN
           REPEAT
            InserttojournalMpesaPayments(MPESATRANS1."Document No.",MPESATRANS1."Transaction Type",MPESATRANS1.Description,MPESATRANS1."Transaction Date",MPESATRANS1."Account No.",MPESATRANS1.Amount,MPESATRANS1."Key Word");
           UNTIL MPESATRANS1.NEXT =0;
        
        END;
        
        */

    end;


    procedure InserttojournalMpesaPayments()
    begin

        /*
            MPESATRANS.RESET;
            MPESATRANS.SETRANGE(MPESATRANS."Document No.",DocumentNo);
            MPESATRANS.SETRANGE(MPESATRANS.Description,Description);
            IF MPESATRANS.FINDFIRST THEN   BEGIN
        
            GenJournalLine.RESET;
            GenJournalLine.SETRANGE("Journal Template Name",'Msacco');
            GenJournalLine.SETRANGE("Journal Batch Name",'MPESA-OL');
            GenJournalLine.DELETEALL;
        
            GenBatches.RESET;
            GenBatches.SETRANGE(GenBatches."Journal Template Name",'Msacco');
            GenBatches.SETRANGE(GenBatches.Name,'MPESA-OL');
            IF GenBatches.FIND('-') = FALSE THEN BEGIN
              GenBatches.INIT;
              GenBatches."Journal Template Name":='Msacco';
              GenBatches.Name:='MPESA-OL';
              GenBatches.Description:='M-PESA Transactions';
              GenBatches.VALIDATE(GenBatches."Journal Template Name");
              GenBatches.VALIDATE(GenBatches.Name);
              GenBatches.INSERT;
            END;
        
            GenLedgerSetup.RESET;
            GenLedgerSetup.GET;
            GenLedgerSetup.TESTFIELD(GenLedgerSetup."Mpesa B2B Account");
        
            MPesaAccount:=GenLedgerSetup."Mpesa B2B Account";
        
            IF vendor.GET(Account) THEN BEGIN
        
              MPesaCharges:=0;
              MPesaChargesAccount:='';
        
        
              IF TransType = 'MpesaPayBill' THEN BEGIN
        
                GenLedgerSetup.RESET;
                GenLedgerSetup.GET;
                GenLedgerSetup.TESTFIELD(GenLedgerSetup."MPESA B2B Charge");
                GenLedgerSetup.TESTFIELD( GenLedgerSetup."Msacco Charge" );
                GenLedgerSetup.TESTFIELD(GenLedgerSetup."MSacco Account");
        
                Charges.RESET;
                Charges.SETRANGE(Charges.Code,GenLedgerSetup."MPESA B2B Charge");
                IF Charges.FIND('-') THEN BEGIN
                  Charges.TESTFIELD(Charges."GL Account");
                  MPesaCharges:=Charges."Charge Amount";
                  MPesaChargesAccount:=Charges."GL Account";
                END;
        
                Msaccocharge:= GenLedgerSetup."Msacco Charge";
                TotalCharges:= MPesaCharges +GenLedgerSetup."Msacco Charge";
                Msaccoacc:= GenLedgerSetup."MSacco Account";
                Exceciseduty:= (10/100) * MPesaCharges;
        
              END;
        
              IF TransType='MpesaPayBill' THEN BEGIN
        
              IF Description<>'Business Payment Charge' THEN BEGIN
        
                  //Dr Member
                 LineNo:=LineNo+10000;
                 GenJournalLine.INIT;
                 GenJournalLine."Journal Template Name":='Msacco';
                 GenJournalLine."Journal Batch Name":='MPESA-OL';
                 GenJournalLine."Line No.":=LineNo;
                 GenJournalLine."Account Type":=GenJournalLine."Account Type"::Vendor;
                 GenJournalLine."Account No.":=Account;
                 GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                 GenJournalLine."Document No.":=DocumentNo;
                 GenJournalLine."External Document No.":='MPESA W/D';
                 GenJournalLine."Posting Date":=TODAY;
                 GenJournalLine.Description:=Description;
                 GenJournalLine.Amount:=Amount;
                 GenJournalLine.VALIDATE(GenJournalLine.Amount);
                 GenJournalLine."Shortcut Dimension 1 Code":=vendor."Global Dimension 1 Code";
                 GenJournalLine."Shortcut Dimension 2 Code":=vendor."Global Dimension 2 Code";
                 GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                 GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                 IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;
        
                  //Cr Bank
                 LineNo:=LineNo+10000;
                 GenJournalLine.INIT;
                 GenJournalLine."Journal Template Name":='Msacco';
                 GenJournalLine."Journal Batch Name":='MPESA-OL';
                 GenJournalLine."Line No.":=LineNo;
                 GenJournalLine."Account Type":=GenJournalLine."Account Type"::"Bank Account";
                 GenJournalLine."Account No.":=MPesaAccount;
                 GenJournalLine."External Document No.":='MPESA W/D';
                 GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                 GenJournalLine."Document No.":=DocumentNo;
                 GenJournalLine."Posting Date":=TODAY;
                 GenJournalLine.Description:=Description;
                 GenJournalLine.Amount:=Amount *-1;
                 GenJournalLine.VALIDATE(GenJournalLine.Amount);
                 GenJournalLine."Shortcut Dimension 1 Code":=vendor."Global Dimension 1 Code";
                 GenJournalLine."Shortcut Dimension 2 Code":=vendor."Global Dimension 2 Code";
                 GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                 GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                 IF GenJournalLine.Amount<>0 THEN
                   GenJournalLine.INSERT;
        
              END;
        
        
               IF Description='Business Payment Charge' THEN BEGIN
        
                  TotalCharges:=0;
                  TotalCharges:=MPesaCharges+MPESATRANS.Amount + Msaccocharge;
        
                  //Dr Bank
                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='Msacco';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::"Bank Account";
                  GenJournalLine."Account No.":=MPesaAccount;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."Posting Date":=TODAY;
                  GenJournalLine.Description:='MPESA Corporate Charges';
                  GenJournalLine.Amount:=Amount*-1;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=vendor."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=vendor."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;
        
                   //Dr Member - total Charges
                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='Msacco';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::Vendor;
                  GenJournalLine."Account No.":=Account;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."Posting Date":=TODAY;
                  GenJournalLine.Description:='MPESA W/D Charges';
                  GenJournalLine.Amount:=TotalCharges ;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=vendor."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=vendor."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;
        
                  //Dr member excise duty
                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='Msacco';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::Vendor;
                  GenJournalLine."Account No.":=Account;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."Posting Date":=TODAY;
                  GenJournalLine.Description:='Excise duty on MPESA W/D';
                  GenJournalLine.Amount:=Exceciseduty;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=vendor."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=vendor."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;
        
                  //Cr Exercise Duty
                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='Msacco';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::"G/L Account";
                  GenJournalLine."Account No.":='4-11-000003';
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."Posting Date":=TODAY;
                  GenJournalLine.Description:='Excise duty on MPESA W/D';
                  GenJournalLine.Amount:=Exceciseduty*-1;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=vendor."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=vendor."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;
        
                  //CR Revenue
                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='Msacco';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::"G/L Account";
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."Posting Date":=TODAY;
                  GenJournalLine."Account No.":=MPesaChargesAccount;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine.Description:='MPESA W/D Charges';
                  GenJournalLine.Amount:=(MPesaCharges) *-1;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=vendor."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=vendor."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;
        
                  //Cr CoreTEC
                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='Msacco';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::Vendor;
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."Posting Date":=TODAY;
                  GenJournalLine."Account No.":=Msaccoacc;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine.Description:='MSACCO W/D Charges';
                  GenJournalLine.Amount:=Msaccocharge*-1;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=vendor."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=vendor."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;
        
                END;
              END;
        
              MPESATRANS.Posted:=TRUE;
              MPESATRANS."Needs Change":=FALSE;
              MPESATRANS."Date Posted":=TODAY;
              MPESATRANS."Time Posted":=TIME;
              MPESATRANS.MODIFY;
        
              //MARK BUFFER AS POSTED
              ATMTrans.RESET;
              ATMTrans.SETRANGE(ATMTrans.Posted,FALSE);
              ATMTrans.SETRANGE(ATMTrans."Unit ID",'M-PESA');
              ATMTrans.SETRANGE(ATMTrans."Account No",Account);
              ATMTrans.SETRANGE(ATMTrans.Amount,Amount);
              IF ATMTrans.FIND('-') THEN BEGIN
                REPEAT
                ATMTrans.Posted:=TRUE;
                ATMTrans."Posting Date":=TODAY;
                ATMTrans.MODIFY;
                UNTIL ATMTrans.NEXT=0
              END;
        
              GenJournalLine.RESET;
              GenJournalLine.SETRANGE("Journal Template Name",'Msacco');
              GenJournalLine.SETRANGE("Journal Batch Name",'MPESA-OL');
              IF GenJournalLine.FIND('-') THEN BEGIN
                REPEAT
                  GLPosting.RUN(GenJournalLine);
                UNTIL GenJournalLine.NEXT = 0;
              END;
              GenJournalLine.RESET;
              GenJournalLine.SETRANGE("Journal Template Name",'Msacco');
              GenJournalLine.SETRANGE("Journal Batch Name",'MPESA-OL');
              GenJournalLine.DELETEALL;
        
              Response :=0
         END;
        END;
        
        */

    end;


    procedure GetmemberInfo("Phone No": Text[50]) memberInfo: Text[500]
    begin


        "Phone No" := '+' + "Phone No";
        Member.Reset;
        Member.SetRange(Member."Transactional Mobile No", "Phone No");
        if Member.Find('-') then begin
            memberInfo := 'Member No :::' + Member."No." + '#' + 'Name :::' + Member.Name + '#' + 'ID No :::' + Format(Member."ID No.") + '#' + 'Gender :::' + Format(Member.Gender) + '#' +
            'DoB :::' + Format(Member."Date of Birth") + '#' + 'Email :::' + Member."E-Mail" + '#' + 'Reg. Date :::' + Format(Member."Registration Date");

        end;
    end;


    procedure GetDashboardData("Phone No": Text[30]; "Last Entry": Integer) dashboardData: Text[1024]
    begin

        "Phone No" := '+' + "Phone No";
        minicount := 0;
        DateExpression := '<CD-9M>'; // Current date less 6 months
        DashboardDataFilter := CalcDate(DateExpression, Today);

        Member.Reset;
        Member.SetRange(Member."Transactional Mobile No", "Phone No");
        dashboardData := '';

        if Member.FindSet then
            repeat
                Venderdetails.SetCurrentkey(Venderdetails."Entry No.");
                Venderdetails.Ascending(false);
                Venderdetails.SetRange(Venderdetails."Customer No.", Member."No.");
                // Venderdetails.SetRange(Venderdetails.Reversed, Venderdetails.Reversed::"0");

                if Venderdetails.FindSet then
                    repeat

                        dashboardData := dashboardData + '#' +
                        Format(Venderdetails."Entry No.") + ':::' +
                        Member."Product Name" + ':::' +
                        Format(Venderdetails."Posting Date") + ':::' +
                        Format((Venderdetails."Posting Date"), 0, '<Month Text>') + ':::' +
                        Format(Date2dmy((Venderdetails."Posting Date"), 3)) + ':::' +
                        Format((Venderdetails."Credit Amount"), 0, '<Precision,2:2><Integer><Decimals>') + ':::' +
                        Format((Venderdetails."Debit Amount"), 0, '<Precision,2:2><Integer><Decimals>') + ':::' +
                        Format((Venderdetails.Amount), 0, '<Precision,2:2><Integer><Decimals>') + ':::' +
                        Format(Venderdetails."Journal Batch Name") + ':::' +
                        'FOSA' + ':::' +
                        Format(Venderdetails.Description);


                        minicount := minicount + 1;
                        if minicount > 7 then
                            exit

until Venderdetails.Next = 0;
            until Member.Next = 0;
    end;


    procedure GetAllAccounts(Phone: Text[30]) Accounts: Text[1020]
    var
        MemberNo: Text[30];
    begin

        Phone := '+' + Phone;
        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."Transactional Mobile No", Phone);
        saccoAccount.SetRange(saccoAccount.Blocked, saccoAccount.Blocked::" ");
        if saccoAccount.Find('-') then begin
            //REPEAT

            MemberNo := saccoAccount."Member No.";

            SaccoAccount1.Reset;
            SaccoAccount1.SetRange(SaccoAccount1."Member No.", MemberNo);
            SaccoAccount1.SetRange(SaccoAccount1.Blocked, SaccoAccount1.Blocked::" ");
            SaccoAccount1.SetFilter(SaccoAccount1.Status, '%1|%2', SaccoAccount1.Status::Active, SaccoAccount1.Status::New);
            //saccoAccount.SETFILTER(saccoAccount."Product Category",'%1',saccoAccount."Product Category"::" ");
            if SaccoAccount1.Find('-') then begin
                repeat
                    if SaccoAccount1."Product Category" <> SaccoAccount1."product category"::"Registration Fee" then begin
                        //Changed on 21/10/2020 To allow Deposit to Share Cap* Francis
                        //** IF SaccoAccount1."Product Category" <> SaccoAccount1."Product Category"::"Share Capital" THEN BEGIN // saccoAccount1."Product Category"::Benevolent THEN BEGIN
                        if SaccoAccount1."Product Category" <> SaccoAccount1."product category"::"Unallocated Fund" then begin

                            Accounts := Accounts + SaccoAccount1."No." + '|' + SaccoAccount1."Product Name" + '|' + SaccoAccount1."Member No." + '~';

                        end
                        //** END
                    end;
                until SaccoAccount1.Next = 0;
            end;

            //UNTIL saccoAccount.NEXT =0;
        end
    end;


    procedure ATMCardApplication(MsaccoServices: Record 52185762; idNo: Text; BosaNo: Text; "Account No": Text; CardType: Text; Narration: Text; Branch: Text) ReturnedText: Text
    var
        ReturnDecimal: Decimal;
        ATMApplications: Record 52185850;
        BankingNoSetup: Record 52185781;
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        Text0001: label 'Dear %1  Your application for %2  has been received and is being processed. Your %3 will be ready in 14 Days and Ready for collection at %4. For more information please call %5';
    begin
        with MsaccoServices do begin
            //SETFILTER("Account No");
            saccoAccount.Reset;
            saccoAccount.SetRange(saccoAccount."No.", "Account No");
            saccoAccount.SetRange("Product Type", '505');
            if saccoAccount.Find('-') then begin



                ATMApplications.Reset;
                ATMApplications.SetRange(ATMApplications."Account No", "Account No");
                ATMApplications.SetRange(ATMApplications.Status, ATMApplications.Status::Open);
                if (ATMApplications.Find('-')) then begin

                    ReturnedText := 'Pending';

                end else begin

                    //check balance to cover the charges
                    ReturnDecimal := GetAccountBalance(saccoAccount."No.");

                    ATMApplications.Init;
                    ATMApplications."No." := '';

                    //set up no series
                    BankingNoSetup.Get();
                    BankingNoSetup.TestField(BankingNoSetup."ATM Application Nos");
                    // NoSeriesMgt.InitSeries(BankingNoSetup."ATM Application Nos", 'ATM', 0D, ATMApplications."No.", ATMApplications."No. Series");

                    ATMApplications."Application Date" := Today;
                    ATMApplications."Form No" := ATMApplications."No.";
                    ATMApplications."Request Type" := ATMApplications."request type"::New;
                    ATMApplications."Card Type" := CardType;
                    ATMApplications."Account Type" := ATMApplications."account type"::Savings;
                    ATMApplications."Account No" := saccoAccount."No.";
                    ATMApplications.Validate("Account No");
                    ATMApplications."Responsibility Center" := saccoAccount."Responsibility Center";
                    ATMApplications."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                    ATMApplications."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                    ATMApplications.Status := ATMApplications.Status::Open;
                    ATMApplications."Terms Read and Understood" := true;
                    ATMApplications.Insert;


                    //SMS
                    //IF (TransactionType='ATM REQUEST') THEN BEGIN
                    Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", StrSubstNo(Text0001, saccoAccount.Name,
                    Format(MsaccoServices."Transaction Type"), Format(MsaccoServices."Transaction Type"), Format(MsaccoServices.Comment), CompanyInformation."Phone No."), '', '', false);
                    // END;

                    //** Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Transactional Mobile No",'Dear Member, Your ATM application is been processed. You will receive confirmation text when complete', Docno,saccoAccount."No." ,FALSE );

                    ReturnedText := 'success';


                end;



            end;
        end;
    end;


    procedure ChequeBookApplication(idNo: Text; BosaNo: Text; "Account No": Text; ChequeType: Text) Result: Text
    var
        MemberCard: Record 52185700;
        SavingsAccounts: Record 52185730;
        ChequeBookCard: Record 52185785;
        BankingNoSetup: Record 52185781;
    // NoSeriesMgt: Codeunit NoSeriesManagement;
    begin

        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", BosaNo);
        if MemberCard.Find('-') then begin


            ChequeBookCard.Reset;
            ChequeBookCard.SetRange(ChequeBookCard."Account No.", "Account No");
            ChequeBookCard.SetRange(ChequeBookCard.Status, ChequeBookCard.Status::Open);
            if ChequeBookCard.Find('-') then begin

                Result := 'Pending';

            end else begin

                SavingsAccounts.Reset;
                SavingsAccounts.SetRange(SavingsAccounts."No.", "Account No");
                SavingsAccounts.SetRange("Member No.", MemberCard."No.");

                if SavingsAccounts.Find('-') then begin
                    ChequeBookCard.Init;

                    BankingNoSetup.Get();
                    BankingNoSetup.TestField(BankingNoSetup."Cheque Application Nos");
                    // NoSeriesMgt.InitSeries(BankingNoSetup."Cheque Application Nos", ChequeBookCard."No. Series", 0D, ChequeBookCard."No.", ChequeBookCard."No. Series");

                    // get cheque type

                    ChequeBookCard."Application Date" := Today;
                    ChequeBookCard."Transaction Type" := 'FAMILYBNKCHQ'; //ChequeType;
                    ChequeBookCard.Validate(ChequeBookCard."Transaction Type");
                    ChequeBookCard.Validate(ChequeBookCard."Account No.", SavingsAccounts."No.");
                    ChequeBookCard.Validate(ChequeBookCard."Member No.", SavingsAccounts."Member No.");
                    ChequeBookCard.Validate(ChequeBookCard."Cheque Book Type", ChequeType);
                    ChequeBookCard.Status := ChequeBookCard.Status::Open;
                    ChequeBookCard.Insert;

                    Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Cheque application is been processed. You will receive confirmation text when complete', Docno, saccoAccount."No.", false);

                    Result := 'success';

                end;




            end;
        end;
    end;


    procedure ATMCardLinking()
    var
        result: Text[50];
        ATMApplications: Record 52185850;
        BankingNoSetup: Record 52185781;
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        Text0001: label 'Dear %1  Your application for %2  has been received and is being processed. Your %3 will be ready in 14 Days and Ready for collection at %4. For more information please call %5';
    begin
        //EXIT;
        //MESSAGE('r');
        MsaccoServices.Reset;
        MsaccoServices.SetRange(MsaccoServices."Transaction Type", MsaccoServices."transaction type"::"ATM Request");
        MsaccoServices.SetRange(MsaccoServices.Posted, false);
        //MsaccoServices.SETRANGE(MsaccoServices."Account No",'5050127263000');
        MsaccoServices.SetFilter(MsaccoServices."Entry No", '%1..%2', 1335, 194000);
        if MsaccoServices.Find('-') then begin
            repeat

                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."No.", MsaccoServices."Account No");
                saccoAccount.SetRange("Product Type", '505');
                if saccoAccount.Find('-') then begin

                    ///

                    ATMApplications.Reset;
                    ATMApplications.SetRange(ATMApplications."Account No", saccoAccount."No.");
                    ATMApplications.SetRange(ATMApplications.Status, ATMApplications.Status::Open);
                    if not ATMApplications.Find('-') then begin

                        ATMApplications.Init;
                        ATMApplications."No." := '';

                        //set up no series
                        BankingNoSetup.Get();
                        BankingNoSetup.TestField(BankingNoSetup."ATM Application Nos");
                        // NoSeriesMgt.InitSeries(BankingNoSetup."ATM Application Nos", 'ATM', 0D, ATMApplications."No.", ATMApplications."No. Series");

                        ATMApplications."Application Date" := Today;
                        ATMApplications."Form No" := ATMApplications."No.";
                        ATMApplications."Request Type" := ATMApplications."request type"::New;
                        ATMApplications."Card Type" := 'SACCOLINK';
                        ATMApplications."Account Type" := ATMApplications."account type"::Savings;
                        ATMApplications."Account No" := saccoAccount."No.";
                        ATMApplications.Validate("Account No");
                        ATMApplications."Responsibility Center" := saccoAccount."Responsibility Center";
                        ATMApplications."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                        ATMApplications."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                        ATMApplications.Status := ATMApplications.Status::Open;
                        ATMApplications."Terms Read and Understood" := true;
                        ATMApplications.Insert;


                        //SMS
                        //IF (TransactionType='ATM REQUEST') THEN BEGIN
                        Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", StrSubstNo(Text0001, saccoAccount.Name,
                        Format(MsaccoServices."Transaction Type"), Format(MsaccoServices."Transaction Type"), Format(MsaccoServices.Comment), CompanyInformation."Phone No."), '', '', false);
                        // END;

                        ///

                        //result := ATMCardApplication(MsaccoServices,saccoAccount."ID No.",saccoAccount."Member No.",saccoAccount."No.",'SACCOLINK','',MsaccoServices.Comment);

                        MsaccoServices.Posted := true;
                        MsaccoServices.Modify;
                    end else begin
                        MsaccoServices.Posted := true;
                        MsaccoServices.Comment := 'Pending Request';
                        MsaccoServices.Modify;
                        Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, Your ATM application has failed. Please contact Harambee SACCO.', Docno, saccoAccount."No.", false);
                    end;
                    //MESSAGE(FORMAT(result));
                end;

            until MsaccoServices.Next = 0;
        end;
    end;


    procedure ChequeBookRequests()
    var
        result: Text[30];
    begin

        MsaccoServices.Reset;
        MsaccoServices.SetRange(MsaccoServices."Transaction Type", MsaccoServices."transaction type"::"Cheque Request");
        MsaccoServices.SetFilter(MsaccoServices."Transaction Date", '>%1', CreateDatetime(20180523D, Time));
        MsaccoServices.SetRange(MsaccoServices.Posted, false);
        if MsaccoServices.Find('-') then begin
            repeat

                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."No.", MsaccoServices."Account No");
                if saccoAccount.Find('-') then begin

                    result := ChequeBookApplication(saccoAccount."ID No.", saccoAccount."Member No.", saccoAccount."No.", 'FAMILY');

                    if result = 'success' then begin
                        MsaccoServices.Posted := true;
                        MsaccoServices.Modify;
                    end else begin
                        MsaccoServices.Posted := true;
                        MsaccoServices.Comment := 'Pending Request';
                        MsaccoServices.Modify;

                        Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, Your Cheque application has failed. Please contact Stima SACCO.', Docno, saccoAccount."No.", false);

                    end

                end;

            until MsaccoServices.Next = 0;
        end;
    end;


    procedure PostMobileLoanRepayments(DocNo: Code[30]) Response: Integer
    var
        Result: Text[30];
    begin

        MPESATRANS1.Reset;
        MPESATRANS1.SetRange(MPESATRANS1.Posted, false);
        MPESATRANS1.SetRange(MPESATRANS1."Transaction Type", 'Loan Repayment');
        MPESATRANS1.SetRange(MPESATRANS1."Document No.", DocNo);
        //MPESATRANS1.SETFILTER(MPESATRANS1."Transaction Date",'=%1',20170710D);
        if MPESATRANS1.FindFirst() then begin
            //REPEAT
            //MESSAGE(MPESATRANS1."Document No.");
            Response := PostLoanRepayments(MPESATRANS1."Telephone No", MPESATRANS1.Amount, MPESATRANS1."Account No.", MPESATRANS1."Document No.");

            //UNTIL MPESATRANS1.NEXT =0;
        end;
    end;


    procedure PostLoanRepayments(Loanno: Text[30]; Amount: Decimal; AccountNo: Text[30]; Documentno: Text[30]) Response: Integer
    var
        InterestRepaymentAmount: Decimal;
        CreditAccountNo: Code[30];
        LoanOverpayment: Decimal;
    begin
        Response := 1;
        Continue := true;
        MPESATRANS.Reset;
        MPESATRANS.SetRange(MPESATRANS."Document No.", Documentno);
        if MPESATRANS.Find('-') then begin

            // prevent double posting
            //MESSAGE(MPESATRANS1."Document No.");
            Venderdetails.Reset;
            Venderdetails.SetRange(Venderdetails."Document No.", MPESATRANS."Document No.");
            Venderdetails.SetRange("Customer No.", MPESATRANS."Account No.");
            Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
            if Venderdetails.Find('-') then begin

                MPESATRANS."Date Posted" := Today;
                MPESATRANS."Time Posted" := Time;
                MPESATRANS.Posted := true;
                MPESATRANS.Messages := 'Double Posting';
                MPESATRANS.Modify;
                Continue := false;
                Response := 0;

            end;

            // prevent double posting

            //Get Coretec Vendor Account and Charge Amount
            MsaccoChargesSetup.Reset;
            MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
            if MsaccoChargesSetup.Find('-') then begin
                MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
                Msaccocharge := MsaccoChargesSetup.ChargeAmount;
                Msaccoacc := MsaccoChargesSetup."Vendor No";
            end;


            RunBal := 0;
            RunBal := Amount;
            AccBalance := 0;
            MiniBalance := 0;

            saccoAccount.Reset;
            saccoAccount.SetRange(saccoAccount."No.", AccountNo);
            if saccoAccount.Find('-') then begin
                AccBalance := GetAccountBalance(saccoAccount."No.");
            end;
            //IF loanno ='MB_*' THEN
            // CreditAccountNo:='126'+ saccoAccount."Member No.";

            // start posting
            POSTJOURNAL.ClearJournalLines('MSACCO', 'MSACCOLN');

            // MESSAGE('Account Balance '+ FORMAT(AccBalance));

            if (AccBalance) >= (Amount + Msaccocharge) then begin


                Loans.Reset;
                Loans.SetRange(Loans."Loan No.", Loanno);
                if Loans.Find('-') then begin
                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", Loans."Outstanding Bills");
                    Interest := Loans."Outstanding Interest";

                    if ProdFac.Get(Loans."Loan Product Type") then begin
                        if CreditAccounts.Get(ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix") then begin
                            CreditAccountNo := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix"
                        end;
                    end;
                    CreditAccountNo := Loans."Loan Product Type" + saccoAccount."Member No.";

                    if Interest > 0 then begin

                        InterestRepaymentAmount := 0;
                        if RunBal > Interest then begin
                            InterestRepaymentAmount := -Interest
                        end else begin
                            InterestRepaymentAmount := -RunBal;
                        end;

                        // Cr Member Loan Account - Interest Repayment

                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := 'MSACCO';
                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                        GenJournalLine."Account No." := Loans."Loan Account";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := Documentno;
                        GenJournalLine."External Document No." := 'MSACCO LN';
                        GenJournalLine."Posting Date" := Today;
                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                        GenJournalLine."Loan No" := Loanno;
                        GenJournalLine.Amount := InterestRepaymentAmount;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine.Description := 'MSacco Interest Repayment';
                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                        RunBal := Amount + InterestRepaymentAmount;
                    end;

                    if RunBal > 0 then begin
                        if RunBal > Loans."Outstanding Balance" then begin
                            if Loans."Outstanding Balance" <= 0 then begin
                                // LoanOverpayment := RunBal;-Loans."Outstanding Balance";
                            end;
                            RunBal := RunBal - LoanOverpayment;
                        end;
                        if Abs(Loans."Outstanding Balance") < Abs(RunBal) then
                            RunBal := Abs(Loans."Outstanding Balance");

                        LoanOverpayment := 0;

                        // Cr Member Loan Account - Principal Loan Repayment
                        LineNo := LineNo + 10000;
                        POSTJOURNAL.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Credit, Documentno, 'MSacco Loan Repayment', -RunBal
                        , Loans."Loan Account", Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::Repayment, Loanno, '', '', 0, '', 0);
                        //Loanno

                        if Loans."Outstanding Bills" > 0 then begin
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                            GenJournalLine."Account No." := Loans."Loan Account";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := Documentno;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            if Loans."Outstanding Bills" > RunBal then begin
                                GenJournalLine.Amount := -RunBal;
                            end else begin
                                GenJournalLine.Amount := -Loans."Outstanding Bills";
                            end;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Loan No" := Loans."Loan No.";
                            GenJournalLine."Bal. Account Type" := GenJournalLine."account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := '107001';
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine.Description := 'Bills' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                        end;

                        if LoanOverpayment > 0 then begin
                            //Cr Overpayment
                            LineNo := LineNo + 10000;
                            POSTJOURNAL.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Savings, Documentno, 'MSacco Loan Over payment', LoanOverpayment * -1
                            , AccountNo, Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);
                        end;

                    end;
                    // Dr Member Loan Repayment Amount
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Savings, Documentno, 'MSacco Loan Repayment', Abs(RunBal) + Abs(InterestRepaymentAmount)
                    , AccountNo, Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    // Dr Member Loanrepayment SMS charge
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Savings, Documentno, 'Loan Repayment Charge', Msaccocharge
                    , AccountNo, Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    // Cr Coretec
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Vendor, Documentno, 'MSacco Loan Repayment Charges', Msaccocharge * -1
                    , Msaccoacc, Today, Optionsaccounts::"G/L Account", '', saccoAccount."No.", saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                end;

                if Continue = true then begin

                    // Complete Journal Posting

                    POSTJOURNAL.LinesCompletePosting('MSACCO', 'MSACCOLN');

                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");

                    Sendsms.SendSms(Optionsms::MSACCO
                    , saccoAccount."Transactional Mobile No"
                    , 'Your Loan Repayment was successful. Your new ' + Loans."Loan Product Type Name" + ' bal is ' + Format(Loans."Outstanding Balance" + Loans."Outstanding Interest")
                    , Documentno, saccoAccount."No.", false);

                    MPESATRANS."Needs Change" := true;
                    MPESATRANS."Date Posted" := Today;
                    MPESATRANS."Time Posted" := Time;
                    MPESATRANS.Posted := true;
                    MPESATRANS.Messages := 'Succesful';
                    MPESATRANS.Modify;
                    Response := 0;
                    MsaccoTransactions.Reset;
                    if MsaccoTransactions.Find('+') then begin
                        MsaccoTransactions.Init;
                        MsaccoTransactions."Entry No" := MsaccoTransactions."Entry No" + 1;
                    end;


                    MsaccoTransactions."Document No." := Loanno;
                    MsaccoTransactions.Description := 'MSacco loan repayment sms Charges';
                    MsaccoTransactions."Transaction Date" := Today;
                    MsaccoTransactions."Account No." := AccountNo;
                    MsaccoTransactions.Amount := 10;
                    MsaccoTransactions.Posted := true;
                    MsaccoTransactions."Transaction Type" := MsaccoTransactions."transaction type"::"Loan Repayment";
                    MsaccoTransactions."Transaction Time" := Time;
                    MsaccoTransactions."Loan Amount" := Amount;
                    MsaccoTransactions.Insert;


                    AdviceCheckOff(Loans."Loan No.");

                end
            end
            else begin

                MPESATRANS."Needs Change" := true;
                MPESATRANS."Date Posted" := Today;
                MPESATRANS."Time Posted" := Time;
                MPESATRANS.Posted := true;
                MPESATRANS.Messages := ' Insufficient Funds';
                MPESATRANS.Modify;
                Response := 0;

                ProdFac.Reset;
                ProdFac.SetRange(ProdFac."Product ID", Loans."Loan Product Type");
                if ProdFac.Find('-') then begin

                    Sendsms.SendSms(Optionsms::MSACCO
                     , saccoAccount."Transactional Mobile No"
                     , 'Your Loan Repayment for  ' + ProdFac."Product Description" + ' has failed due to insufficient funds.'
                     , Documentno, saccoAccount."No.", false);

                end;

            end;

        end;
    end;


    procedure MsaccoLoanRepayment(Loanno: Text[30]; Amount: Decimal; AccountNo: Text[30]; Documentno: Text[30]) PayLoans: Text[200]
    var
        InterestRepaymentAmount: Decimal;
    begin

        MPESATRANS.Reset;
        MPESATRANS.SetRange(MPESATRANS."Document No.", Documentno);
        if MPESATRANS.Find('-') then begin

            PayLoans := '4';

        end
        else begin

            MPESATRANS.Init;
            MPESATRANS."Document No." := Documentno;
            MPESATRANS.Description := 'MSACCO Loan Repayment -' + Format(Loanno);
            MPESATRANS."Account No." := AccountNo;
            MPESATRANS.Amount := Amount;
            MPESATRANS."Transaction Type" := 'Loan Repayment';
            MPESATRANS."Document Date" := Today;
            MPESATRANS."Transaction Date" := Today;
            MPESATRANS."Key Word" := '';
            MPESATRANS.Posted := false;
            MPESATRANS."Telephone No" := Loanno;
            MPESATRANS.Insert;

            PayLoans := '0';


        end;
    end;


    procedure PostMsaccoFundsTransfer(Debitacc: Code[20]; Creditacc: Code[20]; Amount: Decimal; Reference: Text[30]; Transfertype: Integer) transfered: Text[30]
    begin

        Continue := true;
        MPESATRANS1.Reset;
        MPESATRANS1.SetRange(MPESATRANS1.Posted, false);
        MPESATRANS1.SetRange(MPESATRANS1."Transaction Type", 'Funds Transfer');
        MPESATRANS1.SetRange(MPESATRANS1."Document No.", Reference);
        if MPESATRANS1.Find('-') then begin

            // prevent double posting

            Venderdetails.Reset;
            Venderdetails.SetRange(Venderdetails."Document No.", MPESATRANS1."Document No.");
            Venderdetails.SetRange("Customer No.", MPESATRANS1."Account No.");
            Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
            if Venderdetails.Find('-') then begin


                MPESATRANS1."Needs Change" := true;
                MPESATRANS1."Date Posted" := Today;
                MPESATRANS1."Time Posted" := Time;
                MPESATRANS1.Posted := true;
                MPESATRANS1.Messages := 'Double Posting';
                MPESATRANS1.Modify;
                Continue := false;
            end;


            // Get Excise duty G/L
            ExciseDutyGL := GetExciseDutyGL();

            // Get Funds Transfer Charges G/L and Charge Amount

            Charges.Reset;
            Charges.SetRange(Charges."Transaction Type", 'MSACCOT');
            if Charges.Find('-') then begin
                Charges.TestField(Charges."G/L Account");
                MPesaCharges := Charges."Charge Amount";
                MPesaChargesAccount := Charges."G/L Account";
            end;

            // Get Coretec Vendor Account and Charge Amount
            // Msaccocharge :=10;

            MsaccoChargesSetup.Reset;
            MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
            if MsaccoChargesSetup.Find('-') then begin
                MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
                Msaccocharge := MsaccoChargesSetup.ChargeAmount;
                Msaccoacc := MsaccoChargesSetup."Vendor No";
            end;

            Message('debit acc ' + Debitacc);

            saccoAccount.Reset;
            saccoAccount.SetRange(saccoAccount."No.", Debitacc);
            if saccoAccount.Find('-') then begin
                saccoAccount.CalcFields(saccoAccount."Balance (LCY)");
                AccBalance := GetAccountBalance(saccoAccount."No.");
                DebitPhone := saccoAccount."Transactional Mobile No";

                Message('account balance ' + Format(AccBalance));

                if (AccBalance > (Amount + MPesaCharges + Msaccocharge)) then begin

                    //start posting

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                    GenJournalLine.SetRange("Journal Batch Name", 'MSACCOTR');
                    GenJournalLine.DeleteAll;


                    Docno := Reference;

                    // Dr Account From

                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSACCOTR', LineNo, Optionsaccounts::Savings, Docno, 'MSacco Funds Transfer to ' + Creditacc, Amount
                    , Debitacc, Today, Optionsaccounts::"G/L Account", '', 'MSACCO TRANSFER', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    // Dr Account From with Transfer Charges

                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSACCOTR', LineNo, Optionsaccounts::Savings, Docno, 'MSacco Funds Transfer to ' + Creditacc, (MPesaCharges - Exceciseduty) + Msaccocharge
                    , Debitacc, Today, Optionsaccounts::"G/L Account", '', 'MSACCO TRANSFER', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    // Dr Member Excise Duty

                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSACCOTR', LineNo, Optionsaccounts::Savings, Docno, 'Excise duty on Msacco Transfer', Exceciseduty
                    , Debitacc, Today, Optionsaccounts::"G/L Account", '', 'MSACCO TRANSFER', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    // Cr Excise Duty G/L

                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSACCOTR', LineNo, Optionsaccounts::"G/L Account", Docno, 'Excise duty on Msacco Transfer', Exceciseduty * -1
                    , ExciseDutyGL, Today, Optionsaccounts::"G/L Account", '', 'MSACCO TRANSFER', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    // Cr Commision G/L

                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSACCOTR', LineNo, Optionsaccounts::"G/L Account", Docno, 'Msacco Transfer charges', (MPesaCharges - Exceciseduty) * -1
                    , MPesaChargesAccount, Today, Optionsaccounts::"G/L Account", '', 'MSACCO TRANSFER', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    // Cr Coretec Transfer charge

                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSACCOTR', LineNo, Optionsaccounts::Vendor, Docno, 'MSacco Transfer Charges', Msaccocharge * -1
                    , Msaccoacc, Today, Optionsaccounts::"G/L Account", '', saccoAccount."No.", saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);


                    //credit sec a/c

                    saccoAccount.Reset;
                    saccoAccount.SetRange(saccoAccount."No.", Creditacc);
                    if saccoAccount.Find('-') then begin
                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := 'MSACCO';
                        GenJournalLine."Journal Batch Name" := 'MSACCOTR';
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                        GenJournalLine."Account No." := Creditacc;
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := Docno;
                        GenJournalLine."External Document No." := Creditacc;
                        GenJournalLine."Posting Date" := Today;
                        GenJournalLine.Description := 'Msacco Transfer from ' + Debitacc;
                        GenJournalLine.Amount := -Amount;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                    end;

                    if Continue = true then begin

                        GenJournalLine.Reset;
                        GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                        GenJournalLine.SetRange("Journal Batch Name", 'MSACCOTR');

                        if GenJournalLine.Find('-') then begin
                            repeat
                                // GLPosting.Run(GenJournalLine);
                            until GenJournalLine.Next = 0;
                        end;

                        GenJournalLine.Reset;
                        GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                        GenJournalLine.SetRange("Journal Batch Name", 'MSACCOTR');
                        GenJournalLine.DeleteAll;

                        // Mark as Posted //

                        MPESATRANS1."Needs Change" := true;
                        MPESATRANS1."Date Posted" := Today;
                        MPESATRANS1."Time Posted" := Time;
                        MPESATRANS1.Posted := true;
                        MPESATRANS1.Messages := 'Successful';
                        MPESATRANS1.Modify;

                        //------------send sms alert ------------//
                        // TO FOSA ACC

                        Sendsms.SendSms(Optionsms::MSACCO
                        , DebitPhone
                        , 'Your transfer to ' + Creditacc + ' was successful. Your new ' + Debitacc + ' a/c bal is ' + Format(GetAccountBalance(Debitacc))
                        , Docno, Debitacc, false);
                        //---------end send sms alert------------//

                        transfered := '0';


                        MsaccoTransactions.Reset;
                        if MsaccoTransactions.Find('+')
                        then begin
                            i := MsaccoTransactions."Entry No";
                        end;

                        i := i + 1;
                        MsaccoTransactions.Init;
                        MsaccoTransactions."Entry No" := i;
                        MsaccoTransactions."Document No." := Reference;
                        MsaccoTransactions.Description := 'MSacco Transfer Charges';
                        MsaccoTransactions."Transaction Date" := Today;
                        MsaccoTransactions."Account No." := Debitacc;
                        MsaccoTransactions.Amount := Msaccocharge;
                        MsaccoTransactions.Posted := true;
                        MsaccoTransactions."Transaction Type" := MsaccoTransactions."transaction type"::Transfer;
                        MsaccoTransactions."Transaction Time" := Time;
                        MsaccoTransactions.Insert;

                    end;
                end
                else begin

                    // insufficient Funds

                    MPESATRANS1."Needs Change" := true;
                    MPESATRANS1."Date Posted" := Today;
                    MPESATRANS1."Time Posted" := Time;
                    MPESATRANS1.Posted := true;
                    MPESATRANS1.Messages := 'Insufficient Funds';
                    MPESATRANS1.Modify;

                    // send alert

                    Sendsms.SendSms(Optionsms::MSACCO
                   , saccoAccount."Transactional Mobile No"
                   , 'Your transfer has failed due to insufficient funds'
                   , Docno, Debitacc, false);

                    // send alert

                end;

            end;


        end;
    end;


    procedure MsaccoFundsTransfer(Debitacc: Code[20]; Creditacc: Code[20]; Amount: Decimal; Reference: Text[30]; Transfertype: Integer) transfered: Text[30]
    begin

        MPESATRANS.Reset;
        MPESATRANS.SetRange(MPESATRANS."Document No.", Reference);

        if MPESATRANS.Find('-') then begin

            transfered := '2';

        end
        else begin

            MPESATRANS.Init;
            MPESATRANS."Document No." := Reference;
            MPESATRANS.Description := 'M-SACCO Funds Transfer -' + Reference;
            MPESATRANS."Account No." := Creditacc;
            MPESATRANS.Amount := Amount;
            MPESATRANS."Transaction Type" := 'Funds Transfer';
            MPESATRANS."Document Date" := Today;
            MPESATRANS."Transaction Date" := Today;
            MPESATRANS."Key Word" := '';
            MPESATRANS.Posted := false;
            MPESATRANS."Telephone No" := Debitacc;
            MPESATRANS.Insert;

            transfered := '0';

        end;
    end;


    procedure PostFundsTransfer()
    var
        Result: Text[30];
    begin

        MPESATRANS1.Reset;
        MPESATRANS1.SetRange(MPESATRANS1.Posted, false);
        MPESATRANS1.SetRange(MPESATRANS1."Transaction Type", 'Funds Transfer');
        if MPESATRANS1.FindFirst then begin
            repeat

                Result := PostMsaccoFundsTransfer(MPESATRANS1."Telephone No", MPESATRANS1."Account No.", MPESATRANS1.Amount, MPESATRANS1."Document No.", 1);

            until MPESATRANS1.Next = 0;
        end;
    end;


    procedure PostMBOOSTALoan()
    var
        MCommission: Decimal;
        MInterest: Decimal;
        LoanProdCharge: Record 52185734;
        MComm: Integer;
        MInt: Decimal;
        LAccount: Code[50];
        SaccoMemberNo: Code[20];
        ContinueMB: Boolean;
        interestGL: Code[10];
        Members: Record 52185700;
        LoansOld: Record 52185729;
    begin
        MsaccoChargesSetup.Reset;
        MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
        if MsaccoChargesSetup.Find('-') then begin
            MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
            Msaccocharge := MsaccoChargesSetup.ChargeAmount;
            Msaccoacc := MsaccoChargesSetup."Vendor No";
        end;

        MsaccoLoans.Reset;
        MsaccoLoans.SetRange(MsaccoLoans.Status, MsaccoLoans.Status::Pending);
        MsaccoLoans.SetRange("Entry no", 367753);
        MsaccoLoans.SetRange(MsaccoLoans."Loan Product Type", MsaccoLoans."loan product type"::"Instant Loan");
        MsaccoLoans.SetRange(MsaccoLoans.Posted, false);
        if MsaccoLoans.Find('-') then begin
            repeat
                ContinueMB := true;
                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."No.", MsaccoLoans."Account No");
                if saccoAccount.Find('-') then begin
                    //CHECK SALARY
                    SaccoMemberNo := saccoAccount."Member No.";
                    month := 0;
                    //salStartString := '1/'+FORMAT(DATE2DMY(TODAY,2))+'/'+FORMAT(DATE2DMY(TODAY,3));
                    salStartString := Format(Date2dmy(Today, 2)) + '/1/' + Format(Date2dmy(Today, 3));
                    Evaluate(salStartDate, salStartString);

                    Evaluate(salStartDate, salStartString);
                    PeriodStartDate[1] := CalcDate('<-1M>', salStartDate - 1);
                    PeriodEndDate[1] := CalcDate('<-1M>', salStartDate - 1);


                    month := Date2dmy(PeriodStartDate[1], 2);


                    if ((month = 4) or (month = 6) or (month = 9) or (month = 11)) then begin
                        /*EVALUATE(PeriodEndDate[1],'30/'+FORMAT(DATE2DMY(PeriodStartDate[1],2))+'/'+FORMAT(DATE2DMY(PeriodStartDate[1],3)));
                        EVALUATE(PeriodEndDate[1],'1/'+FORMAT(DATE2DMY(PeriodStartDate[1],2))+'/'+FORMAT(DATE2DMY(PeriodStartDate[1],3)));*/
                        Evaluate(PeriodEndDate[1], Format(Date2dmy(PeriodStartDate[1], 2)) + '/30/' + Format(Date2dmy(PeriodStartDate[1], 3)));
                        Evaluate(PeriodEndDate[1], Format(Date2dmy(PeriodStartDate[1], 2)) + '/1/' + Format(Date2dmy(PeriodStartDate[1], 3)));

                    end else
                        if (month = 2) then begin
                            /*EVALUATE(PeriodEndDate[1],'28/'+FORMAT(DATE2DMY(PeriodStartDate[1],2))+'/'+FORMAT(DATE2DMY(PeriodStartDate[1],3)));
                            EVALUATE(PeriodEndDate[1],'1/'+FORMAT(DATE2DMY(PeriodStartDate[1],2))+'/'+FORMAT(DATE2DMY(PeriodStartDate[1],3)));*/
                            Evaluate(PeriodEndDate[1], Format(Date2dmy(PeriodStartDate[1], 2)) + '/28/' + Format(Date2dmy(PeriodStartDate[1], 3)));
                            Evaluate(PeriodEndDate[1], Format(Date2dmy(PeriodStartDate[1], 2)) + '/1/' + Format(Date2dmy(PeriodStartDate[1], 3)));
                        end else begin
                            /*EVALUATE(PeriodEndDate[1],'31/'+FORMAT(DATE2DMY(PeriodStartDate[1],2))+'/'+FORMAT(DATE2DMY(PeriodStartDate[1],3)));
                            EVALUATE(PeriodEndDate[1],'1/'+FORMAT(DATE2DMY(PeriodStartDate[1],2))+'/'+FORMAT(DATE2DMY(PeriodStartDate[1],3)));*/
                            Evaluate(PeriodEndDate[1], Format(Date2dmy(PeriodStartDate[1], 2)) + '/31/' + Format(Date2dmy(PeriodStartDate[1], 3)));
                            Evaluate(PeriodEndDate[1], Format(Date2dmy(PeriodStartDate[1], 2)) + '/1/' + Format(Date2dmy(PeriodStartDate[1], 3)));
                        end;

                    // MBOOSTA LOAN //
                    if ProdFac.Get('126') then begin
                        SaccoAccMemberNo := MsaccoLoans."Account No";

                        SalBuffer.Reset;
                        SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Account No.", SalBuffer."Posting Date");
                        SalBuffer.SetRange(SalBuffer."Account No.", SaccoAccMemberNo);
                        SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', PeriodStartDate[1], PeriodEndDate[1]);
                        if SalBuffer.Find('-') then begin
                            CurrSal[i] := SalBuffer.Amount;
                            TotSalarieies := TotSalarieies + CurrSal[1];
                            Salary1 := CurrSal[1];
                            Minimum := SalBuffer.Amount;
                            if SalBuffer.Amount < Minimum then
                                Minimum := SalBuffer.Amount;
                        end;

                        // SALARY //

                        if ContinueMB = false then begin

                            // salary not processed
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name +
                            ', your MBOOSTA Loan request has been rejected. Reason: Process salary through Harambee Sacco FOSA to qualify for this product.', '',
                            saccoAccount."No.", false);
                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                            MsaccoLoans.Remarks := 'Salary not processed for 3 months';
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans.Modify;
                            ContinueMB := false;
                        end;

                        if ContinueMB = true then begin
                            //Prevent Double Posting
                            Venderdetails.Reset;
                            Venderdetails.SetRange(Venderdetails."Document No.", MsaccoLoans.DocumentNo);
                            Venderdetails.SetRange("Customer No.", MsaccoLoans."Account No");
                            Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
                            if Venderdetails.Find('-') then begin
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                                MsaccoLoans.Remarks := 'Successful';
                                MsaccoLoans."Approved Amount" := MsaccoLoans."Requested Amount";
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your M-BOOSTA Loan of KES' +
                                      Format(MsaccoLoans."Requested Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                                      Format(CalcDate('1M', Today), 0, '<Day>-<Month>-<Year>') + '.', '', saccoAccount."No.", false);
                                ContinueMB := false;
                            end;
                        end;


                        if ContinueMB = true then begin
                            // check if member has existing MBOOSTA Loan


                            MCommission := 0;
                            MInterest := 0;
                            MComm := 0;
                            MInt := 0;
                            LoanProdCharge.Reset;
                            LoanProdCharge.SetRange("Charge Code", 'L05');
                            LoanProdCharge.SetRange("Product Code", '126');
                            if LoanProdCharge.Find('-') then begin
                                //MComm:=((LoanProdCharge.Percentage/100)*MsaccoLoans."Requested Amount");
                                interestGL := LoanProdCharge."Charges G_L Account";
                                //END ELSE BEGIN
                                MComm := 5;
                            end;

                            LoanProdCharge.Reset;
                            LoanProdCharge.SetRange("Charge Code", 'L06');
                            LoanProdCharge.SetRange("Product Code", '126');
                            if LoanProdCharge.Find('-') then begin
                                MInt := LoanProdCharge."Charge Amount";
                                LoanProcessingGL := LoanProdCharge."Charges G_L Account";
                            end else begin
                                MInt := 100;
                            end;

                            LoanProdCharge.Reset;
                            LoanProdCharge.SetRange("Charge Code", 'L07');
                            LoanProdCharge.SetRange("Product Code", '126');
                            if LoanProdCharge.Find('-') then begin
                                vendorMboostaCommission := (LoanProdCharge.Percentage / 100) * (MComm);
                                vendorMboostaCommissionGL := LoanProdCharge."Charges G_L Account";
                            end else begin
                                MInt := 100;
                            end;
                            ////---- POST LOAN ---////

                            Loans.Reset;
                            Loans.SetRange(Loans.Status, Loans.Status::Approved);
                            Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                            Loans.SetRange(Loans."Loan Product Type", ProdFac."Product ID");
                            if Loans.Find('-') then begin
                                repeat
                                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                                    OutstandingAmount := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                                    //MESSAGE('%1 AND %2 V%3 AND COM %4',OutstandingAmount,MsaccoLoans."Requested Amount",vendorMboostaCommission,MComm);
                                    if (OutstandingAmount + vendorMboostaCommission + MComm) > MsaccoLoans."Requested Amount" then begin

                                        // Outstanding MBOOSTA Loan
                                        Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Outstanding M-Boosta loan. Kindly repay first.', ''
                                        , saccoAccount."No.", false);
                                        MsaccoLoans.Posted := true;
                                        MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                        MsaccoLoans.Remarks := 'Outstanding MBOOSTA Loan..';
                                        MsaccoLoans."Date Posted" := CurrentDatetime;
                                        MsaccoLoans.Modify;
                                        ContinueMB := false;
                                    end;
                                until Loans.Next = 0
                            end;
                        end;

                        if ContinueMB = true then begin
                            // check if member has an overdraft

                            if saccoAccount.Balance < -500 then begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Account is overdrawn with KES ' +
                               Format(saccoAccount.Balance * -1) + '. Normalize your account.', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'Member has overdrawn';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;

                        //Satus
                        if ContinueMB = true then begin
                            // check if member has an overdraft

                            if saccoAccount.Balance < -500 then begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Account is overdrawn with KES ' +
                               Format(saccoAccount.Balance * -1) + '. Normalize your account.', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'Member has overdrawn';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;

                        if ContinueMB = true then begin
                            // check if amount is less than minimum

                            if MsaccoLoans.Amount < ProdFac."Minimum Loan Amount" then begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Minimum loan amount is KES ' +
                                Format(ProdFac."Minimum Loan Amount") + '.', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'Less than minimum loan amount';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;
                        saccoAccountBOSA.Reset;
                        saccoAccountBOSA.SetRange("Member No.", saccoAccount."Member No.");
                        saccoAccountBOSA.SetRange("Product Type", '02');
                        if saccoAccountBOSA.Find('-') then begin
                            saccoAccountBOSA.CalcFields("Balance (LCY)");
                            if saccoAccountBOSA."Balance (LCY)" > 3000 then begin
                                /* Venderdetails.RESET;
                                 Venderdetails.SETRANGE("Customer No.", saccoAccountBOSA."No.");
                                 Venderdetails.SETFILTER(Description,'*Contribution*');
                                 Venderdetails.SETFILTER("Posting Date",'>=%1&<=%2',CALCDATE('<-CM>',CALCDATE('-1M',TODAY)), CALCDATE('<CM>',CALCDATE('-1M',TODAY)));
                                 Venderdetails.CALCSUMS(Amount);
                                 IF ABS(Venderdetails.Amount) > 2000 THEN BEGIN
                                    Venderdetails.RESET;
                                    Venderdetails.SETRANGE("Customer No.", saccoAccountBOSA."No.");
                                    Venderdetails.SETFILTER(Description,'*Contribution*');
                                   Venderdetails.SETFILTER("Posting Date",'>=%1&<=%2',CALCDATE('<-CM>',CALCDATE('-2M',TODAY)), CALCDATE('<CM>',CALCDATE('-2M',TODAY)));
                                   Venderdetails.CALCSUMS(Amount);
                                    IF ABS(Venderdetails.Amount) > 2000 THEN
                                      MESSAGE(FORMAT(Venderdetails.Amount))
                                      ELSE BEGIN
                                       Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Transactional Mobile No",'You dont qualify for this '+
                                  'Loan as your contributions have not been consistent in the last two months','',saccoAccount."No.",FALSE);
                                  MsaccoLoans.Posted:=TRUE;
                                  MsaccoLoans.Remarks:='Inconsistent Contributions';
                                  MsaccoLoans.Status:=MsaccoLoans.Status::Failed;
                                  MsaccoLoans.MODIFY;
                                  EXIT;
                                  END;
                                  */
                            end else begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'You dont qualify for this ' +
                               'Loan as your contributions have not been consistent in the last two months', '', saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Remarks := 'Inconsistent Contributions';
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Modify;
                                exit;
                            end;
                            //continue from here

                        end;

                        if ContinueMB = true then begin
                            // check if amount is more than maximum

                            if MsaccoLoans.Amount > (ProdFac."Maximum Loan Amount") then begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name +
                                ', your MBOOSTA Loan request has been rejected. Reason: Maximum loan amount is KES ' + Format(ProdFac."Maximum Loan Amount") + '.', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'More than maximum loan amount';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;

                        //Added Cont..
                        //check if account is active
                        if (saccoAccount.Status <> saccoAccount.Status::Active) and (saccoAccount.Status <> saccoAccount.Status::Active) then begin
                            // Outstanding MBOOSTA Loan
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Your Account is Inactive', ''
                            , saccoAccount."No.", false);
                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                            MsaccoLoans.Remarks := 'Member Inactive';
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans.Modify;
                            exit;
                        end;
                        //check if blocked
                        if (saccoAccount."Mobile Loan Blocked" = true) then begin
                            // Outstanding MBOOSTA Loan
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: You are blocked from accessing this product.', ''
                            , saccoAccount."No.", false);
                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                            MsaccoLoans.Remarks := 'Mobile loans blocked';
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans.Modify;
                            exit;
                        end;

                        //***sat
                        if Members.Get(saccoAccount."Member No.") then begin
                            if (Members.Status <> Members.Status::Active) and (Members.Status <> Members.Status::New) then begin

                                // Outstanding MBOOSTA Loan
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Your Account is Inactive', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'Member Inactive';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                                exit;
                            end;

                        end;

                        if ContinueMB = true then begin

                            // Check if defaulter //

                            DefaultedAmount := 0;

                            Loans.Reset;
                            Loans.SetRange(Loans.Status, Loans.Status::Approved);
                            Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                            if Loans.Find('-') then begin
                                repeat
                                    Loans.CalcFields(Loans."Outstanding Bills");
                                    if Loans."Outstanding Bills" > Loans.Repayment then begin
                                        DefaultedAmount := DefaultedAmount + Loans."Outstanding Bills";
                                    end
                                until Loans.Next = 0;
                            end;

                            if DefaultedAmount > 0 then begin
                             Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Phone No.", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Status defaulter.', '', saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'Member is a defaulter';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                         end;
                        end;

                        if ContinueMB = true then begin

                            MCommission := 0;
                            MInterest := 0;
                            MComm := 0;
                            MInt := 0;
                            LoanProdCharge.Reset;
                            LoanProdCharge.SetRange("Charge Code", 'L05');
                            LoanProdCharge.SetRange("Product Code", '126');
                            if LoanProdCharge.Find('-') then begin
                                MComm := LoanProdCharge.Percentage;
                                interestGL := LoanProdCharge."Charges G_L Account";
                            end else begin
                                MComm := 5;
                            end;

                            LoanProdCharge.Reset;
                            LoanProdCharge.SetRange("Charge Code", 'L06');
                            LoanProdCharge.SetRange("Product Code", '126');
                            if LoanProdCharge.Find('-') then begin
                                MInt := LoanProdCharge."Charge Amount";
                                LoanProcessingGL := LoanProdCharge."Charges G_L Account";
                            end else begin
                                MInt := 100;
                            end;

                            LoanProdCharge.Reset;
                            LoanProdCharge.SetRange("Charge Code", 'L07');
                            LoanProdCharge.SetRange("Product Code", '126');
                            if LoanProdCharge.Find('-') then begin
                                vendorMboostaCommission := LoanProdCharge.Percentage;
                                vendorMboostaCommissionGL := LoanProdCharge."Charges G_L Account";
                            end else begin
                                MInt := 100;
                            end;
                            ////---- POST LOAN ---////

                            if ProdFac.Get('126') then begin

                                Loans.Reset;
                                Loans.SetRange(Loans."Loan No.", 'MB_' + Format(MsaccoLoans."Entry no"));
                                if Loans.Find('-') then begin
                                end
                                else begin


                                    if ProdFac.Get(ProdFac."Product ID") then
                                        if CreditAccounts.Get(ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix") then
                                            LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix"
                                        else begin
                                            LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                            if saccoAccount.Get(saccoAccount."No.") then begin

                                                CreditAccounts.Init;
                                                CreditAccounts."No." := LAccount;
                                                CreditAccounts."Date of Birth" := saccoAccount."Date of Birth";
                                                CreditAccounts.Name := saccoAccount.Name;
                                                CreditAccounts."ID No." := saccoAccount."ID No.";
                                                CreditAccounts."Mobile Phone No" := saccoAccount."Mobile Phone No";
                                                CreditAccounts."Member No." := saccoAccount."Member No.";
                                                CreditAccounts."Passport No." := saccoAccount."Passport No.";
                                                CreditAccounts."Employer Code" := saccoAccount."Employer Code";
                                                CreditAccounts.Status := Accounts.Status::New;
                                                CreditAccounts."Account Category" := saccoAccount."Account Category";
                                                CreditAccounts."Current Address" := saccoAccount."Current Address";
                                                CreditAccounts.City := saccoAccount.City;
                                                CreditAccounts."Phone No." := saccoAccount."Phone No.";
                                                CreditAccounts."Post Code" := saccoAccount."Post Code";
                                                CreditAccounts.County := saccoAccount.County;
                                                CreditAccounts."E-Mail" := saccoAccount."E-Mail";
                                                CreditAccounts."Product Type" := ProdFac."Product ID";
                                                CreditAccounts."Product Name" := ProdFac."Product Description";
                                                CreditAccounts."Customer Posting Group" := ProdFac."Product Posting Group";
                                                CreditAccounts.Insert(true);

                                            end;
                                        end;

                                    // create LOAN //

                                    Loans.Init;
                                    Loans."Loan No." := 'MB_' + Format(MsaccoLoans."Entry no");
                                    Loans."Application Date" := Today;
                                    Loans."Loan Product Type" := ProdFac."Product ID";
                                    Loans."Member No." := saccoAccount."Member No.";
                                    Loans."Member Name" := saccoAccount.Name;
                                    Loans."Loan Product Type Name" := ProdFac."Product Description";
                                    Loans."Requested Amount" := MsaccoLoans."Requested Amount";
                                    Loans."Approved Amount" := MsaccoLoans."Requested Amount";
                                    Loans.Status := Loans.Status::Approved;
                                    Loans.Source := Loans.Source::CREDIT;

                                    Loans.Interest := MComm;//ProdFac."Interest Rate (Max.)";
                                    Loans."Mode of Disbursement" := Loans."mode of disbursement"::"Full Disbursement";
                                    Loans."Global Dimension 1 Code" := '';
                                    Loans."Loan Account" := LAccount;
                                    Loans.Repayment := MsaccoLoans."Requested Amount";
                                    Loans.Interest := ProdFac."Interest Rate (Min.)";
                                    Loans."Loan Principle Repayment" := MsaccoLoans."Requested Amount";
                                    ;
                                    Loans."Recovery Mode" := Loans."recovery mode"::" ";
                                    Loans."Loan Interest Repayment" := ROUND((MsaccoLoans."Requested Amount" * (MComm / 100)), 1);
                                    Loans."Disbursement Date" := Today;
                                    Loans."Approval Date" := Today;
                                    Loans."Repayment Frequency" := ProdFac."Repayment Frequency";
                                    Loans."Repayment Start Date" := CalcDate('31D', Today);
                                    Loans."Sub Sector Level2" := MsaccoLoans."Loan Purpose";
                                    Loans.Validate("Sub Sector Level2");
                                    Loans.Posted := true;
                                    Loans.Insert();
                                end;

                                AcctNo := 'MB_' + Format(MsaccoLoans."Entry no");
                            end;


                            //start posting

                            GenJournalLine.Reset;
                            GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                            GenJournalLine.SetRange("Journal Batch Name", 'MSACCOLN');
                            GenJournalLine.DeleteAll;

                            DocumentNo := DelChr(MsaccoLoans.DocumentNo, '=', '_');

                            // Dr LOAN Account

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                            GenJournalLine."Account No." := LAccount;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                            GenJournalLine."Loan No" := AcctNo;
                            GenJournalLine.Amount := Loans."Approved Amount";
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            // Cr Member FOSA Account - less Interest

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Amount := (Loans."Approved Amount") * -1;// - Loans."Loan Interest Repayment") * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No.";
                            ;
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;


                            // Dr Interest FOSA

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Amount := Loans."Loan Interest Repayment";// - Loans."Loan Interest Repayment") * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No." + 'Interest';
                            ;
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;


                            //Cr Interest G/L
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                            GenJournalLine."Account No." := interestGL;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                            GenJournalLine."Loan No" := Loans."Loan No.";
                            GenJournalLine.Amount := ((Loans."Loan Interest Repayment") * ((100 - vendorMboostaCommission) / 100)) * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No." + ' INTEREST';
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;




                            //Cr Vendor Share to G/L
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                            GenJournalLine."Account No." := Msaccoacc;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No." + ' INTEREST';
                            GenJournalLine.Amount := ((Loans."Loan Interest Repayment") * ((vendorMboostaCommission) / 100) * -1);
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            /* // Cr Interest Revenue G/L

                             LineNo:=LineNo+10000;
                             GenJournalLine.INIT;
                             GenJournalLine."Journal Template Name":='MSACCO';
                             GenJournalLine."Journal Batch Name":='MSACCOLN';
                             GenJournalLine."Line No.":=LineNo;
                             GenJournalLine."Account Type":=GenJournalLine."Account Type"::Savings;
                             GenJournalLine."Account No.":=saccoAccount."No.";//LoanProcessingGL;
                             GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                             GenJournalLine."Document No.":=DocumentNo;
                             GenJournalLine."Posting Date":= TODAY;
                             GenJournalLine.Description:='MBOOSTA LOAN '+ Loans."Loan No." +' INTEREST';
                             GenJournalLine.Amount:=(Loans."Loan Interest Repayment") * ((100-vendorMboostaCommission)/100);
                             GenJournalLine.VALIDATE(GenJournalLine.Amount);
                             GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::"G/L Account";
                             GenJournalLine."Bal. Account No." :=LoanProcessingGL;
                             GenJournalLine.VALIDATE("Bal. Account No.");
                             GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                             GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                             GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                             GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                             IF GenJournalLine.Amount<>0 THEN
                             GenJournalLine.INSERT;


                            // Cr Vendor Share to Revenue G/L

                             LineNo:=LineNo+10000;
                             GenJournalLine.INIT;
                             GenJournalLine."Journal Template Name":='MSACCO';
                             GenJournalLine."Journal Batch Name":='MSACCOLN';
                             GenJournalLine."Line No.":=LineNo;
                             GenJournalLine."Account Type":=GenJournalLine."Account Type"::Savings;
                             GenJournalLine."Account No.":=saccoAccount."No.";//LoanProcessingGL;
                             GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                             GenJournalLine."Document No.":=DocumentNo;
                             GenJournalLine."Posting Date":= TODAY;
                             GenJournalLine.Description:='MBOOSTA LOAN '+ Loans."Loan No." +' INTEREST';
                             GenJournalLine.Amount:=(Loans."Loan Interest Repayment")* ((vendorMboostaCommission)/100);
                             GenJournalLine.VALIDATE(GenJournalLine.Amount);
                             GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::"G/L Account";
                             GenJournalLine."Bal. Account No." :=vendorMboostaCommissionGL;
                             GenJournalLine.VALIDATE("Bal. Account No.");
                             GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                             GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                             GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                             GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                             IF GenJournalLine.Amount<>0 THEN
                             GenJournalLine.INSERT;

   */




                            ProcessingFee := MInt;
                            ExciseDuty := ProcessingFee * (GetExciseDuty() / 100);
                            ExciseDutyGL := GetExciseDutyGL();


                            // Dr Member Loan Processing Fee

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := 'MBOOSTA Loan ' + Loans."Loan No." + 'Processing Fee';
                            GenJournalLine.Amount := ProcessingFee;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := LoanProcessingGL;
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            // Dr member Excise Duty
                            GenSetUp.Get;

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := 'MBOOSTA Loan ' + Loans."Loan No." + 'Excise Duty';
                            GenJournalLine.Amount := ExciseDuty;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := GenSetUp."Excise Duty G/L";
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;


                            //**Top up Mbooster
                            LoansOld.Reset;
                            LoansOld.SetRange("Member No.", saccoAccount."Member No.");
                            LoansOld.SetRange("Loan Product Type", ProdFac."Product ID");
                            LoansOld.SetFilter("Outstanding Balance", '>0');
                            if LoansOld.Find('-') then begin
                                LoansOld.CalcFields("Outstanding Balance", "Outstanding Interest");
                                //TopupAmount:=LoansOld."Outstanding Balance"+LoansOld."Outstanding Interest";

                                //CR Loan
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                GenJournalLine."Account No." := CreditAccounts."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Amount := LoansOld."Outstanding Interest" * -1;// - Loans."Loan Interest Repayment") * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Loan No" := LoansOld."Loan No.";
                                GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                                GenJournalLine.Description := 'MBOOSTA LOAN TOP-UP' + Loans."Loan No.";
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                //DR Saving Interest
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := saccoAccount."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Amount := LoansOld."Outstanding Interest";// - Loans."Loan Interest Repayment") * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine.Description := 'MBOOSTA LOAN Interest TOP-UP' + Loans."Loan No.";
                                ;
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;


                                //DR Loan Repayment
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                GenJournalLine."Account No." := CreditAccounts."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Amount := LoansOld."Outstanding Balance" * -1;// - Loans."Loan Interest Repayment") * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Loan No" := LoansOld."Loan No.";
                                GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Repayment;
                                GenJournalLine.Description := 'MBOOSTA LOAN TOP-UP' + Loans."Loan No.";
                                ;
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                //DR Saving Repayment
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := saccoAccount."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Amount := LoansOld."Outstanding Balance";// - Loans."Loan Interest Repayment") * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine.Description := 'MBOOSTA LOAN Repayment TOP-UP' + Loans."Loan No.";
                                ;
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                //Boost Commission Start

                                BridgeLoanFunction(LineNo, 'MSACCO', 'MSACCOLN', DocumentNo, LoansOld."Outstanding Balance", Loans."Loan No.", MsaccoLoans."Account No");
                                //Boost Commission End

                            end;


                            // complete posting

                            POSTJOURNAL.CompletePosting('MSACCO', 'MSACCOLN');

                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your M-BOOSTA Loan of KES' +
                            Format(Loans."Approved Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                            Format(CalcDate('1M', Today), 0, '<Day>-<Month>-<Year>') + '.', '', saccoAccount."No.", false);

                            //Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Phone No.",'Dear member, to repay your M-Boosta Loan kindly deposit money to your FOSA A/C No '+
                            //saccoAccount."No." +' through paybill No 525200','',saccoAccount."No.",FALSE);

                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans."Approved Amount" := Loans."Approved Amount";
                            MsaccoLoans.Remarks := 'Successful';
                            MsaccoLoans.Modify;


                        end;
                    end else begin
                        MsaccoLoans.Posted := true;
                        MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                        MsaccoLoans."Date Posted" := CurrentDatetime;
                        //MsaccoLoans."Approved Amount":= Loans."Approved Amount";
                        MsaccoLoans.Remarks := 'Product not set';
                        MsaccoLoans.Modify;
                    end;
                end;
            until MsaccoLoans.Next = 0;
        end;

    end;


    procedure GetPostedInstantLoans() Response: Text
    var
        RevenueAmount: Decimal;
    begin
        Loans.Reset;
        Loans.SetRange(Loans."Loan Product Type", '126');
        Loans.SetRange(Loans."Picked Mobile Loan", false);
        Loans.SetRange(Loans.Posted, true);
        //Loans.SETFILTER(Loans."Loan No.",'%1','MB_1');
        if Loans.FindFirst() then begin
            ProdFac.Reset;
            ProdFac.SetRange(ProdFac."Product ID", '126');
            if ProdFac.Find('-') then begin
                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."Member No.", Loans."Member No.");
                if saccoAccount.Find('-') then begin
                    RevenueAmount := Loans."Loan Interest Repayment" * 0.2;
                    Message(Format(RevenueAmount));
                    Response := Loans."Loan No." + '|' + Format(Today) + '|' + Loans."Member No." + '|' + saccoAccount."Transactional Mobile No" + '|' + Format(+Loans."Approved Amount")
                    + '|' + Format(Loans."Loan Interest Repayment") + '|' + Format(RevenueAmount); //FORMAT(Loans."Loan Interest Repayment"-RevenueAmount);
                    Loans."Picked Mobile Loan" := true;
                    Loans.Modify;
                end;
            end;
        end;
    end;


    procedure PostMBOOSTALoanEdited()
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
    begin
        MsaccoChargesSetup.Reset;
        MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
        if MsaccoChargesSetup.Find('-') then begin
            MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
            Msaccocharge := MsaccoChargesSetup.ChargeAmount;
            Msaccoacc := MsaccoChargesSetup."Vendor No";
        end;

        LineNo := 0;
        TotalClearedAmount := 0;

        //MESSAGE('t');

        POSTJOURNAL.ClearJournalLines('MSACCO', 'MSACCOLN');

        MsaccoLoans.Reset;
        MsaccoLoans.SetRange(MsaccoLoans.Status, MsaccoLoans.Status::Pending);
        MsaccoLoans.SetRange(MsaccoLoans."Loan Product Type", MsaccoLoans."loan product type"::"Instant Loan");
        MsaccoLoans.SetRange(MsaccoLoans.Posted, false);
        if MsaccoLoans.Find('-') then begin
            repeat
                DocumentNo := DelChr(MsaccoLoans.DocumentNo, '=', '_');
                ContinueMB := true;
                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."No.", MsaccoLoans."Account No");
                if saccoAccount.Find('-') then begin
                    SaccoMemberNo := saccoAccount."Member No.";
                    //CHECK SALARY
                    if CheckMboostaSpecial(saccoAccount."Member No.") = true then begin

                        MCommission := 0;
                        MInterest := 0;
                        MComm := 0;
                        MInt := 0;
                        LoanProdCharge.Reset;
                        LoanProdCharge.SetRange("Charge Code", 'L05');
                        LoanProdCharge.SetRange("Product Code", '126');
                        if LoanProdCharge.Find('-') then begin
                            MComm := LoanProdCharge.Percentage;
                            interestGL := LoanProdCharge."Charges G_L Account";
                        end else begin
                            MComm := 5;
                        end;

                        LoanProdCharge.Reset;
                        LoanProdCharge.SetRange("Charge Code", 'L06');
                        LoanProdCharge.SetRange("Product Code", '126');
                        if LoanProdCharge.Find('-') then begin
                            MInt := LoanProdCharge."Charge Amount";
                            LoanProcessingGL := LoanProdCharge."Charges G_L Account";
                        end else begin
                            MInt := 100;
                        end;

                        LoanProdCharge.Reset;
                        LoanProdCharge.SetRange("Charge Code", 'L07');
                        LoanProdCharge.SetRange("Product Code", '126');
                        if LoanProdCharge.Find('-') then begin
                            vendorMboostaCommission := LoanProdCharge.Percentage;
                            vendorMboostaCommissionGL := LoanProdCharge."Charges G_L Account";
                        end else begin
                            MInt := 100;
                        end;

                        //check if account is active
                        if (saccoAccount.Status <> saccoAccount.Status::Active) and (saccoAccount.Status <> saccoAccount.Status::Active) then begin
                            // Outstanding MBOOSTA Loan
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Your Account is Inactive', ''
                            , saccoAccount."No.", false);
                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                            MsaccoLoans.Remarks := 'Member Inactive';
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans.Modify;
                            exit;
                        end;
                        //check if blocked
                        if (saccoAccount."Mobile Loan Blocked" = true) then begin
                            // Outstanding MBOOSTA Loan
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: You are blocked from accessing this product.', ''
                            , saccoAccount."No.", false);
                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                            MsaccoLoans.Remarks := 'Mobile loans blocked';
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans.Modify;
                            exit;
                        end;
                        /*     saccoAccountBOSA.RESET;
                             saccoAccountBOSA.SETRANGE("Member No.", saccoAccount."Member No.");
                             saccoAccountBOSA.SETRANGE("Product Type",'02');
                             IF saccoAccountBOSA.FIND('-') THEN BEGIN
                                Venderdetails.RESET;
                                Venderdetails.SETRANGE("Customer No.", saccoAccountBOSA."No.");
                                Venderdetails.SETFILTER(Description,'*Contribution*');
                                Venderdetails.SETFILTER("Posting Date",'>=%1&<=%2',CALCDATE('<-CM>',CALCDATE('-1M',TODAY)), CALCDATE('<CM>',CALCDATE('-1M',TODAY)));
                                Venderdetails.CALCSUMS(Amount);
                                IF ABS(Venderdetails.Amount) > 2000 THEN BEGIN
                                   Venderdetails.RESET;
                                   Venderdetails.SETRANGE("Customer No.", saccoAccountBOSA."No.");
                                   Venderdetails.SETFILTER(Description,'*Contribution*');
                                  Venderdetails.SETFILTER("Posting Date",'>=%1&<=%2',CALCDATE('<-CM>',CALCDATE('-1M',TODAY)), CALCDATE('<CM>',CALCDATE('-1M',TODAY)));
                                  Venderdetails.CALCSUMS(Amount);
                                   IF ABS(Venderdetails.Amount) > 2000 THEN
                                     MESSAGE(FORMAT(Venderdetails.Amount))
                                     ELSE BEGIN
                                      Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Transactional Mobile No",'You dont qualify for this '+
                                 'Loan as your contributions have not been consistent in the last two months','',saccoAccount."No.",FALSE);
                                 MsaccoLoans.Posted:=TRUE;
                                 MsaccoLoans.Remarks:='Iconsistent Contributions';
                                 MsaccoLoans.Status:=MsaccoLoans.Status::Failed;
                                 MsaccoLoans.MODIFY;
                                 EXIT;
                                 END;
                                 END
                                  ELSE BEGIN
                                  Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Transactional Mobile No",'You dont qualify for this '+
                                 'Loan as your contributions have not been consistent in the last two months','',saccoAccount."No.",FALSE);
                                 MsaccoLoans.Posted:=TRUE;
                                 MsaccoLoans.Remarks:='Iconsistent Contributions';
                                 MsaccoLoans.Status:=MsaccoLoans.Status::Failed;
                                 MsaccoLoans.MODIFY;
                                  EXIT;
                                 END;
                                //continue from here

                             END;
                             */

                        SaccoMemberNo := saccoAccount."Member No.";
                        Venderdetails.Reset;
                        Venderdetails.SetRange(Venderdetails."Document No.", DelChr(MsaccoLoans.DocumentNo, '=', '_'));
                        Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
                        if Venderdetails.Find('-') then begin
                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                            MsaccoLoans.Remarks := 'Successful';
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans."Approved Amount" := MsaccoLoans."Requested Amount";
                            MsaccoLoans.Modify;
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your M-BOOSTA Loan of KES' +
                                  Format(MsaccoLoans."Requested Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                                  Format(CalcDate('1M', Today), 0, '<Day>-<Month>-<Year>') + '.', '', saccoAccount."No.", false);
                            ContinueMB := false;
                        end;

                        Venderdetails.Reset;
                        Venderdetails.SetRange(Venderdetails."Document No.", MsaccoLoans.DocumentNo);
                        Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
                        if Venderdetails.Find('-') then begin
                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                            MsaccoLoans.Remarks := 'Successful';
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans."Approved Amount" := MsaccoLoans."Requested Amount";
                            MsaccoLoans.Modify;
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your M-BOOSTA Loan of KES' +
                                  Format(MsaccoLoans."Requested Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                                  Format(CalcDate('1M', Today), 0, '<Day>-<Month>-<Year>') + '.', '', saccoAccount."No.", false);
                            ContinueMB := false;
                        end;

                        // check if member has existing MBOOSTA Loan
                        Loans.Reset;
                        Loans.SetRange(Loans.Status, Loans.Status::Approved);
                        Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                        Loans.SetRange(Loans."Loan Product Type", ProdFac."Product ID");
                        if Loans.Find('-') then begin
                            repeat
                                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                                OutstandingAmount := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                                if OutstandingAmount > MsaccoLoans."Requested Amount" then begin
                                    // Outstanding MBOOSTA Loan
                                    Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Outstanding M-Boosta loan. Kindly repay first.', ''
                                    , saccoAccount."No.", false);
                                    MsaccoLoans.Posted := true;
                                    MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                    MsaccoLoans.Remarks := 'Outstanding MBOOSTA Loan';
                                    MsaccoLoans."Date Posted" := CurrentDatetime;
                                    MsaccoLoans.Modify;
                                    ContinueMB := false;
                                end;
                            until Loans.Next = 0
                        end;

                        //check if defaulter

                        Loans.Reset;
                        Loans.SetRange(Loans.Status, Loans.Status::Approved);
                        Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                        // Loans.SETRANGE(Loans."Loan Product Type",ProdFac."Product ID");
                        if Loans.Find('-') then begin
                            repeat
                                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                                OutstandingAmount := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                                if (OutstandingAmount > 0) and (Loans."Loans Category-SASRA" <> Loans."loans category-sasra"::Perfoming) then begin
                                    // Outstanding MBOOSTA Loan
                                    Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Your Loan ' + Loans."Loan No." + '. is in arrears.', ''
                                    , saccoAccount."No.", false);
                                    MsaccoLoans.Posted := true;
                                    MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                    MsaccoLoans.Remarks := 'Defaulted Loan-' + Loans."Loan No.";
                                    MsaccoLoans."Date Posted" := CurrentDatetime;
                                    MsaccoLoans.Modify;
                                    ContinueMB := false;
                                    exit;
                                end;
                            until Loans.Next = 0
                        end;

                        //***sat
                        if Members.Get(saccoAccount."Member No.") then begin
                            if (Members.Status <> Members.Status::Active) and (Members.Status <> Members.Status::New) then begin

                                // Outstanding MBOOSTA Loan
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Your Account is Inactive', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'Member Inactive';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                                exit;
                            end;

                        end;



                        ////---- POST LOAN ---////
                        if ContinueMB = true then begin
                            if ProdFac.Get('126') then begin

                                Loans.Reset;
                                Loans.SetRange(Loans."Loan No.", 'MB_' + Format(MsaccoLoans."Entry no"));
                                if Loans.Find('-') then begin
                                end
                                else begin

                                    if ProdFac.Get(ProdFac."Product ID") then
                                        if CreditAccounts.Get(ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix") then
                                            LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix"
                                        else begin
                                            LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                            if saccoAccount.Get(saccoAccount."No.") then begin

                                                CreditAccounts.Init;
                                                CreditAccounts."No." := LAccount;
                                                CreditAccounts."Date of Birth" := saccoAccount."Date of Birth";
                                                CreditAccounts.Name := saccoAccount.Name;
                                                CreditAccounts."ID No." := saccoAccount."ID No.";
                                                CreditAccounts."Mobile Phone No" := saccoAccount."Mobile Phone No";
                                                CreditAccounts."Member No." := saccoAccount."Member No.";
                                                CreditAccounts."Passport No." := saccoAccount."Passport No.";
                                                CreditAccounts."Employer Code" := saccoAccount."Employer Code";
                                                CreditAccounts.Status := Accounts.Status::New;
                                                CreditAccounts."Account Category" := saccoAccount."Account Category";
                                                CreditAccounts."Current Address" := saccoAccount."Current Address";
                                                CreditAccounts.City := saccoAccount.City;
                                                CreditAccounts."Phone No." := saccoAccount."Phone No.";
                                                CreditAccounts."Post Code" := saccoAccount."Post Code";
                                                CreditAccounts.County := saccoAccount.County;
                                                CreditAccounts."E-Mail" := saccoAccount."E-Mail";
                                                CreditAccounts."Product Type" := ProdFac."Product ID";
                                                CreditAccounts."Product Name" := ProdFac."Product Description";
                                                CreditAccounts."Customer Posting Group" := ProdFac."Product Posting Group";
                                                CreditAccounts.Insert(true);

                                            end;
                                        end;

                                    // create LOAN //

                                    Loans.Init;
                                    Loans."Loan No." := 'MB_' + Format(MsaccoLoans."Entry no");
                                    Loans."Application Date" := Today;
                                    Loans."Loan Product Type" := ProdFac."Product ID";
                                    Loans."Member No." := saccoAccount."Member No.";
                                    Loans."Member Name" := saccoAccount.Name;
                                    Loans."Loan Product Type Name" := ProdFac."Product Description";
                                    Loans."Requested Amount" := MsaccoLoans."Requested Amount";
                                    Loans."Approved Amount" := MsaccoLoans."Requested Amount";
                                    Loans.Status := Loans.Status::Approved;
                                    Loans.Source := Loans.Source::CREDIT;
                                    Loans."Staff No" := saccoAccount."Payroll/Staff No.";
                                    Loans."Employer Code" := saccoAccount."Employer Code";
                                    Loans.Interest := MComm;//ProdFac."Interest Rate (Max.)";
                                    Loans."Mode of Disbursement" := Loans."mode of disbursement"::"Full Disbursement";
                                    Loans."Global Dimension 1 Code" := '';
                                    Loans."Loan Account" := LAccount;
                                    Loans.Repayment := MsaccoLoans."Requested Amount";
                                    Loans.Interest := ProdFac."Interest Rate (Min.)";
                                    Loans."Loan Principle Repayment" := MsaccoLoans."Requested Amount";
                                    ;
                                    Loans."Recovery Mode" := Loans."recovery mode"::" ";
                                    Loans."Loan Interest Repayment" := ROUND((MsaccoLoans."Requested Amount" * (MComm / 100)), 1);
                                    Loans."Disbursement Date" := Today;
                                    Loans."Approval Date" := Today;
                                    Loans."Repayment Frequency" := ProdFac."Repayment Frequency";
                                    Loans."Repayment Start Date" := CalcDate('31D', Today);
                                    Loans."Sub Sector Level2" := MsaccoLoans."Loan Purpose";
                                    Loans.Validate("Sub Sector Level2");
                                    Loans.Posted := true;
                                    Loans.Insert();
                                end;

                                AcctNo := 'MB_' + Format(MsaccoLoans."Entry no");
                            end;



                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                            GenJournalLine."Account No." := LAccount;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Amount := (Loans."Approved Amount") * 1;// - Loans."Loan Interest Repayment") * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                            GenJournalLine."Loan No" := Loans."Loan No.";
                            GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;


                            // Cr Member FOSA Account - less Interest

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Amount := (Loans."Approved Amount") * -1;// - Loans."Loan Interest Repayment") * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No.";
                            ;
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;


                            // Dr Interest FOSA

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Amount := Loans."Loan Interest Repayment";// - Loans."Loan Interest Repayment") * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No." + ' Interest';
                            ;
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;


                            //Cr Interest G/L
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                            GenJournalLine."Account No." := interestGL;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                            GenJournalLine."Loan No" := Loans."Loan No.";
                            GenJournalLine.Amount := ((Loans."Loan Interest Repayment") * ((100 - vendorMboostaCommission) / 100)) * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No." + ' INTEREST';
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;




                            //Cr Vendor Share to G/L
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                            GenJournalLine."Account No." := Msaccoacc;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No." + ' INTEREST';
                            GenJournalLine.Amount := ((Loans."Loan Interest Repayment") * ((vendorMboostaCommission) / 100) * -1);
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;



                            ProcessingFee := MInt;
                            ExciseDuty := ProcessingFee * (GetExciseDuty() / 100);
                            ExciseDutyGL := GetExciseDutyGL();


                            // Dr Member Loan Processing Fee

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := 'MBOOSTA Loan ' + Loans."Loan No." + ' Processing Fee';
                            GenJournalLine.Amount := ProcessingFee;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := LoanProcessingGL;
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            // Dr member Excise Duty
                            GenSetUp.Get;

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := 'MBOOSTA Loan ' + Loans."Loan No." + ' Excise Duty';
                            GenJournalLine.Amount := ExciseDuty;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := GenSetUp."Excise Duty G/L";
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            //**Top up Mbooster
                            LoansOld.Reset;
                            LoansOld.SetRange("Member No.", saccoAccount."Member No.");
                            LoansOld.SetRange("Loan Product Type", ProdFac."Product ID");
                            LoansOld.SetFilter("Outstanding Balance", '>0');
                            if LoansOld.Find('-') then begin
                                LoansOld.CalcFields("Outstanding Balance", "Outstanding Interest");
                                TopupAmount := LoansOld."Outstanding Balance" + LoansOld."Outstanding Interest";

                                //CR Loan
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                GenJournalLine."Account No." := CreditAccounts."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Amount := LoansOld."Outstanding Interest" * -1;// - Loans."Loan Interest Repayment") * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Loan No" := LoansOld."Loan No.";
                                GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                                GenJournalLine.Description := 'MBOOSTA LOAN TOP-UP' + Loans."Loan No.";
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                //DR Saving Interest
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := saccoAccount."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Amount := LoansOld."Outstanding Interest";// - Loans."Loan Interest Repayment") * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine.Description := 'MBOOSTA LOAN Interest TOP-UP' + Loans."Loan No.";
                                ;
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;


                                //DR Loan Repayment
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                GenJournalLine."Account No." := CreditAccounts."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Amount := LoansOld."Outstanding Balance" * -1;// - Loans."Loan Interest Repayment") * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Loan No" := LoansOld."Loan No.";
                                GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Repayment;
                                GenJournalLine.Description := 'MBOOSTA LOAN TOP-UP' + Loans."Loan No.";
                                ;
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                //DR Saving Repayment
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := saccoAccount."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Amount := LoansOld."Outstanding Balance";// - Loans."Loan Interest Repayment") * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine.Description := 'MBOOSTA LOAN Repayment TOP-UP' + Loans."Loan No.";
                                ;
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                //Boost Commission Start
                                BridgeLoanFunction(LineNo, 'MSACCO', 'MSACCOLN', DocumentNo, LoansOld."Outstanding Balance", Loans."Loan No.", MsaccoLoans."Account No");
                                //Boost Commission End

                            end;


                            // complete posting

                            POSTJOURNAL.CompletePosting('MSACCO', 'MSACCOLN');

                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your M-BOOSTA Loan of KES' +
                            Format(Loans."Approved Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                            Format(CalcDate('1M', Today), 0, '<Day>-<Month>-<Year>') + '.', '', saccoAccount."No.", false);

                            //Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Phone No.",'Dear member, to repay your M-Boosta Loan kindly deposit money to your FOSA A/C No '+
                            //saccoAccount."No." +' through paybill No 525200','',saccoAccount."No.",FALSE);

                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans."Approved Amount" := Loans."Approved Amount";
                            MsaccoLoans.Remarks := 'Successful';
                            MsaccoLoans.Modify;
                        end else begin

                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your M-BOOSTA Loan of KES' +
                            Format(Loans."Approved Amount") + ' has been rejected. Please contact your Sacco.', '', saccoAccount."No.", false);

                            //Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Phone No.",'Dear member, to repay your M-Boosta Loan kindly deposit money to your FOSA A/C No '+
                            //saccoAccount."No." +' through paybill No 525200','',saccoAccount."No.",FALSE);

                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans."Approved Amount" := Loans."Approved Amount";
                            MsaccoLoans.Remarks := 'Loan Rejected';
                            MsaccoLoans.Modify;

                        end;

                    end else begin

                        month := 0;
                        //salStartString := '1/'+FORMAT(DATE2DMY(TODAY,2))+'/'+FORMAT(DATE2DMY(TODAY,3));
                        salStartString := Format(Date2dmy(Today, 2)) + '/1/' + Format(Date2dmy(Today, 3));
                        Evaluate(salStartDate, salStartString);

                        Evaluate(salStartDate, salStartString);
                        PeriodStartDate[1] := CalcDate('<-1M>', salStartDate - 1);
                        PeriodEndDate[1] := CalcDate('<-1M>', salStartDate - 1);


                        month := Date2dmy(PeriodStartDate[1], 2);


                        if ((month = 4) or (month = 6) or (month = 9) or (month = 11)) then begin
                            /*EVALUATE(PeriodEndDate[1],'30/'+FORMAT(DATE2DMY(PeriodStartDate[1],2))+'/'+FORMAT(DATE2DMY(PeriodStartDate[1],3)));
                            EVALUATE(PeriodEndDate[1],'1/'+FORMAT(DATE2DMY(PeriodStartDate[1],2))+'/'+FORMAT(DATE2DMY(PeriodStartDate[1],3)));*/
                            Evaluate(PeriodEndDate[1], Format(Date2dmy(PeriodStartDate[1], 2)) + '/30/' + Format(Date2dmy(PeriodStartDate[1], 3)));
                            Evaluate(PeriodEndDate[1], Format(Date2dmy(PeriodStartDate[1], 2)) + '/1/' + Format(Date2dmy(PeriodStartDate[1], 3)));

                        end else
                            if (month = 2) then begin
                                /*EVALUATE(PeriodEndDate[1],'28/'+FORMAT(DATE2DMY(PeriodStartDate[1],2))+'/'+FORMAT(DATE2DMY(PeriodStartDate[1],3)));
                                EVALUATE(PeriodEndDate[1],'1/'+FORMAT(DATE2DMY(PeriodStartDate[1],2))+'/'+FORMAT(DATE2DMY(PeriodStartDate[1],3)));*/
                                Evaluate(PeriodEndDate[1], Format(Date2dmy(PeriodStartDate[1], 2)) + '/28/' + Format(Date2dmy(PeriodStartDate[1], 3)));
                                Evaluate(PeriodEndDate[1], Format(Date2dmy(PeriodStartDate[1], 2)) + '/1/' + Format(Date2dmy(PeriodStartDate[1], 3)));
                            end else begin
                                /*EVALUATE(PeriodEndDate[1],'31/'+FORMAT(DATE2DMY(PeriodStartDate[1],2))+'/'+FORMAT(DATE2DMY(PeriodStartDate[1],3)));
                                EVALUATE(PeriodEndDate[1],'1/'+FORMAT(DATE2DMY(PeriodStartDate[1],2))+'/'+FORMAT(DATE2DMY(PeriodStartDate[1],3)));*/
                                Evaluate(PeriodEndDate[1], Format(Date2dmy(PeriodStartDate[1], 2)) + '/31/' + Format(Date2dmy(PeriodStartDate[1], 3)));
                                Evaluate(PeriodEndDate[1], Format(Date2dmy(PeriodStartDate[1], 2)) + '/1/' + Format(Date2dmy(PeriodStartDate[1], 3)));
                            end;

                        // MBOOSTA LOAN //
                        if ProdFac.Get('126') then begin
                            SaccoAccMemberNo := MsaccoLoans."Account No";

                            SalBuffer.Reset;
                            SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Account No.", SalBuffer."Posting Date");
                            SalBuffer.SetRange(SalBuffer."Account No.", SaccoAccMemberNo);
                            SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', PeriodStartDate[1], PeriodEndDate[1]);
                            if SalBuffer.Find('-') then begin
                                CurrSal[i] := SalBuffer.Amount;
                                TotSalarieies := TotSalarieies + CurrSal[1];
                                Salary1 := CurrSal[1];
                                Minimum := SalBuffer.Amount;
                                if SalBuffer.Amount < Minimum then
                                    Minimum := SalBuffer.Amount;
                            end;

                            // SALARY //

                            if ContinueMB = false then begin

                                // salary not processed
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name +
                                ', your MBOOSTA Loan request has been rejected. Reason: Process salary through Harambee Sacco FOSA to qualify for this product.', '',
                                saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'Salary not processed for 3 months';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;

                            if ContinueMB = true then begin
                                //Prevent Double Posting
                                Venderdetails.Reset;
                                Venderdetails.SetRange(Venderdetails."Document No.", MsaccoLoans.DocumentNo);
                                Venderdetails.SetRange("Customer No.", MsaccoLoans."Account No");
                                Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
                                if Venderdetails.Find('-') then begin
                                    MsaccoLoans.Posted := true;
                                    MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                                    MsaccoLoans.Remarks := 'Successful';
                                    MsaccoLoans."Date Posted" := CurrentDatetime;
                                    MsaccoLoans."Approved Amount" := MsaccoLoans."Requested Amount";
                                    MsaccoLoans.Modify;
                                    Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your M-BOOSTA Loan of KES' +
                                          Format(MsaccoLoans."Requested Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                                          Format(CalcDate('1M', Today), 0, '<Day>-<Month>-<Year>') + '.', '', saccoAccount."No.", false);
                                    ContinueMB := false;
                                end;
                            end;


                            if ContinueMB = true then begin
                                // check if member has existing MBOOSTA Loan
                                Loans.Reset;
                                Loans.SetRange(Loans.Status, Loans.Status::Approved);
                                Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                                Loans.SetRange(Loans."Loan Product Type", ProdFac."Product ID");
                                if Loans.Find('-') then begin
                                    repeat
                                        Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                                        OutstandingAmount := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                                        if OutstandingAmount > 0 then begin
                                            // Outstanding MBOOSTA Loan
                                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Outstanding M-Boosta loan. Kindly repay first.', ''
                                            , saccoAccount."No.", false);
                                            MsaccoLoans.Posted := true;
                                            MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                            MsaccoLoans.Remarks := 'Outstanding MBOOSTA Loan';
                                            MsaccoLoans."Date Posted" := CurrentDatetime;
                                            MsaccoLoans.Modify;
                                            ContinueMB := false;
                                        end;
                                    until Loans.Next = 0
                                end;
                            end;

                            if ContinueMB = true then begin
                                // check if member has an overdraft

                                if saccoAccount.Balance < -500 then begin
                                    Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Account is overdrawn with KES ' +
                                   Format(saccoAccount.Balance * -1) + '. Normalize your account.', ''
                                    , saccoAccount."No.", false);
                                    MsaccoLoans.Posted := true;
                                    MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                    MsaccoLoans.Remarks := 'Member has overdrawn';
                                    MsaccoLoans."Date Posted" := CurrentDatetime;
                                    MsaccoLoans.Modify;
                                    ContinueMB := false;
                                end;
                            end;

                            if ContinueMB = true then begin
                                // check if amount is less than minimum

                                if MsaccoLoans.Amount < ProdFac."Minimum Loan Amount" then begin
                                    Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Minimum loan amount is KES ' +
                                    Format(ProdFac."Minimum Loan Amount") + '.', ''
                                    , saccoAccount."No.", false);
                                    MsaccoLoans.Posted := true;
                                    MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                    MsaccoLoans.Remarks := 'Less than minimum loan amount';
                                    MsaccoLoans."Date Posted" := CurrentDatetime;
                                    MsaccoLoans.Modify;
                                    ContinueMB := false;
                                end;
                            end;


                            if ContinueMB = true then begin
                                // check if amount is more than maximum

                                if MsaccoLoans.Amount > (ProdFac."Maximum Loan Amount") then begin
                                    Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name +
                                    ', your MBOOSTA Loan request has been rejected. Reason: Maximum loan amount is KES ' + Format(ProdFac."Maximum Loan Amount") + '.', ''
                                    , saccoAccount."No.", false);
                                    MsaccoLoans.Posted := true;
                                    MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                    MsaccoLoans.Remarks := 'More than maximum loan amount';
                                    MsaccoLoans."Date Posted" := CurrentDatetime;
                                    MsaccoLoans.Modify;
                                    ContinueMB := false;
                                end;
                            end;

                            if ContinueMB = true then begin

                                // Check if defaulter //

                                DefaultedAmount := 0;

                                Loans.Reset;
                                Loans.SetRange(Loans.Status, Loans.Status::Approved);
                                Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                                if Loans.Find('-') then begin
                                    repeat
                                        Loans.CalcFields(Loans."Outstanding Bills");
                                        if Loans."Outstanding Bills" > Loans.Repayment then begin
                                            DefaultedAmount := DefaultedAmount + Loans."Outstanding Bills";
                                        end
                                    until Loans.Next = 0;
                                end;
                                if DefaultedAmount > 0 then begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Phone No.", 'Dear ' + saccoAccount.Name + ', your MBOOSTA Loan request has been rejected. Reason: Status defaulter.', '', saccoAccount."No.", false);
                                        MsaccoLoans.Posted := true;
                                        MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                        MsaccoLoans.Remarks := 'Member is a defaulter';
                                        MsaccoLoans."Date Posted" := CurrentDatetime;
                                        MsaccoLoans.Modify;
                                        ContinueMB := false;

        
                                end;
                            end;

                            if ContinueMB = true then begin

                                MCommission := 0;
                                MInterest := 0;
                                MComm := 0;
                                MInt := 0;
                                LoanProdCharge.Reset;
                                LoanProdCharge.SetRange("Charge Code", 'L05');
                                LoanProdCharge.SetRange("Product Code", '126');
                                if LoanProdCharge.Find('-') then begin
                                    MComm := LoanProdCharge.Percentage;
                                end else begin
                                    MComm := 5;
                                end;

                                LoanProdCharge.Reset;
                                LoanProdCharge.SetRange("Charge Code", 'L06');
                                LoanProdCharge.SetRange("Product Code", '126');
                                if LoanProdCharge.Find('-') then begin
                                    MInt := LoanProdCharge."Charge Amount";
                                    LoanProcessingGL := LoanProdCharge."Charges G_L Account";
                                end else begin
                                    MInt := 100;
                                end;

                                LoanProdCharge.Reset;
                                LoanProdCharge.SetRange("Charge Code", 'L07');
                                LoanProdCharge.SetRange("Product Code", '126');
                                if LoanProdCharge.Find('-') then begin
                                    vendorMboostaCommission := LoanProdCharge.Percentage;
                                    vendorMboostaCommissionGL := LoanProdCharge."Charges G_L Account";
                                end else begin
                                    MInt := 100;
                                end;
                                ////---- POST LOAN ---////

                                if ProdFac.Get('126') then begin

                                    Loans.Reset;
                                    Loans.SetRange(Loans."Loan No.", 'MB_' + Format(MsaccoLoans."Entry no"));
                                    if Loans.Find('-') then begin
                                    end
                                    else begin


                                        if ProdFac.Get(ProdFac."Product ID") then
                                            if CreditAccounts.Get(ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix") then
                                                LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix"
                                            else begin
                                                LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                                if saccoAccount.Get(saccoAccount."No.") then begin

                                                    CreditAccounts.Init;
                                                    CreditAccounts."No." := LAccount;
                                                    CreditAccounts."Date of Birth" := saccoAccount."Date of Birth";
                                                    CreditAccounts.Name := saccoAccount.Name;
                                                    CreditAccounts."ID No." := saccoAccount."ID No.";
                                                    CreditAccounts."Mobile Phone No" := saccoAccount."Mobile Phone No";
                                                    CreditAccounts."Member No." := saccoAccount."Member No.";
                                                    CreditAccounts."Passport No." := saccoAccount."Passport No.";
                                                    CreditAccounts."Employer Code" := saccoAccount."Employer Code";
                                                    CreditAccounts.Status := Accounts.Status::New;
                                                    CreditAccounts."Account Category" := saccoAccount."Account Category";
                                                    CreditAccounts."Current Address" := saccoAccount."Current Address";
                                                    CreditAccounts.City := saccoAccount.City;
                                                    CreditAccounts."Phone No." := saccoAccount."Phone No.";
                                                    CreditAccounts."Post Code" := saccoAccount."Post Code";
                                                    CreditAccounts.County := saccoAccount.County;
                                                    CreditAccounts."E-Mail" := saccoAccount."E-Mail";
                                                    CreditAccounts."Product Type" := ProdFac."Product ID";
                                                    CreditAccounts."Product Name" := ProdFac."Product Description";
                                                    CreditAccounts."Customer Posting Group" := ProdFac."Product Posting Group";
                                                    CreditAccounts.Insert(true);

                                                end;
                                            end;

                                        // create LOAN //

                                        Loans.Init;
                                        Loans."Loan No." := 'MB_' + Format(MsaccoLoans."Entry no");
                                        Loans."Application Date" := Today;
                                        Loans."Loan Product Type" := ProdFac."Product ID";
                                        Loans."Member No." := saccoAccount."Member No.";
                                        Loans."Member Name" := saccoAccount.Name;
                                        Loans."Loan Product Type Name" := ProdFac."Product Description";
                                        Loans."Requested Amount" := MsaccoLoans."Requested Amount";
                                        Loans."Approved Amount" := MsaccoLoans."Requested Amount";
                                        Loans.Status := Loans.Status::Approved;
                                        Loans.Source := Loans.Source::CREDIT;
                                        Loans."Staff No" := saccoAccount."Payroll/Staff No.";
                                        Loans."Employer Code" := saccoAccount."Employer Code";
                                        Loans.Interest := MComm;//ProdFac."Interest Rate (Max.)";
                                        Loans."Mode of Disbursement" := Loans."mode of disbursement"::"Full Disbursement";
                                        Loans."Global Dimension 1 Code" := '';
                                        Loans."Loan Account" := LAccount;
                                        Loans.Repayment := MsaccoLoans."Requested Amount";
                                        Loans.Interest := ProdFac."Interest Rate (Min.)";
                                        Loans."Loan Principle Repayment" := MsaccoLoans."Requested Amount";
                                        ;
                                        Loans."Recovery Mode" := Loans."recovery mode"::" ";
                                        Loans."Loan Interest Repayment" := ROUND((MsaccoLoans."Requested Amount" * (MComm / 100)), 1);
                                        Loans."Disbursement Date" := Today;
                                        Loans."Repayment Frequency" := ProdFac."Repayment Frequency";
                                        Loans."Repayment Start Date" := CalcDate('31D', Today);
                                        Loans."Sub Sector Level2" := MsaccoLoans."Loan Purpose";
                                        Loans.Validate("Sub Sector Level2");
                                        Loans.Posted := true;
                                        Loans.Insert();
                                    end;

                                    AcctNo := 'MB_' + Format(MsaccoLoans."Entry no");
                                end;

                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                GenJournalLine."Account No." := LAccount;
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Amount := (Loans."Approved Amount") * 1;// - Loans."Loan Interest Repayment") * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                                GenJournalLine."Loan No" := Loans."Loan No.";
                                GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No.";
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                // Cr Member FOSA Account - less Interest

                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := saccoAccount."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Amount := (Loans."Approved Amount") * -1;// - Loans."Loan Interest Repayment") * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No.";
                                ;
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;


                                // Dr Interest FOSA

                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := saccoAccount."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Amount := Loans."Loan Interest Repayment";// - Loans."Loan Interest Repayment") * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No." + ' Interest';
                                ;
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;


                                //Cr Interest G/L
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                                GenJournalLine."Account No." := LoanProcessingGL;
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                                GenJournalLine."Loan No" := Loans."Loan No.";
                                GenJournalLine.Amount := ((Loans."Loan Interest Repayment") * ((100 - vendorMboostaCommission) / 100)) * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No." + ' INTEREST';
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;




                                //Cr Vendor Share to G/L
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                                GenJournalLine."Account No." := Msaccoacc;
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No." + ' INTEREST';
                                GenJournalLine.Amount := ((Loans."Loan Interest Repayment") * ((vendorMboostaCommission) / 100) * -1);
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;



                                ProcessingFee := MInt;
                                ExciseDuty := ProcessingFee * (GetExciseDuty() / 100);
                                ExciseDutyGL := GetExciseDutyGL();


                                // Dr Member Loan Processing Fee

                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := saccoAccount."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Description := 'MBOOSTA Loan ' + Loans."Loan No." + ' Processing Fee';
                                GenJournalLine.Amount := ProcessingFee;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                GenJournalLine."Bal. Account No." := LoanProcessingGL;
                                GenJournalLine.Validate("Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                // Dr member Excise Duty
                                GenSetUp.Get;

                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'MSACCO';
                                GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                GenJournalLine."Account No." := saccoAccount."No.";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine."External Document No." := 'MSACCO LN';
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Description := 'MBOOSTA Loan ' + Loans."Loan No." + ' Excise Duty';
                                GenJournalLine.Amount := ExciseDuty;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                GenJournalLine."Bal. Account No." := GenSetUp."Excise Duty G/L";
                                GenJournalLine.Validate("Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;


                                //**Top up Mbooster
                                LoansOld.Reset;
                                LoansOld.SetRange("Member No.", saccoAccount."Member No.");
                                LoansOld.SetRange("Loan Product Type", ProdFac."Product ID");
                                LoansOld.SetFilter("Outstanding Balance", '>0');
                                if LoansOld.Find('-') then begin
                                    LoansOld.CalcFields("Outstanding Balance", "Outstanding Interest");
                                    TotalClearedAmount := LoansOld."Outstanding Balance" + LoansOld."Outstanding Interest";

                                    //CR Loan
                                    LineNo := LineNo + 10000;
                                    GenJournalLine.Init;
                                    GenJournalLine."Journal Template Name" := 'MSACCO';
                                    GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                    GenJournalLine."Line No." := LineNo;
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                    GenJournalLine."Account No." := CreditAccounts."No.";
                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                    GenJournalLine."Document No." := DocumentNo;
                                    GenJournalLine."External Document No." := 'MSACCO LN';
                                    GenJournalLine."Posting Date" := Today;
                                    GenJournalLine.Amount := LoansOld."Outstanding Interest" * -1;// - Loans."Loan Interest Repayment") * -1;
                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                    GenJournalLine."Loan No" := LoansOld."Loan No.";
                                    GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                                    GenJournalLine.Description := 'MBOOSTA LOAN TOP-UP' + Loans."Loan No.";
                                    GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                    GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                    if GenJournalLine.Amount <> 0 then
                                        GenJournalLine.Insert;

                                    //DR Saving Interest
                                    LineNo := LineNo + 10000;
                                    GenJournalLine.Init;
                                    GenJournalLine."Journal Template Name" := 'MSACCO';
                                    GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                    GenJournalLine."Line No." := LineNo;
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                    GenJournalLine."Account No." := saccoAccount."No.";
                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                    GenJournalLine."Document No." := DocumentNo;
                                    GenJournalLine."External Document No." := 'MSACCO LN';
                                    GenJournalLine."Posting Date" := Today;
                                    GenJournalLine.Amount := LoansOld."Outstanding Interest";// - Loans."Loan Interest Repayment") * -1;
                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                    GenJournalLine.Description := 'MBOOSTA LOAN Interest TOP-UP' + Loans."Loan No.";
                                    ;
                                    GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                    GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                    if GenJournalLine.Amount <> 0 then
                                        GenJournalLine.Insert;


                                    //DR Loan Repayment
                                    LineNo := LineNo + 10000;
                                    GenJournalLine.Init;
                                    GenJournalLine."Journal Template Name" := 'MSACCO';
                                    GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                    GenJournalLine."Line No." := LineNo;
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                    GenJournalLine."Account No." := CreditAccounts."No.";
                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                    GenJournalLine."Document No." := DocumentNo;
                                    GenJournalLine."External Document No." := 'MSACCO LN';
                                    GenJournalLine."Posting Date" := Today;
                                    GenJournalLine.Amount := LoansOld."Outstanding Balance" * -1;// - Loans."Loan Interest Repayment") * -1;
                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                    GenJournalLine."Loan No" := LoansOld."Loan No.";
                                    GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Repayment;
                                    GenJournalLine.Description := 'MBOOSTA LOAN TOP-UP' + Loans."Loan No.";
                                    ;
                                    GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                    GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                    if GenJournalLine.Amount <> 0 then
                                        GenJournalLine.Insert;

                                    //DR Saving Repayment
                                    LineNo := LineNo + 10000;
                                    GenJournalLine.Init;
                                    GenJournalLine."Journal Template Name" := 'MSACCO';
                                    GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                    GenJournalLine."Line No." := LineNo;
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                    GenJournalLine."Account No." := saccoAccount."No.";
                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                    GenJournalLine."Document No." := DocumentNo;
                                    GenJournalLine."External Document No." := 'MSACCO LN';
                                    GenJournalLine."Posting Date" := Today;
                                    GenJournalLine.Amount := LoansOld."Outstanding Balance";// - Loans."Loan Interest Repayment") * -1;
                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                    GenJournalLine.Description := 'MBOOSTA LOAN Repayment TOP-UP' + Loans."Loan No.";
                                    ;
                                    GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                    GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                    if GenJournalLine.Amount <> 0 then
                                        GenJournalLine.Insert;

                                end;

                                //Boost Commission Start
                                if TotalClearedAmount > 0 then
                                    BridgeLoanFunction(LineNo, 'MSACCO', 'MSACCOLN', DocumentNo, LoansOld."Outstanding Balance", Loans."Loan No.", saccoAccount."No.");
                                //Boost Commission End

                                // complete posting

                                POSTJOURNAL.CompletePosting('MSACCO', 'MSACCOLN');

                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your M-BOOSTA Loan of KES' +
                                Format(Loans."Approved Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                                Format(CalcDate('1M', Today), 0, '<Day>-<Month>-<Year>') + '.', '', saccoAccount."No.", false);

                                //Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Phone No.",'Dear member, to repay your M-Boosta Loan kindly deposit money to your FOSA A/C No '+
                                //saccoAccount."No." +' through paybill No 525200','',saccoAccount."No.",FALSE);

                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans."Approved Amount" := Loans."Approved Amount";
                                MsaccoLoans.Remarks := 'Successful';
                                MsaccoLoans.Modify;


                            end;
                        end else begin
                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            //MsaccoLoans."Approved Amount":= Loans."Approved Amount";
                            MsaccoLoans.Remarks := 'Product not set';
                            MsaccoLoans.Modify;
                        end;
                    end;
                end;
            until MsaccoLoans.Next = 0;
        end;

    end;


    procedure InstantLoanAlerts() Response: Integer
    var
        Days: Integer;
        Balance: Decimal;
    begin
        Response := 1;
        Loans.Reset;
        Loans.SetRange(Loans."Loan Product Type", '126');
        Loans.SetRange(Loans."Repayment Method Alert", false);
        Loans.SetRange(Loans.Posted, true);
        Loans.SetFilter(Loans."Disbursement Date", '>%1', CalcDate('-1M', Today));
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
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear member, to repay your M-Boosta Loan kindly deposit money to your FOSA A/C No ' +
                            saccoAccount."No." + ' through paybill No 525200', '', saccoAccount."No.", false);
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
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Kindly note your Mboosta loan balance of KES' + Format(Loans."Outstanding Balance")
                            + ' is due on ' + Format(CalcDate('30D', Loans."Disbursement Date"), 0, '<Day>-<Month>-<Year>') + '. Late payment'
                            + '  reduces your loan limit. Deposit funds into your FOSA A/C ' + saccoAccount."No." + ' through Paybill no:525200 to pay and borrow again.'
                            , '', saccoAccount."No.", false);
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
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear member, your M-Boosta loan of Kes ' + Format(Loans."Outstanding Balance")
                        + ' is overdue, you risk being penalized and listed on CRB. Urgently repay and borrow again', '', saccoAccount."No.", false);
                            Response := 0;
                            Loans."Non Performance Alert" := true;
                            Loans.Modify;
                        end;
                    end;
                end;
            until Loans.Next = 0;
        end;
    end;


    procedure ClearOldTransactions()
    begin
        ATMTrans.Reset;
        ATMTrans.SetRange(ATMTrans.Posted, false);
        ATMTrans.SetRange(ATMTrans."Unit ID", 'M-PESA');
        if ATMTrans.Find('-') then begin
            repeat
                MPESATRANS.Reset;
                MPESATRANS.SetRange(MPESATRANS."Account No.", ATMTrans."Account No");
                MPESATRANS.SetRange(MPESATRANS.Amount, ATMTrans.Amount);
                MPESATRANS.SetFilter(MPESATRANS."Transaction Date", '<=%1', CalcDate('-1D', ATMTrans."Transaction Date"));
                if MPESATRANS.Find('-') then begin
                    repeat
                        if (MPESATRANS.Posted = true) then begin
                            ATMTrans.Posted := true;
                            ATMTrans."Posting Date" := Today;
                            ATMTrans.Modify;
                        end;
                    until MPESATRANS.Next = 0
                end else begin
                    ATMTrans.Posted := true;
                    ATMTrans."Posting Date" := Today;
                    ATMTrans.Modify;
                end;
            until ATMTrans.Next = 0
        end;

        MPESATRANS.Reset;
        MPESATRANS.SetRange(MPESATRANS.Posted, false);
        if MPESATRANS.Find('-') then begin
            repeat
                ATMTrans.Reset;
                ATMTrans.SetRange(ATMTrans."Unit ID", 'M-PESA');
                ATMTrans.SetRange(ATMTrans."Account No", MPESATRANS."Account No.");
                ATMTrans.SetRange(ATMTrans.Amount, MPESATRANS.Amount);
                ATMTrans.SetRange(ATMTrans."Transaction Date", MPESATRANS."Transaction Date");
                if ATMTrans.Find('-') then begin
                    repeat
                        ATMTrans.Posted := false;
                        ATMTrans.Modify;
                    until ATMTrans.Next = 0
                end;
            until MPESATRANS.Next = 0
        end;
    end;


    procedure PostAllDeposits(DocNo: Code[30]; Desc: Text) Response: Integer
    begin
        Response := 1;
        MPESATRANS1.Reset;
        MPESATRANS1.SetRange(MPESATRANS1.Posted, false);
        MPESATRANS1.SetRange(MPESATRANS1."Transaction Type", 'Deposit');
        MPESATRANS1.SetRange(MPESATRANS1.Description, Desc);
        MPESATRANS1.SetRange(MPESATRANS1."Document No.", DocNo);
        if MPESATRANS1.FindFirst() then begin
            //REPEAT

            Response := InsertToJournalMDeposits(MPESATRANS1."Document No.", MPESATRANS1."Transaction Type", MPESATRANS1.Description
                    , MPESATRANS1."Transaction Date", MPESATRANS1."Account No.", MPESATRANS1.Amount, MPESATRANS1."Key Word");
            // UNTIL MPESATRANS1.NEXT =0;
        end;
    end;


    procedure PostAllWithdrawals(DocNo: Code[30]; Desc: Text) Response: Integer
    begin
        MPESATRANS1.Reset;
        MPESATRANS1.SetRange(MPESATRANS1.Posted, false);
        MPESATRANS1.SetRange(MPESATRANS1."Transaction Type", 'Withdrawal');
        MPESATRANS1.SetRange(MPESATRANS1.Description, Desc);
        MPESATRANS1.SetRange(MPESATRANS1."Document No.", DocNo);
        if MPESATRANS1.FindFirst() then begin
            //MESSAGE('found');
            //REPEAT
            Response := InsertToJournalMWithdrawals(MPESATRANS1."Document No."
                        , MPESATRANS1."Transaction Type"
                        , MPESATRANS1.Description
                        , MPESATRANS1."Transaction Date"
                        , MPESATRANS1."Account No."
                        , MPESATRANS1.Amount
                        , MPESATRANS1."Key Word");
            //UNTIL MPESATRANS1.NEXT =0;
        end
        else begin
            //MESSAGE(' not found')
        end;
    end;


    procedure UpdateWithdrawals(DocNo: Code[30]; Desc: Text) Response: Integer
    begin
        Response := 1;
        MPESATRANS1.Reset;
        MPESATRANS1.SetRange(MPESATRANS1.Posted, false);
        MPESATRANS1.SetRange(MPESATRANS1."Transaction Type", 'Withdrawal');
        MPESATRANS1.SetRange(MPESATRANS1.Description, Desc);
        MPESATRANS1.SetRange(MPESATRANS1."Document No.", DocNo);
        if MPESATRANS1.FindFirst() then begin
            ATMTrans.Reset;
            ATMTrans.SetRange(ATMTrans."Unit ID", 'M-PESA');
            ATMTrans.SetRange(ATMTrans."Account No", MPESATRANS1."Account No.");
            ATMTrans.SetRange(ATMTrans.Amount, MPESATRANS1.Amount);
            ATMTrans.SetRange(ATMTrans.Posted, false);
            if ATMTrans.Find('-') then begin
                repeat
                    ATMTrans.Posted := true;
                    ATMTrans.Modify();
                until ATMTrans.Next = 0
            end;
            MPESATRANS1.Posted := true;
            MPESATRANS1.Modify();
            Response := 0;
        end
        else begin
            //MESSAGE(' not found')
        end;
    end;


    procedure UpdateDeposits(DocNo: Code[30]; Desc: Text) Response: Integer
    begin
        Response := 1;
        MPESATRANS1.Reset;
        MPESATRANS1.SetRange(MPESATRANS1.Posted, false);
        MPESATRANS1.SetRange(MPESATRANS1."Transaction Type", 'Deposit');
        MPESATRANS1.SetRange(MPESATRANS1.Description, Desc);
        MPESATRANS1.SetRange(MPESATRANS1."Document No.", DocNo);
        if MPESATRANS1.FindFirst() then begin
            MPESATRANS1.Posted := true;
            MPESATRANS1.Modify();
            Response := 0;
        end;
    end;


    procedure UpdateRepayments(DocNo: Code[30]; Desc: Text) Response: Integer
    begin
        Response := 1;
        MPESATRANS1.Reset;
        MPESATRANS1.SetRange(MPESATRANS1.Posted, false);
        MPESATRANS1.SetRange(MPESATRANS1."Transaction Type", 'Loan Repayment');
        MPESATRANS1.SetRange(MPESATRANS1.Description, Desc);
        MPESATRANS1.SetRange(MPESATRANS1."Document No.", DocNo);
        if MPESATRANS1.FindFirst() then begin
            MPESATRANS1.Posted := true;
            MPESATRANS1.Modify();
            Response := 0;
        end;
    end;


    procedure GetPendingTransactions() Response: Text[1024]
    var
        "Count": Integer;
    begin
        Count := 0;
        ATMTrans.Reset;
        ATMTrans.SetRange(ATMTrans."Unit ID", 'M-PESA');
        ATMTrans.SetRange(ATMTrans.Posted, false);
        ATMTrans.Ascending(true);
        if ATMTrans.Find('-') then begin
            repeat
                if Count < 100 then begin
                    Response := Response + Format(ATMTrans."Trace ID") + '|';
                    Count := Count + 1;
                end
            until ATMTrans.Next = 0;
        end;
        //MESSAGE(Response);
    end;


    procedure MBoostaPenalty() Response: Integer
    var
        Days: Integer;
        Balance: Decimal;
        Penalty: Decimal;
    begin
        Response := 1;
        Loans.Reset;
        Loans.SetRange(Loans."Loan Product Type", '126');
        //Loans.SETRANGE(Loans."Loan No.",'MB_11438');
        Loans.SetRange(Loans."Penalty Charge", false);
        Loans.SetRange(Loans.Posted, true);
        Loans.SetFilter(Loans."Penalty Frequency", '<%1', 1);
        Loans.SetFilter(Loans."Disbursement Date", '<%1', CalcDate('-35D', Today));
        if Loans.Find('-') then begin
            repeat
                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                Days := 0;
                Days := Today - Loans."Disbursement Date";
                if ((Days > 35) and (Loans."Penalty Frequency" = 0) and (Loans."Outstanding Balance" > 0)) then begin

                    ProdFac.Reset;
                    ProdFac.SetRange(ProdFac."Product ID", '126');
                    if ProdFac.Find('-') then begin
                        saccoAccount.Reset;
                        saccoAccount.SetRange(saccoAccount."Member No.", Loans."Member No.");
                        saccoAccount.SetRange(saccoAccount."Product Type", '505');
                        if saccoAccount.Find('-') then begin

                            Balance := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                            Penalty := Balance * 0.05;

                            //start posting

                            GenJournalLine.Reset;
                            GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                            GenJournalLine.SetRange("Journal Batch Name", 'MSACCOLN');
                            GenJournalLine.DeleteAll;

                            DocumentNo := Loans."Loan No.";

                            // Dr LOAN Account

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                            GenJournalLine."Account No." := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN PENALTY';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Due";
                            GenJournalLine."Loan No" := Loans."Loan No.";
                            GenJournalLine.Amount := Penalty;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            // Cr Member FOSA Account - less Interest

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                            GenJournalLine."Account No." := ProdFac."Penalty Paid Account";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine."Loan No" := Loans."Loan No.";
                            GenJournalLine.Amount := -Penalty;// - Loans."Loan Interest Repayment") * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := 'MBOOSTA LOAN ' + Loans."Loan No.";
                            ;
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            POSTJOURNAL.CompletePosting('MSACCO', 'MSACCOLN');

                            //Loans.Interest:=Penalty;
                            Loans."Penalty Charge" := true;
                            Loans."Penalty Frequency" := 1;
                            Loans.Modify;
                            Response := 0;

                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear member, you have been charged a penalty of Kes '
                            + Format(ROUND(Penalty, 0.01, '>')) + ' on your defaulted MBoosta Loan no. ' + Loans."Loan No." + '.', '', saccoAccount."No.", false);

                        end;
                    end;
                end;

            /*
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
            */
            until Loans.Next = 0;
        end;

    end;


    procedure MBoostaRecovery() Response: Integer
    var
        InterestRepaymentAmount: Decimal;
        CreditAccountNo: Code[30];
        Loanno: Text[30];
        Amount: Decimal;
        AccountNo: Text[30];
        Documentno: Text[30];
        AvailableBal: Decimal;
        InterestToBeRecovered: Decimal;
        AmountToBeRecovered: Decimal;
        OutstandingInt: Decimal;
        OutstandingBal: Decimal;
        journalpost: Integer;
    begin
        Response := 1;
        Continue := true;

        Loans.Reset;
        Loans.SetRange(Loans."Loan Product Type", '126');
        //Loans.SETRANGE(Loans."Loan No.",'MB_17496');
        //Loans.SETFILTER(Loans."Loans Category-SASRA",'<>%1',Loans."Loans Category-SASRA"::Perfoming);
        Loans.SetRange(Loans.Posted, true);
        Loans.SetFilter(Loans."Disbursement Date", '<%1', CalcDate('-1M', Today));
        if Loans.Find('-') then begin
            repeat
                journalpost := 0;
                LineNo := 0;
                RunBal := 0;
                AvailableBal := 0;
                AmountToBeRecovered := 0;
                InterestToBeRecovered := 0;
                OutstandingBal := 0;
                OutstandingInt := 0;
                AccBalance := 0;
                //MESSAGE('YEI');
                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Bills", Loans."Outstanding Interest");

                if ((Loans."Outstanding Balance" > 0) or (Loans."Outstanding Interest" > 0)) then begin
                    //MESSAGE('1');
                    OutstandingBal := Loans."Outstanding Balance";
                    OutstandingInt := Loans."Outstanding Interest";
                    //RunBal:=Amount;


                    saccoAccount.Reset;
                    saccoAccount.SetRange(saccoAccount."Member No.", Loans."Member No.");
                    saccoAccount.SetRange(saccoAccount."Product Type", '505');
                    saccoAccount.SetRange(saccoAccount.Blocked, saccoAccount.Blocked::" ");
                    if saccoAccount.Find('-') then begin
                        AccBalance := GetAccountBalance(saccoAccount."No.");
                        //MESSAGE(FORMAT(AccBalance));
                    end;
                    POSTJOURNAL.ClearJournalLines('MSACCO', 'MSACCOLN');

                    //MESSAGE('Account Balance '+ FORMAT(AccBalance));

                    if AccBalance > 0 then begin
                        if ProdFac.Get(Loans."Loan Product Type") then begin
                            //MESSAGE('2');
                            if CreditAccounts.Get(ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix") then begin
                                CreditAccountNo := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                            end;
                        end;
                        if OutstandingInt > 0 then begin
                            if AccBalance >= OutstandingInt then begin
                                InterestToBeRecovered := OutstandingInt;
                            end else begin
                                InterestToBeRecovered := AccBalance;
                            end;

                            if InterestToBeRecovered <> 0 then begin
                                //MESSAGE('3');
                                // Cr Member Loan Account - Principal Loan Repayment
                                LineNo := LineNo + 10000;
                                POSTJOURNAL.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Credit, Loans."Loan No.", 'MSacco Loan Interest Recovery', -InterestToBeRecovered
                                , Loans."Loan Account", Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::"Interest Paid", Loans."Loan No.", '', '', 0, '', 0);
                                //Loanno

                                // Dr Member Loan Repayment Amount
                                LineNo := LineNo + 10000;
                                POSTJOURNAL.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Savings, Loans."Loan No.", 'MSacco Loan Interest Recovery', InterestToBeRecovered
                                , saccoAccount."No.", Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);
                                journalpost := 1;
                            end;
                            //RunBal:=RunBal+GenJournalLine.Amount;

                        end;

                        if ((AccBalance - OutstandingInt) > 0) then begin
                            //MESSAGE('4');
                            if ((AccBalance - OutstandingInt) >= OutstandingBal) then begin
                                //MESSAGE(FORMAT(AmountToBeRecovered));
                                AmountToBeRecovered := OutstandingBal;
                                //MESSAGE(FORMAT(OutstandingBal));
                            end else begin
                                AmountToBeRecovered := AccBalance - OutstandingInt;
                            end;

                            if AmountToBeRecovered <> 0 then begin
                                //MESSAGE('5');
                                // Cr Member Loan Account - Principal Loan Repayment
                                LineNo := LineNo + 10000;
                                POSTJOURNAL.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Credit, Loans."Loan No.", 'MSacco Loan Recovery', -AmountToBeRecovered
                                , Loans."Loan Account", Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::Repayment, Loans."Loan No.", '', '', 0, '', 0);
                                //Loanno

                                // Dr Member Loan Repayment Amount
                                LineNo := LineNo + 10000;
                                POSTJOURNAL.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Savings, Loans."Loan No.", 'MSacco Loan Recovery', AmountToBeRecovered
                                , saccoAccount."No.", Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);
                                journalpost := 1;
                            end;
                            // Complete Journal Posting
                            if journalpost = 1 then begin
                                //MESSAGE('6');
                                POSTJOURNAL.LinesCompletePosting('MSACCO', 'MSACCOLN');

                                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");

                                if InterestToBeRecovered > 0 then begin
                                    Sendsms.SendSms(Optionsms::MSACCO
                                , saccoAccount."Transactional Mobile No"
                                , 'Dear Member, A Penalty of Kes.' + Format(InterestToBeRecovered) + ' has been recovered from your FOSA account to repay your Mboosta penalty for loan no. ' + Loans."Loan No." + '. Penalty bal is ' + Format(Loans."Outstanding Interest")
                                , Documentno, saccoAccount."No.", false);
                                end;

                                if AmountToBeRecovered > 0 then begin
                                    Sendsms.SendSms(Optionsms::MSACCO
                                    , saccoAccount."Transactional Mobile No"
                                    , 'Dear Member, An amount of Kes.' + Format(AmountToBeRecovered) + ' has been recovered from your FOSA account to repay your Mboosta loan no. ' + Loans."Loan No." + ', bal is ' + Format(Loans."Outstanding Balance")
                                    , Documentno, saccoAccount."No.", false);
                                end;
                            end;
                        end;
                    end;
                end;
            until Loans.Next = 0;
        end;
    end;


    procedure GetSalaryInAdvance(TelephoneNo: Text[30]; NoOfMonths: Integer) QualifiedAmountFinal: Text[100]
    var
        QualifiedAmount: Text;
        LoanProductType: Text[10];
        LoanProductTypeName: Text;
        Members: Record 52185700;
    begin
        Continue := true;
        TelephoneNo := '+' + TelephoneNo;

        SaccoAccMemberNo := '';
        QualifiedAmountFinal := '0';

        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."Transactional Mobile No", TelephoneNo);
        saccoAccount.SetFilter(saccoAccount.Status, '%1|%2', saccoAccount.Status::Active, saccoAccount.Status::New);
        if saccoAccount.Find('-') then begin

            // LOAN product //
            if ProdFac.Get('123') then begin

                SaccoAccMemberNo := saccoAccount."No.";
                Message(saccoAccount."No.");
                Salary1 := 0;
                Salary2 := 0;
                Salary3 := 0;
                i := 1;
                if saccoAccount."Employer Code" = '05' then begin //KDF MEMBERS

                    SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                    //SalBuffer.SETRANGE(SalBuffer."Account No.",SaccoAccMemberNo);
                    SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                    SalBuffer.SetRange(SalBuffer.Posted, true);
                    SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-2M', CalcDate('<-CM>', Today)), CalcDate('<-CM>', Today));
                    if (SalBuffer.Count() >= 2) then begin

                        //Month One
                        SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                        SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                        SalBuffer.SetRange(SalBuffer.Posted, true);
                        SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-1M', CalcDate('<-CM>', Today)), CalcDate('<-CM>', Today));
                        if SalBuffer.CalcSums(SalBuffer.Amount) then
                            Salary1 := SalBuffer.Amount;
                        //Month Two
                        SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                        SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                        SalBuffer.SetRange(SalBuffer.Posted, true);
                        SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-2M', CalcDate('<-CM>', Today)), CalcDate('-1M', CalcDate('<-CM>', Today)));
                        if SalBuffer.CalcSums(SalBuffer.Amount) then
                            Salary2 := SalBuffer.Amount;
                        /*
                  //Month Three
                        SalBuffer.SETCURRENTKEY(SalBuffer."Member No.",SalBuffer."Posting Date");
                        SalBuffer.SETRANGE(SalBuffer."Member No.",saccoAccount."Member No.");
                        SalBuffer.SETRANGE(SalBuffer.Posted,TRUE);
                        SalBuffer.SETFILTER(SalBuffer."Posting Date",'%1..%2',CALCDATE('-3M',CALCDATE('<-CM>',TODAY)),CALCDATE('-2M',CALCDATE('<-CM>',TODAY)));
                        IF SalBuffer.CALCSUMS(SalBuffer.Amount) THEN
                          Salary3:=SalBuffer.Amount;
                          */
                    end else begin
                        Continue := false;
                    end;

                end else begin
                    SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                    //SalBuffer.SETRANGE(SalBuffer."Account No.",SaccoAccMemberNo);
                    SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                    SalBuffer.SetRange(SalBuffer.Posted, true);
                    SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-2M', CalcDate('<-CM>', Today)), CalcDate('<-CM>', Today));
                    if (SalBuffer.Count() >= 2) then begin
                        Message(Format(SalBuffer.Count) + ' Salaries found');
                        if SalBuffer.Find('-') then begin
                            repeat
                                if i = 1 then
                                    Salary1 := SalBuffer.Amount;

                                if i = 2 then
                                    Salary2 := SalBuffer.Amount;
                                /*
                              IF i = 3 THEN
                                Salary3 := SalBuffer.Amount;;
                                */
                                i := i + 1;
                            until SalBuffer.Next = 0;
                        end
                    end else begin
                        Continue := false;
                    end;
                end;
                Message(Format(Salary1) + '|' + Format(Salary2)); //+'|'+FORMAT(Salary3));

                if Salary1 < Salary2 then begin
                    Minimum := Salary1;
                end else begin
                    Minimum := Salary2;
                end;

                /*
                                    IF Minimum<Salary3 THEN BEGIN
                                    Minimum:=Minimum;
                                    END ELSE BEGIN
                                    Minimum:=Salary3;
                                    END;
                                    */
                Message(Format(Minimum));
                QualifyingAfterDed := Minimum * 0.8;
                Message(Format(QualifyingAfterDed));

                if Continue = false then begin

                    // salary not processed

                    Continue := false;
                    QualifiedAmountFinal := '-1|0|0|Salary not processed three times through FOSA';
                    exit;
                end;
                if Members.Get(saccoAccount."Member No.") then begin
                    if Members.Status <> Members.Status::Active then begin
                        QualifiedAmountFinal := '-1|0|0|Inactive Account';
                        exit;
                    end;

                    if (Members."Employer Code" = '9901') or (Members."Employer Code" = '9902') then begin
                        QualifiedAmountFinal := '-1|0|0|You do not qualify for this product';
                        Continue := false;
                        exit;
                    end;

                end;


                SaccoAccount1.Reset;
                SaccoAccount1.SetRange("Member No.", saccoAccount."Member No.");
                SaccoAccount1.SetRange("Mobile Loan Blocked", true);
                if SaccoAccount1.Find('-') then begin
                    Continue := false;
                    QualifiedAmountFinal := '-1|0|0|You are not blocked from accessing this product';
                    exit;
                end;
                if Continue = true then begin

                    // Check if defaulter //

                    DefaultedAmount := 0;

                    Loans.Reset;
                    Loans.SetRange(Loans.Status, Loans.Status::Approved);
                    Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                    Loans.SetFilter(Loans."Loans Category-SASRA", '<>%1&<>%2', Loans."loans category-sasra"::Perfoming, Loans."loans category-sasra"::Watch);
                    if Loans.Find('-') then begin
                        Continue := false;
                        QualifiedAmountFinal := '-1|0|0|You have a defaulted loan';

                    end;
                end;

                if Continue = true then begin

                    // check if member has existing Salary Advance & M-Boosta Loan

                    Loans.Reset;
                    Loans.SetRange(Loans.Status, Loans.Status::Approved);
                    Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                    Loans.SetFilter(Loans."Loan Product Type", '%1|%2|%3|%4', '126', '119', '121', '120');
                    if Loans.Find('-') then begin
                        repeat

                            Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                            if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > 0 then begin
                                if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > Loans.Repayment then begin
                                    OutstandingAmount += Loans.Repayment;
                                    LoanProductTypeName := Loans."Loan Product Type Name";
                                end
                                else begin
                                    OutstandingAmount += (Loans."Outstanding Balance" + Loans."Outstanding Interest");
                                    LoanProductTypeName := Loans."Loan Product Type Name";
                                end;
                                //MESSAGE( Loans."Loan Product Type" + ' ' +FORMAT(OutstandingAmount));
                            end;

                        until Loans.Next = 0
                    end;

                    if OutstandingAmount > 0 then begin
                        // Outstanding Salary in Advance Loan
                        QualifyingAfterDed := QualifyingAfterDed - OutstandingAmount;
                        if QualifyingAfterDed > 500 then begin
                            Continue := true;
                        end else begin
                            Continue := false;
                            QualifiedAmountFinal := '-1|0|0|Existing loan repayments exceed what you qualify for';
                        end;


                    end;
                end;

                if Continue = true then begin

                    // check if member has existing Salary In Advance Loan

                    Loans.Reset;
                    Loans.SetRange(Loans.Status, Loans.Status::Approved);
                    Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                    Loans.SetRange(Loans."Loan Product Type", '123');
                    if Loans.Find('-') then begin
                        repeat

                            Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");

                            if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > 0 then begin
                                OutstandingAmount := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                                LoanProductTypeName := Loans."Loan Product Type Name";
                                //MESSAGE(Loans."Loan Product Type Name");
                            end;
                        until Loans.Next = 0
                    end;

                    if OutstandingAmount > 0 then begin
                        // Outstanding Salary in Advance Loan
                        if (QualifyingAfterDed) > 1000 then begin
                            Continue := true;
                            QualifiedAmountFinal := '1|' + Format(ROUND(QualifyingAfterDed, 1000, '=')) + '|' + Format(OutstandingAmount) + '|0'
                        end else begin
                            Continue := false;
                            QualifiedAmountFinal := '-1|0|0|Outstanding ' + LoanProductTypeName;
                        end;
                    end;
                end;

                if Continue = true then begin

                    QualifiedAmountFinal := '1|' + Format(ROUND(QualifyingAfterDed, 1000, '=')) + '|0|0'
                end;
            end else begin
                QualifiedAmountFinal := '-1|0|0|Product not found';
            end;
        end else begin
            QualifiedAmountFinal := '-1|0|0|Member status should be active and not blocked';
        end;

    end;


    procedure PostSalaryAdvanceLoan()
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
    begin
        MsaccoChargesSetup.Reset;
        MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
        if MsaccoChargesSetup.Find('-') then begin
            MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
            Msaccocharge := MsaccoChargesSetup.ChargeAmount;
            Msaccoacc := MsaccoChargesSetup."Vendor No";
        end;
        LoanProcessingGL := '301028';
        MsaccoLoans.Reset;
        MsaccoLoans.SetRange(MsaccoLoans.Status, MsaccoLoans.Status::Pending);
        MsaccoLoans.SetRange(MsaccoLoans."Loan Product Type", MsaccoLoans."loan product type"::"Salary In Advance");
        //MsaccoLoans.SETRANGE(MsaccoLoans."Account No",'5050195843000');
        MsaccoLoans.SetRange(MsaccoLoans.Posted, false);
        if MsaccoLoans.Find('-') then begin
            repeat
                ContinueMB := true;
                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."No.", MsaccoLoans."Account No");
                if saccoAccount.Find('-') then begin
                    //CHECK SALARY
                    SaccoMemberNo := saccoAccount."Member No.";
                    // MBOOSTA LOAN //
                    if ProdFac.Get('123') then begin
                        SaccoAccMemberNo := MsaccoLoans."Account No";
                        //5050123278000
                        //Minimum:=GetLoanQualifiedAmount(MsaccoLoans."Account No",'123');
                        //Minimum:=GetSalaryInAdvance(MsaccoLoans.
                        if MsaccoLoans.Amount > Minimum then
                            ContinueMB := true;

                    end;

                    // SALARY //

                    if ContinueMB = false then begin

                        // salary not processed
                        Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name +
                        ', your Salary In Advance Loan request has been rejected. Reason: You do not qualify for this product.', '',
                        saccoAccount."No.", false);
                        MsaccoLoans.Posted := true;
                        MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                        MsaccoLoans.Remarks := 'Does not qualify for this product';
                        MsaccoLoans."Date Posted" := CurrentDatetime;
                        MsaccoLoans.Modify;
                        ContinueMB := false;
                    end;

                    if ContinueMB = true then begin
                        //Prevent Double Posting
                        Venderdetails.Reset;
                        Venderdetails.SetRange(Venderdetails."Document No.", MsaccoLoans.DocumentNo);
                        Venderdetails.SetRange("Customer No.", MsaccoLoans."Account No");
                        Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
                        if Venderdetails.Find('-') then begin
                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                            MsaccoLoans.Remarks := 'Successful';
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans.Modify;
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your Salary In Advance Loan of KES' +
                                  Format(Loans."Approved Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                                  Format(CalcDate('1M', Today), 0, '<Day>-<Month>-<Year>') + '.', '', saccoAccount."No.", false);
                            ContinueMB := false;
                        end;
                    end;


                    if ContinueMB = true then begin
                        // check if member has existing Salary In Advance Loan
                        Loans.Reset;
                        Loans.SetRange(Loans.Status, Loans.Status::Approved);
                        Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                        Loans.SetRange(Loans."Loan Product Type", ProdFac."Product ID");
                        if Loans.Find('-') then begin
                            repeat
                                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                                OutstandingAmount := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                                if OutstandingAmount > 0 then begin
                                    // Outstanding Salary In Advance Loan
                                    Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name
                                    + ', your Salary In Advance Loan request has been rejected. Reason: Outstanding Salary In Advance loan. Kindly repay first.', ''
                                    , saccoAccount."No.", false);
                                    MsaccoLoans.Posted := true;
                                    MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                    MsaccoLoans.Remarks := 'Outstanding  Salary In Advance Loan';
                                    MsaccoLoans."Date Posted" := CurrentDatetime;
                                    MsaccoLoans.Modify;
                                    ContinueMB := false;
                                end;
                            until Loans.Next = 0
                        end;
                    end;

                    if ContinueMB = true then begin
                        // check if member has an overdraft

                        if saccoAccount.Balance < -500 then begin
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your Salary In Advance Loan request has been rejected. Reason: Account is overdrawn with KES ' +
                           Format(saccoAccount.Balance * -1) + '. Normalize your account.', ''
                            , saccoAccount."No.", false);
                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                            MsaccoLoans.Remarks := 'Member has overdrawn';
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans.Modify;
                            ContinueMB := false;
                        end;
                    end;

                    /*IF ContinueMB = TRUE THEN BEGIN
                    // Member status
                    Members.RESET;
                     Members.SETRANGE("No.",saccoAccount."Member No.");
                     IF Members.FIND('-') THEN BEGIN
                       IF (Members.Status<>Members.Status::Active) THEN BEGIN
                          Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Transactional Mobile No",'Dear '+ saccoAccount.Name + ', your Salary In Advance Loan request has been rejected. Reason: Member is not Active ',''
                           ,saccoAccount."No.",FALSE);
                           MsaccoLoans.Posted:=TRUE;
                           MsaccoLoans.Status:=MsaccoLoans.Status::Failed;
                           MsaccoLoans.Remarks:='Member status is not active';
                           MsaccoLoans."Date Posted":=CURRENTDATETIME;
                           MsaccoLoans.MODIFY ;
                          ContinueMB:=FALSE;
                        END;
                      END;
                      END;
     */
                    if ContinueMB = true then begin
                        // check if amount is less than minimum

                        if MsaccoLoans.Amount < ProdFac."Minimum Loan Amount" then begin
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your Salary In Advance Loan request has been rejected. Reason: Minimum loan amount is KES ' +
                            Format(ProdFac."Minimum Loan Amount") + '.', ''
                            , saccoAccount."No.", false);
                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                            MsaccoLoans.Remarks := 'Less than minimum loan amount';
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans.Modify;
                            ContinueMB := false;
                        end;
                    end;


                    if ContinueMB = true then begin
                        // check if amount is more than maximum

                        if MsaccoLoans.Amount > ProdFac."Maximum Loan Amount" then begin
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name +
                            ', your Salary In Advance Loan request has been rejected. Reason: Maximum loan amount is KES ' + Format(ProdFac."Maximum Loan Amount") + '.', ''
                            , saccoAccount."No.", false);
                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                            MsaccoLoans.Remarks := 'More than maximum loan amount';
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans.Modify;
                            ContinueMB := false;
                        end;
                    end;

                    if ContinueMB = true then begin

                        // Check if defaulter //

                        DefaultedAmount := 0;

                        Loans.Reset;
                        Loans.SetRange(Loans.Status, Loans.Status::Approved);
                        Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                        if Loans.Find('-') then begin
                            repeat
                                Loans.CalcFields(Loans."Outstanding Bills");
                                if Loans."Outstanding Bills" > Loans.Repayment then begin
                                    DefaultedAmount := DefaultedAmount + Loans."Outstanding Bills";
                                end
                            until Loans.Next = 0;
                        end;
                        if DefaultedAmount > 0 then begin

                        end;
                    end;

                    if ContinueMB = true then begin

                        MCommission := 0;
                        MInterest := 0;
                        MComm := 0;
                        MInt := 0;
                        LoanProdCharge.Reset;
                        LoanProdCharge.SetRange("Charge Code", 'L01');
                        LoanProdCharge.SetRange("Product Code", '123');
                        if LoanProdCharge.Find('-') then begin
                            MComm := LoanProdCharge.Percentage;
                            if LoanProdCharge."Effect Excise Duty" = LoanProdCharge."effect excise duty"::No then
                                ExciseDuty := 0
                            else
                                ExciseDuty := MCommission * (GetExciseDuty() / 100);
                        end else begin
                            MComm := 10;
                        end;
                        MCommission := (MsaccoLoans.Amount * (MComm / 100));
                        ////---- POST LOAN ---////

                        if ProdFac.Get('123') then begin
                            Loans.Reset;
                            Loans.SetRange(Loans."Loan No.", 'SI_' + Format(MsaccoLoans."Entry no"));
                            if Loans.Find('-') then begin
                                CreditAccounts.Reset;
                                CreditAccounts.SetRange(CreditAccounts."No.", ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix");
                                if CreditAccounts.FindFirst() then begin
                                    //IF CreditAccounts.GET(ProdFac."Account No. Prefix"+ saccoAccount."Member No." +ProdFac."Account No. Suffix") THEN BEGIN
                                    LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                    //MESSAGE(LAccount);
                                end else begin
                                    LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                    //MESSAGE(LAccount);
                                    if saccoAccount.Get(saccoAccount."No.") then begin

                                        CreditAccounts.Init;
                                        CreditAccounts."No." := LAccount;
                                        CreditAccounts."Date of Birth" := saccoAccount."Date of Birth";
                                        CreditAccounts.Name := saccoAccount.Name;
                                        CreditAccounts."ID No." := saccoAccount."ID No.";
                                        CreditAccounts."Mobile Phone No" := saccoAccount."Mobile Phone No";
                                        CreditAccounts."Member No." := saccoAccount."Member No.";
                                        CreditAccounts."Passport No." := saccoAccount."Passport No.";
                                        CreditAccounts."Employer Code" := saccoAccount."Employer Code";
                                        CreditAccounts.Status := Accounts.Status::New;
                                        CreditAccounts."Account Category" := saccoAccount."Account Category";
                                        CreditAccounts."Current Address" := saccoAccount."Current Address";
                                        CreditAccounts.City := saccoAccount.City;
                                        CreditAccounts."Phone No." := saccoAccount."Phone No.";
                                        CreditAccounts."Post Code" := saccoAccount."Post Code";
                                        CreditAccounts.County := saccoAccount.County;
                                        CreditAccounts."E-Mail" := saccoAccount."E-Mail";
                                        CreditAccounts."Product Type" := ProdFac."Product ID";
                                        CreditAccounts."Product Name" := ProdFac."Product Description";
                                        CreditAccounts."Customer Posting Group" := ProdFac."Product Posting Group";
                                        CreditAccounts.Insert(true);

                                    end;
                                end;
                            end else begin
                                CreditAccounts.Reset;
                                CreditAccounts.SetRange(CreditAccounts."No.", ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix");
                                if CreditAccounts.FindFirst() then begin
                                    //IF CreditAccounts.GET(ProdFac."Account No. Prefix"+ saccoAccount."Member No." +ProdFac."Account No. Suffix") THEN BEGIN
                                    LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                    //MESSAGE(LAccount);
                                end else begin
                                    LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                    //MESSAGE(LAccount);
                                    if saccoAccount.Get(saccoAccount."No.") then begin

                                        CreditAccounts.Init;
                                        CreditAccounts."No." := LAccount;
                                        CreditAccounts."Date of Birth" := saccoAccount."Date of Birth";
                                        CreditAccounts.Name := saccoAccount.Name;
                                        CreditAccounts."ID No." := saccoAccount."ID No.";
                                        CreditAccounts."Mobile Phone No" := saccoAccount."Mobile Phone No";
                                        CreditAccounts."Member No." := saccoAccount."Member No.";
                                        CreditAccounts."Passport No." := saccoAccount."Passport No.";
                                        CreditAccounts."Employer Code" := saccoAccount."Employer Code";
                                        CreditAccounts.Status := Accounts.Status::New;
                                        CreditAccounts."Account Category" := saccoAccount."Account Category";
                                        CreditAccounts."Current Address" := saccoAccount."Current Address";
                                        CreditAccounts.City := saccoAccount.City;
                                        CreditAccounts."Phone No." := saccoAccount."Phone No.";
                                        CreditAccounts."Post Code" := saccoAccount."Post Code";
                                        CreditAccounts.County := saccoAccount.County;
                                        CreditAccounts."E-Mail" := saccoAccount."E-Mail";
                                        CreditAccounts."Product Type" := ProdFac."Product ID";
                                        CreditAccounts."Product Name" := ProdFac."Product Description";
                                        CreditAccounts."Customer Posting Group" := ProdFac."Product Posting Group";
                                        CreditAccounts.Insert(true);

                                    end;
                                end;

                                // create LOAN //

                                Loans.Init;
                                Loans."Loan No." := 'SI_' + Format(MsaccoLoans."Entry no");
                                Loans."Application Date" := Today;
                                Loans."Loan Product Type" := ProdFac."Product ID";
                                Loans."Member No." := saccoAccount."Member No.";
                                Loans."Member Name" := saccoAccount.Name;
                                Loans."Loan Product Type Name" := ProdFac."Product Description";
                                Loans."Requested Amount" := MsaccoLoans."Requested Amount";
                                Loans."Approved Amount" := MsaccoLoans."Requested Amount";
                                Loans.Status := Loans.Status::Approved;
                                Loans.Source := Loans.Source::CREDIT;
                                Loans."Staff No" := saccoAccount."Payroll/Staff No.";
                                Loans."Employer Code" := saccoAccount."Employer Code";
                                Loans.Interest := MComm;//ProdFac."Interest Rate (Max.)";
                                Loans."Mode of Disbursement" := Loans."mode of disbursement"::"Full Disbursement";
                                Loans."Global Dimension 1 Code" := '';
                                Loans."Loan Account" := LAccount;
                                Loans.Repayment := MsaccoLoans."Requested Amount";
                                Loans.Interest := ProdFac."Interest Rate (Min.)";
                                Loans."Loan Principle Repayment" := MsaccoLoans."Requested Amount";
                                ;
                                Loans."Recovery Mode" := Loans."recovery mode"::Salary;
                                Loans."Recovery Priority" := 1;
                                Loans."Approval Date" := Today;
                                Loans."Loan Interest Repayment" := 0;
                                Loans."Disbursement Date" := Today;
                                Loans."Repayment Frequency" := ProdFac."Repayment Frequency";
                                Loans."Repayment Start Date" := CalcDate('CM', CalcDate('1D', CalcDate('CM', Today)));
                                Loans."Sub Sector Level2" := MsaccoLoans."Loan Purpose";
                                Loans.Validate("Sub Sector Level2");
                                Loans.Posted := true;
                                Loans.Insert();
                            end;

                            AcctNo := 'SI_' + Format(MsaccoLoans."Entry no");
                        end;


                        //start posting

                        GenJournalLine.Reset;
                        GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                        GenJournalLine.SetRange("Journal Batch Name", 'MSACCOLN');
                        GenJournalLine.DeleteAll;

                        DocumentNo := MsaccoLoans.DocumentNo;

                        // Dr LOAN Account

                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := 'MSACCO';
                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                        GenJournalLine."Account No." := LAccount;
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := DocumentNo;
                        GenJournalLine."External Document No." := 'MSACCO LN';
                        GenJournalLine."Posting Date" := Today;
                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                        GenJournalLine."Loan No" := AcctNo;
                        GenJournalLine.Amount := Loans."Approved Amount";
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine.Description := 'SIA LOAN ' + Loans."Loan No.";
                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                        // Dr LOAN Account

                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := 'MSACCO';
                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                        GenJournalLine."Account No." := saccoAccount."No.";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := DocumentNo;
                        GenJournalLine."External Document No." := 'MSACCO LN';
                        GenJournalLine."Posting Date" := Today;
                        GenJournalLine."Loan No" := AcctNo;
                        GenJournalLine.Amount := Loans."Approved Amount" * -1;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine.Description := 'SIA LOAN ' + Loans."Loan No.";
                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                        // Dr Loan Processing Commission

                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := 'MSACCO';
                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                        GenJournalLine."Account No." := LAccount;
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := DocumentNo;
                        GenJournalLine."External Document No." := 'MSACCO LN';
                        GenJournalLine."Posting Date" := Today;
                        GenJournalLine.Amount := MsaccoLoans.Amount; // - Loans."Loan Interest Repayment") * -1;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Loan No" := AcctNo;
                        GenJournalLine."Bal. Account Type" := GenJournalLine."account type"::"G/L Account";
                        GenJournalLine."Bal. Account No." := '107001';
                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                        GenJournalLine.Validate("Bal. Account No.");
                        GenJournalLine.Description := 'Bills' + Loans."Loan No.";
                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;


                        //Cr Vendor Share to G/L
                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := 'MSACCO';
                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                        GenJournalLine."Account No." := saccoAccount."No.";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := DocumentNo;
                        GenJournalLine."External Document No." := 'MSACCO LN';
                        GenJournalLine."Posting Date" := Today;
                        GenJournalLine.Description := 'SIA LOAN ' + Loans."Loan No.";
                        GenJournalLine.Amount := Msaccocharge;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                        //Cr Vendor Share to G/L
                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := 'MSACCO';
                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                        GenJournalLine."Account No." := Msaccoacc;
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := DocumentNo;
                        GenJournalLine."External Document No." := 'MSACCO LN';
                        GenJournalLine."Posting Date" := Today;
                        GenJournalLine.Description := 'SIA LOAN ' + Loans."Loan No.";
                        GenJournalLine.Amount := Msaccocharge * -1;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;


                        ExciseDutyGL := GetExciseDutyGL();


                        // Dr Member Loan Processing Fee

                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := 'MSACCO';
                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                        GenJournalLine."Account No." := saccoAccount."No.";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := DocumentNo;
                        GenJournalLine."External Document No." := 'MSACCO LN';
                        GenJournalLine."Posting Date" := Today;
                        GenJournalLine.Description := 'SIA Loan ' + Loans."Loan No." + '-' + LoanProdCharge."Charge Description";
                        GenJournalLine.Amount := MCommission;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                        GenJournalLine."Bal. Account No." := LoanProcessingGL;
                        GenJournalLine.Validate("Bal. Account No.");
                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                        // Dr member Excise Duty
                        GenSetUp.Get;

                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := 'MSACCO';
                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                        GenJournalLine."Account No." := saccoAccount."No.";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := DocumentNo;
                        GenJournalLine."External Document No." := 'MSACCO LN';
                        GenJournalLine."Posting Date" := Today;
                        GenJournalLine.Description := 'SIA Loan ' + Loans."Loan No." + 'Excise Duty';
                        GenJournalLine.Amount := ExciseDuty;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                        GenJournalLine."Bal. Account No." := GenSetUp."Excise Duty G/L";
                        GenJournalLine.Validate("Bal. Account No.");
                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;

                        // complete posting

                        POSTJOURNAL.CompletePosting('MSACCO', 'MSACCOLN');

                        Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your SALARY IN ADVANCE Loan of KES' +
                        Format(Loans."Approved Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                        Format(CalcDate('1M', Today), 0, '<Day>-<Month>-<Year>') + '.', '', saccoAccount."No.", false);

                        //Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Phone No.",'Dear member, to repay your M-Boosta Loan kindly deposit money to your FOSA A/C No '+
                        //saccoAccount."No." +' through paybill No 525200','',saccoAccount."No.",FALSE);

                        MsaccoLoans.Posted := true;
                        MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                        MsaccoLoans."Date Posted" := CurrentDatetime;
                        MsaccoLoans."Approved Amount" := Loans."Approved Amount";
                        MsaccoLoans.Remarks := 'Successful';
                        MsaccoLoans.Modify;

                    end;
                end else begin
                    MsaccoLoans.Posted := true;
                    MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                    MsaccoLoans."Date Posted" := CurrentDatetime;
                    //MsaccoLoans."Approved Amount":= Loans."Approved Amount";
                    MsaccoLoans.Remarks := 'Product not set';
                    MsaccoLoans.Modify;
                end;
            until MsaccoLoans.Next = 0;
        end;

    end;


    procedure GetSalaryAdvance(TelephoneNo: Text[30]; NoOfMonths: Integer) QualifiedAmountFinal: Text[100]
    var
        QualifiedAmount: Text;
        LoanProductType: Text[10];
        LoanProductTypeName: Text;
        Members: Record 52185700;
    begin
        Continue := true;
        TelephoneNo := '+' + TelephoneNo;

        SaccoAccMemberNo := '';
        QualifiedAmountFinal := '0';

        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."Transactional Mobile No", TelephoneNo);
        saccoAccount.SetFilter(saccoAccount.Status, '%1|%2', saccoAccount.Status::Active, saccoAccount.Status::New);
        if saccoAccount.Find('-') then begin

            // LOAN product //
            if ProdFac.Get('119') then begin

                SaccoAccMemberNo := saccoAccount."No.";
                Message(saccoAccount."No.");
                Salary1 := 0;
                Salary2 := 0;
                Salary3 := 0;
                i := 1;
                if saccoAccount."Employer Code" = '05' then begin //KDF MEMBERS

                    SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                    //SalBuffer.SETRANGE(SalBuffer."Account No.",SaccoAccMemberNo);
                    SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                    SalBuffer.SetRange(SalBuffer.Posted, true);
                    SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-2M', CalcDate('<-CM>', Today)), CalcDate('<-CM>', Today));
                    if (SalBuffer.Count() >= 2) then begin

                        //Month One
                        SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                        SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                        SalBuffer.SetRange(SalBuffer.Posted, true);
                        SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-1M', CalcDate('<-CM>', Today)), CalcDate('<-CM>', Today));
                        if SalBuffer.CalcSums(SalBuffer.Amount) then
                            Salary1 := SalBuffer.Amount;
                        //Month Two
                        SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                        SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                        SalBuffer.SetRange(SalBuffer.Posted, true);
                        SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-2M', CalcDate('<-CM>', Today)), CalcDate('-1M', CalcDate('<-CM>', Today)));
                        if SalBuffer.CalcSums(SalBuffer.Amount) then
                            Salary2 := SalBuffer.Amount;
                        //Month Three
                        /*   SalBuffer.SETCURRENTKEY(SalBuffer."Member No.",SalBuffer."Posting Date");
                           SalBuffer.SETRANGE(SalBuffer."Member No.",saccoAccount."Member No.");
                           SalBuffer.SETRANGE(SalBuffer.Posted,TRUE);
                           SalBuffer.SETFILTER(SalBuffer."Posting Date",'%1..%2',CALCDATE('-3M',CALCDATE('<-CM>',TODAY)),CALCDATE('-2M',CALCDATE('<-CM>',TODAY)));
                           IF SalBuffer.CALCSUMS(SalBuffer.Amount) THEN
                             Salary3:=SalBuffer.Amount;
                           */

                    end else begin
                        Continue := false;
                    end;

                end else begin
                    SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                    //SalBuffer.SETRANGE(SalBuffer."Account No.",SaccoAccMemberNo);
                    SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                    SalBuffer.SetRange(SalBuffer.Posted, true);
                    SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-2M', CalcDate('<-CM>', Today)), CalcDate('<-CM>', Today));
                    if (SalBuffer.Count() >= 2) then begin
                        Message(Format(SalBuffer.Count) + ' Salaries found');
                        if SalBuffer.Find('-') then begin
                            repeat
                                if i = 1 then
                                    Salary1 := SalBuffer.Amount;

                                if i = 2 then
                                    Salary2 := SalBuffer.Amount;
                                //MESSAGE('%1 buff', SalBuffer.Amount);
                                /* IF i = 3 THEN
                                   Salary3 := SalBuffer.Amount;;
                                   */
                                i := i + 1;
                            until SalBuffer.Next = 0;
                        end
                    end else begin
                        Continue := false;
                    end;
                end;
                Message(Format(Salary1) + '|' + Format(Salary2) + '|' + Format(Salary3));

                if Salary1 < Salary2 then begin
                    Minimum := Salary1;
                end else begin
                    Minimum := Salary2;
                end;

                /*IF Minimum<Salary3 THEN BEGIN
                Minimum:=Minimum;
                END ELSE BEGIN
                Minimum:=Salary3;
                END;*/
                Message('%1 salo', (Minimum));
                QualifyingAfterDed := ((Minimum * 0.65) / 0.05334);
                Message(Format(QualifyingAfterDed));

                if Continue = false then begin

                    // salary not processed

                    Continue := false;
                    QualifiedAmountFinal := '-1|0|0|Salary not processed two times through FOSA';

                end;

                if Continue = true then begin

                    // Check if defaulter //

                    DefaultedAmount := 0;

                    Loans.Reset;
                    Loans.SetRange(Loans.Status, Loans.Status::Approved);
                    Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                    Loans.SetFilter(Loans."Loans Category-SASRA", '<>%1', Loans."loans category-sasra"::Perfoming, Loans."loans category-sasra"::Watch);
                    if Loans.Find('-') then begin
                        Continue := false;
                        QualifiedAmountFinal := '-1|0|0|You have a defaulted loan';
                        exit;
                    end;
                end;
                Members.Reset;
                Members.SetRange("No.", saccoAccount."Member No.");
                if Members.Find('-') then begin
                    if (Members.Status <> Members.Status::Active) then begin
                        Continue := false;
                        QualifiedAmountFinal := '-1|0|0|Your Account is not Active';
                        exit;
                    end;
                    if (Members."Employer Code" = '9901') or (Members."Employer Code" = '9902') then begin
                        QualifiedAmountFinal := '-1|0|0|You do not qualify for this product';
                        Continue := false;
                        exit;
                    end;
                end;
                Members.Reset;
                Members.SetRange("No.", saccoAccount."Member No.");
                if Members.Find('-') then begin
                    if (Members."Member Category" = 'CONTRACT') then begin
                        Continue := false;
                        QualifiedAmountFinal := '-1|0|0|You are not allowed to take this product';
                        exit;
                    end;
                end;
                SaccoAccount1.Reset;
                SaccoAccount1.SetRange("Member No.", saccoAccount."Member No.");
                SaccoAccount1.SetRange("Mobile Loan Blocked", true);
                if SaccoAccount1.Find('-') then begin
                    Continue := false;
                    QualifiedAmountFinal := '-1|0|0|You are not blocked from accessing this product';
                    exit;
                end;






                SaccoAccount1.Reset;
                SaccoAccount1.SetRange("Member No.", saccoAccount."Member No.");
                SaccoAccount1.SetRange("Product Type", '02');
                if SaccoAccount1.Find('-') then begin
                    SaccoAccount1.CalcFields("Balance (LCY)");
                    if SaccoAccount1."Balance (LCY)" < 9000 then begin
                        Continue := false;
                        QualifiedAmountFinal := '-1|0|0|You have insufficient deposits to take this loan';
                        exit;

                        if (SaccoAccount1.Status <> SaccoAccount1.Status::Active) and (SaccoAccount1.Status <> SaccoAccount1.Status::New) and (SaccoAccount1.Blocked <> SaccoAccount1.Blocked::" ") then
                            Continue := false;
                        QualifiedAmountFinal := '-1|0|0|Your Account is not Active';
                        exit;
                    end;
                end;





                if Continue = true then begin

                    // check if member has existing Salary Advance & M-Boosta Loan

                    Loans.Reset;
                    Loans.SetRange(Loans.Status, Loans.Status::Approved);
                    Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                    Loans.SetFilter(Loans."Loan Product Type", '%1|%2|%3|%4', '126', '123', '120', '121');
                    if Loans.Find('-') then begin
                        repeat

                            Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                            if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > 0 then begin
                                if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > Loans.Repayment then begin
                                    OutstandingAmount += Loans.Repayment;
                                    LoanProductTypeName := Loans."Loan Product Type Name";
                                end
                                else begin
                                    OutstandingAmount += (Loans."Outstanding Balance" + Loans."Outstanding Interest");
                                    LoanProductTypeName := Loans."Loan Product Type Name";
                                end;
                                //MESSAGE( Loans."Loan Product Type" + ' testv' +FORMAT(OutstandingAmount));
                            end;

                        until Loans.Next = 0
                    end;
                    /*
                    IF OutstandingAmount > 0 THEN
                    BEGIN
                      // Outstanding Salary in Advance Loan
                      QualifyingAfterDed:= QualifyingAfterDed-OutstandingAmount;
                      IF QualifyingAfterDed>500 THEN BEGIN
                        Continue := TRUE;
                      END ELSE BEGIN
                      Continue := FALSE;
                        QualifiedAmountFinal := '-1|0|0|Your currently existing loan repayments exceed what you qualify for';
                      END;


                    END;
                    */
                end;

                if Continue = true then begin

                    // check if member has existing Salary In Advance Loan
                    OutstandingAmount := 0;
                    Loans.Reset;
                    Loans.SetRange(Loans.Status, Loans.Status::Approved);
                    Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                    Loans.SetRange(Loans."Loan Product Type", '119');
                    if Loans.Find('-') then begin
                        repeat
                            Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                            if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > 0 then begin
                                OutstandingAmount += (Loans."Outstanding Balance" + Loans."Outstanding Interest");
                                LoanProductTypeName := Loans."Loan Product Type Name";
                                QualifiedAmountFinal := '-1|0|0|You have an Outstanding-: ' + LoanProductTypeName;
                                // EXIT;
                                //MESSAGE(Loans."Loan Product Type Name");
                            end;
                        until Loans.Next = 0
                    end;
                    //MESSAGE('final one %1 and %2',OutstandingAmount,QualifyingAfterDed);
                    if OutstandingAmount > 0 then begin
                        // Outstanding Salary in Advance Loan
                        if (QualifyingAfterDed) > 1000 then begin
                            Continue := true;
                            //MESSAGE('final2 one %1 and %2',OutstandingAmount,QualifyingAfterDed);
                            if OutstandingAmount >= QualifyingAfterDed then begin
                                QualifiedAmountFinal := '-1|0|0|You have an Outstanding- ' + LoanProductTypeName;
                            end else begin
                                QualifiedAmountFinal := '1|' + Format(ROUND(QualifyingAfterDed, 1000, '=')) + '|' + Format(OutstandingAmount) + '|0';
                            end;
                        end else begin
                            Continue := false;
                            QualifiedAmountFinal := '-1|0|0|You have an Outstanding: ' + LoanProductTypeName;
                        end;
                    end;
                end;

                if Continue = true then begin
                    if QualifyingAfterDed > ProdFac."Maximum Loan Amount" then begin
                        QualifyingAfterDed := ProdFac."Maximum Loan Amount";
                        if QualifyingAfterDed > OutstandingAmount then begin
                            QualifiedAmountFinal := '1|' + Format(ROUND(QualifyingAfterDed, 1000, '=')) + '|' + Format(OutstandingAmount) + '|0'
                        end else begin
                            QualifiedAmountFinal := '-1|0|0|Outstanding ' + LoanProductTypeName;
                        end;
                    end else begin
                        if QualifyingAfterDed > OutstandingAmount then begin
                            QualifiedAmountFinal := '1|' + Format(ROUND(QualifyingAfterDed, 1000, '=')) + '|' + Format(OutstandingAmount) + '|0'
                        end else begin
                            QualifiedAmountFinal := '-1|0|0|Outstanding ' + LoanProductTypeName;
                        end;
                    end;
                end;
            end else begin
                QualifiedAmountFinal := '-1|0|0|Product not found';
            end;
        end else begin
            QualifiedAmountFinal := '-1|0|0|Your account is inactive';
        end;

    end;


    procedure PostSalaryAdvanceIILoan()
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
        Qualify: Text;
    begin
        MsaccoChargesSetup.Reset;
        MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
        if MsaccoChargesSetup.Find('-') then begin
            MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
            Msaccocharge := MsaccoChargesSetup.ChargeAmount;
            Msaccoacc := MsaccoChargesSetup."Vendor No";
        end;
        LoanProcessingGL := '301028';
        MsaccoLoans.Reset;
        MsaccoLoans.SetRange(MsaccoLoans.Status, MsaccoLoans.Status::Pending);
        //MsaccoLoans.SETRANGE("Entry no",367333);
        MsaccoLoans.SetRange(MsaccoLoans."Loan Product Type", MsaccoLoans."loan product type"::"Salary Advance");
        MsaccoLoans.SetRange(MsaccoLoans."Loan Code", '119');
        MsaccoLoans.SetRange(MsaccoLoans.Posted, false);
        if MsaccoLoans.Find('-') then begin
            repeat
                MsaccoGuarantors.Reset;
                MsaccoGuarantors.SetRange("Msacco Loans Entry No", Format(MsaccoLoans."Entry no"));
                if MsaccoGuarantors.Find('-') then
                    repeat
                        NoOfGuarantors += 1;
                    until MsaccoGuarantors.Next = 0;
                if NoOfGuarantors >= 4 then begin
                    ContinueMB := true;

                    if MsaccoLoans.Installment <> 0 then
                        Evaluate(InstallM, Format(MsaccoLoans.Installment))
                    else
                        InstallM := 24;


                    saccoAccount.Reset;
                    saccoAccount.SetRange(saccoAccount."No.", MsaccoLoans."Account No");
                    if saccoAccount.Find('-') then begin
                        //CHECK SALARY
                        SaccoMemberNo := saccoAccount."Member No.";
                        // MBOOSTA LOAN //
                        if ProdFac.Get('119') then begin
                            SaccoAccMemberNo := MsaccoLoans."Account No";
                            //5050123278000
                            Minimum := GetLoanQualifiedAmountII(MsaccoLoans."Account No", '119');
                            // IF MsaccoLoans.Amount> Minimum THEN
                            // ContinueMB:=FALSE;
                            /*MsaccoLoans.Remarks:='Amount greater than qualified Amount';
                            MsaccoLoans.Status:=MsaccoLoans.Status::Failed;
                            MsaccoLoans.MODIFY;*/
                            //EXIT;
                        end;
                        //Check Double posting
                        if ContinueMB = true then begin
                            //Prevent Double Posting
                            Venderdetails.Reset;
                            Venderdetails.SetRange(Venderdetails."Document No.", MsaccoLoans.DocumentNo);
                            Venderdetails.SetRange("Customer No.", MsaccoLoans."Account No");
                            Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
                            if Venderdetails.Find('-') then begin
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                                MsaccoLoans.Remarks := 'Successful';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your Salary Advance Loan of KES' +
                                      Format(Loans."Approved Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                                      Format(CalcDate(Format(InstallM) + 'M', Today), 0, '<Day>-<Month>-<Year>') + '.', '', saccoAccount."No.", false);
                                ContinueMB := false;
                            end;
                        end;

                        // SALARY //

                        if ContinueMB = false then begin

                            // salary not processed
                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name +
                            ', your Salary Advance Loan request has been rejected. Reason: You do not qualify for this product.', '',
                            saccoAccount."No.", false);
                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                            MsaccoLoans.Remarks := 'Does not qualify for this product';
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans.Modify;
                            ContinueMB := false;
                        end;


                        if ContinueMB = true then begin
                            // check if member has an overdraft
                            //Wrong Loan
                            Qualify := Format(GetSalaryAdvance(CopyStr(saccoAccount."Transactional Mobile No", 2, 12), 24));
                            if CopyStr(Qualify, 1, 2) = '-1' then begin
                                //Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Transactional Mobile No",'Dear '+ saccoAccount.Name + ', your Salary Advance Loan request has been rejected. Reason: Account is overdrawn with KES '+
                                //FORMAT(saccoAccount.Balance *-1)+'. Normalize your account.',''
                                //  ,saccoAccount."No.",FALSE);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := Format(Qualify);
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;


                        if ContinueMB = true then begin
                            //Prevent Double Posting
                            Venderdetails.Reset;
                            Venderdetails.SetRange(Venderdetails."Document No.", MsaccoLoans.DocumentNo);
                            Venderdetails.SetRange("Customer No.", MsaccoLoans."Account No");
                            Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
                            if Venderdetails.Find('-') then begin
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                                MsaccoLoans.Remarks := 'Successful';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your Salary Advance Loan of KES' +
                                      Format(Loans."Approved Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                                      Format(CalcDate(Format(InstallM) + 'M', Today), 0, '<Day>-<Month>-<Year>') + '.', '', saccoAccount."No.", false);
                                ContinueMB := false;
                            end;
                        end;

                        if ContinueMB = true then begin
                            // check if member has existing Salary In Advance Loan
                            Loans.Reset;
                            //Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                            Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                            Loans.SetRange(Posted, true);
                            Loans.SetRange(Loans."Loan Product Type", ProdFac."Product ID");
                            if Loans.Find('-') then begin
                                repeat
                                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                                    OutstandingAmount := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                                    if MsaccoLoans."Requested Amount" < (OutstandingAmount + 10000) then begin
                                        // Outstanding Salary In Advance Loan
                                        Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name
                                        + ', your Salary In Advance Loan request has been rejected. Reason: Outstanding related loans is higher than amount applied.', ''
                                        , saccoAccount."No.", false);
                                        MsaccoLoans.Posted := true;
                                        MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                        MsaccoLoans.Remarks := 'Outstanding  Salary In Advance Loan';
                                        MsaccoLoans."Date Posted" := CurrentDatetime;
                                        MsaccoLoans.Modify;
                                        ContinueMB := false;
                                    end;
                                until Loans.Next = 0
                            end;
                        end;

                        if ContinueMB = true then begin
                            // check if member has an overdraft

                            if saccoAccount.Balance < -500 then begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your Salary Advance Loan request has been rejected. Reason: Account is overdrawn with KES ' +
                               Format(saccoAccount.Balance * -1) + '. Normalize your account.', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'Member has overdrawn';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;

                        if ContinueMB = true then begin
                            // check if amount is less than minimum

                            if MsaccoLoans.Amount < ProdFac."Minimum Loan Amount" then begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your Salary Advance Loan request has been rejected. Reason: Minimum loan amount is KES ' +
                                Format(ProdFac."Minimum Loan Amount") + '.', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'Less than minimum loan amount';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;
                        if ContinueMB = true then begin
                            // check if amount is more than maximum

                            if MsaccoLoans.Amount > ProdFac."Maximum Loan Amount" then begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name +
                                ', your Salary Advance Loan request has been rejected. Reason: Maximum loan amount is KES ' + Format(ProdFac."Maximum Loan Amount") + '.', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'More than maximum loan amount';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;

                        if ContinueMB = true then begin

                            // Check if defaulter //

                            DefaultedAmount := 0;

                            Loans.Reset;
                            Loans.SetRange(Loans.Status, Loans.Status::Approved);
                            Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                            if Loans.Find('-') then begin
                                repeat
                                    Loans.CalcFields(Loans."Outstanding Bills");
                                    if Loans."Outstanding Bills" > Loans.Repayment then begin
                                        DefaultedAmount := DefaultedAmount + Loans."Outstanding Bills";
                                    end
                                until Loans.Next = 0;
                            end;
                            if DefaultedAmount > 0 then begin

                            end;
                        end;

                        if ContinueMB = true then begin

                            MCommission := 0;
                            MInterest := 0;
                            MComm := 0;
                            MInt := 0;
                            LoanProdCharge.Reset;
                            LoanProdCharge.SetRange("Charge Code", 'L01');
                            LoanProdCharge.SetRange("Product Code", '119');
                            if LoanProdCharge.Find('-') then begin
                                MComm := LoanProdCharge.Percentage;
                            end else begin
                                MComm := 14;
                            end;
                            MCommission := (MsaccoLoans.Amount * (MComm / 100));
                            ////---- POST LOAN ---////


                            if ProdFac.Get('119') then begin
                                Loans.Reset;
                                Loans.SetRange(Loans."Loan No.", 'SA_' + Format(MsaccoLoans."Entry no"));
                                if Loans.Find('-') then begin
                                    CreditAccounts.Reset;
                                    CreditAccounts.SetRange(CreditAccounts."No.", ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix");
                                    if CreditAccounts.FindFirst() then begin
                                        //IF CreditAccounts.GET(ProdFac."Account No. Prefix"+ saccoAccount."Member No." +ProdFac."Account No. Suffix") THEN BEGIN
                                        LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                        //MESSAGE(LAccount);
                                    end else begin
                                        LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                        //MESSAGE(LAccount);
                                        if saccoAccount.Get(saccoAccount."No.") then begin

                                            CreditAccounts.Init;
                                            CreditAccounts."No." := LAccount;
                                            CreditAccounts."Date of Birth" := saccoAccount."Date of Birth";
                                            CreditAccounts.Name := saccoAccount.Name;
                                            CreditAccounts."ID No." := saccoAccount."ID No.";
                                            CreditAccounts."Mobile Phone No" := saccoAccount."Mobile Phone No";
                                            CreditAccounts."Member No." := saccoAccount."Member No.";
                                            CreditAccounts."Passport No." := saccoAccount."Passport No.";
                                            CreditAccounts."Employer Code" := saccoAccount."Employer Code";
                                            CreditAccounts.Status := Accounts.Status::New;
                                            CreditAccounts."Account Category" := saccoAccount."Account Category";
                                            CreditAccounts."Current Address" := saccoAccount."Current Address";
                                            CreditAccounts.City := saccoAccount.City;
                                            CreditAccounts."Phone No." := saccoAccount."Phone No.";
                                            CreditAccounts."Post Code" := saccoAccount."Post Code";
                                            CreditAccounts.County := saccoAccount.County;
                                            CreditAccounts."E-Mail" := saccoAccount."E-Mail";
                                            CreditAccounts."Product Type" := ProdFac."Product ID";
                                            CreditAccounts."Product Name" := ProdFac."Product Description";
                                            CreditAccounts."Customer Posting Group" := ProdFac."Product Posting Group";
                                            CreditAccounts.Insert(true);

                                        end;
                                    end;
                                end else begin
                                    CreditAccounts.Reset;
                                    CreditAccounts.SetRange(CreditAccounts."No.", ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix");
                                    if CreditAccounts.FindFirst() then begin
                                        //IF CreditAccounts.GET(ProdFac."Account No. Prefix"+ saccoAccount."Member No." +ProdFac."Account No. Suffix") THEN BEGIN
                                        LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                        //MESSAGE(LAccount);
                                    end else begin
                                        LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                        //MESSAGE(LAccount);
                                        if saccoAccount.Get(saccoAccount."No.") then begin

                                            CreditAccounts.Init;
                                            CreditAccounts."No." := LAccount;
                                            CreditAccounts."Date of Birth" := saccoAccount."Date of Birth";
                                            CreditAccounts.Name := saccoAccount.Name;
                                            CreditAccounts."ID No." := saccoAccount."ID No.";
                                            CreditAccounts."Mobile Phone No" := saccoAccount."Mobile Phone No";
                                            CreditAccounts."Member No." := saccoAccount."Member No.";
                                            CreditAccounts."Passport No." := saccoAccount."Passport No.";
                                            CreditAccounts."Employer Code" := saccoAccount."Employer Code";
                                            CreditAccounts.Status := Accounts.Status::New;
                                            CreditAccounts."Account Category" := saccoAccount."Account Category";
                                            CreditAccounts."Current Address" := saccoAccount."Current Address";
                                            CreditAccounts.City := saccoAccount.City;
                                            CreditAccounts."Phone No." := saccoAccount."Phone No.";
                                            CreditAccounts."Post Code" := saccoAccount."Post Code";
                                            CreditAccounts.County := saccoAccount.County;
                                            CreditAccounts."E-Mail" := saccoAccount."E-Mail";
                                            CreditAccounts."Product Type" := ProdFac."Product ID";
                                            CreditAccounts."Product Name" := ProdFac."Product Description";
                                            CreditAccounts."Customer Posting Group" := ProdFac."Product Posting Group";
                                            CreditAccounts.Insert(true);

                                        end;
                                    end;

                                    // create LOAN //

                                    Loans.Init;
                                    Loans."Loan No." := 'SA_' + Format(MsaccoLoans."Entry no");
                                    Loans."Application Date" := Today;
                                    Loans."Loan Product Type" := ProdFac."Product ID";
                                    Loans."Member No." := saccoAccount."Member No.";
                                    Loans."Member Name" := saccoAccount.Name;
                                    Loans."Loan Product Type Name" := ProdFac."Product Description";
                                    Loans."Requested Amount" := MsaccoLoans."Requested Amount";
                                    Loans."Approved Amount" := MsaccoLoans."Requested Amount";
                                    Loans.Status := Loans.Status::Approved;
                                    Loans.Source := Loans.Source::CREDIT;
                                    Loans."Staff No" := saccoAccount."Payroll/Staff No.";
                                    Loans."Employer Code" := saccoAccount."Employer Code";
                                    Loans.Interest := MComm;//ProdFac."Interest Rate (Max.)";
                                    Loans."Mode of Disbursement" := Loans."mode of disbursement"::"Full Disbursement";
                                    Loans."Global Dimension 1 Code" := '';
                                    Loans."Loan Account" := LAccount;
                                    if MsaccoLoans.Installment <> 0 then
                                        Loans.Repayment := ROUND((MsaccoLoans.Amount / MsaccoLoans.Installment), 1, '>') + ROUND(((MsaccoLoans.Amount * (14 / 12)) / 100), 1, '>')
                                    else
                                        Loans.Repayment := ROUND((MsaccoLoans.Amount / 24), 1, '>') + ROUND(((MsaccoLoans.Amount * (14 / 12)) / 100), 1, '>');

                                    Loans.Interest := ProdFac."Interest Rate (Min.)";

                                    if MsaccoLoans.Installment <> 0 then
                                        Loans."Loan Principle Repayment" := ROUND((MsaccoLoans.Amount / MsaccoLoans.Installment), 1, '>')
                                    else
                                        Loans."Loan Principle Repayment" := ROUND((MsaccoLoans.Amount / 24), 1, '>');
                                    Loans."Recovery Mode" := Loans."recovery mode"::Salary;
                                    Loans."Recovery Priority" := 1;
                                    Loans."Loan Interest Repayment" := 0;
                                    Loans."Amount To Disburse" := MsaccoLoans."Requested Amount";
                                    Loans."Repayment Frequency" := Loans."repayment frequency"::Monthly;
                                    Loans."Interest Calculation Method" := Loans."interest calculation method"::"Straight Line";
                                    Loans."Disbursement Date" := Today;
                                    Loans."Repayment Frequency" := ProdFac."Repayment Frequency";
                                    Loans."Disbursement Account No" := saccoAccount."No.";
                                    Loans."Loan Appraised By" := 'HARAMBEESACCO\MSACCO';
                                    Loans."Captured By" := 'HARAMBEESACCO\MSACCO';
                                    Loans."Global Dimension 2 Code" := 'NBI';
                                    Loans."Approval Date" := Today;
                                    Loans."Loan Span" := Loans."loan span"::"Short Term";
                                    //Added for Installment
                                    if MsaccoLoans.Installment <> 0 then begin
                                        Loans.Installments := MsaccoLoans.Installment;
                                        Loans."Expected Date of Completion" := CalcDate('<CM>', CalcDate(Format(InstallM) + 'M', Today));
                                    end else begin
                                        Loans.Installments := ProdFac."Prefferential Default installm";
                                        Loans."Expected Date of Completion" := CalcDate('<CM>', CalcDate('24M', Today));
                                    end;
                                    //Loans."Expected Date of Completion":=CALCDATE('<CM>',CALCDATE(FORMAT(InstallM)+'M',TODAY));
                                    Loans."Repayment Start Date" := CalcDate('CM', CalcDate('1D', CalcDate('CM', Today)));
                                    Loans."Sub Sector Level2" := MsaccoLoans."Loan Purpose";
                                    Loans.Validate("Sub Sector Level2");
                                    Loans.Posted := true;
                                    Loans.Insert();
                                end;

                                AcctNo := 'SA_' + Format(MsaccoLoans."Entry no");
                            end;


                            //start posting

                            GenJournalLine.Reset;
                            GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                            GenJournalLine.SetRange("Journal Batch Name", 'MSACCOLN');
                            GenJournalLine.DeleteAll;

                            DocumentNo := MsaccoLoans.DocumentNo;



                            // Dr LOAN Account

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                            GenJournalLine."Account No." := LAccount;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                            GenJournalLine."Loan No" := AcctNo;
                            GenJournalLine.Amount := Loans."Approved Amount";
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := 'SA LOAN ' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            // Dr LOAN Account

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine."Loan No" := AcctNo;
                            GenJournalLine.Amount := Loans."Approved Amount" * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := 'SA LOAN ' + Loans."Loan No.";
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            TotalClearedAmount := 0;

                            OutstandingLoans.Reset;
                            OutstandingLoans.SetRange(OutstandingLoans.Status, OutstandingLoans.Status::Approved);
                            OutstandingLoans.SetRange(OutstandingLoans."Member No.", saccoAccount."Member No.");
                            OutstandingLoans.SetFilter(OutstandingLoans."Loan Product Type", '%1|%2', '119', '123');
                            if OutstandingLoans.Find('-') then begin
                                repeat
                                    OutstandingLoans.CalcFields("Outstanding Balance", "Outstanding Interest", "Outstanding Bills");
                                    if OutstandingLoans."Outstanding Balance" > 0 then begin
                                        // Cr LOAN Account
                                        TotalClearedAmount += OutstandingLoans."Outstanding Balance" + OutstandingLoans."Outstanding Interest";
                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                        GenJournalLine."Account No." := OutstandingLoans."Loan Account";//LAccount;
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Repayment;
                                        GenJournalLine."Loan No" := OutstandingLoans."Loan No.";
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Balance" * -1;
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp ' + Loans."Loan No.";
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Cr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                        GenJournalLine."Account No." := OutstandingLoans."Loan Account";//LAccount;
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                                        GenJournalLine."Loan No" := OutstandingLoans."Loan No.";
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Interest" * -1;
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp Interest Paid' + Loans."Loan No.";
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Dr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                        GenJournalLine."Account No." := saccoAccount."No.";
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        //GenJournalLine."Loan No":= AcctNo;
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Balance";
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp Principle ' + OutstandingLoans."Loan No.";
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Dr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                        GenJournalLine."Account No." := saccoAccount."No.";
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        //GenJournalLine."Loan No":= AcctNo;
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Interest";
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp Interest ' + OutstandingLoans."Loan No.";
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Dr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                        GenJournalLine."Account No." := LAccount;
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        GenJournalLine."Loan No" := OutstandingLoans."Loan No.";
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Bills" * -1;
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp ' + OutstandingLoans."Loan No.";
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Dr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                                        GenJournalLine."Account No." := '107001';
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        //GenJournalLine."Loan No":= AcctNo;
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Bills";
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp ' + OutstandingLoans."Loan No.";
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert

                                    end;
                                until OutstandingLoans.Next = 0;
                            end;

                            //Boost Commission Start
                            if TotalClearedAmount > 0 then
                                LineNo := BridgeLoanFunction(LineNo, 'MSACCO', 'MSACCOLN', DocumentNo, TotalClearedAmount, Loans."Loan No.", saccoAccount."No.");
                            //Boost Commission End


                            // Dr Loan Processing Commission

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                            GenJournalLine."Account No." := LAccount;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Amount := ROUND((MsaccoLoans.Amount / InstallM), 1, '>'); // - Loans."Loan Interest Repayment") * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Loan No" := AcctNo;
                            GenJournalLine."Bal. Account Type" := GenJournalLine."account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := '107001';
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine.Description := 'Bills' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            //Interest Due
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                            GenJournalLine."Account No." := LAccount;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Amount := ROUND(((MsaccoLoans.Amount * (14 / 12)) / 100), 1, '>'); // - Loans."Loan Interest Repayment") * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Loan No" := AcctNo;
                            GenJournalLine."Bal. Account Type" := GenJournalLine."account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := '301009';
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Due";
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine.Description := 'SA Interest Due' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            //Cr Vendor Share to G/L
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := 'SA LOAN Msacco Fee ' + Loans."Loan No.";
                            GenJournalLine.Amount := Msaccocharge;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            //Cr Vendor Share to G/L
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                            GenJournalLine."Account No." := Msaccoacc;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := 'SA LOAN Msacco Fee ' + Loans."Loan No.";
                            GenJournalLine.Amount := Msaccocharge * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            ExciseDuty := MCommission * (GetExciseDuty() / 100);
                            ExciseDutyGL := GetExciseDutyGL();


                            // Dr Member Loan Processing Fee

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := 'SA Loan ' + Loans."Loan No." + 'Processing Commission';
                            GenJournalLine.Amount := MCommission;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := LoanProcessingGL;
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            // Dr member Excise Duty
                            GenSetUp.Get;

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := 'SA Loan ' + Loans."Loan No." + 'Excise Duty';
                            GenJournalLine.Amount := ExciseDuty;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := GenSetUp."Excise Duty G/L";
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            // complete posting

                            POSTJOURNAL.CompletePosting('MSACCO', 'MSACCOLN');


                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your SALARY ADVANCE Loan of KES' +
                            Format(Loans."Approved Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                            Format(Loans."Repayment Start Date") + ' to be repaid at KES.' + Format(Loans.Repayment) + ' monthly', '', saccoAccount."No.", false);

                            //Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Phone No.",'Dear member, to repay your M-Boosta Loan kindly deposit money to your FOSA A/C No '+
                            //saccoAccount."No." +' through paybill No 525200','',saccoAccount."No.",FALSE);

                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans."Approved Amount" := Loans."Approved Amount";
                            MsaccoLoans.Remarks := 'Successful';
                            MsaccoLoans.Modify;

                        end;
                    end else begin
                        MsaccoLoans.Posted := true;
                        MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                        MsaccoLoans."Date Posted" := CurrentDatetime;
                        //MsaccoLoans."Approved Amount":= Loans."Approved Amount";
                        MsaccoLoans.Remarks := 'Product not set';
                        MsaccoLoans.Modify;
                    end;
                end;
                loanCounter := loanCounter + 1;
            until (MsaccoLoans.Next = 0) or (loanCounter = 10);
        end;

    end;


    procedure GetLoanQualifiedAmountII(SaccoAccountNo: Text[30]; LoanProductType: Text) QualifiedAmountOld: Decimal
    var
        DefaultedAmount: Integer;
        Members: Record 52185700;
    begin
        Continue := true;
        SaccoAccMemberNo := '';
        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."No.", SaccoAccountNo);
        saccoAccount.SetFilter(saccoAccount.Status, '%1|%2', saccoAccount.Status::Active, saccoAccount.Status::New);
        if saccoAccount.Find('-') then begin

            // LOAN product //
            if ProdFac.Get('119') then begin

                SaccoAccMemberNo := saccoAccount."No.";
                Message(saccoAccount."No.");
                Salary1 := 0;
                Salary2 := 0;
                Salary3 := 0;
                i := 1;
                if saccoAccount."Employer Code" = '05' then begin //KDF MEMBERS

                    SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                    //SalBuffer.SETRANGE(SalBuffer."Account No.",SaccoAccMemberNo);
                    SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                    SalBuffer.SetRange(SalBuffer.Posted, true);
                    SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-3M', CalcDate('<-CM>', Today)), CalcDate('<-CM>', Today));
                    if (SalBuffer.Count() >= 3) then begin

                        //Month One
                        SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                        SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                        SalBuffer.SetRange(SalBuffer.Posted, true);
                        SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-1M', CalcDate('<-CM>', Today)), CalcDate('<-CM>', Today));
                        if SalBuffer.CalcSums(SalBuffer.Amount) then
                            Salary1 := SalBuffer.Amount;
                        //Month Two
                        SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                        SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                        SalBuffer.SetRange(SalBuffer.Posted, true);
                        SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-2M', CalcDate('<-CM>', Today)), CalcDate('-1M', CalcDate('<-CM>', Today)));
                        if SalBuffer.CalcSums(SalBuffer.Amount) then
                            Salary2 := SalBuffer.Amount;
                        //Month Three
                        SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                        SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                        SalBuffer.SetRange(SalBuffer.Posted, true);
                        SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-3M', CalcDate('<-CM>', Today)), CalcDate('-2M', CalcDate('<-CM>', Today)));
                        if SalBuffer.CalcSums(SalBuffer.Amount) then
                            Salary3 := SalBuffer.Amount;

                    end else begin
                        Continue := false;
                    end;

                end else begin
                    SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                    //SalBuffer.SETRANGE(SalBuffer."Account No.",SaccoAccMemberNo);
                    SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                    SalBuffer.SetRange(SalBuffer.Posted, true);
                    SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-3M', CalcDate('<-CM>', Today)), CalcDate('<-CM>', Today));
                    if (SalBuffer.Count() >= 3) then begin
                        Message(Format(SalBuffer.Count) + ' Salaries found');
                        if SalBuffer.Find('-') then begin
                            repeat
                                if i = 1 then
                                    Salary1 := SalBuffer.Amount;

                                if i = 2 then
                                    Salary2 := SalBuffer.Amount;

                                if i = 3 then
                                    Salary3 := SalBuffer.Amount;
                                ;

                                i := i + 1;
                            until SalBuffer.Next = 0;
                        end
                    end else begin
                        Continue := false;
                    end;
                end;
                Message(Format(Salary1) + '|' + Format(Salary2) + '|' + Format(Salary3));

                if Salary1 < Salary2 then begin
                    Minimum := Salary1;
                end else begin
                    Minimum := Salary2;
                end;

                if Minimum < Salary3 then begin
                    Minimum := Minimum;
                end else begin
                    Minimum := Salary3;
                end;
                //MESSAGE(FORMAT(Minimum));
                QualifyingAfterDed := ((Minimum * 0.65) / 0.05334);
                // MESSAGE(FORMAT(QualifyingAfterDed));

                if Continue = false then begin

                    // salary not processed

                    Continue := false;
                    QualifiedAmountOld := 0;
                    exit;
                end;

                // IF Continue = TRUE THEN  BEGIN

                // Check if defaulter //

                DefaultedAmount := 0;

                Loans.Reset;
                Loans.SetRange(Loans.Status, Loans.Status::Approved);
                Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                Loans.SetFilter(Loans."Loans Category-SASRA", '<>%1', Loans."loans category-sasra"::Perfoming, Loans."loans category-sasra"::Watch);
                if Loans.Find('-') then begin
                    Continue := false;
                    QualifiedAmountOld := 0;
                    exit;
                end;
                // END;
                Members.Reset;
                Members.SetRange("No.", saccoAccount."Member No.");
                if Members.Find('-') then begin
                    if (Members.Status <> Members.Status::Active) or (Members."Member Category" = 'CONTRACT') then begin
                        Continue := false;
                        QualifiedAmountOld := 0;
                        exit;
                    end;
                end;


                if Continue = true then begin

                    // check if member has existing Salary Advance & M-Boosta Loan

                    Loans.Reset;
                    Loans.SetRange(Loans.Status, Loans.Status::Approved);
                    Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                    Loans.SetFilter(Loans."Loan Product Type", '%1|%2|%3|%4', '126', '123', '120', '121');
                    if Loans.Find('-') then begin
                        repeat

                            Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                            if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > 0 then begin
                                if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > Loans.Repayment then begin
                                    OutstandingAmount += Loans.Repayment;
                                end
                                else begin
                                    OutstandingAmount += (Loans."Outstanding Balance" + Loans."Outstanding Interest");
                                end;
                                //MESSAGE( Loans."Loan Product Type" + ' ' +FORMAT(OutstandingAmount));
                            end;

                        until Loans.Next = 0
                    end;
                    /*
                    IF OutstandingAmount > 0 THEN
                    BEGIN
                      // Outstanding Salary in Advance Loan
                      QualifyingAfterDed:= QualifyingAfterDed-OutstandingAmount;
                      IF QualifyingAfterDed>500 THEN BEGIN
                        Continue := TRUE;
                      END ELSE BEGIN
                      Continue := FALSE;
                        QualifiedAmountFinal := '-1|0|0|Your currently existing loan repayments exceed what you qualify for';
                      END;


                    END;
                    */
                end;

                if Continue = true then begin

                    // check if member has existing Salary In Advance Loan

                    Loans.Reset;
                    Loans.SetRange(Loans.Status, Loans.Status::Approved);
                    Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                    Loans.SetRange(Loans."Loan Product Type", '119');
                    if Loans.Find('-') then begin
                        repeat
                            Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                            if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > 0 then begin
                                OutstandingAmount := (Loans."Outstanding Balance" + Loans."Outstanding Interest");
                            end;
                        until Loans.Next = 0
                    end;
                    Message(Format(OutstandingAmount));
                    if OutstandingAmount > 0 then begin
                        // Outstanding Salary in Advance Loan
                        if (QualifyingAfterDed) > 1000 then begin
                            Continue := true;
                            if OutstandingAmount >= QualifyingAfterDed then begin
                                QualifiedAmountOld := 0;
                            end else begin
                                QualifiedAmountOld := ROUND(QualifyingAfterDed, 1000, '=');
                            end
                        end else begin
                            Continue := false;
                            QualifiedAmountOld := 0;
                            exit;
                        end;
                    end;
                end;

                if Continue = true then begin
                    if QualifyingAfterDed > ProdFac."Maximum Loan Amount" then begin
                        QualifyingAfterDed := ProdFac."Maximum Loan Amount";
                        if QualifyingAfterDed > OutstandingAmount then begin
                            QualifiedAmountOld := ROUND(QualifyingAfterDed, 1000, '=') - OutstandingAmount;
                        end else begin
                            QualifiedAmountOld := 0;
                        end;
                    end else begin
                        if QualifyingAfterDed > OutstandingAmount then begin
                            QualifiedAmountOld := ROUND(QualifyingAfterDed, 1000, '=');
                        end else begin
                            QualifiedAmountOld := 0;
                        end;
                    end;
                end;
            end else begin
                QualifiedAmountOld := 0;
            end;
        end else begin
            QualifiedAmountOld := 0;
        end;



        ProdFac.Get('119');
        if QualifiedAmountOld > ProdFac."Maximum Loan Amount" then
            QualifiedAmountOld := ProdFac."Maximum Loan Amount";
        if QualifiedAmountOld < ProdFac."Minimum Loan Amount" then
            QualifiedAmountOld := 0;

    end;


    procedure CreateGuarantors()
    var
        LoanGuarantors: Record 52185739;
        SavingsAcc: Record 52185730;
        LEntry: Integer;
    begin
        MsaccoGuarantors.Reset;
        MsaccoGuarantors.SetRange(MsaccoGuarantors.Posted, false);
        if MsaccoGuarantors.Find('-') then
            repeat


                //Salary Advance Loan
                Loans.Reset;
                Loans.SetRange(Status, Loans.Status::Approved);
                Loans.SetRange("Loan No.", 'SA_' + MsaccoGuarantors."Msacco Loans Entry No");
                Loans.SetRange("Loan Product Type", '119');
                if Loans.Find('-') then begin
                    //MESSAGE('1');
                    saccoAccount.Reset;
                    saccoAccount.SetRange("Member No.", Loans."Member No.");
                    if saccoAccount.Find('-') then begin
                        //MESSAGE('2');
                        SaccoAccount1.Reset;
                        SaccoAccount1.SetRange("Transactional Mobile No", MsaccoGuarantors."Guarontor Telephone No");
                        //saccoAccount1.SETRANGE("Product Category",saccoAccount1."Product Category"::"Deposit Contribution");
                        if SaccoAccount1.Find('-') then begin
                            //MESSAGE('3');
                            LoanGuarantors.Reset;
                            LoanGuarantors.SetRange("Loan No", 'SA_' + MsaccoGuarantors."Msacco Loans Entry No");
                            LoanGuarantors.SetRange(Name, MsaccoGuarantors."Guarontor Name");
                            if LoanGuarantors.Find('-') then begin
                                //MESSAGE('4');
                                MsaccoGuarantors.Posted := true;
                                MsaccoGuarantors.Modify();
                            end else begin
                                SaccoAccount1.CalcFields(SaccoAccount1.Balance);
                                LoanGuarantors.Init;
                                LoanGuarantors."Loan No" := Loans."Loan No.";
                                LoanGuarantors."Savings Account No./Member No." := GetDepoAcc(SaccoAccount1."Member No.");
                                LoanGuarantors.Name := SaccoAccount1.Name;
                                LoanGuarantors."Deposits/Shares" := GetDepoBal(SaccoAccount1."Member No.");
                                LoanGuarantors."Amount Guaranteed" := ROUND(Loans."Approved Amount" / 4, 1, '>');
                                LoanGuarantors."Account No." := SaccoAccount1."Member No.";
                                LoanGuarantors."Member Guaranteed" := Loans."Member No.";
                                LoanGuarantors."Member No" := SaccoAccount1."Member No.";
                                LoanGuarantors."Staff/Payroll No." := SaccoAccount1."Payroll/Staff No.";
                                LoanGuarantors."Loan Type" := Loans."Loan Product Type";
                                LoanGuarantors."Loanee Name" := Loans."Member Name";
                                LoanGuarantors."Guarantor Type" := LoanGuarantors."guarantor type"::Guarantor;
                                LoanGuarantors.Insert;
                                MsaccoGuarantors.Posted := true;
                                MsaccoGuarantors.Modify();
                            end;
                        end;
                    end;
                end;


                MsaccoLoans.Reset;
                MsaccoLoans.SetRange("Loan No", MsaccoGuarantors."Loan No");
                if MsaccoLoans.Find('-') then begin

                    //Emergency Loan
                    Loans.Reset;
                    //Loans.SETRANGE(Status,Loans.Status::Approved);
                    Loans.SetRange("Loan No.", MsaccoLoans."Loan No");
                    Loans.SetRange("Picked Mobile Loan", true);
                    //Loans.SETRANGE("Loan Product Type",'112');
                    Loans.SetRange(Posted, false);
                    if Loans.Find('-') then begin
                        saccoAccount.Reset;
                        saccoAccount.SetRange("Member No.", Loans."Member No.");
                        if saccoAccount.Find('-') then begin
                            SaccoAccount1.Reset;
                            SaccoAccount1.SetRange("Transactional Mobile No", MsaccoGuarantors."Guarontor Telephone No");
                            //saccoAccount1.SETRANGE("Product Category",saccoAccount1."Product Category"::"Deposit Contribution");
                            if SaccoAccount1.Find('-') then begin
                                LoanGuarantors.Reset;
                                LoanGuarantors.SetRange("Loan No", MsaccoLoans."Loan No");
                                LoanGuarantors.SetRange("Member No", SaccoAccount1."Member No.");
                                if LoanGuarantors.Find('-') then begin
                                    //MESSAGE('4');
                                    MsaccoGuarantors.Posted := true;
                                    MsaccoGuarantors.Modify();
                                end else begin
                                    SaccoAccount1.CalcFields(SaccoAccount1.Balance);
                                    LoanGuarantors.Init;
                                    LoanGuarantors."Loan No" := Loans."Loan No.";
                                    LoanGuarantors."Savings Account No./Member No." := GetDepoAcc(SaccoAccount1."Member No.");
                                    LoanGuarantors.Name := SaccoAccount1.Name;
                                    LoanGuarantors."Deposits/Shares" := GetDepoBal(SaccoAccount1."Member No.");
                                    LoanGuarantors."Amount Guaranteed" := GetDepoBal(SaccoAccount1."Member No.");
                                    ;//SaccoAccount1.Balance;//ROUND(MsaccoLoans."Requested Amount"/2,1,'>');
                                    LoanGuarantors."Account No." := SaccoAccount1."Member No.";
                                    LoanGuarantors."Member Guaranteed" := Loans."Member No.";
                                    LoanGuarantors."Member No" := SaccoAccount1."Member No.";
                                    LoanGuarantors."Staff/Payroll No." := SaccoAccount1."Payroll/Staff No.";
                                    LoanGuarantors."Loan Type" := Loans."Loan Product Type";
                                    LoanGuarantors."Loanee Name" := Loans."Member Name";
                                    LoanGuarantors."Guarantor Type" := LoanGuarantors."guarantor type"::Guarantor;
                                    LoanGuarantors.Insert;
                                    MsaccoGuarantors.Posted := true;
                                    MsaccoGuarantors.Modify();
                                end;
                            end;
                        end;
                    end;


                end;

                Evaluate(LEntry, MsaccoGuarantors."Msacco Loans Entry No");
                MsaccoLoans.Reset;
                MsaccoLoans.SetRange("Entry no", LEntry);
                if MsaccoLoans.Find('-') then begin

                    //Emergency Loan
                    Loans.Reset;
                    //Loans.SETRANGE(Status,Loans.Status::Approved);
                    Loans.SetRange("Loan No.", MsaccoLoans."Loan No");
                    //Loans.SETRANGE("Picked Mobile Loan",TRUE);
                    //Loans.SETRANGE("Loan Product Type",'112');
                    //Loans.SETRANGE(Posted,TRUE);
                    if Loans.Find('-') then begin
                        saccoAccount.Reset;
                        saccoAccount.SetRange("Member No.", Loans."Member No.");
                        if saccoAccount.Find('-') then begin
                            SaccoAccount1.Reset;
                            SaccoAccount1.SetRange("Transactional Mobile No", MsaccoGuarantors."Guarontor Telephone No");
                            //saccoAccount1.SETRANGE("Product Category",saccoAccount1."Product Category"::"Deposit Contribution");
                            if SaccoAccount1.Find('-') then begin
                                LoanGuarantors.Reset;
                                LoanGuarantors.SetRange("Loan No", MsaccoLoans."Loan No");
                                LoanGuarantors.SetRange("Member No", SaccoAccount1."Member No.");
                                if LoanGuarantors.Find('-') then begin
                                    //MESSAGE('4');
                                    MsaccoGuarantors.Posted := true;
                                    MsaccoGuarantors.Modify();
                                end else begin
                                    SaccoAccount1.CalcFields(SaccoAccount1.Balance);
                                    LoanGuarantors.Init;
                                    LoanGuarantors."Loan No" := Loans."Loan No.";
                                    LoanGuarantors."Savings Account No./Member No." := GetDepoAcc(SaccoAccount1."Member No.");
                                    LoanGuarantors.Name := SaccoAccount1.Name;
                                    LoanGuarantors."Deposits/Shares" := GetDepoBal(SaccoAccount1."Member No.");
                                    LoanGuarantors."Amount Guaranteed" := GetDepoBal(SaccoAccount1."Member No.");//SaccoAccount1.Balance;//ROUND(MsaccoLoans."Requested Amount"/2,1,'>');
                                    LoanGuarantors."Account No." := SaccoAccount1."Member No.";
                                    LoanGuarantors."Member Guaranteed" := Loans."Member No.";
                                    LoanGuarantors."Member No" := SaccoAccount1."Member No.";
                                    LoanGuarantors."Staff/Payroll No." := SaccoAccount1."Payroll/Staff No.";
                                    LoanGuarantors."Loan Type" := Loans."Loan Product Type";
                                    LoanGuarantors."Loanee Name" := Loans."Member Name";
                                    LoanGuarantors."Guarantor Type" := LoanGuarantors."guarantor type"::Guarantor;
                                    LoanGuarantors.Insert;
                                    MsaccoGuarantors.Posted := true;
                                    MsaccoGuarantors.Modify();
                                end;
                            end;
                        end;
                    end;


                end;

            until MsaccoGuarantors.Next = 0;
    end;

    local procedure GetDepoAcc(MemberNo: Text) Response: Text
    var
        savAccData: Record 52185730;
    begin

        savAccData.Reset;
        savAccData.SetRange("Member No.", MemberNo);
        savAccData.SetRange("Product Category", SaccoAccount1."product category"::"Deposit Contribution");
        if savAccData.FindFirst() then begin
            Response := savAccData."No.";
        end;
    end;

    local procedure GetDepoBal(MemberNo: Text) Response: Decimal
    var
        savAccData: Record 52185730;
    begin

        savAccData.Reset;
        savAccData.SetRange("Member No.", MemberNo);
        savAccData.SetRange("Product Category", SaccoAccount1."product category"::"Deposit Contribution");
        if savAccData.FindFirst() then begin
            savAccData.CalcFields(savAccData.Balance);
            Response := savAccData.Balance;
        end;
    end;


    procedure GetExciseDuty() excise: Decimal
    begin
        GenLedgerSetup.Reset;
        GenLedgerSetup.Get;
        GenLedgerSetup.TestField(GenLedgerSetup."Excise Duty (%)");
        excise := GenLedgerSetup."Excise Duty (%)";
    end;


    procedure GetPremiumRegAccount(RegMemberNo: Text[30]) RegAccount: Text[200]
    begin
        SaccoAccount1.Reset;
        SaccoAccount1.SetRange(SaccoAccount1."Member No.", RegMemberNo);
        SaccoAccount1.SetFilter(SaccoAccount1.Status, '%1|%2', SaccoAccount1.Status::Active, SaccoAccount1.Status::New);
        SaccoAccount1.SetFilter(SaccoAccount1."Product Type", '%1', '06');
        SaccoAccount1.SetRange(SaccoAccount1.Blocked, SaccoAccount1.Blocked::" ");
        if SaccoAccount1.FindFirst() then begin
            RegAccount := SaccoAccount1."No.";
        end
    end;

    local procedure AdviceCheckOff(LoanNumber: Text)
    var
        LoansTable: Record 52185729;
    begin
        if LoansTable.Get(LoanNumber) then begin
            LoansTable.Validate(Repayment);
        end;
    end;


    procedure GetAvailableBalance(Account: Text[30]) AccountBal: Decimal
    begin
        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."No.", Account);
        //saccoAccount.SETRANGE(saccoAccount."Product Type",'505');
        if saccoAccount.Find('-') then begin
            saccoAccount.CalcFields(saccoAccount."Balance (LCY)");
            AccountBal := saccoAccount."Balance (LCY)";
        end
        else begin
            AccountBal := 0;
        end
    end;


    procedure GetPremierRegFee(FromAccount: Text[30]; ToAccount: Text[30]; DocNo: Text) Response: Integer
    var
        RegfeeAmount: Decimal;
    begin
        Response := 1;
        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
        GenJournalLine.SetRange("Journal Batch Name", 'MPESA-OL');
        GenJournalLine.DeleteAll;

        SaccoAccount1.Reset;
        SaccoAccount1.SetRange(SaccoAccount1.Blocked, SaccoAccount1.Blocked::" ");
        //saccoAccount.SETRANGE(saccoAccount.Status,saccoAccount.Status::Active);
        SaccoAccount1.SetFilter(SaccoAccount1.Status, '%1|%2', SaccoAccount1.Status::Active, SaccoAccount1.Status::New);
        SaccoAccount1.SetRange(SaccoAccount1."No.", ToAccount);
        if SaccoAccount1.Find('-') then begin
            //SaccoAccount1.CALCFIELDS(SaccoAccount1."Balance (LCY)");
            //RegfeeAmount:=1000-SaccoAccount1."Balance (LCY)";
        end;


        RegfeeAmount := 1000 - GetAvailableBalance(ToAccount);

        if RegfeeAmount > SaccoAccount1."Balance (LCY)" then begin
            RegfeeAmount := SaccoAccount1."Balance (LCY)";
        end;

        //Cr Member
        LineNo := LineNo + 10000;
        GenJournalLine.Init;
        GenJournalLine."Journal Template Name" := 'MSACCO';
        GenJournalLine."Journal Batch Name" := 'MPESA-OL';
        GenJournalLine."Line No." := LineNo;
        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
        GenJournalLine."Account No." := ToAccount;
        GenJournalLine.Validate(GenJournalLine."Account No.");
        GenJournalLine."Document No." := DocNo;
        GenJournalLine."External Document No." := 'MPESA-DPT';
        GenJournalLine."Posting Date" := Today;
        GenJournalLine.Description := 'Premier Registration Fee';
        GenJournalLine.Amount := RegfeeAmount;
        GenJournalLine.Validate(GenJournalLine.Amount);
        GenJournalLine."Shortcut Dimension 1 Code" := SaccoAccount1."Global Dimension 1 Code";
        GenJournalLine."Shortcut Dimension 2 Code" := SaccoAccount1."Global Dimension 2 Code";
        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
        if GenJournalLine.Amount <> 0 then
            GenJournalLine.Insert;

        //Cr CoreTEC
        LineNo := LineNo + 10000;
        GenJournalLine.Init;
        GenJournalLine."Journal Template Name" := 'MSACCO';
        GenJournalLine."Journal Batch Name" := 'MPESA-OL';
        GenJournalLine."Line No." := LineNo;
        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
        GenJournalLine."Account No." := FromAccount;
        GenJournalLine.Validate(GenJournalLine."Account No.");
        GenJournalLine."Document No." := DocNo;
        GenJournalLine."Posting Date" := Today;
        GenJournalLine.Description := 'Transfer to Premier Registration Fee';
        GenJournalLine.Amount := RegfeeAmount * -1;
        GenJournalLine.Validate(GenJournalLine.Amount);
        GenJournalLine."Shortcut Dimension 1 Code" := SaccoAccount1."Global Dimension 1 Code";
        GenJournalLine."Shortcut Dimension 2 Code" := SaccoAccount1."Global Dimension 2 Code";
        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
        if GenJournalLine.Amount <> 0 then
            GenJournalLine.Insert;

        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
        GenJournalLine.SetRange("Journal Batch Name", 'MPESA-OL');
        if GenJournalLine.Find('-') then begin
            repeat
                // GLPosting.Run(GenJournalLine);
            until GenJournalLine.Next = 0;
        end;
        Response := 0;
        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
        GenJournalLine.SetRange("Journal Batch Name", 'MPESA-OL');
        GenJournalLine.DeleteAll;
    end;

    local procedure CheckMboostaSpecial(MemNo: Text) Response: Boolean
    begin
        MemberTable.Reset;
        MemberTable.SetRange("No.", MemNo);
        if MemberTable.FindFirst() then begin
            if MemberTable."MBoosta Special" = true then begin
                Response := MemberTable."MBoosta Special";
            end else begin
                Response := false;
            end
        end else begin
            Response := false;
        end;
    end;

    local procedure CheckMboostaSpecialLimit(MemNo: Text) Response: Decimal
    begin
        MemberTable.Reset;
        MemberTable.SetRange("No.", MemNo);
        if MemberTable.FindFirst() then begin
            if MemberTable."MBoosta Special" = true then begin
                Response := MemberTable."MBoosta Limit";
            end else begin
                Response := 0;
            end
        end else begin
            Response := 0;
        end;
    end;


    procedure AppraiseGuarantors(Phone: Text) IsQualified: Text
    var
        CountNoGua: Integer;
    begin

        Phone := '+' + Phone;
        saccoAccount.Reset;
        saccoAccount.SetRange("Transactional Mobile No", Phone);
        if saccoAccount.Find('-') then begin
            SaccoAccount1.Reset;
            SaccoAccount1.SetRange("Member No.", saccoAccount."Member No.");
            SaccoAccount1.SetRange("Product Type", '02');
            if SaccoAccount1.Find('-') then begin
                SaccoAccount1.CalcFields("Balance (LCY)");
                if SaccoAccount1."Balance (LCY)" < 9000 then begin
                    IsQualified := '1|Cant guarantee this loan';
                    exit;

                    if (SaccoAccount1.Status <> SaccoAccount1.Status::Active) and (SaccoAccount1.Status <> SaccoAccount1.Status::New) and (SaccoAccount1.Blocked <> SaccoAccount1.Blocked::" ") then
                        IsQualified := '1|Cant guarantee this loan';
                    exit;
                end;

                CountNoGua := 0;
                MsaccoGuarantors.Reset;
                MsaccoGuarantors.SetRange("Guarontor Telephone No", Phone);
                MsaccoGuarantors.SetFilter("Loan No", '%1', '');
                if MsaccoGuarantors.Find('-') then begin
                    repeat
                        if FindLoan(Phone, MsaccoGuarantors."Msacco Loans Entry No") = false then
                            CountNoGua += 1;
                        if CountNoGua > 10 then begin
                            IsQualified := '1|Cant guarantee this loan maximum of 10 reached you have' + Format(CountNoGua);
                            exit;
                        end;
                    until MsaccoGuarantors.Next = 0;
                end;

                Loans.Reset;
                Loans.SetRange("Member No.", SaccoAccount1."Member No.");
                Loans.SetFilter(Loans."Loans Category-SASRA", '<>%1&<>%2', Loans."loans category-sasra"::Perfoming, Loans."loans category-sasra"::Watch);
                if Loans.Find('-') then begin
                    IsQualified := '1|Cant guarantee this loan';

                    exit;
                end;

                IsQualified := '0|Ok';
            end;

        end
        else begin
            IsQualified := '1|Phone Not registered on MSacco';
        end;
    end;


    procedure GetCurrentEmail(phoneNo: Text) Email: Text
    var
        EmailUpdateRequests: Record 52186142;
    begin
        saccoAccount.Reset;
        saccoAccount.SetRange("Transactional Mobile No", '+' + phoneNo);
        if saccoAccount.Find('-') then begin
            EmailUpdateRequests.Reset;
            EmailUpdateRequests.SetRange("Member No", saccoAccount."Member No.");
            if EmailUpdateRequests.Find('+') then begin
                Email := EmailUpdateRequests.Email;
            end
            else begin
                MemberTable.Reset;
                MemberTable.SetRange("No.", saccoAccount."Member No.");
                if MemberTable.Find('-') then begin
                    Email := MemberTable."E-Mail";
                end;
            end;
        end;
    end;


    procedure UpdateEmail(phoneNo: Text; newEmail: Text)
    var
        EmailUpdateRequests: Record 52186142;
    begin
        saccoAccount.Reset;
        saccoAccount.SetRange("Transactional Mobile No", '+' + phoneNo);
        if saccoAccount.Find('-') then begin
            EmailUpdateRequests.Reset;
            EmailUpdateRequests.SetRange("Member No", saccoAccount."Member No.");
            EmailUpdateRequests.SetRange(Email, newEmail);
            EmailUpdateRequests.SetRange(Posted, false);
            if EmailUpdateRequests.Find('-') then begin
            end
            else begin
                EmailUpdateRequests.Init;
                EmailUpdateRequests."Member No" := saccoAccount."Member No.";
                EmailUpdateRequests.Email := newEmail;
                EmailUpdateRequests.Insert();
            end;

        end;
    end;


    procedure RequestStatement("phone No": Text; Type: Text)
    var
        email: Text;
        EmailUpdateRequests: Record 52186142;
        StatementRequests: Record 52186144;
    begin
        saccoAccount.Reset;
        saccoAccount.SetRange("Transactional Mobile No", '+' + "phone No");
        if saccoAccount.Find('-') then begin
            EmailUpdateRequests.Reset;
            EmailUpdateRequests.SetRange("Member No", saccoAccount."Member No.");
            if EmailUpdateRequests.Find('+') then begin
                email := EmailUpdateRequests.Email;
            end
            else begin
                MemberTable.Reset;
                MemberTable.SetRange("No.", saccoAccount."Member No.");
                if MemberTable.Find('-') then begin
                    if MemberTable."E-Mail" <> '' then begin
                        email := MemberTable."E-Mail"
                    end;
                end;
            end;


            StatementRequests.Init;
            StatementRequests."Member No" := saccoAccount."Member No.";
            StatementRequests."Email Address" := email;
            StatementRequests.Posted := false;
            StatementRequests.Skipped := false;
            StatementRequests."Date Requested" := Today;
            if Type = 'BOSA' then
                StatementRequests."FOSA/BOSA" := StatementRequests."fosa/bosa"::BOSA
            else
                StatementRequests."FOSA/BOSA" := StatementRequests."fosa/bosa"::FOSA;
            StatementRequests.Insert();
        end;
    end;


    procedure EmailRequestedStatement()
    var
        Member: Record 52185700;
        // SMTPSetup: Record "SMTP Mail Setup";
        Filename: Text[150];
        // SMTPMail: Codeunit 400;
        StatementRequests: Record 52186144;
        FileLocation: label 'D:\Users\Administrator\Documents\PDFS\Statements';
        Sav: Record 52185730;
        ProductFactory: Record 52185690;
        PF: Record 52185690;
        // SavingsStatement: Report 52185631;
        GSetUp: Record 52185689;
    begin
        GSetUp.Get;
        GSetUp.TestField("Statement Limit Period");
        StatementRequests.Reset;
        StatementRequests.SetRange(Posted, false);
        StatementRequests.SetFilter("Email Address", '<>%1', '');
        StatementRequests.SetRange(Skipped, false);
        if StatementRequests.FindLast then
            repeat

                Filename := FileLocation;
                // if Exists(Filename) then
                //     Erase(Filename);

                Member.Reset;
                Member.SetRange("No.", StatementRequests."Member No");
                Member.SetRange("Date Filter", CalcDate('-' + Format(GenSetUp."Statement Limit Period"), Today), Today);
                if Member.FindFirst then begin
                    //SendEmail(

                    case StatementRequests."FOSA/BOSA" of
                        StatementRequests."fosa/bosa"::BOSA:
                            begin

                                // Report.SaveAsPdf(52018510, Filename, Member);
                                // MESSAGE(FORMAT(StatementRequests."Entry No")+'new');
                                // SendEmail(StatementRequests);
                                SendEmail(StatementRequests, Member, Filename);

                            end;
                        StatementRequests."fosa/bosa"::FOSA:
                            begin
                                ProductFactory.Reset;
                                ProductFactory.SetRange("Product Class Type", ProductFactory."product class type"::Savings);
                                ProductFactory.SetRange("Allow Send Email", true);
                                ProductFactory.FindFirst;
                                PF.Reset;
                                PF.SetRange("Product Class Type", PF."product class type"::Savings);
                                PF.SetRange("Allow Send Email", true);
                                PF.FindLast;

                                Sav.Reset;
                                Sav.SetRange("Member No.", Member."No.");
                                Sav.SetRange("Product Type", ProductFactory."Product ID", PF."Product ID");
                                Sav.SetRange("Date Filter", CalcDate('-' + Format(GenSetUp."Statement Limit Period"), Today), Today);
                                if Sav.FindFirst then begin
                                    //SavingsStatement.SAVEASPDF()
                                    // Report.SaveAsPdf(39004257, Filename, Sav);
                                    SendEmail(StatementRequests, Member, Filename);
                                end else begin
                                    StatementRequests.Skipped := true;
                                    StatementRequests.Modify;
                                end;
                            end;
                    end;

                    StatementRequests.Posted := true;
                    StatementRequests.Modify;
                end
                else begin
                    StatementRequests.Skipped := true;
                    StatementRequests.Modify;
                end;
            until StatementRequests.Next = 0;
    end;

    local procedure SendEmail(StatementRequests: Record 52186144; Member: Record 52185700; FileName: Text[100])
    var
        // SMTPSetup: Record "SMTP Mail Setup";
        // SMTPMail: Codeunit 400;
        MailBodyText: label 'Dear <b>%1</b>, <br><br> Thank you for your continued patronage of Harambee Sacco Society Limited.<br><br>Your e-Statement is attached and is ready for viewing. You can save, view and print it at your own convenience.<br>You can also access our services through the <a href='' https://hcs-webportal.harambeesacco.com/''>Web portal.</a>';
        MailBodyText2: label '<br><br>Kindly note this is an automated delivery system; do not reply to this email address.';
        MailBodyText3: label '<br><br>For any queries, kindly contact Customer Service on Phone Number: 0709 943000<br>';
        MailBodyText4: label 'Email:info@harambeesacco.com<br><br>';
        MailBodyText5: label 'Best Regards,<br><b>Harambee Sacco Society Ltd';
    begin
        // SMTPSetup.Get;
        // SMTPMail.CreateMessage(SMTPSetup."Email Sender Name", SMTPSetup."Email Sender Address", StatementRequests."Email Address", Format(StatementRequests."FOSA/BOSA") + ' Statement', '', true);
        // SMTPMail.AppendBody(MailBodyText);
        // SMTPMail.AppendBody(MailBodyText2);
        // SMTPMail.AppendBody(MailBodyText3);
        // SMTPMail.AppendBody(MailBodyText4);
        // SMTPMail.AppendBody(MailBodyText5);
        // SMTPMail.AddAttachment(FileName, FileName);
        // SMTPMail.Send;
        // Message(FileName);
        // if Exists(FileName) then
        //     Erase(FileName);
        /*
        Member.RESET;
        Member.SETRANGE("No.",Members."No.");
        Member.SETFILTER("Date Filter",Members.GETFILTER("Date Filter"));
        IF Member.FIND('-') THEN BEGIN
        
        IF EXISTS(Filename) THEN
        ERASE(Filename);
        
        SMTPSetup.GET;
        
        Filename:= 'C:\Users\Member Statement\'+'Member Statement.pdf';
        REPORT.SAVEASPDF(REPORT::"Member Statement-Email",Filename,Member);
        
        SMTPMail.CreateMessage(SMTPSetup."Email Sender Name",SMTPSetup."Email Sender Address","E-Mail",'Member Statement','',TRUE);
        SMTPMail.AppendBody('<br><br>');
        SMTPMail.AppendBody('Dear Member,');
        SMTPMail.AppendBody('<br><br>');
        SMTPMail.AppendBody('Attached please find your statement.');
        SMTPMail.AppendBody('<br><br>');
        SMTPMail.AppendBody('You can also access our services through Web portal, Mobile App(MSACCO+) and M-SACCO Banking services.');
        SMTPMail.AppendBody('<br>');
        SMTPMail.AppendBody('For more details, please visit our website at www.ushurusacco.com. <br> You can also follow our facebook page www.facebook.com/ushurusacco,'+
        ' twitter www.twitter.com/ushurusacco');
        SMTPMail.AppendBody('<br><br>');
        SMTPMail.AppendBody('Thanks & Regards');
        SMTPMail.AppendBody('<br><br>');
        SMTPMail.AppendBody('*****************************.');
        SMTPMail.AppendBody('<br><br>');
        SMTPMail.AppendBody(SMTPSetup."Email Sender Name");
        SMTPMail.AppendBody('<br>');
        SMTPMail.AppendBody('Huduma Maradufu.');
        SMTPMail.AppendBody('<br><br>');
        SMTPMail.AppendBody('<HR>');
        SMTPMail.AppendBody('This is a system generated mail.For any complains/ compliments call 020-2719660.');
        SMTPMail.AddAttachment('C:\Users\Member Statement\'+'Member Statement.pdf',Filename);
        
        SMTPMail.Send;
        
        IF EXISTS(Filename) THEN
        ERASE(Filename);
        END;
        */

    end;


    procedure RevenueCollection(Date: Date; Type: Option " ","M-sacco","Instant Loan",Agency) Amount: Decimal
    var
        GLEntry: Record "G/L Entry";
        DetailedVendorLedgEntry: Record "Detailed Vendor Ledg. Entry";
        RevenueCollection: Record 52186132;
    begin
        RevenueCollection.Reset;
        RevenueCollection.SetRange(Type, Type);
        if RevenueCollection.FindFirst then begin
            case RevenueCollection."Account Type" of
                RevenueCollection."account type"::"G/L Account":
                    begin
                        //Get G\L ===========================
                        RevenueCollection.TestField("Account No");
                        GLEntry.Reset;
                        GLEntry.SetRange("Posting Date", Date);
                        GLEntry.SetRange("G/L Account No.", RevenueCollection."Account No");
                        if GLEntry.Find('-') then begin
                            GLEntry.CalcSums("Credit Amount");
                            Amount := GLEntry."Credit Amount";
                        end;
                    end;
                RevenueCollection."account type"::Vendor:
                    begin
                        //Vendor ==========================
                        RevenueCollection.TestField("Account No");
                        DetailedVendorLedgEntry.Reset;
                        DetailedVendorLedgEntry.SetRange("Vendor No.", RevenueCollection."Account No");
                        DetailedVendorLedgEntry.SetRange("Posting Date", Date);
                        DetailedVendorLedgEntry.SetFilter("Document Type", '%1', DetailedVendorLedgEntry."document type"::" ");
                        DetailedVendorLedgEntry.SetFilter("Source Code", '%1', '');
                        if DetailedVendorLedgEntry.Find('-') then begin
                            DetailedVendorLedgEntry.CalcSums("Credit Amount");
                            Amount := DetailedVendorLedgEntry."Credit Amount";
                        end;
                    end;
            end;
        end;
        //MESSAGE('%1',Amount);
    end;

    local procedure Test()
    begin
        Venderdetails.Reset;
        Venderdetails.SetRange("Customer No.", '020123235');
        Venderdetails.SetFilter("Posting Date", '>=%1&<=%2', CalcDate('<-CM>', Today), CalcDate('<CM>', Today));
        Venderdetails.SetFilter(Description, '*Contribution*');
        Venderdetails.CalcSums(Amount);
        if Abs(Venderdetails.Amount) > 2000 then begin
            Venderdetails.Reset;
            Venderdetails.SetRange("Customer No.", '020123235');
            Venderdetails.SetFilter(Description, '*Contribution*');
            Venderdetails.SetFilter("Posting Date", '>=%1&<=%2', CalcDate('<-CM>', CalcDate('-1M', Today)), CalcDate('<CM>', CalcDate('-1M', Today)));
            Venderdetails.CalcSums(Amount);
            if Abs(Venderdetails.Amount) > 2000 then
                Message(Format(Venderdetails.Amount))
            else begin
                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'You dont qualify for this ' +
           'Loan as your contributions have not been consistent in the last two months', '', saccoAccount."No.", false);
                MsaccoLoans.Posted := true;
                MsaccoLoans.Remarks := 'Iconsistent Contributions';
                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                MsaccoLoans.Modify;
                exit;
            end;
        end
        else begin
            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'You dont qualify for this ' +
           'Loan as your contributions have not been consistent in the last two months', '', saccoAccount."No.", false);
            MsaccoLoans.Posted := true;
            MsaccoLoans.Remarks := 'Iconsistent Contributions';
            MsaccoLoans.Status := MsaccoLoans.Status::Failed;
            MsaccoLoans.Modify;
            exit;
        end;
        //continue from here
        Message('iko sawa');
    end;


    procedure PostMobileLoan(LoanNo: Code[20]; DocNo: Code[20])
    var
        Loans: Record 52185729;
        CreditAccounts: Record 52185731;
        BillAmount: Decimal;
        SavingsAc: Record 52185730;
        AccountNo: Code[20];
        InterestAmount: Decimal;
        LoanOverpayment: Decimal;
        Text001: label 'Your Loan Repayment was successful. Your new %1 bal is %2';
        Response: Integer;
        AmountDed: Decimal;
        GLEntry: Record "G/L Entry";
    begin
        //..Get Setups

        Response := 1;
        Continue := true;
        MPESATRANS.Reset;
        MPESATRANS.SetRange(MPESATRANS."Document No.", DocNo);
        if MPESATRANS.Find('-') then begin
            DocumentNo := DocNo;
            // prevent double posting
            //MESSAGE(MPESATRANS1."Document No.");
            Venderdetails.Reset;
            Venderdetails.SetRange(Venderdetails."Document No.", MPESATRANS."Document No.");
            //Venderdetails.SETFILTER(Venderdetails.Reversed,'=%1',FALSE);
            if Venderdetails.Find('-') then begin
                Response := 0;
                MPESATRANS."Date Posted" := Today;
                MPESATRANS."Time Posted" := Time;
                MPESATRANS.Posted := true;
                MPESATRANS.Messages := 'Double Posting';
                MPESATRANS.Modify;
                Commit;
                Continue := false;

                ///EXIT;

            end;

            //Second Control
            GLEntry.Reset;
            GLEntry.SetRange("Document No.", DocumentNo);
            if GLEntry.Find('-') then begin
                Continue := false;
                MPESATRANS."Date Posted" := Today;
                MPESATRANS."Time Posted" := Time;
                MPESATRANS.Posted := true;
                MPESATRANS.Messages := 'Mark Posted';
                MPESATRANS.Modify;
                Commit;

            end;

            RunBal := Abs(MPESATRANS.Amount);


            //Get Paybill Bank Account
            MsaccoChargesSetup.Reset;
            MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'PAYBILLBANK');
            if MsaccoChargesSetup.Find('-') then begin
                MsaccoChargesSetup.TestField(MsaccoChargesSetup."Bank Account No");
                MPESAPaybill := MsaccoChargesSetup."Bank Account No";
            end;

            //Get Coretec Vendor Account and Charge Amount
            MsaccoChargesSetup.Reset;
            MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
            if MsaccoChargesSetup.Find('-') then begin
                MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
                Msaccocharge := MsaccoChargesSetup.ChargeAmount;
                Msaccoacc := MsaccoChargesSetup."Vendor No";
            end;

            //Clear Journaal__+++++++++++++++++++++++++++++++++++++
            AmountDed := RunBal;//-Msaccocharge;

            JournalPost.ClearJournalLines('MSACCO', 'MSACCOLN');

            //Get the Loan No and Loan Account+++++++++++++++++++++++++++++
            Loans.Reset;
            Loans.SetRange(Loans."Loan No.", LoanNo);
            Loans.SetFilter("Outstanding Balance", '>0');
            if Loans.Find('-') then begin
                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", Loans."Outstanding Bills");
                Interest := Loans."Outstanding Interest";

                if Interest > 0 then begin
                    InterestAmount := 0;
                    if AmountDed > Interest then begin
                        InterestAmount := Interest
                    end else begin
                        InterestAmount := AmountDed;
                    end;
                end;
                //Get Savings Accounts++++++++++++++++++++++++++++++++++++++++++
                saccoAccount.Reset;
                saccoAccount.SetRange("Member No.", Loans."Member No.");
                saccoAccount.SetRange("Loan Disbursement Account", true);
                if saccoAccount.FindFirst then begin
                    AccountNo := saccoAccount."No.";
                end;


                // Dr Bank Paybill Account++++++++++++++++++++++++++++++++++
                LineNo := LineNo + 10000;
                JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::"Bank Account", DocumentNo, MPESATRANS.Description, Abs(RunBal)
                , MPESAPaybill, Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);


                //Credit FOSA++++++++++++++++++++++++++++++++++++++++++++++
                LineNo := LineNo + 10000;
                JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Savings, DocumentNo, MPESATRANS.Description, RunBal * -1
                , AccountNo, Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);


                // Cr Member Loan Account - Interest Repayment++++++++++++++++++
                LineNo := LineNo + 10000;
                JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Credit, DocumentNo, 'MSacco Interest Repayment', -InterestAmount
                , Loans."Loan Account", Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                Optiontransactiontypes::"Interest Paid",
                LoanNo, '', '', 0, '', 0);

                //Debit Fosa++++++++++++++++
                LineNo := LineNo + 10000;
                JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Savings, DocumentNo, 'MSacco Interest Repayment', InterestAmount
                , AccountNo, Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                Optiontransactiontypes::" ",
                LoanNo, '', '', 0, '', 0);
                //Loanno

                AmountDed -= InterestAmount;

                if AmountDed > 0 then begin
                    LoanOverpayment := 0;
                    if AmountDed > Loans."Outstanding Balance" then begin
                        if Loans."Outstanding Balance" >= 0 then begin
                            LoanOverpayment := RunBal - Loans."Outstanding Balance";
                        end else
                            if Loans."Outstanding Balance" < 0 then begin
                                LoanOverpayment := AmountDed;
                            end;
                        AmountDed := AmountDed - LoanOverpayment;
                    end;

                    // Cr Member Loan Account - Principal Loan Repayment+++++++++
                    LineNo := LineNo + 10000;
                    JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Credit, DocumentNo, 'MSacco Loan Repayment', -AmountDed
                    , Loans."Loan Account", Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::Repayment, LoanNo, '', '', 0, '', 0);

                    // Dr Member Fosa Account - Principal Loan Repayment+++++++++
                    LineNo := LineNo + 10000;
                    JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Savings, DocumentNo, 'MSacco Loan Repayment', AmountDed
                    , AccountNo, Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code",
                    saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", LoanNo, '', '', 0, '', 0);


                    // Bills clear
                    if Loans."Outstanding Bills" > 0 then begin
                        if Loans."Outstanding Bills" > RunBal then begin
                            BillAmount := -AmountDed;
                        end else begin
                            BillAmount := -Loans."Outstanding Bills";
                        end;
                        LineNo := LineNo + 10000;
                        JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Credit, DocumentNo, 'Bills' + Loans."Loan No.", BillAmount
                        , Loans."Loan Account", Today, Optionsaccounts::"G/L Account", '107001', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::Bills, LoanNo, '', '', 0, '', 0);
                    end;

                    // Dr Member Loanrepayment SMS charge+++++++++++++++++++++++++
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Savings, DocumentNo, 'Loan Repayment Charge', Msaccocharge
                    , AccountNo, Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    // Cr Coretec ++++++++++++++++++++++++++++++++++++++++++++++++
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Vendor, DocumentNo, 'MSacco Loan Repayment Charges', Msaccocharge * -1
                    , Msaccoacc, Today, Optionsaccounts::"G/L Account", '', saccoAccount."No.", saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                end;
            end;
            if Continue = true then begin

                // Complete Journal Posting

                JournalPost.LinesCompletePosting('MSACCO', 'MSACCOLN');

                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");

                Sendsms.SendSms(Optionsms::MSACCO
                , saccoAccount."Transactional Mobile No"
                , StrSubstNo(Text001, Loans."Loan Product Type Name", Format(Loans."Outstanding Balance" + Loans."Outstanding Interest"))
                //,'Your Loan Repayment was sucessful. Your new '+ Loans."Loan Product Type Name" + ' bal is ' +FORMAT(Loans."Outstanding Balance"+ Loans."Outstanding Interest")
                , DocumentNo, saccoAccount."No.", false);

                MsaccoTransactions.Reset;
                if MsaccoTransactions.Find('+') then begin
                    MsaccoTransactions.Init;
                    MsaccoTransactions."Entry No" := MsaccoTransactions."Entry No" + 1;
                end;


                MsaccoTransactions."Document No." := LoanNo;
                MsaccoTransactions.Description := 'MSacco loan repayment sms Charges';
                MsaccoTransactions."Transaction Date" := Today;
                MsaccoTransactions."Account No." := AccountNo;
                MsaccoTransactions.Amount := 10;
                MsaccoTransactions.Posted := true;
                MsaccoTransactions."Transaction Type" := MsaccoTransactions."transaction type"::"Loan Repayment";
                MsaccoTransactions."Transaction Time" := Time;
                MsaccoTransactions."Loan Amount" := RunBal;
                MsaccoTransactions.Insert;

                //Advice Loan++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                AdviceCheckOff(Loans."Loan No.");
                //MPESATRANS."Needs Change":=FALSE;
                MPESATRANS."Date Posted" := Today;
                MPESATRANS."Time Posted" := Time;
                MPESATRANS.Posted := true;
                MPESATRANS.Messages := ' Succesful';
                MPESATRANS.Modify;
                Commit;
                Response := 0;
            end;

        end;
    end;


    procedure GetSaccoBranches() Branch: Text[250]
    var
        DimensionValue: Record "Dimension Value";
    begin
        DimensionValue.Reset;
        DimensionValue.SetRange("Global Dimension No.", 2);
        if DimensionValue.FindFirst then begin
            repeat
                Branch := Branch + DimensionValue.Name + '~';
            until DimensionValue.Next = 0;
        end;
    end;


    procedure PostDividendLoan()
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
        DivCharge: Decimal;
    begin
        MsaccoChargesSetup.Reset;
        MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
        if MsaccoChargesSetup.Find('-') then begin
            MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
            Msaccocharge := MsaccoChargesSetup.ChargeAmount;
            Msaccoacc := MsaccoChargesSetup."Vendor No";
        end;
        LoanProcessingGL := '301028';
        MsaccoLoans.Reset;
        MsaccoLoans.SetRange(MsaccoLoans.Status, MsaccoLoans.Status::Pending);
        MsaccoLoans.SetRange(MsaccoLoans."Loan Product Type", MsaccoLoans."loan product type"::"Dividend Loan");
        MsaccoLoans.SetRange(MsaccoLoans."Loan Code", '136');
        MsaccoLoans.SetRange(MsaccoLoans.Posted, false);
        if MsaccoLoans.Find('-') then begin
            repeat
                ContinueMB := true;

                saccoAccount.Reset;
                saccoAccount.SetRange(saccoAccount."No.", MsaccoLoans."Account No");
                if saccoAccount.Find('-') then begin
                    //CHECK SALARY
                    SaccoMemberNo := saccoAccount."Member No.";
                    if ProdFac.Get('136') then begin
                        if ContinueMB = true then begin
                            //Prevent Double Posting
                            Venderdetails.Reset;
                            Venderdetails.SetRange(Venderdetails."Document No.", MsaccoLoans.DocumentNo);
                            Venderdetails.SetRange("Customer No.", MsaccoLoans."Account No");
                            Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
                            if Venderdetails.Find('-') then begin
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                                MsaccoLoans.Remarks := 'Successful';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your Dividend Advance Loan of KES' +
                                      Format(MsaccoLoans."Requested Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO.', '', saccoAccount."No.", false);
                                ContinueMB := false;
                            end;
                        end;
                        //***check if member has existing Salary In Advance Loan
                        if ContinueMB = true then begin
                            Loans.Reset;
                            Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                            Loans.SetRange(Posted, true);
                            Loans.SetRange(Loans."Loan Product Type", ProdFac."Product ID");
                            if Loans.Find('-') then begin
                                repeat
                                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                                    DivCharge := MsaccoLoans."Requested Amount" * (ProdFac."Interest Rate (Max.)" / 100);
                                    if Loans."Outstanding Balance" + (1500 + DivCharge) > (MsaccoLoans."Requested Amount") then begin
                                        Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name
                                        + ', your Dividend Loan request has been rejected. Reason: Outstanding loan is greater than appplied amount, Kindly apply ' +
                                        'the maximum limit indicated by the system instead. Thank you.', ''
                                        , saccoAccount."No.", false);
                                        MsaccoLoans.Posted := true;
                                        MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                        MsaccoLoans.Remarks := 'Outstanding Dividend Loan greater than applied amount';
                                        MsaccoLoans."Date Posted" := CurrentDatetime;
                                        MsaccoLoans.Modify;
                                        ContinueMB := false;
                                    end;
                                until Loans.Next = 0
                            end;
                        end;


                        //Check Default
                        if ContinueMB = true then begin
                            // Check if defaulter //
                            // MESSAGE('%1 and %2',MsaccoLoans."Requested Amount",ProdFac."Minimum Loan Amount");
                            if (MsaccoLoans."Requested Amount" < ProdFac."Minimum Loan Amount") or (MsaccoLoans."Requested Amount" > ProdFac."Maximum Loan Amount") then begin
                                //MESSAGE('l');
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name
                                   + ', your Dividend Loan request has been rejected. Reason: Amount applied is not permitted.', ''
                                   , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'Amount greater or less than required.';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;

                        if ContinueMB = true then begin
                            // Check if defaulter //

                            DefaultedAmount := 0;

                            Loans.Reset;
                            Loans.SetRange(Loans.Posted, true);//Loans.Status::Approved);
                            Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                            Loans.SetFilter("Outstanding Balance", '>%1', 0);
                            Loans.SetFilter(Loans."Loans Category-SASRA", '<>%1', Loans."loans category-sasra"::Perfoming);
                            if Loans.Find('-') then begin
                                repeat
                                    Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name
                                    + ', your Dividend Loan request has been rejected. Reason: You have defaulted loans.', ''
                                    , saccoAccount."No.", false);
                                    MsaccoLoans.Posted := true;
                                    MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                    MsaccoLoans.Remarks := 'Defaulted Loan';
                                    MsaccoLoans."Date Posted" := CurrentDatetime;
                                    MsaccoLoans.Modify;
                                    ContinueMB := false;
                                until Loans.Next = 0;
                            end;
                        end;





                        if ContinueMB = true then begin

                            MCommission := 0;
                            MInterest := 0;
                            MComm := 0;
                            MInt := 0;



                            Loans.Reset;
                            Loans.SetRange(Loans."Loan No.", 'DIV' + Format(MsaccoLoans."Entry no"));
                            if Loans.Find('-') then begin
                                CreditAccounts.Reset;
                                CreditAccounts.SetRange(CreditAccounts."No.", ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix");
                                if CreditAccounts.FindFirst then begin
                                    LAccount := CreditAccounts."No.";
                                end else begin
                                    if saccoAccount.Get(saccoAccount."No.") then begin
                                        LAccount := CreateLoanAccount(saccoAccount."Member No.", ProdFac."Product ID");
                                    end;
                                end;
                            end else begin
                                CreditAccounts.Reset;
                                CreditAccounts.SetRange(CreditAccounts."No.", ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix");
                                if CreditAccounts.FindFirst then begin
                                    LAccount := CreditAccounts."No.";
                                end else begin
                                    LAccount := CreateLoanAccount(saccoAccount."Member No.", ProdFac."Product ID");
                                end;

                                // create LOAN //

                                Loans.Init;
                                Loans."Loan No." := 'DIV' + Format(MsaccoLoans."Entry no");
                                Loans."Application Date" := Today;
                                Loans."Loan Product Type" := ProdFac."Product ID";
                                Loans."Member No." := saccoAccount."Member No.";
                                Loans."Member Name" := saccoAccount.Name;
                                Loans."Loan Product Type Name" := ProdFac."Product Description";
                                Loans."Requested Amount" := MsaccoLoans."Requested Amount";
                                Loans."Approved Amount" := MsaccoLoans."Requested Amount";
                                Loans.Status := Loans.Status::Approved;
                                Loans.Source := Loans.Source::CREDIT;
                                Loans."Staff No" := saccoAccount."Payroll/Staff No.";
                                Loans."Employer Code" := saccoAccount."Employer Code";
                                Loans.Interest := ProdFac."Interest Rate (Max.)";
                                Loans."Mode of Disbursement" := Loans."mode of disbursement"::"Full Disbursement";
                                Loans."Global Dimension 1 Code" := '';
                                Loans."Loan Account" := LAccount;
                                Loans.Repayment := ROUND((MsaccoLoans.Amount), 1, '>');
                                Loans.Interest := ProdFac."Interest Rate (Min.)";
                                Loans."Loan Principle Repayment" := ROUND((MsaccoLoans.Amount), 1, '>');
                                Loans."Recovery Mode" := Loans."recovery mode"::Dividend;
                                Loans."Recovery Priority" := 1;
                                Loans."Loan Interest Repayment" := 0;
                                Loans."Amount To Disburse" := MsaccoLoans."Requested Amount";
                                Loans."Repayment Frequency" := Loans."repayment frequency"::Monthly;
                                Loans."Interest Calculation Method" := Loans."interest calculation method"::"Straight Line";
                                Loans."Disbursement Date" := Today;
                                Loans."Repayment Frequency" := ProdFac."Repayment Frequency";
                                Loans."Disbursement Account No" := saccoAccount."No.";
                                Loans."Loan Appraised By" := 'HARAMBEESACCO\MSACCO';
                                Loans."Captured By" := 'HARAMBEESACCO\MSACCO';
                                Loans."Global Dimension 2 Code" := 'NBI';
                                Loans."Approval Date" := Today;
                                Loans."Loan Span" := Loans."loan span"::"Short Term";
                                Loans.Installments := ProdFac."Prefferential Default installm";
                                Loans."Expected Date of Completion" := CalcDate('<CM>', CalcDate('6M', Today));
                                Loans."Repayment Start Date" := CalcDate('CM', CalcDate('1D', CalcDate('CM', Today)));
                                Loans."Sub Sector Level2" := MsaccoLoans."Loan Purpose";
                                Loans.Validate("Sub Sector Level2");
                                Loans.Posted := true;
                                Loans.Insert();
                            end;
                            AcctNo := 'DIV' + Format(MsaccoLoans."Entry no");

                            //start posting

                            JournalPost.ClearJournalLines('MSACCO', 'MSACCOLN');

                            DocumentNo := MsaccoLoans.DocumentNo;

                            // Dr LOAN Account+++++++++++++++++++++++++
                            LineNo := LineNo + 10000;
                            JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Credit, DocumentNo, 'Dividend Loan-: ' + Loans."Loan No.", Loans."Approved Amount"
                            , LAccount, Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                            Optiontransactiontypes::Loan, AcctNo, '', '', 0, '', 0);

                            // Cr Loan Account+++++++++++++++++++++++++
                            LineNo := LineNo + 10000;
                            JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Savings, DocumentNo, 'Dividend Loan-: ' + Loans."Loan No.", Loans."Approved Amount" * -1
                            , saccoAccount."No.", Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                            Optiontransactiontypes::" ", AcctNo, '', '', 0, '', 0);


                            // Bills +++++++++++++++++++++++++
                            LineNo := LineNo + 10000;
                            JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Credit, DocumentNo, 'Dividend Loan Bills-: ' + Loans."Loan No.", Loans."Approved Amount"
                            , LAccount, Today, Optionsaccounts::"G/L Account", '107001', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                            Optiontransactiontypes::Bills, AcctNo, '', '', 0, '', 0);


                            // Interest Due +++++++++++++++++++++++++
                            MInterest := Loans."Approved Amount" * (ProdFac."Interest Rate (Max.)" / 100);
                            LineNo := LineNo + 10000;
                            JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Credit, DocumentNo, 'Dividend Loan Interest Due-: ' + Loans."Loan No.", MInterest
                            , LAccount, Today, Optionsaccounts::"G/L Account", ProdFac."Loan Interest Account [G/L]", 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                            Optiontransactiontypes::"Interest Due", AcctNo, '', '', 0, '', 0);

                            //Dr Interest Paid +++++++++++++++++++++++++
                            MInterest := Loans."Approved Amount" * (ProdFac."Interest Rate (Max.)" / 100);
                            LineNo := LineNo + 10000;
                            JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Savings, DocumentNo, 'Dividend Loan Interest Paid-: ' + Loans."Loan No.", MInterest
                            , saccoAccount."No.", Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                            Optiontransactiontypes::" ", AcctNo, '', '', 0, '', 0);

                            //Cr Interest Paid +++++++++++++++++++++++++
                            MInterest := Loans."Approved Amount" * (ProdFac."Interest Rate (Max.)" / 100);
                            LineNo := LineNo + 10000;
                            JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Credit, DocumentNo, 'Dividend Loan Interest Paid-: ' + Loans."Loan No.", MInterest * -1
                            , LAccount, Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                            Optiontransactiontypes::"Interest Paid", AcctNo, '', '', 0, '', 0);


                            //Dr Vendor Share Paid +++++++++++++++++++++++++
                            LineNo := LineNo + 10000;
                            JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Savings, DocumentNo, 'DIV LOAN Msacco Fee: ' + Loans."Loan No.", Msaccocharge
                            , saccoAccount."No.", Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                            Optiontransactiontypes::" ", AcctNo, '', '', 0, '', 0);

                            //Cr Vendor Share Paid +++++++++++++++++++++++++
                            LineNo := LineNo + 10000;
                            JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Vendor, DocumentNo, 'DIV LOAN Msacco Fee : ' + Loans."Loan No.", Msaccocharge * -1
                            , Msaccoacc, Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS', saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                            Optiontransactiontypes::" ", AcctNo, '', '', 0, '', 0);


                            //DivTop

                            OutstandingLoans.Reset;
                            OutstandingLoans.SetRange(OutstandingLoans.Status, OutstandingLoans.Status::Approved);
                            OutstandingLoans.SetRange(OutstandingLoans."Member No.", saccoAccount."Member No.");
                            OutstandingLoans.SetFilter(OutstandingLoans."Loan Product Type", '%1', ProdFac."Product ID");
                            if OutstandingLoans.Find('-') then begin
                                repeat
                                    OutstandingLoans.CalcFields("Outstanding Balance", "Outstanding Interest", "Outstanding Bills");
                                    if OutstandingLoans."Outstanding Balance" > 0 then begin
                                        // Cr LOAN Account
                                        LineNo := LineNo + 10000;
                                        JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Credit,
                                        DocumentNo, 'Loan TopUp: ' + OutstandingLoans."Loan No.", OutstandingLoans."Outstanding Balance" * -1
                                        , OutstandingLoans."Loan Account", Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS',
                                        saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                                        Optiontransactiontypes::Repayment, OutstandingLoans."Loan No.", '', '', 0, '', 0);

                                        /*LineNo:=LineNo+10000;
                                        GenJournalLine.INIT;
                                        GenJournalLine."Journal Template Name":='MSACCO';
                                        GenJournalLine."Journal Batch Name":='MSACCOLN';
                                        GenJournalLine."Line No.":=LineNo;
                                        GenJournalLine."Account Type":=GenJournalLine."Account Type"::Credit;
                                        GenJournalLine."Account No.":= OutstandingLoans."Loan Account";//LAccount;
                                        GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                        GenJournalLine."Document No.":= DocumentNo;
                                        GenJournalLine."External Document No.":='MSACCO LN';
                                        GenJournalLine."Posting Date":=TODAY;
                                        GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::Repayment;
                                        GenJournalLine."Loan No":= OutstandingLoans."Loan No.";
                                        GenJournalLine.Amount:= OutstandingLoans."Outstanding Balance"*-1;
                                        GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                        GenJournalLine.Description:='Loan TopUp '+ Loans."Loan No.";
                                        GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                        IF GenJournalLine.Amount<>0 THEN
                                        GenJournalLine.INSERT;*/

                                        // Cr Interest Account
                                        LineNo := LineNo + 10000;
                                        JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Credit, DocumentNo,
                                        'Loan TopUp Interest Paid: ' + OutstandingLoans."Loan No.", OutstandingLoans."Outstanding Interest" * -1
                                        , OutstandingLoans."Loan Account", Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS',
                                        saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                                        Optiontransactiontypes::"Interest Paid", OutstandingLoans."Loan No.", '', '', 0, '', 0);

                                        /* LineNo:=LineNo+10000;
                                         GenJournalLine.INIT;
                                         GenJournalLine."Journal Template Name":='MSACCO';
                                         GenJournalLine."Journal Batch Name":='MSACCOLN';
                                         GenJournalLine."Line No.":=LineNo;
                                         GenJournalLine."Account Type":=GenJournalLine."Account Type"::Credit;
                                         GenJournalLine."Account No.":= OutstandingLoans."Loan Account";//LAccount;
                                         GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                         GenJournalLine."Document No.":= DocumentNo;
                                         GenJournalLine."External Document No.":='MSACCO LN';
                                         GenJournalLine."Posting Date":=TODAY;
                                         GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::"Interest Paid";
                                         GenJournalLine."Loan No":= OutstandingLoans."Loan No.";
                                         GenJournalLine.Amount:= OutstandingLoans."Outstanding Interest"*-1;
                                         GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                         GenJournalLine.Description:='Loan TopUp Interest Paid'+ Loans."Loan No.";
                                         GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                                         GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                                         GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                         GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                         IF GenJournalLine.Amount<>0 THEN
                                         GenJournalLine.INSERT;*/

                                        // Dr LOAN Account

                                        LineNo := LineNo + 10000;
                                        JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Savings, DocumentNo,
                                        'Loan TopUp Principle: ' + OutstandingLoans."Loan No.", OutstandingLoans."Outstanding Balance"
                                        , saccoAccount."No.", Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS',
                                        saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                                        Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                                        /*LineNo:=LineNo+10000;
                                        GenJournalLine.INIT;
                                        GenJournalLine."Journal Template Name":='MSACCO';
                                        GenJournalLine."Journal Batch Name":='MSACCOLN';
                                        GenJournalLine."Line No.":=LineNo;
                                        GenJournalLine."Account Type":=GenJournalLine."Account Type"::Savings;
                                        GenJournalLine."Account No.":= saccoAccount."No.";
                                        GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                        GenJournalLine."Document No.":= DocumentNo;
                                        GenJournalLine."External Document No.":='MSACCO LN';
                                        GenJournalLine."Posting Date":=TODAY;
                                        //GenJournalLine."Loan No":= AcctNo;
                                        GenJournalLine.Amount:= OutstandingLoans."Outstanding Balance";
                                        GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                        GenJournalLine.Description:='Loan TopUp Principle '+OutstandingLoans."Loan No.";
                                        GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::Loan;
                                        GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                        IF GenJournalLine.Amount<>0 THEN
                                        GenJournalLine.INSERT;
                                        */
                                        // Dr LOAN Account



                                        LineNo := LineNo + 10000;
                                        JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Savings, DocumentNo,
                                        'Loan TopUp Interest: ' + OutstandingLoans."Loan No.", OutstandingLoans."Outstanding Interest"
                                        , saccoAccount."No.", Today, Optionsaccounts::"G/L Account", '', 'MSACCO LOANS',
                                        saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                                        Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                                        /*LineNo:=LineNo+10000;
                                        GenJournalLine.INIT;
                                        GenJournalLine."Journal Template Name":='MSACCO';
                                        GenJournalLine."Journal Batch Name":='MSACCOLN';
                                        GenJournalLine."Line No.":=LineNo;
                                        GenJournalLine."Account Type":=GenJournalLine."Account Type"::Savings;
                                        GenJournalLine."Account No.":= saccoAccount."No.";
                                        GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                        GenJournalLine."Document No.":= DocumentNo;
                                        GenJournalLine."External Document No.":='MSACCO LN';
                                        GenJournalLine."Posting Date":=TODAY;
                                        //GenJournalLine."Loan No":= AcctNo;
                                        GenJournalLine.Amount:= OutstandingLoans."Outstanding Interest";
                                        GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                        GenJournalLine.Description:='Loan TopUp Interest '+OutstandingLoans."Loan No.";
                                        GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::Loan;
                                        GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                        IF GenJournalLine.Amount<>0 THEN
                                        GenJournalLine.INSERT;*/

                                        // Dr LOAN Account

                                        // Cr Interest Account
                                        LineNo := LineNo + 10000;
                                        JournalPost.PostJournal('MSACCO', 'MSACCOLN', LineNo, Optionsaccounts::Credit, DocumentNo,
                                        'Loan TopUp: ' + OutstandingLoans."Loan No.", OutstandingLoans."Outstanding Bills" * -1
                                        , OutstandingLoans."Loan Account", Today, Optionsaccounts::"G/L Account", '107001', 'MSACCO LOANS',
                                        saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code",
                                        Optiontransactiontypes::Bills, OutstandingLoans."Loan No.", '', '', 0, '', 0);

                                        /* LineNo:=LineNo+10000;
                                         GenJournalLine.INIT;
                                         GenJournalLine."Journal Template Name":='MSACCO';
                                         GenJournalLine."Journal Batch Name":='MSACCOLN';
                                         GenJournalLine."Line No.":=LineNo;
                                         GenJournalLine."Account Type":=GenJournalLine."Account Type"::Credit;
                                         GenJournalLine."Account No.":= LAccount;
                                         GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                         GenJournalLine."Document No.":= DocumentNo;
                                         GenJournalLine."External Document No.":='MSACCO LN';
                                         GenJournalLine."Posting Date":=TODAY;
                                         GenJournalLine."Loan No":= OutstandingLoans."Loan No.";
                                         GenJournalLine.Amount:= OutstandingLoans."Outstanding Bills"*-1;
                                         GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                         GenJournalLine.Description:='Loan TopUp '+OutstandingLoans."Loan No.";
                                         GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::Bills;
                                         GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                                         GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                                         GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                         GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                         IF GenJournalLine.Amount<>0 THEN
                                         GenJournalLine.INSERT;

                                          // Dr LOAN Account

                                         LineNo:=LineNo+10000;
                                         GenJournalLine.INIT;
                                         GenJournalLine."Journal Template Name":='MSACCO';
                                         GenJournalLine."Journal Batch Name":='MSACCOLN';
                                         GenJournalLine."Line No.":=LineNo;
                                         GenJournalLine."Account Type":=GenJournalLine."Account Type"::"G/L Account";
                                         GenJournalLine."Account No.":= '107001';
                                         GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                         GenJournalLine."Document No.":= DocumentNo;
                                         GenJournalLine."External Document No.":='MSACCO LN';
                                         GenJournalLine."Posting Date":=TODAY;
                                         //GenJournalLine."Loan No":= AcctNo;
                                         GenJournalLine.Amount:= OutstandingLoans."Outstanding Bills";
                                         GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                         GenJournalLine.Description:='Loan TopUp '+OutstandingLoans."Loan No.";
                                         GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::Bills;
                                         GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                                         GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                                         GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                         GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                         IF GenJournalLine.Amount<>0 THEN
                                         GenJournalLine.INSERT;
                                      */
                                    end;
                                until OutstandingLoans.Next = 0;
                            end;

                            //Activate
                            ActivateDormant(DocumentNo, Today, saccoAccount."Global Dimension 1 Code", saccoAccount."Global Dimension 2 Code", 'MSACCO', 'MSACCOLN', 0, saccoAccount."Member No.", LineNo, saccoAccount."No.");


                            // complete posting

                            JournalPost.CompletePosting('MSACCO', 'MSACCOLN');


                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your Dividend Advance Loan of KES' +
                            Format(Loans."Approved Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO.', '', saccoAccount."No.", false);

                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans."Approved Amount" := Loans."Approved Amount";
                            MsaccoLoans.Remarks := 'Successful';
                            MsaccoLoans.Modify;
                        end;
                    end;
                end else begin
                    MsaccoLoans.Posted := true;
                    MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                    MsaccoLoans."Date Posted" := CurrentDatetime;
                    //MsaccoLoans."Approved Amount":= Loans."Approved Amount";
                    MsaccoLoans.Remarks := 'Product not set';
                    MsaccoLoans.Modify;
                end;
                loanCounter := loanCounter + 1;
            until (MsaccoLoans.Next = 0) //OR (loanCounter = 10);
        end;

    end;


    procedure CreateLoanAccount(MemberNo: Code[20]; ProdType: Code[20]) LoanAcc: Code[20]
    var
        ProdFac: Record 52185690;
        Loans: Record 52185729;
        Accounts: Record 52185731;
        Member: Record 52185700;
    begin
        ProdFac.Get(ProdType);
        AcctNo := ProdFac."Account No. Prefix" + MemberNo + ProdFac."Account No. Suffix";

        if Accounts.Get(AcctNo) then
            Error('The account no. %1 for %2 already exists', Accounts."No.", Accounts.Name);


        if Member.Get(MemberNo) then begin

            Accounts.Init;
            Accounts."No." := AcctNo;
            Accounts."Date of Birth" := Member."Date of Birth";
            Accounts.Name := Member."First Name" + ' ' + Member."Second Name" + ' ' + Member."Last Name";
            Accounts.Validate(Accounts.Name);
            Accounts."ID No." := Member."ID No.";
            Accounts."Mobile Phone No" := Member."Mobile Phone No";
            Accounts."Member No." := MemberNo;
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
            Accounts."Product Type" := ProdFac."Product ID";//*
            Accounts."Product Name" := ProdFac."Product Description";
            Accounts."Customer Posting Group" := ProdFac."Product Posting Group";
            Accounts.Insert(true);
        end;
        exit(AcctNo);
    end;

    local procedure ActivateDormant(DocNo: Code[20]; PDate: Date; DActivity2: Code[20]; DBranch2: Code[20]; Jtemplate: Code[20]; Jbatch: Code[20]; RunBal: Decimal; MemberNo: Code[20]; LineNo: Integer; Salaccno: Code[20])
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
        GenSetUp.Get;

        SavAcc.Reset;
        SavAcc.SetRange("No.", Salaccno);
        //SavAcc.SETRANGE(Status,SavAcc.Status::Dormant);
        SavAcc.SetFilter("Status Change Reason", '%1', 'Auto Activated on Dividend Posting2020');
        if SavAcc.Find('-') then begin
            // MESSAGE('%1',Salaccno);
            TransactionTypes.Reset;
            TransactionTypes.SetRange(Code, GenSetUp."Dormant Account Activation Fee");
            if TransactionTypes.Find('-') then begin
                TransactionCharges.Reset;
                TransactionCharges.SetRange("Transaction Type", TransactionTypes.Code);
                if TransactionCharges.Find('-') then begin
                    repeat

                        TransactionCharges.TestField(TransactionCharges."G/L Account");
                        if SavAcc.Blocked = SavAcc.Blocked::" " then begin
                            SavAcc.Blocked := SavAcc.Blocked::" ";
                            SavAcc.Status := SavAcc.Status::Active;
                            SavAcc."Status Change Reason" := 'Auto Activated on Divdend Posting2019';
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
                        // MESSAGE('%1',Amt);
                        JournalPosting.PostJournal(Jtemplate, Jbatch, LineNo, AccType, DocNo, TransactionCharges.Description + SavAcc."No.", Amt, AccNo, PDate, BalAccType,
                      BalAccNo, '', DActivity2, DBranch2, TransType, DocumentNo, '', '', 0, '', 0);

                        if TransactionCharges."Recover Excise Duty" = true then begin
                            GenSetUp.TestField("Excise Duty G/L");
                            GenSetUp.TestField("Excise Duty (%)");
                            LineNo := LineNo + 10000;
                            AccType := Acctype::"G/L Account";
                            AccNo := GenSetUp."Excise Duty G/L";
                            TransType := Transtype::" ";
                            BalAccType := Balacctype::Savings;
                            BalAccNo := SavAcc."No.";
                            Amt := Amt * GenSetUp."Excise Duty (%)" * 0.01;
                            // MESSAGE('%1',Amt);
                            JournalPosting.PostJournal(Jtemplate, Jbatch, LineNo, AccType, DocumentNo, CopyStr((TransactionCharges.Description + SavAcc."No." + '-Excise Duty'), 1, 50), Amt, AccNo, PDate, BalAccType,
                            BalAccNo, '', DActivity2, DBranch2, TransType, '', '', '', 0, '', 0);
                        end;
                    until TransactionCharges.Next = 0;
                end;
            end;
        end;
        //block account if
        //ERROR('DP');
    end;

    local procedure Token(var Text: Text[1024]; Separator: Text) Token: Text[1024]
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

    local procedure CreateLoanRegister(AccNo: Code[20]; LoanCode: Code[20]; RequestedAmount: Decimal; ApplicationDate: Date; Install: Integer; LoanPurpose: Code[10]; Dim: Code[10]) LoanNoEm: Code[20]
    var
        LoansApp: Record 52185729;
        SavingsAccounts: Record 52185730;
        MembNoSeries: Record 52185688;
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        LoanNo: Code[20];
    begin
        if SavingsAccounts.Get(AccNo) then begin

            if LoanCode = '112' then begin
                MembNoSeries.Get;
                MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                // NoSeriesMgt.InitSeries(MembNoSeries."Loan No EM", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
            end else
                if LoanCode = '111' then begin
                    MembNoSeries.Get;
                    MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                    // NoSeriesMgt.InitSeries(MembNoSeries."Loan No DEV", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
                end else
                    if (LoanCode = '115') or (LoanCode = '124') then begin
                        MembNoSeries.Get;
                        MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                        // NoSeriesMgt.InitSeries(MembNoSeries."Loan No JS", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
                    end else
                        if (LoanCode = '140') then begin
                            MembNoSeries.Get;
                            MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                            // NoSeriesMgt.InitSeries(MembNoSeries."Loan No Inuka", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
                        end else begin
                            MembNoSeries.Get;
                            MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                            // NoSeriesMgt.InitSeries(MembNoSeries."Loan No SF", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
                        end;

            Loans.Init;
            Loans."Loan No." := LoanNo;
            Loans."Member No." := SavingsAccounts."Member No.";
            Loans."Application Date" := Today;
            //Loans.VALIDATE("Member No.");
            Loans."Loan Product Type" := LoanCode;
            //Loans.VALIDATE("Loan Product Type");
            Loans."Requested Amount" := RequestedAmount;
            Loans."Picked Mobile Loan" := true;
            Loans.Installments := Install;
            Loans."Sub Sector Level2" := LoanPurpose;
            if Dim = '1' then
                Loans."Global Dimension 2 Code" := 'NRB'
            else
                if Dim = '2' then
                    Loans."Global Dimension 2 Code" := 'NKR'
                else
                    if Dim = '3' then
                        Loans."Global Dimension 2 Code" := 'ELD'
                    else
                        if Dim = '4' then
                            Loans."Global Dimension 2 Code" := 'KSM'
                        else
                            if Dim = '5' then
                                Loans."Global Dimension 2 Code" := 'MBS'
                            else
                                if Dim = '6' then
                                    Loans."Global Dimension 2 Code" := 'NRB';

            //Loans.VALIDATE(Loans."Global Dimension 2 Code");
            Loans.Insert;
            LoanNoEm := LoanNo;
            //MESSAGE('%1',LoanNo);
        end;
    end;


    procedure PostEmergencyLoan()
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
        Temp: Record 52185782;
        Jtemplate: Code[20];
        JBatch: Code[20];
        EndMonth: Date;
        BatchLines: Record 52185737;
        LoanApps: Record 52185729;
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
        AccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
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
        SendSMS: Codeunit SendSms;
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
        LoanApp: Record 52185729;
        LoanAp: Record 52185729;
        SavAcc: Record 52185730;
    begin

        LoanProcessingGL := '301028';

        MsaccoChargesSetup.Reset;
        MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
        if MsaccoChargesSetup.Find('-') then begin
            MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
            Msaccocharge := MsaccoChargesSetup.ChargeAmount;
            Msaccoacc := MsaccoChargesSetup."Vendor No";
        end;


        MsaccoLoans.Reset;
        //MsaccoLoans.SETRANGE(MsaccoLoans.Status,MsaccoLoans.Status::Pending);
        //MsaccoLoans.SETFILTER("Loan No",'<>%1','EM0029738');
        //MsaccoLoans.SETRANGE(MsaccoLoans."Loan Product Type",MsaccoLoans."Loan Product Type"::"Emergency Loan");
        MsaccoLoans.SetRange(MsaccoLoans."Loan Code", '112');
        MsaccoLoans.SetRange(MsaccoLoans.Posted, false);
        if MsaccoLoans.Find('-') then begin
            repeat

                Loans.Reset;
                Loans.SetRange("Loan No.", MsaccoLoans."Loan No");
                Loans.SetRange(Status, Loans.Status::Approved);
                Loans.SetRange(Posted, false);
                if Loans.Find('-') then begin
                    if Loans."Global Dimension 2 Code" = 'NRB' then
                        Loans."Global Dimension 2 Code" := 'NBI';


                    //Post Loan
                    //LoanProcess.PostSingleLoan(Loans."Loan No.");

                    //

                    Jtemplate := 'MSACCO';
                    JBatch := 'MSACCOLN';

                    //('MSACCO','MSACCOLN');


                    EndMonth := CalcDate('-1D', CalcDate('1M', Dmy2date(1, Date2dmy(Today, 2), Date2dmy(Today, 3))));
                    RemainingDays := (EndMonth - Today) + 1;
                    TMonthDays := Date2dmy(EndMonth, 1);
                    //PRORATED DAYS

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                    GenJournalLine.SetRange("Journal Batch Name", JBatch);
                    GenJournalLine.DeleteAll;


                    loanno := Loans."Loan No.";
                    if LoanApps.Get(Loans."Loan No.") then begin


                        if LoanApps."Global Dimension 2 Code" = 'NRB' then
                            LoanApps."Global Dimension 2 Code" := 'NBI';

                        GenSetup.Get;
                        if CustomerRecord.Get(LoanApps."Member No.") then begin

                            if LoanApps.Status <> LoanApps.Status::Approved then
                                Error('Loan status must be Approved for you to post Loan. - ' + LoanApps."Loan No.");


                            ///RunningDate:=Batches."Posting Date";

                            //Generate and post Approved Loan Amount
                            if not GenBatch.Get(Jtemplate, JBatch) then begin
                                GenBatch.Init;
                                GenBatch."Journal Template Name" := Jtemplate;
                                GenBatch.Name := JBatch;
                                GenBatch.Insert;
                            end;

                            AccType := Acctype::Credit;
                            AccNo := LoanApps."Loan Account";
                            TransType := Transtype::Loan;
                            BalAccType := Balacctype::"G/L Account";
                            BalAccNo := '';
                            Amt := 0;
                            LineNo := LineNo + 10000;
                            Descr := '';
                            Descr := ProdFac."Product Description" + ' ' + 'Loan';
                            Descr := CopyStr(Descr, 1, 50);
                            //Approved amount
                            if LoanApps."Approved Amount" > 0 then
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, Descr, LoanApps."Amount To Disburse", AccNo, Today, BalAccType,
                              BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                            if LoanApps."Mode of Disbursement" = LoanApps."mode of disbursement"::"Full Disbursement" then begin
                                PaySched.Reset;
                                PaySched.SetRange(PaySched."Loan No.", LoanApps."Loan No.");
                                if PaySched.Find('-') then begin
                                    repeat
                                        if (PaySched."Payment Options" = PaySched."payment options"::"M-PESA") or (PaySched."Payment Options" = PaySched."payment options"::"M-PESA") then begin
                                            AccNo := '';
                                            Amt := 0;
                                            AccType := Acctype::"Bank Account";
                                            if LoanApps."All Posting through Savings Ac" = true then begin
                                                BalAccType := Balacctype::Savings;
                                                BalAccNo := LoanApps."Disbursement Account No";
                                            end else begin
                                                BalAccType := Balacctype::"G/L Account";
                                                BalAccNo := '';
                                            end;
                                            if PaySched."Payment Options" = PaySched."payment options"::"M-PESA" then
                                                AccNo := Temp."MPESA Disbursement A/c"
                                            else
                                                AccNo := Temp."Cheque Disbursement A/c";
                                            TransType := Transtype::" ";
                                            BalAccType := Balacctype::Savings;
                                            LineNo := LineNo + 10000;
                                            Descr := '';
                                            Descr := ProdFac."Product Description" + ' ' + 'Loan';
                                            Descr := CopyStr(Descr, 1, 50);
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, Descr, -PaySched.Amount, AccNo,
                                            Today, BalAccType, BalAccNo, '', '', '', TransType, '', '', '', 0, '', 0);
                                        end else begin
                                            AccNo := LoanApps."Disbursement Account No";
                                            AccType := Acctype::Savings;
                                            BalAccType := Balacctype::"G/L Account";
                                            BalAccNo := '';
                                            TransType := Transtype::" ";
                                            BalAccType := Balacctype::"G/L Account";
                                            LineNo := LineNo + 10000;
                                            Descr := '';
                                            Descr := ProdFac."Product Description" + ' ' + 'Loan';
                                            Descr := CopyStr(Descr, 1, 50);
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, Descr, -LoanApps."Amount To Disburse", AccNo,
                                           Today, BalAccType, BalAccNo, '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);
                                        end;
                                    until PaySched.Next = 0;
                                end else begin
                                    //ERROR('Payment schedule must be provided');
                                    AccNo := LoanApps."Disbursement Account No";
                                    AccType := Acctype::Savings;
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    TransType := Transtype::" ";
                                    BalAccType := Balacctype::"G/L Account";
                                    LineNo := LineNo + 10000;
                                    Descr := '';
                                    Descr := ProdFac."Product Description" + ' ' + 'Loan';
                                    Descr := CopyStr(Descr, 1, 50);
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, Descr, -LoanApps."Amount To Disburse", AccNo,
                                   Today, BalAccType, BalAccNo, '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);

                                end;
                            end else begin
                                /*Yet to come
                                */



                            end;


                            //Added
                            //Auto Activate Dormant On Loan Posting
                            SavAcc.Reset;
                            SavAcc.SetRange("No.", LoanApps."Disbursement Account No");
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
                                            LineNo := LineNo + 10000;
                                            AccType := Acctype::"G/L Account";
                                            AccNo := TransactionCharges."G/L Account";
                                            TransType := Transtype::" ";
                                            if LoanApps."All Posting through Savings Ac" = true then begin
                                                BalAccType := Balacctype::Savings;
                                                BalAccNo := LoanApps."Disbursement Account No";
                                            end else begin
                                                BalAccType := Balacctype::"G/L Account";
                                                BalAccNo := '';
                                            end;
                                            Amt := TransactionCharges."Charge Amount";
                                            Amt := Amt * -1;
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, TransactionCharges.Description + LoanApps."Disbursement Account No", Amt, AccNo, Today, BalAccType,
                                          BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                                            //If excise duty involved
                                            if TransactionCharges."Recover Excise Duty" = true then begin
                                                GenSetup.TestField("Excise Duty G/L");
                                                GenSetup.TestField("Excise Duty (%)");
                                                LineNo := LineNo + 10000;
                                                AccType := Acctype::"G/L Account";
                                                AccNo := GenSetup."Excise Duty G/L";
                                                TransType := Transtype::" ";
                                                BalAccType := Balacctype::Savings;
                                                BalAccNo := LoanApps."Disbursement Account No";
                                                Amt := Amt * GenSetup."Excise Duty (%)" * 0.01;

                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, CopyStr((TransactionCharges.Description + LoanApps."Disbursement Account No" + '-Excise Duty'), 1, 50), Amt, AccNo, Today, BalAccType,
                                                BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                                            end;
                                        until TransactionCharges.Next = 0;
                                    end;
                                end;
                            end;
                            //End Addee





                            PCharges.Reset;
                            PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
                            PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::General);
                            if PCharges.Find('-') then begin
                                repeat
                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::"G/L Account";
                                    AccNo := PCharges."Charges G_L Account";
                                    TransType := Transtype::" ";
                                    BalAccType := Balacctype::Savings;
                                    BalAccNo := LoanApps."Disbursement Account No";
                                    if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                        Amt := (LoanApps."Approved Amount" * (PCharges.Percentage / 100))
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
                                                        if (LoanApps."Approved Amount" >= TariffDetails."Lower Limit") and (LoanApps."Approved Amount" <= TariffDetails."Upper Limit") then begin
                                                            if TariffDetails."Use Percentage" = true then begin
                                                                Amt := LoanApps."Approved Amount" * TariffDetails.Percentage * 0.01;
                                                            end else begin
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



                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                                  BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                                    //If excise duty involved
                                    if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin
                                        GenSetup.TestField("Excise Duty G/L");
                                        GenSetup.TestField("Excise Duty (%)");
                                        LineNo := LineNo + 10000;
                                        AccType := Acctype::"G/L Account";
                                        AccNo := GenSetup."Excise Duty G/L";
                                        TransType := Transtype::" ";
                                        BalAccType := Balacctype::Savings;
                                        BalAccNo := LoanApps."Disbursement Account No";
                                        Amt := Amt * GenSetup."Excise Duty (%)" * 0.01;

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, PCharges."Charge Description" + '- Excise Duty', Amt, AccNo, Today, BalAccType,
                                        BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                                    end;


                                until PCharges.Next = 0;

                            end;


                            if LoanApps."Picked Mobile Loan" = true then begin
                                //Mobile Loans
                                MsaccoChargesSetup.Reset;
                                MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
                                if MsaccoChargesSetup.Find('-') then begin
                                    MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
                                    Msaccocharge := MsaccoChargesSetup.ChargeAmount;
                                    Msaccoacc := MsaccoChargesSetup."Vendor No";
                                end;

                                //Dr Vendor Share Paid +++++++++++++++++++++++++
                                LineNo := LineNo + 10000;
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Savings, loanno, 'EMR Loan Msacco Fee: ' + LoanApps."Loan No.", Msaccocharge
                                , LoanApps."Disbursement Account No", Today, Balacctype::"G/L Account", '', 'MSACCO LOANS', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code",
                                Transtype::" ", LoanApps."Loan No.", '', '', 0, '', 0);

                                //Cr Vendor Share Paid +++++++++++++++++++++++++
                                LineNo := LineNo + 10000;
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Vendor, loanno, 'EMR Loan Msacco Fee : ' + LoanApps."Loan No.", Msaccocharge * -1
                                , Msaccoacc, Today, Balacctype::"G/L Account", '', 'MSACCO LOANS', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code",
                                Transtype::" ", LoanApps."Loan No.", '', '', 0, '', 0);

                            end;




                            TotalCleared := 0;
                            BridgLoan := 0;


                            TopUp.Reset;
                            TopUp.SetRange(TopUp."Loan No.", LoanApps."Loan No.");
                            if TopUp.Find('-') then begin
                                repeat
                                    TopUp.Validate(TopUp."Loan Top Up");



                                    //Loan repayment
                                    TotalCleared := TotalCleared + TopUp."Principle Top Up" + TopUp."Interest Top Up";



                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::Credit;
                                    AccNo := TopUp."Loan Account";
                                    TransType := Transtype::Repayment;
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    Amt := TopUp."Principle Top Up" * -1;

                                    //**AdviceLoan(TopUp."Loan Top Up",TRUE);


                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, 'Top up Principle' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                  BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);

                                    //Clear bills
                                    if LoanApp.Get(TopUp."Loan Top Up") then begin
                                        if ProdFac.Get(LoanApp."Loan Product Type") then begin
                                            LineNo := LineNo + 10000;
                                            AccType := Acctype::Credit;
                                            AccNo := TopUp."Loan Account";
                                            TransType := Transtype::Bills;
                                            BalAccType := Balacctype::"G/L Account";
                                            BalAccNo := ProdFac."Billed Account";
                                            Amt := TopUp."Outstanding Bill" * -1;


                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, 'Outs. Bill' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                          BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);
                                        end;
                                    end;

                                    //Interest

                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::Credit;
                                    AccNo := TopUp."Loan Account";
                                    TransType := Transtype::"Interest Paid";
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    Amt := (TopUp."Interest Top Up" + TopUp."Untransfered Interest") * -1;
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, 'Top up Interest' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                    BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);


                                    //Top Up charges

                                    //****

                                    ///ad
                                    //Top Up charges
                                    TopUPGL := '';
                                    "Topup%" := 0;
                                    PCharges.Reset;
                                    PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
                                    PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"Top up");
                                    if PCharges.Find('-') then begin
                                        repeat
                                            PCharges.TestField(PCharges."Charges G_L Account");

                                            LineNo := LineNo + 10000;
                                            AccType := Acctype::"G/L Account";
                                            AccNo := PCharges."Charges G_L Account";
                                            TopUPGL := PCharges."Charges G_L Account";
                                            "Topup%" := PCharges.Percentage;
                                            TransType := Transtype::" ";
                                            // BalAccType:=BalAccType::Savings;
                                            // BalAccNo :=LoanApps."Disbursement Account No";//Commented on 06.05.2021
                                            if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") and (PCharges."Charging Option" = PCharges."charging option"::"On Approved Amount") then begin
                                                if ChargeExtraComms = true then
                                                    Amt := (LoanApps."Approved Amount" * (PCharges.Percentage + PCharges."Additional Charge %") / 100)
                                                else
                                                    Amt := (LoanApps."Approved Amount" * (PCharges.Percentage / 100));
                                            end else
                                                if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") and (PCharges."Charging Option" = PCharges."charging option"::"On Net Amount") then begin
                                                    if ChargeExtraComms = true then
                                                        Amt := ((TopUp."Principle Top Up" + TopUp."Interest Top Up") * (PCharges.Percentage + PCharges."Additional Charge %") / 100)
                                                    else
                                                        Amt := ((TopUp."Principle Top Up" + TopUp."Interest Top Up") * (PCharges.Percentage / 100))
                                                end else
                                                    Amt := PCharges."Charge Amount";

                                            if Amt < PCharges.Minimum then
                                                Amt := PCharges.Minimum;

                                            if Amt > PCharges.Maximum then
                                                Amt := PCharges.Maximum;

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
                            //IF LoanApps."All Posting through Savings Ac"=TRUE THEN BEGIN
                            if TotalCleared > 0 then begin
                                LineNo := LineNo + 10000;
                                AccType := Acctype::Savings;
                                AccNo := LoanApps."Disbursement Account No";
                                TransType := Transtype::" ";
                                BalAccType := Balacctype::"G/L Account";
                                BalAccNo := '';
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, CopyStr(('Total Loan Offset-' + LoanApps."Loan Product Type Name" + '-' + LoanApps."Loan No."), 1, 50), TotalCleared, AccNo, Today, BalAccType,
                                BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);
                            end;
                            //GL
                            //Added 0:6.05.2021
                            BridgLoan := ROUND(BridgLoan, 1, '>');
                            if BridgLoan > 0 then begin
                                if BridgLoan > 50000 then BridgLoan := 50000;
                                LineNo := LineNo + 10000;
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::"G/L Account", loanno, PCharges."Charge Description", -BridgLoan, TopUPGL, Today, BalAccType,
                                BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                BLoanNo := LoansProcess.CreateBridgingLoan(LoanApps."Member No.", TotalCleared);
                                if BLoanNo <> '' then begin
                                    if BLoanRec.Get(BLoanNo) then begin

                                        AccType := Acctype::Credit;
                                        AccNo := BLoanRec."Loan Account";
                                        TransType := Transtype::Loan;
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := '';

                                        LineNo := LineNo + 10001;
                                        Descr := BLoanRec."Loan Product Type Name";

                                        //Approved amount
                                        if BLoanRec."Approved Amount" > 0 then begin

                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, Descr, TotalCleared, AccNo, Today, BalAccType,
                                            BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);


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
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Credit, loanno, Descr, TotalCleared * -1, BLoanRec."Loan Account", Today, BalAccType,
                                            BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);
                                            //Debit Fosa

                                            LineNo := LineNo + 10001;
                                            Descr := BLoanRec."Loan Product Type Name" + '-Interest Paid';
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Savings, loanno, Descr, BridgLoan * 1, LoanApps."Disbursement Account No", Today, BalAccType,
                                            '', '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", Transtype::" ", BLoanRec."Loan No.", '', '', 0, '', 0);

                                            //Interest Due
                                            LineNo := LineNo + 10000;
                                            Descr := BLoanRec."Loan Product Type Name" + '- Interest Due';
                                            TransType := Transtype::"Interest Due";
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, Descr, BridgLoan, AccNo, Today, BalAccType,
                                            BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);


                                            //Interest Paid
                                            LineNo := LineNo + 10000;
                                            Descr := BLoanRec."Loan Product Type Name" + '- Interest Paid';
                                            TransType := Transtype::"Interest Paid";
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, Descr, BridgLoan * -1, AccNo, Today, BalAccType,
                                            BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);

                                            // END;
                                            //END;

                                        end;
                                    end;
                                end;
                                //END;
                                //End of 06.05.2021 Additions
                            end;

                            ///ad
                            //****




                            OtherComms := 0;
                            //Clearing external debts
                            OtherCommitments.Reset;
                            OtherCommitments.SetRange(OtherCommitments."Loan No.", LoanApps."Loan No.");
                            if OtherCommitments.Find('-') then begin
                                repeat
                                    Temp.TestField(Temp."Bankers Cheque Account");

                                    TotalCleared := TotalCleared + TopUp."Principle Top Up" + TopUp."Interest Top Up";
                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::"Bank Account";
                                    AccNo := Temp."Bankers Cheque Account";
                                    TransType := Transtype::" ";
                                    if LoanApps."All Posting through Savings Ac" = true then begin
                                        BalAccType := Balacctype::Savings;
                                        BalAccNo := LoanApps."Disbursement Account No";
                                    end else begin
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := '';
                                    end;


                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, 'External Loan Cleared', OtherCommitments.Amount * -1, AccNo, Today, BalAccType,
                                 BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);



                                    PCharges.Reset;
                                    PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
                                    PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"External Loan");
                                    if PCharges.Find('-') then begin
                                        repeat
                                            PCharges.TestField(PCharges."Charges G_L Account");

                                            LineNo := LineNo + 10000;
                                            AccType := Acctype::"G/L Account";
                                            AccNo := PCharges."Charges G_L Account";
                                            TransType := Transtype::" ";
                                            if LoanApps."All Posting through Savings Ac" = true then begin
                                                BalAccType := Balacctype::Savings;
                                                BalAccNo := LoanApps."Disbursement Account No";
                                            end else begin
                                                BalAccType := Balacctype::"G/L Account";
                                                BalAccNo := '';
                                            end;
                                            if (PCharges."Use Percentage" = true) then
                                                Amt := (OtherCommitments.Amount * (PCharges.Percentage / 100))
                                            else
                                                Amt := OtherCommitments.Amount;

                                            if Amt < PCharges.Minimum then
                                                Amt := PCharges.Minimum;

                                            if Amt > PCharges.Maximum then
                                                Amt := PCharges.Maximum;

                                            Amt := Amt * -1;



                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                                           BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                            if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin
                                                GenSetup.TestField("Excise Duty G/L");
                                                GenSetup.TestField("Excise Duty (%)");
                                                LineNo := LineNo + 10000;
                                                AccType := Acctype::"G/L Account";
                                                AccNo := GenSetup."Excise Duty G/L";
                                                TransType := Transtype::" ";
                                                BalAccType := Balacctype::Savings;
                                                BalAccNo := LoanApps."Disbursement Account No";
                                                Amt := Amt * GenSetup."Excise Duty (%)" * 0.01;

                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                                                BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                                            end;



                                        until PCharges.Next = 0;
                                    end;
                                until OtherCommitments.Next = 0;
                            end;

                            //Get if interest due is posted on disbursement from setups

                            if ProdFac.Get(LoanApps."Loan Product Type") then begin
                                if ProdFac."Compute Interest Due on Postin" = ProdFac."compute interest due on postin"::"Full Interest" then begin
                                    Amt := 0;
                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::Credit;
                                    AccNo := LoanApps."Loan Account";
                                    TransType := Transtype::"Interest Due";
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := ProdFac."Loan Interest Account [G/L]";
                                    Amt := LoanApps."Amount To Disburse" * LoanApps.Interest / 12 * 0.01;
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanApps."Loan No.", 'Interest Due' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                    BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                end else
                                    if ProdFac."Compute Interest Due on Postin" = ProdFac."compute interest due on postin"::"Pro-rata" then begin
                                        //PRORATED DAYS
                                        EndMonth := CalcDate('-1D', CalcDate('1M', Dmy2date(1, Date2dmy(Today, 2), Date2dmy(Today, 3))));
                                        RemainingDays := DaysPast + (EndMonth - Today) + 1;
                                        TMonthDays := Date2dmy(EndMonth, 1);
                                        Amt := 0;
                                        LineNo := LineNo + 10000;
                                        AccType := Acctype::Credit;
                                        AccNo := LoanApps."Loan Account";
                                        TransType := Transtype::"Interest Due";
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := ProdFac."Loan Interest Account [G/L]";
                                        Amt := LoanApps."Amount To Disburse" * LoanApps.Interest / 12 * 0.01 * RemainingDays / TMonthDays;
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanApps."Loan No.", 'Interest Due' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                        BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                    end;

                                //Bill if Upfront Bill
                                if ProdFac."Compute Bills on Posting" = ProdFac."compute bills on posting"::"Full Amount" then begin
                                    Amt := 0;
                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::Credit;
                                    AccNo := LoanApps."Loan Account";
                                    TransType := Transtype::Bills;
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := ProdFac."Billed Account";
                                    Amt := LoanApps."Amount To Disburse";
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanApps."Loan No.", 'Bills' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                    BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                end else
                                    if ProdFac."Compute Bills on Posting" = ProdFac."compute bills on posting"::"One Installment" then begin
                                        Amt := 0;
                                        LineNo := LineNo + 10000;
                                        AccType := Acctype::Credit;
                                        AccNo := LoanApps."Loan Account";
                                        TransType := Transtype::Bills;
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := ProdFac."Billed Account";
                                        Amt := LoanApps.Repayment - LoanApps."Loan Interest Repayment";
                                        if Amt > 0 then begin
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanApps."Loan No.", 'Bills' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                            BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                                        end;
                                    end;

                            end;
                            GenSetup.Get;
                            Members.Get(LoanApps."Member No.");
                            if GenSetup."Disable Loan SMS" = false then
                                SendSMS.SendSms(Sourcetype::"Loan Posted", Members."Mobile Phone No", 'Your Emergency Loan of ' + Format(LoanApps."Approved Amount") + ' ' + 'has been credited to your account'
                                            , LoanApps."Loan No.", LoanApps."Disbursement Account No", false);



                            LoanApps.Advice := true;
                            LoanApps."Advice Type" := LoanApps."advice type"::"Fresh Loan";
                            LoanApps."Disbursement Date" := Today;
                            LoanApps.Validate("Disbursement Date");
                            LoanApps.Posted := true;
                            LoanApps.Modify;

                            AdviceLoan(LoanApps."Loan No.", true);
                        end;
                    end;
                    //MESSAGE('t');

                    JournalPosting.CompletePosting(Jtemplate, JBatch);

                    //

                    //Advice Loan
                    TopUp.Reset;
                    TopUp.SetRange(TopUp."Loan No.", LoanApps."Loan No.");
                    if TopUp.Find('-') then begin
                        repeat
                            if LoanAp.Get(TopUp."Loan Top Up") then begin
                                AdviceLoan(LoanAp."Loan No.", true);
                            end;
                        until TopUp.Next = 0;
                    end;
                    AdviceLoan(Loans."Loan No.", false);

                    MsaccoLoans.Posted := true;
                    MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                    MsaccoLoans."Date Posted" := CurrentDatetime;
                    MsaccoLoans."Approved Amount" := Loans."Approved Amount";
                    MsaccoLoans."Ghris Password" := '';
                    MsaccoLoans.Remarks := 'Successful';
                    MsaccoLoans.Modify;
                end;

                Loans.Reset;
                Loans.SetRange("Loan No.", MsaccoLoans."Loan No");
                Loans.SetRange(Status, Loans.Status::Approved);
                Loans.SetRange(Posted, true);
                if Loans.Find('-') then begin
                    MsaccoLoans.Posted := true;
                    MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                    MsaccoLoans."Date Posted" := CurrentDatetime;
                    MsaccoLoans."Approved Amount" := Loans."Approved Amount";
                    MsaccoLoans.Remarks := 'Successful';
                    MsaccoLoans."Ghris Password" := '';
                    MsaccoLoans.Modify;
                end;

                Loans.Reset;
                Loans.SetRange("Loan No.", MsaccoLoans."Loan No");
                Loans.SetRange(Status, Loans.Status::Rejected);
                Loans.SetRange(Posted, false);
                if Loans.Find('-') then begin
                    MsaccoLoans.Posted := true;
                    MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                    MsaccoLoans."Date Posted" := CurrentDatetime;
                    MsaccoLoans."Ghris Password" := '';
                    //MsaccoLoans."Approved Amount":= Loans."Approved Amount";
                    MsaccoLoans.Remarks := 'Loan Rejected';
                    MsaccoLoans.Modify;
                end;
            until MsaccoLoans.Next = 0;
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
                    end else
                        CheckoffAdvice."Balance Off" := Loans."Outstanding Balance";
                    CheckoffAdvice.Interest := 0;
                    CheckoffAdvice."Balance On" := 0;
                end else begin
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

    local procedure InsertToJourlFailedDeposits(DocumentNo: Text[30]; TransType: Text[30]; Description: Text[100]; TranDate: Date; Account: Text[30]; Amount: Decimal; Otherd: Text[100]) Response: Integer
    var
        FosaAccountNumber: Text[30];
        RegfeePaid: Boolean;
        Loans: Record 52185729;
        SavingsAcc: Record 52185730;
        SavAccount: Code[20];
        Cell: Text;
        LoansRec: Record 52185729;
    begin
        Response := 1;
        RegfeePaid := false;
        Continue := true;

        MPESATRANS.Reset;
        MPESATRANS.SetRange(MPESATRANS."Document No.", DocumentNo);
        if MPESATRANS.FindFirst then begin

            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
            GenJournalLine.SetRange("Journal Batch Name", 'MPESA-OL');
            GenJournalLine.DeleteAll;


            // prevent double posting

            Venderdetails.Reset;
            Venderdetails.SetRange(Venderdetails."Document No.", MPESATRANS."Document No.");
            //Venderdetails.SETRANGE("Customer No.",MPESATRANS."Account No.");
            //Venderdetails.SETFILTER(Venderdetails.Reversed,'=%1',FALSE);
            if Venderdetails.Find('-') then begin

                MPESATRANS."Date Posted" := Today;
                MPESATRANS."Time Posted" := Time;
                MPESATRANS.Posted := true;
                MPESATRANS.Messages := 'Double Posting';
                MPESATRANS.Modify;
                Response := 0;
                Continue := false;
                exit;
            end;

            ////Prevent Double Posting
            LoansRec.Reset;
            LoansRec.SetRange("Loan No.", MPESATRANS."Document No.");
            if LoansRec.Find('-') then begin
                Continue := false;
            end;

            GenBatches.Reset;
            GenBatches.SetRange(GenBatches."Journal Template Name", 'MSACCO');
            GenBatches.SetRange(GenBatches.Name, 'MPESA-OL');
            if GenBatches.Find('-') = false then begin
                GenBatches.Init;
                GenBatches."Journal Template Name" := 'MSACCO';
                GenBatches.Name := 'MPESA-OL';
                GenBatches.Description := 'M-PESA Transactions';
                GenBatches.Validate(GenBatches."Journal Template Name");
                GenBatches.Validate(GenBatches.Name);
                GenBatches.Insert;
            end;

            MPesaCharges := 0;
            MPesaChargesAccount := '';
            Msaccocharge := 0;
            Msaccoacc := '';
            TotalCharges := 0;
            TariffCharges := 0;
            AmountToCharge := 0;

            //Get Paybill Bank Account
            MsaccoChargesSetup.Reset;
            MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'PAYBILLBANK');
            if MsaccoChargesSetup.Find('-') then begin
                MsaccoChargesSetup.TestField(MsaccoChargesSetup."Bank Account No");
                MPESAPaybill := MsaccoChargesSetup."Bank Account No";
            end;

            //Get Sacco Deposit Charges G/L
            Charges.Reset;
            Charges.SetRange(Charges."Transaction Type", 'MSACCODEP');
            if Charges.Find('-') then begin
                Charges.TestField(Charges."G/L Account");
                MPesaCharges := Charges."Charge Amount";
                MPesaChargesAccount := Charges."G/L Account";
            end;

            //Get Excise duty G/L
            ExciseDutyGL := GetExciseDutyGL();

            //Get Coretec Vendor Account and Charge Amount
            MsaccoChargesSetup.Reset;
            MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
            if MsaccoChargesSetup.Find('-') then begin
                MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
                Msaccocharge := MsaccoChargesSetup.ChargeAmount;
                Msaccoacc := MsaccoChargesSetup."Vendor No";
            end;
            Cell := '+' + MPESATRANS."Telephone No";
            //MESSAGE('%1',Cell);
            saccoAccount.Reset;
            saccoAccount.SetRange(saccoAccount.Blocked, saccoAccount.Blocked::" ");
            saccoAccount.SetRange("Transactional Mobile No", Cell);
            //saccoAccount.SETRANGE(saccoAccount.Status,saccoAccount.Status::Active);
            saccoAccount.SetFilter(saccoAccount.Status, '%1|%2', saccoAccount.Status::Active, saccoAccount.Status::New);
            //saccoAccount.SETRANGE(saccoAccount."No.",Account);
            if saccoAccount.Find('-') then begin
                //ERROR('%1',saccoAccount."No.");
                SavingsAcc.Reset;
                SavingsAcc.SetRange("Member No.", saccoAccount."Member No.");
                SavingsAcc.SetRange("Loan Disbursement Account", true);
                if SavingsAcc.FindFirst then
                    SavAccount := SavingsAcc."No.";

                if LoansRec.Get(MPESATRANS."Account No.") then begin
                    Continue := false;
                end;

                AmountToCharge := Amount * -1;

                TariffDetails.Reset;
                TariffDetails.SetRange(TariffDetails.Code, '');
                if TariffDetails.Find('-') then begin
                    repeat
                        if (AmountToCharge >= TariffDetails."Lower Limit") and (AmountToCharge <= TariffDetails."Upper Limit") then begin
                            TariffCharges := TariffDetails."Charge Amount";
                        end;
                    until TariffDetails.Next = 0;
                end;

                TotalCharges := MPesaCharges + TariffCharges + Msaccocharge;



                //Dr Bank
                LineNo := LineNo + 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := 'MSACCO';
                GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                GenJournalLine."External Document No." := 'MPESA-DPT';
                GenJournalLine."Account No." := MPESAPaybill;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Document No." := DocumentNo;
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := Description;
                GenJournalLine.Amount := Amount * -1;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;


                //Cr Member
                LineNo := LineNo + 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := 'MSACCO';
                GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                GenJournalLine."Account No." := SavAccount;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Document No." := DocumentNo;
                GenJournalLine."External Document No." := 'MPESA-DPT';
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'MPESA Deposit' + MPESATRANS."Telephone No";//'Premier Monthly Contribution';
                GenJournalLine.Amount := Amount;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

                //Cr Bank Tarrif Charges
                LineNo := LineNo + 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := 'MSACCO';
                GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                GenJournalLine."Account No." := MPESAPaybill;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Document No." := DocumentNo;
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'MPESA Corporate Charges';
                GenJournalLine.Amount := TariffCharges * -1;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

                //Dr Member - total Charges
                LineNo := LineNo + 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := 'MSACCO';
                GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                GenJournalLine."Account No." := SavAccount;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Document No." := DocumentNo;
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'MPESA Deposit Charges';
                GenJournalLine.Amount := TotalCharges;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

                //CR Revenue
                LineNo := LineNo + 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := 'MSACCO';
                GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                GenJournalLine."Account No." := MPesaChargesAccount;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Document No." := DocumentNo;
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'MPESA Deposit Charges';
                GenJournalLine.Amount := MPesaCharges * -1;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

                //Cr CoreTEC
                LineNo := LineNo + 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := 'MSACCO';
                GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                GenJournalLine."Account No." := Msaccoacc;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Document No." := DocumentNo;
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'MSACCO Deposit Charges';
                GenJournalLine.Amount := Msaccocharge * -1;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;


                if Continue = true then begin

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                    GenJournalLine.SetRange("Journal Batch Name", 'MPESA-OL');
                    if GenJournalLine.Find('-') then begin
                        repeat
                            // GLPosting.Run(GenJournalLine);
                        until GenJournalLine.Next = 0;
                    end;
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                    GenJournalLine.SetRange("Journal Batch Name", 'MPESA-OL');
                    GenJournalLine.DeleteAll;
                    Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Mobile Phone No", 'Dear ' + saccoAccount.Name + ', you have deposited Ksh '
                    + Format(Amount * -1) + '  to Account  ' + SavAccount, '', saccoAccount."No.", false);

                    MPESATRANS.Posted := true;
                    //MPESATRANS."Needs Change":=FALSE;
                    MPESATRANS.Messages := MPESATRANS.Messages + ' -:- Account Failed Posting';
                    MPESATRANS."Date Posted" := Today;
                    MPESATRANS."Time Posted" := Time;
                    MPESATRANS.Modify;
                    Commit;
                end;
            end;
        end;
    end;

    local procedure InsertToJournalMDeposits(DocumentNo: Text[30]; TransType: Text[30]; Description: Text[100]; TranDate: Date; Account: Text[30]; Amount: Decimal; Otherd: Text[100]) Response: Integer
    var
        FosaAccountNumber: Text[30];
        RegfeePaid: Boolean;
        LoansRec: Record 52185729;
        SavingsAcc: Record 52185730;
        SavAccount: Code[20];
    begin
        Response := 1;
        RegfeePaid := false;
        Continue := true;

        MPESATRANS.Reset;
        MPESATRANS.SetRange(MPESATRANS."Document No.", DocumentNo);
        if MPESATRANS.FindFirst then begin

            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
            GenJournalLine.SetRange("Journal Batch Name", 'MPESA-OL');
            GenJournalLine.DeleteAll;


            // prevent double posting

            Venderdetails.Reset;
            Venderdetails.SetRange(Venderdetails."Document No.", MPESATRANS."Document No.");
            //Venderdetails.SETRANGE("Customer No.",MPESATRANS."Account No.");
            //Venderdetails.SETFILTER(Venderdetails.Reversed,'=%1',FALSE);
            if Venderdetails.Find('-') then begin

                MPESATRANS."Date Posted" := Today;
                MPESATRANS."Time Posted" := Time;
                MPESATRANS.Posted := true;
                MPESATRANS.Messages := 'Double Posting';
                MPESATRANS.Modify;
                Response := 0;
                Continue := false;
            end;

            GenBatches.Reset;
            GenBatches.SetRange(GenBatches."Journal Template Name", 'MSACCO');
            GenBatches.SetRange(GenBatches.Name, 'MPESA-OL');
            if GenBatches.Find('-') = false then begin
                GenBatches.Init;
                GenBatches."Journal Template Name" := 'MSACCO';
                GenBatches.Name := 'MPESA-OL';
                GenBatches.Description := 'M-PESA Transactions';
                GenBatches.Validate(GenBatches."Journal Template Name");
                GenBatches.Validate(GenBatches.Name);
                GenBatches.Insert;
            end;

            MPesaCharges := 0;
            MPesaChargesAccount := '';
            Msaccocharge := 0;
            Msaccoacc := '';
            TotalCharges := 0;
            TariffCharges := 0;
            AmountToCharge := 0;

            //Get Paybill Bank Account
            MsaccoChargesSetup.Reset;
            MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'PAYBILLBANK');
            if MsaccoChargesSetup.Find('-') then begin
                MsaccoChargesSetup.TestField(MsaccoChargesSetup."Bank Account No");
                MPESAPaybill := MsaccoChargesSetup."Bank Account No";
            end;

            //Get Sacco Deposit Charges G/L
            Charges.Reset;
            Charges.SetRange(Charges."Transaction Type", 'MSACCODEP');
            if Charges.Find('-') then begin
                Charges.TestField(Charges."G/L Account");
                MPesaCharges := Charges."Charge Amount";
                MPesaChargesAccount := Charges."G/L Account";
            end;

            //Get Excise duty G/L
            ExciseDutyGL := GetExciseDutyGL();

            //Get Coretec Vendor Account and Charge Amount
            MsaccoChargesSetup.Reset;
            MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
            if MsaccoChargesSetup.Find('-') then begin
                MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
                Msaccocharge := MsaccoChargesSetup.ChargeAmount;
                Msaccoacc := MsaccoChargesSetup."Vendor No";
            end;



            saccoAccount.Reset;
            saccoAccount.SetRange(saccoAccount.Blocked, saccoAccount.Blocked::" ");
            //saccoAccount.SETRANGE(saccoAccount.Status,saccoAccount.Status::Active);
            saccoAccount.SetFilter(saccoAccount.Status, '%1|%2', saccoAccount.Status::Active, saccoAccount.Status::New);
            saccoAccount.SetRange(saccoAccount."No.", Account);
            if saccoAccount.Find('-') then begin

                //FOSA Account
                SavingsAcc.Reset;
                SavingsAcc.SetRange("Member No.", saccoAccount."Member No.");
                SavingsAcc.SetRange("Loan Disbursement Account", true);
                if SavingsAcc.FindFirst then
                    SavAccount := SavingsAcc."No.";

                //AGENT Agent
                ProdFac.Get(saccoAccount."Product Type");
                SavingsAcc.Reset;
                SavingsAcc.SetRange("Member No.", saccoAccount."Member No.");
                SavingsAcc.SetRange("Product Type", ProdFac."Product ID");
                if SavingsAcc.FindFirst then begin
                    if ProdFac."Product Category" = ProdFac."product category"::"Agent Account" then
                        SavAccount := SavingsAcc."No.";
                end;

                AmountToCharge := Amount * -1;

                TariffDetails.Reset;
                TariffDetails.SetRange(TariffDetails.Code, '');
                if TariffDetails.Find('-') then begin
                    repeat
                        if (AmountToCharge >= TariffDetails."Lower Limit") and (AmountToCharge <= TariffDetails."Upper Limit") then begin
                            TariffCharges := TariffDetails."Charge Amount";
                        end;
                    until TariffDetails.Next = 0;
                end;

                TotalCharges := MPesaCharges + TariffCharges + Msaccocharge;



                //Dr Bank
                LineNo := LineNo + 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := 'MSACCO';
                GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                GenJournalLine."External Document No." := 'MPESA-DPT';
                GenJournalLine."Account No." := MPESAPaybill;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Document No." := DocumentNo;
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := Description;
                GenJournalLine.Amount := Amount * -1;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;


                //Cr Member
                LineNo := LineNo + 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := 'MSACCO';
                GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                GenJournalLine."Account No." := Account;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Document No." := DocumentNo;
                GenJournalLine."External Document No." := 'MPESA-DPT';
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'MPESA Deposit-:' + MPESATRANS."Telephone No";//'Premier Monthly Contribution';
                GenJournalLine.Amount := Amount;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

                //Cr Bank Tarrif Charges
                LineNo := LineNo + 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := 'MSACCO';
                GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                GenJournalLine."Account No." := MPESAPaybill;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Document No." := DocumentNo;
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'MPESA Corporate Charges';
                GenJournalLine.Amount := TariffCharges * -1;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

                //Dr Member - total Charges
                LineNo := LineNo + 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := 'MSACCO';
                GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                GenJournalLine."Account No." := SavAccount;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Document No." := DocumentNo;
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'MPESA Deposit Charges';
                GenJournalLine.Amount := TotalCharges;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

                //CR Revenue
                LineNo := LineNo + 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := 'MSACCO';
                GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                GenJournalLine."Account No." := MPesaChargesAccount;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Document No." := DocumentNo;
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'MPESA Deposit Charges';
                GenJournalLine.Amount := MPesaCharges * -1;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

                //Cr CoreTEC
                LineNo := LineNo + 10000;
                GenJournalLine.Init;
                GenJournalLine."Journal Template Name" := 'MSACCO';
                GenJournalLine."Journal Batch Name" := 'MPESA-OL';
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                GenJournalLine."Account No." := Msaccoacc;
                GenJournalLine.Validate(GenJournalLine."Account No.");
                GenJournalLine."Document No." := DocumentNo;
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'MSACCO Deposit Charges';
                GenJournalLine.Amount := Msaccocharge * -1;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

                if Continue = true then begin
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                    GenJournalLine.SetRange("Journal Batch Name", 'MPESA-OL');
                    if GenJournalLine.Find('-') then begin
                        repeat
                            // GLPosting.Run(GenJournalLine);
                        until GenJournalLine.Next = 0;
                    end;
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                    GenJournalLine.SetRange("Journal Batch Name", 'MPESA-OL');
                    GenJournalLine.DeleteAll;

                    MPESATRANS.Posted := true;
                    MPESATRANS."Needs Change" := false;
                    MPESATRANS."Date Posted" := Today;
                    MPESATRANS."Time Posted" := Time;
                    MPESATRANS.Modify;
                    Commit;
                    if RegfeePaid = true then begin
                        GetPremierRegFee(saccoAccount."No.", GetPremiumRegAccount(saccoAccount."Member No."), DocumentNo);
                    end;
                end;
                //STK- Payments
            end else
                if LoansRec.Get(Account) then begin
                    PostMobileLoan(LoansRec."Loan No.", DocumentNo);
                end else begin
                    MPESATRANS.Posted := false;
                    MPESATRANS."Needs Change" := true;
                    MPESATRANS.Messages := 'Account Not Found';
                    MPESATRANS."Date Posted" := Today;
                    MPESATRANS."Time Posted" := Time;
                    MPESATRANS.Modify;
                end;
        end;

        /*//Loan Payment STK- CHANGE ORDER
         IF Loans.GET(Account) THEN BEGIN
           PostMobileLoan(Loans."Loan No.",DocumentNo);
           END ELSE BEGIN

         saccoAccount.RESET;
         saccoAccount.SETRANGE(saccoAccount.Blocked, saccoAccount.Blocked::" ");
         //saccoAccount.SETRANGE(saccoAccount.Status,saccoAccount.Status::Active);
         saccoAccount.SETFILTER(saccoAccount.Status,'%1|%2',saccoAccount.Status::Active,saccoAccount.Status::New);
         saccoAccount.SETRANGE(saccoAccount."No.",Account);
         IF NOT saccoAccount.FIND('-') THEN BEGIN
                 MPESATRANS.Posted:=FALSE;
                 MPESATRANS."Needs Change":=TRUE;
                 MPESATRANS.Messages := 'Account Not Found';
                 MPESATRANS."Date Posted":=TODAY;
                 MPESATRANS."Time Posted":=TIME;
                 MPESATRANS.MODIFY;
                 Continue := FALSE;
           END;
         END;
         */

        /* SavingsAcc.GET(Account);
         Member.RESET;
         Member.SETRANGE(Status,Member.Status::New);
         Member.SETRANGE("Member No.",SavingsAcc."Member No.");
         IF Member.FIND('-') THEN BEGIN
          saccoAccount.RESET;
          saccoAccount.SETRANGE(saccoAccount.Blocked, saccoAccount.Blocked::" ");
          saccoAccount.SETRANGE("Product Category",saccoAccount."Product Category"::"Deposit Contribution");
          saccoAccount.SETFILTER(saccoAccount.Status,'%1',saccoAccount.Status::New);
          saccoAccount.SETRANGE(saccoAccount."No.",Account);
          saccoAccount.SETFILTER("Balance (LCY)",'>=',2000);
          IF saccoAccount.FIND('-') THEN BEGIN
            Member.Status:=Member.Status::Active;
            Member.MODIFY;
            saccoAccount.Status:=saccoAccount.Status::Active;
            saccoAccount.MODIFY;
            END;
            END;*/






        /*
        ELSE
        BEGIN

     // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Deposits/Shares/Loan POSTING ~~~~~~~~~~~~~~~~~~~~~~~~//

      IF  Account <> '' THEN BEGIN

        IF   Otherd <> '' THEN BEGIN

          Loankeywords.RESET;
          Loankeywords.SETRANGE(Loankeywords.Keyword,Otherd);
          IF  Loankeywords.FINDFIRST THEN BEGIN

            saccoAccount.RESET;
            //saccoAccount.SETRANGE(saccoAccount.Status,saccoAccount.Status::Active);
            saccoAccount.SETFILTER(saccoAccount.Status,'%1|%2',saccoAccount.Status::Active,saccoAccount.Status::New);
            saccoAccount.SETRANGE(saccoAccount."No.",Account);
            IF saccoAccount.FIND('-') THEN BEGIN

            MPesaCharges:=0;
            MPesaChargesAccount:='';
            Msaccocharge:=0;
            Msaccoacc:='';
            TotalCharges:=0;
            TariffCharges:=0;
            AmountToCharge:=0;

            //Get Mpesa Paybill Bank Account
            MsaccoChargesSetup.RESET;
            MsaccoChargesSetup.SETRANGE(MsaccoChargesSetup."Account Type",'PAYBILLBANK');
            IF MsaccoChargesSetup.FIND('-') THEN BEGIN
            MsaccoChargesSetup.TESTFIELD(MsaccoChargesSetup."Bank Account No");
            MPESAPaybill:= MsaccoChargesSetup."Bank Account No";
            END;

            //Get Sacco Deposits Charges G/L
            Charges.RESET;
            Charges.SETRANGE(Charges."Transaction Type",'MSACCODEP');
            IF Charges.FIND('-') THEN BEGIN
            Charges.TESTFIELD(Charges."G/L Account");
            MPesaCharges:=Charges."Charge Amount";
            MPesaChargesAccount:=Charges."G/L Account";
            END;

            //Get Excise duty G/L
            ExciseDutyGL := GetExciseDutyGL();

            //Get Coretec Vendor Account and Charge Amount
            MsaccoChargesSetup.RESET;
            MsaccoChargesSetup.SETRANGE(MsaccoChargesSetup."Account Type",'CORETEC');
            IF MsaccoChargesSetup.FIND('-') THEN BEGIN
            MsaccoChargesSetup.TESTFIELD(MsaccoChargesSetup."Vendor No");
            Msaccocharge := MsaccoChargesSetup.ChargeAmount;
            Msaccoacc:= MsaccoChargesSetup."Vendor No";
            END;

            AmountToCharge:=Amount*-1;

            TariffDetails.RESET;
            TariffDetails.SETRANGE(TariffDetails.Code,'');
            IF TariffDetails.FIND('-') THEN BEGIN
              REPEAT
                IF (AmountToCharge>=TariffDetails."Lower Limit") AND (AmountToCharge<=TariffDetails."Upper Limit") THEN BEGIN
                  TariffCharges:=TariffDetails."Charge Amount";
                END;
              UNTIL TariffDetails.NEXT =0;
            END;

            TotalCharges:=MPesaCharges+TariffCharges+Msaccocharge;
            TRAmount := AmountToCharge - TotalCharges;
            RunBal :=TRAmount;

          IF (Loankeywords."Destination Type" = Loankeywords."Destination Type"::"Deposit Contribution")   OR
             (Loankeywords."Destination Type" = Loankeywords."Destination Type"::"Shares Capital")
             OR  (Loankeywords."Destination Type" = Loankeywords."Destination Type"::"FOSA Deposit")

              THEN
              BEGIN



                  //Dr Bank
                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='MSACCO';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::"Bank Account";
                  GenJournalLine."Account No.":=MPESAPaybill;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."External Document No.":='MPESA-DPT';
                  GenJournalLine."Posting Date":=TranDate;
                  GenJournalLine.Description:=COPYSTR(Description,1,50);
                  GenJournalLine.Amount:=Amount*-1;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;

                  //Cr Bank Tarrif Charges
                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='MSACCO';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::"Bank Account";
                  GenJournalLine."Account No.":=MPesaAccount;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."Posting Date":=TranDate;
                  GenJournalLine.Description:='MPESA Corporate Charges';
                  GenJournalLine.Amount:=TariffCharges*-1;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;

                  //CR Revenue
                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='MSACCO';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::"G/L Account";
                  GenJournalLine."Account No.":=MPesaChargesAccount;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."Posting Date":=TranDate;
                  GenJournalLine.Description:='MPESA Deposit Charges';
                  GenJournalLine.Amount:=MPesaCharges*-1;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;

                  //Cr Coretec
                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='MSACCO';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::Vendor;
                  GenJournalLine."Account No.":=Msaccoacc;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."Posting Date":=TranDate;
                  GenJournalLine.Description:='M-SACCO Deposit Charges';
                  GenJournalLine.Amount:=Msaccocharge *-1;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;

                  //Cr Savings
                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='MSACCO';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::Savings;
                  GenJournalLine."Account No.":= Account;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."External Document No.":='MPESA';
                  GenJournalLine."Posting Date":=TranDate;
                  GenJournalLine.Description:=COPYSTR(Description,1,50);
                  GenJournalLine.Amount:=TRAmount *-1;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;

                  MPESATRANS.Posted:=TRUE;
                  MPESATRANS."Needs Change":=FALSE;
                  MPESATRANS."Date Posted":=TODAY;
                  MPESATRANS."Time Posted":=TIME;
                  MPESATRANS.MODIFY;

                  GenJournalLine.RESET;
                  GenJournalLine.SETRANGE("Journal Template Name",'MSACCO');
                  GenJournalLine.SETRANGE("Journal Batch Name",'MPESA-OL');
                  IF GenJournalLine.FIND('-') THEN BEGIN
                    REPEAT
                      GLPosting.RUN(GenJournalLine);
                    UNTIL GenJournalLine.NEXT = 0;
                  END;
                  GenJournalLine.RESET;
                  GenJournalLine.SETRANGE("Journal Template Name",'MSACCO');
                  GenJournalLine.SETRANGE("Journal Batch Name",'MPESA-OL');
                  GenJournalLine.DELETEALL;

         END;


         IF (Loankeywords."Destination Type" =Loankeywords."Destination Type"::"Loan Repayment")     THEN BEGIN

             loanno :='';

               // brian //

              LoanAppForm2.RESET;
              LoanAppForm2.SETRANGE(LoanAppForm2."Loan Account",saccoAccount."No.");
              LoanAppForm2.SETRANGE(LoanAppForm2."Loan Product Type",Loankeywords."Loan Code");
              IF LoanAppForm2.FIND('-') THEN BEGIN
                REPEAT

                  LoanAppForm2.CALCFIELDS(LoanAppForm2."Outstanding Balance",LoanAppForm2."Outstanding Interest");
                  IF (LoanAppForm2."Outstanding Balance" +LoanAppForm2."Outstanding Interest")>0 THEN
                    loanno := LoanAppForm2."Loan No.";

                UNTIL LoanAppForm2.NEXT =0 ;
              END;

                      // ERROR(loanno);

            IF loanno<>'' THEN BEGIN //Check if loan number is empty

                LoanAppForm.RESET;
                LoanAppForm.SETRANGE(LoanAppForm."Loan No.",loanno);
                IF LoanAppForm.FIND('+') THEN BEGIN

                  LoanAppForm.CALCFIELDS(LoanAppForm."Outstanding Balance",LoanAppForm."Outstanding Interest");

                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='MSACCO';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::"Bank Account";
                  GenJournalLine."Account No.":=MPESAPaybill;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."External Document No.":='MPESA-DPT';
                  GenJournalLine."Posting Date":=TranDate;
                  GenJournalLine.Description:=COPYSTR(Description,1,50);
                  GenJournalLine.Amount:=Amount*-1;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;

                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='MSACCO';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::"Bank Account";
                  GenJournalLine."Account No.":=MPesaAccount;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."Posting Date":=TranDate;
                  GenJournalLine.Description:='MPESA Corporate Charges';
                  GenJournalLine.Amount:=TariffCharges*-1;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;

                  //CR Revenue
                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='MSACCO';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::"G/L Account";
                  GenJournalLine."Account No.":=MPesaChargesAccount;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."Posting Date":=TranDate;
                  GenJournalLine.Description:='MPESA Deposit Charges';
                  GenJournalLine.Amount:=MPesaCharges*-1;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;

                  //CR Coretec
                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='MSACCO';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::Vendor;
                  GenJournalLine."Account No.":=Msaccoacc;
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."Posting Date":=TranDate;
                  GenJournalLine.Description:='M-SACCO Deposit Charges';
                  GenJournalLine.Amount:=Msaccocharge *-1;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                  GenJournalLine."Shortcut Dimension 2 Code":=saccoAccount."Global Dimension 2 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;

                  IF LoanAppForm."Outstanding Interest">0 THEN BEGIN

                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='MSACCO';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::Savings;
                  GenJournalLine."Account No.":=LoanAppForm."Loan Account";
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."External Document No.":='';
                  GenJournalLine."Posting Date":=TranDate;
                  GenJournalLine.Description:='M-SACCO Interest Payment';
                  IF RunBal > LoanAppForm."Outstanding Interest" THEN
                    GenJournalLine.Amount:=-LoanAppForm."Outstanding Interest"
                  ELSE
                    GenJournalLine.Amount:=-RunBal;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::"Interest Paid";
                  IF GenJournalLine."Shortcut Dimension 1 Code" = '' THEN BEGIN
                    GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                    GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  END;
                  GenJournalLine."Loan No":=LoanAppForm."Loan No.";
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;

                  RunBal:=RunBal+GenJournalLine.Amount;
                END;
                IF RunBal>0 THEN BEGIN

                  LineNo:=LineNo+10000;
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name":='MSACCO';
                  GenJournalLine."Journal Batch Name":='MPESA-OL';
                  GenJournalLine."Line No.":=LineNo;
                  GenJournalLine."Account Type":=GenJournalLine."Account Type"::Savings;
                  GenJournalLine."Account No.":=LoanAppForm."Loan Account";
                  GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                  GenJournalLine."Document No.":=DocumentNo;
                  GenJournalLine."External Document No.":='';
                  GenJournalLine."Posting Date":=TranDate;
                  GenJournalLine.Description:='M-SACCO Loan Repayment';
                  GenJournalLine.Amount:=-RunBal;
                  GenJournalLine.VALIDATE(GenJournalLine.Amount);
                  GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::Repayment;
                  GenJournalLine."Loan No":=LoanAppForm."Loan No.";
                  IF GenJournalLine."Shortcut Dimension 1 Code" = '' THEN BEGIN
                  GenJournalLine."Shortcut Dimension 1 Code":=saccoAccount."Global Dimension 1 Code";
                  GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                  END;
                  IF GenJournalLine.Amount<>0 THEN
                  GenJournalLine.INSERT;

                END;

                MPESATRANS.Posted:=TRUE;
                MPESATRANS."Needs Change":=FALSE;
                MPESATRANS."Date Posted":=TODAY;
                MPESATRANS."Time Posted":=TIME;
                MPESATRANS.MODIFY;

                GenJournalLine.RESET;
                GenJournalLine.SETRANGE("Journal Template Name",'MSACCO');
                GenJournalLine.SETRANGE("Journal Batch Name",'MPESA-OL');
                IF GenJournalLine.FIND('-') THEN BEGIN
                  REPEAT
                    GLPosting.RUN(GenJournalLine);
                  UNTIL GenJournalLine.NEXT = 0;
                END;
                GenJournalLine.RESET;
                GenJournalLine.SETRANGE("Journal Template Name",'MSACCO');
                GenJournalLine.SETRANGE("Journal Batch Name",'MPESA-OL');
                GenJournalLine.DELETEALL;

                         // SEND SMS TO MEMBER //

                         SaccoAccount1.RESET;
                         SaccoAccount1.SETRANGE(SaccoAccount1."No.",LoanAppForm."Member No.");
                         IF SaccoAccount1.FIND('-') THEN BEGIN

                            ProdFac.RESET;
                            ProdFac.SETRANGE(ProdFac."Product ID",LoanAppForm."Loan Product Type");
                            IF ProdFac.FIND('-') THEN BEGIN

                          Sendsms.SendSms(OptionSMS::MSACCO,SaccoAccount1."Mobile Phone No",'Dear '+ SaccoAccount1.Name + ', you have deposited Ksh '+ FORMAT(Amount * -1) + '  to Loan Type '+ ProdFac."Product Description",'',SaccoAccount1."No.",FALSE
    );

                            END
                         END;

                      END;

                    END ELSE BEGIN

                      MPESATRANS.Posted:=FALSE;
                      MPESATRANS."Needs Change":=TRUE;
                      MPESATRANS.Messages:='' +saccoAccount."No."+ ', loan type code '+Loankeywords."Loan Code"+', does not exist';
                      MPESATRANS.Changed:=FALSE;
                      MPESATRANS.MODIFY;

                    END;  //End of Checking if loan no exist

                  END; //End checking if loan repayment

                  END
                ELSE
                BEGIN

                  MPESATRANS.Messages:='Account No. ' + MPESATRANS."Account No." + ' not found:';
                  MPESATRANS."Needs Change":=TRUE;
                  MPESATRANS.Posted:=FALSE;
                  MPESATRANS.MODIFY;
                  Response :=2;

                END;

              END;

            END
          END;
        END

      END;
      */

    end;


    procedure PostScoolFeesLoan()
    var
        SavAcc: Record 52185730;
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
        Temp: Record 52185782;
        Jtemplate: Code[20];
        JBatch: Code[20];
        EndMonth: Date;
        BatchLines: Record 52185737;
        LoanApps: Record 52185729;
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
        AccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
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
        SendSMS: Codeunit SendSms;
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
        LoanApp: Record 52185729;
        LoanAp: Record 52185729;
        Text0003: label 'This member does not have a depoits account : Member No. %1';
        CountNoLN: Integer;
        TopUPGL: Code[10];
        "Topup%": Decimal;
        BridgLoan: Decimal;
        BLoanNo: Code[10];
    begin

        LoanProcessingGL := '301028';

        MsaccoChargesSetup.Reset;
        MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
        if MsaccoChargesSetup.Find('-') then begin
            MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
            Msaccocharge := MsaccoChargesSetup.ChargeAmount;
            Msaccoacc := MsaccoChargesSetup."Vendor No";
        end;


        MsaccoLoans.Reset;
        //MsaccoLoans.SETRANGE(MsaccoLoans.Status,MsaccoLoans.Status::Pending);
        MsaccoLoans.SetFilter(MsaccoLoans."Loan Product Type", '%1|%2', MsaccoLoans."loan product type"::"School Fees Loan", MsaccoLoans."loan product type"::"Other Loans");
        MsaccoLoans.SetFilter(MsaccoLoans."Loan Code", '<>%1|<>%2', '120', '121');
        MsaccoLoans.SetRange(MsaccoLoans.Posted, false);
        if MsaccoLoans.Find('-') then begin
            repeat


                Loans.Reset;
                Loans.SetRange("Loan No.", MsaccoLoans."Loan No");
                Loans.SetRange(Status, Loans.Status::Approved);
                Loans.SetRange(Posted, false);
                if Loans.Find('-') then begin
                    //Post Loan
                    //LoanProcess.PostSingleLoan(Loans."Loan No.");

                    //

                    Jtemplate := 'MSACCO';
                    JBatch := 'MSACCOLN';

                    //('MSACCO','MSACCOLN');


                    EndMonth := CalcDate('-1D', CalcDate('1M', Dmy2date(1, Date2dmy(Today, 2), Date2dmy(Today, 3))));
                    RemainingDays := (EndMonth - Today) + 1;
                    TMonthDays := Date2dmy(EndMonth, 1);
                    //PRORATED DAYS

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                    GenJournalLine.SetRange("Journal Batch Name", JBatch);
                    GenJournalLine.DeleteAll;


                    loanno := Loans."Loan No.";
                    if LoanApps.Get(Loans."Loan No.") then begin
                        //Prevent Double Posting
                        GLEntry.Reset;
                        GLEntry.SetRange("Document No.", loanno);
                        if GLEntry.Find('-') then begin

                            LoanApps.Advice := true;
                            LoanApps."Advice Type" := LoanApps."advice type"::"Fresh Loan";
                            LoanApps."Disbursement Date" := Today;
                            LoanApps.Validate("Disbursement Date");
                            LoanApps.Posted := true;
                            LoanApps.Modify;

                            AdviceLoan(LoanApps."Loan No.", true);

                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans."Approved Amount" := Loans."Approved Amount";
                            MsaccoLoans."Ghris Password" := '';
                            MsaccoLoans.Remarks := 'Successful';
                            MsaccoLoans.Modify;
                            exit;
                        end;
                        //End Doubble Posting
                        GenSetup.Get;
                        if CustomerRecord.Get(LoanApps."Member No.") then begin

                            if LoanApps.Status <> LoanApps.Status::Approved then
                                Error('Loan status must be Approved for you to post Loan. - ' + LoanApps."Loan No.");


                            ///RunningDate:=Batches."Posting Date";

                            //Generate and post Approved Loan Amount
                            if not GenBatch.Get(Jtemplate, JBatch) then begin
                                GenBatch.Init;
                                GenBatch."Journal Template Name" := Jtemplate;
                                GenBatch.Name := JBatch;
                                GenBatch.Insert;
                            end;

                            AccType := Acctype::Credit;
                            AccNo := LoanApps."Loan Account";
                            TransType := Transtype::Loan;
                            BalAccType := Balacctype::"G/L Account";
                            BalAccNo := '';
                            Amt := 0;
                            LineNo := LineNo + 10000;
                            Descr := '';
                            Descr := ProdFac."Product Description" + ' ' + 'Loan';
                            Descr := CopyStr(Descr, 1, 50);
                            //Approved amount
                            if LoanApps."Approved Amount" > 0 then
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, Descr, LoanApps."Amount To Disburse", AccNo, Today, BalAccType,
                              BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                            if LoanApps."Mode of Disbursement" = LoanApps."mode of disbursement"::"Full Disbursement" then begin
                                PaySched.Reset;
                                PaySched.SetRange(PaySched."Loan No.", LoanApps."Loan No.");
                                if PaySched.Find('-') then begin
                                    repeat
                                        if (PaySched."Payment Options" = PaySched."payment options"::"M-PESA") or (PaySched."Payment Options" = PaySched."payment options"::"M-PESA") then begin
                                            AccNo := '';
                                            Amt := 0;
                                            AccType := Acctype::"Bank Account";
                                            if LoanApps."All Posting through Savings Ac" = true then begin
                                                BalAccType := Balacctype::Savings;
                                                BalAccNo := LoanApps."Disbursement Account No";
                                            end else begin
                                                BalAccType := Balacctype::"G/L Account";
                                                BalAccNo := '';
                                            end;
                                            if PaySched."Payment Options" = PaySched."payment options"::"M-PESA" then
                                                AccNo := Temp."MPESA Disbursement A/c"
                                            else
                                                AccNo := Temp."Cheque Disbursement A/c";
                                            TransType := Transtype::" ";
                                            BalAccType := Balacctype::Savings;
                                            LineNo := LineNo + 10000;
                                            Descr := '';
                                            Descr := ProdFac."Product Description" + ' ' + 'Loan';
                                            Descr := CopyStr(Descr, 1, 50);
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, Descr, -PaySched.Amount, AccNo,
                                            Today, BalAccType, BalAccNo, '', '', '', TransType, '', '', '', 0, '', 0);
                                        end else begin
                                            AccNo := LoanApps."Disbursement Account No";
                                            AccType := Acctype::Savings;
                                            BalAccType := Balacctype::"G/L Account";
                                            BalAccNo := '';
                                            TransType := Transtype::" ";
                                            BalAccType := Balacctype::"G/L Account";
                                            LineNo := LineNo + 10000;
                                            Descr := '';
                                            Descr := ProdFac."Product Description" + ' ' + 'Loan';
                                            Descr := CopyStr(Descr, 1, 50);
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, Descr, -LoanApps."Amount To Disburse", AccNo,
                                           Today, BalAccType, BalAccNo, '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);
                                        end;
                                    until PaySched.Next = 0;
                                end else begin
                                    //ERROR('Payment schedule must be provided');
                                    AccNo := LoanApps."Disbursement Account No";
                                    AccType := Acctype::Savings;
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    TransType := Transtype::" ";
                                    BalAccType := Balacctype::"G/L Account";
                                    LineNo := LineNo + 10000;
                                    Descr := '';
                                    Descr := ProdFac."Product Description" + ' ' + 'Loan';
                                    Descr := CopyStr(Descr, 1, 50);
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, Descr, -LoanApps."Amount To Disburse", AccNo,
                                   Today, BalAccType, BalAccNo, '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);

                                end;
                            end else begin
                                /*Yet to come
                                */


                            end;

                            //Auto Activate Dormant On Loan Posting
                            SavAcc.Reset;
                            SavAcc.SetRange("No.", LoanApps."Disbursement Account No");
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

                                            LineNo := LineNo + 10000;
                                            AccType := Acctype::"G/L Account";
                                            AccNo := TransactionCharges."G/L Account";
                                            TransType := Transtype::" ";
                                            if LoanApps."All Posting through Savings Ac" = true then begin
                                                BalAccType := Balacctype::Savings;
                                                BalAccNo := LoanApps."Disbursement Account No";
                                            end else begin
                                                BalAccType := Balacctype::"G/L Account";
                                                BalAccNo := '';
                                            end;
                                            Amt := TransactionCharges."Charge Amount";
                                            Amt := Amt * -1;
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, TransactionCharges.Description + LoanApps."Disbursement Account No", Amt, AccNo, Today, BalAccType,
                                          BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                            //If excise duty involved
                                            if TransactionCharges."Recover Excise Duty" = true then begin
                                                GenSetup.TestField("Excise Duty G/L");
                                                GenSetup.TestField("Excise Duty (%)");
                                                LineNo := LineNo + 10000;
                                                AccType := Acctype::"G/L Account";
                                                AccNo := GenSetup."Excise Duty G/L";
                                                TransType := Transtype::" ";
                                                BalAccType := Balacctype::Savings;
                                                BalAccNo := LoanApps."Disbursement Account No";
                                                Amt := Amt * GenSetup."Excise Duty (%)" * 0.01;

                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, CopyStr((TransactionCharges.Description + LoanApps."Disbursement Account No" + '-Excise Duty'), 1, 50), Amt, AccNo, Today, BalAccType,
                                                BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                                            end;
                                        until TransactionCharges.Next = 0;
                                    end;
                                end;
                            end;
                            //End Dormanct Activation ADDED

                            ///-----Shares Purchase **Start
                            //Deposit/share purchase
                            if LoanApps."Loans - Deposit Purchase" > 0 then begin

                                //debit savings
                                LineNo := LineNo + 10000;
                                AccType := Acctype::Savings;
                                AccNo := LoanApps."Disbursement Account No";
                                TransType := Transtype::" ";
                                BalAccType := Balacctype::"G/L Account";
                                BalAccNo := '';
                                Amt := LoanApps."Loans - Deposit Purchase";


                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, 'Deposit Purchase', Amt, AccNo, Today, BalAccType,
                              BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                                //Credit deposits
                                AccNo := '';
                                SavAcc.Reset;
                                SavAcc.SetRange(SavAcc."Member No.", LoanApps."Member No.");
                                SavAcc.SetRange(SavAcc."Product Category", SavAcc."product category"::"Deposit Contribution");
                                if SavAcc.Find('-') then
                                    AccNo := SavAcc."No."
                                else
                                    Error(Text0003, LoanApps."Member No.");


                                LineNo := LineNo + 10000;
                                AccType := Acctype::Savings;
                                TransType := Transtype::" ";
                                BalAccType := Balacctype::"G/L Account";
                                BalAccNo := '';
                                Amt := LoanApps."Loans - Deposit Purchase";



                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, 'Share Boost', -Amt, AccNo, Today, BalAccType,
                              BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                                ///Advice ShareBoost
                                if LoanApps."Loans - Deposit Purchase" > 0 then begin
                                    SavAcc.Reset;
                                    SavAcc.SetRange(SavAcc."Member No.", LoanApps."Member No.");
                                    SavAcc.SetRange(SavAcc."Product Category", SavAcc."product category"::"Deposit Contribution");
                                    if SavAcc.Find('-') then
                                        //SavAcc.VALIDATE(SavAcc."Monthly Contribution");
                                        LoansProcess.AdviceShares(SavAcc, LoanApps."Loans - Deposit Purchase", SavAcc."Monthly Contribution");
                                end;
                            end;
                            ///-----Shares Purchase **End


                            PCharges.Reset;
                            PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
                            PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::General);
                            if PCharges.Find('-') then begin
                                repeat
                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::"G/L Account";
                                    AccNo := PCharges."Charges G_L Account";
                                    TransType := Transtype::" ";
                                    BalAccType := Balacctype::Savings;
                                    BalAccNo := LoanApps."Disbursement Account No";
                                    if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                        Amt := (LoanApps."Approved Amount" * (PCharges.Percentage / 100))
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
                                                        if (LoanApps."Approved Amount" >= TariffDetails."Lower Limit") and (LoanApps."Approved Amount" <= TariffDetails."Upper Limit") then begin
                                                            if TariffDetails."Use Percentage" = true then begin
                                                                Amt := LoanApps."Approved Amount" * TariffDetails.Percentage * 0.01;
                                                            end else begin
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



                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                                  BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                                    //If excise duty involved
                                    if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin
                                        GenSetup.TestField("Excise Duty G/L");
                                        GenSetup.TestField("Excise Duty (%)");
                                        LineNo := LineNo + 10000;
                                        AccType := Acctype::"G/L Account";
                                        AccNo := GenSetup."Excise Duty G/L";
                                        TransType := Transtype::" ";
                                        BalAccType := Balacctype::Savings;
                                        BalAccNo := LoanApps."Disbursement Account No";
                                        Amt := Amt * GenSetup."Excise Duty (%)" * 0.01;

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, PCharges."Charge Description" + '- Excise Duty', Amt, AccNo, Today, BalAccType,
                                        BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                                    end;


                                until PCharges.Next = 0;

                            end;


                            if LoanApps."Picked Mobile Loan" = true then begin
                                //Mobile Loans
                                MsaccoChargesSetup.Reset;
                                MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
                                if MsaccoChargesSetup.Find('-') then begin
                                    MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
                                    Msaccocharge := MsaccoChargesSetup.ChargeAmount;
                                    Msaccoacc := MsaccoChargesSetup."Vendor No";
                                end;

                                //Dr Vendor Share Paid +++++++++++++++++++++++++
                                LineNo := LineNo + 10000;
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Savings, loanno, 'Loan Msacco Fee: ' + LoanApps."Loan No.", Msaccocharge
                                , LoanApps."Disbursement Account No", Today, Balacctype::"G/L Account", '', 'MSACCO LOANS', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code",
                                Transtype::" ", LoanApps."Loan No.", '', '', 0, '', 0);

                                //Cr Vendor Share Paid +++++++++++++++++++++++++
                                LineNo := LineNo + 10000;
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Vendor, loanno, 'Loan Msacco Fee : ' + LoanApps."Loan No.", Msaccocharge * -1
                                , Msaccoacc, Today, Balacctype::"G/L Account", '', 'MSACCO LOANS', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code",
                                Transtype::" ", LoanApps."Loan No.", '', '', 0, '', 0);

                            end;




                            TotalCleared := 0;
                            BridgLoan := 0;


                            TopUp.Reset;
                            TopUp.SetRange(TopUp."Loan No.", LoanApps."Loan No.");
                            if TopUp.Find('-') then begin
                                repeat
                                    TopUp.Validate(TopUp."Loan Top Up");



                                    //Loan repayment
                                    TotalCleared := TotalCleared + TopUp."Principle Top Up" + TopUp."Interest Top Up";



                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::Credit;
                                    AccNo := TopUp."Loan Account";
                                    TransType := Transtype::Repayment;
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    Amt := TopUp."Principle Top Up" * -1;

                                    //**AdviceLoan(TopUp."Loan Top Up",TRUE);


                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, 'Top up Principle' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                  BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);

                                    //Clear bills
                                    if LoanApp.Get(TopUp."Loan Top Up") then begin
                                        if ProdFac.Get(LoanApp."Loan Product Type") then begin
                                            LineNo := LineNo + 10000;
                                            AccType := Acctype::Credit;
                                            AccNo := TopUp."Loan Account";
                                            TransType := Transtype::Bills;
                                            BalAccType := Balacctype::"G/L Account";
                                            BalAccNo := ProdFac."Billed Account";
                                            Amt := TopUp."Outstanding Bill" * -1;


                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, 'Outs. Bill' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                          BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);
                                        end;
                                    end;

                                    //Interest

                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::Credit;
                                    AccNo := TopUp."Loan Account";
                                    TransType := Transtype::"Interest Paid";
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    Amt := (TopUp."Interest Top Up" + TopUp."Untransfered Interest") * -1;
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, 'Top up Interest' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                    BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);

                                    ///ad
                                    //Top Up charges
                                    TopUPGL := '';
                                    "Topup%" := 0;
                                    PCharges.Reset;
                                    PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
                                    PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"Top up");
                                    if PCharges.Find('-') then begin
                                        repeat
                                            PCharges.TestField(PCharges."Charges G_L Account");

                                            LineNo := LineNo + 10000;
                                            AccType := Acctype::"G/L Account";
                                            AccNo := PCharges."Charges G_L Account";
                                            TopUPGL := PCharges."Charges G_L Account";
                                            "Topup%" := PCharges.Percentage;
                                            TransType := Transtype::" ";
                                            // BalAccType:=BalAccType::Savings;
                                            // BalAccNo :=LoanApps."Disbursement Account No";//Commented on 06.05.2021
                                            if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") and (PCharges."Charging Option" = PCharges."charging option"::"On Approved Amount") then begin
                                                if ChargeExtraComms = true then
                                                    Amt := (LoanApps."Approved Amount" * (PCharges.Percentage + PCharges."Additional Charge %") / 100)
                                                else
                                                    Amt := (LoanApps."Approved Amount" * (PCharges.Percentage / 100));
                                            end else
                                                if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") and (PCharges."Charging Option" = PCharges."charging option"::"On Net Amount") then begin
                                                    if ChargeExtraComms = true then
                                                        Amt := ((TopUp."Principle Top Up" + TopUp."Interest Top Up") * (PCharges.Percentage + PCharges."Additional Charge %") / 100)
                                                    else
                                                        Amt := ((TopUp."Principle Top Up" + TopUp."Interest Top Up") * (PCharges.Percentage / 100))
                                                end else
                                                    Amt := PCharges."Charge Amount";

                                            if Amt < PCharges.Minimum then
                                                Amt := PCharges.Minimum;

                                            if Amt > PCharges.Maximum then
                                                Amt := PCharges.Maximum;

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
                            //IF LoanApps."All Posting through Savings Ac"=TRUE THEN BEGIN
                            if TotalCleared > 0 then begin
                                LineNo := LineNo + 10000;
                                AccType := Acctype::Savings;
                                AccNo := LoanApps."Disbursement Account No";
                                TransType := Transtype::" ";
                                BalAccType := Balacctype::"G/L Account";
                                BalAccNo := '';
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, CopyStr(('Total Loan Offset-' + LoanApps."Loan Product Type Name" + '-' + LoanApps."Loan No."), 1, 50), TotalCleared, AccNo, Today, BalAccType,
                                BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);
                            end;
                            //GL
                            //Added 06.05.2021
                            if BridgLoan > 0 then begin
                                if BridgLoan > 50000 then BridgLoan := 50000;
                                LineNo := LineNo + 10000;
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::"G/L Account", loanno, PCharges."Charge Description", -BridgLoan, TopUPGL, Today, BalAccType,
                                BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                BLoanNo := LoansProcess.CreateBridgingLoan(LoanApps."Member No.", TotalCleared);
                                if BLoanNo <> '' then begin
                                    if BLoanRec.Get(BLoanNo) then begin

                                        AccType := Acctype::Credit;
                                        AccNo := BLoanRec."Loan Account";
                                        TransType := Transtype::Loan;
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := '';

                                        LineNo := LineNo + 10001;
                                        Descr := BLoanRec."Loan Product Type Name";

                                        //Approved amount
                                        if BLoanRec."Approved Amount" > 0 then begin

                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, Descr, TotalCleared, AccNo, Today, BalAccType,
                                            BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);


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
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Credit, loanno, Descr, TotalCleared * -1, BLoanRec."Loan Account", Today, BalAccType,
                                            BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);
                                            //Debit Fosa

                                            LineNo := LineNo + 10001;
                                            Descr := BLoanRec."Loan Product Type Name" + '-Interest Paid';
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Savings, loanno, Descr, BridgLoan * 1, LoanApps."Disbursement Account No", Today, BalAccType,
                                            '', '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", Transtype::" ", BLoanRec."Loan No.", '', '', 0, '', 0);

                                            //Interest Due
                                            LineNo := LineNo + 10000;
                                            Descr := BLoanRec."Loan Product Type Name" + '- Interest Due';
                                            TransType := Transtype::"Interest Due";
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, Descr, BridgLoan, AccNo, Today, BalAccType,
                                            BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);


                                            //Interest Paid
                                            LineNo := LineNo + 10000;
                                            Descr := BLoanRec."Loan Product Type Name" + '- Interest Paid';
                                            TransType := Transtype::"Interest Paid";
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, Descr, BridgLoan * -1, AccNo, Today, BalAccType,
                                            BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);

                                            // END;
                                            //END;

                                        end;
                                    end;
                                end;
                                //END;
                                //End of 06.05.2021 Additions
                            end;

                            ///ad
                            OtherComms := 0;
                            //Clearing external debts
                            OtherCommitments.Reset;
                            OtherCommitments.SetRange(OtherCommitments."Loan No.", LoanApps."Loan No.");
                            if OtherCommitments.Find('-') then begin
                                repeat
                                    Temp.TestField(Temp."Bankers Cheque Account");

                                    TotalCleared := TotalCleared + TopUp."Principle Top Up" + TopUp."Interest Top Up";
                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::"Bank Account";
                                    AccNo := Temp."Bankers Cheque Account";
                                    TransType := Transtype::" ";
                                    if LoanApps."All Posting through Savings Ac" = true then begin
                                        BalAccType := Balacctype::Savings;
                                        BalAccNo := LoanApps."Disbursement Account No";
                                    end else begin
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := '';
                                    end;


                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, 'External Loan Cleared', OtherCommitments.Amount * -1, AccNo, Today, BalAccType,
                                 BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);



                                    PCharges.Reset;
                                    PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
                                    PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"External Loan");
                                    if PCharges.Find('-') then begin
                                        repeat
                                            PCharges.TestField(PCharges."Charges G_L Account");

                                            LineNo := LineNo + 10000;
                                            AccType := Acctype::"G/L Account";
                                            AccNo := PCharges."Charges G_L Account";
                                            TransType := Transtype::" ";
                                            if LoanApps."All Posting through Savings Ac" = true then begin
                                                BalAccType := Balacctype::Savings;
                                                BalAccNo := LoanApps."Disbursement Account No";
                                            end else begin
                                                BalAccType := Balacctype::"G/L Account";
                                                BalAccNo := '';
                                            end;
                                            if (PCharges."Use Percentage" = true) then
                                                Amt := (OtherCommitments.Amount * (PCharges.Percentage / 100))
                                            else
                                                Amt := OtherCommitments.Amount;

                                            if Amt < PCharges.Minimum then
                                                Amt := PCharges.Minimum;

                                            if Amt > PCharges.Maximum then
                                                Amt := PCharges.Maximum;

                                            Amt := Amt * -1;



                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                                           BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                            if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin
                                                GenSetup.TestField("Excise Duty G/L");
                                                GenSetup.TestField("Excise Duty (%)");
                                                LineNo := LineNo + 10000;
                                                AccType := Acctype::"G/L Account";
                                                AccNo := GenSetup."Excise Duty G/L";
                                                TransType := Transtype::" ";
                                                BalAccType := Balacctype::Savings;
                                                BalAccNo := LoanApps."Disbursement Account No";
                                                Amt := Amt * GenSetup."Excise Duty (%)" * 0.01;

                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, loanno, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                                                BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                                            end;



                                        until PCharges.Next = 0;
                                    end;
                                until OtherCommitments.Next = 0;
                            end;

                            //Get if interest due is posted on disbursement from setups

                            if ProdFac.Get(LoanApps."Loan Product Type") then begin
                                if ProdFac."Compute Interest Due on Postin" = ProdFac."compute interest due on postin"::"Full Interest" then begin
                                    Amt := 0;
                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::Credit;
                                    AccNo := LoanApps."Loan Account";
                                    TransType := Transtype::"Interest Due";
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := ProdFac."Loan Interest Account [G/L]";
                                    Amt := LoanApps."Amount To Disburse" * LoanApps.Interest / 12 * 0.01;
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanApps."Loan No.", 'Interest Due' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                    BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                end else
                                    if ProdFac."Compute Interest Due on Postin" = ProdFac."compute interest due on postin"::"Pro-rata" then begin
                                        //PRORATED DAYS
                                        EndMonth := CalcDate('-1D', CalcDate('1M', Dmy2date(1, Date2dmy(Today, 2), Date2dmy(Today, 3))));
                                        RemainingDays := DaysPast + (EndMonth - Today) + 1;
                                        TMonthDays := Date2dmy(EndMonth, 1);
                                        Amt := 0;
                                        LineNo := LineNo + 10000;
                                        AccType := Acctype::Credit;
                                        AccNo := LoanApps."Loan Account";
                                        TransType := Transtype::"Interest Due";
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := ProdFac."Loan Interest Account [G/L]";
                                        Amt := LoanApps."Amount To Disburse" * LoanApps.Interest / 12 * 0.01 * RemainingDays / TMonthDays;
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanApps."Loan No.", 'Interest Due' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                        BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                    end;

                                //Bill if Upfront Bill
                                if ProdFac."Compute Bills on Posting" = ProdFac."compute bills on posting"::"Full Amount" then begin
                                    Amt := 0;
                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::Credit;
                                    AccNo := LoanApps."Loan Account";
                                    TransType := Transtype::Bills;
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := ProdFac."Billed Account";
                                    Amt := LoanApps."Amount To Disburse";
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanApps."Loan No.", 'Bills' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                    BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                end else
                                    if ProdFac."Compute Bills on Posting" = ProdFac."compute bills on posting"::"One Installment" then begin
                                        Amt := 0;
                                        LineNo := LineNo + 10000;
                                        AccType := Acctype::Credit;
                                        AccNo := LoanApps."Loan Account";
                                        TransType := Transtype::Bills;
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := ProdFac."Billed Account";
                                        Amt := LoanApps.Repayment - LoanApps."Loan Interest Repayment";
                                        if Amt > 0 then begin
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanApps."Loan No.", 'Bills' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                            BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                                        end;
                                    end;

                            end;
                            GenSetup.Get;
                            Members.Get(LoanApps."Member No.");
                            if GenSetup."Disable Loan SMS" = false then
                                SendSMS.SendSms(Sourcetype::"Loan Posted", Members."Mobile Phone No", 'Your ' + LoanApps."Loan Product Type Name" + ' of ' + Format(LoanApps."Approved Amount") + ' ' + 'has been credited to your account'
                                            , LoanApps."Loan No.", LoanApps."Disbursement Account No", false);



                            LoanApps.Advice := true;
                            LoanApps."Advice Type" := LoanApps."advice type"::"Fresh Loan";
                            LoanApps."Disbursement Date" := Today;
                            LoanApps.Validate("Disbursement Date");
                            LoanApps.Posted := true;
                            LoanApps.Modify;

                            AdviceLoan(LoanApps."Loan No.", true);
                        end;
                    end;
                    //MESSAGE('t');

                    JournalPosting.CompletePosting(Jtemplate, JBatch);

                    //

                    //Advice Loan
                    TopUp.Reset;
                    TopUp.SetRange(TopUp."Loan No.", LoanApps."Loan No.");
                    if TopUp.Find('-') then begin
                        repeat
                            if LoanAp.Get(TopUp."Loan Top Up") then begin
                                AdviceLoan(LoanAp."Loan No.", true);
                            end;
                        until TopUp.Next = 0;
                    end;
                    AdviceLoan(Loans."Loan No.", false);

                    MsaccoLoans.Posted := true;
                    MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                    MsaccoLoans."Date Posted" := CurrentDatetime;
                    MsaccoLoans."Approved Amount" := Loans."Approved Amount";
                    MsaccoLoans."Ghris Password" := '';
                    MsaccoLoans.Remarks := 'Successful';
                    MsaccoLoans.Modify;
                end;

                Loans.Reset;
                Loans.SetRange("Loan No.", MsaccoLoans."Loan No");
                Loans.SetRange(Status, Loans.Status::Approved);
                Loans.SetRange(Posted, true);
                if Loans.Find('-') then begin
                    MsaccoLoans.Posted := true;
                    MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                    MsaccoLoans."Date Posted" := CurrentDatetime;
                    MsaccoLoans."Approved Amount" := Loans."Approved Amount";
                    MsaccoLoans.Remarks := 'Successful';
                    MsaccoLoans."Ghris Password" := '';
                    MsaccoLoans.Modify;
                end;

                Loans.Reset;
                Loans.SetRange("Loan No.", MsaccoLoans."Loan No");
                Loans.SetRange(Status, Loans.Status::Rejected);
                Loans.SetRange(Posted, false);
                if Loans.Find('-') then begin
                    MsaccoLoans.Posted := true;
                    MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                    MsaccoLoans."Date Posted" := CurrentDatetime;
                    MsaccoLoans."Ghris Password" := '';
                    //MsaccoLoans."Approved Amount":= Loans."Approved Amount";
                    MsaccoLoans.Remarks := 'Loan Rejected';
                    MsaccoLoans.Modify;
                end;
            //CountNoLN:=CountNoLN+1;
            until MsaccoLoans.Next = 0;
        end;

    end;


    procedure GetAppraisaOrdinaryLoans(Telephone: Text[30]; LoanCode: Code[10]) QualifiedAmountFinal: Decimal
    var
        QualifiedAmount: Text;
        LoanProductType: Text[10];
        LoanProductTypeName: Text;
        Members: Record 52185700;
        StandingOrderHeader: Record 52185717;
        StandingOrders: Record 52185718;
        sto: Decimal;
        DepositCont: Decimal;
        AvailableAmount: Decimal;
    begin
        Continue := true;

        SaccoAccMemberNo := '';
        QualifiedAmountFinal := 0;
        QualifyingAfterDed := 0;
        Telephone := Telephone;
        sto := 0;
        OutstandingAmount := 0;
        DepositCont := 0;

        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."Transactional Mobile No", Telephone);
        saccoAccount.SetFilter(saccoAccount.Status, '%1|%2', saccoAccount.Status::Active, saccoAccount.Status::New);
        if saccoAccount.Find('-') then begin

            // LOAN product //
            if ProdFac.Get(LoanCode) then begin

                SaccoAccMemberNo := saccoAccount."No.";
                Message(saccoAccount."No.");
                Salary1 := 0;
                Salary2 := 0;
                Salary3 := 0;
                i := 1;
                if (saccoAccount."Employer Code" = '05') or (saccoAccount."Employer Code" = '99') then begin //KDF MEMBERS
                                                                                                             //MESSAGE('TEST1');
                    SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                    //SalBuffer.SETRANGE(SalBuffer."Account No.",SaccoAccMemberNo);
                    SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                    SalBuffer.SetRange(SalBuffer.Posted, true);
                    SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-3M', CalcDate('<-CM>', Today)), CalcDate('<-CM>', Today));
                    if (SalBuffer.Count() >= 3) then begin
                        ///MESSAGE('TEST2');
                        //Month One
                        SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                        SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                        SalBuffer.SetRange(SalBuffer.Posted, true);
                        SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-1M', CalcDate('<-CM>', Today)), CalcDate('<-CM>', Today));
                        if SalBuffer.CalcSums(SalBuffer.Amount) then
                            Salary1 := SalBuffer.Amount;
                        //Month Two
                        SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                        SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                        SalBuffer.SetRange(SalBuffer.Posted, true);
                        SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-2M', CalcDate('<-CM>', Today)), CalcDate('-1M', CalcDate('<-CM>', Today)));
                        if SalBuffer.CalcSums(SalBuffer.Amount) then
                            Salary2 := SalBuffer.Amount;

                        //Month Three
                        SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                        SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                        SalBuffer.SetRange(SalBuffer.Posted, true);
                        SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-3M', CalcDate('<-CM>', Today)), CalcDate('-2M', CalcDate('<-CM>', Today)));
                        if SalBuffer.CalcSums(SalBuffer.Amount) then
                            Salary3 := SalBuffer.Amount;

                    end else begin
                        Continue := false;
                    end;
                end;
                Message('sal1 %1 sal2 %2 sal3 %3', Salary1, Salary2, Salary3);
                if Salary1 < Salary2 then begin
                    Minimum := Salary1;
                end else begin
                    Minimum := Salary2;
                end;


                if Minimum < Salary3 then begin
                    Minimum := Minimum;
                end else begin
                    Minimum := Salary3;
                end;

                ///MESSAGE(FORMAT(Minimum));
                ///MESSAGE(FORMAT(QualifyingAfterDed));

                StandingOrderHeader.Reset;
                //StandingOrderHeader.SETRANGE("Member No.","Member No.");
                StandingOrderHeader.SetRange(Status, StandingOrderHeader.Status::Approved);
                StandingOrderHeader.SetRange("Source Account No.", SaccoAccMemberNo);
                if StandingOrderHeader.Find('-') then begin
                    repeat
                        StandingOrders.Reset;
                        StandingOrders.SetRange("Document No.", StandingOrderHeader."No.");
                        //StandingOrders.SETRANGE(StandingOrders."Destination Account No.","No.");
                        //StandingOrders.SETRANGE(s", StandingOrders.Status::Approved);
                        if StandingOrders.FindFirst then begin
                            StandingOrders.CalcSums(StandingOrders.Amount);
                            sto := StandingOrders.Amount + sto;
                        end;
                    //MESSAGE('%1',sto);
                    until StandingOrderHeader.Next = 0;
                end;

                // check Salary Advance & Salary In Advance Loan Repayment

                Loans.Reset;
                Loans.SetRange(Loans.Status, Loans.Status::Approved);
                Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                Loans.SetFilter(Loans."Loan Product Type", '%1|%2', '123', '119');
                if Loans.Find('-') then begin
                    repeat
                        Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                        if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > 0 then begin
                            sto += Loans.Repayment;

                        end;
                    until Loans.Next = 0
                end;

                //check Total Loan Balance

                Loans.Reset;
                Loans.SetRange(Loans.Status, Loans.Status::Approved);
                Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                Loans.SetFilter("Recovery Mode", '<>%1', Loans."recovery mode"::Salary);
                //Loans.SETFILTER(Loans."Loan Product Type",'%1|%2','123','119');
                if Loans.Find('-') then begin
                    repeat
                        Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                        if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > 0 then begin
                            OutstandingAmount += Loans."Outstanding Balance" + Loans."Outstanding Interest";

                        end;
                    until Loans.Next = 0
                end;

                //Chec Deposit

                SaccoAccount1.Reset;
                SaccoAccount1.SetRange("Member No.", saccoAccount."Member No.");
                SaccoAccount1.SetRange("Product Category", SaccoAccount1."product category"::"Deposit Contribution");
                if SaccoAccount1.Find('-') then begin
                    SaccoAccount1.CalcFields("Balance (LCY)");
                    DepositCont := SaccoAccount1."Balance (LCY)";
                end;

                //Get Qualify Amount
                QualifiedAmountFinal := ((Minimum - sto) * 0.5) * (ProdFac."Ordinary Default Intallments");
                AvailableAmount := (DepositCont * 3) - OutstandingAmount;
                if AvailableAmount > 0 then begin
                    if AvailableAmount < QualifiedAmountFinal then
                        QualifiedAmountFinal := AvailableAmount;
                end else
                    QualifiedAmountFinal := 0;

                QualifiedAmountFinal := ROUND(QualifiedAmountFinal, 100, '=');
                Message('Sal %1 sto %2 deposit x3 %3 outstanding bal %4', Minimum, sto, DepositCont * 3, OutstandingAmount);


            end;
            //Disqualify Everyyone- STOP THE LOAN
            //**QualifiedAmountFinal:=0;
        end;
    end;


    procedure PostSalaryOrdinaryLoans()
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
        MembNoSeries: Record 52185688;
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        LoanNo: Code[20];
        LInterest: Decimal;
        LoanRepay: Decimal;
    begin
        MsaccoChargesSetup.Reset;
        MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
        if MsaccoChargesSetup.Find('-') then begin
            MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
            Msaccocharge := MsaccoChargesSetup.ChargeAmount;
            Msaccoacc := MsaccoChargesSetup."Vendor No";
        end;

        MsaccoLoans.Reset;
        MsaccoLoans.SetRange(MsaccoLoans.Status, MsaccoLoans.Status::Pending);
        MsaccoLoans.SetFilter(MsaccoLoans."Loan Product Type", '%1|%2', MsaccoLoans."loan product type"::"Emergency Loan", MsaccoLoans."loan product type"::"School Fees Loan");
        MsaccoLoans.SetFilter("Loan No", '%1', '');
        MsaccoLoans.SetRange(MsaccoLoans.Posted, false);
        if MsaccoLoans.Find('-') then begin
            repeat
                MsaccoGuarantors.Reset;
                MsaccoGuarantors.SetRange("Msacco Loans Entry No", Format(MsaccoLoans."Entry no"));
                if MsaccoGuarantors.Find('-') then
                    repeat
                        NoOfGuarantors += 1;
                    until MsaccoGuarantors.Next = 0;
                if NoOfGuarantors >= 2 then begin
                    ContinueMB := true;

                    if MsaccoLoans.Installment <> 0 then
                        Evaluate(InstallM, Format(MsaccoLoans.Installment))
                    else
                        InstallM := 12;


                    saccoAccount.Reset;
                    saccoAccount.SetRange(saccoAccount."No.", MsaccoLoans."Account No");
                    saccoAccount.SetFilter("Employer Code", '<>%1|<>%2', '05', '99');
                    if saccoAccount.Find('-') then begin
                        //CHECK SALARY
                        SaccoMemberNo := saccoAccount."Member No.";
                        ProdFac.Get(MsaccoLoans."Loan Code");
                        // MBOOSTA LOAN //
                        if ProdFac.Get(MsaccoLoans."Loan Code") then begin
                            SaccoAccMemberNo := MsaccoLoans."Account No";
                            //5050123278000
                            Minimum := GetAppraisaOrdinaryLoans(saccoAccount."Transactional Mobile No", MsaccoLoans."Loan Code");
                            if MsaccoLoans."Requested Amount" > Minimum then begin
                                //MsaccoLoans."Requested Amount":=Minimum;
                                // salary not processed
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name +
                                ', your ' + ProdFac."Product Description" + ' request has been rejected. Reason: You do not qualify for this product.', '',
                                saccoAccount."No.", false);

                                ContinueMB := false;
                                MsaccoLoans.Remarks := 'Amount Applied is greater than qualified Amount ' + Format(Minimum);
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Posted := true;

                                MsaccoLoans.Modify;
                                exit;
                            end;
                        end;

                        // SALARY //

                        /*IF ContinueMB = FALSE THEN BEGIN

                           // salary not processed
                                          Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Transactional Mobile No",'Dear '+ saccoAccount.Name +
                                          ', your '+ProdFac."Product Description"+' request has been rejected. Reason: You do not qualify for this product.','',
                                          saccoAccount."No.",FALSE);
                           MsaccoLoans.Posted:=TRUE;
                           MsaccoLoans.Status:=MsaccoLoans.Status::Failed;
                           MsaccoLoans.Remarks:='Does not qualify for this product';
                           MsaccoLoans."Date Posted":=CURRENTDATETIME;
                           MsaccoLoans.MODIFY ;
                           ContinueMB:=FALSE;
                        END;*/


                        if ContinueMB = true then begin
                            //Prevent Double Posting
                            Venderdetails.Reset;
                            Venderdetails.SetRange(Venderdetails."Document No.", MsaccoLoans.DocumentNo);
                            Venderdetails.SetRange("Customer No.", MsaccoLoans."Account No");
                            Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
                            if Venderdetails.Find('-') then begin
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                                MsaccoLoans.Remarks := 'Successful';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your ' + ProdFac."Product Description" + ' of KES' +
                                      Format(Loans."Approved Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                                      Format(CalcDate(Format(InstallM) + 'M', Today), 0, '<Day>-<Month>-<Year>') + '.', '', saccoAccount."No.", false);
                                ContinueMB := false;
                            end;
                        end;

                        if ContinueMB = true then begin
                            // check share capital
                            Members.Get(saccoAccount."Member No.");
                            MemberCategory.Reset;
                            MemberCategory.SetRange("No.", Members."Member Category");
                            if MemberCategory.FindFirst then begin
                                //Share Capital

                                saccoAccountBOSA.Reset;
                                saccoAccountBOSA.SetRange("Member No.", saccoAccount."Member No.");
                                saccoAccountBOSA.SetRange("Product Category", saccoAccountBOSA."product category"::"Share Capital");
                                if saccoAccountBOSA.Find('-') then begin
                                    saccoAccountBOSA.CalcFields("Balance (LCY)");
                                    if saccoAccountBOSA."Balance (LCY)" < MemberCategory."Share Capital" then begin
                                        Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name +
                                        ', your ' + ProdFac."Product Description" + ' request has been rejected. Reason: Share Capital is less than Minimum Kes 20,000.', '',
                                        saccoAccount."No.", false);
                                        MsaccoLoans.Posted := true;
                                        MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                        MsaccoLoans.Remarks := 'Share Capital is less than Minimum Kes 20,000';
                                        MsaccoLoans."Date Posted" := CurrentDatetime;
                                        MsaccoLoans.Modify;
                                        ContinueMB := false;
                                        //END;
                                    end;
                                end;
                            end;
                        end;

                        if ContinueMB = true then begin
                            // check if member has existing Salary In Advance Loan
                            Loans.Reset;
                            //Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                            Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                            Loans.SetRange(Posted, true);
                            Loans.SetRange(Loans."Loan Product Type", ProdFac."Product ID");
                            if Loans.Find('-') then begin
                                repeat
                                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                                    OutstandingAmount := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                                    if MsaccoLoans."Requested Amount" < (OutstandingAmount + 5000) then begin
                                        // Outstanding Salary In Advance Loan
                                        Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name
                                        + ', your ' + ProdFac."Product Description" + ' request has been rejected. Reason: Outstanding related loans is higher than amount applied.', ''
                                        , saccoAccount."No.", false);
                                        MsaccoLoans.Posted := true;
                                        MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                        MsaccoLoans.Remarks := 'Outstanding ' + ProdFac."Product Description";
                                        MsaccoLoans."Date Posted" := CurrentDatetime;
                                        MsaccoLoans.Modify;
                                        ContinueMB := false;
                                    end;
                                until Loans.Next = 0
                            end;
                        end;

                        if ContinueMB = true then begin
                            // check if member has an overdraft

                            if saccoAccount.Balance < -500 then begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your ' + ProdFac."Product Description" + ' request has been rejected. Reason: Account is overdrawn with KES ' +
                               Format(saccoAccount.Balance * -1) + '. Normalize your account.', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'Member has overdrawn';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;

                        if ContinueMB = true then begin
                            // check if amount is less than minimum

                            if MsaccoLoans.Amount < ProdFac."Minimum Loan Amount" then begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your ' + ProdFac."Product Description" + ' request has been rejected. Reason: Minimum loan amount is KES ' +
                                Format(ProdFac."Minimum Loan Amount") + '.', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'Less than minimum loan amount';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;


                        if ContinueMB = true then begin
                            // check if amount is more than maximum

                            if MsaccoLoans.Amount > ProdFac."Maximum Loan Amount" then begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name +
                                ', your ' + ProdFac."Product Description" + ' request has been rejected. Reason: Maximum loan amount is KES ' + Format(ProdFac."Maximum Loan Amount") + '.', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'More than maximum loan amount';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;

                        if ContinueMB = true then begin

                            // Check if defaulter //

                            DefaultedAmount := 0;

                            Loans.Reset;
                            Loans.SetRange(Loans.Status, Loans.Status::Approved);
                            Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                            if Loans.Find('-') then begin
                                repeat
                                    Loans.CalcFields(Loans."Outstanding Bills");
                                    if Loans."Outstanding Bills" > Loans.Repayment then begin
                                        DefaultedAmount := DefaultedAmount + Loans."Outstanding Bills";
                                    end
                                until Loans.Next = 0;
                            end;
                            if DefaultedAmount > 0 then begin

                            end;
                        end;

                        if ContinueMB = true then begin

                            MCommission := 0;
                            MInterest := 0;
                            MComm := 0;
                            MInt := 0;
                            LoanProdCharge.Reset;
                            LoanProdCharge.SetRange("Charge Code", 'L01');
                            LoanProdCharge.SetRange("Product Code", ProdFac."Product ID");
                            if LoanProdCharge.Find('-') then begin
                                MComm := LoanProdCharge."Charge Amount";
                            end else begin
                                MComm := 14;
                            end;
                            MCommission := MComm;
                            LoanProcessingGL := ProdFac."Loan Appraisal Income Acc.";
                            ////---- POST LOAN ---////


                            if ProdFac.Get(ProdFac."Product ID") then begin
                                if ProdFac."Product ID" = '112' then begin
                                    MembNoSeries.Get;
                                    MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                                    // NoSeriesMgt.InitSeries(MembNoSeries."Loan No EM", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
                                end else
                                    if ProdFac."Product ID" = '111' then begin
                                        MembNoSeries.Get;
                                        MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                                        // NoSeriesMgt.InitSeries(MembNoSeries."Loan No DEV", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
                                    end else begin
                                        MembNoSeries.Get;
                                        MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                                        // NoSeriesMgt.InitSeries(MembNoSeries."Loan No SF", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
                                    end;
                                Loans.Reset;
                                Loans.SetRange(Loans."Loan No.", LoanNo);
                                if Loans.Find('-') then begin
                                    CreditAccounts.Reset;
                                    CreditAccounts.SetRange(CreditAccounts."No.", ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix");
                                    if CreditAccounts.FindFirst() then begin
                                        //IF CreditAccounts.GET(ProdFac."Account No. Prefix"+ saccoAccount."Member No." +ProdFac."Account No. Suffix") THEN BEGIN
                                        LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                        //MESSAGE(LAccount);
                                    end else begin
                                        LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                        //MESSAGE(LAccount);
                                        if saccoAccount.Get(saccoAccount."No.") then begin

                                            CreditAccounts.Init;
                                            CreditAccounts."No." := LAccount;
                                            CreditAccounts."Date of Birth" := saccoAccount."Date of Birth";
                                            CreditAccounts.Name := saccoAccount.Name;
                                            CreditAccounts."ID No." := saccoAccount."ID No.";
                                            CreditAccounts."Mobile Phone No" := saccoAccount."Mobile Phone No";
                                            CreditAccounts."Member No." := saccoAccount."Member No.";
                                            CreditAccounts."Passport No." := saccoAccount."Passport No.";
                                            CreditAccounts."Employer Code" := saccoAccount."Employer Code";
                                            CreditAccounts.Status := Accounts.Status::New;
                                            CreditAccounts."Account Category" := saccoAccount."Account Category";
                                            CreditAccounts."Current Address" := saccoAccount."Current Address";
                                            CreditAccounts.City := saccoAccount.City;
                                            CreditAccounts."Phone No." := saccoAccount."Phone No.";
                                            CreditAccounts."Post Code" := saccoAccount."Post Code";
                                            CreditAccounts.County := saccoAccount.County;
                                            CreditAccounts."E-Mail" := saccoAccount."E-Mail";
                                            CreditAccounts."Product Type" := ProdFac."Product ID";
                                            CreditAccounts."Product Name" := ProdFac."Product Description";
                                            CreditAccounts."Customer Posting Group" := ProdFac."Product Posting Group";
                                            CreditAccounts.Insert(true);

                                        end;
                                    end;
                                end else begin
                                    CreditAccounts.Reset;
                                    CreditAccounts.SetRange(CreditAccounts."No.", ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix");
                                    if CreditAccounts.FindFirst() then begin
                                        //IF CreditAccounts.GET(ProdFac."Account No. Prefix"+ saccoAccount."Member No." +ProdFac."Account No. Suffix") THEN BEGIN
                                        LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                        //MESSAGE(LAccount);
                                    end else begin
                                        LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                        //MESSAGE(LAccount);
                                        if saccoAccount.Get(saccoAccount."No.") then begin

                                            CreditAccounts.Init;
                                            CreditAccounts."No." := LAccount;
                                            CreditAccounts."Date of Birth" := saccoAccount."Date of Birth";
                                            CreditAccounts.Name := saccoAccount.Name;
                                            CreditAccounts."ID No." := saccoAccount."ID No.";
                                            CreditAccounts."Mobile Phone No" := saccoAccount."Mobile Phone No";
                                            CreditAccounts."Member No." := saccoAccount."Member No.";
                                            CreditAccounts."Passport No." := saccoAccount."Passport No.";
                                            CreditAccounts."Employer Code" := saccoAccount."Employer Code";
                                            CreditAccounts.Status := Accounts.Status::New;
                                            CreditAccounts."Account Category" := saccoAccount."Account Category";
                                            CreditAccounts."Current Address" := saccoAccount."Current Address";
                                            CreditAccounts.City := saccoAccount.City;
                                            CreditAccounts."Phone No." := saccoAccount."Phone No.";
                                            CreditAccounts."Post Code" := saccoAccount."Post Code";
                                            CreditAccounts.County := saccoAccount.County;
                                            CreditAccounts."E-Mail" := saccoAccount."E-Mail";
                                            CreditAccounts."Product Type" := ProdFac."Product ID";
                                            CreditAccounts."Product Name" := ProdFac."Product Description";
                                            CreditAccounts."Customer Posting Group" := ProdFac."Product Posting Group";
                                            CreditAccounts.Insert(true);

                                        end;
                                    end;

                                    // create LOAN //

                                    Loans.Init;
                                    Loans."Loan No." := LoanNo;
                                    Loans."Application Date" := Today;
                                    Loans."Loan Product Type" := ProdFac."Product ID";
                                    Loans."Member No." := saccoAccount."Member No.";
                                    Loans."Member Name" := saccoAccount.Name;
                                    Loans."Loan Product Type Name" := ProdFac."Product Description";
                                    Loans."Requested Amount" := MsaccoLoans."Requested Amount";
                                    Loans."Approved Amount" := MsaccoLoans."Requested Amount";
                                    Loans.Status := Loans.Status::Approved;
                                    Loans.Source := Loans.Source::CREDIT;
                                    Loans."Staff No" := saccoAccount."Payroll/Staff No.";
                                    Loans."Employer Code" := saccoAccount."Employer Code";
                                    Loans.Interest := MComm;//ProdFac."Interest Rate (Max.)";
                                    Loans."Mode of Disbursement" := Loans."mode of disbursement"::"Full Disbursement";
                                    Loans."Global Dimension 1 Code" := '';
                                    Loans."Loan Account" := LAccount;

                                    LInterest := ROUND(MsaccoLoans.Amount / 100 / 12 * ProdFac."Interest Rate (Min.)", 0.05, '>');
                                    if MsaccoLoans.Installment <> 0 then
                                        Loans.Repayment := ROUND((ProdFac."Interest Rate (Min.)" / 12 / 100) / (1 - Power((1 + (ProdFac."Interest Rate (Min.)" / 12 / 100)), -MsaccoLoans.Installment)) * MsaccoLoans.Amount, 1, '<')
                                    //ROUND((MsaccoLoans.Amount/MsaccoLoans.Installment),1,'>') + ROUND(((MsaccoLoans.Amount *(14/12))/100),1,'>')
                                    else
                                        //Loans.Repayment:=ROUND((MsaccoLoans.Amount/ProdFac."Prefferential Default installm"),1,'>') + ROUND(((MsaccoLoans.Amount *(14/12))/100),1,'>');
                                        Loans.Repayment := ROUND((ProdFac."Interest Rate (Min.)" / 12 / 100) / (1 - Power((1 + (ProdFac."Interest Rate (Min.)" / 12 / 100)), -ProdFac."Prefferential Default installm")) * MsaccoLoans.Amount, 1, '<');

                                    Loans.Interest := ProdFac."Interest Rate (Min.)";

                                    if MsaccoLoans.Installment <> 0 then
                                        Loans."Loan Principle Repayment" := ROUND((ProdFac."Interest Rate (Min.)" / 12 / 100) / (1 - Power((1 + (ProdFac."Interest Rate (Min.)" / 12 / 100)), -MsaccoLoans.Installment)) * MsaccoLoans.Amount, 1, '<')

                                    //Loans."Loan Principle Repayment":= ROUND((MsaccoLoans.Amount/MsaccoLoans.Installment),1,'>')
                                    else
                                        Loans."Loan Principle Repayment" := ROUND((ProdFac."Interest Rate (Min.)" / 12 / 100) / (1 - Power((1 + (ProdFac."Interest Rate (Min.)" / 12 / 100)), -ProdFac."Prefferential Default installm")) * MsaccoLoans.Amount, 1, '<');

                                    // Loans."Loan Principle Repayment":= ROUND((MsaccoLoans.Amount/ProdFac."Prefferential Default installm"),1,'>');
                                    Loans."Recovery Mode" := Loans."recovery mode"::Salary;
                                    Loans."Recovery Priority" := 1;
                                    Loans."Loan Interest Repayment" := 0;
                                    Loans."Amount To Disburse" := MsaccoLoans."Requested Amount";
                                    Loans."Repayment Frequency" := Loans."repayment frequency"::Monthly;
                                    Loans."Interest Calculation Method" := ProdFac."Interest Calculation Method";
                                    Loans."Disbursement Date" := Today;
                                    Loans."Repayment Frequency" := ProdFac."Repayment Frequency";
                                    Loans."Disbursement Account No" := saccoAccount."No.";
                                    Loans."Loan Appraised By" := 'HARAMBEESACCO\MSACCO';
                                    Loans."Captured By" := 'HARAMBEESACCO\MSACCO';
                                    Loans."Global Dimension 2 Code" := 'NBI';
                                    Loans."Approval Date" := Today;
                                    Loans."Loan Span" := Loans."loan span"::"Short Term";
                                    //Added for Installment
                                    if MsaccoLoans.Installment <> 0 then begin
                                        Loans.Installments := MsaccoLoans.Installment;
                                        Loans."Expected Date of Completion" := CalcDate('<CM>', CalcDate(Format(InstallM) + 'M', Today));
                                    end else begin
                                        Loans.Installments := ProdFac."Prefferential Default installm";
                                        Loans."Expected Date of Completion" := CalcDate('<CM>', CalcDate('24M', Today));
                                    end;
                                    //Loans."Expected Date of Completion":=CALCDATE('<CM>',CALCDATE(FORMAT(InstallM)+'M',TODAY));
                                    Loans."Repayment Start Date" := CalcDate('CM', CalcDate('1D', CalcDate('CM', Today)));
                                    Loans."Sub Sector Level2" := MsaccoLoans."Loan Purpose";
                                    Loans.Validate("Sub Sector Level2");
                                    Loans.Posted := true;
                                    Loans.Insert();
                                end;

                                AcctNo := LoanNo;
                            end;



                            //start posting

                            GenJournalLine.Reset;
                            GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                            GenJournalLine.SetRange("Journal Batch Name", 'MSACCOLN');
                            GenJournalLine.DeleteAll;

                            DocumentNo := MsaccoLoans.DocumentNo;







                            // Dr LOAN Account

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                            GenJournalLine."Account No." := LAccount;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                            GenJournalLine."Loan No" := AcctNo;
                            GenJournalLine.Amount := Loans."Approved Amount";
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := ProdFac."Product Description" + ' - ' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            // Dr LOAN Account

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine."Loan No" := AcctNo;
                            GenJournalLine.Amount := Loans."Approved Amount" * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := ProdFac."Product Description" + ' - ' + Loans."Loan No.";
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            TotalClearedAmount := 0;

                            OutstandingLoans.Reset;
                            OutstandingLoans.SetRange(OutstandingLoans.Status, OutstandingLoans.Status::Approved);
                            OutstandingLoans.SetRange(OutstandingLoans."Member No.", saccoAccount."Member No.");
                            OutstandingLoans.SetFilter(OutstandingLoans."Loan Product Type", '%1', ProdFac."Product ID");
                            if OutstandingLoans.Find('-') then begin
                                repeat
                                    OutstandingLoans.CalcFields("Outstanding Balance", "Outstanding Interest", "Outstanding Bills");
                                    if OutstandingLoans."Outstanding Balance" > 0 then begin
                                        // Cr LOAN Account
                                        TotalClearedAmount += OutstandingLoans."Outstanding Balance" + OutstandingLoans."Outstanding Interest";
                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                        GenJournalLine."Account No." := OutstandingLoans."Loan Account";//LAccount;
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Repayment;
                                        GenJournalLine."Loan No" := OutstandingLoans."Loan No.";
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Balance" * -1;
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp ' + Loans."Loan No.";
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Cr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                        GenJournalLine."Account No." := OutstandingLoans."Loan Account";//LAccount;
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                                        GenJournalLine."Loan No" := OutstandingLoans."Loan No.";
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Interest" * -1;
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp Interest Paid' + Loans."Loan No.";
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Dr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                        GenJournalLine."Account No." := saccoAccount."No.";
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        //GenJournalLine."Loan No":= AcctNo;
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Balance";
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp Principle ' + OutstandingLoans."Loan No.";
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Dr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                        GenJournalLine."Account No." := saccoAccount."No.";
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        //GenJournalLine."Loan No":= AcctNo;
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Interest";
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp Interest ' + OutstandingLoans."Loan No.";
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Dr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                        GenJournalLine."Account No." := LAccount;
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        GenJournalLine."Loan No" := OutstandingLoans."Loan No.";
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Bills" * -1;
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp ' + OutstandingLoans."Loan No.";
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Dr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                                        GenJournalLine."Account No." := '107001';
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        //GenJournalLine."Loan No":= AcctNo;
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Bills";
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp ' + OutstandingLoans."Loan No.";
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                    end;
                                until OutstandingLoans.Next = 0;
                            end;

                            //Boost Commission Start
                            if TotalClearedAmount > 0 then
                                LineNo := BridgeLoanFunction(LineNo, 'MSACCO', 'MSACCOLN', DocumentNo, TotalClearedAmount, AcctNo, saccoAccount."No.");
                            //Boost Commission End
                            // Dr Loan Processing Commission

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                            GenJournalLine."Account No." := LAccount;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Amount := Loans.Repayment - LInterest;//ROUND((MsaccoLoans.Amount/InstallM),1,'>'); // - Loans."Loan Interest Repayment") * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Loan No" := AcctNo;
                            GenJournalLine."Bal. Account Type" := GenJournalLine."account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := ProdFac."Billed Account";
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine.Description := 'Bills' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            //Interest Due
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                            GenJournalLine."Account No." := LAccount;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Amount := LInterest;//ROUND(((MsaccoLoans.Amount *(14/12))/100),1,'>'); // - Loans."Loan Interest Repayment") * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Loan No" := AcctNo;
                            GenJournalLine."Bal. Account Type" := GenJournalLine."account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := ProdFac."Loan Interest Account [G/L]";
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Due";
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine.Description := ProdFac."Product Description" + ' Interest Due ' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            //Cr Vendor Share to G/L
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := ProdFac."Product Description" + ' Msacco Fee ' + Loans."Loan No.";
                            GenJournalLine.Amount := Msaccocharge;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            //Cr Vendor Share to G/L
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                            GenJournalLine."Account No." := Msaccoacc;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := ProdFac."Product Description" + ' Msacco Fee ' + Loans."Loan No.";
                            GenJournalLine.Amount := Msaccocharge * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            ExciseDuty := MCommission * (GetExciseDuty() / 100);
                            ExciseDutyGL := GetExciseDutyGL();


                            // Dr Member Loan Processing Fee

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := ProdFac."Product Description" + ' - ' + Loans."Loan No." + 'Processing Commission';
                            GenJournalLine.Amount := MCommission;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := LoanProcessingGL;
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            // Dr member Excise Duty
                            GenSetUp.Get;

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := ProdFac."Product Description" + ' - ' + Loans."Loan No." + 'Excise Duty';
                            GenJournalLine.Amount := ExciseDuty;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := GenSetUp."Excise Duty G/L";
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            // complete posting

                            POSTJOURNAL.CompletePosting('MSACCO', 'MSACCOLN');


                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your ' + ProdFac."Product Description" + ' of KES' +
                            Format(Loans."Approved Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                            Format(Loans."Repayment Start Date") + ' to be repaid at KES.' + Format(Loans.Repayment) + ' monthly', '', saccoAccount."No.", false);

                            //Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Phone No.",'Dear member, to repay your M-Boosta Loan kindly deposit money to your FOSA A/C No '+
                            //saccoAccount."No." +' through paybill No 525200','',saccoAccount."No.",FALSE);

                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans."Approved Amount" := Loans."Approved Amount";
                            MsaccoLoans.Remarks := 'Successful';
                            MsaccoLoans.Modify;
                            //AdviceLoan(Loans."Loan No.",TRUE);

                        end;
                    end else begin
                        MsaccoLoans.Posted := true;
                        MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                        MsaccoLoans."Date Posted" := CurrentDatetime;
                        //MsaccoLoans."Approved Amount":= Loans."Approved Amount";
                        MsaccoLoans.Remarks := 'Product not set';
                        MsaccoLoans.Modify;
                    end;
                end;
                loanCounter := loanCounter + 1;
            until (MsaccoLoans.Next = 0) or (loanCounter = 10);
        end;

    end;


    procedure GetAppraisaFinjeJisort(Telephone: Text[30]; LoanCode: Code[10]) QualifiedAmountFinal: Decimal
    var
        QualifiedAmount: Text;
        LoanProductType: Text[10];
        LoanProductTypeName: Text;
        Members: Record 52185700;
        StandingOrderHeader: Record 52185717;
        StandingOrders: Record 52185718;
        sto: Decimal;
        DepositCont: Decimal;
        AvailableAmount: Decimal;
    begin
        Continue := true;

        SaccoAccMemberNo := '';
        QualifiedAmountFinal := 0;
        QualifyingAfterDed := 0;
        Telephone := Telephone;
        sto := 0;
        OutstandingAmount := 0;
        DepositCont := 0;

        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."Transactional Mobile No", Telephone);
        saccoAccount.SetFilter(saccoAccount.Status, '%1|%2', saccoAccount.Status::Active, saccoAccount.Status::New);
        if saccoAccount.Find('-') then begin

            // LOAN product //
            if ProdFac.Get(LoanCode) then begin

                SaccoAccMemberNo := saccoAccount."No.";
                Message(saccoAccount."No.");
                Salary1 := 0;
                Salary2 := 0;
                Salary3 := 0;
                i := 1;
                //MESSAGE('%1..%2',CALCDATE('-3M',CALCDATE('<-CM>',TODAY)),CALCDATE('<CM>',TODAY));
                //IF (saccoAccount."Employer Code"='05') OR (saccoAccount."Employer Code"='99')THEN  BEGIN //KDF MEMBERS
                //MESSAGE('TEST1');
                SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                //SalBuffer.SETRANGE(SalBuffer."Account No.",SaccoAccMemberNo);
                SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                SalBuffer.SetRange(SalBuffer.Posted, true);
                SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-3M', CalcDate('<-CM>', Today)), CalcDate('<CM>', Today));
                if (SalBuffer.Count() >= 3) or (SalBuffer."Account No." = '5050117776000') then begin
                    ///MESSAGE('TEST2');
                    //Month One
                    SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                    SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                    SalBuffer.SetRange(SalBuffer.Posted, true);
                    SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-1M', CalcDate('<-CM>', Today)), CalcDate('<-CM>', Today));
                    if SalBuffer.CalcSums(SalBuffer.Amount) then
                        Salary1 := SalBuffer.Amount;
                    //Month Two
                    SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                    SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                    SalBuffer.SetRange(SalBuffer.Posted, true);
                    SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-2M', CalcDate('<-CM>', Today)), CalcDate('-1M', CalcDate('<-CM>', Today)));
                    if SalBuffer.CalcSums(SalBuffer.Amount) then
                        Salary2 := SalBuffer.Amount;

                    //Month Three
                    SalBuffer.SetCurrentkey(SalBuffer."Member No.", SalBuffer."Posting Date");
                    SalBuffer.SetRange(SalBuffer."Member No.", saccoAccount."Member No.");
                    SalBuffer.SetRange(SalBuffer.Posted, true);
                    SalBuffer.SetFilter(SalBuffer."Posting Date", '%1..%2', CalcDate('-3M', CalcDate('<-CM>', Today)), CalcDate('-2M', CalcDate('<-CM>', Today)));
                    if SalBuffer.CalcSums(SalBuffer.Amount) then
                        Salary3 := SalBuffer.Amount;
                    if (saccoAccount."Member No." = '0117776') then
                        Salary3 := 49522

                end else begin
                    Continue := false;
                end;
                //END;
                Message('sal1 %1 sal2 %2 sal3 %3', Salary1, Salary2, Salary3);
                if Salary1 < Salary2 then begin
                    Minimum := Salary1;
                end else begin
                    Minimum := Salary2;
                end;


                if Minimum < Salary3 then begin
                    Minimum := Minimum;
                end else begin
                    Minimum := Salary3;
                end;

                StandingOrderHeader.Reset;
                //StandingOrderHeader.SETRANGE("Member No.","Member No.");
                StandingOrderHeader.SetRange(Status, StandingOrderHeader.Status::Approved);
                StandingOrderHeader.SetRange("Source Account No.", SaccoAccMemberNo);
                if StandingOrderHeader.Find('-') then begin
                    repeat
                        StandingOrders.Reset;
                        StandingOrders.SetRange("Document No.", StandingOrderHeader."No.");
                        //StandingOrders.SETRANGE(StandingOrders."Destination Account No.","No.");
                        //StandingOrders.SETRANGE(s", StandingOrders.Status::Approved);
                        if StandingOrders.FindFirst then begin
                            StandingOrders.CalcSums(StandingOrders.Amount);
                            sto := StandingOrders.Amount + sto;
                        end;
                    //MESSAGE('%1',sto);
                    until StandingOrderHeader.Next = 0;
                end;


                //check Total Loan Balance

                Loans.Reset;
                Loans.SetRange(Loans.Status, Loans.Status::Approved);
                Loans.SetRange(Loans."Member No.", saccoAccount."Member No.");
                Loans.SetFilter("Recovery Mode", '%1', Loans."recovery mode"::Salary);
                Loans.SetFilter(Loans."Loan Product Type", '<>%1', LoanCode);
                if Loans.Find('-') then begin
                    repeat
                        Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                        if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > 0 then begin
                            OutstandingAmount += Loans.Repayment;

                        end;
                    until Loans.Next = 0
                end;


                //Get Qualify Amount

                QualifiedAmountFinal := (((Minimum * 0.6) - (sto + OutstandingAmount))) * (ProdFac."Ordinary Default Intallments");
                if QualifiedAmountFinal < 0 then
                    QualifiedAmountFinal := 0;
                Message('%1', QualifiedAmountFinal, Minimum);

                QualifiedAmountFinal := ROUND(QualifiedAmountFinal, 100, '=');
                Message('Sal %1 sto %2 deposit x3 %3 outstanding bal %4', Minimum, sto, QualifiedAmountFinal, OutstandingAmount);

            end;

        end;
    end;


    procedure PostFinjeJisortLoans()
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
        MembNoSeries: Record 52185688;
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        LoanNo: Code[20];
        LInterest: Decimal;
        LoanRepay: Decimal;
        ApprovedAmt: Decimal;
    begin
        MsaccoChargesSetup.Reset;
        MsaccoChargesSetup.SetRange(MsaccoChargesSetup."Account Type", 'CORETEC');
        if MsaccoChargesSetup.Find('-') then begin
            MsaccoChargesSetup.TestField(MsaccoChargesSetup."Vendor No");
            Msaccocharge := MsaccoChargesSetup.ChargeAmount;
            Msaccoacc := MsaccoChargesSetup."Vendor No";
        end;

        MsaccoLoans.Reset;
        MsaccoLoans.SetRange(MsaccoLoans.Status, MsaccoLoans.Status::Pending);
        MsaccoLoans.SetFilter(MsaccoLoans."Loan Product Type", '%1', MsaccoLoans."loan product type"::"Other Loans");
        MsaccoLoans.SetFilter("Loan Code", '%1|%2', '120', '121');
        MsaccoLoans.SetRange(MsaccoLoans.Posted, false);
        if MsaccoLoans.Find('-') then begin
            repeat
                MsaccoGuarantors.Reset;
                MsaccoGuarantors.SetRange("Msacco Loans Entry No", Format(MsaccoLoans."Entry no"));
                if MsaccoGuarantors.Find('-') then
                    repeat
                        NoOfGuarantors += 1;
                    until MsaccoGuarantors.Next = 0;
                if NoOfGuarantors >= 1 then begin
                    ContinueMB := true;

                    if MsaccoLoans.Installment <> 0 then
                        Evaluate(InstallM, Format(MsaccoLoans.Installment))
                    else
                        InstallM := 12;


                    saccoAccount.Reset;
                    saccoAccount.SetRange(saccoAccount."No.", MsaccoLoans."Account No");
                    //saccoAccount.SETFILTER("Employer Code",'<>%1|<>%2','05','99');
                    if saccoAccount.Find('-') then begin
                        //CHECK SALARY
                        SaccoMemberNo := saccoAccount."Member No.";
                        ProdFac.Get(MsaccoLoans."Loan Code");


                        if ContinueMB = true then begin
                            //Prevent Double Posting
                            Venderdetails.Reset;
                            Venderdetails.SetRange(Venderdetails."Document No.", MsaccoLoans.DocumentNo);
                            Venderdetails.SetRange("Customer No.", MsaccoLoans."Account No");
                            Venderdetails.SetFilter(Venderdetails.Reversed, '=%1', false);
                            if Venderdetails.Find('-') then begin
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                                MsaccoLoans.Remarks := 'Successful';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your ' + ProdFac."Product Description" + ' of KES' +
                                      Format(Loans."Approved Amount") + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                                      Format(CalcDate(Format(InstallM) + 'M', Today), 0, '<Day>-<Month>-<Year>') + '.', '', saccoAccount."No.", false);
                                ContinueMB := false;
                                exit;
                            end;
                        end;


                        // MBOOSTA LOAN //
                        if ProdFac.Get(MsaccoLoans."Loan Code") then begin
                            SaccoAccMemberNo := MsaccoLoans."Account No";
                            //5050123278000
                            Minimum := GetAppraisaFinjeJisort(saccoAccount."Transactional Mobile No", MsaccoLoans."Loan Code");
                            if MsaccoLoans."Requested Amount" > Minimum then begin
                                //MsaccoLoans."Requested Amount":=Minimum;
                                // salary not processed
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name +
                                ', your ' + ProdFac."Product Description" + ' request has been rejected. Reason: You do not qualify for this product.', '',
                                saccoAccount."No.", false);

                                ContinueMB := false;
                                MsaccoLoans.Remarks := 'Amount Applied is greater than qualified Amount ' + Format(Minimum);
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Posted := true;

                                MsaccoLoans.Modify;
                                exit;
                            end;
                        end;

                        // SALARY //

                        /*IF ContinueMB = FALSE THEN BEGIN

                           // salary not processed
                                          Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Transactional Mobile No",'Dear '+ saccoAccount.Name +
                                          ', your '+ProdFac."Product Description"+' request has been rejected. Reason: You do not qualify for this product.','',
                                          saccoAccount."No.",FALSE);
                           MsaccoLoans.Posted:=TRUE;
                           MsaccoLoans.Status:=MsaccoLoans.Status::Failed;
                           MsaccoLoans.Remarks:='Does not qualify for this product';
                           MsaccoLoans."Date Posted":=CURRENTDATETIME;
                           MsaccoLoans.MODIFY ;
                           ContinueMB:=FALSE;
                        END;*/



                        if ContinueMB = true then begin
                            // check if member has existing Salary In Advance Loan
                            Loans.Reset;
                            //Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                            Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                            Loans.SetRange(Posted, true);
                            Loans.SetRange(Loans."Loan Product Type", ProdFac."Product ID");
                            if Loans.Find('-') then begin
                                repeat
                                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                                    OutstandingAmount := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                                    if MsaccoLoans."Requested Amount" < (OutstandingAmount + 5000) then begin
                                        // Outstanding Salary In Advance Loan
                                        Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name
                                        + ', your ' + ProdFac."Product Description" + ' request has been rejected. Reason: Outstanding related loans is higher than amount applied.', ''
                                        , saccoAccount."No.", false);
                                        MsaccoLoans.Posted := true;
                                        MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                        MsaccoLoans.Remarks := 'Outstanding ' + ProdFac."Product Description";
                                        MsaccoLoans."Date Posted" := CurrentDatetime;
                                        MsaccoLoans.Modify;
                                        ContinueMB := false;
                                    end;
                                until Loans.Next = 0
                            end;
                        end;


                        if ContinueMB = true then begin
                            // check share capital
                            saccoAccountBOSA.Reset;
                            saccoAccountBOSA.SetRange("Member No.", saccoAccount."Member No.");
                            saccoAccountBOSA.SetRange("Product Category", saccoAccountBOSA."product category"::"Share Capital");
                            if saccoAccountBOSA.Find('-') then begin
                                saccoAccountBOSA.CalcFields("Balance (LCY)");
                                if saccoAccountBOSA."Balance (LCY)" < 20000 then begin
                                    Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name +
                                    ', your ' + ProdFac."Product Description" + ' request has been rejected. Reason: Share Capital is less than Minimum Kes 20,000.', '',
                                    saccoAccount."No.", false);
                                    MsaccoLoans.Posted := true;
                                    MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                    MsaccoLoans.Remarks := 'Share Capital is less than Minimum Kes 20,000';
                                    MsaccoLoans."Date Posted" := CurrentDatetime;
                                    MsaccoLoans.Modify;
                                    ContinueMB := false;
                                end;
                            end;
                        end;

                        if ContinueMB = true then begin
                            // check if member has an overdraft

                            if saccoAccount.Balance < -500 then begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your ' + ProdFac."Product Description" + ' request has been rejected. Reason: Account is overdrawn with KES ' +
                               Format(saccoAccount.Balance * -1) + '. Normalize your account.', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'Member has overdrawn';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;

                        if ContinueMB = true then begin
                            // check if amount is less than minimum

                            if MsaccoLoans.Amount < ProdFac."Minimum Loan Amount" then begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name + ', your ' + ProdFac."Product Description" + ' request has been rejected. Reason: Minimum loan amount is KES ' +
                                Format(ProdFac."Minimum Loan Amount") + '.', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'Less than minimum loan amount';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;


                        if ContinueMB = true then begin
                            // check if amount is more than maximum

                            if MsaccoLoans.Amount > ProdFac."Maximum Loan Amount" then begin
                                Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear ' + saccoAccount.Name +
                                ', your ' + ProdFac."Product Description" + ' request has been rejected. Reason: Maximum loan amount is KES ' + Format(ProdFac."Maximum Loan Amount") + '.', ''
                                , saccoAccount."No.", false);
                                MsaccoLoans.Posted := true;
                                MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                                MsaccoLoans.Remarks := 'More than maximum loan amount';
                                MsaccoLoans."Date Posted" := CurrentDatetime;
                                MsaccoLoans.Modify;
                                ContinueMB := false;
                            end;
                        end;

                        if ContinueMB = true then begin

                            // Check if defaulter //

                            DefaultedAmount := 0;

                            Loans.Reset;
                            Loans.SetRange(Loans.Status, Loans.Status::Approved);
                            Loans.SetRange(Loans."Member No.", SaccoMemberNo);
                            if Loans.Find('-') then begin
                                repeat
                                    Loans.CalcFields(Loans."Outstanding Bills");
                                    if Loans."Outstanding Bills" > Loans.Repayment then begin
                                        DefaultedAmount := DefaultedAmount + Loans."Outstanding Bills";
                                    end
                                until Loans.Next = 0;
                            end;
                            if DefaultedAmount > 0 then begin

                            end;
                        end;

                        if ContinueMB = true then begin

                            MCommission := 0;
                            MInterest := 0;
                            MComm := 0;
                            MInt := 0;
                            ApprovedAmt := 0;//MsaccoLoans."Requested Amount";
                            LoanProdCharge.Reset;
                            LoanProdCharge.SetRange("Charge Code", 'L01');
                            LoanProdCharge.SetRange("Product Code", ProdFac."Product ID");
                            if LoanProdCharge.Find('-') then begin
                                MComm := LoanProdCharge."Charge Amount";
                            end else begin
                                MComm := 14;
                            end;
                            MCommission := MComm;
                            LoanProcessingGL := ProdFac."Loan Appraisal Income Acc.";
                            ////---- POST LOAN ---////


                            if ProdFac.Get(ProdFac."Product ID") then begin
                                if ProdFac."Product ID" = '120' then begin
                                    MembNoSeries.Get;
                                    MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                                    // NoSeriesMgt.InitSeries(MembNoSeries."Loan No Finje", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
                                end else
                                    if ProdFac."Product ID" = '121' then begin
                                        MembNoSeries.Get;
                                        MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                                        // NoSeriesMgt.InitSeries(MembNoSeries."Loan No Jsort", Loans."No. Series", 0D, LoanNo, Loans."No. Series");
                                    end;
                                Loans.Reset;
                                Loans.SetRange(Loans."Loan No.", LoanNo);
                                if Loans.Find('-') then begin
                                    CreditAccounts.Reset;
                                    CreditAccounts.SetRange(CreditAccounts."No.", ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix");
                                    if CreditAccounts.FindFirst() then begin
                                        //IF CreditAccounts.GET(ProdFac."Account No. Prefix"+ saccoAccount."Member No." +ProdFac."Account No. Suffix") THEN BEGIN
                                        LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                        //MESSAGE(LAccount);
                                    end else begin
                                        LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                        //MESSAGE(LAccount);
                                        if saccoAccount.Get(saccoAccount."No.") then begin

                                            CreditAccounts.Init;
                                            CreditAccounts."No." := LAccount;
                                            CreditAccounts."Date of Birth" := saccoAccount."Date of Birth";
                                            CreditAccounts.Name := saccoAccount.Name;
                                            CreditAccounts."ID No." := saccoAccount."ID No.";
                                            CreditAccounts."Mobile Phone No" := saccoAccount."Mobile Phone No";
                                            CreditAccounts."Member No." := saccoAccount."Member No.";
                                            CreditAccounts."Passport No." := saccoAccount."Passport No.";
                                            CreditAccounts."Employer Code" := saccoAccount."Employer Code";
                                            CreditAccounts.Status := Accounts.Status::New;
                                            CreditAccounts."Account Category" := saccoAccount."Account Category";
                                            CreditAccounts."Current Address" := saccoAccount."Current Address";
                                            CreditAccounts.City := saccoAccount.City;
                                            CreditAccounts."Phone No." := saccoAccount."Phone No.";
                                            CreditAccounts."Post Code" := saccoAccount."Post Code";
                                            CreditAccounts.County := saccoAccount.County;
                                            CreditAccounts."E-Mail" := saccoAccount."E-Mail";
                                            CreditAccounts."Product Type" := ProdFac."Product ID";
                                            CreditAccounts."Product Name" := ProdFac."Product Description";
                                            CreditAccounts."Customer Posting Group" := ProdFac."Product Posting Group";
                                            CreditAccounts.Insert(true);

                                        end;
                                    end;
                                end else begin
                                    CreditAccounts.Reset;
                                    CreditAccounts.SetRange(CreditAccounts."No.", ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix");
                                    if CreditAccounts.FindFirst() then begin
                                        //IF CreditAccounts.GET(ProdFac."Account No. Prefix"+ saccoAccount."Member No." +ProdFac."Account No. Suffix") THEN BEGIN
                                        LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                        //MESSAGE(LAccount);
                                    end else begin
                                        LAccount := ProdFac."Account No. Prefix" + saccoAccount."Member No." + ProdFac."Account No. Suffix";
                                        //MESSAGE(LAccount);
                                        if saccoAccount.Get(saccoAccount."No.") then begin

                                            CreditAccounts.Init;
                                            CreditAccounts."No." := LAccount;
                                            CreditAccounts."Date of Birth" := saccoAccount."Date of Birth";
                                            CreditAccounts.Name := saccoAccount.Name;
                                            CreditAccounts."ID No." := saccoAccount."ID No.";
                                            CreditAccounts."Mobile Phone No" := saccoAccount."Mobile Phone No";
                                            CreditAccounts."Member No." := saccoAccount."Member No.";
                                            CreditAccounts."Passport No." := saccoAccount."Passport No.";
                                            CreditAccounts."Employer Code" := saccoAccount."Employer Code";
                                            CreditAccounts.Status := Accounts.Status::New;
                                            CreditAccounts."Account Category" := saccoAccount."Account Category";
                                            CreditAccounts."Current Address" := saccoAccount."Current Address";
                                            CreditAccounts.City := saccoAccount.City;
                                            CreditAccounts."Phone No." := saccoAccount."Phone No.";
                                            CreditAccounts."Post Code" := saccoAccount."Post Code";
                                            CreditAccounts.County := saccoAccount.County;
                                            CreditAccounts."E-Mail" := saccoAccount."E-Mail";
                                            CreditAccounts."Product Type" := ProdFac."Product ID";
                                            CreditAccounts."Product Name" := ProdFac."Product Description";
                                            CreditAccounts."Customer Posting Group" := ProdFac."Product Posting Group";
                                            CreditAccounts.Insert(true);

                                        end;
                                    end;

                                    // create LOAN //

                                    LInterest := ROUND(MsaccoLoans.Amount * (ProdFac."Interest Rate (Min.)" / 100), 0.05, '>');

                                    Loans.Init;
                                    Loans."Loan No." := LoanNo;
                                    Loans."Application Date" := Today;
                                    Loans."Loan Product Type" := ProdFac."Product ID";
                                    Loans."Member No." := saccoAccount."Member No.";
                                    Loans."Member Name" := saccoAccount.Name;
                                    Loans."Loan Product Type Name" := ProdFac."Product Description";
                                    Loans."Requested Amount" := MsaccoLoans."Requested Amount";
                                    Loans."Approved Amount" := MsaccoLoans."Requested Amount";
                                    Loans.Status := Loans.Status::Approved;
                                    Loans.Source := Loans.Source::CREDIT;
                                    Loans."Staff No" := saccoAccount."Payroll/Staff No.";
                                    Loans."Employer Code" := saccoAccount."Employer Code";
                                    Loans.Interest := 0;//MComm;//ProdFac."Interest Rate (Max.)";
                                    Loans."Mode of Disbursement" := Loans."mode of disbursement"::"Full Disbursement";
                                    Loans."Global Dimension 1 Code" := '';
                                    Loans."Loan Account" := LAccount;
                                    Loans.Repayment := ROUND((MsaccoLoans.Amount / ProdFac."Prefferential Default installm"), 1, '>');// + ROUND(((MsaccoLoans.Amount *(14/12))/100),1,'>');
                                    Loans.Interest := ProdFac."Interest Rate (Min.)";
                                    Loans."Loan Principle Repayment" := ROUND((MsaccoLoans.Amount / ProdFac."Prefferential Default installm"), 1, '>');
                                    Loans."Recovery Mode" := Loans."recovery mode"::Salary;
                                    Loans."Recovery Priority" := 1;
                                    Loans."Loan Interest Repayment" := 0;
                                    Loans."Amount To Disburse" := MsaccoLoans."Requested Amount";
                                    Loans."Repayment Frequency" := Loans."repayment frequency"::Monthly;
                                    Loans."Interest Calculation Method" := ProdFac."Interest Calculation Method";
                                    Loans."Disbursement Date" := Today;
                                    Loans."Repayment Frequency" := ProdFac."Repayment Frequency";
                                    Loans."Disbursement Account No" := saccoAccount."No.";
                                    Loans."Loan Appraised By" := 'HARAMBEESACCO\MSACCO';
                                    Loans."Captured By" := 'HARAMBEESACCO\MSACCO';
                                    Loans."Global Dimension 2 Code" := 'NBI';
                                    Loans."Approval Date" := Today;
                                    Loans."Loan Span" := Loans."loan span"::"Short Term";
                                    Loans.Installments := ProdFac."Prefferential Default installm";
                                    Loans."Expected Date of Completion" := CalcDate('<CM>', CalcDate(Format(ProdFac."Prefferential Default installm") + 'M', Today));
                                    Loans."Repayment Start Date" := CalcDate('CM', CalcDate('1D', CalcDate('CM', Today)));
                                    Loans."Sub Sector Level2" := MsaccoLoans."Loan Purpose";
                                    Loans.Validate("Sub Sector Level2");
                                    Loans.Posted := true;
                                    Loans."Picked Mobile Loan" := true;

                                    Loans.Insert();
                                    ApprovedAmt := MsaccoLoans."Requested Amount";
                                end;

                                AcctNo := LoanNo;
                            end;



                            //start posting

                            GenJournalLine.Reset;
                            GenJournalLine.SetRange("Journal Template Name", 'MSACCO');
                            GenJournalLine.SetRange("Journal Batch Name", 'MSACCOLN');
                            GenJournalLine.DeleteAll;

                            DocumentNo := MsaccoLoans.DocumentNo;







                            // Dr LOAN Account

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                            GenJournalLine."Account No." := LAccount;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                            GenJournalLine."Loan No" := AcctNo;
                            GenJournalLine.Amount := Loans."Approved Amount";
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := ProdFac."Product Description" + ' - ' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            // Dr LOAN Account

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine."Loan No" := AcctNo;
                            GenJournalLine.Amount := Loans."Approved Amount" * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine.Description := ProdFac."Product Description" + ' - ' + Loans."Loan No.";
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;
                            TotalClearedAmount := 0;
                            OutstandingLoans.Reset;
                            OutstandingLoans.SetRange(OutstandingLoans.Status, OutstandingLoans.Status::Approved);
                            OutstandingLoans.SetRange(OutstandingLoans."Member No.", saccoAccount."Member No.");
                            OutstandingLoans.SetFilter(OutstandingLoans."Loan Product Type", '%1', ProdFac."Product ID");
                            if OutstandingLoans.Find('-') then begin
                                repeat
                                    OutstandingLoans.CalcFields("Outstanding Balance", "Outstanding Interest", "Outstanding Bills");
                                    if OutstandingLoans."Outstanding Balance" > 0 then begin
                                        // Cr LOAN Account
                                        TotalClearedAmount += OutstandingLoans."Outstanding Balance" + OutstandingLoans."Outstanding Interest";
                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                        GenJournalLine."Account No." := OutstandingLoans."Loan Account";//LAccount;
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Repayment;
                                        GenJournalLine."Loan No" := OutstandingLoans."Loan No.";
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Balance" * -1;
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp ' + Loans."Loan No.";
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Cr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                        GenJournalLine."Account No." := OutstandingLoans."Loan Account";//LAccount;
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                                        GenJournalLine."Loan No" := OutstandingLoans."Loan No.";
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Interest" * -1;
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp Interest Paid' + Loans."Loan No.";
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Dr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                        GenJournalLine."Account No." := saccoAccount."No.";
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        //GenJournalLine."Loan No":= AcctNo;
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Balance";
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp Principle ' + OutstandingLoans."Loan No.";
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Dr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                                        GenJournalLine."Account No." := saccoAccount."No.";
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        //GenJournalLine."Loan No":= AcctNo;
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Interest";
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp Interest ' + OutstandingLoans."Loan No.";
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Dr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                                        GenJournalLine."Account No." := LAccount;
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        GenJournalLine."Loan No" := OutstandingLoans."Loan No.";
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Bills" * -1;
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp ' + OutstandingLoans."Loan No.";
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                        // Dr LOAN Account

                                        LineNo := LineNo + 10000;
                                        GenJournalLine.Init;
                                        GenJournalLine."Journal Template Name" := 'MSACCO';
                                        GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                                        GenJournalLine."Line No." := LineNo;
                                        GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                                        GenJournalLine."Account No." := '107001';
                                        GenJournalLine.Validate(GenJournalLine."Account No.");
                                        GenJournalLine."Document No." := DocumentNo;
                                        GenJournalLine."External Document No." := 'MSACCO LN';
                                        GenJournalLine."Posting Date" := Today;
                                        //GenJournalLine."Loan No":= AcctNo;
                                        GenJournalLine.Amount := OutstandingLoans."Outstanding Bills";
                                        GenJournalLine.Validate(GenJournalLine.Amount);
                                        GenJournalLine.Description := 'Loan TopUp ' + OutstandingLoans."Loan No.";
                                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                                        GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                                        GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                        if GenJournalLine.Amount <> 0 then
                                            GenJournalLine.Insert;

                                    end;
                                until OutstandingLoans.Next = 0;
                            end;

                            //Boost Commission Start
                            if TotalClearedAmount > 0 then
                                LineNo := BridgeLoanFunction(LineNo, 'MSACCO', 'MSACCOLN', DocumentNo, TotalClearedAmount, AcctNo, saccoAccount."No.");
                            //Boost Commission End
                            // Dr Loan Processing Commission

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                            GenJournalLine."Account No." := LAccount;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Amount := Loans.Repayment;//-LInterest;//ROUND((MsaccoLoans.Amount/InstallM),1,'>'); // - Loans."Loan Interest Repayment") * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Loan No" := AcctNo;
                            GenJournalLine."Bal. Account Type" := GenJournalLine."account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := ProdFac."Billed Account";
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine.Description := 'Bills' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            //Interest Due
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                            GenJournalLine."Account No." := LAccount;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Amount := LInterest;//ROUND(((MsaccoLoans.Amount *(14/12))/100),1,'>'); // - Loans."Loan Interest Repayment") * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Loan No" := AcctNo;
                            GenJournalLine."Bal. Account Type" := GenJournalLine."account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := ProdFac."Loan Interest Account [G/L]";
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Due";
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine.Description := ProdFac."Product Description" + ' Interest Due ' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;


                            //Interest Paid
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Credit;
                            GenJournalLine."Account No." := LAccount;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Amount := -LInterest;//ROUND(((MsaccoLoans.Amount *(14/12))/100),1,'>'); // - Loans."Loan Interest Repayment") * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Loan No" := AcctNo;
                            //GenJournalLine."Bal. Account Type":=GenJournalLine."Account Type"::"G/L Account";
                            //GenJournalLine."Bal. Account No." :=ProdFac."Loan Interest Account [G/L]";
                            GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
                            //GenJournalLine.VALIDATE("Bal. Account No.");
                            GenJournalLine.Description := ProdFac."Product Description" + ' Interest Paid ' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;


                            //DR Interest Paid FROM Savings
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Amount := LInterest;//ROUND(((MsaccoLoans.Amount *(14/12))/100),1,'>'); // - Loans."Loan Interest Repayment") * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            //GenJournalLine."Loan No":= AcctNo;
                            //GenJournalLine."Bal. Account Type":=GenJournalLine."Account Type"::"G/L Account";
                            //GenJournalLine."Bal. Account No." :=ProdFac."Loan Interest Account [G/L]";
                            //GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::"Interest Paid";
                            //GenJournalLine.VALIDATE("Bal. Account No.");
                            GenJournalLine.Description := ProdFac."Product Description" + ' Interest Paid ' + Loans."Loan No.";
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            //Cr Vendor Share to G/L
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := ProdFac."Product Description" + ' Msacco Fee ' + Loans."Loan No.";
                            GenJournalLine.Amount := Msaccocharge;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            //Cr Vendor Share to G/L
                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                            GenJournalLine."Account No." := Msaccoacc;
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := ProdFac."Product Description" + ' Msacco Fee ' + Loans."Loan No.";
                            GenJournalLine.Amount := Msaccocharge * -1;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            ExciseDuty := MCommission * (GetExciseDuty() / 100);
                            ExciseDutyGL := GetExciseDutyGL();


                            // Dr Member Loan Processing Fee

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := ProdFac."Product Description" + ' - ' + Loans."Loan No." + 'Processing Commission';
                            GenJournalLine.Amount := MCommission;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := LoanProcessingGL;
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            // Dr member Excise Duty
                            GenSetUp.Get;

                            LineNo := LineNo + 10000;
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'MSACCO';
                            GenJournalLine."Journal Batch Name" := 'MSACCOLN';
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := saccoAccount."No.";
                            GenJournalLine.Validate(GenJournalLine."Account No.");
                            GenJournalLine."Document No." := DocumentNo;
                            GenJournalLine."External Document No." := 'MSACCO LN';
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := ProdFac."Product Description" + ' - ' + Loans."Loan No." + 'Excise Duty';
                            GenJournalLine.Amount := ExciseDuty;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := GenSetUp."Excise Duty G/L";
                            GenJournalLine.Validate("Bal. Account No.");
                            GenJournalLine."Shortcut Dimension 1 Code" := saccoAccount."Global Dimension 1 Code";
                            GenJournalLine."Shortcut Dimension 2 Code" := saccoAccount."Global Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;

                            // complete posting

                            POSTJOURNAL.CompletePosting('MSACCO', 'MSACCOLN');


                            Sendsms.SendSms(Optionsms::MSACCO, saccoAccount."Transactional Mobile No", 'Dear Member, your ' + ProdFac."Product Description" + ' of KES' +
                            Format(ApprovedAmt) + ' has been credited to your FOSA A/C. Withdraw via M-SACCO. Loan is due on ' +
                            Format(Loans."Repayment Start Date") + ' to be repaid at KES.' + Format(Loans.Repayment) + ' monthly', '', saccoAccount."No.", false);

                            //Sendsms.SendSms(OptionSMS::MSACCO,saccoAccount."Phone No.",'Dear member, to repay your M-Boosta Loan kindly deposit money to your FOSA A/C No '+
                            //saccoAccount."No." +' through paybill No 525200','',saccoAccount."No.",FALSE);

                            MsaccoLoans.Posted := true;
                            MsaccoLoans.Status := MsaccoLoans.Status::Successful;
                            MsaccoLoans."Date Posted" := CurrentDatetime;
                            MsaccoLoans."Approved Amount" := ApprovedAmt;//Loans."Approved Amount";
                            MsaccoLoans.Remarks := 'Successful';
                            MsaccoLoans."Loan No" := Loans."Loan No.";
                            MsaccoLoans.Modify;
                            //AdviceLoan(Loans."Loan No.",TRUE);

                        end;
                    end else begin
                        MsaccoLoans.Posted := true;
                        MsaccoLoans.Status := MsaccoLoans.Status::Failed;
                        MsaccoLoans."Date Posted" := CurrentDatetime;
                        //MsaccoLoans."Approved Amount":= Loans."Approved Amount";
                        MsaccoLoans.Remarks := 'Product not set';
                        MsaccoLoans.Modify;
                    end;
                end;
                loanCounter := loanCounter + 1;
            until (MsaccoLoans.Next = 0) or (loanCounter = 10);
        end;

    end;

    local procedure MemberVirtualReg(IdNo: Code[20]; IprsName: Text; Gender: Text; dob: Date; Phone: Code[20]; Citizen: Code[10]; IDN: Code[20])
    var
        MemberApplication: Record 52185691;
        MembNoSeries: Record 52185688;
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        MemberAppNo: Code[20];
        Members: Record 52185700;
    begin
        //MemberVirtualReg(IdNo,IPRSNames,Gender,DateOfBirth,TelephoneNo,Citizenship)
        MembNoSeries.Get;
        MembNoSeries.TestField(MembNoSeries."Virtual Member App. No");
        // NoSeriesMgt.InitSeries(MembNoSeries."Virtual Member App. No", MemberApplication."No. Series", 0D, MemberAppNo, MemberApplication."No. Series");

        MemberApplication.Init;
        MemberApplication."No." := MemberAppNo;
        MemberApplication."ID No." := IdNo;
        MemberApplication.Name := IprsName;
        MemberApplication."Application Date" := Today;

        if Gender = 'F' then
            MemberApplication.Gender := MemberApplication.Gender::Female
        else
            MemberApplication.Gender := MemberApplication.Gender::Male;

        MemberApplication."Date of Birth" := dob;
        MemberApplication."Phone No." := Phone;
        MemberApplication.Nationality := Citizen;
        MemberApplication."Virtual Member" := true;

        //Reffered.
        Members.Reset;
        Members.SetRange("ID No.", IDN);
        if Members.Find('-') then begin
            MemberApplication."Recruited by Type" := MemberApplication."recruited by type"::Others;
            MemberApplication."Recruited By" := Members."No.";

            if MemberApplication.Insert = true then begin

                Sendsms.SendSms(Optionsms::MSACCO, Phone, 'Dear ' + MemberApplication.Name + ', your application received and is being processed under ref no:' +
                MemberApplication."No." + ' Please indicate this ref no. on the form and submit to the Sacco to allow for completion of the registration process ' +
                ' For help 0709943000', '', '', false);

                //Sendsms.SendSms(OptionSMS::MSACCO,Member."Phone No.",'Dear Member, your application received and is being processed under ref no:'+
                // MemberApplication."No."+' Please indicate this ref no. on the form and submit to the Sacco to allow for completion of the registration process '+
                //' For help 0709943000','','',FALSE);m

                MSACCORegistrations.Reset;
                MSACCORegistrations.SetRange(MSACCORegistrations."Id No", IdNo);
                if MSACCORegistrations.Find('-') then begin

                    MSACCORegistrations.Posted := true;
                    MSACCORegistrations.Modify;
                end;

            end;

        end;
    end;

    local procedure FindLoan(Phone: Code[20]; EntryLoan: Code[10]) IsCleared: Boolean
    var
        MSACCOLoans: Record 52185761;
        Loans: Record 52185729;
        SavingsAccLonee: Record 52185730;
    begin
        IsCleared := true;
        MSACCOLoans.Get(EntryLoan);
        Loans.Reset;
        Loans.SetRange("Disbursement Account No", MSACCOLoans."Account No");
        Loans.SetFilter("Loan No.", '%1', '*' + EntryLoan + '*');
        Loans.SetRange("Loan Product Type", MSACCOLoans."Loan Code");
        Loans.SetFilter("Outstanding Balance", '>0');
        if Loans.Find('-') then begin
            IsCleared := false;
        end;

        Loans.Reset;
        Loans.SetRange("Loan No.", MSACCOLoans."Loan No");
        Loans.SetFilter("Outstanding Balance", '>0');
        if Loans.Find('-') then begin
            IsCleared := false;
        end;

        exit(IsCleared);
    end;

    local procedure BridgeLoanFunction(LNo: Integer; Jtemplate: Code[20]; JBatch: Code[20]; DocumentN: Code[20]; TotalCleared: Decimal; LoanNo: Code[10]; SavAccountN: Code[20]) LineNo: Integer
    var
        Temp: Record 52185782;
        TopUp: Record 52185742;
        GenJournalLine: Record "Gen. Journal Line";
        Amt: Decimal;
        Descr: Text;
        LoanApps: Record 52185729;
        TCharges: Decimal;
        PCharges: Record 52185734;
        AccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TopUPGL: Code[20];
        "Topup%": Decimal;
        AcctNo: Code[20];
        BridgLoan: Decimal;
        BLoanNo: Code[20];
        BLoanRec: Record 52185729;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        ChargeExtraComms: Boolean;
        ExcemptCharges: Boolean;
    begin
        //MESSAGE('%1',LNo);

        LoanApps.Get(LoanNo);
        TopUPGL := '';
        "Topup%" := 0;
        BridgLoan := 0;
        PCharges.Reset;
        PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
        PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"Top up");
        if PCharges.Find('-') then begin
            repeat
                PCharges.TestField(PCharges."Charges G_L Account");
                //LineNo:=LineNo+10000;
                AccType := Acctype::"G/L Account";
                AccNo := PCharges."Charges G_L Account";
                TopUPGL := PCharges."Charges G_L Account";
                "Topup%" := PCharges.Percentage;
                TransType := Transtype::" ";
                if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") and (PCharges."Charging Option" = PCharges."charging option"::"On Approved Amount") then begin
                    if ChargeExtraComms = true then
                        Amt := (LoanApps."Approved Amount" * (PCharges.Percentage + PCharges."Additional Charge %") / 100)
                    else
                        Amt := (LoanApps."Approved Amount" * (PCharges.Percentage / 100));
                end else
                    if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") and (PCharges."Charging Option" = PCharges."charging option"::"On Net Amount") then begin
                        if ChargeExtraComms = true then
                            Amt := ((TotalCleared) * (PCharges.Percentage + PCharges."Additional Charge %") / 100)
                        else
                            Amt := ((TotalCleared) * (PCharges.Percentage / 100))
                    end else
                        Amt := PCharges."Charge Amount";
                if Amt < PCharges.Minimum then
                    Amt := PCharges.Minimum;
                if Amt > PCharges.Maximum then
                    Amt := PCharges.Maximum;
                Amt := Amt * -1;
                if ExcemptCharges = true then
                    Amt := 0;
                BridgLoan += (Amt * -1);
            until PCharges.Next = 0;
        end;
        //GL
        //Added 06.05.2021
        if BridgLoan > 0 then begin
            if BridgLoan > 50000 then BridgLoan := 50000;
            LNo := LNo + 10000;
            POSTJOURNAL.PostJournal(Jtemplate, JBatch, LNo, Acctype::"G/L Account", DocumentN, PCharges."Charge Description", -BridgLoan, TopUPGL, Today, BalAccType,
            BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

            BLoanNo := LoanProcess.CreateBridgingLoan(LoanApps."Member No.", TotalCleared);
            if BLoanNo <> '' then begin
                if BLoanRec.Get(BLoanNo) then begin

                    AccType := Acctype::Credit;
                    AccNo := BLoanRec."Loan Account";
                    TransType := Transtype::Loan;
                    BalAccType := Balacctype::"G/L Account";
                    BalAccNo := '';

                    LNo := LNo + 10000;
                    Descr := BLoanRec."Loan Product Type Name";

                    //Approved amount
                    if BLoanRec."Approved Amount" > 0 then begin

                        POSTJOURNAL.PostJournal(Jtemplate, JBatch, LNo, AccType, DocumentN, Descr, TotalCleared, AccNo, Today, BalAccType,
                        BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);


                        BLoanRec.Posted := true;
                        BLoanRec.Modify;
                        //Bridging Loan Recovery

                        Members.Get(BLoanRec."Member No.");

                        LNo := LNo + 10000;
                        Descr := BLoanRec."Loan Product Type Name" + '- Repayment';
                        POSTJOURNAL.PostJournal(Jtemplate, JBatch, LNo, Acctype::Credit, DocumentN, Descr, TotalCleared * -1, BLoanRec."Loan Account", Today, BalAccType,
                        BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);
                        //Debit Fosa
                        //MESSAGE('%1 AND %2',LoanApps."Disbursement Account No",LoanApps."Loan No.");
                        LNo := LNo + 10000;
                        Descr := BLoanRec."Loan Product Type Name" + '-Interest Paid';
                        POSTJOURNAL.PostJournal(Jtemplate, JBatch, LNo, Acctype::Savings, DocumentN, Descr, BridgLoan * 1, SavAccountN, Today, BalAccType,
                        '', '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", Transtype::" ", BLoanRec."Loan No.", '', '', 0, '', 0);

                        //Interest Due
                        LNo := LNo + 10000;
                        Descr := BLoanRec."Loan Product Type Name" + '- Interest Due';
                        TransType := Transtype::"Interest Due";
                        POSTJOURNAL.PostJournal(Jtemplate, JBatch, LNo, AccType, DocumentN, Descr, BridgLoan, AccNo, Today, BalAccType,
                        BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);


                        //Interest Paid
                        LNo := LNo + 10000;
                        Descr := BLoanRec."Loan Product Type Name" + '- Interest Paid';
                        TransType := Transtype::"Interest Paid";
                        POSTJOURNAL.PostJournal(Jtemplate, JBatch, LNo, AccType, DocumentNo, Descr, BridgLoan * -1, AccNo, Today, BalAccType,
                        BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);

                    end;
                end;
            end;
        end;
        exit(LNo);
        //End of 06.05.2021 Additions
    end;


    procedure GetUnpostedRecords(value: Integer) PendingItems: Text[1024]
    begin
    end;
}

