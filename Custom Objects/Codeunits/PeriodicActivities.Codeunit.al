#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52185470 "Periodic Activities"
{

    trigger OnRun()
    var
        DailyLoansInterestBuffer: Record 52185858;
    begin
        GenerateDailyInterest(DailyLoansInterestBuffer);
    end;

    var
        Temp: Record 52185782;
        Jtemplate: Code[20];
        JBatch: Code[20];
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills;
        JournalPosting: Codeunit "Journal Posting";
        AccNo: Code[20];
        BalAccNo: Code[20];
        Amt: Decimal;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        iEntryNo: Integer;
        Genrating: label 'Validating advice';
        intProgressTotal: Integer;
        SendSMS: Codeunit SendSms;
        LoanNo: Code[10];
        LoanRecoveryHeader2: Record 52185829;
        SavAmount: Decimal;
        AccountNo: Code[50];
        UserSetup: Record "User Setup";
        Members: Record 52185700;
        LoanRecoveryHeaderRecovered: Record 52185829;
        TotalLoan: Decimal;
        JournlPosted: Codeunit "Journal Post Successful";
        RegistrationProcess: Codeunit "Registration Process";


    procedure CreateItDuePeriods(IntPeriod: Record 52185861)
    var
        AccountingPeriod: Record 52185861;
        InvtSetup: Record "Inventory Setup";
        NoOfPeriods: Integer;
        PeriodLength: DateFormula;
        FiscalYearStartDate: Date;
        FiscalYearStartDate2: Date;
        FirstPeriodStartDate: Date;
        LastPeriodStartDate: Date;
        FirstPeriodLocked: Boolean;
        i: Integer;
        Text000: label 'The new Interest period begins before an existing interest period, so the new year will be closed automatically.\\';
        Text001: label 'Do you want to create and close the interest period?';
        Text002: label 'Once you create the new interest period you cannot change its starting date.\\';
        Text003: label 'Do you want to create the interest period?';
        Text004: label 'It is only possible to create new interest period before or after the existing ones.';
    begin
        with IntPeriod do begin
            AccountingPeriod."Interest Due Date" := FiscalYearStartDate;
            AccountingPeriod.TestField("Interest Due Date");

            if AccountingPeriod.Find('-') then begin
                FirstPeriodStartDate := AccountingPeriod."Interest Due Date";
                FirstPeriodLocked := AccountingPeriod."Date Locked";
                if (FiscalYearStartDate < FirstPeriodStartDate) and FirstPeriodLocked then
                    if not
                       Confirm(
                         Text000 +
                         Text001)
                    then
                        exit;
                if AccountingPeriod.Find('+') then
                    LastPeriodStartDate := AccountingPeriod."Interest Due Date";
            end else
                if not
                   Confirm(
                     Text002 +
                     Text003)
                then
                    exit;

            FiscalYearStartDate2 := FiscalYearStartDate;

            for i := 1 to NoOfPeriods + 1 do begin
                if (FiscalYearStartDate <= FirstPeriodStartDate) and (i = NoOfPeriods + 1) then
                    exit;

                if (FirstPeriodStartDate <> 0D) then
                    if (FiscalYearStartDate >= FirstPeriodStartDate) and (FiscalYearStartDate < LastPeriodStartDate) then
                        Error(Text004);

                AccountingPeriod.Init;
                AccountingPeriod."Interest Due Date" := FiscalYearStartDate;
                AccountingPeriod."Interest Calcuation Date" := FiscalYearStartDate;
                AccountingPeriod.Validate("Interest Due Date");
                if (i = 1) or (i = NoOfPeriods + 1) then begin
                    AccountingPeriod."New Fiscal Year" := true;
                    InvtSetup.Get;
                    AccountingPeriod."Average Cost Calc. Type" := InvtSetup."Average Cost Calc. Type";
                    AccountingPeriod."Average Cost Period" := InvtSetup."Average Cost Period";
                end;
                if (FirstPeriodStartDate = 0D) and (i = 1) then
                    AccountingPeriod."Date Locked" := true;
                if (AccountingPeriod."Interest Due Date" < FirstPeriodStartDate) and FirstPeriodLocked then begin
                    AccountingPeriod.Closed := true;
                end;
                if not AccountingPeriod.Find('=') then
                    AccountingPeriod.Insert;
                FiscalYearStartDate := CalcDate(PeriodLength, FiscalYearStartDate);

            end;
            AccountingPeriod.Get(FiscalYearStartDate2);
            // AccountingPeriod.UpdateAvgItems(0);
        end;
    end;


    procedure PostEntries(InterestBufferBillAndAccrue: Record 52185860)
    var
        PeriodicActivities: Codeunit "Periodic Activities";
        members: Record 52185700;
        GenBatches: Record "Gen. Journal Batch";
        PDate: Date;
        LoanType: Record 52185690;
        PostDate: Date;
        LineNo: Integer;
        DocNo: Code[20];
        GenJournalLine: Record "Gen. Journal Line";
        //GLPosting: Codeunit "Gen. Jnl.-Post Line";
        EndDate: Date;
        DontCharge: Boolean;
        JBatch: Code[10];
        Jtemplate: Code[10];
        CustLedger: Record 52185861;
        AccountingPeriod: Record 52185861;
        FiscalYearStartDate: Date;
        "ExtDocNo.": Text[30];
        InterestDue: Decimal;
        LoansInterest: Record 52185859;
        GeneratesuccMSG: label 'Interest Posted Successfully';
        AlreadyPostedErr: label 'This transaction Has already been posted';
        NoTemplateErr: label 'Ensure the Loans Template is set up in Cash Office Setup';
        NoBatchErr: label 'Ensure the Loans Batch is set up in the Cash Office Setup';
        DailyLoansInterestBuffer: Record 52185858;
    begin
        with InterestBufferBillAndAccrue
          do begin
            if Posted = true then
                Error(AlreadyPostedErr);

            Temp.Get(UserId);

            Jtemplate := Temp."Bills Template";
            JBatch := Temp."Bills Batch";

            if Jtemplate = '' then begin
                Error(NoTemplateErr);
            end;
            if JBatch = '' then begin
                Error(NoBatchErr)
            end;

            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", Jtemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            GenJournalLine.DeleteAll;

            LoansInterest.Reset;
            LoansInterest.SetRange(LoansInterest.No, "No.");
            LoansInterest.SetRange(Posted, false);
            if LoansInterest.Find('-') then begin
                repeat
                    //LoansInterest.CALCFIELDS(LoansInterest."Total Interest");
                    if LoansInterest."Monthly Repayment" <> 0 then
                      //IF LoansInterest."Total Interest"<>0 THEN
                      //IF LoansInterest."Interest Amount"<>0 THEN
                      begin
                        //INTEREST
                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := Jtemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Posting Date" := "Posting Date";
                        GenJournalLine.Description := Description;
                        GenJournalLine."Account Type" := LoansInterest."Account Type";
                        GenJournalLine."Account No." := LoansInterest."Account No";
                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Due";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := "Document No.";
                        //LoansInterest.CALCFIELDS(LoansInterest."Total Interest");
                        GenJournalLine."Shortcut Dimension 1 Code" := LoansInterest."Shortcut Dimension 1 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine."Shortcut Dimension 2 Code" := LoansInterest."Shortcut Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        GenJournalLine.Amount := LoansInterest."Interest Bill";//LoansInterest."Total Interest";//LoansInterest."Interest Amount";
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                        GenJournalLine."Bal. Account No." := LoansInterest."Bal. Account No.";
                        GenJournalLine."Loan No" := LoansInterest."Loan No.";
                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Due";
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;
                    end;
                    //LoansInterest.CALCFIELDS(LoansInterest."Total Repayment");
                    // IF LoansInterest."Total Repayment"{LoansInterest."Repayment Amount"}<>0 THEN
                    if LoansInterest."Monthly Repayment" <> 0 then begin
                        LineNo := LineNo + 1000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := Jtemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Posting Date" := "Posting Date";
                        GenJournalLine.Description := Description;
                        GenJournalLine."Account Type" := LoansInterest."Account Type";
                        GenJournalLine."Account No." := LoansInterest."Account No";
                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := "Document No.";
                        //LoansInterest.CALCFIELDS(LoansInterest."Total Repayment");
                        GenJournalLine."Shortcut Dimension 1 Code" := LoansInterest."Shortcut Dimension 1 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine."Shortcut Dimension 2 Code" := LoansInterest."Shortcut Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");

                        GenJournalLine.Amount := LoansInterest."Repayment Bill";//LoansInterest."Total Repayment";//LoansInterest."Repayment Amount";
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                        GenJournalLine."Bal. Account No." := LoansInterest."Bill Account";//LoansInterest."Bal. Account No.";
                        GenJournalLine."Loan No" := LoansInterest."Loan No.";
                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Bills;
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;
                        //BILLS
                    end;

                    //Appraisal--Start
                    if LoansInterest."Monthly Repayment" <> 0 then begin
                        LineNo := LineNo + 1000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := Jtemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Posting Date" := "Posting Date";
                        GenJournalLine.Description := Description;
                        GenJournalLine."Account Type" := LoansInterest."Account Type";
                        GenJournalLine."Account No." := LoansInterest."Account No";
                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Appraisal;
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := "Document No.";
                        //LoansInterest.CALCFIELDS(LoansInterest."Total Repayment");
                        GenJournalLine."Shortcut Dimension 1 Code" := LoansInterest."Shortcut Dimension 1 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine."Shortcut Dimension 2 Code" := LoansInterest."Shortcut Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");

                        GenJournalLine.Amount := LoansInterest."Appraisal Amount";
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        if LoanType.Get(LoansInterest."Loan Product type") then begin
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := LoanType."Loan Appraisal Income Acc.";
                            LoanType.TestField(LoanType."Loan Appraisal Income Acc.");
                        end;
                        GenJournalLine."Loan No" := LoansInterest."Loan No.";
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;
                    end;
                    //Appraisal --END;

                    //Post New
                    //          GenJournalLine.RESET;
                    //          GenJournalLine.SETRANGE("Journal Template Name",Jtemplate);
                    //          GenJournalLine.SETRANGE("Journal Batch Name",JBatch);
                    //          IF GenJournalLine.FIND('-') THEN BEGIN
                    //         CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post New",GenJournalLine);
                    //          END;

                    LoansInterest.Transferred := true;
                    LoansInterest.Posted := true;
                    LoansInterest.Modify;
                    DailyLoansInterestBuffer.SetRange("Loan No.", LoansInterest."Loan No.");
                    if DailyLoansInterestBuffer.Find('-') then begin
                        repeat

                            //Post New
                            DailyLoansInterestBuffer.Posted := true;
                            DailyLoansInterestBuffer.Transferred := true;
                            DailyLoansInterestBuffer.Modify;
                            Commit;
                        until DailyLoansInterestBuffer.Next = 0;
                    end;
                until LoansInterest.Next = 0;

                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                if GenJournalLine.Find('-') then begin
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                end;
            end;


            //  LoansInterest.MODIFYALL(LoansInterest.Transferred,TRUE);
            //  LoansInterest.MODIFYALL(LoansInterest.Posted,TRUE);
            Posted := true;
            "Posted By" := UserId;
            "Posting Date" := Today;
            Modify;
            //Close Interest Period
            /*
            IF AccountingPeriod.GET("Interest Due Date") THEN
              BEGIN
                AccountingPeriod.Closed:=TRUE;
                AccountingPeriod."Closed by User":=USERID;
                AccountingPeriod."Closing Date Time":=TODAY;
                AccountingPeriod.MODIFY;
                END;
                */
            Message(GeneratesuccMSG);
        end;

    end;


    procedure GenerateMonthlyInterestandBills(InterestBuffer: Record 52185860)
    var
        Loans: Record 52185729;
        LoanType: Record 52185690;
        Gnljnline: Record "Gen. Journal Line";
        LineNo: Integer;
        DocNo: Code[20];
        PDate: Date;
        "Document No.": Code[20];
        InterestHeader: Record 52185860;
        LoansInterest: Record 52185859;
        LoanAmount: Decimal;
        CustMember: Record 52185731;
        CurrDate: Date;
        FirstMonthDate: Date;
        CurrMonth: Date;
        MidDate: Date;
        EndDate: Date;
        LastMonthDate: Date;
        FirstDay: Date;
        FirstDate: Date;
        IntCharged: Decimal;
        Principle: Decimal;
        AlreadyPostedErr: label 'This transaction Is Already posted';
        DailyLoansInterest: Record 52185858;
        Members: Record 52185700;
        Memb: Record 52185700;
        diaProgress: Dialog;
        intProgress: Integer;
        timProgress: Time;
        intProgressI: Integer;
        intProgressTotal: Integer;
        GeneratingDividends: label 'Generating Interest :';
        Counter1: Integer;
        Counter2: Integer;
        ToDateS: Text;
        DateFilter: Text;
        SuspendedInterestAccounts: Record 52185854;
        InterestDuePeriod: Record 52185861;
        MonthDays: Integer;
        GeneralSetUp: Record 52185689;
        Dim1: Code[50];
        Dim2: Code[50];
    begin
        with InterestBuffer do begin
            if Posted = true then
                Error(AlreadyPostedErr);

            TestField("Document No.");
            TestField("Interest Due Date");
            TestField(Description);
            TestField("Posting Date");
            // TESTFIELD("Start Date");
            TestField("End Date");
            InterestDuePeriod.Get("Interest Due Date");
            IntCharged := 0;
            Principle := 0;
            intProgressI := 0;
            MonthDays := 0;
            Counter1 := 0;
            //Sum Up Daily Entries
            diaProgress.Open(GeneratingDividends + '@1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@', intProgress);
            Evaluate(ToDateS, Format("End Date"));
            DateFilter := '..' + ToDateS;
            MonthDays := ((CalcDate('CM', InterestDuePeriod."Interest Due Date")) - InterestDuePeriod."Interest Due Date") + 1;



            Loans.Reset;
            Loans.SetRange(Loans.Posted, true);
            Loans.SetFilter(Loans."Date Filter", DateFilter);
            Loans.SetRange("Disbursement Date", 19000101D, "End Date");
            Loans.SetFilter("Outstanding Balance", '>0');
            if Loans.Find('-') then begin
                Counter2 := Loans.Count;
                repeat
                    Dim1 := Loans."Global Dimension 1 Code";
                    Dim2 := Loans."Global Dimension 2 Code";

                    if Dim2 = '' then begin
                        UserSetup.Reset;
                        UserSetup.SetRange("User ID", Loans."Posted By");
                        if UserSetup.FindFirst then begin
                            Dim1 := UserSetup."Global Dimension 1 Code";
                            Dim2 := UserSetup."Global Dimension 2 Code";
                        end;
                    end;

                    if Dim2 = '' then begin
                        Dim1 := InterestBuffer."Shortcut Dimension 1 Code";
                        Dim2 := InterestBuffer."Shortcut Dimension 1 Code";
                    end;


                    Loans.CalcFields("Outstanding Balance", "Outstanding Interest", "Outstanding Bills", "Loans Category-SASRA");
                    if (Loans."Outstanding Balance" + Loans."Outstanding Interest") > 0 then begin
                        if Loans."Loan Account" <> '' then begin
                            //Check status - sasra
                            GeneralSetUp.Get();
                            Loans.CalcFields("Loans Category-SASRA");
                            if Loans."Loans Category-SASRA" < GeneralSetUp."Allowed Loan Cat Billing" then begin
                                Counter1 += 1;
                                diaProgress.Update(1, ROUND((Counter1 / Counter2), 1, '>') * 100);
                                LoanType.Get(Loans."Loan Product Type");
                                //Calculate Interest
                                //MBUSO

                                Members.Reset;
                                Members.SetRange("No.", Loans."Member No.");
                                Members.SetFilter(Status, '<>%1', Members.Status::Deceased);
                                if Members.Find('-') then begin
                                    if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Straight Line" then
                                        IntCharged := Loans."Approved Amount" * ((Loans.Interest) / 1200)
                                    else
                                        IntCharged := Loans."Outstanding Balance" * ((Loans.Interest) / 1200);

                                    if (LoansInterest.No = "Document No.") and (LoansInterest."Loan No." = Loans."Loan No.") then LoansInterest.Delete;
                                    if Memb.Get(Loans."Member No.") then begin
                                        if Memb.Status = Memb.Status::Deceased then
                                            IntCharged := 0;
                                    end;

                                    LoanType.Get(Loans."Loan Product Type");

                                    if LoanType."No Interest Bills" = true then
                                        IntCharged := 0;

                                    LoansInterest.Init;
                                    LoansInterest.No := "No.";
                                    LoansInterest."Loan No." := Loans."Loan No.";
                                    LoansInterest.TestField(LoansInterest."Loan No.");
                                    LoansInterest."Account Type" := LoansInterest."account type"::Credit;
                                    LoansInterest."Account No" := Loans."Loan Account";
                                    LoansInterest.TestField(LoansInterest."Account No");
                                    LoansInterest."Interest Date" := "Posting Date";//TODAY;
                                    LoansInterest."Issued Date" := Loans."Disbursement Date";
                                    //Grace Period Interest
                                    if Format(LoanType."Grace Period - Interest") <> '' then begin
                                        if CalcDate(LoanType."Grace Period - Interest", Loans."Disbursement Date") <= Today then
                                            LoansInterest."Interest Bill" := IntCharged else
                                            LoansInterest."Interest Bill" := 0;
                                    end else begin
                                        LoansInterest."Interest Bill" := IntCharged;
                                    end;

                                    if Loans."Outstanding Balance" > (Loans.Repayment - IntCharged) then
                                        Principle := (Loans.Repayment - IntCharged)
                                    else
                                        Principle := Loans."Outstanding Balance";

                                    if (Principle + Loans."Outstanding Bills") > Loans."Outstanding Balance" then
                                        Principle := Loans."Outstanding Balance" - Loans."Outstanding Bills";
                                    LoansInterest."Repayment Amount" := Principle;

                                    if Format(LoanType."Grace Period - Principle") <> '' then begin
                                        if CalcDate(LoanType."Grace Period - Principle", Loans."Disbursement Date") <= Today then
                                            LoansInterest."Repayment Bill" := (Principle) else
                                            LoansInterest."Repayment Bill" := 0;
                                    end else begin
                                        LoansInterest."Repayment Bill" := Principle;
                                    end;

                                    if LoansInterest."Repayment Bill" < 0 then
                                        LoansInterest."Repayment Bill" := 0;

                                    if Loans.Installments <> 0 then
                                        LoansInterest."Appraisal Amount" := Loans."Appraisal Fee" / Loans.Installments;
                                    LoansInterest.Description := Description;
                                    LoansInterest."Interest Amount" := IntCharged;
                                    LoansInterest."Shortcut Dimension 1 Code" := Dim1;
                                    LoansInterest."Shortcut Dimension 2 Code" := Dim2;
                                    LoansInterest."Monthly Repayment" := LoansInterest."Repayment Bill" + LoansInterest."Interest Bill";
                                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Bills", Loans."Outstanding Interest");
                                    LoansInterest."Outstanding Balance" := Loans."Outstanding Balance";
                                    LoansInterest."Outstanding Interest" := Loans."Outstanding Interest";
                                    LoansInterest."Outstanding Bill" := Loans."Outstanding Bills";
                                    LoansInterest."Loan Product type" := Loans."Loan Product Type";
                                    if LoanType.Get(Loans."Loan Product Type") then begin
                                        LoansInterest."Bal. Account Type" := LoansInterest."bal. account type"::"G/L Account";
                                        LoansInterest."Bill Account" := LoanType."Billed Account";
                                        if LoanType."No Interest Bills" = true then
                                            LoansInterest."Interest Bill" := 0;
                                        if LoanType."No Principle Bills" = true then
                                            LoansInterest."Repayment Bill" := 0;
                                        LoansInterest."Monthly Repayment" := LoansInterest."Repayment Bill" + LoansInterest."Interest Bill";
                                        if (Loans."Loans Category-SASRA" = Loans."loans category-sasra"::Perfoming) or (Loans."Loans Category-SASRA" = Loans."loans category-sasra"::Watch) then
                                            LoansInterest."Bal. Account No." := LoanType."Loan Interest Account [G/L]"
                                        else begin
                                            LoansInterest."Bal. Account No." := LoanType."Suspend Interest Account [G/L]";
                                            //Insert Entries to buffer
                                            iEntryNo := iEntryNo + 1;
                                            SuspendedInterestAccounts.Reset;
                                            if SuspendedInterestAccounts.FindLast then begin
                                                SuspendedInterestAccounts.Init;
                                                SuspendedInterestAccounts."Entry No." := SuspendedInterestAccounts."Entry No." + iEntryNo;
                                                SuspendedInterestAccounts."Loan No." := Loans."Loan No.";
                                                SuspendedInterestAccounts."Loan Product type" := LoanType."Product ID";
                                                SuspendedInterestAccounts."Loans Category-SASRA" := Loans."Loans Category-SASRA";
                                                SuspendedInterestAccounts."Interest Amount" := IntCharged;
                                                SuspendedInterestAccounts."Interest Date" := "Posting Date";
                                                SuspendedInterestAccounts."Issued Date" := Loans."Disbursement Date";
                                                if LoansInterest."Repayment Bill" < 0 then
                                                    LoansInterest."Repayment Bill" := 0;
                                                if (LoanType."No Principle Bills" = true) and (LoanType."No Interest Bills" = false) then begin
                                                    LoansInterest."Repayment Bill" := 0;
                                                end;
                                                SuspendedInterestAccounts.Insert(true);
                                            end;
                                        end;
                                    end;

                                    LoansInterest.TestField(LoansInterest."Bal. Account No.");
                                    if CustMember.Get(Loans."Loan Account") then begin
                                        //LoansInterest."Shortcut Dimension 1 Code":=CustMember."Global Dimension 1 Code";
                                        //LoansInterest."Shortcut Dimension 2 Code":=CustMember."Global Dimension 2 Code";
                                        LoansInterest.Status := CustMember.Status;
                                        LoansInterest.Blocked := CustMember.Blocked;
                                    end;
                                    if (LoansInterest."Monthly Repayment" <> 0) and ((LoansInterest."Repayment Bill" + LoansInterest."Interest Bill" + LoansInterest."Appraisal Amount") <> 0) then
                                        LoansInterest.Insert;


                                end;
                            end;
                        end;
                    end;
                until Loans.Next = 0;
            end;
        end;
    end;


    procedure GenerateMonthlyInterest(InterestBuffer: Record 52185860)
    var
        Loans: Record 52185729;
        LoanType: Record 52185690;
        Gnljnline: Record "Gen. Journal Line";
        LineNo: Integer;
        DocNo: Code[20];
        PDate: Date;
        "Document No.": Code[20];
        InterestHeader: Record 52185860;
        LoansInterest: Record 52185859;
        LoanAmount: Decimal;
        CustMember: Record 52185731;
        CurrDate: Date;
        FirstMonthDate: Date;
        CurrMonth: Date;
        MidDate: Date;
        EndDate: Date;
        LastMonthDate: Date;
        FirstDay: Date;
        FirstDate: Date;
        IntCharged: Decimal;
        Principle: Decimal;
        AlreadyPostedErr: label 'This transaction Is Already posted';
        DailyLoansInterest: Record 52185858;
        GeneralSetUp: Record 52185689;
        Memb: Record 52185700;
    begin
        with InterestBuffer
          do begin
            if Posted = true then
                Error(AlreadyPostedErr);
            TestField("Document No.");
            TestField("Interest Due Date");
            TestField(Description);
            TestField("Posting Date");
            IntCharged := 0;
            Principle := 0;

            //Sum Up Daily Entries
            Loans.Reset;
            Loans.SetRange(Loans.Posted, true);
            if Loans.Find('-') then begin
                repeat
                    DailyLoansInterest.Reset;
                    DailyLoansInterest.SetCurrentkey(DailyLoansInterest."Loan No.", DailyLoansInterest.Transferred);
                    DailyLoansInterest.SetRange(DailyLoansInterest.Transferred, false);
                    DailyLoansInterest.SetRange(DailyLoansInterest."Loan No.", Loans."Loan No.");
                    //DailyLoansInterest.CALCSUMS("Interest Amount");

                    if DailyLoansInterest.Find('-') then begin
                        IntCharged := 0;
                        repeat
                            IntCharged += DailyLoansInterest."Interest Amount";
                        until DailyLoansInterest.Next = 0;
                    end;
                    //MESSAGE('Interest %1, Princ %2',IntCharged,Principle);
                    if (LoansInterest.No = "Document No.") and (LoansInterest."Loan No." = Loans."Loan No.")
                             then
                        LoansInterest.Delete;
                    LoansInterest.Init;
                    LoansInterest.No := "Document No.";
                    LoansInterest."Loan No." := Loans."Loan No.";
                    LoansInterest."Account Type" := LoansInterest."account type"::Credit;
                    LoansInterest."Account No" := Loans."Loan Account";
                    LoansInterest."Interest Date" := Today;
                    LoansInterest."Issued Date" := Loans."Disbursement Date";
                    LoansInterest."Repayment Amount" := Loans.Repayment;
                    //LoansInterest."Repayment Bill":=Loans.Repayment;
                    LoansInterest."Interest Bill" := IntCharged;
                    LoansInterest."Shortcut Dimension 1 Code" := Loans."Global Dimension 1 Code";
                    LoansInterest."Shortcut Dimension 2 Code" := Loans."Global Dimension 2 Code";
                    LoansInterest.Description := Description;
                    LoansInterest."Interest Amount" := IntCharged;
                    LoansInterest."Monthly Repayment" := LoansInterest."Repayment Amount" + LoansInterest."Interest Amount";
                    LoansInterest."Loan Product type" := Loans."Loan Product Type";
                    if LoanType.Get(Loans."Loan Product Type") then begin
                        LoansInterest."Bal. Account Type" := LoansInterest."bal. account type"::"G/L Account";
                        LoansInterest."Bill Account" := LoanType."Billed Account";
                        if (Loans."Loans Category-SASRA" = Loans."loans category-sasra"::Perfoming) or (Loans."Loans Category-SASRA" = Loans."loans category-sasra"::Watch) then
                            LoansInterest."Bal. Account No." := LoanType."Loan Interest Account [G/L]" else
                            LoansInterest."Bal. Account No." := LoanType."Suspend Interest Account [G/L]";
                    end;
                    if CustMember.Get(Loans."Loan Account") then begin
                        //LoansInterest."Shortcut Dimension 1 Code":=CustMember."Global Dimension 1 Code";
                        //LoansInterest."Shortcut Dimension 2 Code":=CustMember."Global Dimension 2 Code";
                        LoansInterest.Status := CustMember.Status;
                        LoansInterest.Blocked := CustMember.Blocked;
                    end;
                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Bills", Loans."Outstanding Interest");
                    LoansInterest."Outstanding Balance" := Loans."Outstanding Balance";
                    LoansInterest."Outstanding Interest" := Loans."Outstanding Interest";
                    if LoansInterest."Monthly Repayment" <> 0 then
                        LoansInterest.Insert;
                    //DailyLoansInterest.MODIFYALL(DailyLoansInterest.Transferred,FALSE);
                    DailyLoansInterest.ModifyAll(DailyLoansInterest."Interest Matured", true);
                until Loans.Next = 0;
            end;

        end;
    end;


    procedure GenerateMonthlyBills(InterestBuffer: Record 52185860)
    var
        Loans: Record 52185729;
        LoanType: Record 52185690;
        Gnljnline: Record "Gen. Journal Line";
        LineNo: Integer;
        DocNo: Code[20];
        PDate: Date;
        "Document No.": Code[20];
        InterestHeader: Record 52185860;
        LoansInterest: Record 52185859;
        LoanAmount: Decimal;
        CustMember: Record 52185731;
        CurrDate: Date;
        FirstMonthDate: Date;
        CurrMonth: Date;
        MidDate: Date;
        EndDate: Date;
        LastMonthDate: Date;
        FirstDay: Date;
        FirstDate: Date;
        IntCharged: Decimal;
        Principle: Decimal;
        AlreadyPostedErr: label 'This transaction Is Already posted';
        DailyLoansInterest: Record 52185858;
        Memb: Record 52185700;
    begin
        with InterestBuffer
          do begin
            if Posted = true then
                Error(AlreadyPostedErr);
            TestField("Document No.");
            TestField("Interest Due Date");
            TestField(Description);
            TestField("Posting Date");
            IntCharged := 0;
            Principle := 0;
            //Compute Bills
            Loans.Reset;
            Loans.SetRange(Loans.Posted, true);
            if Loans.Find('-') then begin
                repeat
                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Bills", Loans."Outstanding Interest");
                    if Loans."Outstanding Bills" < Loans."Outstanding Balance" then begin
                        LoansInterest.Init;
                        LoansInterest.No := "Document No.";
                        LoansInterest."Loan No." := Loans."Loan No.";
                        LoansInterest."Account Type" := LoansInterest."account type"::Credit;
                        LoansInterest."Account No" := Loans."Loan Account";
                        LoansInterest."Interest Date" := Today;
                        LoansInterest."Issued Date" := Loans."Disbursement Date";
                        LoansInterest."Repayment Amount" := Loans.Repayment;
                        LoansInterest."Repayment Bill" := Loans.Repayment;
                        LoansInterest."Interest Bill" := IntCharged;
                        LoansInterest.Description := Description;
                        //LoansInterest."Interest Amount":=IntCharged;
                        LoansInterest."Shortcut Dimension 1 Code" := Loans."Global Dimension 1 Code";
                        LoansInterest."Shortcut Dimension 2 Code" := Loans."Global Dimension 2 Code";
                        LoansInterest."Monthly Repayment" := Loans.Repayment;
                        LoansInterest."Loan Product type" := Loans."Loan Product Type";
                        if LoanType.Get(Loans."Loan Product Type") then begin
                            LoansInterest."Bal. Account Type" := LoansInterest."bal. account type"::"G/L Account";
                            LoansInterest."Bill Account" := LoanType."Billed Account";
                            if (Loans."Loans Category-SASRA" = Loans."loans category-sasra"::Perfoming) or (Loans."Loans Category-SASRA" = Loans."loans category-sasra"::Watch) then
                                LoansInterest."Bal. Account No." := LoanType."Loan Interest Account [G/L]" else
                                LoansInterest."Bal. Account No." := LoanType."Suspend Interest Account [G/L]";
                        end;
                        if CustMember.Get(Loans."Loan Account") then begin
                            //LoansInterest."Shortcut Dimension 1 Code":=CustMember."Global Dimension 1 Code";
                            // LoansInterest."Shortcut Dimension 2 Code":=CustMember."Global Dimension 2 Code";
                            LoansInterest.Status := CustMember.Status;
                            LoansInterest.Blocked := CustMember.Blocked;
                        end;
                        Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Bills", Loans."Outstanding Interest");
                        LoansInterest."Outstanding Balance" := Loans."Outstanding Balance";
                        LoansInterest."Outstanding Interest" := Loans."Outstanding Interest";
                        if LoansInterest."Monthly Repayment" <> 0 then
                            LoansInterest.Insert;
                        //DailyLoansInterest.MODIFYALL(DailyLoansInterest.Transferred,FALSE);
                        DailyLoansInterest.ModifyAll(DailyLoansInterest."Interest Matured", true);
                    end;
                until Loans.Next = 0;
            end;

        end;
    end;


    procedure GenerateDailyInterest(DailyLoansInterestBuffer: Record 52185858)
    var
        Loans: Record 52185729;
        LoanType: Record 52185690;
        DailyLoansBuffer: Record 52185858;
        DateDiff: Integer;
        MontDays: Integer;
    begin
        with DailyLoansInterestBuffer
          do begin
            //Initiate Variables
            DateDiff := 0;
            Loans.SetRange(Loans.Posted, true);
            Loans.SetRange(Loans."Compute Interest Due on Postin", Loans."compute interest due on postin"::"Pro-rata");
            if Loans.Find('-') then begin
                LoanType.Get(Loans."Loan Product Type");
                repeat
                    DateDiff := 1;//TODAY-Loans."Application Date" ELSE
                                  //DateDiff:=TODAY-Loans."Disbursement Date";
                    MontDays := (CalcDate('CM', Today)) - (CalcDate('-CM', Today));
                    DailyLoansBuffer.Init;
                    DailyLoansBuffer."Loan No." := Loans."Loan No.";
                    DailyLoansBuffer."Interest Date" := Today;//CALCDATE('-1d',TODAY);
                    DailyLoansBuffer."Account No" := Loans."Loan Account";
                    DailyLoansBuffer."Account Type" := DailyLoansBuffer."account type"::Credit;
                    DailyLoansBuffer."Loan Product type" := Loans."Loan Product Type";
                    DailyLoansBuffer."User ID" := UserId;
                    //Compute Interest
                    if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Straight Line" then begin
                        if Format(LoanType."Grace Period - Interest") <> '' then
                            //BEGIN
                            if CalcDate(LoanType."Grace Period - Interest", Loans."Disbursement Date") >= Today then
                                DailyLoansBuffer."Interest Amount" := (Loans."Approved Amount" * (1 / MontDays) * Loans.Interest / 1200)
                            else
                                DailyLoansBuffer."Interest Amount" := 0;
                    end else begin
                        if Format(LoanType."Grace Period - Interest") <> '' then begin
                            if CalcDate(LoanType."Grace Period - Interest", Loans."Disbursement Date") >= Today then
                                DailyLoansBuffer."Interest Amount" := (Loans."Approved Amount" * (1 / MontDays) * Loans.Interest / 1200)
                            else
                                DailyLoansBuffer."Interest Amount" := 0;
                        end else begin
                            DailyLoansBuffer."Interest Amount" := (Loans."Approved Amount" * (1 / MontDays) * Loans.Interest / 1200)
                        end;
                    end;
                    //end of interest computations
                    if Format(LoanType."Grace Period - Principle") <> '' then begin
                        if CalcDate(LoanType."Grace Period - Principle", Loans."Disbursement Date") >= Today then
                            DailyLoansBuffer."Repayment Amount" := Loans."Loan Principle Repayment" * (1 / MontDays) else
                            DailyLoansBuffer."Repayment Amount" := 0;
                    end else begin
                        DailyLoansBuffer."Repayment Amount" := Loans."Loan Principle Repayment" * (1 / MontDays)
                    end;
                    DailyLoansBuffer."Monthly Repayment" := DailyLoansBuffer."Repayment Amount" + DailyLoansBuffer."Interest Amount";
                    if DailyLoansBuffer."Monthly Repayment" <> 0 then
                        DailyLoansBuffer.Insert;
                until Loans.Next = 0;
            end;
        end;
        //END;
        //END;
    end;


    procedure LoanCheckoffAdvice(Loans: Record 52185729; AmountON: Decimal; Amountoff: Decimal)
    var
        CheckoffAdvice: Record 52185818;
        iEntryNo: Integer;
        Employer: Record Customer;
        ChAdvice: Record 52185818;
        Member: Record 52185700;
        PaymentMethods: Record 52186122;
        InterestAmnt: Decimal;
        NoOfMonths: Integer;
        InterestTotalsFlat: Decimal;
        CheckoffAdvice2: Record 52185818;
        CreditAccounts: Record 52185733;
        LBal: Decimal;
    begin

        with Loans
           do begin
            Loans.CalcFields(Loans."Outstanding Balance", "Outstanding Interest");
            InterestAmnt := ((Loans."Outstanding Balance" * (Loans.Interest / 1200)) / Loans.Installments);
            if InterestAmnt < 0 then
                InterestAmnt := 0;

            ChAdvice.Reset;
            ChAdvice.SetRange(ChAdvice."Loan No.", Loans."Loan No.");
            ChAdvice.SetRange(ChAdvice."Advice Date", Today);
            if ChAdvice.Find('-') then
                ChAdvice.DeleteAll;
            iEntryNo := 0;
            CheckoffAdvice.Reset;
            if CheckoffAdvice.Find('+') then
                iEntryNo := CheckoffAdvice."Entry No" + 1;

            CheckoffAdvice.Init;
            CheckoffAdvice."Entry No" := iEntryNo;
            CheckoffAdvice."Account No." := Loans."Loan Account";
            CheckoffAdvice."Loan No." := Loans."Loan No.";
            CheckoffAdvice."Member No." := Loans."Member No.";
            CheckoffAdvice.Type := CheckoffAdvice.Type::Credit;
            CheckoffAdvice.Validate("Member No.");
            CheckoffAdvice."Product Type" := Loans."Loan Product Type";
            CheckoffAdvice.Validate("Product Type");
            if Member.Get(Loans."Member No.") then
                CheckoffAdvice."Employer Code" := Member."Employer Code";
            if Loans."Employer Loan No." <> '' then
                CheckoffAdvice."Employer Account No." := Loans."Employer Loan No."
            else
                CheckoffAdvice."Employer Account No." := Loans."Loan No.";

            CheckoffAdvice.Validate(CheckoffAdvice."Member No.");
            CheckoffAdvice.Names := Member.Name;

            //Different Mode of Payment***************
            PaymentMethods.Reset;
            PaymentMethods.SetRange(PaymentMethods."Loan No.", Loans."Loan No.");
            PaymentMethods.SetRange(PaymentMethods."Member No.", Loans."Member No.");
            PaymentMethods.SetRange(PaymentMethods."Payment Method", PaymentMethods."payment method"::Checkoff);
            if PaymentMethods.Find('-') then begin
                CheckoffAdvice."Amount On" := PaymentMethods.Amount;
            end else
                CheckoffAdvice."Amount On" := Loans.Repayment;//-InterestAmnt;
            if "Outstanding Balance" > 0 then
                CheckoffAdvice."Amount On" := Amountoff;
            CheckoffAdvice."Amount Off" := Amountoff;
            if Loans."Recovered Loan" = '' then begin
                CreditAccounts.Reset;
                CreditAccounts.SetRange("Customer No.", Loans."Loan Account");
                CreditAccounts.SetRange("Loan No", Loans."Loan No.");
                CreditAccounts.SetRange("Transaction Type", CreditAccounts."transaction type"::Repayment);
                if CreditAccounts.Find('+') then begin
                    CheckoffAdvice."Balance Off" := Loans."Employer Balance";//Loans."Outstanding Balance"+(CreditAccounts.Amount*-1);
                end;
            end;
            if Loans."Outstanding Interest" > InterestAmnt then
                CheckoffAdvice.Interest := Loans."Outstanding Interest"//Loans."Loan Interest Repayment";
            else
                CheckoffAdvice.Interest := InterestAmnt;

            LBal := Loans."Employer Balance";
            if LBal <= 0 then
                LBal := Loans."Outstanding Balance";


            if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Reducing Flat" then begin
                InterestTotalsFlat := ((Loans.Repayment * Loans.Installments) - Loans."Approved Amount") / Loans.Installments;
                NoOfMonths := ROUND((Loans."Approved Amount" - Loans."Outstanding Balance") / (Loans.Repayment - InterestTotalsFlat), 1, '>');
                CheckoffAdvice."Balance On" := Loans.Repayment * NoOfMonths;//Loans."Outstanding Balance";
            end else
                CheckoffAdvice."Balance On" := LBal + (CreditAccounts.Amount);//Loans."Outstanding Balance";
            if Loans."Recovered Loan" <> '' then begin
                CheckoffAdvice."Balance On" := Loans.Repayment * Loans.Installments;
            end;
            CheckoffAdvice."Advice Date" := Today;
            if Member.Get(Loans."Member No.") then
                CheckoffAdvice."ID No." := Member."ID No.";
            if Loans."Loan Recovery No." <> '' then
                CheckoffAdvice."Amount Off" := 0;
            CheckoffAdvice."Payroll No" := Member."Payroll/Staff No.";
            CheckoffAdvice.Interest := Loans."Loan Interest Repayment";
            if "Outstanding Balance" > 0 then
                CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Adjustment
            else
                if "Recovered Loan" <> '' then
                    CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::"New Loan"
                else begin
                    if Loans."Employer Balance" <> 0 then
                        CheckoffAdvice."Amount Off" := Loans.Repayment;
                    if Loans."Employer Loan No." = '' then
                        CheckoffAdvice."Employer Account No." := Loans."Loan No." else
                        CheckoffAdvice."Employer Account No." := Loans."Employer Loan No.";
                    CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Stoppage;
                    CheckoffAdvice."Amount On" := 0;
                end;

            CheckoffAdvice.Insert;
        end;
    end;


    procedure MonthlyCheckoffAdvice(CheckoffAdviceHeader: Record 52185822)
    var
        Loans: Record 52185729;
        Employer: Record Customer;
        CheckoffAdvice: Record 52185818;
        iEntryNo: Integer;
        ChAdvice: Record 52185818;
        Employer2: Record Customer;
        SavingsAccounts: Record 52185730;
        Memb: Record 52185700;
        Employer3: Record Customer;
        MemberCategory: Record 52185723;
        PaymentMethods: Record 52186122;
        InterestAmount: Decimal;
        Mdays: Integer;
        CheckoffAdvice2: Record 52185818;
        LoopCount: Integer;
        CountNo: Integer;
        CountNo1: Integer;
    begin
        with CheckoffAdviceHeader do begin
            Mdays := (CheckoffAdviceHeader."End Date" - CheckoffAdviceHeader."Start Date") + 1;
            ChAdvice.Reset;
            ChAdvice.SetRange(ChAdvice."Advice Header No.", "No.");
            if ChAdvice.Find('-') then begin
                ChAdvice.DeleteAll;
            end;
            if CheckoffAdviceHeader."Employer Code" = '' then begin
                Loans.Reset;
                Loans.SetFilter(Loans."Outstanding Balance", '>0');
                Loans.SetRange("Recovery Mode", Loans."recovery mode"::Checkoff);
                Loans.SetFilter("Date Filter", '..' + Format(CheckoffAdviceHeader."Loan Interest Cut OFF Date"));
                Loans.SetFilter("Disbursement Date", '..' + Format(CheckoffAdviceHeader."Loan Issue Cut OFF Date"));
                Loans.SetRange(Loans.Posted, true);
                if Loans.Find('-') then begin
                    repeat

                        Loans.CalcFields(Loans."Outstanding Balance", "Outstanding Interest");
                        InterestAmount := ROUND(((Loans."Outstanding Balance" * (Loans.Interest * Mdays) / 36500)), 1, '>');
                        if InterestAmount < 0 then
                            InterestAmount := 0;
                        if Memb.Get(Loans."Member No.") then
                            if Employer.Get(Memb."Employer Code") then begin
                                if Employer."Advice Method" = Employer."advice method"::Everything then begin
                                    iEntryNo := 0;
                                    CheckoffAdvice.Reset;
                                    if CheckoffAdvice.Find('+') then
                                        iEntryNo := CheckoffAdvice."Entry No" + 1;
                                    if CheckoffAdvice.Manual = false then begin
                                        CheckoffAdvice.Init;
                                        CheckoffAdvice."Entry No" := iEntryNo;
                                        CheckoffAdvice."Advice Header No." := CheckoffAdviceHeader."No.";
                                        CheckoffAdvice."Account No." := Loans."Loan Account";
                                        CheckoffAdvice."Product Type" := Loans."Loan Product Type";
                                        CheckoffAdvice.Validate("Product Type");
                                        CheckoffAdvice."Loan No." := Loans."Loan No.";
                                        if Memb.Get(Loans."Member No.") then
                                            CheckoffAdvice."ID No." := Memb."ID No.";
                                        CheckoffAdvice."Member No." := Loans."Member No.";
                                        CheckoffAdvice."Employer Code" := Memb."Employer Code";
                                        CheckoffAdvice.Validate(CheckoffAdvice."Member No.");
                                        CheckoffAdvice.Names := Memb.Name;
                                        ;

                                        //Different Mode of Payment***************
                                        PaymentMethods.Reset;
                                        PaymentMethods.SetRange(PaymentMethods."Loan No.", Loans."Loan No.");
                                        PaymentMethods.SetRange(PaymentMethods."Member No.", Loans."Member No.");
                                        PaymentMethods.SetRange(PaymentMethods."Payment Method", PaymentMethods."payment method"::Checkoff);
                                        if PaymentMethods.Find('-') then begin
                                            CheckoffAdvice."Amount On" := PaymentMethods.Amount
                                        end else
                                            CheckoffAdvice."Amount On" := Loans.Repayment - InterestAmount;
                                        ;
                                        CheckoffAdvice."Balance On" := Loans."Outstanding Balance";
                                        CheckoffAdvice."Advice Date" := Today;
                                        CheckoffAdvice."Payroll No" := Memb."Payroll/Staff No.";
                                        if Loans."Outstanding Interest" > InterestAmount then
                                            CheckoffAdvice.Interest := Loans."Outstanding Interest"
                                        else
                                            CheckoffAdvice.Interest := InterestAmount;
                                        CheckoffAdvice.Insert;
                                    end;
                                end;
                            end;
                    until Loans.Next = 0;
                end;

                //Advice Deposits Everything
                Employer2.Reset;
                Employer2.SetRange(Employer2."Advice Method", Employer2."advice method"::Everything);
                if Employer2.Find('-') then begin
                    repeat
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange(SavingsAccounts."Employer Code", Employer2."No.");
                        if SavingsAccounts.Find('-') then begin
                            repeat
                                //Deposit Contr
                                if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Deposit Contribution" then begin
                                    iEntryNo := 0;
                                    CheckoffAdvice.Reset;
                                    if CheckoffAdvice.Find('+') then
                                        iEntryNo := CheckoffAdvice."Entry No" + 1;

                                    CheckoffAdvice.Init;
                                    CheckoffAdvice."Entry No" := iEntryNo;
                                    CheckoffAdvice."Advice Header No." := CheckoffAdviceHeader."No.";
                                    CheckoffAdvice."Account No." := SavingsAccounts."No.";
                                    CheckoffAdvice."Member No." := SavingsAccounts."Member No.";
                                    CheckoffAdvice.Validate(CheckoffAdvice."Member No.");
                                    if Memb.Get(SavingsAccounts."Member No.") then begin
                                        MemberCategory.Reset;
                                        MemberCategory.SetRange(MemberCategory."No.", Memb."Member Category");
                                        if MemberCategory.Find('-') then begin
                                            if MemberCategory."Default Share Deposit" > SavingsAccounts."Monthly Contribution" then
                                                CheckoffAdvice."Amount On" := MemberCategory."Default Share Deposit"
                                            else
                                                CheckoffAdvice."Amount On" := SavingsAccounts."Monthly Contribution";
                                        end;
                                    end;
                                    //**CheckoffAdvice."Amount On":=SavingsAccounts."Monthly Contribution";
                                    CheckoffAdvice."Advice Method" := CheckoffAdvice."advice method"::Everything;
                                    if SavingsAccounts."Monthly Contribution" > CheckoffAdvice."Amount On" then
                                        CheckoffAdvice."Amount On" := SavingsAccounts."Monthly Contribution";
                                    CheckoffAdvice."Advice Date" := Today;
                                    CheckoffAdvice."Employer Code" := Employer2."No.";
                                    CheckoffAdvice.Names := SavingsAccounts.Name;
                                    CheckoffAdvice."ID No." := SavingsAccounts."ID No.";
                                    CheckoffAdvice."Product Type" := SavingsAccounts."Product Type";
                                    CheckoffAdvice.Validate("Product Type");
                                    CheckoffAdvice."Payroll No" := SavingsAccounts."Payroll/Staff No.";
                                    if CheckoffAdvice."Amount On" <> 0 then
                                        CheckoffAdvice.Insert;
                                end;
                                //Share Cap
                                if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Share Capital" then begin
                                    SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                                    iEntryNo := 0;
                                    CheckoffAdvice.Reset;
                                    if CheckoffAdvice.Find('+') then
                                        iEntryNo := CheckoffAdvice."Entry No" + 1;

                                    CheckoffAdvice.Init;
                                    CheckoffAdvice."Entry No" := iEntryNo;
                                    CheckoffAdvice."Advice Header No." := CheckoffAdviceHeader."No.";
                                    CheckoffAdvice."Account No." := SavingsAccounts."No.";
                                    CheckoffAdvice."Member No." := SavingsAccounts."Member No.";
                                    CheckoffAdvice.Validate(CheckoffAdvice."Member No.");
                                    if Memb.Get(SavingsAccounts."Member No.") then begin
                                        MemberCategory.Reset;
                                        MemberCategory.SetRange(MemberCategory."No.", Memb."Member Category");
                                        if MemberCategory.Find('-') then begin
                                            if MemberCategory."Share Capital" > SavingsAccounts."Balance (LCY)" then
                                                CheckoffAdvice."Amount On" := MemberCategory."Default Share Deposit"
                                        end;
                                    end;
                                    //**CheckoffAdvice."Amount On":=SavingsAccounts."Monthly Contribution";
                                    CheckoffAdvice."Advice Method" := CheckoffAdvice."advice method"::Everything;
                                    if SavingsAccounts."Monthly Contribution" > CheckoffAdvice."Amount On" then
                                        CheckoffAdvice."Amount On" := SavingsAccounts."Monthly Contribution";
                                    CheckoffAdvice."Advice Date" := Today;
                                    CheckoffAdvice."Employer Code" := Employer2."No.";
                                    CheckoffAdvice.Names := SavingsAccounts.Name;
                                    CheckoffAdvice."ID No." := SavingsAccounts."ID No.";
                                    CheckoffAdvice."Product Type" := SavingsAccounts."Product Type";
                                    CheckoffAdvice.Validate("Product Type");
                                    CheckoffAdvice."Payroll No" := SavingsAccounts."Payroll/Staff No.";
                                    if CheckoffAdvice."Amount On" <> 0 then
                                        CheckoffAdvice.Insert;
                                end;
                                //Reg Fee
                                if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Registration Fee" then begin
                                    iEntryNo := 0;
                                    CheckoffAdvice.Reset;
                                    if CheckoffAdvice.Find('+') then
                                        iEntryNo := CheckoffAdvice."Entry No" + 1;

                                    CheckoffAdvice.Init;
                                    CheckoffAdvice."Entry No" := iEntryNo;
                                    CheckoffAdvice."Advice Header No." := CheckoffAdviceHeader."No.";
                                    CheckoffAdvice."Account No." := SavingsAccounts."No.";
                                    CheckoffAdvice."Member No." := SavingsAccounts."Member No.";
                                    CheckoffAdvice.Validate(CheckoffAdvice."Member No.");

                                    if Memb.Get(SavingsAccounts."Member No.") then begin
                                        MemberCategory.Reset;
                                        MemberCategory.SetRange(MemberCategory."No.", Memb."Member Category");
                                        if MemberCategory.Find('-') then begin
                                            CheckoffAdvice."Amount On" := MemberCategory."Registration Fee";
                                        end;
                                    end;
                                    CheckoffAdvice."Advice Method" := CheckoffAdvice."advice method"::Everything;
                                    if SavingsAccounts."Monthly Contribution" > CheckoffAdvice."Amount On" then
                                        CheckoffAdvice."Amount On" := SavingsAccounts."Monthly Contribution";
                                    CheckoffAdvice."Advice Date" := Today;
                                    CheckoffAdvice."Employer Code" := Employer2."No.";
                                    CheckoffAdvice.Names := SavingsAccounts.Name;
                                    CheckoffAdvice."ID No." := SavingsAccounts."ID No.";
                                    CheckoffAdvice."Product Type" := SavingsAccounts."Product Type";
                                    CheckoffAdvice.Validate("Product Type");
                                    CheckoffAdvice."Payroll No" := SavingsAccounts."Payroll/Staff No.";
                                    if CheckoffAdvice."Amount On" <> 0 then
                                        CheckoffAdvice.Insert;
                                end;
                            until SavingsAccounts.Next = 0;
                        end;
                    until Employer2.Next = 0;
                end;
                ChAdvice.Reset;
                ChAdvice.SetRange(ChAdvice."Advice Date", CheckoffAdviceHeader."Start Date", CheckoffAdviceHeader."End Date");
                ChAdvice.SetRange(ChAdvice."Advice Header No.", '');
                if ChAdvice.Find('-') then begin
                    repeat

                        Employer3.Reset;
                        //Employer3.SETRANGE(Employer3."No.",CheckoffAdviceHeader."Employer Code");
                        Employer3.SetRange(Employer3."Advice Method", Employer3."advice method"::Changes);
                        if Employer.Find('-') then begin

                            iEntryNo := 0;
                            CheckoffAdvice.Reset;
                            if CheckoffAdvice.Find('+') then
                                iEntryNo := CheckoffAdvice."Entry No" + 1;

                            CheckoffAdvice.Init;
                            CheckoffAdvice."Entry No" := iEntryNo;
                            CheckoffAdvice."Advice Header No." := CheckoffAdviceHeader."No.";
                            CheckoffAdvice."Account No." := ChAdvice."Account No.";
                            CheckoffAdvice."Member No." := ChAdvice."Member No.";
                            ChAdvice.Validate(ChAdvice."Member No.");
                            CheckoffAdvice."Amount On" := ChAdvice."Amount On";
                            CheckoffAdvice."Advice Method" := ChAdvice."Advice Method";
                            CheckoffAdvice.Period := ChAdvice.Period;
                            CheckoffAdvice."Loan No." := ChAdvice."Loan No.";
                            CheckoffAdvice."Advice Date" := ChAdvice."Advice Date";
                            CheckoffAdvice."Advice Type" := ChAdvice."Advice Type";
                            CheckoffAdvice."Employer Code" := ChAdvice."Employer Code";
                            CheckoffAdvice.Names := ChAdvice.Names;
                            CheckoffAdvice."System Created" := true;
                            CheckoffAdvice."ID No." := ChAdvice."ID No.";
                            CheckoffAdvice."Product Type" := ChAdvice."Product Type";
                            CheckoffAdvice.Validate("Product Type");
                            CheckoffAdvice."Payroll No" := ChAdvice."Payroll No";
                            CheckoffAdvice.Insert;
                        end;
                    until ChAdvice.Next = 0;
                end;
            end else begin

                //++++++++++++++++++++++++++++++++++++Advice Everything+++++++++with Employer Code
                Employer.Reset;
                Employer.SetRange(Employer."No.", ChAdvice."Employer Code");
                Employer.SetRange(Employer."Advice Method", Employer."advice method"::Everything);
                if Employer.Find('-') then begin
                    Loans.Reset;
                    Loans.SetFilter(Loans."Outstanding Balance", '>0');
                    Loans.SetRange(Loans.Posted, true);
                    Loans.SetFilter("Date Filter", '..' + Format(CheckoffAdviceHeader."Loan Interest Cut OFF Date"));
                    Loans.SetFilter("Disbursement Date", '..' + Format(CheckoffAdviceHeader."Loan Issue Cut OFF Date"));
                    Loans.SetRange(Loans."Employer Code", CheckoffAdviceHeader."Employer Code");
                    Loans.SetRange("Recovery Mode", Loans."recovery mode"::Checkoff);
                    if Loans.Find('-') then begin
                        repeat
                            if Memb.Get(Loans."Member No.") then
                                if Memb."Employer Code" = CheckoffAdviceHeader."Employer Code" then begin
                                    Loans.CalcFields(Loans."Outstanding Balance", "Outstanding Interest");
                                    InterestAmount := ROUND(((Loans."Outstanding Balance" * (Loans.Interest * Mdays) / 36500)), 1, '>');
                                    if InterestAmount < 0 then
                                        InterestAmount := 0;
                                    if Employer.Get(Memb."Employer Code") then begin
                                        if Employer."Advice Method" = Employer."advice method"::Everything then begin
                                            iEntryNo := 0;
                                            CheckoffAdvice.Reset;
                                            if CheckoffAdvice.Find('+') then
                                                iEntryNo := CheckoffAdvice."Entry No" + 1;

                                            CheckoffAdvice.Init;
                                            CheckoffAdvice."Entry No" := iEntryNo;
                                            CheckoffAdvice."Advice Header No." := CheckoffAdviceHeader."No.";
                                            CheckoffAdvice."Account No." := Loans."Loan Account";
                                            CheckoffAdvice."Product Type" := Loans."Loan Product Type";
                                            CheckoffAdvice.Validate("Product Type");
                                            CheckoffAdvice."Loan No." := Loans."Loan No.";
                                            if Memb.Get(Loans."Member No.") then
                                                CheckoffAdvice."ID No." := Memb."ID No.";
                                            CheckoffAdvice."Member No." := Loans."Member No.";
                                            CheckoffAdvice."Employer Code" := Memb."Employer Code";
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
                                                CheckoffAdvice."Amount On" := Loans.Repayment - InterestAmount;
                                            CheckoffAdvice."Balance On" := Loans."Outstanding Balance";
                                            CheckoffAdvice."Advice Date" := Today;
                                            if Loans."Outstanding Interest" > InterestAmount then
                                                CheckoffAdvice.Interest := Loans."Outstanding Interest"
                                            else
                                                CheckoffAdvice.Interest := InterestAmount;
                                            // CheckoffAdvice.Interest:=Loans."Loan Interest Repayment";
                                            CheckoffAdvice."Payroll No" := Loans."Staff No";
                                            CheckoffAdvice.Insert;
                                        end;
                                    end;
                                end;
                        until Loans.Next = 0;
                    end;



                    //Advice Deposits Everything
                    /*Employer2.RESET;
                    Employer2.SETRANGE(Employer2."Advice Method",Employer2."Advice Method"::Everything);
                    Employer2.SETRANGE(Employer2."No.",CheckoffAdviceHeader."Employer Code");
                    IF Employer2.FIND('-') THEN BEGIN*/
                    // REPEAT
                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange(SavingsAccounts."Employer Code", Employer2."No.");
                    if SavingsAccounts.Find('-') then begin
                        repeat
                            intProgressTotal := intProgressTotal + SavingsAccounts.Count;
                            iEntryNo := 0;
                            CheckoffAdvice.Reset;
                            if CheckoffAdvice.Find('+') then
                                iEntryNo := CheckoffAdvice."Entry No" + 1;

                            CheckoffAdvice.Init;
                            CheckoffAdvice."Entry No" := iEntryNo;
                            CheckoffAdvice."Advice Header No." := CheckoffAdviceHeader."No.";
                            CheckoffAdvice."Account No." := SavingsAccounts."No.";
                            CheckoffAdvice."Member No." := SavingsAccounts."Member No.";
                            CheckoffAdvice.Validate(CheckoffAdvice."Member No.");
                            // CheckoffAdvice."Amount On":=SavingsAccounts."Monthly Contribution";
                            CheckoffAdvice."Advice Method" := CheckoffAdvice."advice method"::Everything;
                            CheckoffAdvice."Advice Date" := Today;
                            CheckoffAdvice."Employer Code" := Employer2."No.";

                            if Memb.Get(SavingsAccounts."Member No.") then begin
                                MemberCategory.Reset;
                                MemberCategory.SetRange(MemberCategory."No.", Memb."Member Category");
                                if MemberCategory.Find('-') then begin
                                    if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Share Capital" then begin
                                        if MemberCategory."Share Capital" > SavingsAccounts."Balance (LCY)" then
                                            CheckoffAdvice."Amount On" := MemberCategory."Default Share Deposit"
                                    end else
                                        if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Registration Fee" then begin
                                            if MemberCategory."Registration Fee" > SavingsAccounts."Balance (LCY)" then
                                                CheckoffAdvice."Amount On" := MemberCategory."Registration Fee";

                                        end else
                                            if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Deposit Contribution" then begin
                                                CheckoffAdvice."Amount On" := MemberCategory."Default Share Deposit";
                                            end;
                                end;
                            end;
                            CheckoffAdvice.Names := SavingsAccounts.Name;
                            if SavingsAccounts."Monthly Contribution" > CheckoffAdvice."Amount On" then
                                CheckoffAdvice."Amount On" := SavingsAccounts."Monthly Contribution";
                            CheckoffAdvice."ID No." := SavingsAccounts."ID No.";
                            CheckoffAdvice."Product Type" := SavingsAccounts."Product Type";
                            CheckoffAdvice.Validate("Product Type");
                            CheckoffAdvice."Payroll No" := SavingsAccounts."Payroll/Staff No.";
                            if CheckoffAdvice."Amount On" <> 0 then
                                CheckoffAdvice.Insert;
                        until SavingsAccounts.Next = 0;
                    end;
                    //UNTIL Employer2.NEXT=0;
                    // END;
                end else begin

                    //+++++++++++++++++++++++++++++++++++++++++++++Advice Everthing -------with Employer CODE

                    //+++++++++++++++++++++++++++Advice Changes with Employer Code

                    ChAdvice.Reset;
                    ChAdvice.SetCurrentkey("Account No.");
                    ChAdvice.SetRange(ChAdvice."Advice Date", CheckoffAdviceHeader."Start Date", CheckoffAdviceHeader."End Date");
                    //ChAdvice.SETRANGE("Member No.",'0166421');
                    ChAdvice.SetRange(ChAdvice."Employer Code", CheckoffAdviceHeader."Employer Code");
                    ChAdvice.SetRange("Advice Header No.", '');
                    ChAdvice.SetRange("System Created", false);
                    //ChAdvice.SETRANGE(Processed,FALSE);
                    if ChAdvice.Find('-') then begin
                        repeat
                            /* Employer.RESET;
                             Employer.SETRANGE(Employer."No.",ChAdvice."Employer Code");
                             Employer.SETRANGE(Employer."Advice Method",Employer."Advice Method"::Changes);
                             IF Employer.FIND('-') THEN BEGIN*/
                            //   intProgressTotal:=intProgressTotal+ChAdvice.COUNT;

                            //ChAdvice."Advice Header No.":=CheckoffAdviceHeader."No.";
                            //ChAdvice.MODIFY;
                            iEntryNo := 0;
                            CheckoffAdvice.Reset;
                            if CheckoffAdvice.Find('+') then
                                iEntryNo := CheckoffAdvice."Entry No" + 1;

                            /*CheckoffAdvice.RESET;
                            CheckoffAdvice.SETRANGE("Member No.",ChAdvice."Member No.");
                            CheckoffAdvice.SETRANGE("Product Type",ChAdvice."Product Type");
                            IF CheckoffAdvice.FIND('-') THEN BEGIN
                              REPEAT
                              IF CheckoffAdvice."Advice Header No."<>'' THEN BEGIN
                                CheckoffAdvice2.RESET;
                                CheckoffAdvice2.SETRANGE("Member No.",CheckoffAdvice."Member No.");
                                CheckoffAdvice2.SETRANGE("Product Type",CheckoffAdvice."Product Type");
                                IF CheckoffAdvice2.FIND('-') THEN BEGIN
                                  REPEAT
                                  IF CheckoffAdvice2."Advice Header No."='' THEN
                                    CheckoffAdvice2.DELETEALL;
                                  UNTIL CheckoffAdvice2.NEXT=0;
                                  END;
                                END;
                              UNTIL CheckoffAdvice.NEXT=0;
                              END;*/

                            // MESSAGE('%1 Lona No',ChAdvice."Loan No.");

                            CheckoffAdvice.Reset;
                            CheckoffAdvice.SetRange("Advice Header No.", "No.");
                            CheckoffAdvice.SetRange("Member No.", ChAdvice."Member No.");
                            CheckoffAdvice.SetRange("Product Type", ChAdvice."Product Type");
                            CheckoffAdvice.SetRange("Advice Date", CheckoffAdviceHeader."Start Date", CheckoffAdviceHeader."End Date");
                            CheckoffAdvice.SetRange("System Created", true);
                            CheckoffAdvice.SetRange("Loan No.", ChAdvice."Loan No.");
                            if not CheckoffAdvice.Find('-') then begin
                                // MESSAGE('%1',ChAdvice."Loan No.");
                                CheckoffAdvice.Init;
                                CheckoffAdvice."Entry No" := iEntryNo;
                                CheckoffAdvice."Advice Header No." := CheckoffAdviceHeader."No.";
                                CheckoffAdvice."Account No." := ChAdvice."Account No.";
                                CheckoffAdvice."Member No." := ChAdvice."Member No.";
                                CheckoffAdvice."Employer Account No." := ChAdvice."Employer Account No.";
                                //ChAdvice.VALIDATE(ChAdvice."Member No.");
                                CheckoffAdvice."Amount On" := ChAdvice."Amount On";
                                CheckoffAdvice."Amount Off" := ChAdvice."Amount Off";
                                CheckoffAdvice."Loan No." := ChAdvice."Loan No.";
                                CheckoffAdvice."Balance Off" := ChAdvice."Balance Off";
                                CheckoffAdvice."Balance On" := ChAdvice."Balance On";
                                CheckoffAdvice."Advice Method" := ChAdvice."Advice Method";
                                CheckoffAdvice."Advice Date" := ChAdvice."Advice Date";
                                CheckoffAdvice."Employer Code" := ChAdvice."Employer Code";
                                CheckoffAdvice.Names := ChAdvice.Names;
                                CheckoffAdvice."System Created" := true;
                                CheckoffAdvice."ID No." := ChAdvice."ID No.";
                                CheckoffAdvice."Advice Type" := ChAdvice."Advice Type";
                                CheckoffAdvice."Product Type" := ChAdvice."Product Type";
                                CheckoffAdvice."Payroll No" := ChAdvice."Payroll No";
                                CheckoffAdvice.Type := ChAdvice.Type;
                                CheckoffAdvice."Captured  By" := UserId;
                                CheckoffAdvice."Employer Account No." := ChAdvice."Employer Account No.";
                                CheckoffAdvice.Period := ChAdvice.Period;
                                CheckoffAdvice.Insert;
                            end;
                            CheckoffAdvice.Reset;
                            CheckoffAdvice.SetRange("Advice Header No.", "No.");
                            CheckoffAdvice.SetRange("Member No.", ChAdvice."Member No.");
                            CheckoffAdvice.SetRange("Product Type", ChAdvice."Product Type");
                            CheckoffAdvice.SetRange("Advice Date", CheckoffAdviceHeader."Start Date", CheckoffAdviceHeader."End Date");
                            CheckoffAdvice.SetRange("Loan No.", ChAdvice."Loan No.");
                            CheckoffAdvice.SetRange("System Created", true);
                            if CheckoffAdvice.Find('-') then begin
                                CheckoffAdvice.DeleteAll;
                                //    MESSAGE('Lona %1',ChAdvice."Loan No.");

                                // MESSAGE('%1',CheckoffAdvice."Entry No");
                                CheckoffAdvice.Init;
                                CheckoffAdvice."Entry No" := iEntryNo;
                                CheckoffAdvice."Advice Header No." := CheckoffAdviceHeader."No.";
                                CheckoffAdvice."Account No." := ChAdvice."Account No.";
                                CheckoffAdvice."Member No." := ChAdvice."Member No.";
                                CheckoffAdvice."Employer Account No." := ChAdvice."Employer Account No.";
                                //ChAdvice.VALIDATE(ChAdvice."Member No.");
                                CheckoffAdvice."Amount On" := ChAdvice."Amount On";
                                CheckoffAdvice."Amount Off" := ChAdvice."Amount Off";
                                CheckoffAdvice."Loan No." := ChAdvice."Loan No.";
                                CheckoffAdvice."Balance Off" := ChAdvice."Balance Off";
                                CheckoffAdvice."Balance On" := ChAdvice."Balance On";
                                CheckoffAdvice."Advice Method" := ChAdvice."Advice Method";
                                CheckoffAdvice."Advice Date" := ChAdvice."Advice Date";
                                CheckoffAdvice."Employer Code" := ChAdvice."Employer Code";
                                CheckoffAdvice.Names := ChAdvice.Names;
                                CheckoffAdvice."ID No." := ChAdvice."ID No.";
                                CheckoffAdvice."Advice Type" := ChAdvice."Advice Type";
                                CheckoffAdvice."Product Type" := ChAdvice."Product Type";
                                CheckoffAdvice."Payroll No" := ChAdvice."Payroll No";
                                CheckoffAdvice.Type := ChAdvice.Type;
                                CheckoffAdvice."System Created" := true;
                                CheckoffAdvice."Captured  By" := UserId;
                                CheckoffAdvice."Employer Account No." := ChAdvice."Employer Account No.";
                                CheckoffAdvice.Period := ChAdvice.Period;
                                CheckoffAdvice.Insert;
                            end;
                        //ChAdvice.Transfered:=TRUE;
                        //ChAdvice.MODIFY;
                        until ChAdvice.Next = 0;
                    end;
                end;
            end;
            //++++++++++++++++++++Advide Changes with Employer CODE======

        end;

    end;


    procedure CheckoffValidate(CheckoffBuffer: Record 52185821)
    var
        Buffer: Record 52185821;
        Loans: Record 52185729;
        SAccount: Record 52185730;
        LAccount: Record 52185731;
        Memb: Record 52185700;
        PFactory: Record 52185690;
        SavingsAccounts: Record 52185730;
        Txt0000: label 'Enter either the Id No,Payroll No or Member No before validating';
        intProgressTotal: Integer;
        diaProgress: Dialog;
        intProgressI: Integer;
        intProgress: Integer;
        TimeProgress: Time;
        NoOfProgressed: Integer;
        NoOfRecsProgress: Integer;
        Txt0001: label 'This buffer contains %1 record(s) not validated';
        ProductIDCode: Code[10];
        Members: Record 52185700;
    begin
        //Buffer.COUNT;

        //Creating Progress Bar------------------------------------
        intProgressTotal := Buffer.Count;
        diaProgress.Open(Genrating + '@1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@', intProgress);
        intProgressI := 0;
        TimeProgress := Time;
        NoOfRecsProgress := intProgressTotal DIV 100;
        NoOfProgressed := 0;

        //Creating Progress Bar-------------------------------------


        Buffer.Reset;
        Buffer.SetRange(Buffer."Checkoff No", CheckoffBuffer."Checkoff No");
        //Buffer.SETRANGE(No,'19');
        if Buffer.Find('-') then begin
            repeat
                //Progress-------------------------------
                intProgressI += 1;
                if (intProgressI >= NoOfRecsProgress) or (Time - TimeProgress > 1000) then begin
                    NoOfProgressed := NoOfProgressed + intProgressI;
                    diaProgress.Update(1, ROUND(NoOfProgressed / intProgressTotal * 10000, 1));
                    intProgressI := 0;
                    TimeProgress := Time;
                end;
                //Progress------------------------------


                // IF (Buffer.Payroll='') AND (Buffer."Member No."='') AND (Buffer."ID No."='') THEN
                if (Buffer."Upload No." = '') and (Buffer."Upload Response" <> 0) then
                    Error(Txt0000);

                ///Filling the Details
                if Buffer."Upload Response" = 2 then begin
                    Memb.Reset;
                    Memb.SetRange(Memb."No.", Buffer."Upload No.");
                    //Memb.SETRANGE(Status,Memb.Status::Active);
                    if Memb.Find('-') then begin
                        Buffer.Name := Memb.Name;
                        Buffer.Payroll := Memb."Payroll/Staff No.";
                        Buffer."Employer Code" := Memb."Employer Code";
                        Buffer."ID No." := Memb."ID No.";
                        Buffer."Member No." := Memb."No.";
                        Buffer."Not Found" := false;
                    end else
                        Buffer."Not Found" := true;
                end else
                    if Buffer."Upload Response" = 1 then begin
                        Buffer.TestField("Employer Code");
                        Memb.Reset;
                        Memb.SetRange(Memb."Payroll/Staff No.", Buffer."Upload No.");
                        Memb.SetRange("Employer Code", Buffer."Employer Code");
                        //Memb.SETRANGE(Status,Memb.Status::Active);
                        if Memb.Find('-') then begin
                            Buffer.Name := Memb.Name;
                            Buffer."Member No." := Memb."No.";
                            //Buffer."Employer Code":=Memb."Employer Code";
                            Buffer.Payroll := Memb."Payroll/Staff No.";
                            Buffer."ID No." := Memb."ID No.";
                            Buffer."Not Found" := false;
                            //Buffer.MODIFY;
                        end else
                            Buffer."Not Found" := true;
                    end else
                        if Buffer."Upload Response" = 3 then begin
                            Memb.Reset;
                            Memb.SetRange(Memb."ID No.", Buffer."Upload No.");
                            //Memb.SETRANGE(Status,Memb.Status::Active);
                            if Memb.Find('-') then begin
                                Buffer.Name := Memb.Name;
                                Buffer."Member No." := Memb."No.";
                                Buffer."Employer Code" := Memb."Employer Code";
                                Buffer.Payroll := Memb."Payroll/Staff No.";
                                Buffer."ID No." := Memb."ID No.";
                                Buffer."Not Found" := false;
                                //Buffer.MODIFY;
                            end else
                                Buffer."Not Found" := true;
                        end;

                //Buffer.MODIFY;
                //-------Start Product Search;
                if Buffer."Search Code" <> '' then begin
                    PFactory.Reset;
                    PFactory.SetRange(PFactory."Search Code", Buffer."Search Code");
                    if PFactory.Find('-') then begin
                        if PFactory."Product Class Type" = PFactory."product class type"::Loan then begin
                            Loans.Reset;
                            Loans.SetFilter(Loans."Outstanding Balance", '>0');
                            Loans.SetRange(Loans."Member No.", Buffer."Member No.");
                            Loans.SetRange("Dummy Appraisal", false);
                            Loans.SetRange(Loans."Loan Product Type", PFactory."Product ID");
                            if Loans.Find('-') then begin
                                repeat
                                    Buffer."Loan No" := Loans."Loan No.";
                                    Buffer.Modify;
                                until Loans.Next = 0;
                            end;
                        end;

                        if PFactory."Product Class Type" = PFactory."product class type"::Savings then begin
                            SavingsAccounts.Reset;
                            SavingsAccounts.SetRange(SavingsAccounts."Product Type", PFactory."Product ID");
                            SavingsAccounts.SetRange(SavingsAccounts."Member No.", Buffer."Member No.");
                            if SavingsAccounts.Find('-') then begin
                                Buffer."Savings Account" := true;
                                Buffer."Account No" := SavingsAccounts."No.";
                            end;
                        end;
                    end;
                end;
                //------------------------------------------+++++
                //++++++++++++++++++Type
                // ProductIDCode:='';
                PFactory.Reset;
                PFactory.SetRange("Product Class Type", PFactory."product class type"::Savings);
                if PFactory.Find('-') then begin
                    repeat
                        if Buffer.Type = Buffer.Type::sShare then begin
                            if PFactory."Product Category" = PFactory."product category"::"Deposit Contribution" then begin
                                ProductIDCode := PFactory."Product ID";
                                SavingsAccounts.Reset;
                                SavingsAccounts.SetRange(SavingsAccounts."Product Type", PFactory."Product ID");
                                SavingsAccounts.SetRange(SavingsAccounts."Member No.", Buffer."Member No.");
                                if SavingsAccounts.Find('-') then begin
                                    Buffer."Savings Account" := true;
                                    Buffer."Account No" := SavingsAccounts."No.";
                                end;
                            end;
                            if Members.Get(Buffer."Member No.") then begin
                                if (Members.Status = Members.Status::Closed) or (Members.Status = Members.Status::Withdrawn) or (Members.Status = Members.Status::"Withdrawn Shareholder") then begin
                                    SavingsAccounts.Reset;
                                    SavingsAccounts.SetRange(SavingsAccounts."Product Category", SavingsAccounts."product category"::"Unallocated Fund");
                                    SavingsAccounts.SetRange(SavingsAccounts."Member No.", Buffer."Member No.");
                                    if SavingsAccounts.Find('-') then begin
                                        Buffer."Savings Account" := true;
                                        Buffer."Account No" := SavingsAccounts."No.";
                                    end;
                                end;
                            end;
                        end;
                        if Buffer.Type = Buffer.Type::wCont then begin
                            if PFactory."Product Category" = PFactory."product category"::Benevolent then begin
                                ProductIDCode := PFactory."Product ID";

                                ProductIDCode := PFactory."Product ID";
                                SavingsAccounts.Reset;
                                SavingsAccounts.SetRange(SavingsAccounts."Product Type", PFactory."Product ID");
                                SavingsAccounts.SetRange(SavingsAccounts."Member No.", Buffer."Member No.");
                                if SavingsAccounts.Find('-') then begin
                                    Buffer."Savings Account" := true;
                                    Buffer."Account No" := SavingsAccounts."No.";
                                end;
                            end;
                            if Members.Get(Buffer."Member No.") then begin
                                if (Members.Status = Members.Status::Closed) or (Members.Status = Members.Status::Withdrawn) or (Members.Status = Members.Status::"Withdrawn Shareholder") then begin
                                    SavingsAccounts.Reset;
                                    SavingsAccounts.SetRange(SavingsAccounts."Product Category", SavingsAccounts."product category"::"Unallocated Fund");
                                    SavingsAccounts.SetRange(SavingsAccounts."Member No.", Buffer."Member No.");
                                    if SavingsAccounts.Find('-') then begin
                                        Buffer."Savings Account" := true;
                                        Buffer."Account No" := SavingsAccounts."No.";
                                    end;
                                end;
                            end;
                        end;
                        if Buffer.Type = Buffer.Type::sJoining then begin
                            if PFactory."Product Category" = PFactory."product category"::"Registration Fee" then begin
                                ProductIDCode := PFactory."Product ID";
                                SavingsAccounts.Reset;
                                SavingsAccounts.SetRange(SavingsAccounts."Product Type", PFactory."Product ID");
                                SavingsAccounts.SetRange(SavingsAccounts."Member No.", Buffer."Member No.");
                                if SavingsAccounts.Find('-') then begin
                                    Buffer."Savings Account" := true;
                                    Buffer."Account No" := SavingsAccounts."No.";
                                end;
                            end;
                        end;
                        if Buffer.Type = Buffer.Type::Investment then begin
                            if PFactory."Product Category" = PFactory."product category"::"Investment Account" then begin
                                ProductIDCode := PFactory."Product ID";
                                SavingsAccounts.Reset;
                                SavingsAccounts.SetRange(SavingsAccounts."Product Type", PFactory."Product ID");
                                SavingsAccounts.SetRange(SavingsAccounts."Member No.", Buffer."Member No.");
                                if SavingsAccounts.Find('-') then begin
                                    Buffer."Savings Account" := true;
                                    Buffer."Account No" := SavingsAccounts."No.";
                                end;
                            end;
                        end;
                        if Buffer.Type = Buffer.Type::wLoan then begin
                            if PFactory."Product Category" = PFactory."product category"::"Share Capital" then begin
                                ProductIDCode := PFactory."Product ID";
                                SavingsAccounts.Reset;
                                SavingsAccounts.SetRange(SavingsAccounts."Product Type", PFactory."Product ID");
                                SavingsAccounts.SetRange(SavingsAccounts."Member No.", Buffer."Member No.");
                                if SavingsAccounts.Find('-') then begin
                                    Buffer."Savings Account" := true;
                                    Buffer."Account No" := SavingsAccounts."No.";
                                end;
                            end;
                        end;
                    until PFactory.Next = 0;
                end;
                //END;
                //END;
                ///-----End Product Search
                if Buffer."Savings Account" = false then begin
                    if Loans.Get(Buffer."Loan No") then begin
                        Buffer."Account No" := Loans."Loan Account";
                        Buffer."Credit Account" := true;
                    end else begin
                        Loans.Reset;
                        Loans.SetRange("Employer Loan No.", Buffer."Loan No");
                        Loans.SetRange("Dummy Appraisal", false);
                        Loans.SetRange("Member No.", Buffer."Member No.");
                        if Loans.Find('-') then begin
                            Buffer."Loan No" := Loans."Loan No.";
                            Buffer."Account No" := Loans."Loan Account";
                            Buffer."Credit Account" := true;
                        end else begin
                            if Buffer."Savings Account" = false then
                                Buffer."Not Found" := true
                            else
                                Buffer."Not Found" := false;
                        end;
                    end;
                end;
                if Members.Get(Buffer."Member No.") then begin
                    if Members.Status = Members.Status::New then begin
                        Members.Status := Members.Status::Active;
                    end;
                    if Members.Type = Members.Type::"Re-joining" then begin
                        Members.Status := Members.Status::Active;
                    end;
                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange("Member No.", Members."No.");
                    if SavingsAccounts.Find('-') then begin
                        repeat
                            if SavingsAccounts.Status = SavingsAccounts.Status::New then begin
                                SavingsAccounts.Status := SavingsAccounts.Status::Active;
                                SavingsAccounts.Blocked := SavingsAccounts.Blocked::" ";
                                SavingsAccounts.Modify;
                            end;
                        until SavingsAccounts.Next = 0;
                    end;

                    Members.Modify;
                end;
                Buffer.Modify;
            until Buffer.Next = 0;
        end;


        diaProgress.Close;
        Buffer.Reset;
        Buffer.SetRange("Not Found", true);
        if Buffer.Find('-') then
            if Buffer.Count > 0 then
                Message(Txt0001, Buffer.Count);
    end;


    procedure GenerateCheckoff(checkoffHeader: Record 52185819)
    var
        CheckoffLines: Record 52185820;
        CheckoffBuffer: Record 52185821;
        Members: Record 52185700;
        CheckoffBuffer2: Record 52185821;
        EntryNo: Integer;
        CheckoffLines2: Record 52185820;
        Err0001: label 'There are records that have not been Validated';
        Loans: Record 52185729;
        SavingsAccounts: Record 52185730;
    begin

        //Delete Entries
        CheckoffLines.Reset;
        CheckoffLines.SetRange(CheckoffLines."Checkoff Header", checkoffHeader."No.");
        if CheckoffLines.Find('-') then
            CheckoffLines.DeleteAll;
        //delete Entries

        CheckoffBuffer.Reset;
        CheckoffBuffer.SetRange("Member No.", '');
        CheckoffBuffer.SetRange("Checkoff No", checkoffHeader."No.");
        if CheckoffBuffer.FindFirst then
            Error(Err0001);

        CheckoffBuffer.Reset;
        CheckoffBuffer.SetRange(CheckoffBuffer."Checkoff No", checkoffHeader."No.");
        if CheckoffBuffer.Find('-') then begin
            repeat
                // CheckoffBuffer.TESTFIELD(CheckoffBuffer."Search Code");
                // CheckoffBuffer.TESTFIELD(CheckoffBuffer."Employer Code");
                // CheckoffBuffer.TESTFIELD(CheckoffBuffer."Member No.");
                Members.Reset;
                Members.SetRange(Members."No.", CheckoffBuffer."Member No.");
                if Members.Find('-') then begin
                    CheckoffBuffer2.Reset;
                    CheckoffBuffer2.SetRange(CheckoffBuffer2."Checkoff No", CheckoffBuffer."Checkoff No");
                    CheckoffBuffer2.SetRange(CheckoffBuffer2.No, CheckoffBuffer.No);
                    CheckoffBuffer2.SetRange(CheckoffBuffer2."Member No.", Members."No.");
                    if CheckoffBuffer2.Find('-') then begin
                        // REPEAT
                        CheckoffLines.Reset;
                        CheckoffLines.SetRange(CheckoffLines."Checkoff Header", CheckoffBuffer2."Checkoff No");
                        CheckoffLines.SetRange(CheckoffLines."Member No.", CheckoffBuffer2."Member No.");
                        CheckoffLines.SetRange(CheckoffLines.Multiple, false);
                        if CheckoffLines.Find('-') then begin

                            CheckoffLines.Amount := CheckoffLines.Amount + CheckoffBuffer2.Amount + CheckoffBuffer2.Interest;
                            CheckoffLines.Modify;
                        end else begin

                            EntryNo := 1;
                            CheckoffLines2.Reset;
                            CheckoffLines2.SetRange(CheckoffLines2."Checkoff Header", CheckoffBuffer2."Checkoff No");
                            if CheckoffLines2.Find('+') then
                                EntryNo := CheckoffLines2."Entry No" + 1;

                            CheckoffLines.Init;
                            CheckoffLines."Entry No" := EntryNo;
                            CheckoffLines.Amount := CheckoffBuffer2.Amount + CheckoffBuffer2.Interest;
                            CheckoffLines."Account No." := CheckoffBuffer2."Account No";
                            //IF CheckoffBuffer2."Account No"<>'' THEN
                            CheckoffLines.Multiple := true;
                            CheckoffLines."Loan No." := CheckoffBuffer2."Loan No";
                            CheckoffLines."Payroll No." := CheckoffBuffer2.Payroll;
                            CheckoffLines."ID Number" := CheckoffBuffer2."ID No.";
                            CheckoffLines."Member No." := CheckoffBuffer2."Member No.";
                            CheckoffLines."Savings Account" := CheckoffBuffer2."Savings Account";
                            CheckoffLines."Credit Account" := CheckoffBuffer2."Credit Account";
                            CheckoffLines."Checkoff Header" := CheckoffBuffer2."Checkoff No";
                            CheckoffLines.Type := CheckoffBuffer.Type;
                            CheckoffLines.Name := CheckoffBuffer2.Name;
                            CheckoffLines."Payroll No." := CheckoffBuffer2.Payroll;
                            CheckoffLines."Employer Code" := CheckoffBuffer2."Employer Code";
                            CheckoffLines.Insert;
                        end;
                    end;
                end else begin
                    EntryNo := 1;
                    CheckoffLines2.Reset;
                    CheckoffLines2.SetRange(CheckoffLines2."Checkoff Header", CheckoffBuffer."Checkoff No");
                    if CheckoffLines2.Find('+') then
                        EntryNo := CheckoffLines2."Entry No" + 1;

                    CheckoffLines.Init;
                    CheckoffLines."Entry No" := EntryNo;
                    CheckoffLines.Amount := CheckoffBuffer.Amount + CheckoffBuffer.Interest;
                    CheckoffLines."Account No." := CheckoffBuffer."Account No";
                    //IF CheckoffBuffer."Account No"<>'' THEN
                    CheckoffLines.Multiple := true;
                    CheckoffLines."Loan No." := CheckoffBuffer."Loan No";
                    CheckoffLines."Payroll No." := CheckoffBuffer."Upload No.";//CheckoffBuffer.Payroll;
                    CheckoffLines."ID Number" := CheckoffBuffer."ID No.";
                    CheckoffLines."Member No." := CheckoffBuffer."Member No.";
                    CheckoffLines."Savings Account" := CheckoffBuffer."Savings Account";
                    CheckoffLines."Credit Account" := CheckoffBuffer."Credit Account";
                    CheckoffLines."Checkoff Header" := CheckoffBuffer."Checkoff No";
                    CheckoffLines.Name := CheckoffBuffer.Name;
                    CheckoffLines.Type := CheckoffBuffer.Type;
                    //CheckoffLines."Payroll No.":=CheckoffBuffer.Payroll;
                    CheckoffLines.Insert;
                end;

                //Employer Balance Update
                if Loans.Get(CheckoffBuffer."Loan No") then begin
                    if CheckoffBuffer.Type = CheckoffBuffer.Type::sLoan then
                        Loans."Employer Balance" := CheckoffBuffer.Balance;
                    Loans.Modify;
                end;

                if SavingsAccounts.Get(CheckoffBuffer."Account No") then begin
                    SavingsAccounts."Employer Balance" := CheckoffBuffer.Balance;
                    SavingsAccounts."Monthly Contribution" := CheckoffBuffer.Amount;
                    SavingsAccounts.Modify;
                end;

            until CheckoffBuffer.Next = 0;
        end;
    end;


    procedure PostCheckoff(CheckoffHeader: Record 52185819)
    var
        Loans: Record 52185729;
        CheckoffLines: Record 52185820;
        RunBal: Decimal;
        LineNo: Integer;
        GenJournalLine: Record "Gen. Journal Line";
        Txt0000: label 'Loan Repayment';
        CreditAccounts: Record 52185731;
        Txt0001: label 'Interest Paid';
        Amortised: Decimal;
        Recovery: Decimal;
        Interest: Decimal;
        Txt0002: label 'Deposit Contribution';
        SavingsAccounts: Record 52185730;
        DepositCont: Decimal;
        Txt0003: label 'Excess Amount';
        LoanAmount: Decimal;
        Txt0004: label 'Checkoff schedule and amount is not equal';
        Txt0005: label 'Batch Posted successfully';
        Txt0006: label 'Principle Recovery';
        LoansBill: Record 52185729;
        Txt0007: label 'Loan Repayment -Bills';
        ProductF: Record 52185690;
        ShareCap: Decimal;
        PrdFac: Record 52185690;
        Txt0008: label 'Share Capital';
        ProgressWindow: Dialog;
        Dim1: Code[20];
        Dim2: Code[20];
        Members: Record 52185700;
        MemberCategory: Record 52185723;
        UserSetup: Record "User Setup";
        Txt0009: label 'Vendor:-';
        SavingsAcc: Code[20];
        Text010: label '<Month Text>';
        Text011: label 'Contribution';
        SavingsAccountsBlock: Record 52185730;
        CreditAccountsBlock: Record 52185731;
        DepositAccount: Record 52185730;
    begin

        CheckoffHeader.CalcFields(CheckoffHeader."Scheduled Amount");
        if ROUND(CheckoffHeader."Scheduled Amount", 0.01, '=') <> CheckoffHeader.Amount then
            Error(Txt0004);
        RunBal := 0;


        CheckoffHeader.CalcFields("Scheduled Amount");
        Temp.Get(UserId);

        Jtemplate := Temp."Check Off Template";
        JBatch := Temp."Check Off Batch";

        GenJournalLine.SetRange("Journal Template Name", Jtemplate);
        GenJournalLine.SetRange("Journal Batch Name", JBatch);
        GenJournalLine.DeleteAll;

        //MESSAGE('%1',JBatch);
        CheckoffLines.Reset;
        CheckoffLines.SetRange(CheckoffLines."Checkoff Header", CheckoffHeader."No.");
        CheckoffLines.SetRange(CheckoffLines.Posted, false);
        //CheckoffLines.SETRANGE(CheckoffLines."Entry No",1);
        if CheckoffLines.Find('-') then begin
            //Progress Window
            //**ProgressWindow.OPEN('Processing check for Member No. #1#######');
            repeat

                //Blocked Account
                SavingsAccountsBlock.Reset;
                SavingsAccountsBlock.SetRange("Member No.", CheckoffLines."Member No.");
                SavingsAccountsBlock.SetRange(Blocked, SavingsAccountsBlock.Blocked::All);
                if SavingsAccountsBlock.Find('-') then begin
                    repeat
                        SavingsAccountsBlock.Blocked := SavingsAccountsBlock.Blocked::" ";
                        SavingsAccountsBlock.Modify;
                    until SavingsAccountsBlock.Next = 0;
                end;

                CreditAccountsBlock.Reset;
                CreditAccountsBlock.SetRange("Member No.", CheckoffLines."Member No.");
                CreditAccountsBlock.SetRange(Blocked, CreditAccountsBlock.Blocked::All);
                if CreditAccountsBlock.Find('-') then begin
                    repeat
                        CreditAccountsBlock.Blocked := CreditAccountsBlock.Blocked::" ";
                        CreditAccountsBlock.Modify;
                    until CreditAccountsBlock.Next = 0;
                end;

                //**SLEEP(100);

                if DepositAccount.Get(CheckoffLines."Account No.") then begin
                    if Members.Get(CheckoffLines."Member No.") then begin
                        if (Members.Status = Members.Status::Dormant) or (Members.Status = Members.Status::New) then
                            Members.Status := Members.Status::Active;
                        Members.Modify;
                    end;
                end;


                //**ProgressWindow.UPDATE(1,CheckoffLines."Member No.");
                //**CheckoffLines.TESTFIELD(CheckoffLines."Member No.");
                RunBal := CheckoffLines.Amount;
                //Get Dimensions
                if Members.Get(CheckoffLines."Member No.") then begin
                    Dim1 := Members."Global Dimension 1 Code";
                    Dim2 := Members."Global Dimension 2 Code";
                end else begin
                    if UserSetup.Get(UserId) then begin
                        Dim1 := UserSetup."Global Dimension 1 Code";
                        Dim2 := UserSetup."Global Dimension 2 Code";
                    end;
                end;
                ///******Multiple Fasle
                if CheckoffLines.Multiple = false then begin
                    Loans.Reset;
                    Loans.SetCurrentkey(Loans."Recovery Priority");
                    Loans.SetFilter(Loans."Outstanding Balance", '>0');
                    Loans.SetRange(Loans."Member No.", CheckoffLines."Member No.");
                    Loans.SetRange("Dummy Appraisal", false);
                    Loans.SetRange(Loans."Recovery Mode", Loans."recovery mode"::Checkoff);
                    if Loans.Find('-') then begin
                        repeat
                            //*********************!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Repayment Methods other than Reducing Flat
                            if Loans."Interest Calculation Method" <> Loans."interest calculation method"::"Reducing Flat" then begin

                                if RunBal > 0 then begin
                                    Loans.CalcFields(Loans."Outstanding Interest", Loans."Outstanding Balance", Loans."Outstanding Bills");
                                    if Loans."Interest Calculation Method" = Loans."interest calculation method"::Amortised then
                                        Amortised := Loans.Repayment - Loans."Outstanding Balance" * Loans.Interest / 1200
                                    else
                                        Recovery := Loans.Repayment;

                                    if Loans."Outstanding Interest" > 0 then
                                        Interest := Loans."Outstanding Interest"
                                    else
                                        Interest := 0;
                                    //Loans."Outstanding Balance"*Loans.Interest/1200;
                                    Message('Interest %1\%2', Interest, Loans."Loan No.");
                                    //Interest *****************

                                    AcctType := Accttype::Credit;
                                    AccNo := Loans."Loan Account";
                                    TransType := Transtype::"Interest Paid";
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    Amt := 0;
                                    LineNo := LineNo + 10000;
                                    if Interest > 0 then begin
                                        if RunBal > Interest then begin
                                            if Interest > Loans."Outstanding Interest" then
                                                Amt := ROUND(Loans."Outstanding Interest", 1, '=') * -1
                                            else
                                                Amt := ROUND(Interest, 1, '=') * -1;
                                        end;
                                    end;
                                    if Amt <> 0 then
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                        Txt0001, Amt, AccNo, CheckoffHeader."Posting Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                    RunBal := RunBal - Abs(Amt);

                                    //Repayment**************
                                    Amt := 0;
                                    if Loans."Interest Calculation Method" = Loans."interest calculation method"::Amortised then begin
                                        if Amortised > 0 then begin
                                            if RunBal > Amortised then begin
                                                if Amortised > Loans."Outstanding Balance" then
                                                    Amt := (ROUND(Loans."Outstanding Balance", 1, '=') * -1)
                                                else
                                                    Amt := ROUND(Amortised, 1, '=') * -1;
                                            end;
                                        end;
                                    end else begin
                                        if Recovery > 0 then begin
                                            if RunBal > Recovery then begin
                                                if Recovery > Loans."Outstanding Balance" then
                                                    Amt := (ROUND(Loans."Outstanding Balance", 1, '=') * -1)
                                                else
                                                    Amt := ROUND(Recovery, 1, '=') * -1;
                                            end;
                                        end;

                                    end;

                                    AcctType := Accttype::Credit;
                                    TransType := Transtype::Repayment;
                                    LineNo := LineNo + 10000;

                                    if Amt <> 0 then
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                        Txt0000, Amt, AccNo, CheckoffHeader."Posting Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                    RunBal := RunBal - Abs(Amt);

                                    //Bills++++++++++++
                                    if ProductF.Get(Loans."Loan Product Type") then begin
                                        ProductF.TestField(ProductF."Billed Account");
                                        BalAccNo := ProductF."Billed Account";
                                    end;
                                    TransType := Transtype::Bills;
                                    LineNo := LineNo + 10000;
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                    Txt0007, Amt, Loans."Loan Account", CheckoffHeader."Posting Date", BalAccType,
                                    BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                    LoanAmount := LoanAmount - Abs(Amt);
                                    BalAccNo := '';
                                end;////*******************************End of other Repayment methods other than Reducing Flat
                                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1Reducing Flat Start Harambee
                            end else begin
                                if RunBal > 0 then begin
                                    Loans.CalcFields(Loans."Outstanding Interest", Loans."Outstanding Balance", Loans."Outstanding Bills");
                                    if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Reducing Flat" then
                                        Amortised := RunBal//(Loans."Approved Amount"/Loans.Installments) ////////-Loans."Outstanding Balance"*Loans.Interest/1200
                                    else
                                        Recovery := RunBal;//(Loans."Approved Amount"/Loans.Installments);//Loans.Repayment;

                                    if Loans."Outstanding Interest" > 0 then begin
                                        //Interest:=(Loans.Repayment)-(Loans."Approved Amount"/Loans.Installments)
                                        // Interest:=(Loans."Approved Amount"*(Loans.Interest/24)*(Loans.Installments+1))/(Loans.Installments*100) //***Constant Reducing Flat Interest
                                        if RunBal < Loans."Outstanding Balance" then
                                            Interest := Loans."Outstanding Balance" * (Loans.Interest / 1200) //***Constant Reducing Flat Interest
                                        else
                                            Interest := Loans."Outstanding Interest"

                                    end else
                                        Interest := 0;
                                    //Loans."Outstanding Balance"*Loans.Interest/1200;

                                    //Interest *****************

                                    AcctType := Accttype::Credit;
                                    AccNo := Loans."Loan Account";
                                    TransType := Transtype::"Interest Paid";
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    Amt := 0;
                                    LineNo := LineNo + 10000;
                                    if Interest > 0 then begin
                                        if RunBal > Interest then begin
                                            if Interest > Loans."Outstanding Interest" then
                                                Amt := ROUND(Loans."Outstanding Interest", 1, '=') * -1
                                            else
                                                Amt := ROUND(Interest, 1, '=') * -1;
                                        end;
                                    end;
                                    if Amt <> 0 then
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                        Txt0001, Amt, AccNo, CheckoffHeader."Posting Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                    RunBal := RunBal - Abs(Amt);

                                    //Repayment**************
                                    Amt := 0;
                                    if Loans."Interest Calculation Method" = Loans."interest calculation method"::Amortised then begin
                                        if Amortised > 0 then begin
                                            if RunBal >= Amortised then begin
                                                if Amortised > Loans."Outstanding Balance" then
                                                    Amt := (ROUND(Loans."Outstanding Balance") * -1)
                                                else
                                                    Amt := ROUND(Amortised, 1, '=') * -1;
                                            end;
                                        end;
                                    end else begin
                                        if Recovery > 0 then begin
                                            if RunBal > Recovery then begin
                                                if Recovery > Loans."Outstanding Balance" then
                                                    Amt := (ROUND(Loans."Outstanding Balance") * -1)
                                                else
                                                    Amt := ROUND(Recovery) * -1;
                                            end;
                                        end;

                                    end;

                                    AcctType := Accttype::Credit;
                                    TransType := Transtype::Repayment;
                                    LineNo := LineNo + 10000;

                                    if Amt <> 0 then
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                        Txt0000, Amt, AccNo, CheckoffHeader."Posting Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                    RunBal := RunBal - Abs(Amt);

                                    //Bills++++++++++++
                                    if ProductF.Get(Loans."Loan Product Type") then begin
                                        ProductF.TestField(ProductF."Billed Account");
                                        BalAccNo := ProductF."Billed Account";
                                    end;
                                    TransType := Transtype::Bills;
                                    LineNo := LineNo + 10000;
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                    Txt0007, Amt, Loans."Loan Account", CheckoffHeader."Posting Date", BalAccType,
                                    BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                    LoanAmount := LoanAmount - Abs(Amt);
                                    BalAccNo := '';
                                end;
                            end;
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1Reducing Flat End Harambee
                        until Loans.Next = 0;
                    end;


                    if RunBal > 0 then begin
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetCurrentkey(SavingsAccounts."Recovery Priority");
                        SavingsAccounts.SetRange(SavingsAccounts."Member No.", CheckoffLines."Member No.");
                        if SavingsAccounts.Find('-') then begin
                            repeat
                                if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Registration Fee" then begin

                                    //Registration Fee***************
                                    SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                                    ShareCap := 0;
                                    //Member Category
                                    if Members.Get(SavingsAccounts."Member No.") then begin
                                        if PrdFac.Get(SavingsAccounts."Product Type") then begin

                                            MemberCategory.Reset;
                                            MemberCategory.SetRange(MemberCategory."No.", Members."Member Category");
                                            if MemberCategory.Find('-') then begin
                                                ShareCap := MemberCategory."Registration Fee" - SavingsAccounts."Balance (LCY)";
                                                //**ShareCap:=PrdFac."Minimum Contribution"-SavingsAccounts."Balance (LCY)";
                                                if ShareCap > MemberCategory."Registration Fee" then
                                                    ShareCap := MemberCategory."Registration Fee"
                                                else
                                                    if ShareCap < 0 then
                                                        ShareCap := 0;
                                            end;

                                            AcctType := Accttype::Savings;
                                            TransType := Transtype::" ";
                                            LineNo := LineNo + 10000;
                                            if RunBal > ShareCap then
                                                Amt := ShareCap * -1
                                            else
                                                Amt := RunBal * -1;
                                            if Amt <> 0 then
                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                                Txt0008, Amt, SavingsAccounts."No.", CheckoffHeader."Posting Date", BalAccType,
                                                BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                            RunBal := RunBal - Abs(Amt);
                                            if Amt <> 0 then begin
                                                Members.Reset;
                                                Members.SetRange("No.", SavingsAccounts."Member No.");
                                                Members.SetFilter(Status, '%1', Members.Status::New);
                                                if Members.FindFirst then
                                                    if Members.Status <> Members.Status::Deceased then
                                                        Members.Status := Members.Status::Active;
                                                Members.Modify;
                                            end;
                                        end;
                                    end;

                                end else
                                    if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Share Capital" then begin
                                        //Share Capital***************
                                        SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                                        ShareCap := 0;
                                        if PrdFac.Get(SavingsAccounts."Product Type") then begin
                                            if Members.Get(SavingsAccounts."Member No.") then begin

                                                MemberCategory.Reset;
                                                MemberCategory.SetRange(MemberCategory."No.", Members."Member Category");
                                                if MemberCategory.Find('-') then begin

                                                    ShareCap := MemberCategory."Share Capital" - SavingsAccounts."Balance (LCY)";
                                                    if ShareCap > MemberCategory."Default Share Capital" then
                                                        ShareCap := MemberCategory."Default Share Capital"
                                                    else
                                                        if ShareCap < 0 then
                                                            ShareCap := 0;
                                                end;

                                                AcctType := Accttype::Savings;
                                                TransType := Transtype::" ";
                                                LineNo := LineNo + 10000;
                                                if RunBal > ShareCap then
                                                    Amt := ShareCap * -1
                                                else
                                                    Amt := RunBal * -1;
                                                if Amt <> 0 then
                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                                    Txt0008, Amt, SavingsAccounts."No.", CheckoffHeader."Posting Date", BalAccType,
                                                    BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                                RunBal := RunBal - Abs(Amt);
                                            end;
                                        end;

                                    end else
                                        if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Deposit Contribution" then begin

                                            //Deposit Contribution**********
                                            SavingsAcc := SavingsAccounts."No.";
                                            MemberCategory.Reset;
                                            MemberCategory.SetRange(MemberCategory."No.", Members."Member Category");
                                            if MemberCategory.Find('-') then begin
                                                if MemberCategory."Default Share Deposit" > SavingsAccounts."Monthly Contribution" then
                                                    DepositCont := MemberCategory."Default Share Deposit"
                                                else
                                                    DepositCont := SavingsAccounts."Monthly Contribution";

                                            end;
                                            if DepositCont = 0 then
                                                DepositCont := SavingsAccounts."Monthly Contribution";

                                            AcctType := Accttype::Savings;
                                            TransType := Transtype::" ";
                                            LineNo := LineNo + 10000;
                                            if RunBal > DepositCont then
                                                Amt := DepositCont * -1
                                            else
                                                Amt := RunBal * -1;

                                            if Amt <> 0 then
                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                                Txt0002, Amt, SavingsAccounts."No.", CheckoffHeader."Posting Date", BalAccType,
                                                BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                            RunBal := RunBal - Abs(Amt);

                                        end;
                            until SavingsAccounts.Next = 0;
                            //Excess Deposits

                            //Clear Arreas  **********Outstanding Bills
                            /*          IF RunBal>0 THEN BEGIN
                                       LoansBill.RESET;
                                       LoansBill.SETCURRENTKEY(LoansBill."Recovery Priority");
                                       LoansBill.SETFILTER(LoansBill."Outstanding Balance",'>0');
                                       LoansBill.SETRANGE(LoansBill."Member No.",CheckoffLines."Member No.");
                                       IF LoansBill.FIND('-') THEN BEGIN
                                         REPEAT
                                           LoansBill.CALCFIELDS(LoansBill."Outstanding Bills","Outstanding Balance");
                                           IF LoansBill."Outstanding Bills">0 THEN BEGIN

                                                Amt:=0;
                                                IF RunBal>LoansBill."Outstanding Bills" THEN
                                                 Amt:=LoansBill."Outstanding Bills"*-1
                                                 ELSE
                                                 Amt:=RunBal*-1;

                            //Repayment++++++++++++

                                             IF ProductF.GET(LoansBill."Loan Product Type") THEN BEGIN
                                              ProductF.TESTFIELD(ProductF."Billed Account");
                                               BalAccNo:=ProductF."Billed Account";
                                               END;
                                               TransType:=TransType::Repayment;
                                               LineNo:=LineNo+10000;

                                               JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,CheckoffHeader."Document No.",
                                               Txt0000,Amt,LoansBill."Loan Account",CheckoffHeader."Posting Date",BalAccType,
                                               BalAccNo,LoansBill."Loan No.",Dim1,Dim2,TransType,LoansBill."Loan No.",'','',0,'',0);
                                              // LoanAmount:=LoanAmount-ABS(Amt);
                                               BalAccNo:='';




                            //Bills++++++++++++
                                             IF ProductF.GET(LoansBill."Loan Product Type") THEN BEGIN
                                              ProductF.TESTFIELD(ProductF."Billed Account");
                                               BalAccNo:=ProductF."Billed Account";
                                               END;
                                               TransType:=TransType::Bills;
                                               LineNo:=LineNo+10000;
                                               JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,CheckoffHeader."Document No.",
                                               Txt0007,Amt,LoansBill."Loan Account",CheckoffHeader."Posting Date",BalAccType,
                                               BalAccNo,LoansBill."Loan No.",Dim1,Dim2,TransType,LoansBill."Loan No.",'','',0,'',0);
                                               RunBal:=RunBal-ABS(Amt);
                                               BalAccNo:='';
                                               END;
                                           UNTIL LoansBill.NEXT=0;
                                           END;
                                         END;*/
                            //End of Arreas++++++++++++

                            if RunBal > 0 then begin

                                if CheckoffLines."Member No." <> '' then begin
                                    //------------Unallocated Account

                                    SavingsAccounts.Reset;
                                    SavingsAccounts.SetRange(SavingsAccounts."Member No.", CheckoffLines."Member No.");
                                    SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Unallocated Fund");
                                    if SavingsAccounts.Find('-') then begin
                                        if LoanAmount > 0 then begin
                                            AcctType := Accttype::Savings;
                                            LineNo := LineNo + 10000;

                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                              Txt0003, RunBal * -1, SavingsAccounts."No.", CheckoffHeader."Posting Date", BalAccType,
                                              BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                            LoanAmount := 0;
                                        end;
                                    end;
                                    //----------------Deposits
                                    AcctType := Accttype::Savings;
                                    TransType := Transtype::" ";
                                    LineNo := LineNo + 10000;

                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                    Txt0003, RunBal * -1, SavingsAcc, CheckoffHeader."Posting Date", BalAccType,
                                    BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                end;
                            end;
                        end;
                    end;
                    if RunBal > 0 then begin
                        //Vendor Posting
                        if CheckoffLines."Member No." = '' then begin
                            CheckoffHeader.TestField("Vendor No");
                            //Credit Vendor
                            if RunBal > 0 then begin
                                AcctType := Accttype::Vendor;
                                TransType := Transtype::" ";
                                LineNo := LineNo + 10000;

                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                PadStr(CheckoffLines.Name + ' ' + CheckoffLines."Payroll No.", 50), RunBal * -1, CheckoffHeader."Vendor No", CheckoffHeader."Posting Date", BalAccType,
                                BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                            end;
                        end;
                    end;
                end else begin
                //     Mutipile TRUE
                //    LoanAmount := CheckoffLines.Amount;
                    //Savings Account
                    if CheckoffLines."Savings Account" = true then begin
                        AcctType := Accttype::Savings;
                        TransType := Transtype::" ";
                        LineNo := LineNo + 10000;
                        if CheckoffLines."Account No." <> '' then begin
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                              Format(CheckoffHeader."Posting Date", 0, Text010) + Text011 + '-' + CheckoffHeader."Employer Code", CheckoffLines.Amount * -1, CheckoffLines."Account No.", CheckoffHeader."Posting Date", BalAccType,
                              BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                            LoanAmount := 0;
                        end;
                    end;


                    //Credit Account
                    if CheckoffLines."Credit Account" = true then begin
                        //LoanAmount:=CheckoffLines.Amount;
                        Loans.Reset;
                        Loans.SetCurrentkey(Loans."Recovery Priority");
                        //Loans.SETFILTER(Loans."Outstanding Balance",'>0');
                        Loans.SetRange(Loans."Member No.", CheckoffLines."Member No.");
                        Loans.SetRange(Loans."Loan No.", CheckoffLines."Loan No.");
                        // Loans.SETRANGE(Loans."Recovery Mode",Loans."Recovery Mode"::Checkoff);
                        if Loans.Find('-') then begin

                            Loans.CalcFields(Loans."Outstanding Interest", Loans."Outstanding Balance", Loans."Outstanding Bills");
                            ///--------------------------------------------------------With Type option
                            //Interest
                            //##################################REDUCING NORMAL
                            if (Loans."Interest Calculation Method" <> Loans."interest calculation method"::"Reducing Flat") and
                            (Loans."Interest Calculation Method" <> Loans."interest calculation method"::Amortised) then begin
                                // MESSAGE('%1',Loans."Loan No.");
                                if CheckoffLines.Type <> CheckoffLines.Type::" " then begin
                                    if Loans."Outstanding Interest" > 0 then begin
                                        // IF CheckoffLines.Type=CheckoffLines.Type::sInterest THEN BEGIN ///Daisy  not to check type
                                        AcctType := Accttype::Credit;
                                        TransType := Transtype::"Interest Paid";
                                        LineNo := LineNo + 10000;
                                        BalAccNo := '';
                                        Amt := 0;
                                        if LoanAmount > Loans."Outstanding Interest" then
                                            Amt := Loans."Outstanding Interest" * -1
                                        else
                                            Amt := LoanAmount * -1;



                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                        Txt0001, Amt, CheckoffLines."Account No.", CheckoffHeader."Posting Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                        LoanAmount := LoanAmount - Abs(Amt);
                                    end;
                                    // END;
                                    //Repayment
                                    // IF CheckoffLines.Type=CheckoffLines.Type::sLoan THEN BEGIN///Daisy not to check type
                                    if Loans."Outstanding Balance" > 0 then begin
                                        AcctType := Accttype::Credit;
                                        TransType := Transtype::Repayment;
                                        LineNo := LineNo + 10000;
                                        BalAccNo := '';
                                        Amt := 0;
                                        if LoanAmount > Loans."Outstanding Balance" then
                                            Amt := ROUND(Loans."Outstanding Balance") * -1
                                        else
                                            Amt := ROUND(LoanAmount) * -1;

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                        Txt0000, Amt, CheckoffLines."Account No.", CheckoffHeader."Posting Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                        LoanAmount := LoanAmount - Abs(Amt);

                                        //Bills++++++++++++
                                        if ProductF.Get(Loans."Loan Product Type") then begin
                                            ProductF.TestField(ProductF."Billed Account");
                                            BalAccNo := ProductF."Billed Account"
                                        end;
                                        TransType := Transtype::Bills;
                                        AcctType := Accttype::Credit;

                                        LineNo := LineNo + 10000;
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                        Txt0007, Amt, Loans."Loan Account", CheckoffHeader."Posting Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                        //** LoanAmount:=LoanAmount-ABS(Amt);
                                        BalAccNo := '';
                                    end;
                                    // END;
                                    ///--------------------------------------------------------With Type option
                                end else begin
                                    ///--------------------------------------------------------Without Type option
                                    //Interest
                                    if Loans."Outstanding Interest" > 0 then begin
                                        AcctType := Accttype::Credit;
                                        TransType := Transtype::"Interest Paid";
                                        LineNo := LineNo + 10000;
                                        BalAccNo := '';
                                        Amt := 0;
                                        if LoanAmount > Loans."Outstanding Interest" then
                                            Amt := ROUND(Loans."Outstanding Interest") * -1
                                        else
                                            Amt := ROUND(LoanAmount) * -1;



                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                        Txt0001, Amt, CheckoffLines."Account No.", CheckoffHeader."Posting Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                        LoanAmount := LoanAmount - Abs(Amt);
                                    end;


                                    //Repayment
                                    if Loans."Outstanding Balance" > 0 then begin
                                        AcctType := Accttype::Credit;
                                        TransType := Transtype::Repayment;
                                        LineNo := LineNo + 10000;
                                        BalAccNo := '';
                                        Amt := 0;
                                        if LoanAmount > Loans."Outstanding Balance" then
                                            Amt := ROUND(Loans."Outstanding Balance") * -1
                                        else
                                            Amt := ROUND(LoanAmount) * -1;

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                        Txt0000, Amt, CheckoffLines."Account No.", CheckoffHeader."Posting Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                        LoanAmount := LoanAmount - Abs(Amt);

                                        //Bills++++++++++++
                                        if ProductF.Get(Loans."Loan Product Type") then begin
                                            ProductF.TestField(ProductF."Billed Account");
                                            BalAccNo := ProductF."Billed Account"
                                        end;
                                        TransType := Transtype::Bills;
                                        AcctType := Accttype::Credit;

                                        LineNo := LineNo + 10000;
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                        Txt0007, Amt, Loans."Loan Account", CheckoffHeader."Posting Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                        //*LoanAmount:=LoanAmount-ABS(Amt);
                                        BalAccNo := '';
                                    end;
                                end;

                            end else begin
                                ///##################################Reducing Flat
                                //  IF Loans."Interest Calculation Method"=Loans."Interest Calculation Method"::"Reducing Flat" THEN BEGIN
                                if (Loans."Interest Calculation Method" = Loans."interest calculation method"::"Reducing Flat") then begin
                                    Recovery := Loans."Outstanding Balance";//ROUND((Loans."Approved Amount"/Loans.Installments),0.05,'='); ////////-Loans."Outstanding Balance"*Loans.Interest/1200
                                                                            //Interest:=ROUND((Loans.Repayment)-(Loans."Approved Amount"/Loans.Installments),0.05,'=');
                                    if LoanAmount < Loans."Outstanding Balance" then
                                        Interest := ROUND(Loans."Outstanding Balance" * (Loans.Interest / 1200), 0.05, '=')
                                    else
                                        Interest := Loans."Outstanding Interest";

                                    //Interest:=ROUND((Loans."Approved Amount"*(Loans.Interest/24)*(Loans.Installments+1))/(Loans.Installments*100),0.05,'='); //***Constant Reducing Flat Interest
                                    if Interest < 0 then
                                        Interest := 0;
                                    if Recovery + Interest > LoanAmount then begin
                                        Recovery := LoanAmount - Interest;
                                        if Recovery < 0 then
                                            Recovery := LoanAmount;

                                        Interest := LoanAmount - Recovery;
                                        if Interest < 0 then
                                            Interest := 0;

                                    end;
                                end else
                                    if (Loans."Interest Calculation Method" = Loans."interest calculation method"::Amortised) then begin
                                        Recovery := Loans."Outstanding Balance";//Loans.Repayment;
                                        Interest := Loans."Outstanding Interest";
                                    end;

                                //MESSAGE('%1 and %2 and %3',Interest,LoanAmount,Recovery);
                                /*
                                                IF Loans."Outstanding Interest">0 THEN

                                                ELSE
                                                  Interest:=0;
                                               */

                                //Interest++++++++++++

                                if Interest > LoanAmount then
                                    Interest := LoanAmount;
                                if Loans."Outstanding Interest" > 0 then begin
                                    AcctType := Accttype::Credit;
                                    TransType := Transtype::"Interest Paid";
                                    LineNo := LineNo + 10000;
                                    BalAccNo := '';
                                    Amt := 0;
                                    if Interest > Loans."Outstanding Interest" then
                                        Amt := ROUND(Loans."Outstanding Interest") * -1
                                    else
                                        Amt := ROUND(Interest) * -1;

                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                    Txt0001, Amt, CheckoffLines."Account No.", CheckoffHeader."Posting Date", BalAccType,
                                    BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                    LoanAmount := LoanAmount - Abs(Amt);
                                end;
                                //Repayment++++++++
                                //IF Recovery>LoanAmount THEN
                                Recovery := LoanAmount;
                                if Loans."Outstanding Balance" > 0 then begin
                                    AcctType := Accttype::Credit;
                                    TransType := Transtype::Repayment;
                                    LineNo := LineNo + 10000;
                                    BalAccNo := '';
                                    Amt := 0;
                                    if Recovery > Loans."Outstanding Balance" then
                                        Amt := ROUND(Loans."Outstanding Balance" * -1)
                                    else
                                        Amt := Recovery * -1;

                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                    Txt0000, Amt, CheckoffLines."Account No.", CheckoffHeader."Posting Date", BalAccType,
                                    BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                    LoanAmount := LoanAmount - Abs(Amt);

                                    //Bills++++++++++++
                                    if ProductF.Get(Loans."Loan Product Type") then begin
                                        ProductF.TestField(ProductF."Billed Account");
                                        BalAccNo := ProductF."Billed Account"
                                    end;
                                    TransType := Transtype::Bills;
                                    AcctType := Accttype::Credit;

                                    LineNo := LineNo + 10000;
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                    Txt0007, Amt, Loans."Loan Account", CheckoffHeader."Posting Date", BalAccType,
                                    BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                    //** LoanAmount:=LoanAmount-ABS(Amt);
                                    BalAccNo := '';
                                end;
                                //End Reducing Flat
                            end;
                        end;
                        /*IF LoanAmount<0 THEN
                        LoanAmount:=LoanAmount*-1;*/
                        ///--------------------------------------------------------Without Type option
                        //Clear Arreas  **********Outstanding Bills
                        /*    IF LoanAmount<>0 THEN BEGIN
                             LoansBill.RESET;
                             LoansBill.SETCURRENTKEY(LoansBill."Recovery Priority");
                             LoansBill.SETFILTER(LoansBill."Outstanding Balance",'>0');
                             LoansBill.SETRANGE(LoansBill."Member No.",CheckoffLines."Member No.");
                             IF LoansBill.FIND('-') THEN BEGIN
                               REPEAT
                                 LoansBill.CALCFIELDS(LoansBill."Outstanding Bills","Outstanding Balance");
                                 IF LoansBill."Outstanding Bills">0 THEN BEGIN

                                      Amt:=0;
                                      IF LoanAmount>LoansBill."Outstanding Bills" THEN
                                       Amt:=LoansBill."Outstanding Bills"*-1
                                       ELSE
                                       Amt:=LoanAmount*-1;

                  //Repayment++++++++++++

                                   IF ProductF.GET(LoansBill."Loan Product Type") THEN BEGIN
                                    ProductF.TESTFIELD(ProductF."Billed Account");
                                     BalAccNo:='';//ProductF."Billed Account";
                                     END;
                                     TransType:=TransType::Repayment;
                                      AcctType:=AcctType::Credit;
                                     LineNo:=LineNo+10000;

                                     JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,CheckoffHeader."Document No.",
                                     Txt0007,Amt,LoansBill."Loan Account",CheckoffHeader."Posting Date",BalAccType,
                                     BalAccNo,LoansBill."Loan No.",Dim1,Dim2,TransType,LoansBill."Loan No.",'','',0,'',0);
                                    // LoanAmount:=LoanAmount-ABS(Amt);
                                     BalAccNo:='';




                  //Bills++++++++++++
                                   IF ProductF.GET(LoansBill."Loan Product Type") THEN BEGIN
                                    ProductF.TESTFIELD(ProductF."Billed Account");
                                     BalAccNo:=ProductF."Billed Account";
                                     END;
                                     TransType:=TransType::Bills;
                                      AcctType:=AcctType::Credit;
                                     LineNo:=LineNo+10000;
                                     JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,CheckoffHeader."Document No.",
                                     Txt0007,Amt,LoansBill."Loan Account",CheckoffHeader."Posting Date",BalAccType,
                                     BalAccNo,LoansBill."Loan No.",Dim1,Dim2,TransType,LoansBill."Loan No.",'','',0,'',0);
                                     LoanAmount:=LoanAmount-ABS(Amt);
                                     BalAccNo:='';
                                     END;
                                 UNTIL LoansBill.NEXT=0;
                                 END;
                               END;
                               */

                        //Excess Deposit
                        //------------Unallocated Account

                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange(SavingsAccounts."Member No.", CheckoffLines."Member No.");
                        SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Unallocated Fund");
                        if SavingsAccounts.Find('-') then begin
                            if LoanAmount > 0 then begin
                                AcctType := Accttype::Savings;
                                LineNo := LineNo + 10000;

                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                 Txt0003, LoanAmount * -1, SavingsAccounts."No.", CheckoffHeader."Posting Date", BalAccType,
                                 BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                LoanAmount := 0;

                            end;
                        end;

                        //-------------Deposits
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetCurrentkey(SavingsAccounts."Recovery Priority");
                        SavingsAccounts.SetRange(SavingsAccounts."Member No.", CheckoffLines."Member No.");
                        SavingsAccounts.SetRange(SavingsAccounts."Can Guarantee Loan", true);
                        if SavingsAccounts.Find('-') then begin
                            if LoanAmount > 0 then begin
                                AcctType := Accttype::Savings;
                                LineNo := LineNo + 10000;

                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                 Txt0003, LoanAmount * -1, SavingsAccounts."No.", CheckoffHeader."Posting Date", BalAccType,
                                 BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                            end;
                        end;

                    end else begin
                        if CheckoffLines."Savings Account" = false then begin
                            SavingsAccounts.Reset;
                            SavingsAccounts.SetRange(SavingsAccounts."Member No.", CheckoffLines."Member No.");
                            SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Unallocated Fund");
                            if SavingsAccounts.Find('-') then begin
                                if LoanAmount > 0 then begin
                                    AcctType := Accttype::Savings;
                                    LineNo := LineNo + 10000;

                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                                     Txt0003, LoanAmount * -1, SavingsAccounts."No.", CheckoffHeader."Posting Date", BalAccType,
                                     BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                    LoanAmount := 0;

                                end;
                            end;
                        end;
                    end;
                end;

                if LoanAmount > 0 then begin
                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange(SavingsAccounts."Member No.", CheckoffLines."Member No.");
                    SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Unallocated Fund");
                    if SavingsAccounts.Find('-') then begin
                        if LoanAmount > 0 then begin
                            AcctType := Accttype::Savings;
                            LineNo := LineNo + 10000;

                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                             Txt0003, LoanAmount * -1, SavingsAccounts."No.", CheckoffHeader."Posting Date", BalAccType,
                             BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                            LoanAmount := 0;
                        end;
                    end;
                end;
                ;

                //Customer Amount
                AcctType := Accttype::Customer;
                LineNo := LineNo + 10000;

                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, CheckoffHeader."Document No.",
                  CheckoffHeader.Description + '-' + CheckoffHeader."Employer Code", CheckoffLines.Amount, CheckoffHeader."Account No.", CheckoffHeader."Posting Date", BalAccType,
                  BalAccNo, '', Dim1, Dim2, 0, '', '', '', 0, '', 0);

                //Modify Lines
                //ERROR('Testing');
                JournalPosting.CompletePosting(Jtemplate, JBatch);

                CheckoffLines.Posted := true;
                CheckoffLines.Modify;


                Commit;

            until CheckoffLines.Next = 0;
        end;

        CheckoffHeader.Posted := true;
        CheckoffHeader.Modify;

        Message(Txt0005);

    end;


    procedure EmplyerSavingAdvice(SavingsAccounts: Record 52185730; OldAmount: Decimal; NewAmount: Decimal)
    var
        CheckoffAdvice: Record 52185818;
        iEntryNo: Integer;
        SavingsAccount: Record 52185730;
        MemberCategory: Record 52185723;
        ProductFactory: Record 52185690;
        Members: Record 52185700;
    begin
        //Advice Deposits Changes
        with SavingsAccounts
           do begin
            CalcFields("Balance (LCY)");
            iEntryNo := 0;
            CheckoffAdvice.Reset;
            if CheckoffAdvice.Find('+') then
                iEntryNo := CheckoffAdvice."Entry No" + 1;
            if Members.Get(SavingsAccounts."Member No.") then begin
                if MemberCategory.Get(Members."Member Category") then begin
                    if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Deposit Contribution" then
                        NewAmount := MemberCategory."Default Share Deposit";
                    if SavingsAccounts."Product Category" = SavingsAccounts."product category"::Benevolent then begin
                        if ProductFactory.Get("Product Type") then begin
                            NewAmount := ProductFactory."Minimum Contribution";
                        end;
                    end;
                end;

            end;

            if (SavingsAccounts.Status = SavingsAccounts.Status::Closed) or (SavingsAccounts.Status = SavingsAccounts.Status::New) then
                OldAmount := 0;

            CheckoffAdvice.Init;
            CheckoffAdvice."Entry No" := iEntryNo;
            CheckoffAdvice."Account No." := SavingsAccounts."No.";
            CheckoffAdvice."Member No." := SavingsAccounts."Member No.";
            CheckoffAdvice."Payroll No" := SavingsAccounts."Payroll/Staff No.";
            CheckoffAdvice.Validate(CheckoffAdvice."Member No.");
            CheckoffAdvice."Amount On" := NewAmount;
            CheckoffAdvice."Amount Off" := OldAmount;
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

            CheckoffAdvice."Advice Method" := CheckoffAdvice."advice method"::Changes;
            CheckoffAdvice."Advice Date" := Today;
            CheckoffAdvice."ID No." := SavingsAccounts."ID No.";
            CheckoffAdvice."Employer Code" := SavingsAccounts."Employer Code";
            CheckoffAdvice.Names := SavingsAccounts.Name;
            CheckoffAdvice."Product Type" := SavingsAccounts."Product Type";
            if NewAmount = OldAmount then
                CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Adjustment
            else
                CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Variations;
            if NewAmount = 0 then begin
                CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Stoppage;
                CheckoffAdvice."Balance Off" := SavingsAccount."Monthly Contribution";
            end else
                if "Balance (LCY)" = 0 then
                    CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::New;
            //**CheckoffAdvice.VALIDATE(CheckoffAdvice."Account No.");
            CheckoffAdvice.Validate(CheckoffAdvice."Product Type");
            if (CheckoffAdvice."Amount On" <> 0) or (CheckoffAdvice."Amount Off" <> 0) or (CheckoffAdvice."Balance On" <> 0) or (CheckoffAdvice."Advice Type" = CheckoffAdvice."advice type"::Stoppage) then
                CheckoffAdvice.Insert(true);
        end;

    end;


    procedure ProcessAdvice(CheckoffAdviceHeader: Record 52185822)
    var
        AdviceLine: Record 52185818;
    begin
        AdviceLine.Reset;
        AdviceLine.SetRange(AdviceLine."Advice Header No.", CheckoffAdviceHeader."No.");
        if AdviceLine.Find('-') then begin
            repeat
                AdviceLine.Processed := true;
                AdviceLine.Modify;
            until AdviceLine.Next = 0;
        end;

        AdviceLine.Reset;
        AdviceLine.SetRange(Transfered, true);
        if AdviceLine.Find('-') then begin
            repeat
                AdviceLine.Processed := true;
                AdviceLine.Modify;
            until AdviceLine.Next = 0;
        end;

        CheckoffAdviceHeader.Processed := true;
        CheckoffAdviceHeader.Modify;
        if CheckoffAdviceHeader.Processed = true then
            Message('Advice Processed Successfully');
    end;


    procedure LoanReschedule(LoanRescheduling: Record 52185823)
    var
        Loans: Record 52185729;
        LoanRepaymentSchedule: Record 52185738;
        LastCount: Integer;
        InPeriod: DateFormula;
        QCounter: Integer;
        LoanAmount: Decimal;
        InterestRate: Decimal;
        RepayPeriod: Integer;
        InitialInstal: Integer;
        LBalance: Decimal;
        RunDate: Date;
        InstalNo: Integer;
        TotalMRepay: Decimal;
        LInterest: Decimal;
        LPrincipal: Decimal;
        RepayCode: Code[10];
        LoanSch: Record 52185729;
        PaymentMethods: Record 52186122;
        PaymentMethodsApplication: Record 52186124;
    begin
        with LoanRescheduling do begin
            if Loans.Get(LoanRescheduling."Loan No.") then begin
                //Claer Reamaing Reschedule before creating the new Reschedule
                LoanRepaymentSchedule.Reset;
                LoanRepaymentSchedule.SetRange(LoanRepaymentSchedule."Loan No.", "Loan No.");
                LoanRepaymentSchedule.SetRange(LoanRepaymentSchedule."Repayment Date", "Rescheduling Date", 99991230D);
                if LoanRepaymentSchedule.Find('-') then begin
                    LoanRepaymentSchedule.DeleteAll;
                end;

                //Check last installment NO.

                LoanRepaymentSchedule.Reset;
                LoanRepaymentSchedule.SetRange(LoanRepaymentSchedule."Loan No.", "Loan No.");
                LoanRepaymentSchedule.SetRange(LoanRepaymentSchedule."Repayment Date", 0D, 99991230D);
                if LoanRepaymentSchedule.FindLast then begin
                    LastCount := LoanRepaymentSchedule."Instalment No";
                end;

                if Loans."Repayment Frequency" = Loans."repayment frequency"::Daily then
                    Evaluate(InPeriod, '1D')
                else
                    if Loans."Repayment Frequency" = Loans."repayment frequency"::Weekly then
                        Evaluate(InPeriod, '1W')
                    else
                        if Loans."Repayment Frequency" = Loans."repayment frequency"::Monthly then
                            Evaluate(InPeriod, '1M')
                        else
                            if Loans."Repayment Frequency" = Loans."repayment frequency"::Quarterly then
                                Evaluate(InPeriod, '1Q');

                QCounter := 0;
                QCounter := 3;


                TestField(LoanRescheduling."Rescheduling Date");

                LoanAmount := LoanRescheduling."Outstanding Balance";
                InterestRate := Loans.Interest;
                RepayPeriod := LoanRescheduling."New Installments";
                InitialInstal := LoanRescheduling."New Installments";
                LBalance := LoanRescheduling."Outstanding Balance";
                RunDate := LoanRescheduling."Rescheduling Date";

                InstalNo := LastCount;
                //Repayment Frequency
                if Loans."Repayment Frequency" = Loans."repayment frequency"::Daily then
                    RunDate := CalcDate('-1D', RunDate)
                else
                    if Loans."Repayment Frequency" = Loans."repayment frequency"::Weekly then
                        RunDate := CalcDate('-1W', RunDate)
                    else
                        if Loans."Repayment Frequency" = Loans."repayment frequency"::Monthly then
                            RunDate := CalcDate('-1M', RunDate)
                        else
                            if Loans."Repayment Frequency" = Loans."repayment frequency"::Quarterly then
                                RunDate := CalcDate('-1Q', RunDate);
                //Repayment Frequency


                repeat
                    InstalNo := InstalNo + 1;

                    //Repayment Frequency
                    if Loans."Repayment Frequency" = Loans."repayment frequency"::Daily then
                        RunDate := CalcDate('1D', RunDate)
                    else
                        if Loans."Repayment Frequency" = Loans."repayment frequency"::Weekly then
                            RunDate := CalcDate('1W', RunDate)
                        else
                            if Loans."Repayment Frequency" = Loans."repayment frequency"::Monthly then
                                RunDate := CalcDate('1M', RunDate)
                            else
                                if Loans."Repayment Frequency" = Loans."repayment frequency"::Quarterly then
                                    RunDate := CalcDate('1Q', RunDate);
                    //Repayment Frequency

                    if Loans."Interest Calculation Method" = Loans."interest calculation method"::Amortised then begin
                        Loans.TestField(Loans.Interest);
                        TestField("New Installments");
                        TotalMRepay := ROUND((InterestRate / 1200) / (1 - Power((1 + (InterestRate / 1200)), -(RepayPeriod))) * (LoanAmount), 0.0001, '>');
                        LInterest := ROUND(LBalance / 1200 * InterestRate, 0.0001, '>');
                        LPrincipal := TotalMRepay - LInterest;

                        //Update Reschedule
                        Loans.Repayment := LInterest + LPrincipal;

                    end;

                    if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Straight Line" then begin
                        Loans.TestField(Loans.Interest);
                        TestField("New Installments");
                        LPrincipal := LoanAmount / RepayPeriod;
                        LInterest := (InterestRate / 1200) * LoanAmount;

                        //Update Reschedule
                        Loans.Repayment := LPrincipal;

                    end;

                    if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Reducing Balance" then begin
                        Loans.TestField(Loans.Interest);
                        TestField("New Installments");
                        LPrincipal := LoanAmount / RepayPeriod;
                        LInterest := (InterestRate / 1200) * LBalance;

                        //Update Reschedue
                        Loans.Repayment := LPrincipal;
                    end;

                    if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Reducing Flat" then begin
                        Loans.TestField(Loans.Interest);
                        LPrincipal := ROUND(LoanAmount / RepayPeriod, 1.0, '>');
                        LInterest := ROUND(((LoanAmount * InterestRate / 12 / 100) + (LPrincipal * InterestRate / 12 / 100)) / 2, 1.0, '>');
                        Loans.Repayment := LPrincipal + LInterest;
                        if LBalance < Loans.Repayment then
                            LPrincipal := LBalance
                        else
                            LPrincipal := Loans.Repayment;
                        LInterest := Loans.Interest;

                        //Update Reschedule
                        Loans.Repayment := LPrincipal;

                    end;
                    //Loop the Balance
                    LBalance := LBalance - LPrincipal;

                    Evaluate(RepayCode, Format(InstalNo));

                    LoanRepaymentSchedule.Init;
                    LoanRepaymentSchedule."Repayment Code" := RepayCode;
                    LoanRepaymentSchedule."Loan No." := Loans."Loan No.";
                    LoanRepaymentSchedule."Loan Amount" := "Outstanding Balance";
                    LoanRepaymentSchedule."Instalment No" := InstalNo;
                    LoanRepaymentSchedule."Repayment Date" := RunDate;
                    LoanRepaymentSchedule."Member No." := "Member No.";
                    LoanRepaymentSchedule."Loan Category" := Loans."Loan Product Type";
                    LoanRepaymentSchedule."Monthly Repayment" := LInterest + LPrincipal;
                    LoanRepaymentSchedule."Monthly Interest" := LInterest;
                    LoanRepaymentSchedule."Principal Repayment" := LPrincipal;
                    LoanRepaymentSchedule."Reset Doc No." := "No.";
                    LoanRepaymentSchedule."Reset Schedule" := true;
                    LoanRepaymentSchedule.Insert;
                until LBalance < 1;

                Loans."New No. of Installment" := "New Installments";
                Loans."New Interest Rate" := Loans.Interest;
                Loans."Loan Rescheduled" := true;
                Loans."Date Rescheduled" := Today;
                Loans."Reschedule by" := UserId;
                Loans."Loan Balance at Rescheduling" := "Outstanding Balance";
                Loans."Last Advice Date" := Today;
                Loans."Advice Type" := Loans."advice type"::Adjustment;
                Loans.Validate(Loans.Repayment);
                Loans.Modify;

                "New Amortised" := LInterest + LPrincipal;
                Modify;
                Commit;

                //Run the Generated Schedule
                LoanSch.Reset;
                LoanSch.SetRange(LoanSch."Loan No.", Loans."Loan No.");
                if LoanSch.Find('-') then
                    Report.Run(52185730, true, false, LoanSch);









                Loans."New No. of Installment" := "New Installments";
                Loans."Loan Rescheduled" := true;
                Loans.Repayment := "New Amortised";
                Loans.Modify;

                LoanRescheduling.Rescheduled := true;
                LoanRescheduling."Date Commited" := Today;
                LoanRescheduling.Modify;
            end;
        end;
    end;


    procedure CheckSavingsAccountBal(ATMApplications: Record 52185850)
    var
        SavingsAccounts: Record 52185730;
        Account: Record 52185730;
        AvailableBalance: Decimal;
        MinBalance: Decimal;
        ProdType: Record 52185690;
        TChargeAmount: Decimal;
    begin
        AvailableBalance := 0;
        MinBalance := 0;
        TChargeAmount := 0;
        if Account.Get(ATMApplications."Account No") then begin
            Account.CalcFields(Account.Balance, Account."Uncleared Cheques", Account."Authorised Over Draft");

            ProdType.Reset;
            ProdType.SetRange(ProdType."Product ID", Account."Product Type");
            if ProdType.Find('-') then begin
                MinBalance := ProdType."Minimum Balance";

                AvailableBalance := (Account.Balance + Account."Authorised Over Draft") - (MinBalance + Account."Uncleared Cheques");
            end;
        end;
        Message('balance is %1', AvailableBalance);
    end;


    procedure PostATMApplicationCharges(ATMApplications: Record 52185850)
    var
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit,TreasuryTransactions,BSC,"Risk Claim",Delegate,Maint,TellerTransactions,ATMM,GeneralRepair,Saccotransffers,ImprestSurrender,"BL Opening","Risk Closure","Defaulter Recovery","Guarantors Subsitute",MPESAApp,MPESAChange;
        SavingsAccounts: Record 52185730;
        TChargeAmount: Decimal;
        TCharges: Decimal;
        TransactionCharges: Record 52185774;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        Trans: Record 52185776;
        GenSetup: Record 52185689;
        AccountTypes: Record 52185690;
        TransType: Record 52185773;
        JTemp: Code[20];
        JBatch: Code[20];
        BankingUserTemplate: Record 52185782;
        MSGPosted: label 'Posted Successfuly';
        ATMCharge: label 'Atm Card Charges';
        ATMCardTypes: Record 52185851;
        SendSMS: Codeunit SendSms;
        SavingsAcc: Record 52185730;
        Txt004: label 'Your ATM Card application has been received and is being processed.';
        CashierTransactions: Record 52185776;
    begin
        if ATMApplications."ATM Charges Applied" = true then Error('This account has already been applied ATM charges');
        if Confirm('Confirm ATM Charges?') then
            if ATMApplications."Request Type" = ATMApplications."request type"::New then begin
                // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                BankingUserTemplate.Get(UserId);
                JTemp := BankingUserTemplate."ATM Charges Journal Template";
                JBatch := BankingUserTemplate."ATM Charges Journal Batch";
                GenJournalLine.Reset;
                GenJournalLine.SetRange(GenJournalLine."Journal Template Name", JTemp);
                GenJournalLine.SetRange(GenJournalLine."Journal Batch Name", JBatch);
                GenJournalLine.DeleteAll;
                GenSetup.Get;
                ChargeAmount := 0;
                ATMCardTypes.Reset;
                ATMCardTypes.SetRange(ATMCardTypes.Code, ATMApplications."Card Type");
                if ATMCardTypes.Find('-') then begin
                    //   MESSAGE('here');
                    TransType.Reset;
                    TransType.SetRange(TransType.Code, ATMCardTypes."Application Charge Code");//TransType.Type::"ATM Applications");
                    if TransType.Find('-') then begin
                        ChargeAmount := 0;
                        TransactionCharges.Reset;
                        TransactionCharges.SetRange(TransactionCharges."Transaction Type", TransType.Code);
                        if TransactionCharges.Find('-') then begin
                            repeat
                                ChargeAmount := 0;
                                if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::Normal) or
                                (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::"Stamp Duty") then begin
                                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                                        ChargeAmount := TransactionCharges."Charge Amount"//(TransType.Amount*TransactionCharges."Percentage of Amount")*0.01
                                    else
                                        ChargeAmount := TransactionCharges."Charge Amount";
                                    TChargeAmount += ChargeAmount;

                                    //                    IF TransactionCharges."Transaction Charge Category"<>TransactionCharges."Transaction Charge Category"::"Stamp Duty" THEN
                                    //                      BEGIN
                                    //                    //Excise Duty
                                    //                    TChargeAmount:=TChargeAmount+(ChargeAmount*GenSetup."Excise Duty (%)")*0.01;;
                                    //                    END;
                                end;
                                LineNo := LineNo + 10000;

                                GenJournalLine.Reset;
                                GenJournalLine."Journal Template Name" := JTemp;
                                GenJournalLine."Journal Batch Name" := JBatch;
                                GenJournalLine."Document No." := ATMApplications."No.";
                                GenJournalLine."External Document No." := ATMApplications."No.";
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                                GenJournalLine."Account No." := TransactionCharges."G/L Account";
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Description := ATMCharge;
                                GenJournalLine.Amount := TransactionCharges."Charge Amount" * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Shortcut Dimension 1 Code" := ATMApplications."Shortcut Dimension 1 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine."Shortcut Dimension 2 Code" := ATMApplications."Shortcut Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;
                            // MESSAGE('Charge Amount %1',ChargeAmount)
                            until TransactionCharges.Next = 0;
                            //MESSAGE('Charge Amountwww %1',ChargeAmount)
                            //      END;

                            //END;

                            LineNo := LineNo + 10000;

                            GenJournalLine.Reset;
                            GenJournalLine."Journal Template Name" := JTemp;
                            GenJournalLine."Journal Batch Name" := JBatch;
                            GenJournalLine."Document No." := ATMApplications."No.";
                            GenJournalLine."External Document No." := ATMApplications."No.";
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := ATMApplications."Account No";
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := ATMCharge;
                            GenJournalLine.Amount := TChargeAmount;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Shortcut Dimension 1 Code" := ATMApplications."Shortcut Dimension 1 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine."Shortcut Dimension 2 Code" := ATMApplications."Shortcut Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            //GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::"G/L Account";
                            //GenJournalLine."Bal. Account No.":=TransactionCharges."G/L Account";
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;
                            // MESSAGE('Charge Amount %1',ChargeAmount)
                            //send sms
                            if SavingsAcc.Get(ATMApplications."Account No") then begin
                                SendSMS.SendSms(Sourcetype::"ATM Collection", SavingsAcc."Mobile Phone No", Txt004, ATMApplications."No.", SavingsAccounts."No.", false);
                            end;
                            GenJournalLine.Reset;
                            GenJournalLine.SetRange("Journal Template Name", JTemp);
                            GenJournalLine.SetRange("Journal Batch Name", JBatch);
                            if GenJournalLine.Find('-') then begin
                                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJournalLine);
                            end;
                            //Post New
                            ATMApplications."ATM Charges Applied" := true;
                            ATMApplications."ATM Charged Date" := Today;
                            ATMApplications.Modify;
                            CashierTransactions.Reset;
                            CashierTransactions.SetRange(CashierTransactions."Account No", ATMApplications."Account No");
                            CashierTransactions.SetRange(Remarks, 'ATM Application Charges');
                            if CashierTransactions.Find('-')
                              then begin
                                repeat
                                    //ERROR('here');
                                    CashierTransactions."Cheque Status" := CashierTransactions."cheque status"::Honoured;
                                    CashierTransactions.Modify;
                                until CashierTransactions.Next = 0;
                            end;
                            Message(MSGPosted);

                        end;

                    end;
                end;
            end else begin
                /*
                          // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                          BankingUserTemplate.GET(USERID);
                          JTemp:=BankingUserTemplate."ATM Charges Journal Template";
                          JBatch:=BankingUserTemplate."ATM Charges Journal Batch";
                          GenJournalLine.RESET;
                          GenJournalLine.SETRANGE(GenJournalLine."Journal Template Name",JTemp);
                          GenJournalLine.SETRANGE(GenJournalLine."Journal Batch Name",JBatch);
                          GenJournalLine.DELETEALL;
                            GenSetup.GET;
                          ChargeAmount:=0;
                              ATMCardTypes.RESET;
                              ATMCardTypes.SETRANGE(ATMCardTypes.Code{ATMCardTypes."Application Charge Code"},ATMApplications."Card Type");
                              IF ATMCardTypes.FIND('-') THEN
                                BEGIN
                              TransType.RESET;
                              TransType.SETRANGE(TransType.Code,ATMCardTypes."Replacement Charge Code");//TransType.Type::"ATM Applications");
                              IF TransType.FIND('-') THEN
                                BEGIN

                                    ChargeAmount:=0;
                                    TransactionCharges.RESET;
                                    TransactionCharges.SETRANGE(TransactionCharges."Transaction Type",TransType.Code);
                                    IF TransactionCharges.FIND('-') THEN
                                      BEGIN
                                        //MESSAGE('here');
                                          REPEAT
                                            ChargeAmount:=0;
                                          IF (TransactionCharges."Transaction Charge Category"=TransactionCharges."Transaction Charge Category"::Normal) OR
                                          (TransactionCharges."Transaction Charge Category"=TransactionCharges."Transaction Charge Category"::"Stamp Duty") THEN
                                          BEGIN
                                              IF TransactionCharges."Charge Type"=TransactionCharges."Charge Type"::"% of Amount" = TRUE THEN
                                              ChargeAmount:=TransactionCharges."Charge Amount"//(TransType.Amount*TransactionCharges."Percentage of Amount")*0.01
                                              ELSE ChargeAmount:=TransactionCharges."Charge Amount";

                                              TChargeAmount+=ChargeAmount;

                          //                    IF TransactionCharges."Transaction Charge Category"<>TransactionCharges."Transaction Charge Category"::"Stamp Duty" THEN
                          //                      BEGIN
                          //
                          //                    //Excise Duty
                          //                    TChargeAmount:=TChargeAmount+(ChargeAmount*GenSetup."Excise Duty (%)")*0.01;;
                          //                    END;
                                          END;
                                          LineNo:=LineNo+10000;

                                        GenJournalLine.RESET;
                                        GenJournalLine."Journal Template Name":=JTemp;
                                        GenJournalLine."Journal Batch Name":=JBatch;
                                        GenJournalLine."Document No.":=ATMApplications."No.";
                                        GenJournalLine."External Document No.":=ATMApplications."No.";
                                        GenJournalLine."Line No.":=LineNo;
                                        GenJournalLine."Account Type":=GenJournalLine."Account Type"::"G/L Account";
                                        GenJournalLine."Account No.":=TransactionCharges."G/L Account";
                                        GenJournalLine."Posting Date":=TODAY;
                                        GenJournalLine.Description:=ATMCharge;
                                        GenJournalLine.Amount:=TransactionCharges."Charge Amount"*-1;
                                        GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                        GenJournalLine."Shortcut Dimension 1 Code":=ATMApplications."Shortcut Dimension 1 Code";
                                        GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine."Shortcut Dimension 2 Code":=ATMApplications."Shortcut Dimension 2 Code";
                                        GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                        IF GenJournalLine.Amount<>0 THEN
                                        GenJournalLine.INSERT;
                                       // MESSAGE('Charge Amount %1',ChargeAmount)
                                    UNTIL TransactionCharges.NEXT = 0;
                                    //MESSAGE('Charge Amountwww %1',ChargeAmount)
                              //      END;

                              //END;

                                        LineNo:=LineNo+10000;

                                        GenJournalLine.RESET;
                                        GenJournalLine."Journal Template Name":=JTemp;
                                        GenJournalLine."Journal Batch Name":=JBatch;
                                        GenJournalLine."Document No.":=ATMApplications."No.";
                                        GenJournalLine."External Document No.":=ATMApplications."No.";
                                        GenJournalLine."Line No.":=LineNo;
                                        GenJournalLine."Account Type":=GenJournalLine."Account Type"::Savings;
                                        GenJournalLine."Account No.":=ATMApplications."Account No";
                                        GenJournalLine."Posting Date":=TODAY;
                                        GenJournalLine.Description:=ATMCharge;
                                        GenJournalLine.Amount:=ChargeAmount;
                                        GenJournalLine.VALIDATE(GenJournalLine.Amount);
                                        GenJournalLine."Shortcut Dimension 1 Code":=ATMApplications."Shortcut Dimension 1 Code";
                                        GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                                        GenJournalLine."Shortcut Dimension 2 Code":=ATMApplications."Shortcut Dimension 2 Code";
                                        GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                                       // GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::"G/L Account";
                                        //GenJournalLine."Bal. Account No.":=TransactionCharges."G/L Account";
                                        IF GenJournalLine.Amount<>0 THEN
                                        GenJournalLine.INSERT;
                                       // MESSAGE('Charge Amount %1',ChargeAmount)

                                        GenJournalLine.RESET;
                                        GenJournalLine.SETRANGE("Journal Template Name",JTemp);
                                        GenJournalLine.SETRANGE("Journal Batch Name",JBatch);
                                        IF GenJournalLine.FIND('-') THEN BEGIN
                                        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJournalLine);
                                        END;
                                        //Post New
                                        ATMApplications."ATM Charges Applied":=TRUE;
                                        ATMApplications."ATM Charged Date":=TODAY;
                                        ATMApplications.MODIFY;
                                        MESSAGE(MSGPosted);
                                    END;

                              END;
                          END;
                          */
                // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                BankingUserTemplate.Get(UserId);
                JTemp := BankingUserTemplate."ATM Charges Journal Template";
                JBatch := BankingUserTemplate."ATM Charges Journal Batch";
                GenJournalLine.Reset;
                GenJournalLine.SetRange(GenJournalLine."Journal Template Name", JTemp);
                GenJournalLine.SetRange(GenJournalLine."Journal Batch Name", JBatch);
                GenJournalLine.DeleteAll;
                GenSetup.Get;
                ChargeAmount := 0;
                ATMCardTypes.Reset;
                ATMCardTypes.SetRange(ATMCardTypes.Code, ATMApplications."Card Type");
                if ATMCardTypes.Find('-') then begin
                    //   MESSAGE('here');
                    TransType.Reset;
                    TransType.SetRange(TransType.Code, ATMCardTypes."Replacement Charge Code");//."Application Charge Code");//TransType.Type::"ATM Applications");
                    if TransType.Find('-') then begin
                        ChargeAmount := 0;
                        TransactionCharges.Reset;
                        TransactionCharges.SetRange(TransactionCharges."Transaction Type", TransType.Code);
                        if TransactionCharges.Find('-') then begin
                            repeat
                                ChargeAmount := 0;
                                if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::Normal) or
                                (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::"Stamp Duty") then begin
                                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                                        ChargeAmount := TransactionCharges."Charge Amount"//(TransType.Amount*TransactionCharges."Percentage of Amount")*0.01
                                    else
                                        ChargeAmount := TransactionCharges."Charge Amount";
                                    TChargeAmount += ChargeAmount;

                                    //                    IF TransactionCharges."Transaction Charge Category"<>TransactionCharges."Transaction Charge Category"::"Stamp Duty" THEN
                                    //                      BEGIN
                                    //                    //Excise Duty
                                    //                    TChargeAmount:=TChargeAmount+(ChargeAmount*GenSetup."Excise Duty (%)")*0.01;;
                                    //                    END;
                                end;
                                LineNo := LineNo + 10000;

                                GenJournalLine.Reset;
                                GenJournalLine."Journal Template Name" := JTemp;
                                GenJournalLine."Journal Batch Name" := JBatch;
                                GenJournalLine."Document No." := ATMApplications."No.";
                                GenJournalLine."External Document No." := ATMApplications."No.";
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                                GenJournalLine."Account No." := TransactionCharges."G/L Account";
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Description := ATMCharge;
                                GenJournalLine.Amount := TransactionCharges."Charge Amount" * -1;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Shortcut Dimension 1 Code" := ATMApplications."Shortcut Dimension 1 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine."Shortcut Dimension 2 Code" := ATMApplications."Shortcut Dimension 2 Code";
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;
                            // MESSAGE('Charge Amount %1',ChargeAmount)
                            until TransactionCharges.Next = 0;
                            //MESSAGE('Charge Amountwww %1',ChargeAmount)
                            //      END;

                            //END;

                            LineNo := LineNo + 10000;

                            GenJournalLine.Reset;
                            GenJournalLine."Journal Template Name" := JTemp;
                            GenJournalLine."Journal Batch Name" := JBatch;
                            GenJournalLine."Document No." := ATMApplications."No.";
                            GenJournalLine."External Document No." := ATMApplications."No.";
                            GenJournalLine."Line No." := LineNo;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                            GenJournalLine."Account No." := ATMApplications."Account No";
                            GenJournalLine."Posting Date" := Today;
                            GenJournalLine.Description := ATMCharge;
                            GenJournalLine.Amount := TChargeAmount;
                            GenJournalLine.Validate(GenJournalLine.Amount);
                            GenJournalLine."Shortcut Dimension 1 Code" := ATMApplications."Shortcut Dimension 1 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine."Shortcut Dimension 2 Code" := ATMApplications."Shortcut Dimension 2 Code";
                            GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                            //GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::"G/L Account";
                            //GenJournalLine."Bal. Account No.":=TransactionCharges."G/L Account";
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;
                            // MESSAGE('Charge Amount %1',ChargeAmount)
                            //send sms
                            if SavingsAcc.Get(ATMApplications."Account No") then begin
                                SendSMS.SendSms(Sourcetype::"ATM Collection", SavingsAcc."Mobile Phone No", Txt004, ATMApplications."No.", SavingsAccounts."No.", false);
                            end;
                            GenJournalLine.Reset;
                            GenJournalLine.SetRange("Journal Template Name", JTemp);
                            GenJournalLine.SetRange("Journal Batch Name", JBatch);
                            if GenJournalLine.Find('-') then begin
                                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJournalLine);
                            end;
                            //Post New
                            ATMApplications."ATM Charges Applied" := true;
                            ATMApplications."ATM Charged Date" := Today;
                            ATMApplications.Modify;
                            CashierTransactions.Reset;
                            CashierTransactions.SetRange(CashierTransactions."Account No", ATMApplications."Account No");
                            CashierTransactions.SetRange(Remarks, 'ATM Application Charges');
                            if CashierTransactions.Find('-')
                              then begin
                                repeat
                                    //ERROR('here');
                                    CashierTransactions."Cheque Status" := CashierTransactions."cheque status"::Honoured;
                                    CashierTransactions.Modify;
                                until CashierTransactions.Next = 0;
                            end;
                            Message(MSGPosted);

                        end;

                    end;
                end;
            end;

    end;


    procedure GuarantorRecovery(LoanRecoveryHeader: Record 52185829)
    var
        GenJournalLine: Record "Gen. Journal Line";
        ConfMessage: label 'Are you sure you want to recover loan from Shares and Guarantors';
        LongTerm: Decimal;
        ShortTerm: Decimal;
        TotGuaranteed: Decimal;
        RunBal: Decimal;
        IntBalance: Decimal;
        PrinBalance: Decimal;
        Loans: Record 52185729;
        LGuarantors: Record 52185739;
        SavingsAccounts: Record 52185730;
        ShorttermAcc: Code[25];
        LongtermAcc: Code[25];
        LineNo: Integer;
        Txt0001: label 'Interest Recovery from deposits';
        Txt0003: label 'Principle Recovery from deposits';
        Txt0004: label 'Principle Recovery:-';
        Txt0002: label 'Interest Recovered:-';
        GPercnt: Decimal;
        LoanAllocation: Decimal;
        ExistPac: Boolean;
        ProductFactory: Record 52185690;
        AcctNo: Code[25];
        CreditAccounts: Record 52185731;
        LoanProcess: Codeunit "Loans Process";
        NewLoans: Record 52185729;
        Txt0005: label 'Principle';
        Txt0006: label 'Cleared by Guarantor loan:';
        CreditAcc: Code[20];
        LGuar: Record 52185739;
        CountNo: Integer;
        Dim1: Code[20];
        Dim2: Code[20];
        UserSetup: Record "User Setup";
        LoansLoop: Record 52185729;
        LoanAmount: Decimal;
        GurAmount: Decimal;
        LoanAmountBal: Decimal;
        Members: Record 52185700;
        Txt0007: label 'Bill Recoverd:-';
        ProdFac: Record 52185690;
        SavingsAcc: Code[20];
        SavingsAmt: Decimal;
        Txt0008: label 'Interest Recovery from Savings';
        Txt0009: label 'Principle Recovery from Savings';
        TotalRecoveryAmount: Decimal;
        Err001: label 'There are no loan to recover';
        ProductF: Record 52185690;
        LoanSched: Record 52185738;
        MonthRepay: Decimal;
        Install: Integer;
        NoLoop: Integer;
        TotalBalanceLoan: Decimal;
        LoanAllocationT: Decimal;
        Txt0010: label 'Loan Detachment to';
        CreditLedgerEntry: Record 52185733;
        TotalDetach: Decimal;
        Txt0011: label 'Loan Detachment from';
        SavingsLedgerEntry: Record 52185732;
        MembGuar: Record 52185700;
        CreditLedgerEntryDefaulter: Record 52185733;
        DefaultedLoan: Record 52185729;
    begin
        Temp.Get(UserId);

        Jtemplate := Temp."Check Off Template";
        JBatch := Temp."Check Off Batch";

        UserSetup.Get(UserId);
        Dim1 := UserSetup."Global Dimension 1 Code";
        Dim2 := UserSetup."Global Dimension 2 Code";

        //CLEAR BATCH
        GenJournalLine.SetRange("Journal Template Name", Jtemplate);
        GenJournalLine.SetRange("Journal Batch Name", JBatch);
        GenJournalLine.DeleteAll;




        if Confirm(ConfMessage, false) = true then begin

            ///Singel Loan Recovery
            if LoanRecoveryHeader."Recovery Type" <> LoanRecoveryHeader."recovery type"::Detachement then begin
                if (LoanRecoveryHeader."Outsatnding Interest" = 0) and (LoanRecoveryHeader."Outstanding Balance" = 0) then
                    Error(Err001);
            end;
            if LoanRecoveryHeader."Recovery Type" = LoanRecoveryHeader."recovery type"::Single then begin
                LoanRecoveryHeader.TestField(LoanRecoveryHeader."Loan No.");
                LongTerm := 0;
                ShortTerm := 0;
                TotGuaranteed := 0;
                RunBal := 0;
                IntBalance := 0;
                PrinBalance := 0;


                RunBal := 0;
                if Loans.Get(LoanRecoveryHeader."Loan No.") then
                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", "Outstanding Bills");
                RunBal := Loans."Outstanding Balance" + Loans."Outstanding Interest";

                Members.Get(Loans."Member No.");
                SendSMS.SendSms(Sourcetype::"Loan defaulted", Members."Mobile Phone No", 'Your loan of ' + Format(Loans."Outstanding Balance" + Loans."Outstanding Interest") +
                'has been recovered from your Deposits/Guarantors. You will be listed on CRB Call us on 0709943000', Loans."Loan No.", '', false);


                LGuarantors.Reset;
                LGuarantors.SetRange(LGuarantors."Loan No", Loans."Loan No.");
                LGuarantors.SetRange(LGuarantors.Substituted, false);
                LGuarantors.SetRange("Self Guarantee", false);
                if LGuarantors.Find('-') then begin
                    LGuarantors.CalcSums(LGuarantors."Amount Guaranteed");
                    TotGuaranteed := LGuarantors."Amount Guaranteed";
                end;

                //Check share balance
                SavingsAccounts.Reset;
                SavingsAccounts.SetRange(SavingsAccounts."Member No.", LoanRecoveryHeader."Member No.");
                SavingsAccounts.SetRange(SavingsAccounts."Product Category", SavingsAccounts."product category"::"Deposit Contribution");
                if SavingsAccounts.Find('-') then begin
                    repeat
                        SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                        if SavingsAccounts."Balance (LCY)" > 0 then begin
                            ShortTerm := ShortTerm + SavingsAccounts."Balance (LCY)";
                            ShorttermAcc := SavingsAccounts."No.";
                        end;
                    until SavingsAccounts.Next = 0;
                end;

                //Check share balance from Savings
                SavingsAccounts.Reset;
                SavingsAccounts.SetRange(SavingsAccounts."Member No.", LoanRecoveryHeader."Member No.");
                SavingsAccounts.SetRange("Loan Disbursement Account", true);
                if SavingsAccounts.Find('-') then begin
                    repeat
                        SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                        if SavingsAccounts."Balance (LCY)" > 0 then begin
                            if ProductFactory.Get(SavingsAccounts."Product Type") then begin
                                SavingsAmt := SavingsAmt + (SavingsAccounts."Balance (LCY)" - ProductFactory."Minimum Balance");
                                SavingsAcc := SavingsAccounts."No.";
                            end;
                        end;
                    until SavingsAccounts.Next = 0;
                end;

                ShortTerm := ShortTerm + SavingsAmt;

                if (LongTerm + ShortTerm) <= 0 then begin
                    IntBalance := Loans."Outstanding Interest";
                    PrinBalance := Loans."Outstanding Balance";
                end;

                if LongTerm = 0 then begin
                    IntBalance := Loans."Outstanding Interest";
                    PrinBalance := Loans."Outstanding Balance";
                end;




                if LongTerm > 0 then begin
                    if Loans."Outstanding Interest" > 0 then begin
                        //Interest+++++++
                        AcctType := Accttype::Credit;
                        TransType := Transtype::"Interest Paid";
                        LineNo := LineNo + 10000;
                        if Loans."Outstanding Interest" > LongTerm then
                            Amt := -1 * LongTerm
                        else
                            Amt := -1 * Loans."Outstanding Interest";

                        if Amt <> 0 then
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                            Txt0001, Amt, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                        Amt := 0;

                        if Loans."Outstanding Interest" > LongTerm then
                            IntBalance := Loans."Outstanding Interest" - LongTerm;

                        AcctType := Accttype::Savings;
                        TransType := Transtype::" ";
                        LineNo := LineNo + 10000;
                        if Loans."Outstanding Interest" > LongTerm then
                            Amt := LongTerm
                        else
                            Amt := Loans."Outstanding Interest";


                        if SavingsAmt > Amt then begin

                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                            Txt0008, Amt * -1, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                            SavingsAmt -= Amt;

                        end else
                            // beginSavings Recovery
                            //      if Amt <> 0 then begin
                            // LineNo:=LineNo+10000;
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                            Txt0008, SavingsAmt, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                            LineNo := LineNo + 10000;

                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                            Txt0001, (Amt - SavingsAmt), ShorttermAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                            SavingsAmt := 0;
                        end;
                    end;
                    /*
                IF Amt<>0 THEN
                JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,LoanRecoveryHeader."No.",
                Txt0001,Amt,LongtermAcc,LoanRecoveryHeader."Posting Date",BalAccType,
                BalAccNo,Loans."Loan No.",Dim1,Dim2,TransType,Loans."Loan No.",'','',0,'',0);
                */
                    LongTerm := LongTerm - Abs(Amt);


                if LongTerm > 0 then begin
                    //Repayment
                    AcctType := Accttype::Credit;
                    TransType := Transtype::Repayment;
                    LineNo := LineNo + 10000;
                    if Loans."Outstanding Balance" > LongTerm then
                        Amt := LongTerm * -1
                    else
                        Amt := Loans."Outstanding Balance" * -1;

                    if Amt <> 0 then
                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                        Txt0003, Amt, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                    //Bills
                    AcctType := Accttype::Credit;
                    TransType := Transtype::Bills;
                    LineNo := LineNo + 10000;

                    if ProductFactory.Get(Loans."Loan Product Type") then begin

                        if Loans."Outstanding Bills" <> 0 then
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                            Txt0007, Loans."Outstanding Bills" * -1, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                            ProductFactory."Billed Account", Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                    end;

                    AcctType := Accttype::Savings;
                    TransType := Transtype::" ";
                    LineNo := LineNo + 10000;
                    if Loans."Outstanding Balance" > LongTerm then
                        Amt := LongTerm
                    else
                        Amt := Loans."Outstanding Balance";

                    if SavingsAmt > Amt then begin

                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                        Txt0009, Amt, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                        SavingsAmt -= Amt;

                    end else begin
                        if Amt <> 0 then begin
                            // LineNo:=LineNo+10000;
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                            Txt0009, SavingsAmt, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                            LineNo := LineNo + 10000;

                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                            Txt0004, (Amt - SavingsAmt), ShorttermAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                            SavingsAmt := 0;
                        end;
                    end;
                    /*
                    IF Amt<>0 THEN
                    JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,LoanRecoveryHeader."No.",
                    Txt0004+Loans."Loan No.",Amt,LongtermAcc,LoanRecoveryHeader."Posting Date",BalAccType,
                    BalAccNo,Loans."Loan No.",Dim1,Dim2,TransType,Loans."Loan No.",'','',0,'',0);*/

                    if Loans."Outstanding Balance" > LongTerm then
                        PrinBalance := Loans."Outstanding Balance" - LongTerm
                    else
                        PrinBalance := 0;

                    LongTerm := LongTerm - Abs(Amt);

                end;

            end;



            if (PrinBalance > 0) or (IntBalance > 0) then begin

                if ShortTerm > 0 then begin
                    if IntBalance > 0 then begin
                        AcctType := Accttype::Credit;
                        TransType := Transtype::"Interest Paid";
                        LineNo := LineNo + 10000;
                        if IntBalance > ShortTerm then
                            Amt := -1 * ShortTerm
                        else
                            Amt := -1 * IntBalance;

                        if Amt <> 0 then
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                            Txt0002 + Loans."Loan No.", Amt, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);


                        //Deduct shares
                        //Check if interest remained


                        AcctType := Accttype::Savings;
                        TransType := Transtype::" ";
                        LineNo := LineNo + 10000;
                        if IntBalance > ShortTerm then
                            Amt := ShortTerm
                        else
                            Amt := IntBalance;

                        if SavingsAmt > Amt then begin

                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                            Txt0008, Amt, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                            SavingsAmt -= Amt;

                        end else begin
                            if Amt <> 0 then begin
                                // LineNo:=LineNo+10000;
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                Txt0008, SavingsAmt, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                LineNo := LineNo + 10000;

                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                Txt0001, (Amt - SavingsAmt), ShorttermAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                SavingsAmt := 0;
                            end;
                        end;
                        /*
                        IF Amt<>0 THEN
                        JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,LoanRecoveryHeader."No.",
                        Txt0001+Loans."Loan No.",Amt,ShorttermAcc,LoanRecoveryHeader."Posting Date",BalAccType,
                        BalAccNo,Loans."Loan No.",Dim1,Dim2,TransType,Loans."Loan No.",'','',0,'',0);*/

                        if IntBalance > ShortTerm then
                            IntBalance := IntBalance - ShortTerm
                        else
                            IntBalance := 0;
                        ShortTerm := ShortTerm - Abs(Amt);

                    end;

                    if PrinBalance > 0 then begin

                        AcctType := Accttype::Credit;
                        TransType := Transtype::Repayment;
                        LineNo := LineNo + 10000;
                        if PrinBalance > ShortTerm then
                            Amt := -1 * ShortTerm
                        else
                            Amt := -1 * PrinBalance;

                        if Amt <> 0 then
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                            Txt0004 + Loans."Loan No.", Amt, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                        //Check if interest remained


                        AcctType := Accttype::Savings;
                        TransType := Transtype::" ";
                        LineNo := LineNo + 10000;
                        if PrinBalance > ShortTerm then
                            Amt := ShortTerm
                        else
                            Amt := PrinBalance;

                        if SavingsAmt > Amt then begin

                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                            Txt0009, Amt, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                            SavingsAmt -= Amt;

                        end else begin
                            if Amt <> 0 then begin
                                // LineNo:=LineNo+10000;
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                Txt0009, SavingsAmt, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                LineNo := LineNo + 10000;

                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                Txt0004, (Amt - SavingsAmt), ShorttermAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                SavingsAmt := 0;
                            end;
                        end;
                        /*
                       IF Amt<>0 THEN
                       JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,LoanRecoveryHeader."No.",
                       Txt0004+Loans."Loan No.",Amt,ShorttermAcc,LoanRecoveryHeader."Posting Date",BalAccType,
                       BalAccNo,Loans."Loan No.",Dim1,Dim2,TransType,Loans."Loan No.",'','',0,'',0);*/

                        if PrinBalance > ShortTerm then
                            PrinBalance := PrinBalance - ShortTerm
                        else
                            PrinBalance := 0;

                        ShortTerm := ShortTerm - Abs(Amt);

                    end;

                end;
            end;

            if ((Loans."Outstanding Balance" + Loans."Outstanding Interest") > 0) then begin


                if (IntBalance + PrinBalance > 0) then begin
                    CountNo := 0;
                    //Count Guarantors
                    LGuar.Reset;
                    LGuar.SetRange(LGuar."Loan No", Loans."Loan No.");
                    LGuar.SetRange(LGuar.Substituted, false);
                    LGuar.SetRange("Self Guarantee", false);
                    if LGuar.Find('-') then begin
                        repeat
                            CountNo := CountNo + 1;
                        until LGuar.Next = 0;
                    end;

                    LGuarantors.Reset;
                    LGuarantors.SetRange(LGuarantors."Loan No", Loans."Loan No.");
                    LGuarantors.SetRange(LGuarantors.Substituted, false);
                    LGuarantors.SetRange("Guarantor Type", LGuarantors."guarantor type"::Guarantor);
                    LGuarantors.SetRange("Self Guarantee", false);
                    if LGuarantors.Find('-') then begin
                        repeat

                            //Guarantor Recovery
                            //***Percentage

                            //GPercnt:=(LGuarantors."Amount Guaranteed"*100)/Loans."Approved Amount";
                            //LoanAllocation:=ROUND((PrinBalance)*(GPercnt/100),0.01)+
                            //                ROUND((IntBalance)*(GPercnt/100),0.01);

                            // LoanAllocation:=(IntBalance/CountNo)+(PrinBalance/CountNo);
                            LoanAllocation := (ROUND(IntBalance) / CountNo) + (ROUND((PrinBalance) / CountNo));

                            //MESSAGE('%1 AND %2',IntBalance+PrinBalance,LoanAllocation);
                            //Get defaulter loan type
                            //Defaulter Loan No creted**
                            if LoanAllocation > 0 then begin
                                ExistPac := false;
                                ProductFactory.Reset;
                                ProductFactory.SetCurrentkey(ProductFactory."Product ID");
                                ProductFactory.SetRange(ProductFactory."Product Class Type", ProductFactory."product class type"::Loan);
                                ProductFactory.SetRange(ProductFactory."Nature of Loan Type", ProductFactory."nature of loan type"::Defaulter);
                                if ProductFactory.Find('-') then begin
                                    repeat

                                        CreditAcc := ProductFactory."Account No. Prefix" + LGuarantors."Member No";
                                        if CreditAccounts.Get(CreditAcc) then begin
                                            CreditAccounts.CalcFields(CreditAccounts."Balance (LCY)");
                                            if CreditAccounts."Balance (LCY)" = 0 then begin
                                                ExistPac := true;
                                                //EXIT;
                                            end;
                                        end else begin

                                            CreditAcc := LoanProcess."CreateLoan Account"(LGuarantors."Member No", ProductFactory."Product ID");
                                            ExistPac := true;
                                        end;

                                    until (ProductFactory.Next = 0) or (ExistPac = true);
                                end;
                                //End of Get Defauter Loan type

                                NewLoans.Reset;
                                NewLoans.SetRange(NewLoans."Member No.", LGuarantors."Member No");
                                NewLoans.SetRange(NewLoans."Loan Product Type", ProductFactory."Product ID");
                                NewLoans.SetRange(NewLoans.Posted, false);
                                if NewLoans.Find('-') then
                                    NewLoans.DeleteAll;
                                //ERROR('%1 ANND %2',Loans."Loan Account",IntBalance+PrinBalance);

                                NewLoans.Init;
                                NewLoans."Loan No." := '';
                                NewLoans."Member No." := LGuarantors."Member No";//LGurantors."Member No"
                                if Members.Get(LGuarantors."Member No") then begin
                                    NewLoans."Member Name" := Members.Name;
                                    NewLoans."Staff No" := Members."Payroll/Staff No.";
                                    NewLoans."Employer Code" := Members."Employer Code";
                                    NewLoans."Application Date" := Today;
                                end;
                                //NewLoans.VALIDATE(NewLoans."Member No.");
                                NewLoans."Loan Product Type" := ProductFactory."Product ID";
                                //NewLoans.VALIDATE(NewLoans."Loan Product Type");
                                if ProdFac.Get(ProductFactory."Product ID") then begin
                                    NewLoans."Loan Product Type Name" := ProdFac."Product Description";
                                    NewLoans."Grace Period" := ProdFac."Grace Period - Interest";
                                    NewLoans.Interest := Loans.Interest;//ProdFac."Interest Rate (Min.)";
                                    NewLoans."Grace Period" := ProdFac."Grace Period - Interest";
                                    NewLoans."Interest Calculation Method" := Loans."Interest Calculation Method";//ProdFac."Interest Calculation Method";
                                    NewLoans."Loan Span" := Loans."Loan Span";//ProdFac."Loan Span";
                                                                              // Check schedule details
                                    LoanSched.Reset;
                                    LoanSched.SetRange(LoanSched."Loan No.", Loans."Loan No.");
                                    if LoanSched.Find('-') then begin
                                        repeat
                                            if MonthRepay <= Loans."Outstanding Balance" then begin
                                                MonthRepay += LoanSched."Monthly Repayment";
                                                Install += 1;
                                            end;
                                        until LoanSched.Next = 0;
                                    end;

                                    NewLoans.Installments := Loans.Installments - Install;

                                    NewLoans."Compute Interest Due on Postin" := Loans."Compute Interest Due on Postin";//ProdFac."Compute Interest Due on Postin";
                                    NewLoans."Repayment Frequency" := Loans."Repayment Frequency";//ProdFac."Repayment Frequency";
                                    NewLoans."Recovery Mode" := ProdFac."Repay Mode";
                                    NewLoans."Appraisal Parameter Type" := ProdFac."Appraisal Parameter Type";
                                    NewLoans."Recovery Priority" := ProdFac."Recovery Priority";
                                end;
                                NewLoans."Application Date" := LoanRecoveryHeader."Posting Date";
                                if (Loans."Approved Amount" > 0) and (Loans.Installments > 0) then
                                    NewLoans.Installments := ROUND((Loans."Outstanding Balance")
                                                              / (Loans."Approved Amount" / Loans.Installments), 1, '>');

                                NewLoans."Requested Amount" := LoanAllocation;
                                NewLoans."Approved Amount" := LoanAllocation;
                                NewLoans.Validate(NewLoans."Approved Amount");
                                NewLoans.Status := NewLoans.Status::Approved;
                                NewLoans."Disbursement Date" := LoanRecoveryHeader."Posting Date";
                                NewLoans."Repayment Start Date" := LoanRecoveryHeader."Posting Date";
                                //NewLoans.batch"Batch No.":="Batch No.";
                                NewLoans."Recovered Loan" := Loans."Loan No.";
                                NewLoans."Loan Account" := CreditAcc;
                                NewLoans.Repayment := ROUND(NewLoans.Repayment, 1, '>');
                                NewLoans."Loan Recovery No." := LoanRecoveryHeader."No.";
                                NewLoans.Advice := true;
                                NewLoans."Advice Type" := NewLoans."advice type"::"Fresh Loan";
                                NewLoans.Insert(true);

                                NewLoans.Reset;
                                NewLoans.SetRange(NewLoans."Member No.", LGuarantors."Member No");
                                NewLoans.SetRange(NewLoans."Loan Product Type", ProductFactory."Product ID");
                                NewLoans.SetRange(NewLoans.Posted, false);
                                if NewLoans.Find('-') then begin


                                    AcctType := Accttype::Credit;
                                    TransType := Transtype::Loan;
                                    LineNo := LineNo + 10000;


                                    if LoanAllocation <> 0 then
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                        Txt0005 + ':Member No-' + Loans."Member No." + ':Loan No' + Loans."Loan No.", LoanAllocation, NewLoans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                        BalAccNo, NewLoans."Loan No.", Dim1, Dim2, TransType, NewLoans."Loan No.", '', '', 0, '', 0);


                                    NewLoans.Posted := true;
                                    NewLoans.Modify;

                                    //Generate Schedule
                                    // GetInstallments(NewLoans."Loan No.");

                                    //Advice Loan
                                    NewLoans.Validate(Repayment);
                                    Members.Get(NewLoans."Member No.");
                                    SendSMS.SendSms(Sourcetype::"Loan defaulted", Members."Mobile Phone No", 'Dear member your have been attached Loan of Kes'
                                    + Format(ROUND(NewLoans."Approved Amount", 1, '=')) + ' ' + 'for defaulted loan you guaranteed Member No.' + Loans."Member No." + '-' + Loans."Member Name" + '' +
                                   ' if in dispute call 0709943000', NewLoans."Loan No.", NewLoans."Disbursement Account No", false);


                                    //Off Set BOSA Loans

                                    //Principle
                                    AcctType := Accttype::Credit;
                                    TransType := Transtype::Repayment;
                                    LineNo := LineNo + 10000;
                                    Amt := -ROUND(PrinBalance / CountNo);
                                    //MESSAGE(

                                    if Amt <> 0 then
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                        Txt0006 + LGuarantors."Member No", Amt, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                    //Interest


                                    AcctType := Accttype::Credit;
                                    TransType := Transtype::"Interest Paid";
                                    LineNo := LineNo + 10000;
                                    //MESSAGE('aloc %1',LoanAllocation);
                                    //  MESSAGE(FORMAT(Amt));

                                    Amt := (LoanAllocation + Amt) * -1;//-IntBalance/CountNo;
                                                                       //MESSAGE(FORMAT(Amt));

                                    if Amt <> 0 then
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                        Txt0006, Amt, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                    //Guarantor Recovery**********||*****

                                    //Proportional distribution
                                    //if accounts.get(LGuarantors."SACCO Account No.") then begin
                                end;
                            end;
                        until LGuarantors.Next = 0;
                    end;
                end;
            end;
        end else if LoanRecoveryHeader."Recovery Type" = LoanRecoveryHeader."recovery type"::All then begin
                LongTerm := 0;
                ShortTerm := 0;
                TotGuaranteed := 0;
                RunBal := 0;
                IntBalance := 0;
                PrinBalance := 0;
                LoanAmount := 0;

                RunBal := 0;

                Loans.Reset;
                Loans.SetCurrentkey("Recovery Priority");
                Loans.SetRange(Loans."Member No.", LoanRecoveryHeader."Member No.");
                //Loans.SETRANGE("Loan Span",Loans."Loan Span"::"Long Term");
                Loans.SetFilter(Loans."Outstanding Balance", '>0');
                if Loans.Find('-') then begin
                    repeat
                        if ProductF.Get(Loans."Loan Product Type") then begin
                            if ProductF."Minimum Guarantors" = 0 then begin
                                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", "Outstanding Bills");
                                if Loans."Outstanding Interest" > 0 then
                                    RunBal := RunBal + (Loans."Outstanding Balance" + Loans."Outstanding Interest") else
                                    RunBal := RunBal + (Loans."Outstanding Balance");
                            end;
                        end;
                    until Loans.Next = 0;
                end;

                //Check share balance
                SavingsAccounts.Reset;
                SavingsAccounts.SetRange(SavingsAccounts."Member No.", LoanRecoveryHeader."Member No.");
                SavingsAccounts.SetRange(SavingsAccounts."Product Category", SavingsAccounts."product category"::"Deposit Contribution");
                if SavingsAccounts.Find('-') then begin
                    repeat
                        SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                        if ProductFactory.Get(SavingsAccounts."Product Type") then begin
                            if SavingsAccounts."Balance (LCY)" > 0 then begin
                                ShortTerm := ShortTerm + (SavingsAccounts."Balance (LCY)" - ProductFactory."Minimum Balance");
                                ShorttermAcc := SavingsAccounts."No.";
                            end;
                        end;
                    until SavingsAccounts.Next = 0;
                end;

                //Check share balance from Savings
                SavingsAccounts.Reset;
                SavingsAccounts.SetRange(SavingsAccounts."Member No.", LoanRecoveryHeader."Member No.");
                SavingsAccounts.SetRange("Loan Disbursement Account", true);
                if SavingsAccounts.Find('-') then begin
                    repeat
                        SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                        if SavingsAccounts."Balance (LCY)" > 0 then begin
                            SavingsAmt := SavingsAmt + SavingsAccounts."Balance (LCY)";
                            SavingsAcc := SavingsAccounts."No.";
                        end;
                    until SavingsAccounts.Next = 0;
                end;

                ShortTerm := ShortTerm + SavingsAmt;
                TotalRecoveryAmount := ShortTerm;
                //Recover Loans Long Term
                Loans.Reset;
                Loans.SetCurrentkey("Recovery Priority");
                Loans.SetRange("Member No.", LoanRecoveryHeader."Member No.");
                //Loans.SETRANGE("Loan Span",Loans."Loan Span"::"Long Term");
                Loans.SetFilter("Outstanding Balance", '>0');
                if Loans.Find('-') then begin
                    repeat
                        if ProductF.Get(Loans."Loan Product Type") then begin
                            if ProductF."Minimum Guarantors" = 0 then begin

                                Loans.CalcFields("Outstanding Balance", "Outstanding Interest", "Outstanding Bills");
                                if Loans."Outstanding Interest" > 0 then
                                    IntBalance := Loans."Outstanding Interest";
                                PrinBalance := Loans."Outstanding Balance";
                                //LoanAmount:=ROUND((IntBalance+PrinBalance)/RunBal*(TotalRecoveryAmount),1,'=');
                                LoanAmount := (IntBalance + PrinBalance) / RunBal * (TotalRecoveryAmount);
                                LoanAmountBal := LoanAmount;
                                //MESSAGE('Int %1 Princ %2 Run BAL %3 Short %4 ',LoanAmount,PrinBalance,RunBal,ShortTerm);

                                if Loans."Outstanding Interest" > 0 then begin
                                    //Interest+++++++
                                    AcctType := Accttype::Credit;
                                    TransType := Transtype::"Interest Paid";
                                    LineNo := LineNo + 10000;
                                    if Loans."Outstanding Interest" > LoanAmount then
                                        Amt := -1 * LoanAmount
                                    else
                                        Amt := -1 * Loans."Outstanding Interest";

                                    if Amt <> 0 then
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                        Txt0001, Amt, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                    //Amt:=0;


                                    AcctType := Accttype::Savings;
                                    TransType := Transtype::" ";
                                    LineNo := LineNo + 10000;

                                    if SavingsAmt > Abs(Amt) then begin

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                        Txt0008, Amt * -1, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                        SavingsAmt -= Abs(Amt);


                                    end else begin
                                        if Amt <> 0 then begin
                                            // LineNo:=LineNo+10000;
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                            Txt0008, SavingsAmt, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                            LineNo := LineNo + 10000;

                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                            Txt0001, (Abs(Amt) - SavingsAmt), ShorttermAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                            SavingsAmt := 0;
                                        end;

                                    end;


                                    LoanAmount := LoanAmount - Abs(Amt);
                                    ShortTerm := LoanAmount;
                                    IntBalance := Abs(Amt);
                                end;

                                if Loans."Outstanding Balance" > 0 then begin
                                    Amt := 0;
                                    if LoanAmount > 0 then begin
                                        AcctType := Accttype::Credit;
                                        TransType := Transtype::Repayment;
                                        LineNo := LineNo + 10000;
                                        if Loans."Outstanding Balance" > LoanAmount then
                                            Amt := LoanAmount
                                        else
                                            Amt := Loans."Outstanding Balance";


                                        if Amt <> 0 then
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                            Txt0003, Amt * -1, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);



                                        //Bills
                                        AcctType := Accttype::Credit;
                                        TransType := Transtype::Bills;
                                        LineNo := LineNo + 10000;

                                        if ProductFactory.Get(Loans."Loan Product Type") then begin

                                            if Loans."Outstanding Bills" <> 0 then
                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                Txt0007 + Loans."Loan No.", Loans."Outstanding Bills" * -1, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                                ProductFactory."Billed Account", Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                        end;

                                        AcctType := Accttype::Savings;
                                        TransType := Transtype::" ";
                                        LineNo := LineNo + 10000;


                                        if SavingsAmt > Amt then begin


                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                            Txt0009, Amt, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                            SavingsAmt := SavingsAmt - Amt;
                                        end else begin

                                            if Amt <> 0 then begin
                                                // LineNo:=LineNo+10000;
                                                if SavingsAmt > 0 then
                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                    Txt0009, SavingsAmt, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                                    BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                                LineNo := LineNo + 10000;

                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                Txt0003, (Amt - SavingsAmt), ShorttermAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                                SavingsAmt := 0;
                                            end;
                                        end;
                                    end;
                                    LoanAmount := LoanAmount - Amt;
                                    ShortTerm -= LoanAmount;
                                    PrinBalance := Amt;
                                end;


                                //Transfer balance to guarantors
                                //Check if balance is cleared by non-withdrawables

                                //Error('%1 and %2',(Loans."Outstanding Balance"+Loans."Outstanding Interest"),LoanAmountBal);
                                if Loans."Outstanding Interest" > 0 then
                                    GurAmount := (Loans."Outstanding Balance" + Loans."Outstanding Interest") - LoanAmountBal else
                                    GurAmount := (Loans."Outstanding Balance") - LoanAmountBal;

                                PrinBalance := Loans."Outstanding Balance" - PrinBalance;
                                if Loans."Outstanding Interest" > 0 then
                                    IntBalance := Loans."Outstanding Interest" - IntBalance else
                                    IntBalance := IntBalance;
                                if (GurAmount > 0) then begin
                                    CountNo := 0;
                                    TotalBalanceLoan := 0;
                                    NoLoop := 0;
                                    LoanAllocationT := 0;
                                    //Count Guarantors


                                    LGuar.Reset;
                                    LGuar.SetRange(LGuar."Loan No", Loans."Loan No.");
                                    LGuar.SetRange(LGuar.Substituted, false);
                                    LGuar.SetRange("Self Guarantee", false);
                                    if LGuar.Find('-') then begin
                                        repeat
                                            if SavingsAccounts.Get(LGuar."Savings Account No./Member No.") then begin
                                                if SavingsAccounts.Status = SavingsAccounts.Status::Active then begin
                                                    CountNo := CountNo + 1;
                                                end;
                                            end;
                                        until LGuar.Next = 0;
                                    end;



                                    LGuarantors.Reset;
                                    LGuarantors.SetRange(LGuarantors."Loan No", Loans."Loan No.");
                                    LGuarantors.SetRange(LGuarantors.Substituted, false);
                                    LGuarantors.SetRange("Guarantor Type", LGuarantors."guarantor type"::Guarantor);
                                    LGuarantors.SetRange("Self Guarantee", false);
                                    if LGuarantors.Find('-') then begin
                                        repeat
                                            if SavingsAccounts.Get(LGuarantors."Savings Account No./Member No.") then begin
                                                if SavingsAccounts.Status = SavingsAccounts.Status::Active then begin
                                                    //Guarantor Recovery
                                                    //***Percentage

                                                    //LoanAllocation:=ROUND(GurAmount/CountNo,1,'=');
                                                    LoanAllocation := GurAmount / CountNo;

                                                    //Get defaulter loan type
                                                    //Defaulter Loan No creted**
                                                    if LoanAllocation > 0 then begin
                                                        ExistPac := false;
                                                        ProductFactory.Reset;
                                                        ProductFactory.SetCurrentkey(ProductFactory."Product ID");
                                                        ProductFactory.SetRange(ProductFactory."Product Class Type", ProductFactory."product class type"::Loan);
                                                        ProductFactory.SetRange(ProductFactory."Nature of Loan Type", ProductFactory."nature of loan type"::Defaulter);
                                                        if ProductFactory.Find('-') then begin
                                                            repeat

                                                                CreditAcc := ProductFactory."Account No. Prefix" + LGuarantors."Member No" + ProdFac."Account No. Suffix";
                                                                if CreditAccounts.Get(CreditAcc) then begin
                                                                    CreditAccounts.CalcFields(CreditAccounts."Balance (LCY)");
                                                                    //IF CreditAccounts."Balance (LCY)"=0 THEN BEGIN
                                                                    ExistPac := true;
                                                                    //EXIT;
                                                                    //  END;
                                                                end else begin

                                                                    CreditAcc := LoanProcess."CreateLoan Account"(LGuarantors."Member No", ProductFactory."Product ID");
                                                                    ExistPac := true;
                                                                end;

                                                            until (ProductFactory.Next = 0) or (ExistPac = true);
                                                        end;
                                                        //End of Get Defauter Loan type

                                                        NewLoans.Reset;
                                                        NewLoans.SetRange(NewLoans."Member No.", LGuarantors."Member No");
                                                        NewLoans.SetRange(NewLoans."Loan Product Type", ProductFactory."Product ID");
                                                        NewLoans.SetRange(NewLoans.Posted, false);
                                                        if NewLoans.Find('-') then
                                                            NewLoans.DeleteAll;

                                                        NewLoans.Init;
                                                        NewLoans."Loan No." := '';
                                                        NewLoans."Member No." := LGuarantors."Member No";//LGurantors."Member No";
                                                                                                         //NewLoans.VALIDATE(NewLoans."Member No.");
                                                        if Members.Get(LGuarantors."Member No") then begin
                                                            NewLoans."Member Name" := Members.Name;
                                                            NewLoans."Staff No" := Members."Payroll/Staff No.";
                                                            NewLoans."Employer Code" := Members."Employer Code";
                                                            NewLoans."Application Date" := LoanRecoveryHeader."Posting Date";
                                                        end;
                                                        NewLoans."Loan Product Type" := ProductFactory."Product ID";
                                                        if ProdFac.Get(ProductFactory."Product ID") then begin
                                                            NewLoans."Loan Product Type Name" := ProdFac."Product Description";
                                                            NewLoans."Grace Period" := ProdFac."Grace Period - Interest";
                                                            NewLoans.Interest := Loans.Interest;//ProdFac."Interest Rate (Min.)";
                                                            NewLoans."Grace Period" := ProdFac."Grace Period - Interest";
                                                            NewLoans."Interest Calculation Method" := Loans."Interest Calculation Method";//ProdFac."Interest Calculation Method";
                                                            NewLoans."Loan Span" := Loans."Loan Span";//ProdFac."Loan Span";
                                                                                                      // Check schedule details
                                                            LoanSched.Reset;
                                                            LoanSched.SetRange(LoanSched."Loan No.", Loans."Loan No.");
                                                            if LoanSched.Find('-') then begin
                                                                repeat
                                                                    if MonthRepay <= Loans."Outstanding Balance" then begin
                                                                        MonthRepay += LoanSched."Monthly Repayment";
                                                                        Install += 1;
                                                                    end;
                                                                until LoanSched.Next = 0;
                                                            end;
                                                            NewLoans.Installments := Loans.Installments - Install;
                                                            // NewLoans.Installments:=ProdFac."Ordinary Default Intallments";
                                                            NewLoans."Compute Interest Due on Postin" := ProdFac."Compute Interest Due on Postin";
                                                            NewLoans."Repayment Frequency" := Loans."Repayment Frequency";//ProdFac."Repayment Frequency";
                                                            NewLoans."Recovery Mode" := ProdFac."Repay Mode";
                                                            NewLoans."Appraisal Parameter Type" := ProdFac."Appraisal Parameter Type";
                                                            NewLoans."Recovery Priority" := Loans."Recovery Priority";//ProdFac."Recovery Priority";
                                                        end;
                                                        NewLoans."Application Date" := LoanRecoveryHeader."Posting Date";
                                                        if (Loans."Approved Amount" > 0) and (Loans.Installments > 0) then
                                                            NewLoans.Installments := ROUND((Loans."Outstanding Balance")
                                                                                      / (Loans."Approved Amount" / Loans.Installments), 1, '>');
                                                        NewLoans."Requested Amount" := LoanAllocation;
                                                        NewLoans."Approved Amount" := LoanAllocation;
                                                        NewLoans.Validate(NewLoans."Approved Amount");
                                                        NewLoans.Status := NewLoans.Status::Approved;
                                                        NewLoans."Disbursement Date" := LoanRecoveryHeader."Posting Date";
                                                        NewLoans."Repayment Start Date" := LoanRecoveryHeader."Posting Date";
                                                        //NewLoans.batch"Batch No.":="Batch No.";
                                                        NewLoans."Recovered Loan" := Loans."Loan No.";
                                                        NewLoans."Loan Account" := CreditAcc;
                                                        NewLoans."Loan Recovery No." := LoanRecoveryHeader."No.";
                                                        NewLoans.Repayment := ROUND(NewLoans.Repayment, 1, '>');
                                                        NewLoans.Advice := true;
                                                        NewLoans."Advice Type" := NewLoans."advice type"::"Fresh Loan";
                                                        NewLoans.Insert(true);

                                                        NewLoans.Reset;
                                                        NewLoans.SetRange(NewLoans."Member No.", LGuarantors."Member No");
                                                        NewLoans.SetRange(NewLoans."Loan Product Type", ProductFactory."Product ID");
                                                        NewLoans.SetRange(NewLoans.Posted, false);
                                                        if NewLoans.Find('-') then begin


                                                            AcctType := Accttype::Credit;
                                                            TransType := Transtype::Loan;
                                                            LineNo := LineNo + 10000;

                                                            LoanAllocationT += LoanAllocation;

                                                            NoLoop += 1;
                                                            if NoLoop = CountNo then
                                                                TotalBalanceLoan := GurAmount - LoanAllocationT//ROUND((LoanAllocation*CountNo),0.01,'=')
                                                            else
                                                                TotalBalanceLoan := 0;

                                                            //MESSAGE('%1 a %2 b %3 c %4',GurAmount,LoanAllocation*CountNo,CountNo,TotalBalanceLoan);
                                                            if LoanAllocation <> 0 then
                                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                                Txt0005 + ':Member No-' + Loans."Member No." + ':Loan No' + Loans."Loan No.", LoanAllocation + TotalBalanceLoan, NewLoans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                                                BalAccNo, NewLoans."Loan No.", Dim1, Dim2, TransType, NewLoans."Loan No.", '', '', 0, '', 0);


                                                            NewLoans.Posted := true;
                                                            NewLoans.Modify;

                                                            //Generate Schedule
                                                            GetInstallments(NewLoans."Loan No.");

                                                            //Advice Loan
                                                            NewLoans.Validate(Repayment);


                                                            //Off Set Loans

                                                            //Interest


                                                            AcctType := Accttype::Credit;
                                                            TransType := Transtype::"Interest Paid";
                                                            LineNo := LineNo + 10000;
                                                            //Amt:=-ROUND((IntBalance/CountNo),1,'=');
                                                            Amt := -(IntBalance / CountNo);


                                                            if Amt <> 0 then
                                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                                Txt0006 + LGuarantors."Member No", Amt, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                                            //Principle
                                                            AcctType := Accttype::Credit;
                                                            TransType := Transtype::Repayment;
                                                            LineNo := LineNo + 10000;
                                                            //Amt:=-ROUND((PrinBalance/CountNo),1,'=');
                                                            Amt := -(PrinBalance / CountNo);


                                                            if Amt <> 0 then
                                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                                Txt0006 + LGuarantors."Member No", Amt - TotalBalanceLoan, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);



                                                            //Guarantor Recovery**********||*****

                                                            //Proportional distribution
                                                            //if accounts.get(LGuarantors."SACCO Account No.") then begin
                                                            Members.Get(NewLoans."Member No.");
                                                            SendSMS.SendSms(Sourcetype::"Loan defaulted", Members."Mobile Phone No", 'Dear member you have been attached Loan of Kes'
                                                            + Format(ROUND(NewLoans."Approved Amount", 1, '=')) + ' ' + 'for defaulted loan you guaranteed Member No.' + Loans."Member No." + '-' + Loans."Member Name" + '' +
                                                           ' if in dispute call 0709943000', NewLoans."Loan No.", NewLoans."Disbursement Account No", false);
                                                            /*
                                                             Members.GET(NewLoans."Member No.");
                                                             SendSMS.SendSms(SourceType::"Loan defaulted",Members."Mobile Phone No",'Your have been assigend Loan of '+FORMAT(NewLoans."Approved Amount")+' '+'recovered from guranteed defaulter Member No.'+Members."No."+''
                                                                 ,NewLoans."Loan No.",NewLoans."Disbursement Account No",FALSE);*/
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        until LGuarantors.Next = 0;
                                    end;
                                end;
                            end;
                        end;


                        Members.Get(Loans."Member No.");
                        SendSMS.SendSms(Sourcetype::"Loan defaulted", Members."Mobile Phone No", 'Your loan of Kes' + Format(Loans."Outstanding Balance" + Loans."Outstanding Interest") +
                        'has been recovered from your Deposits/Guarantors.You will be listed on CRB Call us on 0709943000', Loans."Loan No.", '', false);
                    until Loans.Next = 0;
                end;

                //
                //Recover Loans Short Term

                TotalRecoveryAmount := ShortTerm;
                RunBal := 0;
                Loans.Reset;
                Loans.SetCurrentkey("Recovery Priority");
                Loans.SetRange(Loans."Member No.", LoanRecoveryHeader."Member No.");
                //Loans.SETRANGE("Loan Span",Loans."Loan Span"::"Short Term");
                Loans.SetFilter(Loans."Outstanding Balance", '>0');
                if Loans.Find('-') then begin
                    repeat

                        if ProductF.Get(Loans."Loan Product Type") then begin
                            if ProductF."Minimum Guarantors" <> 0 then begin
                                // IF Loans.GET(LoanRecoveryHeader."Loan No.") THEN
                                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", "Outstanding Bills");
                                RunBal := RunBal + (Loans."Outstanding Balance" + Loans."Outstanding Interest");
                            end;
                        end;
                    until Loans.Next = 0;
                end;

                Loans.Reset;
                Loans.SetCurrentkey("Recovery Priority");
                Loans.SetRange("Member No.", LoanRecoveryHeader."Member No.");
                //Loans.SETRANGE("Loan Span",Loans."Loan Span"::"Short Term");
                Loans.SetFilter("Outstanding Balance", '>0');
                if Loans.Find('-') then begin
                    repeat
                        Loans.CalcFields("Outstanding Balance", "Outstanding Interest", "Outstanding Bills");
                        if ProductF.Get(Loans."Loan Product Type") then begin
                            if ProductF."Minimum Guarantors" <> 0 then begin


                                IntBalance := Loans."Outstanding Interest";
                                PrinBalance := Loans."Outstanding Balance";

                                //LoanAmount:=ROUND((IntBalance+PrinBalance)/RunBal*TotalRecoveryAmount,1,'=');
                                LoanAmount := (IntBalance + PrinBalance) / RunBal * TotalRecoveryAmount;
                                LoanAmountBal := LoanAmount;

                                //MESSAGE('Int %1 and Princ %2 tota %3',IntBalance,PrinBalance,LoanAmount);
                                //Deposits Exist
                                if ShortTerm > 0 then begin
                                    if Loans."Outstanding Interest" > 0 then begin
                                        //Interest+++++++
                                        Amt := 0;
                                        AcctType := Accttype::Credit;
                                        TransType := Transtype::"Interest Paid";
                                        LineNo := LineNo + 10000;
                                        if Loans."Outstanding Interest" > LoanAmount then
                                            Amt := LoanAmount
                                        else
                                            Amt := Loans."Outstanding Interest";

                                        if Amt <> 0 then
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                            Txt0001, Amt * -1, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                        //Amt:=0;


                                        AcctType := Accttype::Savings;
                                        TransType := Transtype::" ";
                                        LineNo := LineNo + 10000;

                                        if SavingsAmt > Amt then begin


                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                            Txt0008, Amt, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                            SavingsAmt := Amt;

                                        end else begin//Savings Amount

                                            if Amt <> 0 then begin
                                                // LineNo:=LineNo+10000;
                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                Txt0008, SavingsAmt, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                                LineNo := LineNo + 10000;

                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                Txt0001, (Amt - SavingsAmt), ShorttermAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                                SavingsAmt := 0;

                                            end;
                                        end;

                                        /* IF Amt<>0 THEN
                                         JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,LoanRecoveryHeader."No.",
                                         Txt0001,Amt*-1,ShorttermAcc,LoanRecoveryHeader."Posting Date",BalAccType,
                                         BalAccNo,Loans."Loan No.",Dim1,Dim2,TransType,Loans."Loan No.",'','',0,'',0);*/

                                        LoanAmount := LoanAmount - Amt;
                                        IntBalance := Amt;
                                        //ShortTerm-=LoanAmount;
                                    end;

                                    if Loans."Outstanding Balance" > 0 then begin
                                        Amt := 0;
                                        //MESSAGE('%1',LoanAmount);
                                        if LoanAmount > 0 then begin
                                            AcctType := Accttype::Credit;
                                            TransType := Transtype::Repayment;
                                            LineNo := LineNo + 10000;
                                            if Loans."Outstanding Balance" > LoanAmount then
                                                Amt := LoanAmount
                                            else
                                                Amt := Loans."Outstanding Balance";

                                            if Amt <> 0 then
                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                Txt0003, Amt * -1, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);



                                            //Bills
                                            AcctType := Accttype::Credit;
                                            TransType := Transtype::Bills;
                                            LineNo := LineNo + 10000;

                                            if ProductFactory.Get(Loans."Loan Product Type") then begin

                                                if Loans."Outstanding Bills" <> 0 then
                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                    Txt0007 + Loans."Loan No.", Loans."Outstanding Bills" * -1, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                                    ProductFactory."Billed Account", Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                            end;

                                            AcctType := Accttype::Savings;
                                            TransType := Transtype::" ";
                                            LineNo := LineNo + 10000;

                                            if SavingsAmt > Amt then begin


                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                Txt0009, Amt, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                                SavingsAmt := Amt;

                                            end else begin//Saivings Recovery

                                                if Amt <> 0 then begin
                                                    // LineNo:=LineNo+10000;
                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                    Txt0009, SavingsAmt, SavingsAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                                    BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                                    LineNo := LineNo + 10000;

                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                    Txt0004, (Amt - SavingsAmt), ShorttermAcc, LoanRecoveryHeader."Posting Date", BalAccType,
                                                    BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                                    SavingsAmt := 0;
                                                end;
                                            end;
                                            /*
                                            IF Amt<>0 THEN
                                            JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,LoanRecoveryHeader."No.",
                                            Txt0004+Loans."Loan No.",Amt*-1,ShorttermAcc,LoanRecoveryHeader."Posting Date",BalAccType,
                                            BalAccNo,Loans."Loan No.",Dim1,Dim2,TransType,Loans."Loan No.",'','',0,'',0);*/

                                        end;
                                        LoanAmount := LoanAmount - Amt;
                                        //ShortTerm-=LoanAmount;
                                        PrinBalance := Amt;
                                    end;

                                end;
                                ShortTerm -= LoanAmountBal;
                                //Transfer balance to guarantors
                                //Check if balance is cleared by non-withdrawables
                                //MESSAGE('--Int %1 and Princ %2 toa%3',IntBalance,PrinBalance,LoanAmount);

                                PrinBalance := Loans."Outstanding Balance" - PrinBalance;
                                IntBalance := Loans."Outstanding Interest" - IntBalance;
                                //MESSAGE('%1 AND %2 and %3 and %4',Loans."Outstanding Balance",PrinBalance,PrinBalance+IntBalance,LoanAmountBal);

                                GurAmount := (Loans."Outstanding Balance" + Loans."Outstanding Interest") - LoanAmountBal;


                                if (GurAmount > 0) then begin
                                    CountNo := 0;
                                    NoLoop := 0;
                                    TotalBalanceLoan := 0;
                                    LoanAllocationT := 0;
                                    //Count Guarantors


                                    LGuar.Reset;
                                    LGuar.SetRange(LGuar."Loan No", Loans."Loan No.");
                                    LGuar.SetRange(LGuar.Substituted, false);
                                    LGuar.SetRange("Self Guarantee", false);
                                    if LGuar.Find('-') then begin
                                        repeat
                                            if SavingsAccounts.Get(LGuar."Savings Account No./Member No.") then begin
                                                if SavingsAccounts.Status = SavingsAccounts.Status::Active then begin
                                                    CountNo := CountNo + 1;
                                                end;
                                            end;
                                        until LGuar.Next = 0;
                                    end;



                                    LGuarantors.Reset;
                                    LGuarantors.SetRange(LGuarantors."Loan No", Loans."Loan No.");
                                    LGuarantors.SetRange(LGuarantors.Substituted, false);
                                    LGuarantors.SetRange("Guarantor Type", LGuarantors."guarantor type"::Guarantor);
                                    LGuarantors.SetRange("Self Guarantee", false);
                                    if LGuarantors.Find('-') then begin
                                        repeat
                                            if SavingsAccounts.Get(LGuarantors."Savings Account No./Member No.") then begin
                                                if SavingsAccounts.Status = SavingsAccounts.Status::Active then begin
                                                    //Guarantor Recovery
                                                    //***Percentage

                                                    // LoanAllocation:=ROUND(GurAmount/CountNo,1,'=');
                                                    LoanAllocation := GurAmount / CountNo;
                                                    if LoanAllocation > 0 then begin


                                                        //Get defaulter loan type
                                                        //Defaulter Loan No creted**

                                                        ExistPac := false;
                                                        ProductFactory.Reset;
                                                        ProductFactory.SetCurrentkey(ProductFactory."Product ID");
                                                        ProductFactory.SetRange(ProductFactory."Product Class Type", ProductFactory."product class type"::Loan);
                                                        ProductFactory.SetRange(ProductFactory."Nature of Loan Type", ProductFactory."nature of loan type"::Defaulter);
                                                        if ProductFactory.Find('-') then begin
                                                            repeat

                                                                CreditAcc := ProductFactory."Account No. Prefix" + LGuarantors."Member No" + ProdFac."Account No. Suffix";
                                                                if CreditAccounts.Get(CreditAcc) then begin
                                                                    CreditAccounts.CalcFields(CreditAccounts."Balance (LCY)");
                                                                    //IF CreditAccounts."Balance (LCY)"=0 THEN BEGIN
                                                                    ExistPac := true;
                                                                    //EXIT;
                                                                    //  END;
                                                                end else begin

                                                                    CreditAcc := LoanProcess."CreateLoan Account"(LGuarantors."Member No", ProductFactory."Product ID");
                                                                    ExistPac := true;
                                                                end;

                                                            until (ProductFactory.Next = 0) or (ExistPac = true);
                                                        end;
                                                        //End of Get Defauter Loan type

                                                        NewLoans.Reset;
                                                        NewLoans.SetRange(NewLoans."Member No.", LGuarantors."Member No");
                                                        NewLoans.SetRange(NewLoans."Loan Product Type", ProductFactory."Product ID");
                                                        NewLoans.SetRange(NewLoans.Posted, false);
                                                        if NewLoans.Find('-') then
                                                            NewLoans.DeleteAll;

                                                        NewLoans.Init;
                                                        NewLoans."Loan No." := '';
                                                        NewLoans."Member No." := LGuarantors."Member No";//LGurantors."Member No";
                                                                                                         //NewLoans.VALIDATE(NewLoans."Member No.");
                                                        if Members.Get(LGuarantors."Member No") then begin
                                                            NewLoans."Member Name" := Members.Name;
                                                            NewLoans."Staff No" := Members."Payroll/Staff No.";
                                                            NewLoans."Employer Code" := Members."Employer Code";
                                                            NewLoans."Application Date" := LoanRecoveryHeader."Posting Date";
                                                        end;
                                                        NewLoans."Loan Product Type" := ProductFactory."Product ID";
                                                        //NewLoans.VALIDATE(NewLoans."Loan Product Type");
                                                        if ProdFac.Get(ProductFactory."Product ID") then begin
                                                            NewLoans."Loan Product Type Name" := ProdFac."Product Description";
                                                            NewLoans."Grace Period" := ProdFac."Grace Period - Interest";
                                                            NewLoans.Interest := Loans.Interest;//ProdFac."Interest Rate (Min.)";
                                                            NewLoans."Grace Period" := ProdFac."Grace Period - Interest";
                                                            NewLoans."Interest Calculation Method" := Loans."Interest Calculation Method";//ProdFac."Interest Calculation Method";
                                                            NewLoans."Loan Span" := ProdFac."Loan Span";

                                                            // Check schedule details
                                                            LoanSched.Reset;
                                                            LoanSched.SetRange(LoanSched."Loan No.", Loans."Loan No.");
                                                            if LoanSched.Find('-') then begin
                                                                repeat
                                                                    if MonthRepay <= Loans."Outstanding Balance" then begin
                                                                        MonthRepay += LoanSched."Monthly Repayment";
                                                                        Install += 1;
                                                                    end;
                                                                until LoanSched.Next = 0;
                                                            end;
                                                            NewLoans.Installments := Loans.Installments - Install;
                                                            //  NewLoans.Installments:=ProdFac."Ordinary Default Intallments";
                                                            NewLoans."Compute Interest Due on Postin" := ProdFac."Compute Interest Due on Postin";
                                                            NewLoans."Repayment Frequency" := ProdFac."Repayment Frequency";
                                                            NewLoans."Recovery Mode" := ProdFac."Repay Mode";
                                                            NewLoans."Appraisal Parameter Type" := ProdFac."Appraisal Parameter Type";
                                                            NewLoans."Recovery Priority" := Loans."Recovery Priority";//ProdFac."Recovery Priority";
                                                        end;
                                                        NewLoans."Application Date" := LoanRecoveryHeader."Posting Date";
                                                        if (Loans."Approved Amount" > 0) and (Loans.Installments > 0) then
                                                            NewLoans.Installments := ROUND((Loans."Outstanding Balance")
                                                                                      / (Loans."Approved Amount" / Loans.Installments), 1, '>');
                                                        NewLoans."Requested Amount" := LoanAllocation;
                                                        NewLoans."Approved Amount" := LoanAllocation;
                                                        NewLoans.Validate(NewLoans."Approved Amount");
                                                        NewLoans.Status := NewLoans.Status::Approved;
                                                        NewLoans."Disbursement Date" := LoanRecoveryHeader."Posting Date";
                                                        NewLoans."Repayment Start Date" := LoanRecoveryHeader."Posting Date";
                                                        NewLoans."Recovered Loan" := Loans."Loan No.";
                                                        NewLoans."Loan Account" := CreditAcc;
                                                        NewLoans."Loan Recovery No." := LoanRecoveryHeader."No.";
                                                        NewLoans.Repayment := ROUND(NewLoans.Repayment, 1, '>');
                                                        NewLoans.Advice := true;
                                                        NewLoans."Advice Type" := NewLoans."advice type"::"Fresh Loan";
                                                        NewLoans.Insert(true);


                                                        NewLoans.Reset;
                                                        NewLoans.SetRange(NewLoans."Member No.", LGuarantors."Member No");
                                                        NewLoans.SetRange(NewLoans."Loan Product Type", ProductFactory."Product ID");
                                                        NewLoans.SetRange(NewLoans.Posted, false);
                                                        if NewLoans.Find('-') then begin


                                                            AcctType := Accttype::Credit;
                                                            TransType := Transtype::Loan;
                                                            LineNo := LineNo + 10000;

                                                            LoanAllocationT += LoanAllocation;

                                                            NoLoop += 1;
                                                            if NoLoop = CountNo then
                                                                TotalBalanceLoan := GurAmount - LoanAllocationT//ROUND((LoanAllocation*CountNo),0.01,'=')
                                                            else
                                                                TotalBalanceLoan := 0;


                                                            if LoanAllocation <> 0 then
                                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                                Txt0005 + ':Member No-' + Loans."Member No." + ':Loan No' + Loans."Loan No.", LoanAllocation + TotalBalanceLoan, NewLoans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                                                BalAccNo, NewLoans."Loan No.", Dim1, Dim2, TransType, NewLoans."Loan No.", '', '', 0, '', 0);


                                                            NewLoans.Posted := true;
                                                            NewLoans.Modify;

                                                            //Generate Schedule
                                                            GetInstallments(NewLoans."Loan No.");

                                                            //Advice Loan
                                                            NewLoans.Validate(Repayment);
                                                            //Off Set Loans

                                                            //Interest


                                                            AcctType := Accttype::Credit;
                                                            TransType := Transtype::"Interest Paid";
                                                            LineNo := LineNo + 10000;
                                                            //Amt:=-ROUND((IntBalance/CountNo),1,'=');
                                                            Amt := -(IntBalance / CountNo);


                                                            if Amt <> 0 then
                                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                                Txt0006 + LGuarantors."Member No", Amt, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                                            //Principle
                                                            AcctType := Accttype::Credit;
                                                            TransType := Transtype::Repayment;
                                                            LineNo := LineNo + 10000;
                                                            // Amt:=-ROUND((PrinBalance/CountNo),1,'=');
                                                            Amt := -(PrinBalance / CountNo);

                                                            /// MESSAGE('%1 BA %2 %3',Amt,ROUND((IntBalance/CountNo)),LoanAllocation);
                                                            if Amt <> 0 then
                                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                                Txt0006 + LGuarantors."Member No", Amt - TotalBalanceLoan, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                                            Members.Get(NewLoans."Member No.");
                                                            SendSMS.SendSms(Sourcetype::"Loan defaulted", Members."Mobile Phone No", 'Dear member you have been attached Loan of Kes'
                                                            + Format(ROUND(NewLoans."Approved Amount", 1, '=')) + ' ' + 'for defaulted loan you guaranteed Member No.' + Loans."Member No." + '-' + Loans."Member Name" + '' +
                                                           ' if in dispute call 0709943000', NewLoans."Loan No.", NewLoans."Disbursement Account No", false);

                                                        end;
                                                    end;
                                                end;
                                            end;
                                        until LGuarantors.Next = 0;
                                    end;
                                end;
                            end;
                        end;
                        Members.Get(Loans."Member No.");
                        SendSMS.SendSms(Sourcetype::"Loan defaulted", Members."Mobile Phone No", 'Your loan of ' + Format(Loans."Outstanding Balance" + Loans."Outstanding Interest") +
                        'has been recovered from your Deposits/Guarantors.You will be listed on CRB Call us on 0709943000', Loans."Loan No.", '', false);
                    until Loans.Next = 0;
                end;

                Members.Get(LoanRecoveryHeader."Member No.");
                if Members.Status <> Members.Status::Deceased then begin
                    Members.Status := Members.Status::Defaulter;
                    Members.Modify;
                end;

                ///^^^^^^^^^^^^^^^^^Detachment
            end else
                if LoanRecoveryHeader."Recovery Type" = LoanRecoveryHeader."recovery type"::Detachement then begin

                    //ERROR('ffff');
                    if LoanRecoveryHeaderRecovered.Get(LoanRecoveryHeader."Detach Recovery No") then begin
                        //ERROR(FORMAT(LoanRecoveryHeaderRecovered."Recovery Type"));
                        if LoanRecoveryHeaderRecovered."Recovery Type" = LoanRecoveryHeaderRecovered."recovery type"::Single then begin
                            LoanRecoveryHeader.TestField("Loan No.");
                            Loans.Reset;
                            Loans.SetRange("Member No.", LoanRecoveryHeader."Member No.");
                            Loans.SetRange("Loan No.", LoanRecoveryHeader."Loan No.");
                            if Loans.Find('-') then begin
                                repeat
                                    TotalDetach := 0;
                                    NewLoans.Reset;
                                    NewLoans.SetRange("Recovered Loan", Loans."Loan No.");
                                    if NewLoans.Find('-') then begin
                                        repeat

                                            CreditLedgerEntry.Reset;
                                            CreditLedgerEntry.SetRange("Customer No.", NewLoans."Loan Account");
                                            CreditLedgerEntry.SetRange("Document No.", NewLoans."Loan Recovery No.");
                                            CreditLedgerEntry.SetRange("Transaction Type", CreditLedgerEntry."transaction type"::Loan);
                                            if CreditLedgerEntry.Find('-') then begin

                                                //Principle
                                                AcctType := Accttype::Credit;
                                                TransType := Transtype::Repayment;
                                                LineNo := LineNo + 10000;
                                                Amt := CreditLedgerEntry.Amount * -1;

                                                // MESSAGE('%1 one number BA %2 %3',Amt,ROUND((IntBalance/CountNo)),LoanAllocation);
                                                if Amt <> 0 then
                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                    Txt0010 + ' : ' + Loans."Loan No.", Amt, NewLoans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                                    BalAccNo, NewLoans."Loan No.", Dim1, Dim2, TransType, NewLoans."Loan No.", '', '', 0, '', 0);
                                                TotalDetach += CreditLedgerEntry.Amount;
                                                NewLoans."Loan Recovery No." := LoanRecoveryHeader."No.";
                                                NewLoans.Modify;

                                                MembGuar.Get(NewLoans."Member No.");
                                                /*SendSMS.SendSms(SourceType::"Loan defaulted",MembGuar."Mobile Phone No",'Dear member you have been detached from the Loan of Kes'
                                                +FORMAT(ROUND(NewLoans."Approved Amount",1,'='))+' '+'for Member No.'+Loans."Member No."+'-'+Loans."Member Name"+''+
                                               '. For enquiries, call 0709943000',NewLoans."Loan No.",NewLoans."Disbursement Account No",FALSE);*/

                                                LoanProcess.AdviceLoan(NewLoans."Loan No.", true);

                                            end;
                                        until NewLoans.Next = 0;

                                        LoanRecoveryHeader2.Reset;
                                        LoanRecoveryHeader2.SetRange("Member No.", Loans."Member No.");
                                        LoanRecoveryHeader2.SetFilter("Recovery Type", '<>%1', LoanRecoveryHeader2."recovery type"::Detachement);
                                        LoanRecoveryHeader2.SetRange("No.", LoanRecoveryHeader."Detach Recovery No");
                                        LoanRecoveryHeader2.SetRange(Recovered, true);
                                        if LoanRecoveryHeader2.Find('+') then begin
                                            SavingsAccounts.Reset;
                                            SavingsAccounts.SetRange("Member No.", LoanRecoveryHeader2."Member No.");
                                            SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Deposit Contribution");

                                            Members.Get(Loans."Member No.");
                                            /* SendSMS.SendSms(SourceType::"Loan defaulted",Members."Mobile Phone No",'Your loan of '+FORMAT(LoanRecoveryHeader2."Outstanding Balance")+
                                             ' has been detached from your Deposits/Guarantors.Call us on 0709943000',Loans."Loan No.",'',FALSE);*/



                                            if SavingsAccounts.Find('-') then begin
                                                SavAmount := LoanRecoveryHeader2."Member Deposits";
                                                //Principle
                                                AcctType := Accttype::Savings;
                                                TransType := Transtype::" ";
                                                LineNo := LineNo + 10000;
                                                Amt := SavAmount * -1;

                                                if Amt <> 0 then
                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                    Txt0011 + ' : ' + NewLoans."Loan No.", Amt, SavingsAccounts."No.", LoanRecoveryHeader."Posting Date", BalAccType,
                                                    BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                            end;
                                        end;
                                        //Principle
                                        AcctType := Accttype::Credit;
                                        TransType := Transtype::Loan;
                                        LineNo := LineNo + 10000;
                                        Amt := TotalDetach + Abs(SavAmount);

                                        /// MESSAGE('%1 BA %2 %3',Amt,ROUND((IntBalance/CountNo)),LoanAllocation);
                                        if Amt <> 0 then
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                            Txt0011 + ' : ' + NewLoans."Loan No.", Amt, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                    end else begin

                                        LoanRecoveryHeader2.Reset;
                                        LoanRecoveryHeader2.SetRange("Member No.", Loans."Member No.");
                                        LoanRecoveryHeader2.SetFilter("Recovery Type", '<>%1', LoanRecoveryHeader2."recovery type"::Detachement);
                                        LoanRecoveryHeader2.SetRange("No.", LoanRecoveryHeader."Detach Recovery No");
                                        LoanRecoveryHeader2.SetRange(Recovered, true);
                                        if LoanRecoveryHeader2.Find('-') then begin
                                            SavingsAccounts.Reset;
                                            SavingsAccounts.SetRange("Member No.", LoanRecoveryHeader2."Member No.");
                                            SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Deposit Contribution");
                                            if SavingsAccounts.Find('-') then begin
                                                SavingsLedgerEntry.Reset;
                                                SavingsLedgerEntry.SetRange("Customer No.", SavingsAccounts."No.");
                                                SavingsLedgerEntry.SetRange("Document No.", LoanRecoveryHeader2."No.");
                                                if SavingsLedgerEntry.Find('+') then
                                                    SavingsLedgerEntry.CalcSums(Amount);
                                                SavAmount := SavingsLedgerEntry.Amount;//LoanRecoveryHeader2."Member Deposits";
                                                                                       //Principle
                                                AcctType := Accttype::Savings;
                                                TransType := Transtype::" ";
                                                LineNo := LineNo + 10000;
                                                Amt := SavAmount * -1;
                                                //MESSAGE('%1 BA %2 %3 and %4',Amt,SavAmount,LoanAllocation,LoanRecoveryHeader."Detach Recovery No");
                                                if Amt <> 0 then
                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                    Txt0011 + ' : ' + NewLoans."Loan No.", Amt, SavingsAccounts."No.", LoanRecoveryHeader."Posting Date", BalAccType,
                                                    BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                            end;
                                        end;
                                        //Principle
                                        AcctType := Accttype::Credit;
                                        TransType := Transtype::Loan;
                                        LineNo := LineNo + 10000;
                                        Amt := TotalDetach + Abs(SavAmount);

                                        /// MESSAGE('%1 BA %2 %3',Amt,ROUND((IntBalance/CountNo)),LoanAllocation);
                                        if Amt <> 0 then
                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                            Txt0011 + ' : ' + NewLoans."Loan No.", Amt, Loans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                            BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                    end;
                                    LoanProcess.AdviceLoan(Loans."Loan No.", false);
                                until Loans.Next = 0;
                            end;

                        end else
                            if LoanRecoveryHeaderRecovered."Recovery Type" = LoanRecoveryHeaderRecovered."recovery type"::All then begin
                                //ERROR('Here');
                                DefaultedLoan.Reset;
                                DefaultedLoan.SetRange("Member No.", LoanRecoveryHeaderRecovered."Member No.");
                                DefaultedLoan.SetRange(Posted, true);
                                //Loans.SETRANGE("Loan No.",LoanRecoveryHeader."Loan No.");
                                if DefaultedLoan.Find('-') then begin
                                    repeat
                                        if DefaultedLoan."Loan No." <> '' then begin

                                            CreditLedgerEntryDefaulter.Reset;
                                            CreditLedgerEntryDefaulter.SetRange("Document No.", LoanRecoveryHeaderRecovered."No.");
                                            CreditLedgerEntryDefaulter.SetRange("Loan No", DefaultedLoan."Loan No.");
                                            if CreditLedgerEntryDefaulter.Find('-') then begin
                                                //MESSAGE(DefaultedLoan."Loan No.");
                                                //CreditLedgerEntryDefaulter.CALCSUMS(Amount);
                                                TotalDetach := 0;
                                                //Loans Created to guarantors
                                                if CreditLedgerEntryDefaulter.Amount <> 0 then begin

                                                    //ERROR(FORMAT(CreditLedgerEntryDefaulter.Amount));
                                                    NewLoans.Reset;
                                                    NewLoans.SetRange(/*"Recovered Loan",Loans."Loan No."*/"Loan Recovery No.", LoanRecoveryHeaderRecovered."No.");
                                                    if NewLoans.Find('-') then begin
                                                        repeat

                                                            CreditLedgerEntry.Reset;
                                                            CreditLedgerEntry.SetRange("Customer No.", NewLoans."Loan Account");
                                                            CreditLedgerEntry.SetRange("Document No.", LoanRecoveryHeaderRecovered."No."/*NewLoans."Loan Recovery No."*/);
                                                            CreditLedgerEntry.SetRange("Loan No", NewLoans."Loan No.");
                                                            CreditLedgerEntry.SetRange("Transaction Type", CreditLedgerEntry."transaction type"::Loan);
                                                            if CreditLedgerEntry.Find('-') then begin

                                                                //Principle
                                                                AcctType := Accttype::Credit;
                                                                TransType := Transtype::Repayment;
                                                                LineNo := LineNo + 10000;
                                                                Amt := CreditLedgerEntry.Amount * -1;

                                                                // MESSAGE('%1 one number BA %2 %3',Amt,ROUND((IntBalance/CountNo)),LoanAllocation);
                                                                if Amt <> 0 then
                                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                                    Txt0010 + ' : ' + DefaultedLoan."Loan No.", Amt, NewLoans."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                                                    BalAccNo, NewLoans."Loan No.", Dim1, Dim2, TransType, NewLoans."Loan No.", '', '', 0, '', 0);
                                                                TotalDetach += CreditLedgerEntry.Amount;
                                                                NewLoans."Loan Recovery No." := LoanRecoveryHeader."No.";
                                                                NewLoans.Modify; //Kigen

                                                                MembGuar.Get(NewLoans."Member No.");
                                                                /*SendSMS.SendSms(SourceType::"Loan defaulted",MembGuar."Mobile Phone No",'Dear member you have been detached from the Loan of Kes'
                                                                +FORMAT(ROUND(NewLoans."Approved Amount",1,'='))+' '+'for Member No.'+Loans."Member No."+'-'+Loans."Member Name"+''+
                                                               '. For enquiries, call 0709943000',NewLoans."Loan No.",NewLoans."Disbursement Account No",FALSE);*/

                                                                LoanProcess.AdviceLoan(NewLoans."Loan No.", true);

                                                            end;

                                                        until NewLoans.Next = 0;
                                                    end;

                                                    //Kigen
                                                    LoanRecoveryHeader2.Reset;
                                                    LoanRecoveryHeader2.SetRange("Member No.", DefaultedLoan."Member No.");
                                                    LoanRecoveryHeader2.SetFilter("Recovery Type", '<>%1', LoanRecoveryHeader2."recovery type"::Detachement);
                                                    LoanRecoveryHeader2.SetRange("No.", LoanRecoveryHeader."Detach Recovery No");
                                                    LoanRecoveryHeader2.SetRange(Recovered, true);
                                                    if LoanRecoveryHeader2.Find('+') then begin

                                                        SavingsAccounts.Reset;
                                                        SavingsAccounts.SetRange("Member No.", LoanRecoveryHeader2."Member No.");
                                                        SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Deposit Contribution");

                                                        Members.Get(DefaultedLoan."Member No.");
                                                        /* SendSMS.SendSms(SourceType::"Loan defaulted",Members."Mobile Phone No",'Your loan of '+FORMAT(LoanRecoveryHeader2."Outstanding Balance")+
                                                         ' has been detached from your Deposits/Guarantors.Call us on 0709943000',Loans."Loan No.",'',FALSE);*/



                                                        if SavingsAccounts.Find('-') then begin

                                                            //Kigen

                                                            //Old Savamount SavAmount:=LoanRecoveryHeader2."Member Deposits";
                                                            SavingsLedgerEntry.Reset;
                                                            SavingsLedgerEntry.SetRange("Customer No.", SavingsAccounts."No.");
                                                            SavingsLedgerEntry.SetRange("Document No.", LoanRecoveryHeader2."No.");
                                                            SavingsLedgerEntry.SetRange("External Document No.", DefaultedLoan."Loan No.");
                                                            if SavingsLedgerEntry.Find('+') then
                                                                SavingsLedgerEntry.CalcSums(Amount);
                                                            SavAmount := SavingsLedgerEntry.Amount;//LoanRecoveryHeader2."Member Deposits"
                                                                                                   //Principle
                                                            AcctType := Accttype::Savings;
                                                            TransType := Transtype::" ";
                                                            LineNo := LineNo + 10000;
                                                            Amt := SavAmount * -1;

                                                            if Amt <> 0 then
                                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                                Txt0011 + ' : ' + DefaultedLoan."Loan No.", Amt, SavingsAccounts."No.", LoanRecoveryHeader."Posting Date", BalAccType,
                                                                BalAccNo, DefaultedLoan."Loan No.", Dim1, Dim2, TransType, DefaultedLoan."Loan No.", '', '', 0, '', 0);
                                                        end;

                                                    end;


                                                    //Principle
                                                    AcctType := Accttype::Credit;
                                                    TransType := Transtype::Loan;
                                                    LineNo := LineNo + 10000;
                                                    Amt := TotalDetach + Abs(SavAmount);

                                                    /// MESSAGE('%1 BA %2 %3',Amt,ROUND((IntBalance/CountNo)),LoanAllocation);
                                                    if Amt <> 0 then
                                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                        Txt0011 + ' : ' + NewLoans."Loan No.", Amt, DefaultedLoan."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                                        BalAccNo, DefaultedLoan."Loan No.", Dim1, Dim2, TransType, DefaultedLoan."Loan No.", '', '', 0, '', 0);

                                                end else begin

                                                    LoanRecoveryHeader2.Reset;
                                                    LoanRecoveryHeader2.SetRange("Member No.", DefaultedLoan."Member No.");
                                                    LoanRecoveryHeader2.SetFilter("Recovery Type", '<>%1', LoanRecoveryHeader2."recovery type"::Detachement);
                                                    LoanRecoveryHeader2.SetRange("No.", LoanRecoveryHeader."Detach Recovery No");
                                                    LoanRecoveryHeader2.SetRange(Recovered, true);
                                                    if LoanRecoveryHeader2.Find('-') then begin

                                                        SavingsAccounts.Reset;
                                                        SavingsAccounts.SetRange("Member No.", LoanRecoveryHeader2."Member No.");
                                                        SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Deposit Contribution");
                                                        if SavingsAccounts.Find('-') then begin
                                                            SavingsLedgerEntry.Reset;
                                                            SavingsLedgerEntry.SetRange("Customer No.", SavingsAccounts."No.");
                                                            SavingsLedgerEntry.SetRange("Document No.", LoanRecoveryHeader2."No.");
                                                            if SavingsLedgerEntry.Find('+') then
                                                                SavingsLedgerEntry.CalcSums(Amount);
                                                            SavAmount := SavingsLedgerEntry.Amount;//LoanRecoveryHeader2."Member Deposits";
                                                                                                   //Principle
                                                            AcctType := Accttype::Savings;
                                                            TransType := Transtype::" ";
                                                            LineNo := LineNo + 10000;
                                                            Amt := SavAmount * -1;
                                                            //MESSAGE('%1 BA %2 %3 and %4',Amt,SavAmount,LoanAllocation,LoanRecoveryHeader."Detach Recovery No");
                                                            if Amt <> 0 then
                                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                                Txt0011 + ' : ' + DefaultedLoan."Loan No.", Amt, SavingsAccounts."No.", LoanRecoveryHeader."Posting Date", BalAccType,
                                                                BalAccNo, DefaultedLoan."Loan No.", Dim1, Dim2, TransType, DefaultedLoan."Loan No.", '', '', 0, '', 0);
                                                        end;

                                                    end;
                                                    //Principle
                                                    AcctType := Accttype::Credit;
                                                    TransType := Transtype::Loan;
                                                    LineNo := LineNo + 10000;
                                                    Amt := TotalDetach + Abs(SavAmount);

                                                    /// MESSAGE('%1 BA %2 %3',Amt,ROUND((IntBalance/CountNo)),LoanAllocation);
                                                    if Amt <> 0 then
                                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, LoanRecoveryHeader."No.",
                                                        Txt0011 + ' : ' + NewLoans."Loan No.", Amt, DefaultedLoan."Loan Account", LoanRecoveryHeader."Posting Date", BalAccType,
                                                        BalAccNo, DefaultedLoan."Loan No.", Dim1, Dim2, TransType, DefaultedLoan."Loan No.", '', '', 0, '', 0);

                                                end;
                                                LoanProcess.AdviceLoan(DefaultedLoan."Loan No.", false);

                                            end;

                                        end;
                                    until DefaultedLoan.Next = 0;
                                end;

                            end;

                    end;

                end;
        //^^^^^^^^^^^^^^^^^^Detachment


        if Members.Get(LoanRecoveryHeader."Member No.") then begin
            if Members.Status <> Members.Status::Deceased then begin
                Members.Status := Members.Status::Defaulter;
                Members.Modify;
            end;
        end;

        JournalPosting.CompletePosting(Jtemplate, JBatch);
        LoanRecoveryHeader.Recovered := true;

        LoanRecoveryHeader.Modify;

        //}MESSAGE('%1 and %2',Jtemplate,JBatch);//Kigen
        Message('Recovered Successfully');

    end;


    procedure Token(var Text: Text; Separator: Text) Token: Text[250]
    var
        Pos: Integer;
        Times: Integer;
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

    local procedure GetInstallments(LoanNo: Code[20])
    var
        Loans: Record 52185729;
        NoSetup: Record 52185688;
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        Mem: Record 52185700;
        RemInstallments: Integer;
        Loan: Record 52185729;
        ProdF: Record 52185690;
        LoanSched: Record 52185738;
        PastInstallments: Integer;
        InstallmentsNew: Decimal;
        LoansR: Record 52185729;
        LoanAmount: Decimal;
        InterestRate: Decimal;
        RepayPeriod: Integer;
        LBalance: Decimal;
        RunDate: Date;
        InstalNo: Decimal;
        RepayInterval: DateFormula;
        TotalMRepay: Decimal;
        LInterest: Decimal;
        LPrincipal: Decimal;
        RepayCode: Code[40];
        GrPrinciple: Integer;
        GrInterest: Integer;
        QPrinciple: Decimal;
        QCounter: Integer;
        InPeriod: DateFormula;
        InitialInstal: Integer;
        InitialGraceInt: Integer;
        LoanRepaymentSchedule: Record 52185738;
        LoanApp: Record 52185729;
        PartialSched: Record 52185751;
        UserSet: Record "User Setup";
        ProductInt: Integer;
    begin
        Loans.Reset;
        Loans.SetRange("Loan No.", LoanNo);
        if Loans.Find('-') then begin
            LoanRepaymentSchedule.Reset;
            LoanRepaymentSchedule.SetRange("Repayment Date", Today, 99991230D);
            LoanRepaymentSchedule.SetRange("Loan No.", Loans."Loan No.");
            LoanRepaymentSchedule.SetRange("Reset Schedule", true);
            if LoanRepaymentSchedule.Find('-') then
                LoanRepaymentSchedule.DeleteAll;
            ProductInt := 0;
            ProdF.Reset;
            ProdF.SetRange("Product ID", Loans."Loan Product Type");
            if ProdF.Find('-') then begin
                ProductInt := ProdF."Interest Rate (Max.)";
            end;
            Loans.CalcFields("Outstanding Balance", "Outstanding Interest");
            LoanAmount := Loans."Outstanding Balance" + Loans."Outstanding Interest";
            if Loans.Interest = 0 then
                InterestRate := ProductInt else
                InterestRate := Loans.Interest;
            RepayPeriod := Loans.Installments;
            LBalance := Loans."Outstanding Balance" + Loans."Outstanding Interest";//LoansR."Approved Amount";
            LInterest := 0;
            TotalMRepay := 0;
            LPrincipal := 0;

            RunDate := Today;
            repeat
                InstalNo := InstalNo + 1;


                //Repayment Frequency
                if Loans."Repayment Frequency" = Loans."repayment frequency"::Daily then
                    RunDate := CalcDate('1D', RunDate)
                else
                    if Loans."Repayment Frequency" = Loans."repayment frequency"::Weekly then
                        RunDate := CalcDate('1W', RunDate)
                    else
                        if Loans."Repayment Frequency" = Loans."repayment frequency"::Monthly then
                            RunDate := CalcDate('1M', RunDate)
                        else
                            if Loans."Repayment Frequency" = Loans."repayment frequency"::Quarterly then
                                RunDate := CalcDate('1Q', RunDate);
                //Repayment Frequency

                if Loans."Interest Calculation Method" = Loans."interest calculation method"::Amortised then begin
                    if Loans.Interest > 0 then
                        Loans.TestField(Loans.Interest);
                    //TESTFIELD("New Amortised");
                    TotalMRepay := ROUND((InterestRate / 1200) / (1 - Power((1 + (InterestRate / 1200)), -(RepayPeriod))) * (LoanAmount), 0.0001, '>');
                    LInterest := ROUND(LBalance / 1200 * InterestRate, 0.0001, '>');
                    LPrincipal := TotalMRepay - LInterest;

                    //Update Reschedule
                    Loans.Repayment := LInterest + LPrincipal;

                end;

                if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Straight Line" then begin
                    if Loans.Interest > 0 then
                        Loans.TestField(Loans.Interest);
                    Loans.TestField(Loans.Installments);
                    LPrincipal := LoanAmount / RepayPeriod;
                    LInterest := (InterestRate / 1200) * LoanAmount;

                    //Update Reschedule
                    Loans.Repayment := LPrincipal;

                end;

                if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Reducing Balance" then begin
                    if Loans.Interest > 0 then
                        Loans.TestField(Loans.Interest);
                    //TESTFIELD("New Amortised");
                    LPrincipal := LoanAmount / RepayPeriod;
                    LInterest := (InterestRate / 1200) * LBalance;

                    //Update Reschedue
                    Loans.Repayment := LPrincipal;
                end;

                if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Reducing Flat" then begin
                    Loans.TestField(Loans.Repayment);
                    if LBalance < Loans.Repayment then
                        LPrincipal := LBalance
                    else
                        LPrincipal := Loans.Repayment;
                    //LInterest:=Loans.Interest;
                    LInterest := (Loans."Approved Amount" * (Loans.Interest / 24) * (Loans.Installments + 1)) / (Loans.Installments * 100); //***Constant Reducing Flat Interest
                                                                                                                                            //Update Reschedule
                    Loans.Repayment := LPrincipal;

                end;
                //Loop the Balance
                LBalance := LBalance - LPrincipal;

                Evaluate(RepayCode, Format(InstalNo));


                LoanRepaymentSchedule.Init;
                LoanRepaymentSchedule."Repayment Code" := RepayCode;
                LoanRepaymentSchedule."Loan No." := Loans."Loan No.";
                LoanRepaymentSchedule."Loan Amount" := Loans."Outstanding Balance";
                LoanRepaymentSchedule."Instalment No" := InstalNo;
                LoanRepaymentSchedule."Repayment Date" := RunDate;
                LoanRepaymentSchedule."Member No." := Loans."Member No.";
                LoanRepaymentSchedule."Loan Category" := Loans."Loan Product Type";
                LoanRepaymentSchedule."Monthly Repayment" := LInterest + LPrincipal;
                LoanRepaymentSchedule."Monthly Interest" := LInterest;
                LoanRepaymentSchedule."Principal Repayment" := LPrincipal;
                // LoanRepaymentSchedule."Reset Doc No.":=Loans."Loan Recovery No.""No.";
                LoanRepaymentSchedule."Reset Schedule" := true;
                LoanRepaymentSchedule.Insert;
            until LBalance < 1;
            /*
            IF "Original Installments"<InstalNo THEN
              ERROR(Text0003);
            "New Installments":=InstalNo;*/

            //Loans."New No. of Installment":=InstalNo;

            //MESSAGE('%1',InstalNo);
            //MODIFY;
        end;

    end;


    procedure ConsolidateBuffer(CheckoffBuffer: Record 52185821)
    var
        Buffer: Record 52185821;
        BufferConsolidation: Record 52186135;
        Totals: Decimal;
        CheckoffNo: Code[20];
        BufferNo: Code[20];
        EntryNo: Integer;
        intProgressTotal: Integer;
        diaProgress: Dialog;
        intProgressI: Integer;
        intProgress: Integer;
        TimeProgress: Time;
        NoOfProgressed: Integer;
        NoOfRecsProgress: Integer;
    begin
        //Creating Progress Bar------------------------------------
        intProgressTotal := Buffer.Count;
        diaProgress.Open(Genrating + '@1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@', intProgress);
        intProgressI := 0;
        TimeProgress := Time;
        NoOfRecsProgress := intProgressTotal DIV 100;
        NoOfProgressed := 0;

        //Creating Progress Bar-------------------------------------


        // CountNo:=0;

        BufferConsolidation.DeleteAll;
        Buffer.Reset;
        Buffer.SetRange(Buffer."Checkoff No", CheckoffBuffer."Checkoff No");
        //Buffer.SETFILTER(Amount,'>0');
        if Buffer.Find('-') then begin
            repeat

                //Progress---

                //Progress-------------------------------
                intProgressI += 1;
                if (intProgressI >= NoOfRecsProgress) or (Time - TimeProgress > 1000) then begin
                    NoOfProgressed := NoOfProgressed + intProgressI;
                    diaProgress.Update(1, ROUND(NoOfProgressed / intProgressTotal * 10000, 1));
                    intProgressI := 0;
                    TimeProgress := Time;
                end;
                //Progress------------------------------

                BufferConsolidation.Reset;
                BufferConsolidation.SetRange("Upload No.", Buffer."Upload No.");
                if not BufferConsolidation.Find('-') then begin
                    BufferConsolidation.Init;
                    BufferConsolidation.No := Buffer.No;
                    BufferConsolidation."Upload No." := Buffer."Upload No.";
                    BufferConsolidation.Name := Buffer.Name;
                    BufferConsolidation."Checkoff No" := Buffer."Checkoff No";
                    BufferConsolidation.Amount := Buffer.Amount;
                    BufferConsolidation.Insert;
                end else begin
                    BufferConsolidation.Amount := BufferConsolidation.Amount + Buffer.Amount;
                    BufferConsolidation.Modify;
                end;
                CheckoffNo := Buffer."Checkoff No";
            until Buffer.Next = 0;
        end;

        Buffer.Reset;
        Buffer.SetRange(Buffer."Checkoff No", CheckoffNo);
        if Buffer.Find('-') then
            Buffer.DeleteAll;

        BufferConsolidation.Reset;
        BufferConsolidation.SetRange("Checkoff No", CheckoffNo);
        if BufferConsolidation.Find('-') then begin
            repeat
                EntryNo += 1;
                Buffer.No := EntryNo;
                Buffer."Checkoff No" := BufferConsolidation."Checkoff No";
                Buffer.Name := BufferConsolidation.Name;
                Buffer."Upload No." := BufferConsolidation."Upload No.";
                Buffer.Amount := BufferConsolidation.Amount;
                Buffer.Insert;
            until BufferConsolidation.Next = 0;
        end;
        diaProgress.Close;
    end;


    procedure SendNotcieSMS(MemberNo: Code[20]; DocumentNo: Code[20])
    var
        Members: Record 52185700;
        CompInfo: Record "Company Information";
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        MemberwithdrawalNotice: Record 52185826;
    begin
        //^^SMS
        TotalLoan := 0;
        if Members.Get(MemberNo) then begin
            CompInfo.Get;
            if MemberwithdrawalNotice.Get(DocumentNo) then begin
                if Members."Mobile Phone No" <> '' then begin
                    TotalLoan := MemberwithdrawalNotice."Loans Outstanding Balance" + MemberwithdrawalNotice."Loans Outstanding Interest";
                    SendSms.SendSms(Sourcetype::"Member Changes", Members."Mobile Phone No", 'Dear ' + Members."First Name" + ' Your withdrawal notice has been received & matures on ' + Format(MemberwithdrawalNotice."Maturity Date") +
                   '. ' + 'Your Deposits:' + ' ' + Format(MemberwithdrawalNotice."Member Deposit") + ' ' + 'and Total Loans of' + ' ' + Format(TotalLoan) +
                   '. If in dispute call' + ' ' + CompInfo."Phone No.", DocumentNo, DocumentNo, false);
                end;
                Members.Status := Members.Status::"Withdrawal Applicant";
                Members.Modify;
            end;
        end;
        //SMS
    end;


    procedure PostPINResetCharges(MSACCOChangePINNo: Record 52185768)
    var
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit,TreasuryTransactions,BSC,"Risk Claim",Delegate,Maint,TellerTransactions,ATMM,GeneralRepair,Saccotransffers,ImprestSurrender,"BL Opening","Risk Closure","Defaulter Recovery","Guarantors Subsitute",MPESAApp,MPESAChange;
        SavingsAccounts: Record 52185730;
        TChargeAmount: Decimal;
        TCharges: Decimal;
        TransactionCharges: Record 52185774;
        ChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        Trans: Record 52185776;
        GenSetup: Record 52185689;
        AccountTypes: Record 52185690;
        TransType: Record 52185773;
        JTemp: Code[20];
        JBatch: Code[20];
        BankingUserTemplate: Record 52185782;
        MSGPosted: label 'Posted Successfuly';
        ATMCharge: label 'Atm Card Charges';
        ATMCardTypes: Record 52185851;
        // SendSMS: Codeunit SendSms;
        SavingsAcc: Record 52185730;
        Txt004: label 'Your ATM Card application has been received and is being processed.';
        CashierTransactions: Record 52185776;
    begin
        GenSetup.Get();
        if MSACCOChangePINNo."PIN Rest Charges Applied" = true then Error('This account has already been applied PIN Rest charges');
        //IF CONFIRM('Confirm Pin Rest Charges?') THEN
        begin
            // DELETE ANY LINE ITEM THAT MAY BE PRESENT
            BankingUserTemplate.Get(UserId);
            UserSetup.Get(UserId);
            BankingUserTemplate.TestField("ATM Charges Journal Batch");
            BankingUserTemplate.TestField("ATM Charges Journal Template");
            JTemp := BankingUserTemplate."ATM Charges Journal Template";
            JBatch := BankingUserTemplate."ATM Charges Journal Batch";
            GenJournalLine.Reset;
            GenJournalLine.SetRange(GenJournalLine."Journal Template Name", JTemp);
            GenJournalLine.SetRange(GenJournalLine."Journal Batch Name", JBatch);
            GenJournalLine.DeleteAll;
            GenSetup.Get;
            ChargeAmount := 0;
            //  MESSAGE('here');

            ChargeAmount := 0;
            TransactionCharges.Reset;
            TransactionCharges.SetRange(TransactionCharges."Transaction Type", MSACCOChangePINNo."Charge Transaction Type");
            if TransactionCharges.Find('-') then begin
                repeat
                    ChargeAmount := 0;
                    if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::Normal) or
                    (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::"Stamp Duty") then begin
                        if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" = true then
                            ChargeAmount := TransactionCharges."Charge Amount"//(TransType.Amount*TransactionCharges."Percentage of Amount")*0.01
                        else
                            ChargeAmount := TransactionCharges."Charge Amount";
                        TChargeAmount += ChargeAmount;

                    end;

                    LineNo := LineNo + 10000;

                    GenJournalLine.Reset;
                    GenJournalLine."Journal Template Name" := JTemp;
                    GenJournalLine."Journal Batch Name" := JBatch;
                    GenJournalLine."Document No." := MSACCOChangePINNo.No;
                    GenJournalLine."External Document No." := MSACCOChangePINNo.No;
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                    GenJournalLine."Account No." := TransactionCharges."G/L Account";
                    GenJournalLine."Posting Date" := Today;
                    GenJournalLine.Description := 'Msacco PIN Reset Fee' + '-' + MSACCOChangePINNo.AccountNo;
                    GenJournalLine.Amount := TransactionCharges."Charge Amount" * -1;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine."Shortcut Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine."Shortcut Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;
                until TransactionCharges.Next = 0;


                LineNo := LineNo + 10000;

                GenJournalLine.Reset;
                GenJournalLine."Journal Template Name" := JTemp;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Document No." := MSACCOChangePINNo.No;
                GenJournalLine."External Document No." := MSACCOChangePINNo.No;
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                GenJournalLine."Account No." := MSACCOChangePINNo.AccountNo;
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'Msacco PIN Reset Fee' + '-' + MSACCOChangePINNo.AccountNo;
                ;
                GenJournalLine.Amount := TChargeAmount;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine."Shortcut Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;
            end;
            //Excise Duty
            if TransactionCharges."Recover Excise Duty" = true then begin

                TChargeAmount := TChargeAmount + (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                ;


                LineNo := LineNo + 10000;

                GenJournalLine.Reset;
                GenJournalLine."Journal Template Name" := JTemp;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Document No." := MSACCOChangePINNo.No;
                GenJournalLine."External Document No." := MSACCOChangePINNo.No;
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::"G/L Account";
                GenJournalLine."Account No." := GenSetup."Excise Duty G/L";
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'Msacco Repin Excise Duty' + MSACCOChangePINNo.AccountNo;
                GenJournalLine.Amount := (TransactionCharges."Charge Amount" * GenSetup."Excise Duty (%)" / 100) * -1;
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine."Shortcut Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;

                LineNo := LineNo + 10000;

                GenJournalLine.Reset;
                GenJournalLine."Journal Template Name" := JTemp;
                GenJournalLine."Journal Batch Name" := JBatch;
                GenJournalLine."Document No." := MSACCOChangePINNo.No;
                GenJournalLine."External Document No." := MSACCOChangePINNo.No;
                GenJournalLine."Line No." := LineNo;
                GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                GenJournalLine."Account No." := MSACCOChangePINNo.AccountNo;
                GenJournalLine."Posting Date" := Today;
                GenJournalLine.Description := 'Msacco Repin Excise Duty' + MSACCOChangePINNo.AccountNo;
                GenJournalLine.Amount := (TransactionCharges."Charge Amount" * GenSetup."Excise Duty (%)" / 100);
                GenJournalLine.Validate(GenJournalLine.Amount);
                GenJournalLine."Shortcut Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                GenJournalLine."Shortcut Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                if GenJournalLine.Amount <> 0 then
                    GenJournalLine.Insert;


                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", JTemp);
                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                // if GenJournalLine.Find('-') then begin
                //     Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine)
                // end;
                MSACCOChangePINNo."PIN Rest Charges Applied" := true;
                MSACCOChangePINNo."PIN Rest Charged Date" := Today;
                MSACCOChangePINNo.Modify;

                Message(MSGPosted);
            end;
        end;
    end;


    procedure StopEmplyerSavingAdvice(SavingsAccounts: Record 52185730; NewAmount: Decimal; OldAmount: Decimal)
    var
        CheckoffAdvice: Record 52185818;
        iEntryNo: Integer;
        SavingsAccount: Record 52185730;
        MemberCategory: Record 52185723;
        ProductFactory: Record 52185690;
        Members: Record 52185700;
    begin
        //Advice Deposits Changes
        with SavingsAccounts
           do begin
            CalcFields("Balance (LCY)");
            iEntryNo := 0;
            CheckoffAdvice.Reset;
            if CheckoffAdvice.Find('+') then
                iEntryNo := CheckoffAdvice."Entry No" + 1;
            if Members.Get(SavingsAccounts."Member No.") then begin
                if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Deposit Contribution" then
                    OldAmount := SavingsAccounts."Monthly Contribution";
                if SavingsAccounts."Product Category" = SavingsAccounts."product category"::Benevolent then begin
                    if ProductFactory.Get("Product Type") then begin
                        OldAmount := ProductFactory."Minimum Contribution";
                    end;
                end;

            end;

            if (SavingsAccounts.Status = SavingsAccounts.Status::Closed) or (SavingsAccounts.Status = SavingsAccounts.Status::New) then
                OldAmount := 0;

            CheckoffAdvice.Init;
            CheckoffAdvice."Entry No" := iEntryNo;
            CheckoffAdvice."Account No." := SavingsAccounts."No.";
            CheckoffAdvice."Member No." := SavingsAccounts."Member No.";
            CheckoffAdvice."Payroll No" := SavingsAccounts."Payroll/Staff No.";
            CheckoffAdvice.Validate(CheckoffAdvice."Member No.");
            CheckoffAdvice."Amount On" := 0;
            CheckoffAdvice."Amount Off" := OldAmount;
            CheckoffAdvice.Type := CheckoffAdvice.Type::Savings;

            SavingsAccount.Reset;
            SavingsAccount.SetRange("No.", SavingsAccounts."No.");
            if SavingsAccount.Find('-') then begin
                SavingsAccount.CalcFields("Balance (LCY)");
                CheckoffAdvice."Balance On" := 0;
                CheckoffAdvice."Balance Off" := SavingsAccounts."Employer Balance";
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
                        CheckoffAdvice."Balance On" := CheckoffAdvice."Balance On" + SavingsAccount."Balance (LCY)"
                    else
                        CheckoffAdvice."Balance Off" := SavingsAccount."Employer Balance";
                end;
                CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Stoppage;
            end;

            if SavingsAccounts."Product Category" = SavingsAccounts."product category"::Benevolent then begin
                SavingsAccount.Reset;
                SavingsAccount.SetRange("Member No.", SavingsAccounts."Member No.");
                SavingsAccount.SetFilter(Status, '<>%1', SavingsAccount.Status::Closed);
                SavingsAccount.SetRange("Product Category", SavingsAccount."product category"::Benevolent);
                if SavingsAccount.Find('-') then begin
                    SavingsAccount.CalcFields("Balance (LCY)");
                    CheckoffAdvice."Balance Off" := SavingsAccount."Monthly Contribution";
                    ;
                end;
            end;
            CheckoffAdvice."Advice Method" := CheckoffAdvice."advice method"::Changes;
            CheckoffAdvice."Advice Date" := Today;
            CheckoffAdvice."ID No." := SavingsAccounts."ID No.";
            CheckoffAdvice."Employer Code" := SavingsAccounts."Employer Code";
            CheckoffAdvice.Names := SavingsAccounts.Name;
            CheckoffAdvice."Product Type" := SavingsAccounts."Product Type";
            CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Stoppage;
            CheckoffAdvice."Balance Off" := SavingsAccount."Monthly Contribution";
            CheckoffAdvice."Balance Off" := SavingsAccount."Employer Balance";
            CheckoffAdvice.Validate(CheckoffAdvice."Product Type");
            if (CheckoffAdvice."Amount On" <> 0) or (CheckoffAdvice."Amount Off" <> 0) or (CheckoffAdvice."Balance On" <> 0) or (CheckoffAdvice."Advice Type" = CheckoffAdvice."advice type"::Stoppage) then
                CheckoffAdvice.Insert(true);
        end;
    end;


    procedure InitPost(CashierTrans: Record 52185682)
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
        Text0012: label 'Ensure the Cashier Excess Account iis set up in Banking User Setup';
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


            if "Employer No" = '' then
                Error(Text0006);

            if Amount <= 0 then
                Error(Text0007);
            TestField(Remarks);

            CalcFields("Allocated Amount");


            if (Amount < "Allocated Amount") or ("Allocated Amount" = 0) then
                Error('Amount Allocated must be less than the amount');
            PostEmployerReceipt(CashierTrans, Jtemplate, JBatch, Tillno, DBranch, DActivity);

        end;
    end;

    local procedure PostEmployerReceipt(CashierTrans: Record 52185682; JTemplate: Code[20]; JBatch: Code[20]; TillNo: Code[20]; DBranch: Code[20]; DActivity: Code[20])
    var
        CTransLines: Record 52185683;
        GenJournalLine: Record "Gen. Journal Line";
        Text0009: label 'You have done a transaction of KSHS. ';
        Text0010: label ' of type ';
        Text0011: label ' on ';
        Text0012: label ' on your account ';
        Text0013: label ' at ';
        LineNo: Integer;
    begin

        with CashierTrans do begin
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
            GenJournalLine."Account Type" := GenJournalLine."account type"::Customer;
            GenJournalLine."Account No." := "Employer No";
            GenJournalLine.Validate(GenJournalLine."Account No.");
            GenJournalLine."Posting Date" := "Transaction Date";
            GenJournalLine.Description := Remarks;
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

            CTransLines.Reset;
            CTransLines.SetRange(CTransLines."Transaction No", No);
            if CTransLines.Find('-') then begin
                repeat
                    CTransLines.TestField(CTransLines."Receipt Description");
                    LineNo := LineNo + 10000;

                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := JTemplate;
                    GenJournalLine."Journal Batch Name" := JBatch;
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Document No." := No;
                    GenJournalLine."External Document No." := "Cheque No";
                    GenJournalLine."Posting Date" := "Transaction Date";
                    GenJournalLine.Description := CTransLines."Receipt Description";

                    if CTransLines.Type = CTransLines.Type::"Bank Account" then begin
                        GenJournalLine."Account Type" := GenJournalLine."bal. account type"::"Bank Account"
                    end else
                        if CTransLines.Type = CTransLines.Type::Customer then begin
                            GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Customer
                        end else
                            if CTransLines.Type = CTransLines.Type::"G/L Account" then begin
                                GenJournalLine."Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            end;

                    GenJournalLine."Account No." := CTransLines."Account No";
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine.Amount := CTransLines.Amount;
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

                until CTransLines.Next = 0;
            end;

            //Post New
            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", JTemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            // if GenJournalLine.Find('-') then begin
            //     Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
            // end;
            //Post New

            Posted := false;
            Posted := JournlPosted.PostedSuccessfully();
            if Posted then begin
                Posted := true;
                "Date Posted" := Today;
                "Time Posted" := Time;
                "Posted By" := UserId;
                Status := Status::Posted;
                Modify;
            end;


        end;
    end;


    procedure SendBirthdayMessages()
    var
        Members: Record 52185700;
        GeneralSetUp: Record 52185689;
        BirthdayMessage: Text;
        AnniversaryMessage: Text;
        Years: Integer;
    begin
        //Francis!!!!
        GeneralSetUp.Get;
        GeneralSetUp.TestField("Birthday Message");
        //
        //BirthdayDate
        //-----------------------------------------------------!!
        Members.Reset;
        Members.SetFilter(Status, '%1', Members.Status::Active);
        Members.SetFilter("Date of Birth", '<>%1', 0D);
        if Members.FindFirst then begin
            repeat
                if ((Date2dmy(Members."Date of Birth", 1)) = (Date2dmy(Today, 1)))
                 and ((Date2dmy(Members."Date of Birth", 2)) = (Date2dmy(Today, 2)))
                   then begin
                    BirthdayMessage := StrSubstNo(GeneralSetUp."Birthday Message", Members."First Name");
                    SendSMS.SendSms(Sourcetype::"Account Status", Members."Mobile Phone No", BirthdayMessage, Members."No.", Members."No.", false);
                end;
            until Members.Next = 0;
        end;
        //------------------------------------------------------!!
    end;


    procedure SendAnnversaryMessages()
    var
        Members: Record 52185700;
        GeneralSetUp: Record 52185689;
        BirthdayMessage: Text;
        AnniversaryMessage: Text;
        Years: Integer;
    begin
        //Francis!!!!
        GeneralSetUp.Get();
        //Anniversary Date
        //-----------------------------------------------------!!
        Members.Reset;
        Members.SetFilter(Status, '%1', Members.Status::Active);
        Members.SetFilter("Registration Date", '<>%1', 0D);
        if Members.FindFirst then begin
            repeat
                if ((Date2dmy(Members."Registration Date", 1)) = (Date2dmy(Today, 1)))
                 and ((Date2dmy(Members."Registration Date", 2)) = (Date2dmy(Today, 2)))
                   then begin
                    Years := Date2dmy(Today, 3) - Date2dmy(Members."Registration Date", 3);
                    AnniversaryMessage := StrSubstNo(GeneralSetUp."Membership Anniversary", Members."First Name", Years);
                    SendSMS.SendSms(Sourcetype::"Account Status", Members."Mobile Phone No", AnniversaryMessage, Members."No.", Members."No.", false);
                end;
            until Members.Next = 0;
        end;
        //------------------------------------------------------!!
    end;


    procedure SendTotoBirthdayMessages()
    var
        Members: Record 52185700;
        GeneralSetUp: Record 52185689;
        BirthdayMessage: Text;
        AnniversaryMessage: Text;
        Years: Integer;
        SavingsAccounts: Record 52185730;
    begin
        //Francis!!!!
        GeneralSetUp.Get;
        GeneralSetUp.TestField("Junior Birthday Message");
        //
        //BirthdayDate
        //-----------------------------------------------------!!
        SavingsAccounts.Reset;
        SavingsAccounts.SetFilter(Status, '%1|%2', SavingsAccounts.Status::Active, SavingsAccounts.Status::New);
        SavingsAccounts.SetFilter("Product Category", '%1', SavingsAccounts."product category"::"Junior Savings");
        SavingsAccounts.SetFilter("Date of Birth", '<>%1', 0D);
        if SavingsAccounts.FindFirst then begin
            repeat
                if ((Date2dmy(SavingsAccounts."Date of Birth", 1)) = (Date2dmy(Today, 1)))
                 and ((Date2dmy(SavingsAccounts."Date of Birth", 2)) = (Date2dmy(Today, 2)))
                   then begin
                    BirthdayMessage := StrSubstNo(GeneralSetUp."Junior Birthday Message", SavingsAccounts.Name);
                    SendSMS.SendSms(Sourcetype::"Account Status", SavingsAccounts."Mobile Phone No", BirthdayMessage, SavingsAccounts."No.", SavingsAccounts."No.", false);
                end;
            until SavingsAccounts.Next = 0;
        end;
        //------------------------------------------------------!!
    end;


    procedure GetAccountBalance(AcctNo: Code[20]): Decimal
    var
        Bal: Decimal;
        SavingsAccounts: Record 52185730;
        ProductFactory: Record 52185690;
    begin
        Bal := 0;
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange("No.", AcctNo);
        if SavingsAccounts.Find('-') then begin
            SavingsAccounts.CalcFields("Balance (LCY)", "Uncleared Cheques", "ATM Transactions", "Lien Placed", "Authorised Over Draft");
            if ProductFactory.Get(SavingsAccounts."Product Type") then begin
                Bal := (SavingsAccounts."Balance (LCY)" + SavingsAccounts."Authorised Over Draft") - ProductFactory."Minimum Balance" - SavingsAccounts."Uncleared Cheques" -
                      SavingsAccounts."Lien Placed" - SavingsAccounts."ATM Transactions";
            end;
        end;
        exit(Bal);
    end;


    procedure BillMonthlySinkFund(InterestBuffer: Record 52185860)
    var
        Loans: Record 52185729;
        ProdType: Record 52185690;
        Gnljnline: Record "Gen. Journal Line";
        LineNo: Integer;
        DocNo: Code[20];
        PDate: Date;
        "Document No.": Code[20];
        InterestHeader: Record 52185860;
        LoansInterest: Record 52185859;
        LoanAmount: Decimal;
        CustMember: Record 52185731;
        CurrDate: Date;
        FirstMonthDate: Date;
        CurrMonth: Date;
        MidDate: Date;
        EndDate: Date;
        LastMonthDate: Date;
        FirstDay: Date;
        FirstDate: Date;
        IntCharged: Decimal;
        Principle: Decimal;
        AlreadyPostedErr: label 'This transaction Is Already posted';
        DailyLoansInterest: Record 52185858;
        GeneralSetUp: Record 52185689;
        Memb: Record 52185700;
        Accounts: Record 52185730;
        BenevolentAcc: Record 52185730;
        Category: Record 52185723;
    begin
        with InterestBuffer
          do begin
            if Posted = true then
                Error(AlreadyPostedErr);
            TestField("Document No.");
            TestField("Interest Due Date");
            TestField(Description);
            TestField("Posting Date");
            IntCharged := 0;
            Principle := 0;

            BenevolentAcc.Reset;
            BenevolentAcc.SetFilter("Product Category", '%1', BenevolentAcc."product category"::Benevolent);
            if BenevolentAcc.FindFirst then begin
                repeat
                    BenevolentAcc.CalcFields("Balance (LCY)");
                    Memb.Get(BenevolentAcc."Member No.");
                    if (Memb.Status = Memb.Status::Active) or
                       (Memb.Status = Memb.Status::Defaulter) or
                      (Memb.Status = Memb.Status::New) then begin


                        LoansInterest.Init;
                        LoansInterest.No := "No.";
                        LoansInterest."Account Type" := LoansInterest."account type"::Savings;
                        LoansInterest."Account No" := BenevolentAcc."No.";
                        LoansInterest."Interest Date" := Today;
                        LoansInterest."Interest Bill" := ProdType."Minimum Contribution";
                        LoansInterest."Interest Amount" := ProdType."Minimum Contribution";
                        LoansInterest."Repayment Bill" := ProdType."Minimum Contribution";
                        LoansInterest.Description := Description;
                        LoansInterest."Shortcut Dimension 1 Code" := BenevolentAcc."Global Dimension 1 Code";
                        LoansInterest."Shortcut Dimension 2 Code" := BenevolentAcc."Global Dimension 2 Code";
                        LoansInterest."Loan Product type" := BenevolentAcc."Product Type";
                        if ProdType.Get(BenevolentAcc."Product Type") then begin
                            LoansInterest."Bal. Account Type" := LoansInterest."bal. account type"::"G/L Account";
                            LoansInterest."Bal. Account No." := ProdType."Accrual Fee Acc. (Income)";
                        end;
                        LoansInterest."Outstanding Balance" := BenevolentAcc."Balance (LCY)";
                        ;
                        LoansInterest."Interest Bill" := ProdType."Minimum Contribution";
                        if LoansInterest."Interest Bill" = 0 then
                            LoansInterest."Interest Bill" := ProdType."Minimum Contribution";
                        LoansInterest.Status := Memb.Status;
                        LoansInterest.Insert;
                    end;
                until BenevolentAcc.Next = 0;

            end;
        end;
    end;


    procedure BillMembershipFee(InterestBuffer: Record 52185860)
    var
        Loans: Record 52185729;
        ProdType: Record 52185690;
        Gnljnline: Record "Gen. Journal Line";
        LineNo: Integer;
        DocNo: Code[20];
        PDate: Date;
        "Document No.": Code[20];
        InterestHeader: Record 52185860;
        LoansInterest: Record 52185859;
        LoanAmount: Decimal;
        CustMember: Record 52185731;
        CurrDate: Date;
        FirstMonthDate: Date;
        CurrMonth: Date;
        MidDate: Date;
        EndDate: Date;
        LastMonthDate: Date;
        FirstDay: Date;
        FirstDate: Date;
        IntCharged: Decimal;
        Principle: Decimal;
        AlreadyPostedErr: label 'This transaction Is Already posted';
        DailyLoansInterest: Record 52185858;
        GeneralSetUp: Record 52185689;
        Memb: Record 52185700;
        Accounts: Record 52185730;
        RegFeeAcc: Record 52185730;
        Category: Record 52185723;
    begin
        with InterestBuffer
          do begin
            if Posted = true then
                Error(AlreadyPostedErr);
            TestField("Document No.");
            TestField("Interest Due Date");
            TestField(Description);
            TestField("Posting Date");
            IntCharged := 0;
            Principle := 0;



            RegFeeAcc.Reset;
            RegFeeAcc.SetFilter("Product Category", '%1', RegFeeAcc."product category"::"Registration Fee");
            RegFeeAcc.SetFilter("Balance (LCY)", '=0');
            RegFeeAcc.SetRange("Date Billed", 0D);
            if RegFeeAcc.Find('-') then begin
                repeat
                    RegFeeAcc.CalcFields("Balance (LCY)", "Date Billed");
                    Memb.Get(RegFeeAcc."Member No.");
                    if Memb."Registration Date" >= Dmy2date(1, 9, 2020) then begin
                        if (Memb.Status = Memb.Status::Active) or
                          (Memb.Status = Memb.Status::Defaulter) or
                         (Memb.Status = Memb.Status::New) then begin

                            Memb.TestField("Member Category");
                            Category.Get(Memb."Member Category");
                            Category.TestField("Registration Fee");

                            LoansInterest.Init;
                            LoansInterest.No := "No.";
                            LoansInterest."Account Type" := LoansInterest."account type"::Savings;
                            LoansInterest."Account No" := RegFeeAcc."No.";
                            LoansInterest."Interest Date" := Today;
                            LoansInterest."Interest Bill" := Category."Registration Fee";
                            LoansInterest.Description := Description;
                            LoansInterest."Shortcut Dimension 1 Code" := RegFeeAcc."Global Dimension 1 Code";
                            LoansInterest."Shortcut Dimension 2 Code" := RegFeeAcc."Global Dimension 2 Code";
                            LoansInterest."Loan Product type" := RegFeeAcc."Product Type";
                            if ProdType.Get(RegFeeAcc."Product Type") then begin
                                LoansInterest."Bal. Account Type" := LoansInterest."bal. account type"::"G/L Account";
                                LoansInterest."Bal. Account No." := ProdType."Accrual Fee Acc. (Income)";
                            end;
                            RegFeeAcc.CalcFields("Balance (LCY)");
                            LoansInterest."Outstanding Balance" := RegFeeAcc."Balance (LCY)";
                            ;
                            LoansInterest.Status := Memb.Status;
                            if LoansInterest."Interest Bill" <> 0 then
                                LoansInterest.Insert;
                        end;
                    end;
                until RegFeeAcc.Next = 0;
            end;
        end;
    end;


    procedure BillMonthlyPremierClub(InterestBuffer: Record 52185860)
    var
        Loans: Record 52185729;
        ProdType: Record 52185690;
        Gnljnline: Record "Gen. Journal Line";
        LineNo: Integer;
        DocNo: Code[20];
        PDate: Date;
        "Document No.": Code[20];
        InterestHeader: Record 52185860;
        LoansInterest: Record 52185859;
        LoanAmount: Decimal;
        CustMember: Record 52185731;
        CurrDate: Date;
        FirstMonthDate: Date;
        CurrMonth: Date;
        MidDate: Date;
        EndDate: Date;
        LastMonthDate: Date;
        FirstDay: Date;
        FirstDate: Date;
        IntCharged: Decimal;
        Principle: Decimal;
        AlreadyPostedErr: label 'This transaction Is Already posted';
        DailyLoansInterest: Record 52185858;
        GeneralSetUp: Record 52185689;
        Memb: Record 52185700;
        Accounts: Record 52185730;
        PremierClub: Record 52185730;
        Category: Record 52185723;
    begin
        with InterestBuffer
          do begin
            if Posted = true then
                Error(AlreadyPostedErr);
            TestField("Document No.");
            TestField("Interest Due Date");
            TestField(Description);
            TestField("Posting Date");
            IntCharged := 0;
            Principle := 0;

            //create premier account
            Members.Reset;
            Members.SetRange("Member Category", 'PREMIER');
            if Members.Find('-') then begin
                repeat
                    Accounts.Reset;
                    Accounts.SetRange("Member No.", Members."No.");
                    Accounts.SetRange("Product Category", Accounts."product category"::"Premier Club Account");
                    //if not Accounts.Find('-') then
                        //RegistrationProcess.AnySavingsAccountRegistration(Members."No.", '07');

                    Accounts.Reset;
                    Accounts.SetRange("Member No.", Members."No.");
                    Accounts.SetRange("Product Category", Accounts."product category"::"Premier Club Reg Fee");
                    //if not Accounts.Find('-') then
                        //RegistrationProcess.AnySavingsAccountRegistration(Members."No.", '06');
                until Members.Next = 0;
            end;


            PremierClub.Reset;
            PremierClub.SetFilter("Product Category", '%1', PremierClub."product category"::"Premier Club Account");
            if PremierClub.Find('-') then begin
                repeat
                    PremierClub.CalcFields("Balance (LCY)", "Date Billed");
                    Memb.Get(PremierClub."Member No.");
                    if (Memb.Status = Memb.Status::Active) or
                      (Memb.Status = Memb.Status::Defaulter) or
                     (Memb.Status = Memb.Status::New) then begin
                        ProdType.Get(PremierClub."Product Type");
                        LoansInterest.Init;
                        LoansInterest.No := "No.";
                        LoansInterest."Account Type" := LoansInterest."account type"::Savings;
                        LoansInterest."Account No" := PremierClub."No.";
                        LoansInterest."Interest Date" := Today;
                        //LoansInterest."Interest Bill":=ProdType."Monthly Charges";
                        LoansInterest."Interest Bill" := ProdType."Minimum Contribution";
                        LoansInterest.Description := Description;
                        LoansInterest."Shortcut Dimension 1 Code" := PremierClub."Global Dimension 1 Code";
                        LoansInterest."Shortcut Dimension 2 Code" := PremierClub."Global Dimension 2 Code";
                        LoansInterest."Loan Product type" := PremierClub."Product Type";
                        if ProdType.Get(PremierClub."Product Type") then begin
                            LoansInterest."Bal. Account Type" := LoansInterest."bal. account type"::"G/L Account";
                            LoansInterest."Bal. Account No." := ProdType."Accrual Fee Acc. (Income)";
                        end;
                        PremierClub.CalcFields("Balance (LCY)");
                        LoansInterest."Outstanding Balance" := PremierClub."Balance (LCY)";
                        ;
                        LoansInterest.Status := Memb.Status;
                        if LoansInterest."Interest Bill" <> 0 then
                            LoansInterest.Insert;
                    end;
                until PremierClub.Next = 0;
            end;
        end;
    end;


    procedure BillPremierClubMembership(InterestBuffer: Record 52185860)
    var
        Loans: Record 52185729;
        ProdType: Record 52185690;
        Gnljnline: Record "Gen. Journal Line";
        LineNo: Integer;
        DocNo: Code[20];
        PDate: Date;
        "Document No.": Code[20];
        InterestHeader: Record 52185860;
        LoansInterest: Record 52185859;
        LoanAmount: Decimal;
        CustMember: Record 52185731;
        CurrDate: Date;
        FirstMonthDate: Date;
        CurrMonth: Date;
        MidDate: Date;
        EndDate: Date;
        LastMonthDate: Date;
        FirstDay: Date;
        FirstDate: Date;
        IntCharged: Decimal;
        Principle: Decimal;
        AlreadyPostedErr: label 'This transaction Is Already posted';
        DailyLoansInterest: Record 52185858;
        GeneralSetUp: Record 52185689;
        Memb: Record 52185700;
        Accounts: Record 52185730;
        RegFeeAcc: Record 52185730;
        Category: Record 52185723;
    begin
        with InterestBuffer
          do begin
            if Posted = true then
                Error(AlreadyPostedErr);
            TestField("Document No.");
            TestField("Interest Due Date");
            TestField(Description);
            TestField("Posting Date");
            IntCharged := 0;
            Principle := 0;

            Members.Reset;
            Members.SetRange("Member Category", 'PREMIER');
            if Members.Find('-') then begin
                repeat
                    Accounts.Reset;
                    Accounts.SetRange("Member No.", Members."No.");
                    Accounts.SetRange("Product Category", Accounts."product category"::"Premier Club Reg Fee");
                    //if not Accounts.Find('-') then
                        //RegistrationProcess.AnySavingsAccountRegistration(Members."No.", '06');
                until Members.Next = 0;
            end;


            RegFeeAcc.Reset;
            RegFeeAcc.SetFilter("Product Category", '%1', RegFeeAcc."product category"::"Premier Club Reg Fee");
            RegFeeAcc.SetFilter("Balance (LCY)", '=0');
            RegFeeAcc.SetRange("Date Billed", 0D);
            if RegFeeAcc.Find('-') then begin
                repeat
                    RegFeeAcc.CalcFields("Balance (LCY)", "Date Billed");
                    Memb.Get(RegFeeAcc."Member No.");
                    if RegFeeAcc."Registration Date" >= Dmy2date(1, 9, 2020) then begin
                        if (Memb.Status = Memb.Status::Active) or
                          (Memb.Status = Memb.Status::Defaulter) or
                         (Memb.Status = Memb.Status::New) then begin

                            Memb.TestField("Member Category");
                            Category.Get(Memb."Member Category");
                            Category.TestField("Premier Club Reg Fee");
                            ProdType.Get(RegFeeAcc."Product Type");
                            LoansInterest.Init;
                            LoansInterest.No := "No.";
                            LoansInterest."Account Type" := LoansInterest."account type"::Savings;
                            LoansInterest."Account No" := RegFeeAcc."No.";
                            LoansInterest."Interest Date" := Today;
                            LoansInterest."Interest Bill" := Category."Premier Club Reg Fee";
                            LoansInterest.Description := Description;
                            LoansInterest."Shortcut Dimension 1 Code" := RegFeeAcc."Global Dimension 1 Code";
                            LoansInterest."Shortcut Dimension 2 Code" := RegFeeAcc."Global Dimension 2 Code";
                            LoansInterest."Loan Product type" := RegFeeAcc."Product Type";
                            if ProdType.Get(RegFeeAcc."Product Type") then begin
                                LoansInterest."Bal. Account Type" := LoansInterest."bal. account type"::"G/L Account";
                                LoansInterest."Bal. Account No." := ProdType."Accrual Fee Acc. (Income)";
                            end;
                            RegFeeAcc.CalcFields("Balance (LCY)");
                            LoansInterest."Outstanding Balance" := RegFeeAcc."Balance (LCY)";
                            ;
                            LoansInterest.Status := Memb.Status;
                            if LoansInterest."Interest Bill" <> 0 then
                                LoansInterest.Insert;
                        end;
                    end;
                until RegFeeAcc.Next = 0;
            end;
        end;
    end;


    procedure PostMonthlyBillingEntries(InterestBufferBillAndAccrue: Record 52185860)
    var
        // PeriodicActivities: Codeunit "Periodic Activities";
        members: Record 52185700;
        GenBatches: Record "Gen. Journal Batch";
        PDate: Date;
        LoanType: Record 52185690;
        PostDate: Date;
        LineNo: Integer;
        DocNo: Code[20];
        GenJournalLine: Record "Gen. Journal Line";
        //GLPosting: Codeunit "Gen. Jnl.-Post Line";
        EndDate: Date;
        DontCharge: Boolean;
        JBatch: Code[10];
        Jtemplate: Code[10];
        CustLedger: Record 52185861;
        AccountingPeriod: Record 52185861;
        FiscalYearStartDate: Date;
        "ExtDocNo.": Text[30];
        InterestDue: Decimal;
        LoansInterest: Record 52185859;
        GeneratesuccMSG: label 'Billing Posted Successfully';
        AlreadyPostedErr: label 'This transaction Has already been posted';
        NoTemplateErr: label 'Ensure the Loans Template is set up in Cash Office Setup';
        NoBatchErr: label 'Ensure the Loans Batch is set up in the Cash Office Setup';
        DailyLoansInterestBuffer: Record 52185858;
        SavingsAccounts: Record 52185730;
    begin
        with InterestBufferBillAndAccrue
          do begin
            if Posted = true then
                Error(AlreadyPostedErr);

            Temp.Get(UserId);

            Jtemplate := Temp."Bills Template";
            JBatch := Temp."Bills Batch";

            if Jtemplate = '' then begin
                Error(NoTemplateErr);
            end;
            if JBatch = '' then begin
                Error(NoBatchErr)
            end;

            GenJournalLine.Reset;
            GenJournalLine.SetRange("Journal Template Name", Jtemplate);
            GenJournalLine.SetRange("Journal Batch Name", JBatch);
            GenJournalLine.DeleteAll;

            LoansInterest.Reset;
            LoansInterest.SetRange(LoansInterest.No, "No.");
            LoansInterest.SetRange(Posted, false);
            if LoansInterest.Find('-') then begin
                repeat
                    if LoansInterest."Shortcut Dimension 1 Code" = '' then
                        LoansInterest."Shortcut Dimension 1 Code" := 'Credit';
                    if LoansInterest."Shortcut Dimension 2 Code" = '' then
                        LoansInterest."Shortcut Dimension 2 Code" := 'NBI';
                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange("No.", LoansInterest."Account No");
                    SavingsAccounts.SetFilter(Blocked, '<>%1', SavingsAccounts.Blocked::" ");
                    if SavingsAccounts.FindFirst then begin
                        LoansInterest."Account Blocked" := SavingsAccounts.Blocked;
                        LoansInterest.Modify;
                        if SavingsAccounts.Blocked <> SavingsAccounts.Blocked::" " then begin
                            SavingsAccounts.Blocked := SavingsAccounts.Blocked::" ";
                            SavingsAccounts.Modify;
                        end;
                    end;

                    if LoansInterest."Interest Bill" <> 0 then begin
                        //INTEREST
                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := Jtemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Posting Date" := "Posting Date";
                        GenJournalLine.Description := Description;
                        GenJournalLine."Account Type" := LoansInterest."Account Type";
                        GenJournalLine."Account No." := LoansInterest."Account No";
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := "Document No.";
                        GenJournalLine."Shortcut Dimension 1 Code" := LoansInterest."Shortcut Dimension 1 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine."Shortcut Dimension 2 Code" := LoansInterest."Shortcut Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        GenJournalLine.Amount := LoansInterest."Interest Bill";
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                        GenJournalLine."Bal. Account No." := LoansInterest."Bal. Account No.";
                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Due";
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;
                    end;

                    //Post New
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                    GenJournalLine.SetRange("Journal Batch Name", JBatch);
                    // if GenJournalLine.Find('-') then begin
                    //     Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                    // end;



                    LoansInterest.Transferred := true;
                    LoansInterest.Posted := true;
                    LoansInterest.Modify;
                until LoansInterest.Next = 0;
            end;
            LoansInterest.Reset;
            LoansInterest.SetRange(LoansInterest.No, "No.");
            LoansInterest.SetRange("Account No", SavingsAccounts."No.");
            LoansInterest.SetFilter("Account Blocked", '<>%1', LoansInterest."account blocked"::" ");
            if LoansInterest.Find('-') then begin
                SavingsAccounts.Blocked := LoansInterest."Account Blocked";
                SavingsAccounts.Modify;
            end;




            Posted := true;
            "Posted By" := UserId;
            "Posting Date" := Today;
            Modify;

            Message(GeneratesuccMSG);
        end;
    end;


    procedure BillRejoiningFee(InterestBuffer: Record 52185860)
    var
        Loans: Record 52185729;
        ProdType: Record 52185690;
        Gnljnline: Record "Gen. Journal Line";
        LineNo: Integer;
        DocNo: Code[20];
        PDate: Date;
        "Document No.": Code[20];
        InterestHeader: Record 52185860;
        LoansInterest: Record 52185859;
        LoanAmount: Decimal;
        CustMember: Record 52185731;
        CurrDate: Date;
        FirstMonthDate: Date;
        CurrMonth: Date;
        MidDate: Date;
        EndDate: Date;
        LastMonthDate: Date;
        FirstDay: Date;
        FirstDate: Date;
        IntCharged: Decimal;
        Principle: Decimal;
        AlreadyPostedErr: label 'This transaction Is Already posted';
        DailyLoansInterest: Record 52185858;
        GeneralSetUp: Record 52185689;
        Memb: Record 52185700;
        Accounts: Record 52185730;
        RegFeeAcc: Record 52185730;
        Category: Record 52185723;
    begin
        with InterestBuffer
          do begin
            if Posted = true then
                Error(AlreadyPostedErr);
            TestField("Document No.");
            TestField("Interest Due Date");
            TestField(Description);
            TestField("Posting Date");
            IntCharged := 0;
            Principle := 0;

            GeneralSetUp.Get();

            RegFeeAcc.Reset;
            RegFeeAcc.SetFilter("Product Category", '%1', RegFeeAcc."product category"::"Registration Fee");
            RegFeeAcc.SetRange("Rejoin Bil Date", 0D);
            if RegFeeAcc.Find('-') then begin
                repeat
                    RegFeeAcc.CalcFields("Balance (LCY)", "Date Billed");
                    Memb.Get(RegFeeAcc."Member No.");
                    if Memb."Rejoinig Date" >= Dmy2date(1, 9, 2020) then begin
                        if (Memb.Status = Memb.Status::Active) or
                          (Memb.Status = Memb.Status::Defaulter) or
                         (Memb.Status = Memb.Status::New) then begin


                            LoansInterest.Init;
                            LoansInterest.No := "No.";
                            LoansInterest."Account Type" := LoansInterest."account type"::Savings;
                            LoansInterest."Account No" := RegFeeAcc."No.";
                            LoansInterest."Interest Date" := Today;
                            LoansInterest."Interest Bill" := GeneralSetUp."Rejoining Fee";
                            LoansInterest.Description := Description;
                            LoansInterest."Shortcut Dimension 1 Code" := RegFeeAcc."Global Dimension 1 Code";
                            LoansInterest."Shortcut Dimension 2 Code" := RegFeeAcc."Global Dimension 2 Code";
                            LoansInterest."Loan Product type" := RegFeeAcc."Product Type";
                            if ProdType.Get(RegFeeAcc."Product Type") then begin
                                LoansInterest."Bal. Account Type" := LoansInterest."bal. account type"::"G/L Account";
                                LoansInterest."Bal. Account No." := ProdType."Accrual Fee Acc. (Income)";
                            end;
                            RegFeeAcc.CalcFields("Balance (LCY)");
                            LoansInterest."Outstanding Balance" := RegFeeAcc."Balance (LCY)";
                            ;
                            LoansInterest.Status := Memb.Status;
                            if LoansInterest."Interest Bill" <> 0 then
                                LoansInterest.Insert;
                        end;
                    end;
                until RegFeeAcc.Next = 0;
            end;
        end;
    end;
}

