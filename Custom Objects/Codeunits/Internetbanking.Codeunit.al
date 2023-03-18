#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52185464 Internetbanking
{

    trigger OnRun()
    begin
        //MESSAGE(AllocateDividends('000029214','00007', 'account',23654,'S02-00007') );
        //MESSAGE(GenerateDividendStatement('000029214','00007'));
        //MESSAGE(GenerateStatement('0126379', '0071681',TODAY,TODAY));
        //MESSAGE(GenerateLoansStatement('00009','00009','L00007'));
        //MESSAGE(FORMAT(GetTotalShares('0014802')));
        //MESSAGE(FORMAT(GetLoanBalances('0014802')));
        //SendSms('PORTAL','+254721872401','Test');
        //MESSAGE(GenerateP9('23073713','3003939') );
        //MESSAGE(GeneratePayslip('20784885','April'));
        //MESSAGE(FORMAT(AccountTransfer('4435969','0000004','801000000400','800000000400',222,'Narration') ));
        //MESSAGE(FORMAT(AccountTransfer('27726462','H4-1693','000-H4-1693','100-H4-1693',222,'Narration') ));
        /*GenJournalLine.RESET;GenerateStatementacc
            GenJournalLine.SETRANGE("Journal Template Name",'INTERNET');
            GenJournalLine.SETRANGE("Journal Batch Name",'INTERNETB');
            GenJournalLine.DELETEALL;*/
        //MESSAGE(LoanRepayment('25112891','0201754','5050201754000','LN00180064',1000));
        //MESSAGE(ChangeLoanAmortisation('23073713','3003939','L00021', 90300)); failed
        //MESSAGE(SavingsAccountOpening('00014','S01',4500)); //failed
        //MESSAGE(MsaccoApplication('23073713','F01-00011-0','',''));
        //MESSAGE(ATMCardApplication('4435969','0000004','801000000400', 'SACCOLINK','')); //this account has an active atm
        //MESSAGE(ATMCardReplacement('13867007','0012911','801001291100', 'SACCOLINK','')); //this account has an active atm
        //MESSAGE(ATMCardReplacement('00038','0029199','S02-00013','', 'CORP')); this account has an active atm
        //MESSAGE(ATMCardDisable('00038','L01-00002922800', 'Narration'));
        //MESSAGE(ChequeBookApplication('00043','000029228','S02-00002922800','001')); success but no no series
        //MESSAGE(CreateConventionalMember('0000009','Internet','Banking','Platform','Male','0987654321','smw@inter.co.ke','KE',CURRENTDATETIME,'NAIROBI'));
        //MESSAGE(FORMAT(GetLoanLastPaymentDate('L00110')));
        //MESSAGE(STOApplication('20847612','0020307','801002030700',643000,'Frequency','Duration',TODAY,'IncomeType','','CREDIT','L190905'));
        //MESSAGE(STOUpdate('20847612','0020307','STR30007','801002030700',640900,'Frequency','Duration',TODAY,'IncomeType','','CREDIT','L190905'));
        //STOUpdate(idNo : Text;BosaNo : Text;StoNo : Text;"Account No" : Text;Amount : Decimal;Frequency : Text;Duration : Text;"Start Date" : Date;IncomeType : Text;Narration : Text;TransferType : Text;destinationAccount : Text) : Text
        //);
        //STOLinesApplication(idNo : Text;BosaNo : Text;"Account No" : Text;Amount : Decimal;Frequency : Text;Duration : Text;"Start Date" : Date;IncomeType : Text) : Text
        //MESSAGE(STOLinesApplication('26850716','00007','BBF-000070', 'S-00023',23000,'00016-0'));
        //MESSAGE(STOStop('20847612','0020307','STR29535'));
        //MESSAGE(FORMAT(InsertOnlineUsersTable('0184855','84450','Password')));
        /*
        BankingNoSetup.GET();
        BankingNoSetup.TESTFIELD(BankingNoSetup."ATM Application Nos");
        MESSAGE(NoSeriesMgt.InitSeries(BankingNoSetup."ATM Application Nos",'ATM',0D,CONVERTSTR('0003'),'ATM'));
        */
        //MESSAGE(BondsApplication('000029228','000029228',BondTypes::"Bid-Bond",'MOD','BND00001','TEst','NBI',TODAY,TODAY,TODAY,90,20000));
        //MESSAGE(BondSecurityLines('000029228','000029228','BND00009','Type','DEtails', 'REmarks', 230000,40000));
        //MESSAGE(BondsCancellation('000029228','000029228','BND00009'));

        //MESSAGE(MemberUpdate('20546809','0126379','Male','Married', '09876543', 'smwangio@fdfd.lo','Addrees','Staff', 'TEST'));

        //MESSAGE(FORMAT(MemberChangeAddNOK('0126379', 'MAC_100509', 'JOHN DOE', 'brother', '', '0712345678','mail@mail.com', 0, 'Test address')));
        //MESSAGE(FORMAT(GetLoanQualificationOnSalary('0126379', '111', 100000, 15000, 5000, 1200000, 48)));

        //MESSAGE(UtilityBills('4435969','0000004','KPLC','801000000400','801000000000',9000));
        //MESSAGE(FORMAT(GetQuartelyBalances('5050140297000','30',17)));
        // InsertOnlineUsersTable('0186510', '20784885', 'JFLV3Y6');

        //GeneratePayslip('25144140','August2017');
        //MESSAGE(SubmitLoan(27));

        //OnlineLoanApplication('20546809', '0126379', '111', 1000, 12,1000,0,0)
        //AdjustDeposits('20546809', '0126379', '020126379', 5150);
        //SendEmail('mngonjo@coretec.co.ke','test','TEST');
        //SendEmail('skinyua@harambeesacco.com','test','TEST');
        //SendEmail('andyngash@gmail.com','test','teeest');
        //MESSAGE(AccountTransfer('24557382','0201747','5050201747000','020201747',1200,'test'))

    end;

    var
        StandingOrderControl: Record 52185722;
        SaccoTransactionsCU: Codeunit "Sacco Transactions";
        Charges: Record "Salesperson/Purchaser";
        filename: Text[100];
        OnlineUsers: Record 52186069;
        MemberCardExisting: Record 52185700;
        MemberCard: Record 52185700;
        LoanCard: Record 52185729;
        ProductType: Record 52185690;
        ReturnCode: Code[10];
        ReturnDecimal: Decimal;
        ReturnInt: Integer;
        ReturnBoolean: Boolean;
        ReturnDateTime: DateTime;
        ReturnDate: Date;
        ReturnList: Text;
        CreditAccounts: Record 52185731;
        SavingsAccounts: Record 52185730;
        SavingsAccount: Record 52185730;
        SavingsLedgerEntry: Record 52185732;
        CreditLedgerEntry: Record 52185733;
        // SMTPSetup: Record "SMTP Mail Setup";
        // SMTPMail: Codeunit 400;
        FILEFOLDER: label '\\HCS_WEBPORTAL\Reports\';
        AuditTrailCard: Record 52185433;
        TokensCard: Record 52186070;
        SpecialRequestCard: Record 52186052;
        SMSCard: Record 52185764;
        OnlineLoansCard: Record 52186053;
        OnlineGuarantors: Record 52186054;
        NewApplicationNumber: Integer;
        MiniBalance: Decimal;
        MsaccoServices: Record 52185762;
        RepaymentAmount: Decimal;
        InterestRepaymentAmount: Decimal;
        LoanOutstanding: Decimal;
        Interest: Decimal;
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        POSTJOURNAL: Codeunit "Journal Posting";
        OptionsAccounts: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        OptionTransactionTypes: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills;
        OptionSMS: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book",Internetbanking,CRM,"Member Withdrawal",Delegate;
        Documentno: Code[10];
        // GLPosting: Codeunit "Gen. Jnl.-Post Line";
        MpesaApplications: Record 52185757;
        MpesaAppD: Record 52185758;
        MemberApplications: Record 52185691;
        MemberApplication: Record 52185691;
        SharesMarket: Record 52185447;
        SharesBid: Record 52185448;
        ATMApplications: Record 52185850;
        ChequeBookCard: Record 52185785;
        HREmployees: Record 52185650;
        PRSalaryCard: Record 52185637;
        PREmployeeP9: Record 52185625;
        PRPayrollPeriods: Record 52185613;
        MemberCardChanges: Record 52185753;
        SendSmsToMember: Codeunit SendSms;
        FILEFOLDER1: label 'C:\Internetbanking\Reports\';
        CompanyInformation: Record "Company Information";
        AccountChargesSetup: Record 52185772;
        OnlineTransactions: Record 52186099;
        ATMCardTypes: Record 52185851;
        ChequeSetUp: Record 52185792;
        StandingOrderHeader: Record 52185717;
        StandingOrderHeaderExisting: Record 52185717;
        StandingOrderLinesExisting: Record 52185718;
        StandingOrderLines: Record 52185718;
        BankingNoSetup: Record 52185781;
        CreditNosSeries: Record 52185688;
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        RecordLink: Record "Record Link";
        BondCardPrevious: Record 52185835;
        BondCard: Record 52185835;
        BondSetup: Record 52185836;
        BondCompany: Record 52185837;
        BondSecurity: Record 52185838;
        BondTypes: Option " ","Bid-Bond","Perfomance Bond";
        SaccoBranches: Record "Dimension Value";
        DividendInstructionsCardExisting: Record 52185712;
        DividendInstructionsCard: Record 52185712;
        DividendsProgressionCard: Record 52185713;
        ATMLinkingApplications: Record 52185842;
        ATMLinkingStatistics: Record 52185844;
        PortalConfiguration: Record 52185446;
        ATMTransactions: Record 52185755;
        MemberChanges: Record 52185753;
        ATMApplicationsExisting: Record 52185850;
        ChequeApplicationExisting: Record 52185785;
        OnlineUsersExisting: Record 52186069;
        Dateformula1: DateFormula;
        Dateformula2: DateFormula;
        DelegatesMinutesHeader: Record 52186056;
        DelegatesMinutesHeaderExisting: Record 52186056;
        DelegatesMeetingAttendees: Record 52186057;
        DelegatesMeetingAttendeesExisting: Record 52186057;
        DelegatesMeetingMinutes: Record 52186058;
        DelegatesMeetingMinutesExisting: Record 52186058;
        DelegateMembers: Record 52186063;
        DelegatesPayment: Record 52186067;
        DelegatePaymentLine: Record 52186068;
        ObjLeaveApplication: Record 52185532;
        ObjHREmployees: Record 52185650;
        varDaysApplied: Integer;
        UserSetup: Record "User Setup";
        UserSetup2: Record "User Setup";
        HRSetup: Record 52185550;
        BaseCalendarChange: Record "Base Calendar Change";
        HRLeaveTypes: Record 52185531;
        ReturnDateLoop: Boolean;
        //P9Report: Report 52185763;
        HRLeaveCalendar: Record 52185551;
        HRLeaveLedgerEntries: Record 52185537;
        CheckoffAdviceLine: Record 52185818;
        LoanGuarantors: Record 52185739;
        HRLeavePeriods: Record 52185535;
        HRLeaveCalendarLines: Record 52185553;
        OnlineLoanReport: Report 52185936;
        RelatedProduct: Record 52185750;
        NextofKINApplication: Record 52185692;


    procedure SendSms(Source: Text; Recipient: Text; SmsMessage: Text): Boolean
    begin
        //OptionSMS::"ATM Collection"
        SendSmsToMember.SendSms(Optionsms::Internetbanking, Recipient, SmsMessage, '', '', false);
    end;


    procedure SendEmail(ToEmail: Text; EmailSubject: Text; EmailBody: Text)
    begin
        if ToEmail <> '' then begin
            CompanyInformation.Get;
            // SMTPSetup.Get;
            // //SMTPMail.CreateMessage(CompanyInformation.Name,CompanyInformation."E-Mail",ToEmail,EmailSubject,'',TRUE);
            // SMTPMail.CreateMessage(SMTPSetup."Email Sender Name", SMTPSetup."Email Sender Address", ToEmail, EmailSubject, '', true);
            // //SMTPMail.AppendBody('************DO NOT REPLY*************');
            // SMTPMail.AppendBody('<br><br>');
            // SMTPMail.AppendBody('Dear Sir/Madam');
            // SMTPMail.AppendBody('<br><br>');
            // SMTPMail.AppendBody(EmailBody);
            // SMTPMail.AppendBody('<br>');
            // SMTPMail.AppendBody('Save regularly, borrow wisely and repay promptly.');
            // SMTPMail.AppendBody('<br><br>');
            // SMTPMail.AppendBody('Thanks & Regards');
            // SMTPMail.AppendBody('<br><br>');

            // SMTPMail.AppendBody('<br><br>');
            // // SMTPMail.AppendBody(SMTPSetup.sen);
            // SMTPMail.AppendBody('<br><br>');
            // SMTPMail.AppendBody('<HR>');
            // SMTPMail.AppendBody('This is a system generated mail. For any complains/ compliments kindly  reply to this email ID or call ' + CompanyInformation."Phone No." + '.');
            // SMTPMail.Send;
            Message('DONE');
        end;
    end;

    local procedure SendApproval(VarVariant: Variant)
    var
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
    begin
        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
            CustomApprovals.OnSendDocForApproval(VarVariant);
    end;


    procedure AuditTrail(idNo: Text; TextDesc: Text[250])
    begin
        // AuditTrailCard.RESET;
        // IF AuditTrailCard.FINDLAST THEN
        // NewApplicationNumber := AuditTrailCard."Delegate No" + 1
        // ELSE
        // NewApplicationNumber := 1;
        // AuditTrailCard."Delegate No" :=NewApplicationNumber;
        //
        // AuditTrailCard."Member No" :=idNo;
        // AuditTrailCard.Description :=TextDesc;
        // AuditTrailCard.Date :=CURRENTDATETIME;
        // AuditTrailCard.INSERT;
    end;


    procedure BlockAccount(MemberNo: Text[100]): Boolean
    begin
        ReturnBoolean := false;
        OnlineUsers.Reset;
        OnlineUsers.SetRange(OnlineUsers."ID Number", MemberNo);
        if OnlineUsers.Find('-') then begin
            OnlineUsers.Blocked := true;
            OnlineUsers."Date Created" := CurrentDatetime;
            OnlineUsers."Last Login" := CurrentDatetime;
            OnlineUsers.Modify;
            ReturnBoolean := true;
        end;
        exit(ReturnBoolean);
    end;


    procedure GeneratePayslip(idNo: Text; periodName: Text): Text[100]
    begin
        filename := FILEFOLDER + idNo;
        filename += '.pdf';
        // if Exists(filename) then
        //     Erase(filename);

        HREmployees.Reset;
        Evaluate(ReturnInt, idNo);

        HREmployees.SetRange(HREmployees."ID Number", ReturnInt);

        if HREmployees.Find('-') then begin

            PRPayrollPeriods.Reset;
            PRPayrollPeriods.SetRange("Period Name", periodName);
            if PRPayrollPeriods.Find('-') then begin
                PRSalaryCard.Reset;
                PRSalaryCard.SetRange(PRSalaryCard."Employee Code", HREmployees."No.");
                PRSalaryCard.SetRange(PRSalaryCard."Period Filter", PRPayrollPeriods."Date Opened");
                // if PRSalaryCard.Find('-') then begin
                //     Report.SaveAsPdf(Report::"PR Individual Payslip", filename, PRSalaryCard);
                // end;
            end;
        end;
        exit(filename);
    end;


    procedure GenerateP9(idNo: Text; From: Integer): Text[100]
    begin
        filename := FILEFOLDER + idNo;
        filename += '.pdf';
        // if Exists(filename) then
        //     Erase(filename);

        HREmployees.Reset;
        Evaluate(ReturnInt, idNo);
        Message(Format(ReturnInt));
        HREmployees.SetRange(HREmployees."ID Number", ReturnInt);

        if HREmployees.Find('-') then begin
            PREmployeeP9.SetRange(PREmployeeP9."Employee Code", HREmployees."No.");
            PREmployeeP9.SetRange("Period Year", From);
            if PREmployeeP9.Find('-') then begin
                //REPORT.SAVEASPDF(REPORT::"prP9A-test  new",filename,HREmployees);//PREmployeeP9);
                // P9Report.SetPeriodYear(From);
                // P9Report.SetTableview(HREmployees);
                // P9Report.SetTableview(PREmployeeP9);
                // P9Report.SaveAsPdf(filename);
            end;
        end;

        exit(filename);
    end;


    procedure GenerateAccountStatement(IdNo: Text; MemberNo: Text; AccountNo: Text; "Start Date": Date; "End Date": Date): Text[100]
    begin
        filename := FILEFOLDER + IdNo;
        filename += '.pdf';
        // if Exists(filename) then
        //     Erase(filename);
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);

        if MemberCard.Find('-') then begin
            SavingsAccount.Reset;
            SavingsAccount.SetRange(SavingsAccount."No.", AccountNo);
            ///SavingsAccount.SETRANGE(SavingsAccount."Member No.",MemberNo);
            SavingsAccount.SetRange(SavingsAccount."Date Filter", "Start Date", "End Date");


            // if SavingsAccount.Find('-') then begin
            //     Report.SaveAsPdf(Report::"Savings Statement", filename, SavingsAccount);
        end;
        // exit(filename);
    end;


    procedure GenerateStatement(IdNo: Text; MemberNo: Text; "Start Date": Date; "End Date": Date): Text[100]
    begin
        filename := FILEFOLDER + IdNo;
        filename += '.pdf';
        // if Exists(filename) then
        //     Erase(filename);
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);
        MemberCard.SetRange(MemberCard."Date Filter", "Start Date", "End Date");
        if MemberCard.Find('-') then begin
            //REPORT.SAVEASPDF(REPORT::"Member Statement",filename,MemberCard);
            // Report.SaveAsPdf(Report::"Member Statement-Detailed", filename, MemberCard);
        end;
        exit(filename);
    end;


    procedure GeneratDividendsSlip(IdNo: Text[100]; MemberNo: Text[100]; Year: Integer): Text[100]
    begin
        filename := FILEFOLDER + IdNo;
        filename += '.pdf';
        // if Exists(filename) then
        //     Erase(filename);

        DividendsProgressionCard.Reset;
        DividendsProgressionCard.SetRange("Member No", MemberNo);
        DividendsProgressionCard.SetRange(Year, 2017);
        //MemberCard.SETRANGE(MemberCard."Date Filter",20140101D,20150909D);
        if DividendsProgressionCard.Find('-') then begin
            // Report.SaveAsPdf(Report::"Dividend Slip", filename, DividendsProgressionCard);
        end;
        exit(filename);
    end;


    procedure GenerateLoansRegister(IdNo: Text; MemberNo: Text[100]): Text[100]
    begin
        filename := FILEFOLDER + IdNo;
        //filename :=WEBREPORTS+filenameFromApp;
        filename += '.pdf';
        // if Exists(filename) then
        //     Erase(filename);

        LoanCard.Reset;
        LoanCard.SetRange(LoanCard."Member No.", MemberNo);
        if LoanCard.Find('-') then begin
            // Report.SaveAsPdf(Report::"Loan Register", filename, LoanCard);
        end;
        exit(filename);
    end;


    procedure GenerateLoansGuaranteed(IdNo: Text[100]; MemberNo: Text[100]): Text[100]
    begin
        filename := FILEFOLDER + IdNo;
        filename += '.pdf';
        // if Exists(filename) then
        //     Erase(filename);
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);

        //MemberCard.SETRANGE(MemberCard."Date Filter",20140101D,20150909D);
        if MemberCard.Find('-') then begin
            // Report.SaveAsPdf(Report::"Loan Guaranteed", filename, MemberCard);
        end;
        exit(filename);
    end;


    procedure GenerateLoansGuarantors(IdNo: Text[100]; BosaNo: Text[100]): Text[100]
    begin
        filename := FILEFOLDER + IdNo;
        filename += '.pdf';
        // if Exists(filename) then
        //     Erase(filename);
        CreditAccounts.Reset;
        CreditAccounts.SetRange(CreditAccounts."Member No.", BosaNo);
        //MemberCard.SETRANGE(MemberCard."Date Filter",20140101D,20150909D);
        if CreditAccounts.Find('-') then begin
            // Report.SaveAsPdf(Report::"Loan Guarators Reports", filename, CreditAccounts);
        end;
        exit(filename);
    end;


    procedure GenerateShareCertificate(IdNo: Text[100]; BosaNo: Text[100]): Text[100]
    begin
        filename := FILEFOLDER + IdNo;
        filename += '.pdf';
        // if Exists(filename) then
        //     Erase(filename);
        CreditAccounts.Reset;
        CreditAccounts.SetRange(CreditAccounts."Member No.", BosaNo);
        //MemberCard.SETRANGE(MemberCard."Date Filter",20140101D,20150909D);
        if CreditAccounts.Find('-') then begin
            // Report.SaveAsPdf(Report::"Loan Guarators Reports", filename, CreditAccounts);
        end;
        exit(filename);
    end;


    procedure GenerateLoansStatement(IdNo: Text[100]; MemberNo: Text[100]; LoanNo: Text): Text[100]
    begin
        filename := FILEFOLDER + IdNo;
        filename += '.pdf';
        // if Exists(filename) then
        //     Erase(filename);

        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);

        //MemberCard.SETRANGE(MemberCard."Date Filter",20140101D,20150909D);
        if MemberCard.Find('-') then begin
            CreditAccounts.Reset;
            LoanCard.Get(LoanNo);
            CreditAccounts.SetRange("Member No.", MemberNo);
            CreditAccounts.SetRange("No.", LoanCard."Loan Account");
            if CreditAccounts.Find('-') then begin
                // Report.SaveAsPdf(Report::"Credit Statement", filename, CreditAccounts);
            end;
        end;
        exit(filename);
    end;


    procedure GenerateDividendStatement(IdNo: Text[100]; MemberNo: Text[100]; DYear: Integer): Text[100]
    begin
        filename := FILEFOLDER + IdNo;
        filename += '.pdf';
        // if Exists(filename) then
        //     Erase(filename);

        DividendsProgressionCard.Reset;
        DividendsProgressionCard.SetRange(DividendsProgressionCard."Member No", MemberNo);
        DividendsProgressionCard.SetRange(Year, DYear);
        if DividendsProgressionCard.Find('-') then begin
            // Report.SaveAsPdf(Report::"Dividend Slip", filename, DividendsProgressionCard);
        end;
        exit(filename);
    end;


    procedure GenerateDividendProgression(IdNo: Text[100]; MemberNo: Text[100]): Text[100]
    begin
        /*filename :=FILEFOLDER+IdNo;
        filename += '.pdf';
         IF EXISTS(filename) THEN
          ERASE(filename);
        MemberCard.RESET;
        MemberCard.SETRANGE(MemberCard."No.",MemberNo);
        
        //MemberCard.SETRANGE(MemberCard."Date Filter",20140101D,20150909D);
        IF MemberCard.FIND('-') THEN BEGIN
        REPORT.SAVEASPDF(REPORT::"Dividend Register",filename,MemberCard);
        END;
        EXIT(filename);*/

        filename := FILEFOLDER + IdNo;
        filename += '.pdf';
        // if Exists(filename) then
        //     Erase(filename);

        DividendsProgressionCard.Reset;
        DividendsProgressionCard.SetRange(DividendsProgressionCard."Member No", MemberNo);

        if DividendsProgressionCard.Find('-') then begin
            // Report.SaveAsPdf(Report::"Dividend Slip", filename, DividendsProgressionCard);
        end;
        exit(filename);

    end;


    procedure GetCreditsBalance(MemberNo: Text[100]; EndDate: DateTime): Decimal
    begin
        ReturnDecimal := 0;
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."ID No.", MemberNo);

        if MemberCard.Find('-') then begin
            CreditAccounts.Reset;
            CreditAccounts.SetRange(CreditAccounts."Member No.", MemberNo);
            if CreditAccounts.Find('-') then begin
                repeat
                    CreditLedgerEntry.Reset;
                    CreditLedgerEntry.SetRange(CreditLedgerEntry."Member No.", MemberNo);
                    CreditLedgerEntry.SetRange(CreditLedgerEntry."Date Filter", 0D, Today);
                    if CreditLedgerEntry.Find('-') then begin
                        repeat
                            ReturnDecimal := ReturnDecimal + CreditLedgerEntry."Amount (LCY)";
                        until CreditLedgerEntry.Next = 0;
                    end;
                until CreditLedgerEntry.Next = 0;
            end;
        end;
        exit(ReturnDecimal);
    end;


    procedure GetSavingsBalance(MemberNo: Text[100]; EndDate: DateTime): Decimal
    begin
        ReturnDecimal := 0;
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."ID No.", MemberNo);

        if MemberCard.Find('-') then begin
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."Member No.", MemberNo);
            if SavingsAccounts.Find('-') then begin
                repeat
                    SavingsLedgerEntry.Reset;
                    SavingsLedgerEntry.SetRange(SavingsLedgerEntry."Member No.", MemberNo);
                    SavingsLedgerEntry.SetRange(SavingsLedgerEntry."Date Filter", 0D, Today);
                    if SavingsLedgerEntry.Find('-') then begin
                        repeat
                            ReturnDecimal := ReturnDecimal + SavingsLedgerEntry."Amount (LCY)";
                        until SavingsLedgerEntry.Next = 0;
                    end;
                until SavingsAccounts.Next = 0;
            end;
        end;
        exit(ReturnDecimal);
    end;


    procedure GetDeposits(MemberNo: Text[100]): Decimal
    begin
        ReturnDecimal := 0;
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);
        if MemberCard.Find('-') then begin
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."Member No.", MemberNo);
            SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Deposit Contribution");
            if SavingsAccounts.Find('-') then begin
                repeat
                    SavingsAccounts.CalcFields("Balance (LCY)");
                    ReturnDecimal := ReturnDecimal + (SavingsAccounts."Balance (LCY)");
                until SavingsAccounts.Next = 0;
            end;
        end;
        exit(ReturnDecimal);
    end;


    procedure FosaSavings(AccountNo: Text[100]): Decimal
    begin
        ReturnDecimal := 0;
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", AccountNo);
        if MemberCard.Find('-') then begin
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."Member No.", AccountNo);
            SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::" ");
            SavingsAccounts.SetRange("Product Name", 'FOSA Savings Account');
            if SavingsAccounts.Find('-') then begin
                repeat
                    SavingsAccounts.CalcFields("Balance (LCY)", Balance);
                    // ReturnDecimal :=
                    ReturnDecimal := ReturnDecimal + SavingsAccounts."Balance (LCY)" - 1000;//getMinimumBalance(SavingsAccounts."Product Type"));
                until SavingsAccounts.Next = 0;
            end;
        end;
        exit(ReturnDecimal);
    end;


    procedure GetAvailableShares(MemberNo: Text): Decimal
    begin
        ReturnDecimal := 0;
        /*MemberCard.RESET;
        MemberCard.SETRANGE(MemberCard."No.",MemberNo);
        IF MemberCard.FIND('-') THEN BEGIN*/

        SavingsAccounts.Reset;
        // SavingsAccounts.SETRANGE(SavingsAccounts."Member No.", MemberNo);
        SavingsAccounts.SetRange("No.", MemberNo);
        if SavingsAccounts.Find('-') then begin
            repeat
                SavingsAccounts.CalcFields("Balance (LCY)");
                ReturnDecimal := ReturnDecimal + Abs(SavingsAccounts."Balance (LCY)");
            until SavingsAccounts.Next = 0;
        end;
        ReturnDecimal := ReturnDecimal / 100;
        // END;
        //MemberCard.CALCFIELDS(MemberCard.);

        exit(ReturnDecimal);

    end;


    procedure GetFixedDeposits(idNo: Text): Decimal
    begin
        ReturnDecimal := 0;
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."ID No.", idNo);
        if MemberCard.Find('-') then begin
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."Member No.", MemberCard."No.");
            SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Fixed Deposit");
            if SavingsAccounts.Find('-') then begin
                repeat
                    SavingsAccounts.CalcFields("Balance (LCY)");
                    ReturnDecimal := ReturnDecimal + Abs(SavingsAccounts."Balance (LCY)");
                until SavingsAccounts.Next = 0;
            end;
        end;
        exit(ReturnDecimal);
    end;


    procedure GetJuniorSavings(idNo: Text): Decimal
    begin
        ReturnDecimal := 0;
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."ID No.", idNo);
        if MemberCard.Find('-') then begin
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."Member No.", MemberCard."No.");
            SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Junior Savings");
            if SavingsAccounts.Find('-') then begin
                repeat
                    SavingsAccounts.CalcFields("Balance (LCY)");
                    ReturnDecimal := ReturnDecimal + Abs(SavingsAccounts."Balance (LCY)");
                until SavingsAccounts.Next = 0;
            end;
        end;
        exit(ReturnDecimal);
    end;


    procedure GetTotalShares(MemberNo: Text): Decimal
    begin
        ReturnDecimal := 0;
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);
        if MemberCard.Find('-') then begin
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."Member No.", MemberNo);
            SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Share Capital");

            if SavingsAccounts.Find('-') then begin
                repeat
                    SavingsAccounts.CalcFields("Balance (LCY)");
                    ReturnDecimal := ReturnDecimal + Abs(SavingsAccounts."Balance (LCY)");
                until SavingsAccounts.Next = 0;
            end;
        end;
        exit(ReturnDecimal);
    end;


    procedure GetBenevolent(MemberNo: Text): Decimal
    begin
        ReturnDecimal := 0;
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."ID No.", MemberNo);
        if MemberCard.Find('-') then begin
            ReturnDecimal := 9000;
        end;
        //MemberCard.CALCFIELDS(MemberCard.);

        exit(ReturnDecimal);
    end;


    procedure GetLoanQualification(BosaNo: Text; LoanType: Text): Boolean
    begin
        exit(true);
    end;


    procedure GetLoanTypes(): Text
    begin
    end;


    procedure GetLoanBalances(MemberNo: Text): Decimal
    begin
        ReturnDecimal := 0;
        LoanCard.Reset;
        LoanCard.SetRange(LoanCard."Member No.", MemberNo);
        LoanCard.SetRange(LoanCard.Posted, true);
        if LoanCard.Find('-') then begin
            repeat
                LoanCard.CalcFields(LoanCard."Outstanding Balance");
                // IF (Loan."Outstanding Balance" >0) THEN
                begin
                    ReturnDecimal := ReturnDecimal + LoanCard."Outstanding Balance";//+LoanCard.Interest;
                end

            until LoanCard.Next = 0;
        end;
        exit(ReturnDecimal);
    end;


    procedure Loanbalance(LoanNo: Text): Decimal
    begin
        ReturnDecimal := 0;
        LoanCard.Reset;
        LoanCard.SetRange(LoanCard."Loan No.", LoanNo);

        if LoanCard.Find('-') then begin
            repeat
                LoanCard.CalcFields(LoanCard."Outstanding Balance");
                // IF (Loan."Outstanding Balance" >0) THEN
                begin
                    ReturnDecimal := ReturnDecimal + LoanCard."Outstanding Balance";//+LoanCard.Interest;
                end

            until LoanCard.Next = 0;
        end;
        exit(ReturnDecimal);
    end;


    procedure GetLoanTypeBalances(MemberNo: Text; LoanType: Text): Decimal
    begin
        ReturnDecimal := 0;
        LoanCard.Reset;
        LoanCard.SetRange(LoanCard."Loan Product Type", LoanType);
        LoanCard.SetRange(LoanCard."Member No.", MemberNo);

        if LoanCard.Find('-') then begin
            repeat
                LoanCard.CalcFields(LoanCard."Outstanding Balance");
                // IF (Loan."Outstanding Balance" >0) THEN
                begin
                    ReturnDecimal := ReturnDecimal + LoanCard."Outstanding Balance";//+LoanCard.Interest;
                end

            until LoanCard.Next = 0;
        end;
        exit(ReturnDecimal)
    end;


    procedure GetBorrowingPower(idNo: Text; LoanType: Code[10]): Decimal
    begin
        ReturnDecimal := 0;



        ReturnDecimal := 90000000;
        exit(ReturnDecimal);
    end;


    procedure UpdateOnlineUsersTable(memberNo: Text[200]; Idnumber: Text[200]; PhoneNumber: Text[200]; Email: Text[200]; BosaNo: Text[200]; FosaNo: Text[200]; MicroNo: Text[200]; Password: Text[200]) inserted: Boolean
    begin
        OnlineUsers.Reset;
        OnlineUsers.SetRange(OnlineUsers."BOSA No", memberNo);
        if OnlineUsers.Find('-') then begin
            OnlineUsers.Password := Password;
            OnlineUsers."Date Created" := CurrentDatetime;
            OnlineUsers."Last Login" := CurrentDatetime;
            OnlineUsers.Modify;
        end;
    end;


    procedure InsertOnlineUsersTable(memberNo: Text[200]; Idnumber: Text[200]; Password: Text[200]) inserted: Boolean
    begin
        inserted := false;
        OnlineUsersExisting.Reset;
        OnlineUsersExisting.SetRange("ID Number", Idnumber);
        OnlineUsersExisting.SetRange("BOSA No", memberNo);

        if OnlineUsersExisting.Find('-') then begin
            OnlineUsersExisting.Password := Password;
            OnlineUsersExisting."Changed Password" := false;
            //OnlineUsersExisting."Date Created" :=CURRENTDATETIME;
            OnlineUsersExisting."Last Login" := CurrentDatetime;
            OnlineUsersExisting.Modify;
            inserted := true;
        end else begin
            Message('Member not found');
            OnlineUsers.Reset;
            OnlineUsers."BOSA No" := memberNo;
            OnlineUsers."Changed Password" := false;
            OnlineUsers."ID Number" := Idnumber;
            OnlineUsers.Password := Password;
            OnlineUsers."Date Created" := CurrentDatetime;
            OnlineUsers."Last Login" := CurrentDatetime;
            OnlineUsers.Insert;
            inserted := true;
        end;
    end;


    procedure Login(Username: Text[200]; Password: Text[200]) logged: Boolean
    begin
        OnlineUsers.Reset;
        OnlineUsers.SetRange(OnlineUsers."ID Number", Username);
        OnlineUsers.SetRange(OnlineUsers.Password, Password);
        OnlineUsers.SetRange(OnlineUsers."Changed Password", true);
        if OnlineUsers.Find('-') then begin
            logged := true;
        end
        else begin
            logged := false;
        end;
    end;


    procedure CreateToken(idNo: Text; MemberNo: Text; Category: Text; token: Text): Boolean
    begin
        MemberCard.Reset;
        MemberCard.SetRange("No.", MemberNo);
        if not MemberCard.FindFirst then exit(false);

        TokensCard.Reset;
        if TokensCard.FindLast then
            NewApplicationNumber := TokensCard.No + 1
        else
            NewApplicationNumber := 1;

        //Close open tokens of same type before creating new
        TokensCard.Reset;
        TokensCard.SetRange(TokensCard.IdNo, idNo);
        TokensCard.SetRange(TokensCard.MemberNo, MemberNo);
        TokensCard.SetRange(TokensCard.Category, Category);
        TokensCard.SetRange(TokensCard.Verified, false);
        if TokensCard.FindFirst then begin
            repeat
                TokensCard.Verified := true;
                TokensCard.Modify;
            until TokensCard.Next = 0;
        end;

        TokensCard.Init;
        TokensCard.No := NewApplicationNumber;
        TokensCard.Category := Category;
        TokensCard.IdNo := idNo;
        TokensCard.Token := token;
        TokensCard.MemberNo := MemberNo;
        TokensCard."Date Created" := CurrentDatetime;
        TokensCard.Verified := false;
        TokensCard.Insert;
        if (MemberCard."Mobile Phone No" <> '') then begin
            ReturnList := 'Your validation token is ' + token;
            SendSmsToMember.SendSms(Optionsms::"Account Status", MemberCard."Mobile Phone No", ReturnList, '', '', false);
        end;

        if (MemberCard."E-Mail" <> '') then SendEmail(MemberCard."E-Mail", 'Validation Token', ReturnList);

        exit(true);
    end;


    procedure CheckToken(idNo: Text; MemberNo: Text; Token: Text; Category: Text) tokenChecked: Boolean
    begin
        TokensCard.Reset;
        TokensCard.SetRange(TokensCard.IdNo, idNo);
        TokensCard.SetRange(TokensCard.MemberNo, MemberNo);
        TokensCard.SetRange(TokensCard.Category, Category);
        TokensCard.SetRange(Token, Token);
        TokensCard.SetRange(TokensCard.Verified, false);
        if TokensCard.Find('-') then begin  //TokensCard."Date Verified" :=CURRENTDATETIME;
            TokensCard.Verified := true;
            // TokensCard.DateVerified :=CURRENTDATETIME;
            TokensCard.Modify;
            tokenChecked := true;
        end
        else begin
            tokenChecked := false;
        end;
    end;


    procedure ChangePassword(MemberNo: Text; Password: Text)
    begin
        OnlineUsers.Reset;
        OnlineUsers.SetRange(OnlineUsers."BOSA No", MemberNo);
        if OnlineUsers.Find('-') then begin
            OnlineUsers.Password := Password;
            OnlineUsers."Date Created" := CurrentDatetime;
            OnlineUsers."Last Login" := CurrentDatetime;
            OnlineUsers."Changed Password" := true;
            OnlineUsers.Modify(true);
        end;
    end;


    procedure OnlineLoanApplication(idNo: Code[10]; BosaNo: Code[10]; LoanType: Code[10]; loanAmount: Decimal; repaymentPeriod: Decimal; basicPay: Decimal; Allowances: Decimal; deductions: Decimal; SelfGuarantee: Boolean; LoanPurpose: Code[40]; LoanBranch: Code[40]; Ghrispass: Text) GeneratedApplicationNo: Text
    var
        NewApplicationNo: Integer;
    begin
        OnlineLoansCard.Reset;
        OnlineLoansCard.SetRange("Membership No", BosaNo);
        OnlineLoansCard.SetRange(Posted, false);
        if OnlineLoansCard.FindFirst then exit('ERROR, You have an existing application');

        OnlineLoansCard.Reset;
        if OnlineLoansCard.FindLast then
            NewApplicationNo := OnlineLoansCard."Application No" + 1
        else
            NewApplicationNo := 1;

        ProductType.Get(LoanType);
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", BosaNo);
        if MemberCard.FindFirst then begin
            OnlineLoansCard."Application No" := NewApplicationNo;
            OnlineLoansCard."Application Date" := CurrentDatetime;
            OnlineLoansCard."Id No" := MemberCard."ID No.";
            OnlineLoansCard."BOSA No" := MemberCard."No.";
            OnlineLoansCard."Member Names" := MemberCard.Name;
            OnlineLoansCard.Email := MemberCard."E-Mail";
            OnlineLoansCard."Membership No" := MemberCard."No.";
            OnlineLoansCard.Telephone := MemberCard."Phone No.";
            OnlineLoansCard."Loan Type" := LoanType;
            OnlineLoansCard."Loan Purpose" := LoanPurpose;
            OnlineLoansCard."Branch Code" := LoanBranch;
            OnlineLoansCard."Ghris Password" := Ghrispass;
            OnlineLoansCard."Loan Type Description" := ProductType."Product Description";
            OnlineLoansCard."Loan Amount" := loanAmount;
            OnlineLoansCard."Repayment Period" := repaymentPeriod;
            OnlineLoansCard."Basic Pay" := basicPay;
            OnlineLoansCard."Total Allowances" := Allowances;
            OnlineLoansCard.TotalDeduction := deductions;
            OnlineLoansCard."Interest Rate" := ProductType."Interest Rate (Max.)";
            OnlineLoansCard."Min No Of Guarantors" := ProductType."Minimum Guarantors";
            //OnlineLoansCard."Sent To Bosa Loans" := FALSE;
            OnlineLoansCard.submitted := false;
            OnlineLoansCard.Refno := '0';
            OnlineLoansCard."Loan No" := '0';
            OnlineLoansCard."Employment No" := MemberCard."Payroll/Staff No.";
            OnlineLoansCard."Self Guarantee" := SelfGuarantee;

            //Check if member has existing loan that needs to be topped up.
            LoanCard.Reset;
            LoanCard.SetRange("Member No.", MemberCard."No.");
            LoanCard.SetRange("Loan Product Type", LoanType);
            LoanCard.SetFilter("Outstanding Balance", '>%1', 0);
            if LoanCard.FindFirst then begin
                if ProductType."Allow Multiple Running Loans" = false then begin
                    OnlineLoansCard.topup := true;
                    OnlineLoansCard.topupref := LoanCard."Loan No.";
                end;
            end;

            OnlineLoansCard.Insert(true);
            if OnlineLoansCard."Self Guarantee" then SelfGuaranteeOnlineLoan(MemberCard."No.", OnlineLoansCard."Application No");
            GeneratedApplicationNo := Format(OnlineLoansCard."Application No");
        end;
        //SendEmail email TO CreditAccounts officer
        //send sms to applicatnt
    end;


    procedure UploadDocumentOnlineLoans(LoanApplicationNo: Integer; DocUrl: Text; Narration: Text; Uploaded_By: Text; Company: Text; DocTrackingValue: Text)
    begin
        // BEGIN
        //      OnlineLoansCard.RESET;
        //      OnlineLoansCard.SETRANGE(OnlineLoansCard."Application No", LoanApplicationNo);
        //      IF OnlineLoansCard.FIND('-') THEN BEGIN
        //
        //      RecordLink.INIT;
        //
        //      RecordLink."Record ID" := OnlineLoansCard.MyRecId;
        //      RecordLink.URL1 := DocUrl;
        //     // RecordLink."Doc Tracking Value" := DocTrackingValue;
        //      RecordLink.Description :=Narration;
        //      RecordLink."User ID" :=USERID;
        //      RecordLink.Company :=Company;
        //      RecordLink.Created := CURRENTDATETIME;
        //      RecordLink."Document No" :=FORMAT(LoanApplicationNo);
        //      RecordLink.INSERT(TRUE);
        //
        //      END
        //    END;
        if not OnlineLoansCard.Get(LoanApplicationNo) then exit;

        RecordLink.Get(OnlineLoansCard.AddLink(DocUrl, Narration));
        // RecordLink."Document No" := Format(LoanApplicationNo);
        RecordLink.Modify;
    end;

    local procedure SelfGuaranteeOnlineLoan(MemberNo: Text; AppNo: Integer)
    begin
        MemberCard.Reset;
        MemberCard.SetRange("No.", MemberNo);
        if not MemberCard.FindFirst then exit;

        OnlineGuarantors.Reset;
        if OnlineGuarantors.FindLast then
            NewApplicationNumber := OnlineGuarantors."Entry No" + 1
        else
            NewApplicationNumber := 1;

        OnlineGuarantors."Entry No" := NewApplicationNumber;
        OnlineGuarantors."Loan Application No" := AppNo;
        OnlineGuarantors."Guarantor No." := MemberCard."No.";
        OnlineGuarantors."Guarantor Names" := MemberCard.Name;
        OnlineGuarantors."Guarantor Email" := MemberCard."E-Mail";
        OnlineGuarantors."Guarantor ID No" := MemberCard."ID No.";
        OnlineGuarantors."Guarantor Phone" := MemberCard."Phone No.";
        OnlineGuarantors."Applicant No" := MemberCard."No.";
        OnlineGuarantors."Applicant Name" := MemberCard.Name;
        OnlineGuarantors."Applicant Mobile" := MemberCard."Phone No.";
        OnlineGuarantors.Approved := true;
        OnlineGuarantors."Approval Status" := true;
        OnlineGuarantors."Self Guarantee" := true;
        OnlineGuarantors.Insert;
    end;


    procedure GuaranteeingPower(idNo: Text; MemberNo: Text; LoanType: Code[10]) GPower: Decimal
    begin
        GPower := 0;
        if MemberCard.Get(MemberNo) then begin

        end;
    end;


    procedure RequestGuarantorship(idNo: Text; guarantor: Text; AppNo: Integer) guaranteed: Boolean
    begin
        guaranteed := false;

        OnlineLoansCard.Reset;
        OnlineLoansCard.SetRange("Application No", AppNo);
        if not OnlineLoansCard.FindFirst then exit;

        NewApplicationNumber := 1;
        OnlineGuarantors.Reset;
        if OnlineGuarantors.FindLast then NewApplicationNumber := OnlineGuarantors."Entry No" + 1;

        MemberCardExisting.Get(OnlineLoansCard."BOSA No");

        //create in online gurantors table
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", guarantor);

        if not MemberCard.FindFirst then exit;

        OnlineGuarantors.Init;
        OnlineGuarantors."Entry No" := NewApplicationNumber;
        OnlineGuarantors."Loan Application No" := AppNo;
        OnlineGuarantors."Guarantor No." := MemberCard."No.";
        OnlineGuarantors."Guarantor Names" := MemberCard.Name;
        OnlineGuarantors."Guarantor Email" := MemberCard."E-Mail";
        OnlineGuarantors."Guarantor ID No" := MemberCard."ID No.";
        OnlineGuarantors."Guarantor Phone" := MemberCard."Phone No.";
        OnlineGuarantors."Applicant No" := MemberCardExisting."No.";
        OnlineGuarantors."Applicant Name" := MemberCardExisting.Name;
        OnlineGuarantors."Applicant Mobile" := MemberCardExisting."Phone No.";
        OnlineGuarantors.Approved := false;
        OnlineGuarantors."Approval Status" := false;
        OnlineGuarantors.Insert;

        //send sms to guarantor
        ReturnList := 'Dear Member, ' + MemberCardExisting.Name + ' has requested loan guarantorship of KES ' + Format(OnlineLoansCard."Loan Amount") + '. Kindly click on https://hcs-webportal.harambeesacco.com to accept or reject the request.';
        SendSmsToMember.SendSms(Optionsms::"Loan Guarantors", MemberCard."Phone No.", ReturnList, '', '', false);
        //send email to guarantor
        //SendEmail(MemberCard."E-Mail", 'Online Loan Guarantorship', ReturnList);
        guaranteed := true;
    end;


    procedure GuaranteeLoan(LoanNo: Integer; MemberNo: Text; Status: Boolean): Boolean
    begin
        OnlineGuarantors.Reset;
        OnlineGuarantors.SetRange(OnlineGuarantors."Loan Application No", LoanNo);
        OnlineGuarantors.SetRange(OnlineGuarantors."Guarantor No.", MemberNo);
        if not OnlineGuarantors.FindFirst then exit;

        OnlineGuarantors.Approved := Status;
        OnlineGuarantors."Approval Status" := true;
        OnlineGuarantors.Modify;

        //send sms/email to loanee
        MemberCard.Get(OnlineGuarantors."Applicant No");
        ReturnList := 'Dear Member, your loan guarantorship has been accepted by ' + OnlineGuarantors."Guarantor Names" + '.';
        if not Status then
            ReturnList := 'Dear Member, your loan guarantorship has been declined by ' + OnlineGuarantors."Guarantor Names" + '.';

        SendSmsToMember.SendSms(Optionsms::"Loan Guarantors", MemberCard."Phone No.", ReturnList, '', '', false);

        //send sms/email to guarantor
        // MemberCard.GET(MemberNo);
        // ReturnList := 'Dear Member, you have Accepted loan Guarantorship. '+MemberCard.Name +'';
        // IF NOT (Status) THEN ReturnList := 'Dear Member, you have Declined loan Guarantorship.';
        // SendSmsToMember.SendSms(OptionSMS::"Loan Guarantors",MemberCard."Phone No.",ReturnList,'','',FALSE);
    end;


    procedure SubmitLoan(LoanNo: Integer) ReturnList: Text
    begin
        ReturnList := 'An error occured when processing this request. Please try again later.';
        OnlineLoansCard.Reset;
        OnlineLoansCard.SetRange("Application No", LoanNo);
        if OnlineLoansCard.Find('-') then begin
            OnlineLoansCard.submitted := true;
            OnlineLoansCard.Modify(true);

            //send email to loans officer
            if MemberCard.Get(OnlineLoansCard."BOSA No") then begin
                ReturnList := 'A new loan application of KES ' + Format(OnlineLoansCard."Loan Amount") + ' has been made by member:' + MemberCard."No.";
                //HREmployees.GET(MemberCard.);
                //SendEmail('smwangi@coretec.co.ke','Loan Application',ReturnList);

                //send sms to member
                ReturnList := 'Dear Member, your loan application have been submitted for evaluation.';
                // SendSmsToMember.SendSms(OptionSMS::"Loan Application",MemberCard."Phone No.",ReturnList,'','',FALSE);
                //SendSmsToMember.SendSms(OptionSMS::"Loan Application",MemberCard."Phone No.",ReturnList,'','',FALSE);
            end;
        end;
    end;


    procedure GeneratePicture(idNo: Text) BaseImage: Text
    var
        IStream: InStream;
        ToFile: Text;
        Bytes: code[100];//dotnet Array;
        Convert: code[100];//dotnet Convert;
        MemoryStream: code[100];//dotnet MemoryStream;
        ImageData: Record 52185702;
    begin
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."ID No.", idNo);
        if MemberCard.Find('-') then begin
            ImageData.Reset;
            ImageData.SetRange("Member No", MemberCard."No.");
            if ImageData.Find('-') then begin
                if ImageData.Picture.Hasvalue then begin
                    ImageData.CalcFields(Picture);
                    ImageData.Picture.CreateInstream(IStream);
                    // MemoryStream := MemoryStream.MemoryStream();
                    // CopyStream(MemoryStream, IStream);
                    // Bytes := MemoryStream.GetBuffer();
                    // BaseImage := Convert.ToBase64String(Bytes);
                end;
            end;

        end;
    end;


    procedure MonthlyAdviceList(MemberNo: Text) response: Text
    begin
        //ReturnList :=':::^12^5^12000:::^12^5^12000:::^14^5^12000';
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);
        if MemberCard.Find('-') then begin
            //get a list of savings accounsts
            // Monthly Contribution
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."Member No.", MemberNo);
            if SavingsAccounts.Find('-') then begin
                repeat
                    if (SavingsAccounts."Monthly Contribution" > 0) then
                        ReturnList := ReturnList + ':::' + SavingsAccounts."No." + ' - ' + SavingsAccounts."Product Name" + '^' + Format(SavingsAccounts."Monthly Contribution");//+LoanCard.Interest;
                until SavingsAccounts.Next = 0;
            end;

            //get list of running loans
            LoanCard.Reset;
            LoanCard.SetRange(LoanCard."Member No.", MemberNo);
            LoanCard.SetRange(LoanCard.Posted, true);
            if LoanCard.Find('-') then begin
                repeat
                    LoanCard.CalcFields(LoanCard."Outstanding Balance");
                    if (LoanCard."Outstanding Balance" > 0) then begin
                        ReturnList := ReturnList + '::: Loan - ' + LoanCard."Loan No." + '^' + Format(LoanCard.Repayment);//+LoanCard.Interest;
                    end

                until LoanCard.Next = 0;
            end;
            //get list of accounts
        end;



        exit(ReturnList);
    end;


    procedure GetQuartelyBalances(AccountNo: Text; cmonth: Text; Cyear: Integer): Decimal
    var
        filterDate: Date;
    begin
        ReturnDecimal := 0;
        SavingsAccounts.Reset;

        //filterDate :=
        //EVALUATE(filterDate,cmonth);

        SavingsAccounts.SetRange(SavingsAccounts."No.", AccountNo);
        SavingsAccounts.SetRange(SavingsAccounts."Date Filter", 20160401D, Today);//TODAY);//filterDate);//
        if SavingsAccounts.Find('-') then begin
            //  REPEAT
            SavingsAccounts.CalcFields("Balance (LCY)");
            if (SavingsAccounts."Product Type" = '505') then
                ReturnDecimal := ReturnDecimal + SavingsAccounts."Balance (LCY)" - 720
            else
                ReturnDecimal := ReturnDecimal + SavingsAccounts."Balance (LCY)";

            //UNTIL SavingsAccounts.NEXT >0;

            Message(Format(ReturnDecimal));
        end;

        exit(ReturnDecimal);
    end;


    procedure AllocateDividends(IdNo: Text; MemberNo: Text; AllocateTo: Text; Amount: Decimal; Account: Text) response: Text
    begin
        response := 'ERROR: dividends allocation failed';

        DividendInstructionsCardExisting.Reset;
        if AllocateTo = 'loan' then begin
            DividendInstructionsCardExisting.SetRange("Account Type", DividendInstructionsCardExisting."account type"::Credit);
            DividendInstructionsCardExisting.SetRange("Loan No.", Account);
        end else begin
            DividendInstructionsCardExisting.SetRange("Account Type", DividendInstructionsCardExisting."account type"::Savings);
            DividendInstructionsCardExisting.SetRange("Account No.", Account);
        end;

        if DividendInstructionsCardExisting.Find('+') then
            response := 'ERROR: allocation for the account already existing'
        else begin


            MemberCard.Reset;
            MemberCard.SetRange(MemberCard."No.", MemberNo);
            if MemberCard.Find('-') then begin
                DividendInstructionsCard.Init;
                DividendInstructionsCard.Amount := Amount;
                DividendInstructionsCard."Member No." := MemberNo;

                if AllocateTo = 'loan' then begin
                    DividendInstructionsCard."Loan No." := Account;
                    LoanCard.Get(Account);
                    DividendInstructionsCard."Account No." := LoanCard."Loan Account";
                    DividendInstructionsCard."Loan No." := Account;
                    DividendInstructionsCard."Account Type" := DividendInstructionsCard."account type"::Credit;

                end else begin
                    DividendInstructionsCard."Account No." := Account;
                    DividendInstructionsCard."Account Type" := DividendInstructionsCard."account type"::Savings;
                end;

                DividendInstructionsCard."Recovery Type" := DividendInstructionsCard."recovery type"::"Based on Amount";
                DividendInstructionsCard."Sent Online" := true;
                DividendInstructionsCard.Insert;
                response := 'OK, dividends allocation successfull';

                //send sms
            end;
        end;
    end;


    procedure GetSharesOnMarket(): Decimal
    begin
        ReturnDecimal := 0;
        SharesMarket.Reset;
        SharesMarket.SetRange(SharesMarket.Status, SharesMarket.Status::Application);
        if SharesMarket.Find('-') then
            repeat
                ReturnDecimal := ReturnDecimal + SharesMarket."Available Shares";
            until SharesMarket.Next = 0;
        exit(ReturnDecimal);
    end;


    procedure BidShares(idNo: Text; memberNo: Text; NoofShares: Decimal; Price: Decimal; FosaAccount: Text): Text
    begin
        ReturnList := 'ERROR: Failed to place bid';
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", memberNo);
        if MemberCard.Find('-') then begin
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."No.", FosaAccount);

            if SavingsAccounts.Find('-') then begin
                ReturnDecimal := GetAccountBalance(SavingsAccounts."No.");
            end;
        end;

        if (ReturnDecimal >= Price * NoofShares) then begin
            if SharesBid.FindLast then
                NewApplicationNumber := SharesBid."No." + 1
            else
                NewApplicationNumber := 1;
            SharesBid."No." := NewApplicationNumber;

            SharesBid."ID No" := idNo;
            SharesBid.Member := memberNo;
            SharesBid.Price := Price;
            SharesBid."No of Shares" := NoofShares;
            SharesBid.Successful := 0;
            SharesBid.Status := SharesBid.Status::Application;
            SharesBid.Insert;
            ReturnList := 'OK, Shares listed successfully';
        end else
            ReturnList := 'ERROR: inadequate funds';
        exit(ReturnList);
    end;


    procedure GetPortalConfigurations(): Text
    begin
        if PortalConfiguration.Get(1) then
            ReturnList := '$entryNo' + Format(PortalConfiguration.No) + '$minprice-' + Format(PortalConfiguration."Min Price") + '$maxprice-' + Format(PortalConfiguration."Max Price")
            + '$minshares-' + Format(PortalConfiguration."Min Shares") + '$maxshares-' + Format(PortalConfiguration."Max Shares") + '$frequency-' + PortalConfiguration."Trading Frequency" + '$day-' + Format(PortalConfiguration."Trading Day");

        exit(ReturnList);
    end;


    procedure FloatShares(idNo: Text; MemberNo: Text; NoofShares: Decimal; Price: Decimal; FosaAccount: Text) SharesFloated: Text
    begin
        SharesFloated := 'ERROR: floating failed';
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);
        if MemberCard.Find('-') then begin
            ReturnDecimal := GetAvailableShares(FosaAccount);

            //get available shares and compare
            if (NoofShares <= ReturnDecimal) then begin
                SharesMarket.Reset;
                if SharesMarket.FindLast then
                    NewApplicationNumber := SharesMarket.No + 1
                else
                    NewApplicationNumber := 1;

                SharesMarket.No := NewApplicationNumber;
                SharesMarket."Available Shares" := NoofShares;
                SharesMarket."No of Shares" := NoofShares;
                SharesMarket.Shares := NoofShares;
                SharesMarket.Member := MemberNo;
                SharesMarket."Created by" := UserId;
                SharesMarket."Created Date" := CurrentDatetime;
                SharesMarket."Id No" := idNo;
                SharesMarket."Min Price" := Price;
                SharesMarket.Status := SharesMarket.Status::Application;
                SharesMarket.Insert;
                SharesFloated := 'OK, floating successfull';
            end else
                SharesFloated := 'ERROR: floating failed. You cannot float more shares than you have.';
        end;
    end;


    procedure FosaAccountBalance(idNo: Text; Account: Text): Decimal
    begin
        ReturnDecimal := GetAccountBalance(Account);
        exit(ReturnDecimal);
    end;


    procedure CheckIfAccountExists(AccountNo: Text) Exists: Boolean
    begin
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."No.", AccountNo);
        if SavingsAccounts.Find('-') then
            ReturnBoolean := true
        else
            ReturnBoolean := false;
        exit(ReturnBoolean);
    end;


    procedure CreateVirtualMember()
    begin
        MemberCard.Reset;
        //MemberCard.SETRANGE(MemberCard."ID No.",IdNo);
        if MemberCard.Find('-') then begin
            //AccountCreated :='Your details already exists in our system, visit the nearest branch';
            //END ELSE BEGIN
            //END
        end;
    end;


    procedure CreateConventionalMember(IdNo: Text; fname: Text; sname: Text; surname: Text; gender: Text; PhoneNo: Text; email: Text; nationality: Text; dob: DateTime; branch: Text) AccountCreated: Text
    begin
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."ID No.", IdNo);
        if MemberCard.Find('-') then begin
            AccountCreated := 'Your details already exists in our system, visit the nearest branch';
        end else begin
            ReturnList := Format(surname + ' ' + fname + ' ' + sname);

            MemberApplications.Reset;
            MemberApplications.SetRange(MemberApplications."ID No.", IdNo);
            if MemberApplications.Find('-') then begin
                AccountCreated := 'Your details already exists in our system, awaiting details verification';
            end else begin

                //create member appplication
                MemberApplication.Init;
                MemberApplication.Validate("No.");
                MemberApplication."Application Date" := Today;

                MemberApplication."First Name" := fname;
                MemberApplication."Second Name" := sname;
                MemberApplication.Validate(MemberApplication."Last Name", surname);
                MemberApplication."Branch Code" := branch;
                MemberApplication.Nationality := nationality;
                MemberApplication."Created By" := UserId;
                MemberApplication.Status := MemberApplication.Status::Open;
                // MemberApplication."Customer Type":='';
                MemberApplication."Date of Birth" := Today;
                MemberApplication."E-Mail" := email;
                //MemberApplication.Gender :=;
                MemberApplication."Phone No." := PhoneNo;
                MemberApplication."Mobile Phone No" := PhoneNo;
                MemberApplication."ID No." := IdNo;
                MemberApplication.Insert;
                AccountCreated := 'Your details have been saved, awaiting details verification';
            end;
        end;
    end;


    procedure ATMCardApplication(idNo: Text; BosaNo: Text; "Account No": Text; CardType: Text; Narration: Text) ReturnedText: Text
    begin
        ReturnedText := 'ERROR: Application failed';

        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."No.", "Account No");
        if SavingsAccounts.Find('-') then begin

            //check if existing
            ATMApplicationsExisting.Reset;
            ATMApplicationsExisting.SetRange(ATMApplicationsExisting."Account No", "Account No");
            ATMApplicationsExisting.SetRange(ATMApplicationsExisting.Status, ATMApplicationsExisting.Status::Open);
            //ATMApplicationsExisting.SETRANGE("Request Type",ATMApplicationsExisting."Request Type"::New);
            if ATMApplicationsExisting.Find('-') then
                ReturnedText := 'ERROR: you have a pending application.'
            else begin
                //check balance to cover the charges
                ReturnDecimal := GetAccountBalance(SavingsAccounts."No.");


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
                ATMApplications."Account No" := SavingsAccounts."No.";
                ATMApplications.Validate("Account No");
                ATMApplications."Responsibility Center" := SavingsAccounts."Responsibility Center";
                ATMApplications.Limit := 40000;
                ATMApplications."Shortcut Dimension 1 Code" := SavingsAccounts."Global Dimension 1 Code";
                ATMApplications."Shortcut Dimension 2 Code" := SavingsAccounts."Global Dimension 2 Code";
                ATMApplications.Status := ATMApplications.Status::Open;
                ATMApplications."Terms Read and Understood" := true;
                ATMApplications."Capture Date" := Today;
                ATMApplications."Captured By" := UserId;
                ATMApplications.Insert;

                //SendApproval(ATMApplications);

                //insert to buffer table
                SpecialRequestCard.Reset;
                if SpecialRequestCard.FindLast then
                    NewApplicationNumber := SpecialRequestCard."Application No" + 1
                else
                    NewApplicationNumber := 1;

                SpecialRequestCard."Application No" := NewApplicationNumber;
                SpecialRequestCard."Application Date" := CurrentDatetime;
                //SpecialRequestCard."Cheque Leaves" :=ChequeType;
                SpecialRequestCard."Request Type" := SpecialRequestCard."request type"::"ATM Card";
                SpecialRequestCard."Id No" := idNo;
                SpecialRequestCard."Member No" := BosaNo;
                //SpecialRequestCard."Cheque Type" :=ChequeType;
                SpecialRequestCard."Account No" := "Account No";
                SpecialRequestCard.Narration := 'ATM card Application on account ' + "Account No";
                SpecialRequestCard.Insert;

                ReturnedText := 'Ok, Application successful. Awaiting processing.';

                SendSmsToMember.SendSms(Optionsms::"ATM Collection", SavingsAccounts."Mobile Phone No", 'ATM application is been processed. You will receive confirmation text when complete', '', '', false);

            end;
        end;
    end;


    procedure ATMCardPinRequest(idNo: Text; BosaNo: Text; "Account No": Text; CardType: Text; Narration: Text) ReturnedText: Text
    begin

        ReturnedText := 'ERROR: Application failed';
        /*
        MemberCard.RESET;
        MemberCard.SETRANGE(MemberCard."No.",BosaNo);
        IF MemberCard.FIND('-') THEN BEGIN */
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."No.", "Account No");
        //SavingsAccounts.SETRANGE("Member No.", MemberCard."No.");
        if SavingsAccounts.Find('-') then begin

            //check if existing
            ATMApplicationsExisting.Reset;
            ATMApplicationsExisting.SetRange(ATMApplicationsExisting."Account No", "Account No");
            ATMApplicationsExisting.SetRange(ATMApplicationsExisting.Status, ATMApplicationsExisting.Status::Open);
            //ATMApplicationsExisting.SETRANGE("Request Type",ATMApplicationsExisting."Request Type"::Replacement);
            if ATMApplicationsExisting.Find('-') then
                ReturnedText := 'ERROR: you have a pending application.'
            else begin

                //disable atm
                ReturnList := ATMCardDisable(idNo, "Account No", 'Renew ATM card');

                ATMApplications.Init;
                //set up no series
                BankingNoSetup.Get();
                BankingNoSetup.TestField(BankingNoSetup."ATM Application Nos");
                // NoSeriesMgt.InitSeries(BankingNoSetup."ATM Application Nos", 'ATM', 0D, ATMApplications."No.", ATMApplications."No. Series");

                ATMApplications."Application Date" := Today;
                ATMApplications."Form No" := ATMApplications."No.";
                ATMApplications."Request Type" := ATMApplications."request type"::Replacement;
                ATMApplications."Card Type" := CardType;
                ATMApplications."Account Type" := ATMApplications."account type"::Savings;
                ATMApplications."Account No" := SavingsAccounts."No.";
                ATMApplications.Validate("Account No");
                ATMApplications."Responsibility Center" := SavingsAccounts."Responsibility Center";
                ATMApplications."Shortcut Dimension 1 Code" := SavingsAccounts."Global Dimension 1 Code";
                ATMApplications."Shortcut Dimension 2 Code" := SavingsAccounts."Global Dimension 2 Code";
                ATMApplications.Status := ATMApplications.Status::Open;
                ATMApplications."Terms Read and Understood" := true;
                ATMApplications.Insert;
                SendApproval(ATMApplications);

                //insert to buffer table
                SpecialRequestCard.Reset;
                if SpecialRequestCard.FindLast then
                    NewApplicationNumber := SpecialRequestCard."Application No" + 1
                else
                    NewApplicationNumber := 1;

                SpecialRequestCard."Application No" := NewApplicationNumber;
                SpecialRequestCard."Application Date" := CurrentDatetime;
                //SpecialRequestCard."Cheque Leaves" :=ChequeType;
                // SpecialRequestCard."Request Type" := SpecialRequestCard."request type"::"7";
                SpecialRequestCard."Id No" := idNo;
                SpecialRequestCard."Member No" := SavingsAccount."Member No.";
                //SpecialRequestCard."Cheque Type" :=ChequeType;
                SpecialRequestCard."Account No" := "Account No";
                SpecialRequestCard.Narration := 'ATM PIN Request on account' + "Account No";
                SpecialRequestCard.Insert;
                ReturnedText := 'Ok, Application successful. Awaiting processing.';

                SendSmsToMember.SendSms(Optionsms::"Account Status", SavingsAccounts."Mobile Phone No", 'ATM renewal is been processed. You will receive confirmation text when complete', '', '', false);

            end;
        end else
            ReturnedText := 'ERROR: account not found';
        //END ELSE ReturnedText :='ERROR: Member account not found';

    end;


    procedure ATMCardReplacement(idNo: Text; BosaNo: Text; "Account No": Text; CardType: Text; Narration: Text) ReturnedText: Text
    begin

        ReturnedText := 'ERROR: Application failed';
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", BosaNo);
        if MemberCard.Find('-') then begin
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."No.", "Account No");
            //SavingsAccounts.SETRANGE("Member No.", MemberCard."No.");
            if SavingsAccounts.Find('-') then begin

                //check if existing
                ATMApplicationsExisting.Reset;
                ATMApplicationsExisting.SetRange(ATMApplicationsExisting."Account No", "Account No");
                ATMApplicationsExisting.SetRange(ATMApplicationsExisting.Status, ATMApplicationsExisting.Status::Open);
                //ATMApplicationsExisting.SETRANGE("Request Type",ATMApplicationsExisting."Request Type"::Replacement);
                if ATMApplicationsExisting.Find('-') then
                    ReturnedText := 'ERROR: you have a pending application.'
                else begin

                    //delink report
                    ATMCardDelink("Account No", Narration);
                    //ReturnList :=ATMCardDisable(idNo,"Account No",'Renew ATM card');

                    ATMApplications.Init;
                    //set up no series
                    BankingNoSetup.Get();
                    BankingNoSetup.TestField(BankingNoSetup."ATM Application Nos");
                    // NoSeriesMgt.InitSeries(BankingNoSetup."ATM Application Nos", 'ATM', 0D, ATMApplications."No.", ATMApplications."No. Series");

                    ATMApplications."Application Date" := Today;
                    ATMApplications."Form No" := ATMApplications."No.";
                    ATMApplications."Request Type" := ATMApplications."request type"::Replacement;
                    ATMApplications."Card Type" := CardType;
                    ATMApplications."Account Type" := ATMApplications."account type"::Savings;
                    ATMApplications."Account No" := SavingsAccounts."No.";
                    ATMApplications.Validate("Account No");
                    ATMApplications."Responsibility Center" := SavingsAccounts."Responsibility Center";
                    ATMApplications."Shortcut Dimension 1 Code" := SavingsAccounts."Global Dimension 1 Code";
                    ATMApplications."Shortcut Dimension 2 Code" := SavingsAccounts."Global Dimension 2 Code";
                    ATMApplications.Status := ATMApplications.Status::Open;
                    ATMApplications."Terms Read and Understood" := true;
                    ATMApplications.Insert(true);

                    //send approval
                    SendApproval(ATMApplications);

                    //insert to buffer table
                    SpecialRequestCard.Reset;
                    if SpecialRequestCard.FindLast then
                        NewApplicationNumber := SpecialRequestCard."Application No" + 1
                    else
                        NewApplicationNumber := 1;

                    SpecialRequestCard."Application No" := NewApplicationNumber;
                    SpecialRequestCard."Application Date" := CurrentDatetime;
                    //SpecialRequestCard."Cheque Leaves" :=ChequeType;
                    // SpecialRequestCard."Request Type" := SpecialRequestCard."request type"::"7";
                    SpecialRequestCard."Id No" := idNo;
                    SpecialRequestCard."Member No" := SavingsAccount."Member No.";
                    //SpecialRequestCard."Cheque Type" :=ChequeType;
                    SpecialRequestCard."Account No" := "Account No";
                    SpecialRequestCard.Narration := 'ATM Card renewal on account' + "Account No";
                    SpecialRequestCard.Insert;
                    ReturnedText := 'Ok, Application successful. Awaiting processing.';

                    SendSmsToMember.SendSms(Optionsms::"Account Status", SavingsAccounts."Mobile Phone No", 'ATM renewal is been processed. You will receive confirmation text when complete', '', '', false);

                end;
            end else
                ReturnedText := 'ERROR: account not found';
            //END ELSE ReturnedText :='ERROR: Member account not found';
        end;
    end;


    procedure ATMCardDisable(idNo: Text; "Account No": Text; Narration: Text): Text
    begin
        ReturnList := 'ERROR: Application failed';
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."No.", "Account No");
        if SavingsAccounts.Find('-') then begin
            SavingsAccount.Get("Account No");
            SavingsAccounts."ATM No." := '';

            SavingsAccounts.Modify;
            //delink
            ATMCardDelink("Account No", Narration);


            //insert to buffer table
            SpecialRequestCard.Reset;
            if SpecialRequestCard.FindLast then
                NewApplicationNumber := SpecialRequestCard."Application No" + 1
            else
                NewApplicationNumber := 1;

            SpecialRequestCard."Application No" := NewApplicationNumber;
            SpecialRequestCard."Application Date" := CurrentDatetime;
            //SpecialRequestCard."Cheque Leaves" :=ChequeType;
            //SpecialRequestCard."Request Type" :=SpecialRequestCard."Request Type"::"ATM Card Disable";
            SpecialRequestCard."Id No" := idNo;
            SpecialRequestCard."Member No" := SavingsAccount."Member No.";
            //SpecialRequestCard."Cheque Type" :=ChequeType;
            SpecialRequestCard."Account No" := "Account No";
            SpecialRequestCard.Narration := 'ATM card disable on account' + "Account No";
            SpecialRequestCard.Insert;

            //send sms
            //IF SavingsAccount.GET("Account No") THEN
            //  BEGIN
            SendSmsToMember.SendSms(Optionsms::"ATM Collection", SavingsAccount."Mobile Phone No", 'Dear Member, your ATM has been deactivated successfully. SACCO', ATMApplications."No.", SavingsAccount."No.", false);
            // END;
            ReturnList := 'OK, ATM deactivated successfully';



        end else
            ReturnList := 'ERROR: account not found';
        exit(ReturnList);
    end;

    local procedure ATMCardDelink(AccountNo: Text; Narration: Text)
    begin
        //delink from atm applications
        ATMApplications.Reset;
        ATMApplications.SetRange("Account No", AccountNo);
        ATMApplications.SetRange(Status, ATMApplications.Status::Approved);
        if ATMApplications.FindLast then begin
            ATMApplications."ATM Delinked Date" := Today;
            ATMApplications."Delinked By" := UserId;
            ATMApplications."ATM Delinked" := true;
            ATMApplications."Card Status" := ATMApplications."card status"::Frozen;
            ATMApplications.Modify;
        end;

        ATMLinkingStatistics.Init;
        ATMLinkingStatistics."Account No." := SavingsAccounts."No.";
        ATMLinkingStatistics."Activity Date" := Today;
        ATMLinkingStatistics."ATM Application No." := ATMApplications."No.";
        ATMLinkingStatistics."Linking Type" := ATMLinkingStatistics."linking type"::Delinking;
        ATMLinkingStatistics."User ID" := UserId;
        ATMLinkingStatistics."Activity Time" := Time;
        ATMLinkingStatistics."Reason for change" := Narration + ' - ' + SavingsAccount."ATM No.";
        ATMLinkingStatistics.Insert(true);
    end;


    procedure GetATMCardNumber(idNo: Text; AccountNo: Text) cardNumber: Text
    begin
        cardNumber := 'Card not found';
        SavingsAccount.Reset;
        SavingsAccount.SetRange(SavingsAccount."No.", AccountNo);
        // SavingsAccount.SETRANGE(SavingsAccount."ID No.",idNo) ;
        if SavingsAccount.Find('-') then begin
            cardNumber := SavingsAccount."ATM No.";
        end;
    end;


    procedure GetATMCardType(idNo: Text; AccountNo: Text) cardNumber: Text
    begin
        cardNumber := 'Card not found';
        ATMApplications.Reset;
        ATMApplications.SetRange(ATMApplications."Account No", AccountNo);
        // SavingsAccount.SETRANGE(SavingsAccount."ID No.",idNo) ;
        if ATMApplications.FindLast then begin
            cardNumber := ATMApplications."Card Type";
        end;
    end;


    procedure MsaccoApplication(idNo: Text; "Account No": Text; "Existing Phone": Text; "New Phone": Text) AccountCreated: Text
    begin
        SavingsAccount.Reset;
        SavingsAccount.SetRange(SavingsAccount."No.", "Account No");
        //SavingsAccount.SETRANGE(SavingsAccount."ID No.",idNo) ;
        if SavingsAccount.Find('-') then begin

            if SavingsAccount."Transactional Mobile No" <> '' then Error('You are already registered for Msacco, Call 0709943000 for a pin reset.');

            MpesaApplications.Reset;
            MpesaApplications.SetRange(MpesaApplications."MPESA Mobile No", "Account No");

            if MpesaApplications.Find('-') then begin
                AccountCreated := ' You are already registered for Msacco, Call 0709943000 for a pin reset.';
            end
            else begin
                MpesaApplications.Reset;
                MpesaApplications.SetRange(MpesaApplications."Account No", SavingsAccount."No.");
                MpesaApplications.SetFilter(Status, '%1|%2', MpesaApplications.Status::Open, MpesaApplications.Status::Pending);
                if MpesaApplications.Find('-') then begin
                    AccountCreated := ' There is already a pending application';
                end else begin
                    MpesaApplications.Init;
                    MpesaApplications."Date Entered" := Today;
                    MpesaApplications."Time Entered" := Time;
                    MpesaApplications."Entered By" := UserId;
                    MpesaApplications."Document Serial No" := SavingsAccount."ID No.";
                    MpesaApplications."Document Date" := Today;
                    MpesaApplications."Account No" := SavingsAccount."No.";
                    MpesaApplications."Customer ID No" := SavingsAccount."ID No.";
                    MpesaApplications."Customer Name" := SavingsAccount.Name;
                    MpesaApplications."MPESA Mobile No" := SavingsAccount."Mobile Phone No";
                    MpesaApplications."MPESA Corporate No" := '651474';
                    MpesaApplications."App Status" := MpesaApplications."app status"::Approved;
                    MpesaApplications."Approved By" := UserId;
                    MpesaApplications."Sent To Server" := MpesaApplications."sent to server"::No;
                    MpesaApplications."1st Approval By" := UserId;
                    MpesaApplications.Status := MpesaApplications.Status::Open;
                    MpesaApplications."Withdrawal Limit Code" := '30K';
                    MpesaApplications.Validate(MpesaApplications."Withdrawal Limit Code");
                    MpesaApplications."Application Type" := MpesaApplications."application type"::Initial;
                    MpesaApplications."Virtual Registration" := false;
                    MpesaApplications.Insert(true);

                    MpesaAppD.Init;
                    MpesaAppD."Application No" := MpesaApplications.No;
                    MpesaAppD."Account Type" := MpesaAppD."account type"::Creditor;
                    MpesaAppD."Account No." := SavingsAccount."No.";
                    MpesaAppD.Description := SavingsAccount.Name;
                    MpesaAppD.Insert;

                    //insert to buffer table
                    SpecialRequestCard.Reset;
                    if SpecialRequestCard.FindLast then
                        NewApplicationNumber := SpecialRequestCard."Application No" + 1
                    else
                        NewApplicationNumber := 1;

                    SpecialRequestCard."Application No" := NewApplicationNumber;
                    SpecialRequestCard."Application Date" := CurrentDatetime;
                    //SpecialRequestCard."Cheque Leaves" :=ChequeType;
                    SpecialRequestCard."Request Type" := 3;//SpecialRequestCard."Request Type"::MSACCO;
                    SpecialRequestCard."Id No" := idNo;
                    SpecialRequestCard."Member No" := SavingsAccount."Member No.";
                    //SpecialRequestCard."Cheque Type" :=ChequeType;
                    SpecialRequestCard."Account No" := "Account No";
                    SpecialRequestCard.Narration := 'MSACCO application on account ' + "Account No";
                    SpecialRequestCard.Insert;


                    //send for approval
                    //SendApproval(MpesaApplications);

                    AccountCreated := ' MSACCO application undergoing approval';
                    SendSmsToMember.SendSms(Optionsms::MSACCO, SavingsAccount."Mobile Phone No", 'MSACCO application is been processed. You will receive confirmation text when complete', '', '', false);

                end;
            end;

        end else begin
            AccountCreated := ' MSACCO application failed';
        end;
    end;


    procedure ChequeBookApplication(idNo: Text; BosaNo: Text; "Account No": Text; ChequeType: Text): Text
    begin
        //ReturnList :='ERROR: Application failed';
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", BosaNo);
        if MemberCard.Find('-') then begin
            Message('Member found');
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."No.", "Account No");
            SavingsAccounts.SetRange("Member No.", MemberCard."No.");

            if SavingsAccounts.Find('-') then begin
                //cheque if there is a pending application
                ChequeApplicationExisting.Reset;
                ChequeApplicationExisting.SetRange(ChequeApplicationExisting.Status, ChequeApplicationExisting.Status::Open);
                ChequeApplicationExisting.SetRange(ChequeApplicationExisting."Account No.", "Account No");
                ChequeApplicationExisting.SetRange(ChequeApplicationExisting."Cheque Book Type", ChequeType);

                if ChequeApplicationExisting.Find('-') then
                    ReturnList := 'ERROR: there is a pending application'
                else begin

                    ChequeBookCard.Init;

                    BankingNoSetup.Get();
                    BankingNoSetup.TestField(BankingNoSetup."Cheque Application Nos");
                    // NoSeriesMgt.InitSeries(BankingNoSetup."Cheque Application Nos", ChequeBookCard."No. Series", 0D, ChequeBookCard."No.", ChequeBookCard."No. Series");

                    //getcheque type
                    ChequeBookCard."Application Date" := Today;
                    ChequeBookCard."Transaction Type" := 'FAMILYBNKCHQ';//ChequeType;
                    ChequeBookCard.Validate(ChequeBookCard."Transaction Type");
                    ChequeBookCard.Validate(ChequeBookCard."Account No.", SavingsAccounts."No.");
                    ChequeBookCard.Validate(ChequeBookCard."Member No.", SavingsAccounts."Member No.");
                    ChequeBookCard.Validate(ChequeBookCard."Cheque Book Type", ChequeType);
                    ChequeBookCard.Status := ChequeBookCard.Status::Open;
                    ChequeBookCard.Insert;

                    //insert to buffer table
                    SpecialRequestCard.Reset;
                    if SpecialRequestCard.FindLast then
                        NewApplicationNumber := SpecialRequestCard."Application No" + 1
                    else
                        NewApplicationNumber := 1;

                    SpecialRequestCard."Application No" := NewApplicationNumber;
                    SpecialRequestCard."Application Date" := CurrentDatetime;
                    //SpecialRequestCard."Cheque Leaves" :=ChequeType;
                    SpecialRequestCard."Request Type" := SpecialRequestCard."request type"::Cheque;
                    SpecialRequestCard."Id No" := idNo;
                    SpecialRequestCard."Member No" := BosaNo;
                    SpecialRequestCard."Cheque Type" := ChequeType;
                    SpecialRequestCard."Account No" := "Account No";
                    SpecialRequestCard.Narration := 'Cheque Application on account' + "Account No";
                    SpecialRequestCard.Insert;


                    if SavingsAccount."Mobile Phone No" <> '' then
                        SendSmsToMember.SendSms(Optionsms::"Account Status", SavingsAccount."Mobile Phone No", 'Cheque application is been processed. You will receive confirmation text when complete', '', '', false);

                    ReturnList := 'OK, Cheque book application undergoing approval';
                end;
            end;
        end else
            ReturnList := 'ERROR: Cheque book application failed';
        exit(ReturnList);
    end;


    procedure STOApplication(idNo: Text; BosaNo: Text; "Account No": Text; Amount: Decimal; Frequency: Text; Duration: Text; "Start Date": Date; IncomeType: Text; Narration: Text; TransferType: Text; destinationAccount: Text): Text
    begin
        //ReturnList :='ERROR: Application failed';
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", BosaNo);
        if MemberCard.Find('-') then begin
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."No.", "Account No");
            SavingsAccounts.SetRange("Member No.", MemberCard."No.");

            if SavingsAccounts.Find('-') then begin

                StandingOrderHeader.Reset;

                BankingNoSetup.Get;
                BankingNoSetup.TestField(BankingNoSetup."Standing Order Nos.");
                // NoSeriesMgt.InitSeries(BankingNoSetup."Standing Order Nos.", StandingOrderHeader."No. Series", 0D, StandingOrderHeader."No.", StandingOrderHeader."No. Series");

                StandingOrderHeader."Application Date" := Today;
                StandingOrderHeader."Transaction Type" := 'STANDING ORDER';
                StandingOrderHeader."Source Account Type" := StandingOrderHeader."source account type"::Savings;

                StandingOrderHeader.Validate(StandingOrderHeader."Source Account Type");
                StandingOrderHeader."Source Account No." := "Account No";
                StandingOrderHeader.Validate(StandingOrderHeader."Source Account No.");

                StandingOrderHeader.Validate(StandingOrderHeader.Amount, Amount);
                StandingOrderHeader.Validate(StandingOrderHeader."Allow Partial Deduction", true);


                if (IncomeType = '0') then
                    StandingOrderHeader.Validate(StandingOrderHeader."Income Type", StandingOrderHeader."income type"::Periodic);
                if (IncomeType = '1') then
                    StandingOrderHeader.Validate(StandingOrderHeader."Income Type", StandingOrderHeader."income type"::Salary);
                if (IncomeType = '2') then
                    StandingOrderHeader.Validate(StandingOrderHeader."Income Type", StandingOrderHeader."income type"::Pension);
                if (IncomeType = '3') then
                    StandingOrderHeader.Validate(StandingOrderHeader."Income Type", StandingOrderHeader."income type"::Milk);
                if (IncomeType = '4') then
                    StandingOrderHeader.Validate(StandingOrderHeader."Income Type", StandingOrderHeader."income type"::Tea);
                if (IncomeType = '5') then
                    StandingOrderHeader.Validate(StandingOrderHeader."Income Type", StandingOrderHeader."income type"::Coffee);


                StandingOrderHeader.Status := StandingOrderHeader.Status::Open;
                StandingOrderHeader.Validate(StandingOrderHeader."Effective/Start Date", "Start Date");
                Evaluate(Dateformula1, Frequency);
                Evaluate(Dateformula2, Duration + 'M');
                StandingOrderHeader."Frequency (Months)" := Dateformula1;
                StandingOrderHeader."Duration (Months)" := Dateformula2;
                // StandingOrderHeader."End Date" :=CALCDATE(StandingOrderHeader."Frequency (Months)", "Start Date");
                StandingOrderHeader.Validate("Standing Order Type", StandingOrderHeader."standing order type"::Internal);
                //   StandingOrderHeader.VALIDATE(StandingOrderHeader.Type ,StandingOrderHeader.Type::Fixed);
                StandingOrderHeader.Description := Narration;


                StandingOrderHeader.Insert(true);

                StandingOrderLinesExisting.Reset;
                StandingOrderLinesExisting.SetRange(StandingOrderLinesExisting."Document No.", StandingOrderHeader."No.");
                if StandingOrderLinesExisting.Find('-') then begin //S-00016
                                                                   // REPEAT
                    StandingOrderLinesExisting.Delete;
                    //  UNTIL StandingOrderLinesExisting.NEXT ==0;

                end;

                StandingOrderLines.Init;
                StandingOrderLines."Document No." := StandingOrderHeader."No.";

                if (TransferType = 'CREDIT') then begin

                    StandingOrderLines."Destination Account Type" := StandingOrderLines."destination account type"::Credit;
                    StandingOrderLines.Validate("Destination Account Type");
                    // StandingOrderLines."Destination Account No." :=destinationAccount;
                    // StandingOrderLines.VALIDATE("Destination Account No.");
                    StandingOrderLines."Loan No." := destinationAccount;
                end else begin
                    StandingOrderLines."Destination Account Type" := StandingOrderLines."destination account type"::Internal;
                    StandingOrderLines.Validate("Destination Account Type");
                    StandingOrderLines."Destination Account No." := destinationAccount;
                    StandingOrderLines.Validate("Destination Account No.");
                    // StandingOrderLines."Loan No." :=destinationAccount;
                end;
                StandingOrderLines.Amount := Amount;
                StandingOrderLines.Insert;
                //send approval
                SendApproval(StandingOrderHeader);
                SendSmsToMember.SendSms(Optionsms::"Account Status", SavingsAccount."Phone No.", 'STO Application is been processed. You will receive confirmation text when complete', '', '', false);

                ReturnList := 'OK, Application undergoing approval :::' + StandingOrderHeader."No.";

            end else
                ReturnList := 'ERROR: savings account not found';
            ;
        end else
            ReturnList := 'ERROR: Member not found';
        exit(ReturnList);
    end;


    procedure STOLinesApplication(idNo: Text; BosaNo: Text; "Account No": Text; OrderNo: Text; Amount: Decimal; destinationAccount: Text): Text
    begin
        //ReturnList :='ERROR: Application failed';
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", BosaNo);
        if MemberCard.Find('-') then begin
            StandingOrderHeader.Reset;
            StandingOrderHeader.SetRange(StandingOrderHeader."Source Account No.", "Account No");
            StandingOrderHeader.SetRange(StandingOrderHeader."No.", OrderNo);
            StandingOrderHeader.SetRange(StandingOrderHeader.Status, StandingOrderHeader.Status::Open);

            if StandingOrderHeader.Find('-') then begin
                StandingOrderLines.Init;
                StandingOrderLines."Document No." := OrderNo;
                StandingOrderLines."Destination Account Type" := StandingOrderLines."destination account type"::Internal;
                StandingOrderLines.Validate("Destination Account Type");
                StandingOrderLines."Destination Account No." := destinationAccount;
                StandingOrderLines.Validate("Destination Account No.");
                StandingOrderLines."Loan No." := destinationAccount;
                StandingOrderLines.Amount := Amount;
                StandingOrderLines.Insert;

                ReturnList := 'OK, Application undergoing approval :::' + StandingOrderHeader."No.";
            end;
        end else
            ReturnList := 'ERROR: No open standing order not found';
        exit(ReturnList);
    end;


    procedure STOUpdate(idNo: Text; BosaNo: Text; StoNo: Text; "Account No": Text; Amount: Decimal; Frequency: Text; Duration: Text; "Start Date": Date; IncomeType: Text; Narration: Text; TransferType: Text; destinationAccount: Text): Text
    begin
        /*//ReturnList :='ERROR: Application failed';
        MemberCard.RESET;
        MemberCard.SETRANGE(MemberCard."No.",BosaNo);
        IF MemberCard.FIND('-') THEN BEGIN
          IF StandingOrderHeaderExisting.GET(StoNo) THEN BEGIN
        
          SavingsAccounts.RESET;
          SavingsAccounts.SETRANGE(SavingsAccounts."No.", "Account No");
          SavingsAccounts.SETRANGE("Member No.", MemberCard."No.");
        
              IF SavingsAccounts.FIND('-') THEN BEGIN
        
                StandingOrderHeader.RESET;
                StandingOrderHeader.SETRANGE(StandingOrderHeader."No.", StoNo);
                StandingOrderHeader.SETRANGE(Status, StandingOrderHeader.Status::Open);
                IF StandingOrderHeader.FIND('-') THEN BEGIN
        
        
                StandingOrderHeader."Source Account Type":=StandingOrderHeader."Source Account Type"::Savings;
        
               // StandingOrderHeader.VALIDATE(StandingOrderHeader."Source Account Type");
                StandingOrderHeader."Source Account No.":="Account No";
                StandingOrderHeader.VALIDATE(StandingOrderHeader."Source Account No.");
        
                StandingOrderHeader.VALIDATE(StandingOrderHeader.Amount,Amount);
                StandingOrderHeader.VALIDATE(StandingOrderHeader."Allow Partial Deduction",TRUE);
        
        IF (IncomeType ='Periodic') THEN
                StandingOrderHeader.VALIDATE(StandingOrderHeader."Income Type", StandingOrderHeader."Income Type"::Periodic);
                IF (IncomeType ='Salary') THEN
                StandingOrderHeader.VALIDATE(StandingOrderHeader."Income Type", StandingOrderHeader."Income Type"::Salary);
                IF (IncomeType ='Pension') THEN
                StandingOrderHeader.VALIDATE(StandingOrderHeader."Income Type", StandingOrderHeader."Income Type"::Pension);
                IF (IncomeType ='Milk') THEN
                StandingOrderHeader.VALIDATE(StandingOrderHeader."Income Type", StandingOrderHeader."Income Type"::Milk);
                IF (IncomeType ='Tea') THEN
                StandingOrderHeader.VALIDATE(StandingOrderHeader."Income Type", StandingOrderHeader."Income Type"::Tea);
                IF (IncomeType ='Coffee') THEN
                StandingOrderHeader.VALIDATE(StandingOrderHeader."Income Type", StandingOrderHeader."Income Type"::Coffee);
        
        
                StandingOrderHeader.Status:=StandingOrderHeader.Status::Open;
                StandingOrderHeader.VALIDATE(StandingOrderHeader."Effective/Start Date", "Start Date");
                EVALUATE(Dateformula1,Frequency);
                EVALUATE(Dateformula2,Duration+'M' );
                StandingOrderHeader."Frequency (Months)" :=Dateformula1;
               StandingOrderHeader."Duration (Months)" :=Dateformula2;
                StandingOrderHeader.VALIDATE("Standing Order Type",StandingOrderHeader."Standing Order Type"::Internal);
                StandingOrderHeader.Description :=Narration;
                StandingOrderHeader.MODIFY;
        
        
                StandingOrderLinesExisting.RESET;
                StandingOrderLinesExisting.SETRANGE( StandingOrderLinesExisting."Document No.",StandingOrderHeader."No.");
                IF StandingOrderLinesExisting.FIND('-') THEN BEGIN //S-00016
                // REPEAT
                   StandingOrderLinesExisting.DELETE;
                 //  UNTIL StandingOrderLinesExisting.NEXT ==0;
        
                  END;
        
                StandingOrderLines.INIT;
                StandingOrderLines."Document No." :=StandingOrderHeader."No.";
        
              IF (TransferType ='CREDIT') THEN BEGIN
        
                StandingOrderLines."Destination Account Type" :=StandingOrderLines."Destination Account Type"::Credit;
                StandingOrderLines.VALIDATE("Destination Account Type");
               // StandingOrderLines."Destination Account No." :=destinationAccount;
               // StandingOrderLines.VALIDATE("Destination Account No.");
                StandingOrderLines."Loan No." :=destinationAccount;
                END ELSE BEGIN
                  StandingOrderLines."Destination Account Type" :=StandingOrderLines."Destination Account Type"::Internal;
                  StandingOrderLines.VALIDATE("Destination Account Type");
                  StandingOrderLines."Destination Account No." :=destinationAccount;
                  StandingOrderLines.VALIDATE("Destination Account No.");
                 // StandingOrderLines."Loan No." :=destinationAccount;
                END;
                StandingOrderLines.Amount :=Amount;
                StandingOrderLines.INSERT;
        //send approval
        SendApproval(StandingOrderHeader);
        
              SendSmsToMember.SendSms(OptionSMS::"Account Status",SavingsAccounts."Phone No.", 'Standing order No: '+StoNo+' update is been processed. You will receive confirmation text when complete','','',FALSE);
        
              ReturnList:='OK, Changes successful and undergoing evaluation';
        
         END ELSE ReturnList:='ERROR: STO number not found';
              END ELSE ReturnList:='ERROR: savings account not found';
              END ELSE ReturnList:='ERROR: STO  not found';
        
          END ELSE ReturnList:='ERROR: Member not found';
          EXIT(ReturnList);
          */
        //ReturnList :='ERROR: Application failed';
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", BosaNo);
        if MemberCard.Find('-') then begin
            if StandingOrderHeaderExisting.Get(StoNo) then begin

                SavingsAccounts.Reset;
                SavingsAccounts.SetRange(SavingsAccounts."No.", "Account No");
                SavingsAccounts.SetRange("ID No.", MemberCard."ID No.");
                SavingsAccounts.SetRange(Blocked, SavingsAccounts.Blocked::" ");
                SavingsAccounts.SetRange(Status, SavingsAccounts.Status::Active);

                if SavingsAccounts.Find('-') then begin


                    StandingOrderHeader.Reset;
                    StandingOrderHeader.SetRange(StandingOrderHeader."No.", StoNo);
                    StandingOrderHeader.SetRange(Status, StandingOrderHeader.Status::Open);
                    // StandingOrderHeader.SETRANGE(Type, StandingOrderHeader.Type::
                    if StandingOrderHeader.Find('-') then begin


                        StandingOrderHeader."Source Account Type" := StandingOrderHeader."source account type"::Savings;

                        // StandingOrderHeader.VALIDATE(StandingOrderHeader."Source Account Type");
                        StandingOrderHeader."Source Account No." := "Account No";
                        StandingOrderHeader.Validate(StandingOrderHeader."Source Account No.");

                        StandingOrderHeader.Validate(StandingOrderHeader.Amount, Amount);
                        // StandingOrderHeader.VALIDATE(StandingOrderHeader."Allow Partial Deduction",TRUE);

                        if (IncomeType = 'Periodic') then
                            StandingOrderHeader.Validate(StandingOrderHeader."Income Type", StandingOrderHeader."income type"::Periodic);
                        if (IncomeType = 'Salary') then
                            StandingOrderHeader.Validate(StandingOrderHeader."Income Type", StandingOrderHeader."income type"::Salary);
                        if (IncomeType = 'Pension') then
                            StandingOrderHeader.Validate(StandingOrderHeader."Income Type", StandingOrderHeader."income type"::Pension);
                        if (IncomeType = 'Milk') then
                            StandingOrderHeader.Validate(StandingOrderHeader."Income Type", StandingOrderHeader."income type"::Milk);
                        if (IncomeType = 'Tea') then
                            StandingOrderHeader.Validate(StandingOrderHeader."Income Type", StandingOrderHeader."income type"::Tea);
                        if (IncomeType = 'Coffee') then
                            StandingOrderHeader.Validate(StandingOrderHeader."Income Type", StandingOrderHeader."income type"::Coffee);


                        StandingOrderHeader.Status := StandingOrderHeader.Status::Open;
                        StandingOrderHeader.Validate(StandingOrderHeader."Effective/Start Date", "Start Date");
                        Evaluate(Dateformula1, Frequency);
                        Evaluate(Dateformula2, Duration + 'M');
                        StandingOrderHeader."Frequency (Months)" := Dateformula1;
                        StandingOrderHeader."Duration (Months)" := Dateformula2;
                        StandingOrderHeader.Validate("Duration (Months)");
                        StandingOrderHeader.Validate("Standing Order Type", StandingOrderHeader."standing order type"::Internal);
                        StandingOrderHeader.Description := Narration;
                        StandingOrderHeader.Modify;


                        StandingOrderLinesExisting.Reset;
                        StandingOrderLinesExisting.SetRange(StandingOrderLinesExisting."Document No.", StandingOrderHeader."No.");
                        if StandingOrderLinesExisting.Find('-') then begin //S-00016
                                                                           // REPEAT
                            StandingOrderLinesExisting.Delete;
                            //  UNTIL StandingOrderLinesExisting.NEXT ==0;

                        end;

                        StandingOrderLines.Init;
                        StandingOrderLines."Document No." := StandingOrderHeader."No.";

                        if (TransferType = 'CREDIT') then begin

                            StandingOrderLines."Destination Account Type" := StandingOrderLines."destination account type"::Credit;
                            StandingOrderLines.Validate("Destination Account Type");
                            // StandingOrderLines."Destination Account No." :=destinationAccount;
                            // StandingOrderLines.VALIDATE("Destination Account No.");
                            StandingOrderLines."Loan No." := destinationAccount;
                        end else begin
                            StandingOrderLines."Destination Account Type" := StandingOrderLines."destination account type"::Internal;
                            StandingOrderLines.Validate("Destination Account Type");
                            StandingOrderLines."Destination Account No." := destinationAccount;
                            StandingOrderLines.Validate("Destination Account No.");
                            // StandingOrderLines."Loan No." :=destinationAccount;
                        end;
                        StandingOrderLines.Amount := Amount;
                        StandingOrderLines.Insert;


                        SendSmsToMember.SendSms(Optionsms::"Account Status", SavingsAccounts."Phone No.", 'Standing order No: ' + StoNo + ' update is been processed. You will receive confirmation text when complete', '', '', false);
                        //sendapproval
                        SendApproval(StandingOrderHeader);
                        /*
                        VarVariant := StandingOrderHeader; //Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                          CustomApprovals.OnSendDocForApproval(VarVariant);*/
                        ReturnList := 'OK, Changes successful and undergoing evaluation';

                    end else
                        ReturnList := 'ERROR: STO number not found';
                end else
                    ReturnList := 'ERROR: savings account not found or is Blocked/Not Active';
            end else
                ReturnList := 'ERROR: STO  not found';

        end else
            ReturnList := 'ERROR: Member not found';
        exit(ReturnList);

    end;


    procedure STOStop(IdNo: Text; BosaNo: Text; STONo: Text): Text
    var
        VarVariant: Variant;
        // CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
    begin
        /*ReturnList :='ERROR: Standing order has to be in approved state';
        StandingOrderHeader.RESET;
        StandingOrderHeader.SETRANGE("No.",STONo);
        
        IF StandingOrderHeader.FIND('+') THEN BEGIN
          IF (StandingOrderHeader.Status =StandingOrderHeader.Status::Approved) THEN
          ReturnList :='ERROR: Standing order has to be in approved state'
          ELSE BEGIN
        {TESTFIELD(Status,Status::Approved);}
        //IF NOT CONFIRM(StopConfirm,TRUE) THEN EXIT;
        
        VarVariant := StandingOrderHeader; //Rec;
        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
          CustomApprovals.OnSendDocForApproval(VarVariant);
        
        IF SavingsAccounts.GET(StandingOrderHeader."Source Account No.") THEN
         SendSmsToMember.SendSms(OptionSMS::"Account Status",SavingsAccounts."Phone No."
          ,'Request to stop standing order No: '+STONo+ ' is undergoing processing '
          ,Documentno, StandingOrderHeader."Source Account No.",FALSE );
        
        ReturnList :='The process is undergoing approval';
        END;
        END;
        EXIT(ReturnList);*/
        ReturnList := 'ERROR: Standing order cannot be cancelled';
        StandingOrderHeader.Reset;
        StandingOrderHeader.SetRange("No.", STONo);

        if StandingOrderHeader.Find('-') then begin
            if (StandingOrderHeader.Status = StandingOrderHeader.Status::Open)
              or (StandingOrderHeader.Status = StandingOrderHeader.Status::Pending)
              or (StandingOrderHeader.Status = StandingOrderHeader.Status::Rejected)
              or (StandingOrderHeader.Status = StandingOrderHeader.Status::Stopped) then
                ReturnList := 'ERROR: Standing order has to be in approved state'
            else begin
                StandingOrderControl.Init;
                StandingOrderControl."Document Date" := Today;
                StandingOrderControl."Document Type" := StandingOrderControl."document type"::Stopped;
                StandingOrderControl."Standing Order No" := STONo;
                StandingOrderControl.Validate("Standing Order No");
                StandingOrderControl.Status := StandingOrderControl.Status::Open;
                StandingOrderControl.Insert(true);

                SendApproval(StandingOrderControl); //Rec;


                if SavingsAccounts.Get(StandingOrderHeader."Source Account No.") then
                    SendSmsToMember.SendSms(Optionsms::"Account Status", SavingsAccounts."Phone No."
                     , 'Request to stop standing order No: ' + STONo + ' is undergoing processing '
                     , Documentno, StandingOrderHeader."Source Account No.", false);

                ReturnList := 'The process is undergoing approval';

                /*
                VarVariant := StandingOrderHeader; //Rec;
                IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                  CustomApprovals.OnSendDocForApproval(VarVariant);

                IF SavingsAccounts.GET(StandingOrderHeader."Source Account No.") THEN
                 SendSmsToMember.SendSms(OptionSMS::"Account Status",SavingsAccounts."Phone No."
                  ,'Request to stop standing order No: '+STONo+ ' is undergoing processing '
                  ,Documentno, StandingOrderHeader."Source Account No.",FALSE );

                ReturnList :='The process is undergoing approval';*/
            end;
        end;
        exit(ReturnList);

    end;


    procedure AccountTransfer(idNo: Text; MemberNo: Text; AccountFrom: Text; AccountTo: Text; Amount: Decimal; Narration: Text) transfered: Text
    begin
        transfered := 'ERROR transaction failed';
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."No.", AccountFrom);
        SavingsAccounts.SetRange(Status, SavingsAccount.Status::Active);
        if SavingsAccounts.Find('-') then begin
            SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
            MiniBalance := GetAccountBalance(SavingsAccounts."No.");

            if (MiniBalance > (Amount)) then begin
                // Documentno:='100000';


                SavingsAccount.Reset;
                SavingsAccount.SetRange(SavingsAccount."No.", AccountTo);
                if SavingsAccount.Find('-') then begin

                    //insert to buffer table
                    OnlineTransactions.Reset;
                    if OnlineTransactions.FindLast then
                        NewApplicationNumber := OnlineTransactions."Document No." + 1
                    else
                        NewApplicationNumber := 1;

                    OnlineTransactions."Document No." := NewApplicationNumber;//Documentno;
                    OnlineTransactions."Document Date" := CurrentDatetime;
                    OnlineTransactions.Amount := Amount;
                    OnlineTransactions.Description := Narration;
                    OnlineTransactions."Transaction Date" := CurrentDatetime;
                    OnlineTransactions."Transaction Type" := OnlineTransactions."transaction type"::"Online Transfer";
                    OnlineTransactions."Account No." := AccountFrom;
                    OnlineTransactions."Account To" := AccountTo;
                    OnlineTransactions."Utility Type" := '';
                    OnlineTransactions."Member No" := MemberNo;
                    OnlineTransactions.Posted := false;
                    OnlineTransactions.Insert;

                    Documentno := 'TRANS' + Format(NewApplicationNumber);
                    //DELETE LINES
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'INTERNET');
                    GenJournalLine.SetRange("Journal Batch Name", 'INTERNETB');
                    GenJournalLine.DeleteAll;

                    //Account From
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('INTERNET', 'INTERNETB', LineNo, Optionsaccounts::Savings, Documentno, 'Online Funds Transfer', Amount
                    , AccountFrom, Today, Optionsaccounts::"G/L Account", '', 'Online TRANSFER', SavingsAccounts."Global Dimension 1 Code", SavingsAccounts."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    // Account to
                    LineNo := LineNo + 10000;
                    POSTJOURNAL.PostJournal('INTERNET', 'INTERNETB', LineNo, Optionsaccounts::Savings, Documentno, 'Online Funds Transfer', Amount * -1
                    , AccountTo, Today, Optionsaccounts::"G/L Account", '', 'Online TRANSFER', SavingsAccounts."Global Dimension 1 Code", SavingsAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                    POSTJOURNAL.CompletePosting('INTERNET', 'INTERNETB');

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'INTERNET');
                    GenJournalLine.SetRange("Journal Batch Name", 'INTERNETB');
                    GenJournalLine.DeleteAll;

                    //advice employer
                    //SavingsAccount.VALIDATE("Monthly Contribution");

                    //*************************************************

                    MemberCard.Reset;
                    MemberCard.SetRange(MemberCard."No.", MemberNo);
                    if MemberCard.Find('-') then begin
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange(SavingsAccounts."No.", AccountTo); //FORMAT(CALCDATE('1M',TODAY),0,'<Month Text>')
                        if SavingsAccounts.Find('-') then begin
                            CheckoffAdviceLine.Init;
                            CheckoffAdviceLine."Member No." := MemberNo;
                            CheckoffAdviceLine.Names := MemberCard.Name;
                            CheckoffAdviceLine."Payroll No" := MemberCard."Payroll/Staff No.";
                            CheckoffAdviceLine."Employer Code" := MemberCard."Employer Code";
                            CheckoffAdviceLine."Employer Account No." := SavingsAccounts."Employer Account No";
                            CheckoffAdviceLine."Advice Date" := Today;
                            CheckoffAdviceLine."Product Type" := SavingsAccounts."Product Type";
                            CheckoffAdviceLine.Validate("Product Type");
                            CheckoffAdviceLine.Time := Time;
                            CheckoffAdviceLine.Type := CheckoffAdviceLine.Type::Savings;
                            CheckoffAdviceLine."Member No." := MemberCard."No.";
                            CheckoffAdviceLine.Validate("Member No.");
                            CheckoffAdviceLine."Account No." := AccountTo;
                            CheckoffAdviceLine."Employer Code" := MemberCard."Employer Code";
                            CheckoffAdviceLine."Amount On" := SavingsAccounts."Monthly Contribution";
                            CheckoffAdviceLine."Amount Off" := SavingsAccounts."Monthly Contribution";
                            CheckoffAdviceLine."Balance On" := SavingsAccounts."Monthly Contribution" + Amount + SavingsAccounts."Employer Balance";
                            CheckoffAdviceLine."Advice Type" := CheckoffAdviceLine."advice type"::Adjustment;
                            //CheckoffAdviceLine.VALIDATE("Advice Type");

                            CheckoffAdviceLine.Insert(true);
                        end;

                        //ReturnList :='OK, Monthly contribution change request under processing. ';
                        //SendSmsToMember.SendSms(OptionSMS::"Account Status",MemberCard."Phone No.",ReturnList,'', '',FALSE );

                    end;// ELSE ReturnList :='ERROR: There is a change request undergoing approval';
                        //*************************************************



                    //update
                    OnlineTransactions.Reset;
                    OnlineTransactions.SetRange(OnlineTransactions."Document No.", NewApplicationNumber);
                    if OnlineTransactions.Find('-') then begin
                        OnlineTransactions.Posted := true;
                        OnlineTransactions."Date Posted" := CurrentDatetime;
                        OnlineTransactions.Modify;
                    end;

                    SendSmsToMember.SendSms(Optionsms::"InterAccount Transfer", SavingsAccounts."Mobile Phone No"
                    , 'Transfer successful. Your new FOSA A/C bal is ' + Format(GetAccountBalance(AccountFrom))
                    , Documentno, AccountFrom, false);
                    transfered := 'OK, transaction successful';
                end;

            end else
                transfered := 'ERROR Insufficient funds in your account';
        end;
    end;


    procedure MpesaTransfer(idNo: Text; MemberNo: Text; AccountFrom: Text; AccountTo: Text; Amount: Decimal; Narration: Text) transfered: Text
    var
        MPesaAccount: Text;
    begin
        transfered := 'ERROR: Transaction failed';

        //Get Utility Bank Account
        AccountChargesSetup.Reset;
        AccountChargesSetup.SetRange(AccountChargesSetup."Account Type", 'UTILITYBANK');
        if AccountChargesSetup.Find('-') then begin
            AccountChargesSetup.TestField(AccountChargesSetup."Bank Account No");
            MPesaAccount := AccountChargesSetup."Bank Account No";
        end;

        SavingsAccount.Reset;
        SavingsAccount.SetRange(SavingsAccount."No.", AccountFrom);
        if SavingsAccount.Find('-') then begin
            ReturnDecimal := GetAccountBalance(SavingsAccount."No.");

            //insert to buffer table
            OnlineTransactions.Reset;
            if OnlineTransactions.FindLast then
                NewApplicationNumber := OnlineTransactions."Document No." + 1
            else
                NewApplicationNumber := 1;

            if (ReturnDecimal > Amount) then begin //AND Amount<>0

                OnlineTransactions."Document No." := NewApplicationNumber;
                OnlineTransactions."Document Date" := CurrentDatetime;
                OnlineTransactions.Amount := Amount;
                OnlineTransactions.Description := Narration;
                OnlineTransactions."Transaction Date" := CurrentDatetime;
                OnlineTransactions."Transaction Type" := OnlineTransactions."transaction type"::"Mpesa Transfer";
                OnlineTransactions."Account No." := AccountFrom;
                OnlineTransactions."Account To" := AccountTo;
                OnlineTransactions."Utility Type" := 'Mpesa';
                OnlineTransactions.Posted := false;
                OnlineTransactions.Insert;

                //connect from msacco server
                transfered := 'Ok, mpesa transfer process is underway.';

                //send sms to member
                SendSmsToMember.SendSms(Optionsms::"InterAccount Transfer", SavingsAccount."Mobile Phone No", 'Mpesa transfer processing is underway, you will receive confirmation sms when complete.', '', '', false);

            end else
                transfered := 'ERROR: Inadequate funds';
        end;
    end;


    procedure GetChequeSetUpList(): Text
    begin
        ChequeSetUp.Reset;
        if ChequeSetUp.Find('-') then begin
            repeat
                ReturnList := ReturnList + ':::' + ChequeSetUp."Cheque Code" + '$' + ChequeSetUp."Cheque Code" + ' - ' + ChequeSetUp."Number Of Leaf" + ' leaves at KES ' + Format(ChequeSetUp.Amount);
            until ChequeSetUp.Next = 0;
        end;
        exit(ReturnList);
    end;


    procedure GetATMCardTypesList(): Text
    begin
        ATMCardTypes.Reset;
        if ATMCardTypes.Find('-') then begin
            repeat
                ReturnList := ReturnList + ':::' + ATMCardTypes.Code + '$' + ATMCardTypes.Description;
            until ATMCardTypes.Next = 0;
        end;
        exit(ReturnList);
    end;


    procedure GetUtilityBillsList() UtilityList: Text[250]
    begin
        UtilityList := ':::DSTV$DSTV:::GOTV$GOTV:::Nairobi Water$Nairobi Water:::HELB$HELB:::STARTIMES$STARTIMES';
    end;


    procedure UtilityBills(idNo: Text; MemberNo: Text; Type: Text; AccountFrom: Text; AccountNo: Text; Amount: Decimal) transfered: Text
    var
        MPesaAccount: Text;
    begin
        transfered := 'ERROR: Transaction failed';
        //Documentno :='Transfer';
        //Get Utility Bank Account
        /* AccountChargesSetup.RESET;
          AccountChargesSetup.SETRANGE(AccountChargesSetup."Account Type",'UTILITYBANK');
          IF AccountChargesSetup.FIND('-') THEN BEGIN
            AccountChargesSetup.TESTFIELD(AccountChargesSetup."Bank Account No");
            MPesaAccount:= AccountChargesSetup."Bank Account No";
          END;
          */

        // Get Msacco Utility Payment G/L
        /* Charges.RESET;
         //Charges.SETRANGE(Charges."Transaction Type",'MSACCOU');
         IF Charges.FIND('-') THEN BEGIN
           Charges.TESTFIELD(Charges."G/L Account");
           MPesaAccount:=Charges."G/L Account";
         END;*/

        SavingsAccount.Reset;
        SavingsAccount.SetRange(SavingsAccount."No.", AccountFrom);
        if SavingsAccount.Find('-') then begin
            ReturnDecimal := GetAccountBalance(SavingsAccount."No.");

            //insert to buffer table
            OnlineTransactions.Reset;
            if OnlineTransactions.FindLast then
                NewApplicationNumber := OnlineTransactions."Document No." + 1
            else
                NewApplicationNumber := 1;

            OnlineTransactions."Document No." := NewApplicationNumber;
            OnlineTransactions."Document Date" := CurrentDatetime;
            OnlineTransactions.Amount := Amount;
            OnlineTransactions.Description := Type + ' BILLS';
            OnlineTransactions."Transaction Date" := CurrentDatetime;
            OnlineTransactions."Transaction Type" := OnlineTransactions."transaction type"::"Utility Payments";
            OnlineTransactions."Account No." := AccountFrom;
            OnlineTransactions."Account To" := AccountNo;
            OnlineTransactions."Utility Type" := Type;
            OnlineTransactions."Member No" := MemberNo;
            OnlineTransactions.Posted := false;
            OnlineTransactions.Insert;

            //remember the charges
            Documentno := 'TRANS' + Format(NewApplicationNumber);
            //remember the excise duty

            if (ReturnDecimal > Amount) then begin //AND Amount<>0

                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", 'INTERNET');
                GenJournalLine.SetRange("Journal Batch Name", 'INTERNET-U');
                GenJournalLine.DeleteAll;

                //charges


                LineNo := LineNo + 10000;
                POSTJOURNAL.PostJournal('INTERNET', 'INTERNET-U', LineNo, Optionsaccounts::Savings, Documentno, Type + ' paymnt', Amount
                , AccountFrom, Today, Optionsaccounts::"G/L Account", '', Type + ' paymnt ', SavingsAccounts."Global Dimension 1 Code", SavingsAccounts."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                // Account to
                LineNo := LineNo + 10000;
                POSTJOURNAL.PostJournal('INTERNET', 'INTERNET-U', LineNo, Optionsaccounts::"G/L Account", Documentno, Type + ' paymnt', Amount * -1
                , MPesaAccount, Today, Optionsaccounts::"G/L Account", '', Type + ' paymnt', SavingsAccounts."Global Dimension 1 Code", SavingsAccount."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                POSTJOURNAL.CompletePosting('INTERNET', 'INTERNET-U');

                transfered := 'Ok, payment process is underway.';
                ReturnList := 'Dear Member, ' + Type + ' payment for acccount ' + AccountNo + ' processing is underway';
                //send sms to member
                SendSmsToMember.SendSms(Optionsms::"InterAccount Transfer", SavingsAccount."Mobile Phone No", ReturnList, '', '', false);

                OnlineTransactions.Reset;
                OnlineTransactions.SetRange(OnlineTransactions."Document No.", NewApplicationNumber);
                if OnlineTransactions.Find('-') then begin
                    OnlineTransactions.Posted := true;
                    OnlineTransactions."Date Posted" := CurrentDatetime;
                    OnlineTransactions.Modify;
                end;

            end else
                transfered := 'ERROR: Inadequate funds';
        end;

    end;


    procedure AdjustDeposits(idNo: Text; MemberNo: Text; AccountNo: Text; Amount: Decimal) returnedValue: Text
    var
        CheckoffFound: Boolean;
    begin
        /*
        //should contain OK if successful if not then contain ERROR
         returnedValue:= 'ERROR: transaction failed';
          SavingsAccounts.RESET;
          SavingsAccounts.SETRANGE(SavingsAccounts."No.",AccountNo) ;
          IF SavingsAccounts.FIND('-') THEN BEGIN
            ProductType.RESET;
            ProductType.SETRANGE(ProductType."Product ID",SavingsAccounts."Product Type");
            IF ProductType.FIND('-') THEN
              MiniBalance:=ProductType."Minimum Balance";
        
           IF (MiniBalance <Amount) THEN BEGIN
            SavingsAccounts."Monthly Contribution":=Amount;
             SavingsAccounts.MODIFY;
             returnedValue:= 'OK, transaction successful';
             END;
          END;//send sms
          //MemberCardChanges
        
        */

        ReturnList := 'ERROR: Monthly contribution request failed. ';
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);
        if MemberCard.Find('-') then begin
            ReturnList := 'ERROR: Member details found. ';
            /*MemberCardChanges.RESET;
            //MemberCardChanges.SETRANGE("Account Type",MemberChanges."Account Type"::Member );
            MemberCardChanges.SETRANGE("Account Type", MemberCardChanges."Account Type"::Savings);
            MemberCardChanges.SETRANGE(MemberCardChanges."Account No.", MemberNo);
            MemberCardChanges.SETRANGE(Status, MemberCardChanges.Status::Approved);
            IF MemberCardChanges.FIND('-') THEN
              ReturnList :='ERROR: Member details change request record exists. '
            ELSE BEGIN
              ReturnList :='ERROR: Member details change request record dont  exists. ';
              MemberChanges.RESET;
              MemberChanges."Account Type" :=MemberChanges."Account Type"::Savings;
              MemberChanges."Application Date":=TODAY;
              MemberChanges."Account No." :=AccountNo;
              //MemberChanges.VALIDATE("Account No.");
              MemberChangesUpdateFields(MemberChanges, MemberCard);
              MemberChanges."Created By" :=USERID;
              MemberChanges."Monthly Contribution" :=Amount;
              MemberChanges.INSERT(TRUE);

            END;*/

            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."No.", AccountNo); //FORMAT(CALCDATE('1M',TODAY),0,'<Month Text>')
            if SavingsAccounts.Find('-') then begin
                CheckoffAdviceLine.Reset;
                CheckoffAdviceLine.SetRange("Member No.", MemberCard."No.");
                CheckoffAdviceLine.SetRange("Advice Type", CheckoffAdviceLine."advice type"::Variations);
                CheckoffAdviceLine.SetRange(Processed, false);
                CheckoffAdviceLine.SetRange(Period, Format(CalcDate('1M', Today), 0, '<Month Text>'));
                if CheckoffAdviceLine.FindFirst then
                    CheckoffAdviceLine.Delete;

                CheckoffAdviceLine.Init;
                CheckoffAdviceLine.Type := CheckoffAdviceLine.Type::Savings;
                CheckoffAdviceLine."Member No." := MemberCard."No.";
                CheckoffAdviceLine.Validate("Member No.");
                CheckoffAdviceLine."Account No." := AccountNo;
                CheckoffAdviceLine.Validate("Account No.");
                CheckoffAdviceLine."Employer Code" := MemberCard."Employer Code";
                CheckoffAdviceLine."Amount On" := Amount;
                CheckoffAdviceLine."Amount Off" := SavingsAccounts."Monthly Contribution";
                CheckoffAdviceLine."Advice Type" := CheckoffAdviceLine."advice type"::Variations;

                CheckoffAdviceLine.Insert(true);
            end;

            ReturnList := 'OK, Monthly contribution change request under processing. ';
            SendSmsToMember.SendSms(Optionsms::"Account Status", MemberCard."Phone No.", ReturnList, '', '', false);

        end;// ELSE ReturnList :='ERROR: There is a change request undergoing approval';
        exit(ReturnList);

    end;

    local procedure MemberChangesUpdateFields(var MemberChanges: Record 52185753; CustMembr: Record 52185700)
    var
        Counts: Integer;
        MultipleApplicationsError: label 'Applicant has a similar application being processed.';
        SignatoryApplication: Record 52185697;
        AccountSignatories: Record 52185703;
        EntryNo: Integer;
    begin
        SavingsAccounts.Get(MemberChanges."Account No.");

        MemberChanges.Validate("Member No.", CustMembr."No.");
        MemberChanges.Validate("Single Party/Multiple/Business", CustMembr."Single Party/Multiple");
        MemberChanges.Validate("First Name", CustMembr."First Name");
        MemberChanges.Validate("Second Name", CustMembr."Second Name");
        MemberChanges.Validate("Last Name", CustMembr."Last Name");
        MemberChanges.Validate(Name, CustMembr.Name);
        MemberChanges.Validate("P.I.N Number", CustMembr."P.I.N Number");
        //VALIDATE("Account Status", CustMembr.Status);
        //VALIDATE(Blocked, CustMembr.Blocked);
        MemberChanges.Validate("Member Segment", CustMembr."Member Segment");
        MemberChanges.Validate("Member Category", CustMembr."Member Category");
        MemberChanges.Validate("Relationship Manager", CustMembr."Relationship Manager");
        MemberChanges.Validate("Mobile Phone No", CustMembr."Mobile Phone No");
        MemberChanges.Validate("E-Mail", CustMembr."E-Mail");
        MemberChanges.Validate(Salutation, CustMembr.Salutation);
        MemberChanges.Validate("Payroll/Staff No.", CustMembr."Payroll/Staff No.");
        MemberChanges.Validate("ID No.", CustMembr."ID No.");
        MemberChanges.Validate("Passport No.", CustMembr."Passport No.");
        MemberChanges.Validate("Date of Birth", CustMembr."Date of Birth");
        MemberChanges.Validate("Marital Status", CustMembr."Marital Status");
        MemberChanges.Validate(Gender, CustMembr.Gender);
        MemberChanges.Validate("Tax Exempted", CustMembr."Tax Exempted");

        MemberChanges.Validate("Signing Instructions", SavingsAccounts."Signing Instructions");
        MemberChanges.Validate("FD Duration", SavingsAccounts."FD Duration");
        MemberChanges.Validate("FD Maturity Date", SavingsAccounts."FD Maturity Date");
        MemberChanges.Validate("Fixed Deposit Amount", SavingsAccounts."Fixed Deposit Amount");
        MemberChanges.Validate("Fixed Deposit cert. no", SavingsAccounts."Fixed Deposit cert. no");
        MemberChanges.Validate("Fixed Deposit Status", SavingsAccounts."Fixed Deposit Status");
        MemberChanges.Validate("Fixed Deposit Type", SavingsAccounts."Fixed Deposit Type");
        MemberChanges.Validate("Neg. Interest Rate", SavingsAccounts."Neg. Interest Rate");
        MemberChanges.Validate("Savings Account No.", SavingsAccounts."Savings Account No.");


        MemberChanges.Validate("Birth Certificate No.", SavingsAccounts."Birth Certificate No.");
        MemberChanges.Validate("Parent Account No.", SavingsAccounts."Parent Account No.");


        MemberChanges.Validate("Product Type", SavingsAccounts."Product Type");
        MemberChanges.Validate("Product Name", SavingsAccounts."Product Name");
        MemberChanges.Validate("Product Category", SavingsAccounts."Product Category");
        //MemberChanges.VALIDATE("Account Status", SavingsAccounts.Status);
        MemberChanges.Validate("ATM No.", SavingsAccounts."ATM No.");
        MemberChanges.Validate(Blocked, SavingsAccounts.Blocked);
        MemberChanges.Validate("Loan Disbursement Account", SavingsAccounts."Loan Disbursement Account");

        MemberChanges.Validate("Group Account No.", CustMembr."Group Account No.");
        MemberChanges.Validate("Group Type", CustMembr."Group Type");
        MemberChanges.Validate("Nature of Business", CustMembr."Nature of Business");
        MemberChanges.Validate("Company Registration No.", CustMembr."Company Registration No.");
        MemberChanges.Validate("Date of Business Reg.", CustMembr."Date of Business Reg.");
        MemberChanges.Validate("Business/Group Location", CustMembr."Business/Group Location");
        MemberChanges.Validate("Plot/Bldg/Street/Road", CustMembr."Plot/Bldg/Street/Road");
        MemberChanges.Validate("Type of Business", CustMembr."Type of Business");
        MemberChanges.Validate("Ownership Type", CustMembr."Ownership Type");
        MemberChanges.Validate("Other Business Type", CustMembr."Other Business Type");

        MemberChanges.Validate("Post Code", CustMembr."Post Code");
        MemberChanges.Validate(City, CustMembr.City);
        MemberChanges.Validate(Nationality, CustMembr.Nationality);
        //VALIDATE(County, CustMembr.County);
        MemberChanges.Validate("Phone No.", CustMembr."Phone No.");
        MemberChanges.Validate("Mobile Phone No", CustMembr."Mobile Phone No");
        MemberChanges.Validate("E-Mail", CustMembr."E-Mail");
        MemberChanges.Validate(Salutation, CustMembr.Salutation);
        MemberChanges.Validate("Current Address", CustMembr."Current Address");

        MemberChanges.Validate("Employer Code", CustMembr."Employer Code");
        MemberChanges.Validate("Global Dimension 1 Code", CustMembr."Global Dimension 1 Code");
        MemberChanges.Validate("Global Dimension 2 Code", CustMembr."Global Dimension 2 Code");
        MemberChanges.Validate("Recruited by Type", CustMembr."Recruited by Type");
        MemberChanges.Validate("Recruited By", CustMembr."Recruited By");
        MemberChanges.Validate("Electrol Zone", CustMembr."Region Code");
        MemberChanges.Validate("Area Service Center", CustMembr."Area Service Center");

        MemberChanges.Validate("Bank Code", CustMembr."Bank Code");
        MemberChanges.Validate("Branch Code", CustMembr."Branch Code");
        MemberChanges.Validate("Bank Account No.", CustMembr."Bank Account No.");

        Counts := 0;
        MemberCardChanges.Reset;
        MemberCardChanges.SetRange(MemberCardChanges."Account No.", MemberChanges."Account No.");
        if MemberCardChanges.Find('-') then begin
            repeat
                if (MemberCardChanges.Status = MemberCardChanges.Status::Open) or (MemberCardChanges.Status = MemberCardChanges.Status::Pending) then begin
                    Counts += 1;
                end;
            until MemberCardChanges.Next = 0;
        end;
        if Counts > 1 then Error(MultipleApplicationsError);
        ///Get Signatory

        SignatoryApplication.Reset;
        SignatoryApplication.SetRange("Account No", MemberChanges."No.");
        if SignatoryApplication.Find('-') then
            SignatoryApplication.DeleteAll;


        AccountSignatories.Reset;
        AccountSignatories.SetRange(AccountSignatories."Account No", MemberChanges."Member No.");
        if AccountSignatories.Find('-') then begin
            repeat
                EntryNo += 1;
                SignatoryApplication.Init;
                SignatoryApplication."Account No" := MemberChanges."No.";
                SignatoryApplication."Entry No" := EntryNo;
                SignatoryApplication."Member No." := MemberChanges."Member No.";
                SignatoryApplication."ID Number" := AccountSignatories."ID Number";
                SignatoryApplication."Date Of Birth" := AccountSignatories."Date Of Birth";
                SignatoryApplication.Signatory := AccountSignatories.Signatory;
                SignatoryApplication.CalcFields(Signatory, Picture);
                SignatoryApplication.Signature := AccountSignatories.Signature;
                SignatoryApplication.Picture := AccountSignatories.Picture;
                SignatoryApplication."Must be Present" := AccountSignatories."Must be Present";
                SignatoryApplication."Must Sign" := AccountSignatories."Must Sign";
                SignatoryApplication.Names := AccountSignatories.Names;
                SignatoryApplication."Staff/Payroll" := AccountSignatories."Staff/Payroll";
                SignatoryApplication.Type := AccountSignatories.Type;
                SignatoryApplication."Expiry Date" := AccountSignatories."Expiry Date";
                SignatoryApplication.Insert;

            until AccountSignatories.Next = 0;
        end;

        // MemberChanges.GetNextofkin;
    end;


    procedure SavingsAccountTypesList(MemberNo: Text) AccountTyList: Text
    begin
    end;


    procedure LoanRepayment(IdNo: Text; MemberNo: Text; AccountFrom: Text; LoanNo: Text; Amount: Decimal) responseText: Text
    var
        LoanAccount: Code[50];
        DisbursementAccount: Code[50];
    begin
        responseText := 'Loan Repayment failed';
        ReturnDecimal := 0;

        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."No.", AccountFrom);
        if not SavingsAccounts.FindFirst then exit;

        ReturnDecimal := GetAccountBalance(SavingsAccounts."No.");
        if Amount >= ReturnDecimal then exit;

        //insert to buffer table
        NewApplicationNumber := 1;
        OnlineTransactions.Reset;
        if OnlineTransactions.FindLast then NewApplicationNumber := OnlineTransactions."Document No." + 1;

        OnlineTransactions.Init;
        OnlineTransactions."Document No." := NewApplicationNumber;
        OnlineTransactions."Document Date" := CurrentDatetime;
        OnlineTransactions.Amount := Amount;
        OnlineTransactions.Description := LoanNo + ' loan repayment';
        OnlineTransactions."Transaction Date" := CurrentDatetime;
        OnlineTransactions."Transaction Type" := OnlineTransactions."transaction type"::"Loan Repayment";
        OnlineTransactions."Account No." := AccountFrom;
        OnlineTransactions."Account To" := LoanNo;
        OnlineTransactions.Posted := false;
        OnlineTransactions.Insert;

        Documentno := 'TRANS' + Format(NewApplicationNumber);

        LoanCard.Reset;
        LoanCard.SetRange(LoanCard."Loan No.", LoanNo);
        if LoanCard.FindFirst then begin
            LoanCard.CalcFields(LoanCard."Outstanding Balance", LoanCard."Outstanding Interest");
            Interest := LoanCard."Outstanding Interest";
            LoanOutstanding := LoanCard."Outstanding Balance";


            if (LoanCard."Disbursement Account No" <> '') then
                DisbursementAccount := AccountFrom//LoanCard."Disbursement Account No"
            else
                DisbursementAccount := AccountFrom;//GetPrimeAccount(MemberNo);

            if Interest > 0 then begin
                InterestRepaymentAmount := 0;
                if Amount > Interest then
                    InterestRepaymentAmount := Interest
                else
                    InterestRepaymentAmount := Amount;

                //Interest Repayment
                LineNo := LineNo + 10000;
                POSTJOURNAL.PostJournal('INTERNET', 'INTERNETB', LineNo, Optionsaccounts::Savings, Documentno, 'Loan Interest Repayment', InterestRepaymentAmount
                , DisbursementAccount, Today, Optionsaccounts::"G/L Account", '', AccountFrom,
                SavingsAccounts."Global Dimension 1 Code", SavingsAccounts."Global Dimension 2 Code",
                Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                LineNo := LineNo + 10000;
                POSTJOURNAL.PostJournal('INTERNET', 'INTERNETB', LineNo, Optionsaccounts::Credit, Documentno, 'Loan Interest Repayment', InterestRepaymentAmount * -1
                , LoanCard."Loan Account", Today, Optionsaccounts::"G/L Account", '', AccountFrom,
                SavingsAccounts."Global Dimension 1 Code", SavingsAccounts."Global Dimension 2 Code", Optiontransactiontypes::"Interest Paid", LoanNo, '', '', 0, '', 0);

            end;
            RepaymentAmount := Amount - InterestRepaymentAmount;
            if RepaymentAmount > 0 then begin
                if LoanOutstanding < RepaymentAmount then RepaymentAmount := LoanOutstanding;

                LineNo := LineNo + 10000;
                // Cr Member Loan Account - Principal Loan Repayment
                POSTJOURNAL.PostJournal('INTERNET', 'INTERNETB', LineNo, Optionsaccounts::Savings, Documentno, 'Loan Principal Repayment', RepaymentAmount
                , DisbursementAccount, Today, Optionsaccounts::"G/L Account", '', AccountFrom,
                SavingsAccounts."Global Dimension 1 Code", SavingsAccounts."Global Dimension 2 Code", Optiontransactiontypes::" ", '', '', '', 0, '', 0);

                LineNo := LineNo + 10000;
                POSTJOURNAL.PostJournal('INTERNET', 'INTERNETB', LineNo, Optionsaccounts::Credit, Documentno, 'Loan Principal Repayment', RepaymentAmount * -1
                , LoanCard."Loan Account", Today, Optionsaccounts::"G/L Account", '', AccountFrom,
                SavingsAccounts."Global Dimension 1 Code", SavingsAccounts."Global Dimension 2 Code", Optiontransactiontypes::Repayment, LoanNo, '', '', 0, '', 0);

            end;
        end;

        // Complete Journal Posting
        POSTJOURNAL.CompletePosting('INTERNET', 'INTERNETB');

        //advice employer
        LoanCard.Reset;
        LoanCard.SetRange(LoanCard."Loan No.", LoanNo);
        if LoanCard.FindFirst then
            LoanCard.Validate(Repayment);


        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", 'INTERNET');
        GenJournalLine.SetRange("Journal Batch Name", 'INTERNETB');
        GenJournalLine.DeleteAll;

        responseText := 'OK, Loan Repaid successfully';
        ReturnList := 'Dear Member, loan repayment of KES ' + Format(Amount) + ' successfull for loan No: ' + LoanNo;
        SendSmsToMember.SendSms(Optionsms::"Loan Posted", SavingsAccounts."Mobile Phone No", ReturnList, '', '', false);
        OnlineTransactions.Reset;
        OnlineTransactions.SetRange(OnlineTransactions."Document No.", NewApplicationNumber);
        if OnlineTransactions.FindFirst then begin
            OnlineTransactions.Posted := true;
            OnlineTransactions."Date Posted" := CurrentDatetime;
            OnlineTransactions.Modify;
        end;
    end;


    procedure ChangeLoanAmortisation(IdNo: Text; MemberNo: Text; LoanNo: Text; Amount: Decimal) responseText: Text
    begin
        responseText := 'ERROR: transaction failed';

        LoanCard.Reset;
        LoanCard.SetRange(LoanCard."Loan No.", LoanNo);
        if LoanCard.Find('-') then begin
            LoanCard.CalcFields(LoanCard."Outstanding Balance", LoanCard."Outstanding Interest");
            if ((LoanCard."Outstanding Balance" + LoanCard."Outstanding Interest") > 0) then begin
                //change amortisation
                if (LoanCard.Repayment > Amount) then
                    responseText := ' ERROR: Loan amortisation change request failed. It has to be higher than your current repayment of ' + Format(LoanCard.Repayment) + '.'
                else begin
                    LoanCard.Repayment := Amount;
                    LoanCard.Modify;
                    responseText := 'OK, loan armotisation changed successfully.';

                    //mark as posted
                    OnlineTransactions.Reset;
                    OnlineTransactions.SetRange(OnlineTransactions."Document No.", NewApplicationNumber);
                    if OnlineTransactions.Find('-') then begin
                        OnlineTransactions.Posted := true;
                        OnlineTransactions."Date Posted" := CurrentDatetime;
                        OnlineTransactions.Modify;
                    end;

                    //send sms
                    //get phone number
                    SendSmsToMember.SendSms(Optionsms::"Loan Posted", SavingsAccounts."Mobile Phone No", responseText, '', '', false);
                end;
            end else
                responseText := 'ERROR: loan does not have any outstanding balance.';
        end else
            responseText := 'ERROR: loan not found';
        exit(responseText);
    end;


    procedure GetAccountBalance(Account: Text[30]) AccountBal: Decimal
    begin
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."No.", Account);
        if SavingsAccounts.Find('-') then begin
            ProductType.Reset;
            ProductType.SetRange(ProductType."Product ID", SavingsAccounts."Product Type");
            if ProductType.Find('-') then begin
                MiniBalance := ProductType."Minimum Balance";
            end;

            SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
            SavingsAccounts.CalcFields(SavingsAccounts."ATM Transactions");
            SavingsAccounts.CalcFields(SavingsAccounts."Uncleared Cheques");
            AccountBal := SavingsAccounts."Balance (LCY)" - (SavingsAccounts."ATM Transactions" + SavingsAccounts."Uncleared Cheques" + MiniBalance);
        end
        else begin
            AccountBal := 0;
        end;
    end;


    procedure SavingsAccountOpening(BosaNo: Text; AccountType: Text; Amount: Decimal; AccountName: Text) AccountCreated: Text
    var
        Suffix: Integer;
        SuffixText: Code[10];
    begin
        ReturnBoolean := false;
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", BosaNo);
        if MemberCard.Find('-') then begin
            //check if member has same type of product account and add a suffix if the product factory allows multiple accounts
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."Member No.", BosaNo);
            SavingsAccounts.SetRange(SavingsAccounts."Product Type", AccountType);
            Suffix := SavingsAccounts.Count;
            if Suffix > 9 then SuffixText := '0' + Format(Suffix) else SuffixText := '00' + Format(Suffix);

            // MESSAGE (FORMAT(Suffix));

            // Monthly Contribution
            SavingsAccounts.Reset;
            SavingsAccounts.SetRange(SavingsAccounts."Member No.", BosaNo);

            if (ProductType.Get(AccountType)) then begin
                ReturnBoolean := ProductType."Allow Multiple Accounts";
            end;
            if (ReturnBoolean = false) then
                SavingsAccounts.SetRange(SavingsAccounts."Product Type", AccountType);

            if (SavingsAccounts.Find('-')) then begin
                AccountCreated := 'You already have account of this type';
            end
            else begin
                //Create a member account
                SavingsAccount.Init;
                Message('Creating account');
                if ProductType.Get(AccountType) then
                    SavingsAccount."No." := ProductType."Account No. Prefix" + MemberCard."No." +/*+'-'+*/SuffixText;
                SavingsAccount."Product Type" := AccountType;
                SavingsAccount.Validate(SavingsAccount."Product Type");
                SavingsAccount."Product Name" := ProductType."Product Description";
                SavingsAccount.Name := UpperCase(AccountName);//UPPERCASE(MemberCard.Name);//
                SavingsAccount."Search Name" := UpperCase(AccountName);//UPPERCASE(MemberCard.Name);//UPPERCASE(Name);
                SavingsAccount.Validate(SavingsAccount."Member No.", MemberCard."No.");
                SavingsAccount.City := MemberCard.City;//City;
                SavingsAccount.County := MemberCard.City;
                SavingsAccount."Phone No." := MemberCard."Phone No.";
                SavingsAccount."Registration Date" := Today;
                SavingsAccount.Status := SavingsAccounts.Status::New;
                SavingsAccount."Date of Birth" := MemberCard."Date of Birth";//"Date of Birth";
                SavingsAccount."ID No." := MemberCard."ID No.";
                SavingsAccount."Mobile Phone No" := MemberCard."Mobile Phone No";
                SavingsAccount."Global Dimension 1 Code" := MemberCard."Global Dimension 1 Code";//'BK' ;
                SavingsAccount."Customer Posting Group" := ProductType."Product Posting Group";//='SAV';
                SavingsAccount."Global Dimension 2 Code" := MemberCard."Global Dimension 2 Code";//MemberCard."Branch Code";//'Nairobi';
                SavingsAccount.Gender := MemberCard.Gender;
                SavingsAccount."Last Date Modified" := Today;
                SavingsAccount."Monthly Contribution" := Amount;
                // SavingsAccounts."Virtual Member":=TRUE;
                SavingsAccount."Created By" := UserId;
                SavingsAccount.Insert(true);

                AccountCreated := 'Savings account created successfully';
                SendSms('Accounts', MemberCard."Mobile Phone No", AccountCreated);
            end;//**
        end else begin
            AccountCreated := 'Member no. not found';

        end;

    end;


    procedure BondsApplication(IdNo: Text; BosaNo: Text; BondType: Option " ","Bid-Bond","Perfomance Bond"; Beneficiary: Text; TenderDetails: Text; Purpose: Text; Branch: Text; ValidFrom: Date; ValidTo: Date; ContractDate: Date; Amount: Decimal): Text
    begin
        ReturnList := 'Bond application failed, Contact the sacco for further help';
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", BosaNo);
        if MemberCard.Find('-') then begin
            BondCard.Init;

            BondSetup.Get;
            BondSetup.TestField("Bond Nos.");

            BondCardPrevious.Reset;
            if BondCardPrevious.FindLast then begin
                ReturnCode := BondCardPrevious."No. Series";

            end;

            // NoSeriesMgt.InitSeries(BondSetup."Bond Nos.", ReturnCode, 0D, BondCard."Bond No.", BondCard."No. Series");

            BondCard."Application Date" := Today;
            BondCard."Bond Type" := BondCard."bond type"::"Bid-Bond";//BondType;
            BondCard.Validate(BondCard."Bond Type");
            BondCard."Member No." := MemberCard."No.";
            BondCard.Validate(BondCard."Member No.");

            BondCard."Tender Details" := TenderDetails;
            BondCard.Purpose := Purpose;
            BondCard."Branch Code" := Branch;
            BondCard."Beneficiary No." := Beneficiary;
            BondCard.Validate(BondCard."Beneficiary No.");
            BondCard."Valid From" := ValidFrom;
            BondCard.Validate(BondCard."Valid From");
            BondCard."Valid To" := ValidTo;
            BondCard."Order/Contract Date" := ContractDate;
            BondCard.Validate(BondCard."Valid To");
            BondCard.Validate(BondCard."Bond Validity Days");
            BondCard.Amount := Amount;
            BondCard.Validate(BondCard.Amount);
            BondCard."Bond Status" := BondCard."bond status"::Open;
            BondCard."Sent Online" := true;
            BondCard.Insert;
            //send email to bond manager

            ReturnList := 'Bond application successful, undergoing approval process';

        end else
            ReturnList := 'Member not found';
        exit(ReturnList);
    end;


    procedure BondsCancellation(idNo: Text; BosaNo: Text; BondNO: Text): Text
    begin
        ReturnList := 'Bond cancellation failed';
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", BosaNo);
        if MemberCard.Find('-') then begin

            BondCard.Reset;
            BondCard.SetRange(BondCard."Member No.", BosaNo);
            BondCard.SetRange(BondCard."Bond No.", BondNO);
            BondCard.SetRange(BondCard."Bond Status", BondCard."bond status"::Open);
            if BondCard.Find('-') then begin

                BondCard."Bond Status" := BondCard."bond status"::Cancelled;
                BondCard.Modify;
                ReturnList := 'Bond cancelled successfully';

            end else
                ReturnList := 'Bond details not found';
        end else
            ReturnList := 'Member not found';

        exit(ReturnList);
    end;


    procedure BondSecurityLines(IdNo: Text; BosaNo: Text; BondNo: Text; Type: Text; SecurityDetails: Text; Remarks: Text; SecurityValue: Decimal; GuaranteeAmount: Decimal): Text
    begin
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", BosaNo);
        if MemberCard.Find('-') then begin
            BondCard.Reset;
            BondCard.SetRange(BondCard."Member No.", BosaNo);
            BondCard.SetRange(BondCard."Bond No.", BondNo);
            BondCard.SetRange(BondCard."Bond Status", BondCard."bond status"::Open);
            if BondCard.Find('-') then begin
                BondSecurity."Bond No." := BondCard."Bond No.";
                BondSecurity."Guarantee Value" := GuaranteeAmount;
                BondSecurity.Remarks := Remarks;
                BondSecurity."Security Details" := SecurityDetails;
                BondSecurity.Type := BondSecurity.Type::"Title Deed";
                BondSecurity.Value := SecurityValue;
                BondSecurity.Insert;
                ReturnList := 'Bond security updated successfully, ';

            end else
                ReturnList := 'Bond details not found';
        end else
            ReturnList := 'Member not found';

        exit(ReturnList);
    end;


    procedure GetSaccoBranches() response: Text
    begin
        SaccoBranches.Reset;
        SaccoBranches.SetRange(SaccoBranches."Dimension Code", 'BRANCH');
        if SaccoBranches.Find('-') then begin
            repeat
                ReturnList := ReturnList + ':::' + SaccoBranches.Code + '$' + SaccoBranches.Name;
            until SaccoBranches.Next = 0;
        end;
        response := ReturnList;
    end;


    procedure GetBondBeneficiaries() response: Text
    begin
        BondCompany.Reset;

        if BondCompany.Find('-') then begin
            repeat
                ReturnList := ReturnList + ':::' + BondCompany."Company Code" + '$' + BondCompany.Name;
            until ChequeSetUp.Next = 0;
        end;
        response := ReturnList;
    end;


    procedure GetBondTypes() response: Text
    begin
        ReturnList := ReturnList + ':::Bid-Bond$Bid-Bond';
        ReturnList := ReturnList + ':::Perfomance Bond$Perfomance Bond';
        response := ReturnList;
    end;


    procedure GetDividends(MemberNo: Text): Decimal
    begin
        ReturnDecimal := 0;
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);
        if MemberCard.Find('-') then begin
            DividendsProgressionCard.Reset;
            DividendsProgressionCard.SetRange(DividendsProgressionCard."Member No", MemberNo);

            if DividendsProgressionCard.Find('-') then begin
                repeat
                    ReturnDecimal := ReturnDecimal + DividendsProgressionCard."Gross Dividends";
                until DividendsProgressionCard.Next = 0;
            end;

        end;
        exit(ReturnDecimal);
    end;


    procedure GetNetDividends(MemberNo: Text): Decimal
    begin
        ReturnDecimal := 0;
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);
        if MemberCard.Find('-') then begin
            DividendsProgressionCard.Reset;
            DividendsProgressionCard.SetRange(DividendsProgressionCard."Member No", MemberNo);

            if DividendsProgressionCard.Find('-') then begin
                repeat
                    ReturnDecimal := ReturnDecimal + DividendsProgressionCard."Net Dividends";
                until DividendsProgressionCard.Next = 0;
            end;

        end;
        exit(ReturnDecimal);
    end;


    procedure GetWTaxDividends(MemberNo: Text): Decimal
    begin
        ReturnDecimal := 0;
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);
        if MemberCard.Find('-') then begin
            DividendsProgressionCard.Reset;
            DividendsProgressionCard.SetRange(DividendsProgressionCard."Member No", MemberNo);

            if DividendsProgressionCard.Find('-') then begin
                repeat
                    ReturnDecimal := ReturnDecimal + DividendsProgressionCard."Witholding Tax";
                until DividendsProgressionCard.Next = 0;
            end;

        end;
        exit(ReturnDecimal);
    end;


    procedure GetCapitalizedDividends(MemberNo: Text): Decimal
    begin
        ReturnDecimal := 0;
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);
        if MemberCard.Find('-') then begin
            DividendsProgressionCard.Reset;
            DividendsProgressionCard.SetRange(DividendsProgressionCard."Member No", MemberNo);

            if DividendsProgressionCard.Find('-') then begin
                repeat
                // ReturnDecimal :=ReturnDecimal+DividendsProgressionCard.;
                until DividendsProgressionCard.Next = 0;
            end;

        end;
        exit(ReturnDecimal);
    end;


    procedure GetAllocatedDividends(MemberNo: Text): Decimal
    begin
        ReturnDecimal := 0;
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);
        if MemberCard.Find('-') then begin
            DividendInstructionsCard.Reset;
            DividendInstructionsCard.SetRange(DividendInstructionsCard."Member No.", MemberNo);

            if DividendInstructionsCard.Find('-') then begin
                repeat
                    ReturnDecimal := ReturnDecimal + DividendInstructionsCard.Amount;
                until DividendInstructionsCard.Next = 0;
            end;

        end;
        exit(ReturnDecimal);
    end;


    procedure GetRebatesAdvance(MemberNo: Text): Decimal
    begin
        ReturnDecimal := 0;

        exit(ReturnDecimal);
    end;


    procedure GetPayrollPeriods() response: Text
    begin
        PRPayrollPeriods.Reset;

        if PRPayrollPeriods.Find('-') then begin
            repeat
                ReturnList := ReturnList + ':::' + Format(PRPayrollPeriods."Date Opened") + '$' + PRPayrollPeriods."Period Name";
            until PRPayrollPeriods.Next = 0;
        end;
        response := ReturnList;
    end;


    procedure GetLoanLastPaymentDate(LoanNo: Code[20]): Date
    begin
        ReturnDecimal := 0;
        CreditLedgerEntry.Reset;
        CreditLedgerEntry.SetRange("Loan No", LoanNo);
        CreditLedgerEntry.SetCurrentkey("Posting Date");
        if CreditLedgerEntry.FindLast then begin
            ReturnDate := CreditLedgerEntry."Posting Date";
            Message(CreditLedgerEntry."Document No.");
        end;

        exit(ReturnDate);
    end;


    procedure MemberUpdate(IdNo: Text; BosaNo: Text; Gender: Text; maritalStatus: Text; phoneNo: Text; PersonalEmail: Text; Currentddress: Text; jobTitle: Text; Reason: Text; DOB: Date): Text
    var
        mStatus: Integer;
        Gen: Integer;
    begin
        ReturnList := 'ERROR: Member details change request failed. ';
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", BosaNo);
        if not MemberCard.FindFirst then exit(ReturnList);

        MemberCardChanges.Reset;
        MemberCardChanges.SetRange("Account Type", MemberCardChanges."account type"::Member);
        MemberCardChanges.SetRange(MemberCardChanges."Account No.", BosaNo);
        MemberCardChanges.SetRange(Status, MemberCardChanges.Status::Open);
        if MemberCardChanges.FindFirst then exit('ERROR: You already have an existing profile change request. Kindly contact customer care for more information.');

        ReturnList := 'ERROR: Member details change request record dont  exists. ';
        MemberChanges.Init;
        MemberChanges."Account Type" := MemberChanges."account type"::Member;
        MemberChanges."Application Date" := Today;
        MemberChanges."Account No." := BosaNo;
        MemberChanges."Created By" := UserId;
        MemberChanges.Insert(true);

        MemberChanges.Validate("Account No.");
        Evaluate(mStatus, maritalStatus);

        MemberChanges.Validate(MemberChanges."Marital Status", mStatus);
        MemberChanges."Phone No." := phoneNo;
        MemberChanges."E-Mail" := PersonalEmail;
        MemberChanges."Current Address" := Currentddress;
        MemberChanges.Validate("Date of Birth", DOB);
        MemberChanges."Payroll/Staff No." := jobTitle;
        MemberChanges.Status := MemberChanges.Status::Open;
        MemberChanges."Status Change Reason" := 'PORTAL:' + Reason;
        MemberChanges.Modify;

        //SendApproval(MemberChanges);
        ReturnList := 'Dear member, your change request has been received and will be effected. Thank You.';

        SendSmsToMember.SendSms(Optionsms::Internetbanking, MemberCard."Phone No.", ReturnList, '', '', false);

        exit(ReturnList);
    end;


    procedure NextOfKinUpdate(BosaNo: Text): Text
    begin
        ReturnList := 'ERROR: Member details change request failed. ';
        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", BosaNo);
        if not MemberCard.FindFirst then exit;

        MemberCardChanges.Reset;
        MemberCardChanges.SetRange("Account Type", MemberCardChanges."account type"::Member);
        MemberCardChanges.SetRange(MemberCardChanges."Account No.", BosaNo);
        MemberCardChanges.SetRange(Status, MemberCardChanges.Status::Open);
        if MemberCardChanges.FindFirst then exit('ERROR: You already have an existing profile change request. Kindly contact customer care for more information.');

        MemberChanges.Init;
        MemberChanges."Account Type" := MemberChanges."account type"::Member;
        MemberChanges."Application Date" := Today;
        MemberChanges."Account No." := BosaNo;
        MemberChanges."Created By" := UserId;
        MemberChanges.Status := MemberChanges.Status::Open;
        MemberChanges.Insert(true);

        MemberChanges.Validate("Account No.");
        MemberChanges."Status Change Reason" := 'PORTAL: Next of Kin Update';
        MemberChanges.Modify;

        ReturnList := 'OK, ' + MemberChanges."No.";

        exit(ReturnList);
    end;


    procedure MemberChangeAddNOK(MemberNo: Text; MemberChangeNo: Text; Names: Text; Relationship: Text; IdNo: Text; Phone: Text; Email: Text; Allocation: Decimal; Address: Text): Boolean
    var
        EntryNo: Integer;
    begin
        MemberChanges.Reset;
        MemberChanges.SetRange("No.", MemberChangeNo);
        MemberChanges.SetRange(Status, MemberChanges.Status::Open);
        if not MemberChanges.FindFirst then exit;

        EntryNo := 1;
        NextofKINApplication.Reset;
        NextofKINApplication.SetRange("Account No", MemberChangeNo);
        if NextofKINApplication.FindLast then EntryNo := NextofKINApplication."Entry No." + 1;

        NextofKINApplication.Init;
        NextofKINApplication."Entry No." := EntryNo;
        NextofKINApplication."Account No" := MemberChangeNo;
        NextofKINApplication.Name := Names;
        NextofKINApplication.Relationship := Relationship;
        NextofKINApplication."ID No." := IdNo;
        NextofKINApplication.Telephone := Phone;
        NextofKINApplication.Email := Email;
        NextofKINApplication."%Allocation" := Allocation;
        NextofKINApplication.Address := Address;
        NextofKINApplication.Beneficiary := true;
        NextofKINApplication.Type := NextofKINApplication.Type::"Benevolent Beneficiary";
        ReturnBoolean := NextofKINApplication.Insert;

        exit(ReturnBoolean);
    end;


    procedure UploadDocumentNOKUpdate(MemberChangeNo: Text; Path: Text; Decription: Text)
    begin
        if not MemberChanges.Get(MemberChangeNo) then exit;

        MemberChanges.AddLink(Path, Decription);
    end;

    local procedure TradeShares()
    begin
    end;

    local procedure GetPrimeAccount(MemberNo: Text) PrimeAccount: Code[50]
    begin
        SavingsAccount.Reset;
        SavingsAccount.SetRange(SavingsAccount."Member No.", MemberNo);
        SavingsAccount.SetRange(SavingsAccount."Product Type", '801');
        if SavingsAccount.Find('+') then begin
            PrimeAccount := SavingsAccount."No.";

        end;
    end;


    procedure AddMeetingAttendee(Meeting: Text; DelNo: Text): Text
    begin
        ReturnList := 'Error adding attendee to the meeting';
        DelegatesMeetingAttendees.Init;

        DelegatesMeetingAttendees."Delegate No." := DelNo;
        DelegatesMeetingAttendees."Header No" := Meeting;

        DelegatesMeetingAttendees.Insert(true);
        ReturnList := 'Attendee added successfully';
        exit(ReturnList);
    end;


    procedure CreateMeeting(MemberNo: Code[50]; ElectoralZone: Text; DateOfMeeting: DateTime; Venue: Text; MonthlyMeeting: Text; StartTime: DateTime; EndTime: DateTime): Text
    var
        Stime: Time;
        Etime: Time;
    begin
        ReturnList := 'Error Creating Meeting';

        DelegatesMinutesHeader.Init;
        DelegatesMinutesHeader.Code := '';
        //EVALUATE(Etime,EndTime);
        DelegatesMinutesHeader.Venue := Venue;
        //DelegatesMinutesHeader."Start Time" :=StartTime;
        //DelegatesMinutesHeader."End Time" :=EndTime;
        //DelegatesMinutesHeader."Created By" :=MemberNo;
        //DelegatesMinutesHeader."Created Date" :=CURRENTDATETIME;

        DelegatesMinutesHeader."Meeting Date Time" := DateOfMeeting;
        DelegatesMinutesHeader."Electoral Region" := ElectoralZone;
        DelegatesMinutesHeader.Insert(true);

        ReturnList := 'Meeting created successfully';
        exit(ReturnList);
    end;


    procedure SubmitMeeting(MemberNo: Text; Meeting: Text): Text
    begin
        ReturnList := 'ERROR, Meeting minutes submission failed';
        DelegatesMinutesHeader.Reset;
        DelegatesMinutesHeader.SetRange(DelegatesMinutesHeader.Code, Meeting);
        DelegatesMinutesHeader.SetRange(DelegatesMinutesHeader.Posted, false);
        if DelegatesMinutesHeader.Find() then begin
            DelegatesMinutesHeader.Posted := true;
            //DelegatesMinutesHeader."Posted By" :=MemberNo;
            //DelegatesMinutesHeader."Posted Date" :=CURRENTDATETIME;
            DelegatesMinutesHeader.Modify(true);
            ReturnList := 'Meeting minutes submitted successfully';
        end else
            ReturnList := 'Meeting minutes had earlier being submitted';

        exit(ReturnList);
    end;


    procedure RetireDelegate(ElectoralZone: Text; MemberNo: Text; Reason: Text; Details: Text): Text
    begin
    end;


    procedure CreateMeetingMinute(MeetingNo: Text; Title: Text; Subject: Text; Details: Text): Text
    begin
        ReturnList := 'ERROR, minute creation failed';
        DelegatesMeetingMinutes.Init;
        DelegatesMeetingMinutes.Category := Title;
        DelegatesMeetingMinutes.Details := Details;
        DelegatesMeetingMinutes."Meeting No." := MeetingNo;
        DelegatesMeetingMinutes.Subject := Subject;
        DelegatesMeetingMinutes.Insert(true);

        ReturnList := 'Minute created successfully';
        exit(ReturnList);
    end;


    procedure GetElectoralZone(BosaNo: Text): Text
    begin
        ReturnList := '0';
        DelegateMembers.Reset;
        DelegateMembers.SetRange(DelegateMembers."Delegate MNO.", BosaNo);
        //DelegateMembers.SETRANGE(DelegateMembers.Status,DelegateMembers.Status::Approved);
        DelegateMembers.SetRange(DelegateMembers.Retired, false);

        if DelegateMembers.Find('+') then begin
            ReturnList := DelegateMembers.Code;
        end;

        exit(ReturnList);
    end;


    procedure GetDelegateStaff(BosaNo: Text): Text
    begin
        ReturnList := '0';
        /*
        IF MemberCard.GET(BosaNo) THEN BEGIN
        
              DelegateMembers .RESET;
              DelegateMembers.SETRANGE(DelegateMembers."Delegate MNO.", BosaNo);
              DelegateMembers.SETRANGE(DelegateMembers.Status,DelegateMembers.Status::Approved);
              DelegateMembers.SETRANGE(DelegateMembers.Retired,FALSE);
        
              IF DelegateMembers.FIND('+') THEN BEGIN
                ReturnList :=DelegateMembers.Code;
              END;
        
        END;*/
        exit(ReturnList);

    end;


    procedure GetMaritalStatus(BosaNo: Text): Text
    begin
        ReturnList := '0';

        if MemberCard.Get(BosaNo) then begin
            ReturnInt := MemberCard."Marital Status";
            ReturnList := Format(ReturnInt);
        end;
        exit(ReturnList);
    end;


    procedure DelegateMeetingPaymentRequest(BosaNo: Text; ElectoralZone: Text; MeetingNo: Text; PayPerson: Text): Text
    begin
        ReturnList := 'ERROR, payment request has failed';

        if DelegatesMinutesHeader.Get(MeetingNo) then begin
            DelegatesPayment.Init;
            DelegatesPayment."Electoral Zone" := ElectoralZone;
            DelegatesPayment."Minute No." := MeetingNo;
            DelegatesPayment."Transaction Type" := 'DELEGATES PAYMENT';
            //DelegatesPayment."Payment Description" :=DelegatesMinutesHeader.
            DelegatesPayment.Insert(true);

            DelegatePaymentLine.Init;
            DelegatePaymentLine.Code := DelegatesPayment.Code;
            DelegatePaymentLine."Delegate MNO." := PayPerson;

            DelegatePaymentLine.Insert(true);


        end else
            ReturnList := 'ERROR, meeting no not found';

        exit(ReturnList);
    end;


    procedure getMinimumBalance("code": Code[50]) MinBalance: Decimal
    begin
        MinBalance := 0;
        ProductType.Reset;
        ProductType.SetRange("Product ID", code);
        if ProductType.Find('') then begin
            MinBalance := ProductType."Minimum Balance";
        end;


        exit(MinBalance);
    end;


    procedure EmployeeEndReturnDays(EmployeeNo: Text; leaveType: Text; NoOfDays: Decimal; startDateText: Text): Text
    var
        Enddate: Date;
        Returndate: Date;
        start: Date;
        startDate: Date;
    begin
        Evaluate(startDate, startDateText);

        ReturnList := ':::';
        ObjHREmployees.Reset;
        ObjHREmployees.SetRange(ObjHREmployees."No.", EmployeeNo);
        if ObjHREmployees.Find('-') then begin
            // Returndate :=DT2DATE(StartDate);
            Returndate := DetermineLeaveReturnDate(startDate, NoOfDays, leaveType);
            Enddate := DeterminethisLeaveEndDate(Returndate);



            ReturnList := ':::' + Format(Enddate) + ':::' + Format(Returndate);
        end;
        exit(ReturnList);
    end;


    procedure EmployeeAvailableDays(EmployeeNo: Text; leaveType: Text): Integer
    var
        dAlloc: Decimal;
        dLeft: Decimal;
        dTaken: Decimal;
    begin
        // ObjHREmployees.RESET;
        // ObjHREmployees.SETRANGE(ObjHREmployees."No.", EmployeeNo);
        // IF ObjHREmployees.FIND('-') THEN BEGIN
        //  ReturnDecimal:=ObjHREmployees."Leave Balance";
        // END;
        // EXIT(ReturnDecimal);

        dAlloc := 0;
        dTaken := 0;
        dLeft := 0;
        ObjHREmployees.Reset;
        if ObjHREmployees.Get(EmployeeNo) then begin

            HRLeaveCalendar.Reset;
            HRLeaveCalendar.SetRange(HRLeaveCalendar."Current Leave Calendar", true);
            if not HRLeaveCalendar.Find('-') then Error('Leave Calendar not setup');

            //Filter by Leave Period from HR Setup
            HRLeaveLedgerEntries.Reset;
            HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Staff No.", EmployeeNo);
            HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Leave Entry Type", HRLeaveLedgerEntries."leave entry type"::Positive);
            HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Leave Calendar Code", HRLeaveCalendar."Calendar Code");
            HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Leave Type", leaveType);
            if HRLeaveLedgerEntries.Find('-') then begin
                dAlloc := 0;
                repeat
                    dAlloc := HRLeaveLedgerEntries."No. of days" + dAlloc;
                until HRLeaveLedgerEntries.Next = 0;
            end;


            HRLeaveLedgerEntries.Reset;
            HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Staff No.", EmployeeNo);
            HRLeaveLedgerEntries.SetFilter("Leave Entry Type", '%1|%2', HRLeaveLedgerEntries."leave entry type"::Negative, HRLeaveLedgerEntries."leave entry type"::Reimbursement);
            HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Leave Calendar Code", HRLeaveCalendar."Calendar Code");
            HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Leave Type", leaveType);
            if HRLeaveLedgerEntries.Find('-') then begin
                dTaken := 0;
                repeat
                    dTaken := HRLeaveLedgerEntries."No. of days" + dTaken;
                until HRLeaveLedgerEntries.Next = 0;
            end;

            //Leave Balance
            dLeft := dAlloc + dTaken;
        end;
        exit(dLeft);
    end;


    procedure EmployeeApplyLeave(EmployeeNo: Text; leaveType: Text; reliever: Text; NoOfDays: Integer; startDate: Date): Text
    begin
        ReturnList := 'ERROR, Leave Application Failed';
        ObjHREmployees.Reset;
        ObjHREmployees.SetRange(ObjHREmployees."No.", EmployeeNo);
        if ObjHREmployees.Find('-') then begin
            ReturnList := ':::enddate:::returndate';

            Evaluate(ReturnDate, Format(startDate));
            ObjLeaveApplication.Init;
            ObjLeaveApplication."Applicant Staff No." := EmployeeNo;
            ObjLeaveApplication."Leave Type" := leaveType;
            ObjLeaveApplication."Days Applied" := NoOfDays;
            ObjLeaveApplication."Start Date" := ReturnDate;//TODAY+1;//
            ObjLeaveApplication."Applicant Supervisor" := GetApplicantSupervisorID(ObjHREmployees."User ID");
            ObjLeaveApplication."Supervisor Email" := GetApplicantSupervisorEmail(ObjHREmployees."User ID");

            ObjLeaveApplication.Reliever := reliever;
            ObjLeaveApplication.Validate(Reliever);
            ObjLeaveApplication.Names := ObjHREmployees."First Name" + ' ' + ObjHREmployees."Middle Name" + ' ' + ObjHREmployees."Last Name";
            ObjLeaveApplication.Gender := ObjHREmployees.Gender;
            ObjLeaveApplication."Application Date" := Today;
            ObjLeaveApplication."Applicant User ID" := ObjHREmployees."User ID";
            ObjLeaveApplication."Job Tittle" := ObjHREmployees."Job Title";
            ObjHREmployees.CalcFields(ObjHREmployees.Picture);
            // ObjLeaveApplication."Global Dimension 1 Code" := ObjHREmployees."Global Dimension 1 Code";
            // ObjLeaveApplication."Global Dimension 2 Code" := ObjHREmployees."Global Dimension 2 Code";
            ObjLeaveApplication."Cell Phone Number" := ObjHREmployees."Cellular Phone Number";
            ObjLeaveApplication."E-mail Address" := ObjHREmployees."E-Mail";
            ObjLeaveApplication."Alternative CellPhone No." := ObjHREmployees."Home Phone Number";
            ObjLeaveApplication.Address := ObjHREmployees."Postal Address";
            ObjLeaveApplication.Picture := ObjHREmployees.Picture;
            ObjLeaveApplication.Insert(true);

            ObjLeaveApplication.Validate("Leave Type");
            ObjLeaveApplication.Validate("Days Applied", NoOfDays);
            ObjLeaveApplication.Validate("Start Date");
            ObjLeaveApplication.Validate(Reliever);
            ObjLeaveApplication.Modify;

            SendApproval(ObjLeaveApplication);

            ReturnList := 'Ok, Leave Application has been sent successfully';
        end;
        exit(ReturnList);
    end;

    local procedure DetermineLeaveReturnDate(StartDate: Date; DaysApplied: Integer; LeaveType: Text) fReturnDate: Date
    begin
        varDaysApplied := DaysApplied;
        fReturnDate := StartDate;
        repeat
            if DetermineIfIncludesNonWorking(LeaveType) = false then begin
                fReturnDate := CalcDate('1D', fReturnDate);
                if DetermineIfIsNonWorking(fReturnDate) then
                    varDaysApplied := varDaysApplied + 1
                else
                    varDaysApplied := varDaysApplied;
                varDaysApplied := varDaysApplied - 1
            end
            else begin
                fReturnDate := CalcDate('1D', fReturnDate);
                varDaysApplied := varDaysApplied - 1;
            end;
        until varDaysApplied = 0;
        exit(fReturnDate);
    end;

    local procedure DeterminethisLeaveEndDate(fDate: Date) fEndDate: Date
    begin
        ReturnDateLoop := true;
        fEndDate := fDate;
        if fEndDate <> 0D then begin
            fEndDate := CalcDate('-1D', fEndDate);
            while (ReturnDateLoop) do begin
                if DetermineIfIsNonWorking(fEndDate) then
                    fEndDate := CalcDate('-1D', fEndDate)
                else
                    ReturnDateLoop := false;
            end
        end;
        exit(fEndDate);
    end;

    local procedure GetApplicantSupervisorEmail(EmpUserID: Text) SupervisorID: Text
    begin
        SupervisorID := '';

        UserSetup.Reset;
        if UserSetup.Get(EmpUserID) then begin
            //Get supervisor e-mail
            UserSetup2.Reset;
            if UserSetup2.Get(UserSetup."Approver ID") then begin
                SupervisorID := UserSetup2."E-Mail";//UserSetup."Approver ID";
            end;

        end;
        exit(SupervisorID);
    end;

    local procedure GetApplicantSupervisorID(EmpUserID: Code[50]) SupervisorID: Text
    begin
        SupervisorID := '';

        UserSetup.Reset;
        if UserSetup.Get(EmpUserID) then begin
            SupervisorID := UserSetup."Approver ID";
        end;
        exit(SupervisorID);
    end;

    local procedure DetermineIfIncludesNonWorking(fLeaveCode: Code[10]): Boolean
    begin
        if HRLeaveTypes.Get(fLeaveCode) then begin
            if HRLeaveTypes."Inclusive of Non Working Days" = true then
                exit(true);
        end;
    end;

    local procedure DetermineIfIsNonWorking(bcDate: Date) Isnonworking: Boolean
    begin
        HRLeavePeriods.Reset;
        HRLeavePeriods.SetRange(Closed, false);
        if HRLeavePeriods.Find('-') then begin
            HRLeaveCalendarLines.Reset;
            HRLeaveCalendarLines.SetRange(HRLeaveCalendarLines.Date, bcDate);
            HRLeaveCalendarLines.SetRange(Code, HRLeavePeriods."Period Code");
            if HRLeaveCalendarLines.Find('-') then begin
                if HRLeaveCalendarLines."Non Working" = true then
                    exit(true)
                else
                    exit(false);
            end;
        end


        /*HRSetup.FIND('-');
        HRSetup.TESTFIELD(HRSetup."Base Calendar");
        BaseCalendarChange.SETFILTER(BaseCalendarChange."Base Calendar Code",HRSetup."Base Calendar");
        //BaseCalendarChange.SETRANGE(BaseCalendarChange.Date,bcDate);
        
        IF BaseCalendarChange.FIND('-') THEN BEGIN
        IF BaseCalendarChange.Nonworking = TRUE THEN
        ERROR('Start date can only be a Working Day Date');
        EXIT(TRUE);
        END;*/

    end;


    procedure GetNoOfLoansGuaranteed(MemberNo: Code[20]) NoOfLoans: Integer
    begin
        NoOfLoans := 0;

        LoanGuarantors.Reset;
        LoanGuarantors.SetRange("Member No", MemberNo);
        if not LoanGuarantors.FindFirst then exit;

        repeat
            LoanGuarantors.CalcFields("Outstanding Balance");
            if LoanGuarantors."Outstanding Balance" > 0 then NoOfLoans += 1;
        until LoanGuarantors.Next = 0;

        exit(NoOfLoans);
    end;


    procedure GenerateOnlineLoanForm(IdNo: Text[100]; MemberNo: Text[100]; LoanNo: Integer): Text[100]
    begin
        filename := FILEFOLDER + IdNo;
        filename += '.pdf';
        // if Exists(filename) then
        //     Erase(filename);

        MemberCard.Reset;
        MemberCard.SetRange(MemberCard."No.", MemberNo);
        if MemberCard.FindFirst then begin
            OnlineLoansCard.Reset;
            OnlineLoansCard.SetRange("Application No", LoanNo);
            if OnlineLoansCard.FindFirst then begin
                OnlineGuarantors.Reset;
                OnlineGuarantors.SetRange("Loan Application No", LoanNo);

                OnlineLoanReport.SetTableview(OnlineLoansCard);
                if OnlineGuarantors.FindFirst then
                    OnlineLoanReport.SetTableview(OnlineGuarantors);
                // OnlineLoanReport.SaveAsPdf(filename);
            end;
        end;
        exit(filename);
    end;


    procedure UpdateLastLogin(MemberNo: Text; IdNo: Text)
    begin
        OnlineUsers.Reset;
        OnlineUsers.SetRange("BOSA No", MemberNo);
        OnlineUsers.SetRange("ID Number", IdNo);
        if not OnlineUsers.FindFirst then exit;

        OnlineUsers."Last Login" := CurrentDatetime;
        OnlineUsers.Modify;
    end;


    procedure GetLoanQualificationOnSalary(MemberNo: Text; LoanType: Text; BasicSalary: Decimal; Allowances: Decimal; Deductions: Decimal; LoanAmount: Decimal; RepaymentPeriod: Integer): Decimal
    var
        Cust: Record Customer;
        NetSalary: Decimal;
        NetOnSalary: Decimal;
        Deposits: Decimal;
        NetOnDeposits: Decimal;
        OutstandingBalDeposits: Decimal;
        RelatedBal: Decimal;
        TotalLoan: Decimal;
        QualifyingAmount: Decimal;
        SelfGuaranteedBal: Decimal;
        LoansTopup: Record 52185742;
        MultP: Integer;
        Deposit_Multiplier: Decimal;
    begin
        if not MemberCard.Get(MemberNo) then exit;

        if not ProductType.Get(LoanType) then exit;

        //Qualification on deposits
        Deposits := 0;
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."Member No.", MemberCard."No.");
        SavingsAccounts.SetRange(SavingsAccounts."Product Category", SavingsAccounts."product category"::"Deposit Contribution");
        if SavingsAccounts.Find('-') then begin
            SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
            Deposits := SavingsAccounts."Balance (LCY)";//+Loans."Loans - Deposit Purchase";
        end;

        LoanCard.Reset;
        LoanCard.SetRange(LoanCard."Member No.", MemberCard."No.");
        LoanCard.SetRange(LoanCard.Posted, true);
        LoanCard.SetFilter("Outstanding Balance", '>0');
        LoanCard.SetRange("Self Guarantee", true);
        if LoanCard.Find('-') then begin
            repeat
                LoanCard.CalcFields("Outstanding Balance");
                SelfGuaranteedBal := SelfGuaranteedBal + LoanCard."Outstanding Balance";
            until LoanCard.Next = 0;
        end;

        //Less balances from related loans
        RelatedProduct.Reset;
        RelatedProduct.SetRange("Product Code", ProductType."Product ID");
        if RelatedProduct.Find('-') then begin
            repeat
                LoanCard.CalcFields("Total Loan Balance");
                LoanCard.Reset;
                LoanCard.SetRange(LoanCard."Member No.", MemberNo);
                LoanCard.SetRange(LoanCard.Posted, true);
                LoanCard.SetRange(LoanCard."Loan Product Type", RelatedProduct."Related Product Code");
                LoanCard.SetFilter("Total Loan Balance", '>0');
                //Loan.SETFILTER("Outstanding Balance",'>0');
                if LoanCard.Find('-') then begin
                    repeat
                        if ProductType.Get(LoanCard."Loan Product Type") then
                            if ProductType."Ordinary Deposits Multiplier" >= 4 then
                                MultP := 4;
                        LoanCard.CalcFields("Outstanding Balance", "Outstanding Interest");
                        RelatedBal := RelatedBal + LoanCard."Outstanding Balance" + LoanCard."Outstanding Interest";
                    until LoanCard.Next = 0;
                end;
            until RelatedProduct.Next = 0;

            NetOnDeposits := (Deposits * ProductType."Ordinary Deposits Multiplier") - RelatedBal;
        end;


        //NetOnDeposits:=NetOnDeposits + SelfGuaranteedBal;


        //Get Qualification On Salary
        NetSalary := (BasicSalary + Allowances - Deductions);

        //Get customer/employer
        if Cust.Get(MemberCard."Employer Code") then begin
            if Cust."Loan Qualification" = Cust."loan qualification"::"Basic Pay" then begin
                NetOnSalary := (NetSalary - BasicSalary * 1 / 3);
            end else
                if Cust."Loan Qualification" = Cust."loan qualification"::"Gross Pay" then begin
                    NetOnSalary := (NetSalary - ((BasicSalary + Allowances) * 1 / 3));
                end else
                    if Cust."Loan Qualification" = Cust."loan qualification"::"Standing Order" then begin
                        NetOnSalary := NetSalary;//NetOnDeposits;
                    end else
                        Error('Employer not found');
        end else begin
            NetOnSalary := (NetSalary - BasicSalary * 1 / 3);
        end;

        if ProductType."Repay Mode" = ProductType."repay mode"::"Internal STO" then
            NetOnSalary := NetSalary;
        // TotalLoan:=NetOnSalary/(Loans.Interest/12/100) / (1 - POWER((1 + (Loans.Interest/12/100)),- Loans.Installments));

        TotalLoan := NetOnSalary * (1 - Power((1 + (ProductType."Interest Rate (Min.)" / 12 / 100)), -RepaymentPeriod)) / (ProductType."Interest Rate (Min.)" / 12 / 100);
        NetOnSalary := TotalLoan;

        //Get Recommended Amount
        if NetOnDeposits >= NetOnSalary then begin
            if LoanAmount > NetOnSalary then begin
                QualifyingAmount := NetOnSalary;
            end else begin
                QualifyingAmount := LoanAmount;
            end;
        end else begin
            if LoanAmount > NetOnDeposits then begin
                QualifyingAmount := NetOnDeposits;
            end else begin
                QualifyingAmount := LoanAmount;
            end;
        end;

        QualifyingAmount := ROUND(QualifyingAmount, 1000, '<');
        exit(QualifyingAmount);
    end;
}

