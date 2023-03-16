#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52186458 "Loans Process"
{

    trigger OnRun()
    begin
    end;

    var
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
        Text0001: label 'The disbursement will exceed approved amount for loan no. %1';
        Descr: Text;
        GenSetup: Record 52185689;
        Members: Record 52185700;
        SendSMS: Codeunit SendSms;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        JournalPostingSucc: Codeunit "Journal Post Successful";
        Post: Boolean;
        FirstLoop: Integer;
        NewContr: Decimal;
        Text0002: label 'The amount to disburse must be greater than zero';
        DaysPast: Integer;
        ChargeExtraComms: Boolean;
        Text0003: label 'This member does not have a depoits account : Member No. %1';
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
        DailyMortgageInterest: Record 52186087;
        BridgLoan: Decimal;
        BLoanNo: Code[20];
        BLoanRec: Record 52185729;
        TotalTopUpCharges: Decimal;


    procedure "CreateLoan Account"(MemberNo: Code[20]; ProdType: Code[20]) LoanAcc: Code[20]
    var
        ProdFac: Record 52185690;
        Loans: Record 52185729;
        Accounts: Record 52185731;
        Member: Record 52185700;
    begin

        if ProdFac.Get(ProdType) then begin
            if (ProdFac."Nature of Loan Type" = ProdFac."nature of loan type"::Normal) or (ProdFac."Nature of Loan Type" = ProdFac."nature of loan type"::" ") then begin
                if Confirm('Are you sure you want to create Loan Account', true) = false then
                    exit;
            end;


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
    end;


    procedure PostLoan(BatchNo: Code[20])
    var
        LoanApp: Record 52185729;
        SavAcc: Record 52185730;
        PeriodicActivities: Codeunit "Periodic Activities";
        Text001: label 'Did you know M-Cash now allows you to withdraw up to a maxmum of Kes 100,000?.';
        TempLoans: Record 52186131;
        CashierTransactions: Record 52185776;
        OldAmount: Decimal;
        TopUPGL: Code[20];
        "Topup%": Decimal;
        OldAmt: Decimal;
    begin

        Temp.Get(UserId);

        Jtemplate := Temp."Loans Template";
        JBatch := Temp."Loans Batch";

        if Jtemplate = '' then begin
            Error('Ensure the Loans Template is set up in Banking User Setup');
        end;
        if JBatch = '' then begin
            Error('Ensure the Loans Batch is set up in Banking User Setup')
        end;

        //PRORATED DAYS

        //PRORATED DAYS

        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", Jtemplate);
        GenJournalLine.SetRange("Journal Batch Name", JBatch);
        GenJournalLine.DeleteAll;


        //Mark Posted Loans Already Posted.
        GLEntry.Reset;
        GLEntry.SetRange("Document No.", BatchNo);
        if GLEntry.FindFirst then begin
            BatchLines.Reset;
            BatchLines.SetRange(No, BatchNo);
            if BatchLines.Find('-') then begin
                repeat
                    LoanApps.Reset;
                    LoanApps.SetRange("Batch No.", BatchNo);
                    if LoanApps.Find('-') then begin
                        repeat
                            LoanApps.Advice := true;
                            LoanApps."Advice Type" := LoanApps."advice type"::"Fresh Loan";
                            LoanApps."Disbursement Date" := Today;
                            LoanApps.Posted := true;

                            LoanApps.Modify;
                            AdviceLoan(LoanApps."Loan No.", false);
                        until LoanApps.Next = 0;
                    end;
                    BatchLines."Time Posted" := Time;
                    BatchLines."Date Posted" := Today;
                    BatchLines.Posted := true;
                    if Batches.Get(BatchNo) then begin
                        Batches.Posted := true;
                        Batches."Posting Date" := Today;
                        Batches."Time Posted" := Time;
                        Batches."Posted By" := UserId;
                        Batches.Modify;
                        Commit;
                    end;
                    BatchLines.Modify;
                    Commit;
                until BatchLines.Next = 0;
            end;
        end;

        //Mark Posted Loans Already Posted.


        BatchLines.Reset;
        BatchLines.SetRange(BatchLines.No, BatchNo);
        BatchLines.SetRange(BatchLines.Posted, false);
        if BatchLines.Find('-') then
            repeat
                if LoanApps.Get(BatchLines."Loan No.") then begin
                    FirstLoop := FirstLoop + 1;
                    ChargeExtraComms := false;
                    ExcemptCharges := false;
                    ProdFac.Get(LoanApps."Loan Product Type");

                    if CustomerRecord.Get(LoanApps."Member No.") then begin
                        //Check if excempted from charges
                        if Cust.Get(CustomerRecord."No.") then begin
                            if Cust."Dont Charge Transactions" = true then
                                ExcemptCharges := true;
                        end;


                        if LoanApps.Status <> LoanApps.Status::Approved then
                            Error('Loan status must be Approved for you to post Loan. - ' + LoanApps."Loan No.");

                        if LoanApps."Amount To Disburse" <= 0 then
                            Error(Text0002);

                        DaysPast := 0;
                        EndMonth := CalcDate('-1D', CalcDate('1M', Dmy2date(1, Date2dmy(Today, 2), Date2dmy(Today, 3))));
                        RemainingDays := (EndMonth - Today) + 1;
                        TMonthDays := Date2dmy(EndMonth, 1);

                        //where disbursement day is in the past

                        DaysPast := Today - LoanApps."Disbursement Date";


                        if DaysPast > 1 then
                            RemainingDays := RemainingDays + DaysPast;





                        ///RunningDate:=Batches."Posting Date";

                        //Generate and post Approved Loan Amount
                        if not GenBatch.Get(Jtemplate, JBatch) then begin
                            GenBatch.Init;
                            GenBatch."Journal Template Name" := Jtemplate;
                            GenBatch.Name := JBatch;
                            GenBatch.Insert;
                        end;

                        TopUp.Reset;
                        TopUp.SetRange(TopUp."Loan No.", LoanApps."Loan No.");
                        if TopUp.Find('-') then begin
                            repeat
                                if TopUp."Additional Top Up Commission" = true then
                                    ChargeExtraComms := true;
                            until TopUp.Next = 0;
                        end;

                        GenSetup.Get;

                        AccType := Acctype::Credit;
                        AccNo := LoanApps."Loan Account";
                        TransType := Transtype::Loan;
                        BalAccType := Balacctype::"G/L Account";
                        BalAccNo := '';
                        Amt := 0;
                        LineNo := LineNo + 10000;
                        Descr := '';
                        Descr := ProdFac."Product Description"/*+' '+'Loan'*/;
                        Descr := CopyStr(Descr, 1, 50);
                        //Approved amount
                        if LoanApps."Amount To Disburse" > 0 then
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, LoanApps."Amount To Disburse", AccNo, Today, BalAccType,
                          BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                        // IF LoanApps."Mode of Disbursement"=LoanApps."Mode of Disbursement"::"Full Disbursement" THEN BEGIN
                        PaySched.Reset;
                        PaySched.SetRange(PaySched."Loan No.", LoanApps."Loan No.");
                        if PaySched.Find('-') then begin
                            repeat
                                if (PaySched."Payment Options" = PaySched."payment options"::"M-PESA") or (PaySched."Payment Options" = PaySched."payment options"::Cheques) then begin

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
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, -PaySched.Amount, AccNo,
                                    Today, BalAccType, BalAccNo, '', '', '', TransType, '', '', '', 0, '', 0);
                                end;
                            until PaySched.Next = 0;
                        end;

                        if Batches.Get(BatchNo) then begin
                            Batches.CalcFields("Total Amount");
                            if Batches."Disbursement Destination" = Batches."disbursement destination"::Normal then begin
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
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, -LoanApps."Amount To Disburse", AccNo,
                                Today, BalAccType, BalAccNo, '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);

                                if (ProdFac."Mortgage Loan" = true) and (LoanApps."Loan Product Type" <> '138') then begin
                                    //denis this is to cater for mortgage loans
                                    "CheckDisbursementA/CBalanceForMortgage"(LoanApps."Disbursement Account No");

                                    AccNo := LoanApps."Disbursement Account No";
                                    AccType := Acctype::Savings;
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    TransType := Transtype::" ";
                                    BalAccType := Balacctype::"G/L Account";
                                    LineNo := LineNo + 10000;
                                    Descr := '';
                                    Descr := ProdFac."Product Description" + ' ' + ' to Vendor ' + GenSetup."Mortgage Loan Vendor A/C";//;    GenSetup."Early Withdrawal %";
                                    Descr := CopyStr(Descr, 1, 50);
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, LoanApps."Amount To Disburse", AccNo,
                                    Today, BalAccType, BalAccNo, '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);

                                    //amount to Vendor A/c
                                    AccNo := GenSetup."Mortgage Loan Vendor A/C";//GenSetup."Early Withdrawal %";
                                    AccType := Acctype::Vendor;
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    TransType := Transtype::" ";
                                    BalAccType := Balacctype::"G/L Account";
                                    LineNo := LineNo + 10000;
                                    Descr := '';
                                    Descr := ProdFac."Product Description" + ' ' + ' From ' + LoanApps."Disbursement Account No";
                                    Descr := CopyStr(Descr, 1, 50);
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, -LoanApps."Amount To Disburse", AccNo,
                                    Today, BalAccType, BalAccNo, '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);

                                    RegisterMortgageDocuments(LoanApps."Loan No.");

                                end;
                                // Cater For Shamba Loan
                                if (ProdFac."Shamba Loan" = true) then begin

                                    //"CheckDisbursementA/CBalanceForMortgage"(LoanApps."Disbursement Account No");

                                    AccNo := LoanApps."Disbursement Account No";
                                    AccType := Acctype::Savings;
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    TransType := Transtype::" ";
                                    BalAccType := Balacctype::"G/L Account";
                                    LineNo := LineNo + 10000;
                                    Descr := '';
                                    //Descr:=ProdFac."Product Description"+' '+' to Vendor '+GenSetup."Shamba Loan Vendor A/C";//;    GenSetup."Early Withdrawal %";
                                    Descr := CopyStr(Descr, 1, 50);
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, LoanApps."Amount To Disburse", AccNo,
                                    Today, BalAccType, BalAccNo, '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);

                                    //amount to Vendor A/c
                                    AccNo := GenSetup."Shamba Loan Vendor A/C";//GenSetup."Early Withdrawal %";
                                    AccType := Acctype::Vendor;
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    TransType := Transtype::" ";
                                    BalAccType := Balacctype::"G/L Account";
                                    LineNo := LineNo + 10000;
                                    Descr := '';
                                    Descr := ProdFac."Product Description" + ' ' + ' From ' + LoanApps."Disbursement Account No";
                                    Descr := CopyStr(Descr, 1, 50);
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, -LoanApps."Amount To Disburse", AccNo,
                                    Today, BalAccType, BalAccNo, '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);

                                    RegisterMortgageDocuments(LoanApps."Loan No.");

                                end;
                                // Cater For Shamba Loan//End
                            end else
                                if Batches."Disbursement Destination" = Batches."disbursement destination"::"Bank Account" then begin
                                    Batches.TestField("Cheque No.");
                                    Batches.TestField("Disburse Accounts");
                                    Batches.CalcFields("Total Amount");
                                    AccNo := Batches."Disburse Accounts";
                                    AccType := Acctype::"Bank Account";
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    TransType := Transtype::" ";
                                    BalAccType := Balacctype::"G/L Account";
                                    LineNo := LineNo + 10000;
                                    Descr := '';
                                    Descr := ProdFac."Product Description" + ' ' + 'Loan';
                                    Descr := CopyStr(Descr, 1, 50);
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, -Batches."Total Amount", AccNo,
                                    Today, BalAccType, BalAccNo, Batches."Cheque No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);

                                end else
                                    if Batches."Disbursement Destination" = Batches."disbursement destination"::Supplier then begin



                                        //Effect special charges
                                        GenSetup.TestField("Special Charge on Loans GL");
                                        LineNo := LineNo + 10000;
                                        AccType := Acctype::"G/L Account";
                                        AccNo := GenSetup."Special Charge on Loans GL";
                                        Descr := '';
                                        Descr := ProdFac."Product Description" + ' ' + 'Charges';
                                        Descr := CopyStr(Descr, 1, 50);
                                        TransType := Transtype::" ";
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := '';
                                        Amt := Batches."Special Processing Commission" * -1;



                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, Amt, AccNo, Today, BalAccType,
                                      BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                        //If excise duty involved
                                        GenSetup.TestField("Excise Duty G/L");
                                        GenSetup.TestField("Excise Duty (%)");
                                        LineNo := LineNo + 10000;
                                        AccType := Acctype::"G/L Account";
                                        AccNo := GenSetup."Excise Duty G/L";
                                        TransType := Transtype::" ";
                                        Descr := '';
                                        Descr := ProdFac."Product Description" + ' ' + 'Excise Duty';
                                        Descr := CopyStr(Descr, 1, 50);
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := '';
                                        Amt := Amt * GenSetup."Excise Duty (%)" * 0.01;

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, Amt, AccNo, Today, BalAccType,
                                        BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                                        //Pass to supplier account

                                        AccNo := Batches."Disburse Accounts";
                                        AccType := Acctype::Vendor;
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := '';
                                        TransType := Transtype::" ";
                                        BalAccType := Balacctype::"G/L Account";
                                        LineNo := LineNo + 10000;
                                        Descr := '';
                                        Descr := ProdFac."Product Description" + ' ' + 'Loan';
                                        Descr := CopyStr(Descr, 1, 50);
                                        Amt := Batches."Total Amount" - (Batches."Special Processing Commission" + (Batches."Special Processing Commission" * GenSetup."Excise Duty (%)" * 0.01));
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, -Amt, AccNo,
                                        Today, BalAccType, BalAccNo, '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);

                                    end;
                        end;

                        PCharges.Reset;
                        PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
                        PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::General);
                        if PCharges.Find('-') then begin
                            repeat
                                //Non Prorate
                                if PCharges.Prorate = PCharges.Prorate::" " then begin
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

                                    if ExcemptCharges = true then
                                        Amt := 0;


                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
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

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, CopyStr((PCharges."Charge Description" + '-Excise Duty'), 1, 50), Amt, AccNo, Today, BalAccType,
                                        BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                    end;
                                end else
                                    if PCharges.Prorate = PCharges.Prorate::Appraisal then begin

                                        //Prorate
                                        LineNo := LineNo + 10000;
                                        AccType := Acctype::Credit;
                                        AccNo := LoanApps."Loan Account";
                                        TransType := Transtype::Appraisal;
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := '';
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

                                        if ExcemptCharges = true then
                                            Amt := 0;

                                        LoanApps."Appraisal Fee" := Amt;
                                        Amt := Amt * -1;
                                        LoanApps."Disbursement Date" := Today;
                                        LoanApps.Validate("Disbursement Date");
                                        LoanApps.Modify;
                                        Commit;



                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                                        BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                        LineNo := LineNo + 10000;
                                        AccType := Acctype::Savings;
                                        AccNo := LoanApps."Disbursement Account No";
                                        TransType := Transtype::" ";
                                        BalAccType := Balacctype::"G/L Account";
                                        BalAccNo := '';

                                        Amt := Amt * -1;

                                        if ExcemptCharges = true then
                                            Amt := 0;

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                                        BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                                    end;

                            until PCharges.Next = 0;

                        end;


                        //Boosting comms
                        if Batches."Disbursement Destination" = Batches."disbursement destination"::Normal then begin
                            if (LoanApps."Share Boosted Amount" > 0) and (ProdFac."Appraisal Parameter Type" = ProdFac."appraisal parameter type"::"Check Off") then begin
                                GenSetup.Get;
                                LineNo := LineNo + 10000;
                                AccType := Acctype::"G/L Account";
                                AccNo := GenSetup."Share Boost GL";
                                TransType := Transtype::" ";
                                BalAccType := Balacctype::Savings;
                                BalAccNo := LoanApps."Disbursement Account No";
                                Amt := LoanApps."Share Boosted Amount";


                                if ExcemptCharges = true then
                                    Amt := 0;
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, 'Share Boosting Comms', -Amt, AccNo, Today, BalAccType,
                              BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                            end;
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


                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, 'Deposit Purchase-Share Boost', Amt, AccNo, Today, BalAccType,
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



                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, 'Share Boost', -Amt, AccNo, Today, BalAccType,
                              BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                                ///Advice ShareBoost
                                if LoanApps."Loans - Deposit Purchase" > 0 then begin
                                    SavAcc.Reset;
                                    SavAcc.SetRange(SavAcc."Member No.", LoanApps."Member No.");
                                    SavAcc.SetRange(SavAcc."Product Category", SavAcc."product category"::"Deposit Contribution");
                                    if SavAcc.Find('-') then
                                        //SavAcc.VALIDATE(SavAcc."Monthly Contribution");
                                        AdviceShares(SavAcc, LoanApps."Loans - Deposit Purchase", SavAcc."Monthly Contribution");
                                end;

                                //Pass charges if defined

                                PCharges.Reset;
                                PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
                                PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::Boosting);
                                if PCharges.Find('-') then begin
                                    repeat
                                        //Non Prorate
                                        LineNo := LineNo + 10000;
                                        AccType := Acctype::"G/L Account";
                                        AccNo := PCharges."Charges G_L Account";
                                        TransType := Transtype::" ";
                                        BalAccType := Balacctype::Savings;
                                        BalAccNo := LoanApps."Disbursement Account No";
                                        if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                            Amt := (LoanApps."Loans - Deposit Purchase" * (PCharges.Percentage / 100))
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
                                                            if (LoanApps."Loans - Deposit Purchase" >= TariffDetails."Lower Limit") and (LoanApps."Loans - Deposit Purchase" <= TariffDetails."Upper Limit") then begin
                                                                if TariffDetails."Use Percentage" = true then begin
                                                                    Amt := LoanApps."Loans - Deposit Purchase" * TariffDetails.Percentage * 0.01;
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

                                        if ExcemptCharges = true then
                                            Amt := 0;


                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
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

                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, CopyStr((PCharges."Charge Description" + '-Excise Duty'), 1, 50), Amt, AccNo, Today, BalAccType,
                                            BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                        end;


                                    until PCharges.Next = 0;

                                end;

                            end;

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

                                AdviceLoan(TopUp."Loan Top Up", true);

                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, 'Top up Principle' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
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


                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, 'Outs. Bill' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
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
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, 'Top up Interest' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);

                                //Top Up charges
                                TopUPGL := '';
                                "Topup%" := 0;

                                //IF (TopUp."Principle Top Up" + TopUp."Interest Top Up" +TopUp."Untransfered Interest") <> 0 THEN BEGIN
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
                                                Amt := (LoanApps."Approved Amount" * (PCharges.Percentage / 100));//possible charge
                                        end else
                                            if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") and (PCharges."Charging Option" = PCharges."charging option"::"On Net Amount") then begin
                                                if ChargeExtraComms = true then
                                                    Amt := ((TopUp."Principle Top Up" + TopUp."Interest Top Up") * (PCharges.Percentage + PCharges."Additional Charge %") / 100)
                                                else
                                                    Amt := ((TopUp."Principle Top Up" + TopUp."Interest Top Up") * (PCharges.Percentage / 100))//poasible charge
                                            end else
                                                Amt := PCharges."Charge Amount";//possible charge


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
                            //END;
                            /*
                            //GL
                            IF BridgLoan<>0 THEN BEGIN
                                    JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType::"G/L Account",BatchNo,PCharges."Charge Description",-BridgLoan,TopUPGL,TODAY,BalAccType,
                                  BalAccNo, LoanApps."Loan No.",LoanApps."Global Dimension 1 Code",LoanApps."Global Dimension 2 Code",TransType,LoanApps."Loan No.",'','',0,'',0);
                                  //Added 06.05.2021
                                  BridgLoan := (Amt*-1);

                                              BLoanNo := CreateBridgingLoan(LoanApps."Member No.",BridgLoan);

                                              IF BLoanNo<>'' THEN BEGIN
                                                  IF BLoanRec.GET(BLoanNo) THEN BEGIN

                                                      AccType:=AccType::Credit;
                                                      AccNo:=BLoanRec."Loan Account";
                                                      TransType:=TransType::Loan;
                                                      BalAccType:=BalAccType::"G/L Account";
                                                      BalAccNo :='';

                                                      LineNo:=LineNo+10000;
                                                      Descr:='Bridging Loan Interest';

                                                      //Approved amount
                                                      IF BLoanRec."Approved Amount">0 THEN BEGIN

                                                        JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType,BatchNo,Descr,BLoanRec."Approved Amount",AccNo,TODAY,BalAccType,
                                                        BalAccNo, BLoanRec."Loan No.",LoanApps."Global Dimension 1 Code",LoanApps."Global Dimension 2 Code",TransType,BLoanRec."Loan No.",'','',0,'',0);

                                                        TotalTopUpCharges += BLoanRec."Approved Amount";

                                                        BLoanRec.Posted := TRUE;
                                                        BLoanRec.MODIFY;
                             //Bridging Loan Recovery
                                                      Members.GET(BLoanRec."Member No.");
                                                      {IF MemberCat.GET(Members."Member Category") THEN
                                                      BEGIN}
                                                      //MESSAGE(MemberCat."No.");
                                                      //ERROR(FORMAT(BLoanRec."Approved Amount"));
                                                      //IF MemberCat."Recover Fully on Bridging"=TRUE THEN BEGIN
                                                      LineNo:=LineNo+10000;
                                                      Descr:='Bridging Loan Interest';
                                                      JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType::Credit,BatchNo,Descr,BLoanRec."Approved Amount"*-1,BLoanRec."Loan Account",TODAY,BalAccType,
                                                      BalAccNo, BLoanRec."Loan No.",LoanApps."Global Dimension 1 Code",LoanApps."Global Dimension 2 Code",TransType,BLoanRec."Loan No.",'','',0,'',0);
                                                      //Debit Fosa
                                                      LineNo:=LineNo+10000;
                                                      Descr:='Bridging Loan Interest';
                                                      JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType::Savings,BatchNo,Descr,BLoanRec."Approved Amount"*1,LoanApps."Disbursement Account No",TODAY,BalAccType,
                                                      '', '',LoanApps."Global Dimension 1 Code",LoanApps."Global Dimension 2 Code",TransType::" ",BLoanRec."Loan No.",'','',0,'',0);

                                                     // END;
                                                      //END;

                                                      END;
                                                  END;
                                              END;
                                          //END;
                                  //End of 06.05.2021 Additions
                               END;
                            //hhdhdh
                            */

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
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, CopyStr(('Total Loan Offset- Loan Clearance Facility'), 1, 50), TotalCleared, AccNo, Today, BalAccType,
                            BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);
                        end;
                        //GL
                        //Added 06.05.2021
                        if BridgLoan > 0 then begin
                            if BridgLoan > 50000 then BridgLoan := 50000;
                            LineNo := LineNo + 10000;
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::"G/L Account", BatchNo, PCharges."Charge Description", -BridgLoan, TopUPGL, Today, BalAccType,
                            BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                            BLoanNo := CreateBridgingLoan(LoanApps."Member No.", TotalCleared);
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

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, TotalCleared, AccNo, Today, BalAccType,
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
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Credit, BatchNo, Descr, TotalCleared * -1, BLoanRec."Loan Account", Today, BalAccType,
                                        BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);
                                        //Debit Fosa

                                        LineNo := LineNo + 10001;
                                        Descr := BLoanRec."Loan Product Type Name" + '-Interest Paid';
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Savings, BatchNo, Descr, BridgLoan * 1, LoanApps."Disbursement Account No", Today, BalAccType,
                                        '', '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", Transtype::" ", BLoanRec."Loan No.", '', '', 0, '', 0);

                                        //Interest Due
                                        LineNo := LineNo + 10000;
                                        Descr := BLoanRec."Loan Product Type Name" + '- Interest Due';
                                        TransType := Transtype::"Interest Due";
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, BridgLoan, AccNo, Today, BalAccType,
                                        BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);


                                        //Interest Paid
                                        LineNo := LineNo + 10000;
                                        Descr := BLoanRec."Loan Product Type Name" + '- Interest Paid';
                                        TransType := Transtype::"Interest Paid";
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, BridgLoan * -1, AccNo, Today, BalAccType,
                                        BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);

                                        // END;
                                        //END;

                                    end;
                                end;
                            end;
                            //END;
                            //End of 06.05.2021 Additions
                        end;


                        OtherComms := 0;
                        //Clearing external debts
                        OtherCommitments.Reset;
                        OtherCommitments.SetRange(OtherCommitments."Loan No.", LoanApps."Loan No.");
                        if OtherCommitments.Find('-') then begin
                            repeat
                                Temp.TestField(Temp."Bankers Cheque Account");

                                TotalCleared := TotalCleared + TopUp."Principle Top Up" + TopUp."Interest Top Up";
                                LineNo := LineNo + 10000;
                                AccType := Acctype::Vendor;
                                AccNo := OtherCommitments."Vendor No.";
                                TransType := Transtype::" ";
                                BalAccType := Balacctype::"G/L Account";
                                BalAccNo := '';



                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, CopyStr((OtherCommitments.Description + ' - ' + LoanApps."Member Name"), 1, 50), OtherCommitments.Amount * -1, AccNo, Today, BalAccType,
                              BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);




                                //Pass entries to balancing account
                                if LoanApps."All Posting through Savings Ac" = true then begin
                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::Savings;
                                    AccNo := LoanApps."Disbursement Account No";
                                    TransType := Transtype::" ";
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';


                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, CopyStr(('External Loan Cleared' + OtherCommitments."Vendor Name"), 1, 50), OtherCommitments.Amount, AccNo, Today, BalAccType,
                                  BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);

                                end;
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
                                        if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                            Amt := (/*LoanApps."Loans - Deposit Purchase"*/OtherCommitments.Amount * (PCharges.Percentage / 100))
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
                                                            if (OtherCommitments.Amount >= TariffDetails."Lower Limit") and (OtherCommitments.Amount <= TariffDetails."Upper Limit") then begin
                                                                if TariffDetails."Use Percentage" = true then begin
                                                                    Amt := OtherCommitments.Amount * TariffDetails.Percentage * 0.01;
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
                                        if ExcemptCharges = true then
                                            Amt := 0;



                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
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

                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, CopyStr((PCharges."Charge Description" + '-Excise Duty'), 1, 50), Amt, AccNo, Today, BalAccType,
                                            BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                                        end;

                                    until PCharges.Next = 0;
                                end;
                            until OtherCommitments.Next = 0;
                        end;


                        //Asset Finance Deduction
                        TotalAssetFin := 0;
                        NetToVendor := 0;
                        AssetFinanceLoan.Reset;
                        AssetFinanceLoan.SetRange(AssetFinanceLoan."Loan No.", LoanApps."Loan No.");
                        if AssetFinanceLoan.Find('-') then begin
                            repeat
                                Temp.TestField(Temp."Bankers Cheque Account");
                                PCharges.Reset;
                                PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
                                PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"Asset Finance");
                                if PCharges.Find('-') then begin
                                    repeat
                                        if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                            Amt := AssetFinanceLoan.Amount - (AssetFinanceLoan.Amount / (1 + PCharges.Percentage / 100));
                                    until PCharges.Next = 0;
                                end;


                                TotalAssetFin := TotalAssetFin + TopUp."Principle Top Up" + TopUp."Interest Top Up";
                                LineNo := LineNo + 10000;
                                AccType := Acctype::Vendor;
                                AccNo := AssetFinanceLoan."Vendor No.";
                                TransType := Transtype::" ";
                                BalAccType := Balacctype::"G/L Account";
                                BalAccNo := '';
                                NetToVendor := (AssetFinanceLoan.Amount - Amt);



                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, CopyStr((AssetFinanceLoan.Description + ' - ' + LoanApps."Member Name"), 1, 50), NetToVendor * -1, AccNo, Today, BalAccType,
                              BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);




                                //Pass entries to balancing account
                                if LoanApps."All Posting through Savings Ac" = true then begin
                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::Savings;
                                    AccNo := LoanApps."Disbursement Account No";
                                    TransType := Transtype::" ";
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';


                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, CopyStr(('Asset Finance Deduction' + AssetFinanceLoan."Vendor Name"), 1, 50), NetToVendor, AccNo, Today, BalAccType,
                                  BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);

                                end;
                                PCharges.Reset;
                                PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
                                PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"Asset Finance");
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
                                        if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                            Amt := AssetFinanceLoan.Amount - (AssetFinanceLoan.Amount / (1 + PCharges.Percentage / 100))
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
                                                            if (AssetFinanceLoan.Amount >= TariffDetails."Lower Limit") and (AssetFinanceLoan.Amount <= TariffDetails."Upper Limit") then begin
                                                                if TariffDetails."Use Percentage" = true then begin
                                                                    Amt := AssetFinanceLoan.Amount * TariffDetails.Percentage * 0.01;
                                                                end else begin
                                                                    Amt := TariffDetails."Charge Amount";
                                                                end;
                                                            end;
                                                        until TariffDetails.Next = 0;
                                                    end;
                                                end;


                                        if (Amt) < PCharges.Minimum then
                                            Amt := PCharges.Minimum;

                                        if (Amt) > PCharges.Maximum then
                                            Amt := PCharges.Maximum;

                                        Amt := (Amt) * -1;
                                        if ExcemptCharges = true then
                                            Amt := 0;


                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                                      BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                                        //If excise duty involved
                                        if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin
                                            GenSetup.TestField("Excise Duty G/L");
                                            GenSetup.TestField("Excise Duty (%)");
                                            LineNo := LineNo + 10000;
                                            AccType := Acctype::"G/L Account";
                                            AccNo := GenSetup."Excise Duty G/L";
                                            TransType := Transtype::" ";
                                            BalAccType := Balacctype::"G/L Account";
                                            BalAccNo := PCharges."Charges G_L Account";
                                            Amt := Amt * GenSetup."Excise Duty (%)" * 0.01;

                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, CopyStr((PCharges."Charge Description" + '-Excise Duty'), 1, 50), Amt, AccNo, Today, BalAccType,
                                            BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                                        end;

                                    until PCharges.Next = 0;
                                end;
                            until AssetFinanceLoan.Next = 0;
                        end;







                        //Recover discounting
                        //IF LoanApps."Discounted Amount">0 THEN BEGIN
                        Loans2.Reset;
                        Loans2.SetRange(Loans2."Discounted Loan No.", LoanApps."Loan No.");
                        if Loans2.Find('-') then begin
                            repeat
                                Loans2.CalcFields(Loans2."Outstanding Interest", Loans2."Outstanding Balance");
                                Amt := 0;
                                //Loan repayment

                                LineNo := LineNo + 10000;
                                AccType := Acctype::Credit;
                                AccNo := Loans2."Loan Account";
                                TransType := Transtype::Repayment;
                                BalAccType := Balacctype::"G/L Account";
                                BalAccNo := '';
                                Amt := Loans2."Outstanding Balance";


                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, 'Disc. Paid' + LoanApps."Loan No.", -Amt, AccNo, Today, BalAccType,
                              BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, Loans2."Loan No.", '', '', 0, '', 0);

                                Amt := 0;

                                //Interest

                                LineNo := LineNo + 10000;
                                AccType := Acctype::Credit;
                                AccNo := Loans2."Loan Account";
                                TransType := Transtype::"Interest Paid";
                                BalAccType := Balacctype::"G/L Account";
                                BalAccNo := '';
                                Amt := Loans2."Outstanding Interest";
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, 'Disc. Interest' + LoanApps."Loan No.", -Amt, AccNo, Today, BalAccType,
                                BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, Loans2."Loan No.", '', '', 0, '', 0);





                                //Deduct from savings


                                if LoanApps."All Posting through Savings Ac" = true then begin


                                    LineNo := LineNo + 10000;
                                    AccType := Acctype::Savings;
                                    AccNo := LoanApps."Disbursement Account No";
                                    TransType := Transtype::" ";
                                    BalAccType := Balacctype::"G/L Account";
                                    BalAccNo := '';
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, 'Total Disc.Offset' + LoanApps."Loan No.", (Loans2."Outstanding Balance" + Loans2."Outstanding Interest"), AccNo, Today, BalAccType,
                                    BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);
                                end;
                            until Loans2.Next = 0;

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
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, 'Interest Due' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                BalAccNo, BatchLines."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BatchLines."Loan No.", '', '', 0, '', 0);

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
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, 'Interest Due' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                    BalAccNo, BatchLines."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BatchLines."Loan No.", '', '', 0, '', 0);

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
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, 'Bills' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                BalAccNo, BatchLines."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BatchLines."Loan No.", '', '', 0, '', 0);

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
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, 'Bills' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                                        BalAccNo, BatchLines."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BatchLines."Loan No.", '', '', 0, '', 0);
                                    end;
                                end;

                        end;
                        GenSetup.Get;
                        Members.Get(LoanApps."Member No.");
                        if GenSetup."Disable Loan SMS" = false then
                            SendSMS.SendSms(Sourcetype::"Loan Posted", Members."Mobile Phone No", 'Your Loan of Kes ' + Format(LoanApps."Approved Amount") + ' ' + 'has been credited to your FOSA account. ' +
                                        GenSetup."Loan SMS Suffix", LoanApps."Loan No.", LoanApps."Disbursement Account No", false);


                        //Update Monthly contribution based on the product

                        //contractual shares

                        //Check if tiered
                        if ProdFac."Minimum Deposit Tiered" then begin
                            SavAcc.Reset;
                            SavAcc.SetRange("Member No.", LoanApps."Member No.");
                            SavAcc.SetRange("Product Category", SavAcc."product category"::"Deposit Contribution");
                            if SavAcc.Find('-') then begin
                                ProdFac.TestField("Minimum Deposit Tiered Code");
                                TariffDetails.Reset;
                                TariffDetails.SetRange(TariffDetails.Code, ProdFac."Minimum Deposit Tiered Code");
                                if TariffDetails.Find('-') then begin
                                    repeat
                                        if (LoanApps."Approved Amount" >= TariffDetails."Lower Limit") and (LoanApps."Approved Amount" <= TariffDetails."Upper Limit") then begin
                                            if TariffDetails."Use Percentage" = true then begin
                                                NewContr := LoanApps."Approved Amount" * TariffDetails.Percentage * 0.01;
                                            end else begin
                                                NewContr := TariffDetails."Charge Amount";
                                            end;
                                        end;
                                    until TariffDetails.Next = 0;
                                end;
                            end;
                            //Difference
                            ///Advice
                            if NewContr > SavAcc."Monthly Contribution" then begin
                                OldAmount := SavAcc."Monthly Contribution";
                                if NewContr < ProdFac."Minimum Deposit Contribution" then
                                    NewContr := ProdFac."Minimum Deposit Contribution";
                                if SavAcc."Monthly Contribution" < NewContr then
                                    SavAcc."Monthly Contribution" := NewContr;
                                if (LoanApps."Recovery Mode" = LoanApps."recovery mode"::Checkoff) then
                                    AdviceShares(SavAcc, LoanApps."Loans - Deposit Purchase", NewContr);
                                //SavAcc.VALIDATE("Monthly Contribution");
                                SavAcc.Modify;
                            end;
                        end;
                    end else begin
                        //Not tiered
                        SavAcc.Reset;
                        SavAcc.SetRange("Member No.", LoanApps."Member No.");
                        SavAcc.SetRange("Product Category", SavAcc."product category"::"Deposit Contribution");
                        if SavAcc.Find('-') then begin
                            if ProdFac."Minimum Dep. Contribution %" > 0 then begin
                                if ProdFac."Minimum Dep. Contribution %" * LoanApps."Approved Amount" * 0.01 > ProdFac."Maximum Deposit Contribution" then
                                    NewContr := ProdFac."Maximum Deposit Contribution"
                                else
                                    NewContr := ProdFac."Minimum Dep. Contribution %" * LoanApps."Approved Amount" * 0.01;
                            end;
                        end;
                        //Difference
                        //Advice
                        if NewContr < ProdFac."Minimum Deposit Contribution" then begin
                            OldAmount := SavAcc."Monthly Contribution";
                            NewContr := ProdFac."Minimum Deposit Contribution";
                            if SavAcc."Monthly Contribution" < NewContr then
                                SavAcc."Monthly Contribution" := NewContr;
                            if (LoanApps."Recovery Mode" = LoanApps."recovery mode"::Checkoff) then
                                AdviceShares(SavAcc, LoanApps."Loans - Deposit Purchase", NewContr);
                            //SavAcc.VALIDATE("Monthly Contribution");
                            SavAcc.Modify;
                        end;





                    end;
                    //MESSAGE('New Contr %1',NewContr);
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
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, TransactionCharges.Description + LoanApps."Disbursement Account No", Amt, AccNo, Today, BalAccType,
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

                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, CopyStr((TransactionCharges.Description + LoanApps."Disbursement Account No" + '-Excise Duty'), 1, 50), Amt, AccNo, Today, BalAccType,
                                    BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                                end;
                            until TransactionCharges.Next = 0;
                        end;
                    end;
                end;

                //block account if

                if GenSetup."Block Account for Ext.  Loan" = true then begin


                    OtherCommitments.Reset;
                    OtherCommitments.SetRange(OtherCommitments."Loan No.", LoanApps."Loan No.");
                    if OtherCommitments.Find('-') then begin
                        if SavAcc.Get(LoanApps."Disbursement Account No") then begin

                            //******Create a Lien for One Month Repayment.

                            CashierTransactions.Init;
                            CashierTransactions.No := '';
                            CashierTransactions."Account No" := SavAcc."No.";
                            CashierTransactions."Account Name" := SavAcc.Name;
                            CashierTransactions.Amount := LoanApps.Repayment;
                            CashierTransactions.Remarks := PadStr(LoanApps."Loan Product Type Name", 50);
                            CashierTransactions."Transaction Date" := Today;
                            CashierTransactions."Transaction Time" := Time;
                            CashierTransactions.Posted := true;
                            CashierTransactions."Cheque Status" := CashierTransactions."cheque status"::Pending;
                            CashierTransactions."Posted By" := UserId;
                            CashierTransactions.Cashier := UserId;
                            CashierTransactions.Type := CashierTransactions.Type::Lien;
                            CashierTransactions."Global Dimension 1 Code" := LoanApps."Global Dimension 1 Code";
                            CashierTransactions."Global Dimension 2 Code" := LoanApps."Global Dimension 2 Code";
                            CashierTransactions."ID No" := SavAcc."ID No.";
                            CashierTransactions."Responsibility Center" := LoanApps."Responsibility Centre";
                            CashierTransactions."Transaction Description" := LoanApps."Loan No.";
                            CashierTransactions."Employer Code" := SavAcc."Employer Code";
                            CashierTransactions.Insert(true);
                            //******Create a Lien for One Month Repayment.

                            SavAcc.Status := SavAcc.Status::Frozen;
                            SavAcc.Blocked := SavAcc.Blocked::All;
                            SavAcc."Status Change Reason" := 'Awaiting Bank Clearance';
                            SavAcc.Validate(Status);
                            //SavAcc.MODIFY;

                        end;
                    end;

                end;


            until BatchLines.Next = 0;

        //Post New
        JournalPosting.CompletePosting(Jtemplate, JBatch);

        /*
        GenJournalLine.RESET;
        GenJournalLine.SETRANGE("Journal Template Name",Jtemplate);
        GenJournalLine.SETRANGE("Journal Batch Name",JBatch);
        IF GenJournalLine.FIND('-') THEN BEGIN
        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJournalLine);
        END;
        */


        //Post New
        Post := false;
        Post := JournalPostingSucc.PostedSuccessfully;



        SavAcc.Modify;
        Commit;
        if Post = true then begin
            BatchLines.Reset;
            BatchLines.SetRange(No, BatchNo);
            if BatchLines.Find('-') then begin
                repeat
                    LoanApps.Reset;
                    LoanApps.SetRange("Batch No.", BatchNo);
                    if LoanApps.Find('-') then begin
                        repeat
                            LoanApps.Advice := true;
                            LoanApps."Advice Type" := LoanApps."advice type"::"Fresh Loan";
                            LoanApps."Disbursement Date" := Today;
                            LoanApps.Posted := true;
                            //**
                            TempLoans.Reset;
                            TempLoans.SetRange("Loan No.", LoanApps."Loan No.");
                            if not TempLoans.Find('-') then begin
                                TempLoans.TransferFields(LoanApps, true);
                                TempLoans.Insert;
                            end;
                            LoanApps."Disbursement Date" := Today;
                            LoanApps.Validate("Disbursement Date");

                            LoanApps.Modify;
                            Commit;
                            AdviceLoan(LoanApps."Loan No.", false);
                        until LoanApps.Next = 0;
                    end;

                    BatchLines."Time Posted" := Time;
                    BatchLines."Date Posted" := Today;
                    BatchLines."Posted By" := UserId;
                    BatchLines.Posted := true;
                    Commit;
                    if Batches.Get(BatchNo) then begin
                        Batches.Posted := true;
                        Batches."Posting Date" := Today;
                        Batches."Time Posted" := Time;
                        Batches."Posted By" := UserId;
                        Batches.Modify;
                        Commit;
                    end;
                    BatchLines.Modify;
                    Commit;
                until BatchLines.Next = 0;
            end;
        end;

    end;


    procedure ComputeCharges(ApprovedAmt: Decimal; ProdType: Code[20]; LoanNo: Code[50]; CurrValue: Decimal): Decimal
    begin
        TotalComputedCharges := 0;
        ChargeExtraComms := false;
        TopUp.Reset;
        TopUp.SetRange(TopUp."Loan No.", LoanNo);
        if TopUp.Find('-') then begin
            repeat
                if TopUp."Additional Top Up Commission" = true then
                    ChargeExtraComms := true;
            until TopUp.Next = 0;
        end;
        PCharges.Reset;
        PCharges.SetRange(PCharges."Product Code", ProdType);
        PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::General);
        if PCharges.Find('-') then begin
            repeat
                if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                    TotalComputedCharges := TotalComputedCharges + (ApprovedAmt * PCharges.Percentage / 100)
                else
                    if PCharges."Charge Method" = PCharges."charge method"::"Flat Amount" then
                        TotalComputedCharges := TotalComputedCharges + PCharges."Charge Amount"
                    else
                        if PCharges."Charge Method" = PCharges."charge method"::Staggered then begin

                            PCharges.TestField(PCharges."Staggered Charge Code");

                            TariffDetails.Reset;
                            TariffDetails.SetRange(TariffDetails.Code, PCharges."Staggered Charge Code");
                            if TariffDetails.Find('-') then begin
                                repeat
                                    if (ApprovedAmt >= TariffDetails."Lower Limit") and (ApprovedAmt <= TariffDetails."Upper Limit") then begin
                                        if TariffDetails."Use Percentage" = true then begin
                                            TotalComputedCharges := TotalComputedCharges + ApprovedAmt * TariffDetails.Percentage * 0.01;
                                        end else begin
                                            TotalComputedCharges := TotalComputedCharges + TariffDetails."Charge Amount";
                                        end;
                                    end;
                                until TariffDetails.Next = 0;
                            end;
                        end;
            until PCharges.Next = 0;
        end;

        ///MESSAGE('Running Charge general %1',TotalComputedCharges);


        //End of general charges

        TotalCleared := 0;
        //Pass loan clearance principle and interest
        TopUp.Reset;
        TopUp.SetRange(TopUp."Loan No.", LoanNo);
        if TopUp.Find('-') then begin
            repeat
                //TopUp.CALCSUMS(TopUp."Principle Top Up",TopUp."Interest Top Up");
                TotalCleared := TotalCleared + TopUp."Principle Top Up" + TopUp."Interest Top Up";

                PCharges.Reset;
                PCharges.SetRange(PCharges."Product Code", ProdType);
                PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"Top up");
                if PCharges.Find('-') then begin
                    repeat

                        if (PCharges."Use Percentage" = true) and (PCharges."Charging Option" = PCharges."charging option"::"On Approved Amount") then begin
                            if ChargeExtraComms = true then
                                TotalComputedCharges := TotalComputedCharges + (ApprovedAmt * ((PCharges.Percentage + PCharges."Additional Charge %") / 100))
                            else
                                TotalComputedCharges := TotalComputedCharges + (ApprovedAmt * (PCharges.Percentage / 100))
                        end else
                            if (PCharges."Use Percentage" = true) and (PCharges."Charging Option" = PCharges."charging option"::"On Net Amount") then begin
                                if ChargeExtraComms = true then
                                    TotalComputedCharges := TotalComputedCharges + ((TopUp."Principle Top Up" + TopUp."Interest Top Up") * ((PCharges.Percentage + PCharges."Additional Charge %") / 100))
                                else
                                    TotalComputedCharges := TotalComputedCharges + ((TopUp."Principle Top Up" + TopUp."Interest Top Up") * (PCharges.Percentage / 100))
                            end else
                                TotalComputedCharges := TotalComputedCharges + PCharges."Charge Amount";
                    // MESSAGE('Running Charge topup %1',TotalComputedCharges);
                    until PCharges.Next = 0;
                end;
            until TopUp.Next = 0;
        end;

        if TotalComputedCharges > 50000 then
            TotalComputedCharges := 50000;

        OtherComms := 0;
        //TotalCleared:=0;
        //TotalComputedCharges:=0;
        //Clearing external debts
        OtherCommitments.Reset;
        OtherCommitments.SetRange(OtherCommitments."Loan No.", LoanNo);
        if OtherCommitments.Find('-') then begin
            repeat
                TotalCleared := TotalCleared + OtherCommitments.Amount;
                //OtherCommitments.CALCSUMS(OtherCommitments.Amount);
                //OtherComms:=OtherCommitments.Amount;


                PCharges.Reset;
                PCharges.SetRange(PCharges."Product Code", ProdType);
                PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"External Loan");
                if PCharges.Find('-') then begin
                    repeat
                        if (PCharges."Use Percentage" = true) then begin
                            if ChargeExtraComms = true then
                                TotalComputedCharges := TotalComputedCharges + (OtherCommitments.Amount * ((PCharges.Percentage + PCharges."Additional Charge %") / 100))
                            else
                                TotalComputedCharges := TotalComputedCharges + (OtherCommitments.Amount * (PCharges.Percentage / 100))
                        end else
                            TotalComputedCharges := TotalComputedCharges + OtherCommitments.Amount;

                    until PCharges.Next = 0;

                end;
            until OtherCommitments.Next = 0;
        end;


        /*//AssetFinComms
        AssetFinComms:=0;
        TotalAssetFin:=0;
        AssetFinanceLoan.RESET;
        AssetFinanceLoan.SETRANGE(AssetFinanceLoan."Loan No.",LoanNo);
        IF AssetFinanceLoan.FIND('-') THEN BEGIN
        REPEAT
          TotalAssetFin:=TotalAssetFin+AssetFinanceLoan.Amount;
        
        PCharges.RESET;
        PCharges.SETRANGE(PCharges."Product Code",ProdType);
        PCharges.SETRANGE(PCharges."Charge Type",PCharges."Charge Type"::"Asset Finance");
        IF PCharges.FIND('-') THEN BEGIN
           REPEAT
           IF (PCharges."Use Percentage"=TRUE) THEN BEGIN
        
               TotalComputedCharges :=TotalComputedCharges+(AssetFinanceLoan.Amount-(AssetFinanceLoan.Amount / (1+PCharges.Percentage/100)))
           END ELSE
               TotalComputedCharges:=TotalComputedCharges+AssetFinanceLoan.Amount;
        
           UNTIL PCharges.NEXT = 0;
           MESSAGE('Running Charge  other comms%1,%2',TotalComputedCharges,TotalAssetFin);
           END;
        
           TotalComputedCharges:=TotalAssetFin;
        UNTIL AssetFinanceLoan.NEXT=0;
        END;
        */

        LoanApps.Reset;
        LoanApps.SetRange("Loan No.", LoanNo);
        if LoanApps.Find('-') then begin
            LoanApps."Total Charges and Commissions" := TotalComputedCharges;

            if (LoanApps."Appraisal Parameter Type" = LoanApps."appraisal parameter type"::"Check Off") or (LoanApps."Appraisal Parameter Type" = LoanApps."appraisal parameter type"::"Corporate or Business") then
                TotalComputedCharges := TotalComputedCharges + LoanApps."Share Boosted Amount";
            //LoanApps.MODIFY;
        end;
        PaySched.Reset;
        PaySched.SetRange(PaySched."Loan No.", LoanNo);
        if PaySched.Find('-') then begin
            PaySched.CalcSums(PaySched.Amount);
            TotalSched := PaySched.Amount;
        end;

        Difference := ApprovedAmt - (TotalSched + TotalComputedCharges * 0.1 + TotalComputedCharges +/*TotalCleared+*/CurrValue);


        //MESSAGE('Apr %1 TotSched %2 TotCompCha %3 OtherComms %4 TotCleared %5',ApprovedAmt,TotalSched,TotalComputedCharges,OtherComms,TotalCleared);
        exit(Difference);

    end;


    procedure PostDiscounting(LoanNo: Code[20]; DiscAmt: Decimal)
    var
        Loans: Record 52185729;
        Loan2: Record 52185729;
        LoanAcc: Code[20];
        Text0001: label 'The main Loan must be approved before discounting';
        Text0002: label 'There is no product defined for discounting';
        LoanPaymentOptions: Record 52185735;
    begin
        if Loans.Get(LoanNo) then begin
            if Loans.Status <> Loans.Status::Approved then
                Error(Text0001);


            //Create account for the loan
            ProdFac.Reset;
            ProdFac.SetRange(ProdFac."Type of Discounting", ProdFac."type of discounting"::"Loan Discounting");
            if ProdFac.Find('-') then begin

                if DiscAmt > 0 then begin
                    Loan2.Init;
                    Loan2."Application Date" := Today;
                    Loan2."Amount To Disburse" := DiscAmt;
                    Loan2."Approval Date" := Today;
                    //Loan2."Approved Amount":=DiscAmt;
                    Loan2."Member Name" := Loans."Member Name";
                    Loan2."Member No." := Loans."Member No.";
                    Loan2."Disbursement Date" := Today;
                    Loan2."Loan Product Type" := ProdFac."Product ID";
                    Loan2.Validate(Loan2."Loan Product Type");
                    Loan2."Disbursement Account No" := Loans."Disbursement Account No";
                    LoanAcc := '';
                    if Loan2."Loan Account" = '' then begin
                        //Loan2.TESTFIELD(Loans."Member No.",Loans."Loan Product Type");
                        LoanAcc := LoanProcess."CreateLoan Account"(Loans."Member No.", Loan2."Loan Product Type");
                        Loan2."Loan Account" := LoanAcc;
                    end;
                    Loan2."Recommended Amount" := DiscAmt;
                    Loan2."Requested Amount" := DiscAmt;
                    Loan2.Validate(Loan2."Requested Amount");
                    Loan2."Captured By" := UserId;
                    Loan2."Discounted Loan No." := Loans."Loan No.";
                    Loan2."Employer Code" := Loans."Employer Code";
                    Loan2."Fully Disbursed" := true;
                    Loan2."Installment Period" := Loans."Installment Period";
                    Loan2.Status := Loan2.Status::Approved;
                    Loan2.Validate(Loan2."Loan No.");
                    Loan2.Insert(true);

                    //Insert total to be posted under loan payment options
                    LoanPaymentOptions.Init;
                    LoanPaymentOptions."Loan No." := Loan2."Loan No.";
                    //LoanPaymentOptions."Payment Options":=LoanPaymentOptions."Payment Options"::;
                    LoanPaymentOptions.Amount := DiscAmt;
                    LoanPaymentOptions.Insert(true);


                    //MESSAGE('Disc Loan No. %1',Loan2."Loan No.");
                    LoanProcess.PostSingleLoan(Loan2."Loan No.");

                end;
            end else begin
                Error(Text0002);
            end
        end;
    end;


    procedure PostSingleLoan(LoanNo: Code[20])
    var
        Msaccocharge: Decimal;
        Msaccoacc: Code[20];
        MsaccoChargesSetup: Record 52185772;
        LoanApp: Record 52185729;
        TopUPGL: Code[20];
        "Topup%": Decimal;
    begin

        Temp.Get(UserId);

        Jtemplate := Temp."Loans Template";
        JBatch := Temp."Loans Batch";

        if Jtemplate = '' then begin
            Error('Ensure the Loans Template is set up in Cash Office Setup');
        end;
        if JBatch = '' then begin
            Error('Ensure the Loans Batch is set up in the Cash Office Setup')
        end;

        //PRORATED DAYS


        EndMonth := CalcDate('-1D', CalcDate('1M', Dmy2date(1, Date2dmy(Today, 2), Date2dmy(Today, 3))));
        RemainingDays := (EndMonth - Today) + 1;
        TMonthDays := Date2dmy(EndMonth, 1);
        //PRORATED DAYS

        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", Jtemplate);
        GenJournalLine.SetRange("Journal Batch Name", JBatch);
        GenJournalLine.DeleteAll;



        if LoanApps.Get(LoanNo) then begin
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
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, LoanApps."Amount To Disburse", AccNo, Today, BalAccType,
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
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, -PaySched.Amount, AccNo,
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
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, -LoanApps."Amount To Disburse", AccNo,
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
                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, -LoanApps."Amount To Disburse", AccNo,
                       Today, BalAccType, BalAccNo, '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, '', '', '', 0, '', 0);

                    end;
                end else begin
                    /*Yet to come
                    */



                end;


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



                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
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

                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, PCharges."Charge Description" + '- Excise Duty', Amt, AccNo, Today, BalAccType,
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
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Savings, LoanNo, 'EMR Loan Msacco Fee: ' + LoanApps."Loan No.", Msaccocharge
                    , LoanApps."Disbursement Account No", Today, Balacctype::"G/L Account", '', 'MSACCO LOANS', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code",
                    Transtype::" ", LoanApps."Loan No.", '', '', 0, '', 0);

                    //Cr Vendor Share Paid +++++++++++++++++++++++++
                    LineNo := LineNo + 10000;
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Vendor, LoanNo, 'EMR Loan Msacco Fee : ' + LoanApps."Loan No.", Msaccocharge * -1
                    , Msaccoacc, Today, Balacctype::"G/L Account", '', 'MSACCO LOANS', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code",
                    Transtype::" ", LoanApps."Loan No.", '', '', 0, '', 0);

                end;




                TotalCleared := 0;
                BridgLoan := 0;

                /*
                TopUp.RESET;
                TopUp.SETRANGE(TopUp."Loan No.",LoanApps."Loan No.");
                IF TopUp.FIND('-') THEN BEGIN
                  REPEAT
                TopUp.VALIDATE(TopUp."Loan Top Up");
                    //Loan repayment
                      TotalCleared:=TotalCleared+TopUp."Principle Top Up"+TopUp."Interest Top Up";
                      LineNo:=LineNo+10000;
                      AccType:=AccType::Credit;
                      AccNo:=TopUp."Loan Account";
                      TransType:=TransType::Repayment;
                      BalAccType:=BalAccType::"G/L Account";
                      BalAccNo :='';
                      Amt:=TopUp."Principle Top Up"*-1;
                     AdviceLoan(TopUp."Loan Top Up",TRUE);

                        JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType,LoanNo,'Top up Principle' +LoanApps."Loan No.",Amt,AccNo,TODAY,BalAccType,
                      BalAccNo, LoanApps."Loan No.",LoanApps."Global Dimension 1 Code",LoanApps."Global Dimension 2 Code",TransType,TopUp."Loan Top Up",'','',0,'',0);



                       //Interest

                      LineNo:=LineNo+10000;
                      AccType:=AccType::Credit;
                      AccNo:=TopUp."Loan Account";
                      TransType:=TransType::"Interest Paid";
                      BalAccType:=BalAccType::"G/L Account";
                      BalAccNo :='';
                       JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType,LoanNo,'Top up Interest' +LoanApps."Loan No.",Amt,AccNo,TODAY,BalAccType,
                      BalAccNo, LoanApps."Loan No.",LoanApps."Global Dimension 1 Code",LoanApps."Global Dimension 2 Code",TransType,TopUp."Loan Top Up",'','',0,'',0);

                 UNTIL TopUp.NEXT=0;
                 */
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

                        AdviceLoan(TopUp."Loan Top Up", true);


                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Top up Principle' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
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


                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Outs. Bill' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
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
                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Top up Interest' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                        BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);


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
                                TransType := Transtype::" ";
                                TopUPGL := PCharges."Charges G_L Account";
                                "Topup%" := PCharges.Percentage;
                                //BalAccType:=BalAccType::Savings;
                                //BalAccNo :=LoanApps."Disbursement Account No";//06.05.2021
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


                                //    JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType,LoanNo,PCharges."Charge Description",Amt,AccNo,TODAY,BalAccType,
                                //  BalAccNo, LoanApps."Loan No.",LoanApps."Global Dimension 1 Code",LoanApps."Global Dimension 2 Code",TransType,LoanApps."Loan No.",'','',0,'',0);
                                //Added 06.05.2021
                                BridgLoan += (Amt * -1);

                            /*BLoanNo := CreateBridgingLoan(LoanApps."Member No.",BridgLoan);

                            IF BLoanNo<>'' THEN BEGIN
                                IF BLoanRec.GET(BLoanNo) THEN BEGIN

                                    AccType:=AccType::Credit;
                                    AccNo:=BLoanRec."Loan Account";
                                    TransType:=TransType::Loan;
                                    BalAccType:=BalAccType::"G/L Account";
                                    BalAccNo :='';

                                    LineNo:=LineNo+10000;
                                    Descr:='Bridging Loan interest';

                                    //Approved amount
                                    IF BLoanRec."Approved Amount">0 THEN BEGIN

                                      JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType,LoanNo,Descr,BLoanRec."Approved Amount",AccNo,TODAY,BalAccType,
                                      BalAccNo, BLoanRec."Loan No.",LoanApps."Global Dimension 1 Code",LoanApps."Global Dimension 2 Code",TransType,BLoanRec."Loan No.",'','',0,'',0);

                                      TotalTopUpCharges += BLoanRec."Approved Amount";

                                      BLoanRec.Posted := TRUE;
                                      BLoanRec.MODIFY;
           //Bridging Loan Recovery
                                    Members.GET(BLoanRec."Member No.");
                                    {IF MemberCat.GET(Members."Member Category") THEN
                                    BEGIN}
                                    //MESSAGE(MemberCat."No.");
                                    //ERROR(FORMAT(BLoanRec."Approved Amount"));
                                    //IF MemberCat."Recover Fully on Bridging"=TRUE THEN BEGIN
                                    LineNo:=LineNo+10000;
                                    Descr:='Bridging Loan interest Recovery';
                                    JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType::Credit,LoanNo,Descr,BLoanRec."Approved Amount"*-1,BLoanRec."Loan Account",TODAY,BalAccType,
                                    BalAccNo, BLoanRec."Loan No.",LoanApps."Global Dimension 1 Code",LoanApps."Global Dimension 2 Code",TransType,BLoanRec."Loan No.",'','',0,'',0);
                                    //Debit Fosa
                                    LineNo:=LineNo+10000;
                                    Descr:='Bridging Loan interest Recovery';
                                    JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType::Savings,LoanNo,Descr,BLoanRec."Approved Amount"*1,LoanApps."Disbursement Account No",TODAY,BalAccType,
                                    '', '',LoanApps."Global Dimension 1 Code",LoanApps."Global Dimension 2 Code",TransType::" ",BLoanRec."Loan No.",'','',0,'',0);

                                   // END;
                                    //END;

                                    END;
                                END;
                            END;*/
                            //END;
                            //End of 06.05.2021 Additions



                            //If excise duty involved
                            //     IF PCharges."Effect Excise Duty"=PCharges."Effect Excise Duty"::Yes THEN BEGIN
                            //       GenSetup.TESTFIELD("Excise Duty G/L");
                            //       GenSetup.TESTFIELD("Excise Duty (%)");
                            //       LineNo:=LineNo+10000;
                            //       AccType:=AccType::"G/L Account";
                            //       AccNo:=GenSetup."Excise Duty G/L";
                            //       TransType:=TransType::" ";
                            //       BalAccType:=BalAccType::Savings;
                            //       BalAccNo :=LoanApps."Disbursement Account No";
                            //       Amt:=Amt*GenSetup."Excise Duty (%)"*0.01;
                            //
                            //      JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType,LoanNo,COPYSTR((PCharges."Charge Description"+'-Excise Duty'),1,50),Amt,AccNo,TODAY,BalAccType,
                            //      BalAccNo, LoanApps."Loan No.",LoanApps."Global Dimension 1 Code",LoanApps."Global Dimension 2 Code",TransType,LoanApps."Loan No.",'','',0,'',0);
                            //
                            //
                            //     END;
                            until PCharges.Next = 0;
                        end;


                    until TopUp.Next = 0;
                end;

                if TotalCleared > 0 then begin
                    LineNo := LineNo + 10000;
                    AccType := Acctype::Savings;
                    AccNo := LoanApps."Disbursement Account No";
                    TransType := Transtype::" ";
                    BalAccType := Balacctype::"G/L Account";
                    BalAccNo := '';
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, CopyStr(('Total Loan Offset- Loan Clearance Facility'), 1, 50), TotalCleared, AccNo, Today, BalAccType,
                    BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, TopUp."Loan Top Up", '', '', 0, '', 0);
                end;

                //Balancing entry if disbursed via Savings
                //END;

                //GL
                //Added 06.05.2021
                if BridgLoan > 0 then begin
                    if BridgLoan > 50000 then BridgLoan := 50000;
                    LineNo := LineNo + 10000;
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::"G/L Account", LoanNo, PCharges."Charge Description", -BridgLoan, TopUPGL, Today, BalAccType,
                    BalAccNo, LoanApps."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                    BLoanNo := CreateBridgingLoan(LoanApps."Member No.", TotalCleared);
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

                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, TotalCleared, AccNo, Today, BalAccType,
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
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Credit, LoanNo, Descr, TotalCleared * -1, BLoanRec."Loan Account", Today, BalAccType,
                                BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);
                                //Debit Fosa

                                LineNo := LineNo + 10001;
                                Descr := BLoanRec."Loan Product Type Name" + '- Interest Paid';
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Savings, LoanNo, Descr, BridgLoan * 1, LoanApps."Disbursement Account No", Today, BalAccType,
                                '', '', LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", Transtype::" ", BLoanRec."Loan No.", '', '', 0, '', 0);

                                //Interest Due
                                LineNo := LineNo + 10000;
                                Descr := BLoanRec."Loan Product Type Name" + '- Interest Due';
                                TransType := Transtype::"Interest Due";
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, BridgLoan, AccNo, Today, BalAccType,
                                BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);


                                //Interest Paid
                                LineNo := LineNo + 10000;
                                Descr := BLoanRec."Loan Product Type Name" + '- Interest Paid';
                                TransType := Transtype::"Interest Paid";
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, BridgLoan * -1, AccNo, Today, BalAccType,
                                BalAccNo, BLoanRec."Loan No.", LoanApps."Global Dimension 1 Code", LoanApps."Global Dimension 2 Code", TransType, BLoanRec."Loan No.", '', '', 0, '', 0);

                                // END;
                                //END;

                            end;
                        end;
                    end;
                    //END;
                    //End of 06.05.2021 Additions
                end;




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


                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'External Loan Cleared', OtherCommitments.Amount * -1, AccNo, Today, BalAccType,
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



                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
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

                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
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
                    SendSMS.SendSms(Sourcetype::"Loan Posted", Members."Mobile Phone No", 'Your Loan of ' + Format(LoanApps."Approved Amount") + ' ' + 'has been credited to your account'
                                , LoanApps."Loan No.", LoanApps."Disbursement Account No", false);



                LoanApps.Advice := true;
                LoanApps."Advice Type" := LoanApps."advice type"::"Fresh Loan";
                LoanApps."Disbursement Date" := Today;
                LoanApps.Validate("Disbursement Date");
                LoanApps.Posted := true;
                LoanApps.Modify;

                AdviceLoan(LoanApps."Loan No.", false);





            end;
        end;





        //Post New
        /*GenJournalLine.RESET;
        GenJournalLine.SETRANGE("Journal Template Name",Jtemplate);
        GenJournalLine.SETRANGE("Journal Batch Name",JBatch);
        IF GenJournalLine.FIND('-') THEN BEGIN
        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJournalLine);
        END;*/

        JournalPosting.CompletePosting(Jtemplate, JBatch);

        Commit;

        if LoanApps."Picked Mobile Loan" = false then
            Message('Posted successfully.');

    end;


    procedure "PostLoan Subsequent Disbursements"(BatchNo: Code[20])
    var
        PartialDisb: Record 52185751;
    begin

        Temp.Get(UserId);

        Jtemplate := Temp."Loans Template";
        JBatch := Temp."Loans Batch";

        if Jtemplate = '' then begin
            Error('Ensure the Loans Template is set up in Cash Office Setup');
        end;
        if JBatch = '' then begin
            Error('Ensure the Loans Batch is set up in the Cash Office Setup')
        end;

        //PRORATED DAYS


        EndMonth := CalcDate('-1D', CalcDate('1M', Dmy2date(1, Date2dmy(Today, 2), Date2dmy(Today, 3))));
        RemainingDays := (EndMonth - Today) + 1;
        TMonthDays := Date2dmy(EndMonth, 1);
        //PRORATED DAYS

        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", Jtemplate);
        GenJournalLine.SetRange("Journal Batch Name", JBatch);
        GenJournalLine.DeleteAll;



        BatchLines.Reset;
        BatchLines.SetRange(BatchLines.No, BatchNo);
        BatchLines.SetRange(BatchLines.Posted, false);
        if BatchLines.Find('-') then
            repeat
                if LoanApps.Get(BatchLines."Loan No.") then begin
                    ProdFac.Get(LoanApps."Loan Product Type");
                    if CustomerRecord.Get(LoanApps."Member No.") then begin

                        if LoanApps.Posted = false then
                            Error('Loan status must be posted for you to process this. - ' + LoanApps."Loan No.");

                        //check balance for Jenga loan
                        if ProdFac."Mortgage Loan" = true then
                            "CheckDisbursementA/CBalanceForMortgage"(LoanApps."Disbursement Account No");


                        ///RunningDate:=Batches."Posting Date";

                        //Generate and post Approved Loan Amount
                        if not GenBatch.Get(Jtemplate, JBatch) then begin
                            GenBatch.Init;
                            GenBatch."Journal Template Name" := Jtemplate;
                            GenBatch.Name := JBatch;
                            GenBatch.Insert;
                        end;

                        //Check that loan not fully disburses
                        LoanApps.CalcFields(LoanApps."Total Disbursed");

                        if LoanApps."Total Disbursed" + BatchLines."Disbursement Amount" > LoanApps."Approved Amount" then
                            Error(Text0001, LoanApps."Loan No.");


                        AccType := Acctype::Credit;
                        AccNo := LoanApps."Loan Account";
                        TransType := Transtype::Loan;
                        BalAccType := Balacctype::"G/L Account";
                        BalAccNo := '';
                        Amt := 0;
                        LineNo := LineNo + 10000;
                        Descr := '';
                        Descr := ProdFac."Product Description"/*+' '+'Loan'*/;
                        Descr := CopyStr(Descr, 1, 50);

                        //Approved amount
                        if BatchLines."Disbursement Amount" > 0 then
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, BatchLines."Disbursement Amount", AccNo, Today, BalAccType,
                          BalAccNo, LoanApps."Loan No.", '', '', TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                        PartialDisb.Reset;
                        PartialDisb.SetRange(PartialDisb."Loan No.", BatchLines."Loan No.");
                        PartialDisb.SetRange(PartialDisb."Entry No", BatchLines."Disbursement Serial - PD");
                        if PartialDisb.Find('-') then begin
                            if (PartialDisb."Disbursement Destination" = PartialDisb."disbursement destination"::Cheque) or (PartialDisb."Disbursement Destination" = PartialDisb."disbursement destination"::MPesa) then begin


                                AccNo := '';
                                Amt := 0;
                                AccType := Acctype::"Bank Account";

                                if PartialDisb."Disbursement Destination" = PartialDisb."disbursement destination"::MPesa then
                                    AccNo := Temp."MPESA Disbursement A/c"
                                else
                                    AccNo := Temp."Cheque Disbursement A/c";
                                TransType := Transtype::" ";
                                LineNo := LineNo + 10000;
                                Descr := '';
                                Descr := ProdFac."Product Description" + ' ' + 'Loan';
                                Descr := CopyStr(Descr, 1, 50);
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, -PartialDisb.Amount, AccNo,
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
                                Descr := ProdFac."Product Description"/*+' '+'Loan'*/;
                                Descr := CopyStr(Descr, 1, 50);
                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, BatchNo, Descr, -PartialDisb.Amount, AccNo,
                                Today, BalAccType, BalAccNo, '', '', '', TransType, '', '', '', 0, '', 0);
                            end;
                        end;



                    end;
                end;
            until BatchLines.Next = 0;




        //Post New
        JournalPosting.CompletePosting(Jtemplate, JBatch);


        //Update if succefully posted

        //IF Batches.GET(BatchNo) THEN BEGIN
        Post := false;
        Post := JournalPostingSucc.PostedSuccessfully;
        //END;

        if Post = true then begin
            BatchLines.Reset;
            BatchLines.SetRange(No, BatchNo);
            if BatchLines.Find('-') then begin
                repeat
                    LoanApps.Reset;
                    LoanApps.SetRange("Batch No.", BatchNo);
                    if LoanApps.Find('-') then begin
                        repeat
                            LoanApps.Advice := true;
                            LoanApps."Advice Type" := LoanApps."advice type"::"Fresh Loan";
                            LoanApps.Posted := true;
                            LoanApps."Disbursement Date" := Today;
                            AdviceLoan(LoanApps."Loan No.", false);
                        until LoanApps.Next = 0;
                    end;
                    BatchLines."Time Posted" := Time;
                    BatchLines."Date Posted" := Today;
                    BatchLines.Posted := true;
                    if Batches.Get(BatchNo) then begin
                        Batches.Posted := true;
                        Batches."Posted By" := UserId;
                        Batches.Modify;
                        Commit;
                    end;




                    PartialDisb.Reset;
                    PartialDisb.SetRange(PartialDisb."Loan No.", BatchLines."Loan No.");
                    PartialDisb.SetRange(PartialDisb."Entry No", BatchLines."Disbursement Serial - PD");
                    if PartialDisb.Find('-') then begin
                        PartialDisb."Date Posted" := Today;
                        PartialDisb."Time Posted" := Time;
                        PartialDisb."Posted By" := UserId;
                        PartialDisb.Posted := true;
                        PartialDisb.Modify;
                        Commit;
                    end;

                until BatchLines.Next = 0;
            end;
        end;

    end;


    procedure PostLien(PeriodFilter: Date; LoanApp: Record 52185729)
    var
        SavingsAccounts: Record 52185730;
        GlobalDim1: Code[20];
        GlobalDim2: Code[20];
        ProductFactory: Record 52185690;
        AvailableBal: Decimal;
        Amt: Decimal;
        RunBal: Decimal;
    begin
        Temp.Get(UserId);
        Temp.TestField(Temp."Loans Template");
        Temp.TestField(Temp."Loans Batch");

        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", Jtemplate);
        GenJournalLine.SetRange("Journal Batch Name", JBatch);
        GenJournalLine.DeleteAll;

        LoanApps.Reset;
        LoanApps.SetRange(LoanApps."Loan No.", LoanApp."Loan No.");
        LoanApps.SetFilter(LoanApps.Posted, '%1', true);
        LoanApps.SetFilter(LoanApps."Date Filter", '%1', PeriodFilter);
        if LoanApps.Find('-') then begin
            LoanApps.CalcFields(LoanApps."Outstanding Interest", LoanApps."Outstanding Bills", LoanApps."Outstanding Balance");
            if (LoanApps."Outstanding Bills" > 0) or (LoanApps."Outstanding Interest" > 0) then begin

                if SavingsAccounts.Get(LoanApps."Disbursement Account No") then begin
                    SavingsAccounts.SetFilter(SavingsAccounts.Blocked, '%1', SavingsAccounts.Blocked::" ");
                    SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)", SavingsAccounts."Authorised Over Draft",
                                               SavingsAccounts."Uncleared Cheques", SavingsAccounts."ATM Transactions");
                    GlobalDim1 := SavingsAccounts."Global Dimension 1 Code";
                    GlobalDim2 := SavingsAccounts."Global Dimension 2 Code";

                    if ProductFactory.Get(SavingsAccounts."Product Type") then
                        AvailableBal := (SavingsAccounts."Balance (LCY)" + SavingsAccounts."Authorised Over Draft") -
                                       (SavingsAccounts."Uncleared Cheques" + SavingsAccounts."ATM Transactions" + ProductFactory."Minimum Balance" + TCharges);


                    if LoanApps."Outstanding Interest" > 0 then begin
                        if AvailableBal > LoanApps."Outstanding Interest" then
                            Amt := LoanApps."Outstanding Interest"
                        else
                            Amt := AvailableBal;

                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanApps."Loan No.", 'Interest Due Lien' + LoanApps."Loan No.", -Amt, AccNo, Today, BalAccType,
                                                   BalAccNo, LoanApps."Loan No.", '', '', TransType, '', '', '', 0, '', 0);
                        RunBal -= Abs(Amt);
                    end;

                    if LoanApps."Outstanding Bills" > 0 then begin
                        if RunBal > LoanApps."Outstanding Bills" then
                            Amt := LoanApps."Outstanding Bills"
                        else
                            Amt := RunBal;

                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanApps."Loan No.", 'Repayment - Lien' + LoanApps."Loan No.", -Amt, AccNo, Today, BalAccType,
                                                   BalAccNo, LoanApps."Loan No.", '', '', TransType, '', '', '', 0, '', 0);
                    end;

                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, SavingsAccounts."No.", 'Repayment - Lien' + LoanApps."Loan No.", -Amt, AccNo, Today, BalAccType,
                                               BalAccNo, LoanApps."Loan No.", '', '', TransType, '', '', '', 0, '', 0);


                end;

            end;

        end;
    end;


    procedure BusinessLoan(Loans: Record 52185729)
    var
        BusinessIncome: Record 52186097;
        ProductFactory: Record 52185690;
    begin
        begin
            BusinessIncome.Reset;
            BusinessIncome.SetRange(BusinessIncome."Loan No.", Loans."Loan No.");
            if BusinessIncome.Find('-') then begin
                BusinessIncome.CalcSums(BusinessIncome."Average Amount (Internal)", "Average Amount (External)");
                if ProductFactory.Get(Loans."Loan Product Type") then begin
                    ProductFactory.TestField(ProductFactory."Computation %");
                    // "Recommended Amount" := (BusinessIncome."Average Amount (Internal)" + BusinessIncome."Average Amount (External)") * (ProductFactory."Computation %" / 100);
                    Loans.Modify;
                    Commit;
                end;
            end;
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
        MortgageInsurance: Decimal;
    begin
        if Loans.Get(LoanNo) then begin

            ProdFac.Get(Loans."Loan Product Type");

            GenSetup.Get;
            if Loans."Recovery Mode" = Loans."recovery mode"::Checkoff then begin //KIgen Added to block non checkoff from advising
                Loans.CalcFields(Loans."Outstanding Balance");
                InterestAmount := ((Loans."Outstanding Balance" * Loans.Interest / 1200) / Loans.Installments);
                if InterestAmount < 0 then
                    InterestAmount := 0;
                MortgageInsurance := 0;
                //MortgageInsurance:=GenSetup."Mortgage Insurance Amount";
                MortgageInsurance := Loans."Mortgage Insurance Amount";

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
                    CheckoffAdvice."Amount On" := Loans.Repayment + MortgageInsurance;//-InterestAmount;

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


    procedure AdviceShares(SavingsAccounts: Record 52185730; BalanceOff: Decimal; AmountOn: Decimal)
    var
        CheckoffAdvice: Record 52185818;
        iEntryNo: Integer;
        SavingsAccount: Record 52185730;
    begin
        begin
            iEntryNo := 0;
            CheckoffAdvice.Reset;
            if CheckoffAdvice.Find('+') then
                iEntryNo := CheckoffAdvice."Entry No" + 1;

            CheckoffAdvice.Init;
            CheckoffAdvice."Entry No" := iEntryNo;
            CheckoffAdvice."Account No." := SavingsAccounts."No.";
            CheckoffAdvice."Member No." := SavingsAccounts."Member No.";
            CheckoffAdvice.Validate(CheckoffAdvice."Member No.");
            CheckoffAdvice."Payroll No" := SavingsAccounts."Payroll/Staff No.";
            SavingsAccount.Reset;
            SavingsAccount.SetRange("No.", SavingsAccounts."No.");
            if SavingsAccount.Find('-') then begin
                if SavingsAccount."Monthly Contribution" < AmountOn then
                    CheckoffAdvice."Amount On" := AmountOn//SavingsAccount."Monthly Contribution";
                else
                    CheckoffAdvice."Amount On" := SavingsAccount."Monthly Contribution";
                CheckoffAdvice."Amount Off" := SavingsAccount."Monthly Contribution";
                SavingsAccount.CalcFields("Balance (LCY)");
                CheckoffAdvice."Balance On" := SavingsAccount."Balance (LCY)" + BalanceOff;
            end;

            SavingsAccount.Reset;
            SavingsAccount.SetRange("No.", SavingsAccounts."No.");
            SavingsAccount.SetRange("Product Category", SavingsAccount."product category"::"Share Capital");
            if SavingsAccount.Find('-') then begin
                SavingsAccount.CalcFields("Balance (LCY)");
                CheckoffAdvice."Balance On" := SavingsAccount."Balance (LCY)" + CheckoffAdvice."Balance On";
            end;
            if SavingsAccounts."Employer Balance" <> 0 then
                CheckoffAdvice."Balance On" := SavingsAccounts."Employer Balance" + SavingsAccount."Monthly Contribution" + BalanceOff;

            CheckoffAdvice."Advice Method" := CheckoffAdvice."advice method"::Changes;
            CheckoffAdvice."Advice Date" := Today;
            CheckoffAdvice."ID No." := SavingsAccounts."ID No.";
            CheckoffAdvice."Employer Code" := SavingsAccounts."Employer Code";
            CheckoffAdvice.Names := SavingsAccounts.Name;
            if SavingsAccounts."Employer Account No" <> '' then
                CheckoffAdvice."Employer Account No." := SavingsAccounts."Employer Account No"
            else
                CheckoffAdvice."Employer Account No." := SavingsAccounts."No.";
            CheckoffAdvice."Product Type" := SavingsAccounts."Product Type";
            if AmountOn <> SavingsAccount."Monthly Contribution" then
                CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Variations
            else
                CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Adjustment;
            CheckoffAdvice.Type := CheckoffAdvice.Type::Savings;
            // if (SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Deposit Contribution") and
            //   (AmountOn >= "Monthly Contribution") or (BalanceOff > 0) then
            //     CheckoffAdvice.Insert;
        end;
    end;

    local procedure RegisterMortgageDocuments(LoanNo: Code[30])
    var
        MortgageLoansDocRegister: Record 52186088;
    begin
        if LoanApps.Get(LoanNo) then begin
            MortgageLoansDocRegister.Init;
            MortgageLoansDocRegister."Loan No." := LoanApps."Loan No.";
            MortgageLoansDocRegister."Member No" := LoanApps."Member No.";
            MortgageLoansDocRegister."Member Name" := LoanApps."Member Name";
            MortgageLoansDocRegister."Date Withheld" := Today;
            MortgageLoansDocRegister."User Registered" := UserId;
            MortgageLoansDocRegister."Document Type" := MortgageLoansDocRegister."document type"::"Lease/Title";
            MortgageLoansDocRegister."Document Withheld" := true;
            MortgageLoansDocRegister."Loan Type" := LoanApps."Loan Product Type";
            MortgageLoansDocRegister."Withheld Document No" := LoanApps."Title/Lease No";
            MortgageLoansDocRegister.Insert;
        end;
    end;

    local procedure "CheckDisbursementA/CBalanceForMortgage"(Account: Code[30])
    var
        cashierTransactions: Record 52185776;
        lienAmount: Decimal;
        saccoAccount: Record 52185730;
        Accounttypes: Record 52185690;
        MiniBalance: Decimal;
        AccountBal: Decimal;
    begin
        GenSetup.Get;
        lienAmount := 0;
        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."No.", Account);
        //saccoAccount.SETRANGE(saccoAccount."Product Type",'505');
        if saccoAccount.Find('-') then begin
            Accounttypes.Reset;
            Accounttypes.SetRange(Accounttypes."Product ID", saccoAccount."Product Type");
            if Accounttypes.Find('-') then begin
                MiniBalance := Accounttypes."Minimum Balance";
            end;
            saccoAccount.CalcFields(saccoAccount."Balance (LCY)");
            saccoAccount.CalcFields(saccoAccount."ATM Transactions");
            saccoAccount.CalcFields(saccoAccount."Uncleared Cheques");


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





            AccountBal := saccoAccount."Balance (LCY)" - (saccoAccount."ATM Transactions" + saccoAccount."Uncleared Cheques" + MiniBalance + lienAmount);

            if AccountBal < GenSetup."Mortgage FOSA Min Balance" then Error('Account No %1 balance must be over %2', Account, GenSetup."Mortgage FOSA Min Balance");
        end
    end;


    procedure CreateBridgingLoan(MemberNo: Code[20]; LoanAmt: Decimal) BridgingLoanNo: Code[20]
    var
        ProductFactory: Record 52185690;
        NewLoans: Record 52185729;
        Credit: Record 52185731;
        Members: Record 52185700;
        LoanAccountNo: Code[20];
    begin
        if LoanAmt <= 0 then
            exit('');

        ProductFactory.Reset;
        ProductFactory.SetRange("Nature of Loan Type", ProductFactory."nature of loan type"::"Bridging Loan");
        if ProductFactory.Find('-') then begin
            if Credit.Get(ProductFactory."Account No. Prefix" + MemberNo + ProductFactory."Account No. Suffix") then
                LoanAccountNo := ProductFactory."Account No. Prefix" + MemberNo + ProductFactory."Account No. Suffix"
            else
                LoanAccountNo := "CreateLoan Account"(MemberNo, ProductFactory."Product ID");

            NewLoans.Reset;
            NewLoans.SetRange(NewLoans."Member No.", MemberNo);
            NewLoans.SetRange(NewLoans."Loan Product Type", ProductFactory."Product ID");
            NewLoans.SetRange(NewLoans.Posted, false);
            if NewLoans.Find('-') then
                NewLoans.DeleteAll;

            NewLoans.Init;
            NewLoans."Loan No." := '';
            NewLoans."Member No." := MemberNo;
            NewLoans."Member Name" := Members.Name;
            NewLoans."Staff No" := Members."Payroll/Staff No.";
            NewLoans."Employer Code" := Members."Employer Code";
            NewLoans."Application Date" := Today;
            NewLoans."Loan Product Type" := ProductFactory."Product ID";
            NewLoans."Loan Product Type Name" := ProductFactory."Product Description";
            NewLoans."Grace Period" := ProductFactory."Grace Period - Interest";
            NewLoans.Interest := ProductFactory."Interest Rate (Min.)";
            NewLoans."Grace Period" := ProductFactory."Grace Period - Interest";
            NewLoans."Interest Calculation Method" := ProductFactory."Interest Calculation Method";
            NewLoans."Loan Span" := ProductFactory."Loan Span";
            NewLoans.Installments := ProductFactory."Prefferential Default installm";
            NewLoans."Compute Interest Due on Postin" := ProductFactory."Compute Interest Due on Postin";
            NewLoans."Repayment Frequency" := ProductFactory."Repayment Frequency";
            NewLoans."Recovery Mode" := ProductFactory."Repay Mode";
            NewLoans."Appraisal Parameter Type" := ProductFactory."Appraisal Parameter Type";
            NewLoans."Recovery Priority" := ProductFactory."Recovery Priority";
            NewLoans.Installments := ProductFactory."Prefferential Default installm";
            NewLoans."Requested Amount" := LoanAmt;
            NewLoans.Repayment := ROUND(LoanAmt / NewLoans.Installments, 1, '>');
            NewLoans."Loan Principle Repayment" := ROUND(LoanAmt / NewLoans.Installments, 1, '>');
            NewLoans."Approved Amount" := LoanAmt;
            //NewLoans.VALIDATE(NewLoans."Approved Amount");
            NewLoans.Status := NewLoans.Status::Approved;
            NewLoans."Disbursement Date" := Today;
            NewLoans."Repayment Start Date" := Today;
            NewLoans."Loan Account" := LoanAccountNo;
            NewLoans.Advice := true;
            NewLoans."Advice Type" := NewLoans."advice type"::"Fresh Loan";
            NewLoans.Insert(true);

            BridgingLoanNo := NewLoans."Loan No.";
            exit(BridgingLoanNo);
        end;
    end;


    procedure PostLoanNormal(LoanNo: Code[20])
    var
        LoanApp: Record 52185729;
        SavAcc: Record 52185730;
        PeriodicActivities: Codeunit "Periodic Activities";
        Text001: label 'Did you know M-Sacco now allows you to withdraw up to a maxmum of Kes 70,000?.';
        TempLoans: Record 52186131;
        CashierTransactions: Record 52185776;
        OldAmount: Decimal;
        TopUPGL: Code[20];
        "Topup%": Decimal;
        UserSetup: Record "User Setup";
        Dim1: Code[50];
        Dim2: Code[50];
        ShambaLoanProcFee: Decimal;
        ShambaLoanExcise: Decimal;
    begin

        Temp.Get(UserId);

        Jtemplate := Temp."Loans Template";
        JBatch := Temp."Loans Batch";

        if Jtemplate = '' then begin
            Error('Ensure the Loans Template is set up in Banking User Setup');
        end;
        if JBatch = '' then begin
            Error('Ensure the Loans Batch is set up in Banking User Setup')
        end;

        //PRORATED DAYS

        //PRORATED DAYS

        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", Jtemplate);
        GenJournalLine.SetRange("Journal Batch Name", JBatch);
        GenJournalLine.DeleteAll;


        //Mark Posted Loans Already Posted.
        GLEntry.Reset;
        GLEntry.SetRange("Document No.", LoanNo);
        if GLEntry.FindFirst then begin

            LoanApps.Reset;
            LoanApps.SetRange("Loan No.", LoanNo);
            if LoanApps.Find('-') then begin
                repeat
                    LoanApps.Advice := true;
                    LoanApps."Advice Type" := LoanApps."advice type"::"Fresh Loan";
                    LoanApps."Disbursement Date" := Today;
                    LoanApps.Posted := true;

                    LoanApps.Modify;
                    AdviceLoan(LoanApps."Loan No.", false);
                until LoanApps.Next = 0;
            end;
        end;



        //Mark Posted Loans Already Posted.

        LoanApps.Reset;
        LoanApps.SetRange(LoanApps."Loan No.", LoanNo);
        LoanApps.SetRange(LoanApps.Posted, false);
        if LoanApps.Find('-') then begin
            UserSetup.Reset;
            UserSetup.SetRange("User ID", UserId);
            if UserSetup.FindFirst then begin
                UserSetup.TestField("Global Dimension 1 Code");
                UserSetup.TestField("Global Dimension 2 Code");
                Dim1 := UserSetup."Global Dimension 1 Code";
                Dim2 := UserSetup."Global Dimension 2 Code";
            end;

            LoanApps."Global Dimension 1 Code" := Dim1;
            LoanApps."Global Dimension 2 Code" := Dim2;

            FirstLoop := FirstLoop + 1;
            ChargeExtraComms := false;
            ExcemptCharges := false;
            ProdFac.Get(LoanApps."Loan Product Type");

            if CustomerRecord.Get(LoanApps."Member No.") then begin
                //Check if excempted from charges
                if Cust.Get(CustomerRecord."No.") then begin
                    if Cust."Dont Charge Transactions" = true then
                        ExcemptCharges := true;
                end;


                if LoanApps.Status <> LoanApps.Status::Approved then
                    Error('Loan status must be Approved for you to post Loan. - ' + LoanApps."Loan No.");

                if LoanApps."Amount To Disburse" <= 0 then
                    Error(Text0002);

                DaysPast := 0;
                EndMonth := CalcDate('-1D', CalcDate('1M', Dmy2date(1, Date2dmy(Today, 2), Date2dmy(Today, 3))));
                RemainingDays := (EndMonth - Today) + 1;
                TMonthDays := Date2dmy(EndMonth, 1);

                //where disbursement day is in the past

                DaysPast := Today - LoanApps."Disbursement Date";


                if DaysPast > 1 then
                    RemainingDays := RemainingDays + DaysPast;





                ///RunningDate:=Batches."Posting Date";

                //Generate and post Approved Loan Amount
                if not GenBatch.Get(Jtemplate, JBatch) then begin
                    GenBatch.Init;
                    GenBatch."Journal Template Name" := Jtemplate;
                    GenBatch.Name := JBatch;
                    GenBatch.Insert;
                end;

                TopUp.Reset;
                TopUp.SetRange(TopUp."Loan No.", LoanApps."Loan No.");
                if TopUp.Find('-') then begin
                    repeat
                        if TopUp."Additional Top Up Commission" = true then
                            ChargeExtraComms := true;
                    until TopUp.Next = 0;
                end;

                GenSetup.Get;

                AccType := Acctype::Credit;
                AccNo := LoanApps."Loan Account";
                TransType := Transtype::Loan;
                BalAccType := Balacctype::"G/L Account";
                BalAccNo := '';
                Amt := 0;
                LineNo := LineNo + 10000;
                Descr := '';
                Descr := ProdFac."Product Description"/*+' '+'Loan'*/;
                Descr := CopyStr(Descr, 1, 50);
                //Approved amount
                if LoanApps."Amount To Disburse" > 0 then
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, LoanApps."Amount To Disburse", AccNo, Today, BalAccType,
                  BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                // IF LoanApps."Mode of Disbursement"=LoanApps."Mode of Disbursement"::"Full Disbursement" THEN BEGIN
                PaySched.Reset;
                PaySched.SetRange(PaySched."Loan No.", LoanApps."Loan No.");
                if PaySched.Find('-') then begin
                    repeat
                        if (PaySched."Payment Options" = PaySched."payment options"::"M-PESA") or (PaySched."Payment Options" = PaySched."payment options"::Cheques) then begin

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
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, -PaySched.Amount, AccNo,
                            Today, BalAccType, BalAccNo, '', '', '', TransType, '', '', '', 0, '', 0);
                        end;
                    until PaySched.Next = 0;
                end;

                //IF Batches.GET(BatchNo) THEN BEGIN
                //Batches.CALCFIELDS("Total Amount");
                //IF Batches."Disbursement Destination"=Batches."Disbursement Destination"::Normal THEN BEGIN
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
                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, -LoanApps."Amount To Disburse", AccNo,
                Today, BalAccType, BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);


                ShambaLoanProcFee := 0;
                ShambaLoanExcise := 0;
                PCharges.Reset;
                PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
                PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::General);
                if PCharges.Find('-') then begin
                    repeat
                        //Non Prorate
                        if PCharges.Prorate = PCharges.Prorate::" " then begin
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
                                                end
                                            until TariffDetails.Next = 0;
                                        end;
                                    end;

                            if Amt < PCharges.Minimum then
                                Amt := PCharges.Minimum;
                            if Amt > PCharges.Maximum then
                                Amt := PCharges.Maximum;

                            Amt := Amt * -1;

                            if ExcemptCharges = true then
                                Amt := 0;


                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                            BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                            ShambaLoanProcFee += Amt;

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

                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, CopyStr((PCharges."Charge Description" + '-Excise Duty'), 1, 50), Amt, AccNo, Today, BalAccType,
                                BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                ShambaLoanExcise += Amt;

                            end;
                        end else
                            if PCharges.Prorate = PCharges.Prorate::Appraisal then begin

                                //Prorate
                                LineNo := LineNo + 10000;
                                AccType := Acctype::Credit;
                                AccNo := LoanApps."Loan Account";
                                TransType := Transtype::Appraisal;
                                BalAccType := Balacctype::"G/L Account";
                                BalAccNo := '';
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

                                if ExcemptCharges = true then
                                    Amt := 0;

                                LoanApps."Appraisal Fee" := Amt;
                                Amt := Amt * -1;
                                LoanApps."Disbursement Date" := Today;
                                LoanApps.Validate("Disbursement Date");
                                LoanApps.Modify;
                                Commit;



                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                                BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                                ShambaLoanProcFee += Amt;

                                LineNo := LineNo + 10000;
                                AccType := Acctype::Savings;
                                AccNo := LoanApps."Disbursement Account No";
                                TransType := Transtype::" ";
                                BalAccType := Balacctype::"G/L Account";
                                BalAccNo := '';

                                Amt := Amt * -1;

                                if ExcemptCharges = true then
                                    Amt := 0;

                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                                BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                            end;
                    until PCharges.Next = 0;
                end;


                if (ProdFac."Mortgage Loan" = true) and (LoanApps."Loan Product Type" <> '138') then begin
                    //denis this is to cater for mortgage loans
                    "CheckDisbursementA/CBalanceForMortgage"(LoanApps."Disbursement Account No");

                    AccNo := LoanApps."Disbursement Account No";
                    AccType := Acctype::Savings;
                    BalAccType := Balacctype::"G/L Account";
                    BalAccNo := '';
                    TransType := Transtype::" ";
                    BalAccType := Balacctype::"G/L Account";
                    LineNo := LineNo + 10000;
                    Descr := '';
                    Descr := ProdFac."Product Description" + ' ' + ' to Vendor ' + GenSetup."Mortgage Loan Vendor A/C";//;    GenSetup."Early Withdrawal %";
                    Descr := CopyStr(Descr, 1, 50);
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, LoanApps."Amount To Disburse", AccNo,
                    Today, BalAccType, BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                    //amount to Vendor A/c
                    AccNo := GenSetup."Mortgage Loan Vendor A/C";//GenSetup."Early Withdrawal %";
                    AccType := Acctype::Vendor;
                    BalAccType := Balacctype::"G/L Account";
                    BalAccNo := '';
                    TransType := Transtype::" ";
                    BalAccType := Balacctype::"G/L Account";
                    LineNo := LineNo + 10000;
                    Descr := '';
                    Descr := ProdFac."Product Description" + ' ' + ' From ' + LoanApps."Disbursement Account No";
                    Descr := CopyStr(Descr, 1, 50);
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, -LoanApps."Amount To Disburse", AccNo,
                    Today, BalAccType, BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                    RegisterMortgageDocuments(LoanApps."Loan No.");

                end;


                // Cater For Shamba Loan
                if (ProdFac."Shamba Loan" = true) then begin

                    //"CheckDisbursementA/CBalanceForMortgage"(LoanApps."Disbursement Account No");

                    AccNo := LoanApps."Disbursement Account No";
                    AccType := Acctype::Savings;
                    BalAccType := Balacctype::"G/L Account";
                    BalAccNo := '';
                    TransType := Transtype::" ";
                    BalAccType := Balacctype::"G/L Account";
                    LineNo := LineNo + 10000;
                    Descr := '';
                    Descr := ProdFac."Product Description" + ' ' + ' to Vendor ' + GenSetup."Shamba Loan Vendor A/C"; //GenSetup."Early Withdrawal %";
                    Descr := CopyStr(Descr, 1, 50);
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, LoanApps."Amount To Disburse" - (Abs(ShambaLoanProcFee) + Abs(ShambaLoanExcise)), AccNo,
                    Today, BalAccType, BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                    //amount to Vendor A/c
                    AccNo := GenSetup."Shamba Loan Vendor A/C";//GenSetup."Early Withdrawal %";
                    AccType := Acctype::Vendor;
                    BalAccType := Balacctype::"G/L Account";
                    BalAccNo := '';
                    TransType := Transtype::" ";
                    BalAccType := Balacctype::"G/L Account";
                    LineNo := LineNo + 10000;
                    Descr := '';
                    Descr := ProdFac."Product Description" + ' ' + ' From ' + LoanApps."Disbursement Account No";
                    Descr := CopyStr(Descr, 1, 50);
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, -(LoanApps."Amount To Disburse" - (Abs(ShambaLoanProcFee) + Abs(ShambaLoanExcise))), AccNo,
                    Today, BalAccType, BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                    RegisterMortgageDocuments(LoanApps."Loan No.");

                end;
                // Cater For Shamba Loan//End

                /* END ELSE IF Batches."Disbursement Destination"=Batches."Disbursement Destination"::"Bank Account" THEN BEGIN
                   Batches.TESTFIELD("Cheque No.");
                   Batches.TESTFIELD("Disburse Accounts");
                     Batches.CALCFIELDS("Total Amount");
                     AccNo:=Batches."Disburse Accounts";
                     AccType:=AccType::"Bank Account";
                     BalAccType:=BalAccType::"G/L Account";
                     BalAccNo:='';
                     TransType:=TransType::" ";
                     BalAccType:=BalAccType::"G/L Account";
                     LineNo:=LineNo+10000;
                     Descr:='';
                     Descr:=ProdFac."Product Description"+' '+'Loan';
                     Descr:=COPYSTR(Descr,1,50);
                     JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType,BatchNo,Descr,-Batches."Total Amount",AccNo,
                     TODAY,BalAccType,BalAccNo,Batches."Cheque No.",Dim1,Dim2,TransType,'','','',0,'',0);

                 END ELSE IF Batches."Disbursement Destination"=Batches."Disbursement Destination"::Supplier THEN BEGIN



                   //Effect special charges
                     GenSetup.TESTFIELD("Special Charge on Loans GL");
                     LineNo:=LineNo+10000;
                     AccType:=AccType::"G/L Account";
                     AccNo:=GenSetup."Special Charge on Loans GL";
                     Descr:='';
                     Descr:=ProdFac."Product Description"+' '+'Charges';
                     Descr:=COPYSTR(Descr,1,50);
                     TransType:=TransType::" ";
                     BalAccType:=BalAccType::"G/L Account";
                     BalAccNo :='';
                     Amt:=Batches."Special Processing Commission"*-1;



                 JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType,BatchNo,Descr,Amt,AccNo,TODAY,BalAccType,
               BalAccNo, LoanApps."Loan No.",Dim1,Dim2,TransType,LoanApps."Loan No.",'','',0,'',0);

             //If excise duty involved
                    GenSetup.TESTFIELD("Excise Duty G/L");
                    GenSetup.TESTFIELD("Excise Duty (%)");
                    LineNo:=LineNo+10000;
                    AccType:=AccType::"G/L Account";
                    AccNo:=GenSetup."Excise Duty G/L";
                    TransType:=TransType::" ";
                    Descr:='';
                    Descr:=ProdFac."Product Description"+' '+'Excise Duty';
                    Descr:=COPYSTR(Descr,1,50);
                    BalAccType:=BalAccType::"G/L Account";
                    BalAccNo :='';
                    Amt:=Amt*GenSetup."Excise Duty (%)"*0.01;

                   JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType,BatchNo,Descr,Amt,AccNo,TODAY,BalAccType,
                   BalAccNo, LoanApps."Loan No.",Dim1,Dim2,TransType,LoanApps."Loan No.",'','',0,'',0);


              //Pass to supplier account

                     AccNo:=Batches."Disburse Accounts";
                     AccType:=AccType::Vendor;
                     BalAccType:=BalAccType::"G/L Account";
                     BalAccNo:='';
                     TransType:=TransType::" ";
                     BalAccType:=BalAccType::"G/L Account";
                     LineNo:=LineNo+10000;
                     Descr:='';
                     Descr:=ProdFac."Product Description"+' '+'Loan';
                     Descr:=COPYSTR(Descr,1,50);
                     Amt:=Batches."Total Amount"-(Batches."Special Processing Commission"+(Batches."Special Processing Commission"*GenSetup."Excise Duty (%)"*0.01));
                     JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType,BatchNo,Descr,-Amt,AccNo,
                     TODAY,BalAccType,BalAccNo,'',Dim1,Dim2,TransType,'','','',0,'',0);

                 END;
          END;*/





                //Boosting comms
                //IF Batches."Disbursement Destination" =Batches."Disbursement Destination"::Normal THEN BEGIN
                if (LoanApps."Share Boosted Amount" > 0) and (ProdFac."Appraisal Parameter Type" = ProdFac."appraisal parameter type"::"Check Off") then begin
                    GenSetup.Get;
                    LineNo := LineNo + 10000;
                    AccType := Acctype::"G/L Account";
                    AccNo := GenSetup."Share Boost GL";
                    TransType := Transtype::" ";
                    BalAccType := Balacctype::Savings;
                    BalAccNo := LoanApps."Disbursement Account No";
                    Amt := LoanApps."Share Boosted Amount";


                    if ExcemptCharges = true then
                        Amt := 0;
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Share Boosting Comms', -Amt, AccNo, Today, BalAccType,
                  BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                end;
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


                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Deposit Purchase-Share Boost', Amt, AccNo, Today, BalAccType,
                  BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);
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



                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Share Boost', -Amt, AccNo, Today, BalAccType,
                  BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                    ///Advice ShareBoost
                    if LoanApps."Loans - Deposit Purchase" > 0 then begin
                        SavAcc.Reset;
                        SavAcc.SetRange(SavAcc."Member No.", LoanApps."Member No.");
                        SavAcc.SetRange(SavAcc."Product Category", SavAcc."product category"::"Deposit Contribution");
                        if SavAcc.Find('-') then
                            //SavAcc.VALIDATE(SavAcc."Monthly Contribution");
                            AdviceShares(SavAcc, LoanApps."Loans - Deposit Purchase", SavAcc."Monthly Contribution");
                    end;

                    //Pass charges if defined

                    PCharges.Reset;
                    PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
                    PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::Boosting);
                    if PCharges.Find('-') then begin
                        repeat
                            //Non Prorate
                            LineNo := LineNo + 10000;
                            AccType := Acctype::"G/L Account";
                            AccNo := PCharges."Charges G_L Account";
                            TransType := Transtype::" ";
                            BalAccType := Balacctype::Savings;
                            BalAccNo := LoanApps."Disbursement Account No";
                            if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                Amt := (LoanApps."Loans - Deposit Purchase" * (PCharges.Percentage / 100))
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
                                                if (LoanApps."Loans - Deposit Purchase" >= TariffDetails."Lower Limit") and (LoanApps."Loans - Deposit Purchase" <= TariffDetails."Upper Limit") then begin
                                                    if TariffDetails."Use Percentage" = true then begin
                                                        Amt := LoanApps."Loans - Deposit Purchase" * TariffDetails.Percentage * 0.01;
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

                            if ExcemptCharges = true then
                                Amt := 0;


                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                          BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);

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

                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, CopyStr((PCharges."Charge Description" + '-Excise Duty'), 1, 50), Amt, AccNo, Today, BalAccType,
                                BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                            end;


                        until PCharges.Next = 0;

                    end;

                end;

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

                    AdviceLoan(TopUp."Loan Top Up", true);


                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Top up Principle' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                  BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, TopUp."Loan Top Up", '', '', 0, '', 0);

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


                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Outs. Bill' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                          BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, TopUp."Loan Top Up", '', '', 0, '', 0);
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
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Top up Interest' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                    BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, TopUp."Loan Top Up", '', '', 0, '', 0);

                    if (TopUp."Principle Top Up" + TopUp."Interest Top Up" + TopUp."Untransfered Interest") <> 0 then begin
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
                    end;
                /*
                //GL
                IF BridgLoan<>0 THEN BEGIN
                        JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType::"G/L Account",BatchNo,PCharges."Charge Description",-BridgLoan,TopUPGL,TODAY,BalAccType,
                      BalAccNo, LoanApps."Loan No.",Dim1,Dim2,TransType,LoanApps."Loan No.",'','',0,'',0);
                      //Added 06.05.2021
                      BridgLoan := (Amt*-1);

                                  BLoanNo := CreateBridgingLoan(LoanApps."Member No.",BridgLoan);

                                  IF BLoanNo<>'' THEN BEGIN
                                      IF BLoanRec.GET(BLoanNo) THEN BEGIN

                                          AccType:=AccType::Credit;
                                          AccNo:=BLoanRec."Loan Account";
                                          TransType:=TransType::Loan;
                                          BalAccType:=BalAccType::"G/L Account";
                                          BalAccNo :='';

                                          LineNo:=LineNo+10000;
                                          Descr:='Bridging Loan Interest';

                                          //Approved amount
                                          IF BLoanRec."Approved Amount">0 THEN BEGIN

                                            JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType,BatchNo,Descr,BLoanRec."Approved Amount",AccNo,TODAY,BalAccType,
                                            BalAccNo, BLoanRec."Loan No.",Dim1,Dim2,TransType,BLoanRec."Loan No.",'','',0,'',0);

                                            TotalTopUpCharges += BLoanRec."Approved Amount";

                                            BLoanRec.Posted := TRUE;
                                            BLoanRec.MODIFY;
                 //Bridging Loan Recovery
                                          Members.GET(BLoanRec."Member No.");
                                          {IF MemberCat.GET(Members."Member Category") THEN
                                          BEGIN}
                                          //MESSAGE(MemberCat."No.");
                                          //ERROR(FORMAT(BLoanRec."Approved Amount"));
                                          //IF MemberCat."Recover Fully on Bridging"=TRUE THEN BEGIN
                                          LineNo:=LineNo+10000;
                                          Descr:='Bridging Loan Interest';
                                          JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType::Credit,BatchNo,Descr,BLoanRec."Approved Amount"*-1,BLoanRec."Loan Account",TODAY,BalAccType,
                                          BalAccNo, BLoanRec."Loan No.",Dim1,Dim2,TransType,BLoanRec."Loan No.",'','',0,'',0);
                                          //Debit Fosa
                                          LineNo:=LineNo+10000;
                                          Descr:='Bridging Loan Interest';
                                          JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AccType::Savings,BatchNo,Descr,BLoanRec."Approved Amount"*1,LoanApps."Disbursement Account No",TODAY,BalAccType,
                                          '', '',Dim1,Dim2,TransType::" ",BLoanRec."Loan No.",'','',0,'',0);

                                         // END;
                                          //END;

                                          END;
                                      END;
                                  END;
                              //END;
                      //End of 06.05.2021 Additions
                   END;
                //hhdhdh
                */

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
                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, CopyStr(('Total Loan Offset- Loan Clearance Facility'), 1, 50), TotalCleared, AccNo, Today, BalAccType,
                BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, TopUp."Loan Top Up", '', '', 0, '', 0);
            end;
            //GL
            //Added 06.05.2021
            if BridgLoan > 0 then begin
                if BridgLoan > 50000 then BridgLoan := 50000;
                LineNo := LineNo + 10000;
                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::"G/L Account", LoanNo, PCharges."Charge Description", -BridgLoan, TopUPGL, Today, BalAccType,
                BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);

                BLoanNo := CreateBridgingLoan(LoanApps."Member No.", TotalCleared);
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

                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, TotalCleared, AccNo, Today, BalAccType,
                            BalAccNo, BLoanRec."Loan No.", Dim1, Dim2, TransType, BLoanRec."Loan No.", '', '', 0, '', 0);


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
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Credit, LoanNo, Descr, TotalCleared * -1, BLoanRec."Loan Account", Today, BalAccType,
                            BalAccNo, BLoanRec."Loan No.", Dim1, Dim2, TransType, BLoanRec."Loan No.", '', '', 0, '', 0);
                            //Debit Fosa

                            LineNo := LineNo + 10001;
                            Descr := BLoanRec."Loan Product Type Name" + '-Interest Paid';
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, Acctype::Savings, LoanNo, Descr, BridgLoan * 1, LoanApps."Disbursement Account No", Today, BalAccType,
                            '', '', Dim1, Dim2, Transtype::" ", BLoanRec."Loan No.", '', '', 0, '', 0);

                            //Interest Due
                            LineNo := LineNo + 10000;
                            Descr := BLoanRec."Loan Product Type Name" + '- Interest Due';
                            TransType := Transtype::"Interest Due";
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, BridgLoan, AccNo, Today, BalAccType,
                            BalAccNo, BLoanRec."Loan No.", Dim1, Dim2, TransType, BLoanRec."Loan No.", '', '', 0, '', 0);


                            //Interest Paid
                            LineNo := LineNo + 10000;
                            Descr := BLoanRec."Loan Product Type Name" + '- Interest Paid';
                            TransType := Transtype::"Interest Paid";
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, Descr, BridgLoan * -1, AccNo, Today, BalAccType,
                            BalAccNo, BLoanRec."Loan No.", Dim1, Dim2, TransType, BLoanRec."Loan No.", '', '', 0, '', 0);

                            // END;
                            //END;

                        end;
                    end;
                end;
                //END;
                //End of 06.05.2021 Additions
            end;


            OtherComms := 0;
            //Clearing external debts
            OtherCommitments.Reset;
            OtherCommitments.SetRange(OtherCommitments."Loan No.", LoanApps."Loan No.");
            if OtherCommitments.Find('-') then begin
                repeat
                    Temp.TestField(Temp."Bankers Cheque Account");

                    TotalCleared := TotalCleared + TopUp."Principle Top Up" + TopUp."Interest Top Up";
                    LineNo := LineNo + 10000;
                    AccType := Acctype::Vendor;
                    AccNo := OtherCommitments."Vendor No.";
                    TransType := Transtype::" ";
                    BalAccType := Balacctype::"G/L Account";
                    BalAccNo := '';



                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, CopyStr((OtherCommitments.Description + ' - ' + LoanApps."Member Name"), 1, 50), OtherCommitments.Amount * -1, AccNo, Today, BalAccType,
                  BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, TopUp."Loan Top Up", '', '', 0, '', 0);




                    //Pass entries to balancing account
                    if LoanApps."All Posting through Savings Ac" = true then begin
                        LineNo := LineNo + 10000;
                        AccType := Acctype::Savings;
                        AccNo := LoanApps."Disbursement Account No";
                        TransType := Transtype::" ";
                        BalAccType := Balacctype::"G/L Account";
                        BalAccNo := '';


                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, CopyStr(('External Loan Cleared' + OtherCommitments."Vendor Name"), 1, 50), OtherCommitments.Amount, AccNo, Today, BalAccType,
                      BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, TopUp."Loan Top Up", '', '', 0, '', 0);

                    end;
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
                            if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                Amt := (/*LoanApps."Loans - Deposit Purchase"*/OtherCommitments.Amount * (PCharges.Percentage / 100))
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
                                                if (OtherCommitments.Amount >= TariffDetails."Lower Limit") and (OtherCommitments.Amount <= TariffDetails."Upper Limit") then begin
                                                    if TariffDetails."Use Percentage" = true then begin
                                                        Amt := OtherCommitments.Amount * TariffDetails.Percentage * 0.01;
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
                            if ExcemptCharges = true then
                                Amt := 0;



                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                          BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);
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

                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, CopyStr((PCharges."Charge Description" + '-Excise Duty'), 1, 50), Amt, AccNo, Today, BalAccType,
                                BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                            end;

                        until PCharges.Next = 0;
                    end;
                until OtherCommitments.Next = 0;
            end;


            //Asset Finance Deduction
            TotalAssetFin := 0;
            NetToVendor := 0;
            AssetFinanceLoan.Reset;
            AssetFinanceLoan.SetRange(AssetFinanceLoan."Loan No.", LoanApps."Loan No.");
            if AssetFinanceLoan.Find('-') then begin
                repeat
                    Temp.TestField(Temp."Bankers Cheque Account");
                    PCharges.Reset;
                    PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
                    PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"Asset Finance");
                    if PCharges.Find('-') then begin
                        repeat
                            if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                Amt := AssetFinanceLoan.Amount - (AssetFinanceLoan.Amount / (1 + PCharges.Percentage / 100));
                        until PCharges.Next = 0;
                    end;


                    TotalAssetFin := TotalAssetFin + TopUp."Principle Top Up" + TopUp."Interest Top Up";
                    LineNo := LineNo + 10000;
                    AccType := Acctype::Vendor;
                    AccNo := AssetFinanceLoan."Vendor No.";
                    TransType := Transtype::" ";
                    BalAccType := Balacctype::"G/L Account";
                    BalAccNo := '';
                    NetToVendor := (AssetFinanceLoan.Amount - Amt);



                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, CopyStr((AssetFinanceLoan.Description + ' - ' + LoanApps."Member Name"), 1, 50), NetToVendor * -1, AccNo, Today, BalAccType,
                  BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, TopUp."Loan Top Up", '', '', 0, '', 0);




                    //Pass entries to balancing account
                    if LoanApps."All Posting through Savings Ac" = true then begin
                        LineNo := LineNo + 10000;
                        AccType := Acctype::Savings;
                        AccNo := LoanApps."Disbursement Account No";
                        TransType := Transtype::" ";
                        BalAccType := Balacctype::"G/L Account";
                        BalAccNo := '';


                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, CopyStr(('Asset Finance Deduction' + AssetFinanceLoan."Vendor Name"), 1, 50), NetToVendor, AccNo, Today, BalAccType,
                      BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, TopUp."Loan Top Up", '', '', 0, '', 0);

                    end;
                    PCharges.Reset;
                    PCharges.SetRange(PCharges."Product Code", LoanApps."Loan Product Type");
                    PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"Asset Finance");
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
                            if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                                Amt := AssetFinanceLoan.Amount - (AssetFinanceLoan.Amount / (1 + PCharges.Percentage / 100))
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
                                                if (AssetFinanceLoan.Amount >= TariffDetails."Lower Limit") and (AssetFinanceLoan.Amount <= TariffDetails."Upper Limit") then begin
                                                    if TariffDetails."Use Percentage" = true then begin
                                                        Amt := AssetFinanceLoan.Amount * TariffDetails.Percentage * 0.01;
                                                    end else begin
                                                        Amt := TariffDetails."Charge Amount";
                                                    end;
                                                end;
                                            until TariffDetails.Next = 0;
                                        end;
                                    end;


                            if (Amt) < PCharges.Minimum then
                                Amt := PCharges.Minimum;

                            if (Amt) > PCharges.Maximum then
                                Amt := PCharges.Maximum;

                            Amt := (Amt) * -1;
                            if ExcemptCharges = true then
                                Amt := 0;


                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, PCharges."Charge Description", Amt, AccNo, Today, BalAccType,
                          BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                            //If excise duty involved
                            if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin
                                GenSetup.TestField("Excise Duty G/L");
                                GenSetup.TestField("Excise Duty (%)");
                                LineNo := LineNo + 10000;
                                AccType := Acctype::"G/L Account";
                                AccNo := GenSetup."Excise Duty G/L";
                                TransType := Transtype::" ";
                                BalAccType := Balacctype::"G/L Account";
                                BalAccNo := PCharges."Charges G_L Account";
                                Amt := Amt * GenSetup."Excise Duty (%)" * 0.01;

                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, CopyStr((PCharges."Charge Description" + '-Excise Duty'), 1, 50), Amt, AccNo, Today, BalAccType,
                                BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);


                            end;

                        until PCharges.Next = 0;
                    end;
                until AssetFinanceLoan.Next = 0;
            end;







            //Recover discounting
            //IF LoanApps."Discounted Amount">0 THEN BEGIN
            Loans2.Reset;
            Loans2.SetRange(Loans2."Discounted Loan No.", LoanApps."Loan No.");
            if Loans2.Find('-') then begin
                repeat
                    Loans2.CalcFields(Loans2."Outstanding Interest", Loans2."Outstanding Balance");
                    Amt := 0;
                    //Loan repayment

                    LineNo := LineNo + 10000;
                    AccType := Acctype::Credit;
                    AccNo := Loans2."Loan Account";
                    TransType := Transtype::Repayment;
                    BalAccType := Balacctype::"G/L Account";
                    BalAccNo := '';
                    Amt := Loans2."Outstanding Balance";


                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Disc. Paid' + LoanApps."Loan No.", -Amt, AccNo, Today, BalAccType,
                  BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, Loans2."Loan No.", '', '', 0, '', 0);

                    Amt := 0;

                    //Interest

                    LineNo := LineNo + 10000;
                    AccType := Acctype::Credit;
                    AccNo := Loans2."Loan Account";
                    TransType := Transtype::"Interest Paid";
                    BalAccType := Balacctype::"G/L Account";
                    BalAccNo := '';
                    Amt := Loans2."Outstanding Interest";
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Disc. Interest' + LoanApps."Loan No.", -Amt, AccNo, Today, BalAccType,
                    BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, Loans2."Loan No.", '', '', 0, '', 0);





                    //Deduct from savings


                    if LoanApps."All Posting through Savings Ac" = true then begin


                        LineNo := LineNo + 10000;
                        AccType := Acctype::Savings;
                        AccNo := LoanApps."Disbursement Account No";
                        TransType := Transtype::" ";
                        BalAccType := Balacctype::"G/L Account";
                        BalAccNo := '';
                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Total Disc.Offset' + LoanApps."Loan No.", (Loans2."Outstanding Balance" + Loans2."Outstanding Interest"), AccNo, Today, BalAccType,
                        BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                    end;
                until Loans2.Next = 0;

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
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Interest Due' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                    BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);

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
                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Interest Due' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                        BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);

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
                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Bills' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                    BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);

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
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, 'Bills' + LoanApps."Loan No.", Amt, AccNo, Today, BalAccType,
                            BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                        end;
                    end;

            end;
            GenSetup.Get;
            Members.Get(LoanApps."Member No.");
            if GenSetup."Disable Loan SMS" = false then
                SendSMS.SendSms(Sourcetype::"Loan Posted", Members."Mobile Phone No", 'Your Loan of Kes ' + Format(LoanApps."Approved Amount") + ' ' + 'has been credited to your FOSA account. ' +
                                GenSetup."Loan SMS Suffix", LoanApps."Loan No.", LoanApps."Disbursement Account No", false);


            //Update Monthly contribution based on the product

            //contractual shares

            //Check if tiered
            if ProdFac."Minimum Deposit Tiered" then begin
                SavAcc.Reset;
                SavAcc.SetRange("Member No.", LoanApps."Member No.");
                SavAcc.SetRange("Product Category", SavAcc."product category"::"Deposit Contribution");
                if SavAcc.Find('-') then begin
                    ProdFac.TestField("Minimum Deposit Tiered Code");
                    TariffDetails.Reset;
                    TariffDetails.SetRange(TariffDetails.Code, ProdFac."Minimum Deposit Tiered Code");
                    if TariffDetails.Find('-') then begin
                        repeat
                            if (LoanApps."Approved Amount" >= TariffDetails."Lower Limit") and (LoanApps."Approved Amount" <= TariffDetails."Upper Limit") then begin
                                if TariffDetails."Use Percentage" = true then begin
                                    NewContr := LoanApps."Approved Amount" * TariffDetails.Percentage * 0.01;
                                end else begin
                                    NewContr := TariffDetails."Charge Amount";
                                end;
                            end;
                        until TariffDetails.Next = 0;
                    end;
                end;
                //Difference
                ///Advice
                if NewContr > SavAcc."Monthly Contribution" then begin
                    OldAmount := SavAcc."Monthly Contribution";
                    if NewContr < ProdFac."Minimum Deposit Contribution" then
                        NewContr := ProdFac."Minimum Deposit Contribution";
                    if SavAcc."Monthly Contribution" < NewContr then
                        SavAcc."Monthly Contribution" := NewContr;
                    if (LoanApps."Recovery Mode" = LoanApps."recovery mode"::Checkoff) then
                        AdviceShares(SavAcc, LoanApps."Loans - Deposit Purchase", NewContr);
                    //SavAcc.VALIDATE("Monthly Contribution");
                    SavAcc.Modify;
                end;
            end;
        end else begin
            //Not tiered
            SavAcc.Reset;
            SavAcc.SetRange("Member No.", LoanApps."Member No.");
            SavAcc.SetRange("Product Category", SavAcc."product category"::"Deposit Contribution");
            if SavAcc.Find('-') then begin
                if ProdFac."Minimum Dep. Contribution %" > 0 then begin
                    if ProdFac."Minimum Dep. Contribution %" * LoanApps."Approved Amount" * 0.01 > ProdFac."Maximum Deposit Contribution" then
                        NewContr := ProdFac."Maximum Deposit Contribution"
                    else
                        NewContr := ProdFac."Minimum Dep. Contribution %" * LoanApps."Approved Amount" * 0.01;
                end;
            end;
            //Difference
            //Advice
            if NewContr < ProdFac."Minimum Deposit Contribution" then begin
                OldAmount := SavAcc."Monthly Contribution";
                NewContr := ProdFac."Minimum Deposit Contribution";
                if SavAcc."Monthly Contribution" < NewContr then
                    SavAcc."Monthly Contribution" := NewContr;
                if (LoanApps."Recovery Mode" = LoanApps."recovery mode"::Checkoff) then
                    AdviceShares(SavAcc, LoanApps."Loans - Deposit Purchase", NewContr);
                //SavAcc.VALIDATE("Monthly Contribution");
                SavAcc.Modify;
            end;





        end;
        //MESSAGE('New Contr %1',NewContr);
        //END;



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
                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, TransactionCharges.Description + LoanApps."Disbursement Account No", Amt, AccNo, Today, BalAccType,
                      BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);
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

                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, LoanNo, CopyStr((TransactionCharges.Description + LoanApps."Disbursement Account No" + '-Excise Duty'), 1, 50), Amt, AccNo, Today, BalAccType,
                            BalAccNo, LoanApps."Loan No.", Dim1, Dim2, TransType, LoanApps."Loan No.", '', '', 0, '', 0);
                        end;
                    until TransactionCharges.Next = 0;
                end;
            end;
        end;

        //block account if

        if GenSetup."Block Account for Ext.  Loan" = true then begin


            OtherCommitments.Reset;
            OtherCommitments.SetRange(OtherCommitments."Loan No.", LoanApps."Loan No.");
            if OtherCommitments.Find('-') then begin
                if SavAcc.Get(LoanApps."Disbursement Account No") then begin

                    //******Create a Lien for One Month Repayment.

                    CashierTransactions.Init;
                    CashierTransactions.No := '';
                    CashierTransactions."Account No" := SavAcc."No.";
                    CashierTransactions."Account Name" := SavAcc.Name;
                    CashierTransactions.Amount := LoanApps.Repayment;
                    CashierTransactions.Remarks := PadStr(LoanApps."Loan Product Type Name", 50);
                    CashierTransactions."Transaction Date" := Today;
                    CashierTransactions."Transaction Time" := Time;
                    CashierTransactions.Posted := true;
                    CashierTransactions."Cheque Status" := CashierTransactions."cheque status"::Pending;
                    CashierTransactions."Posted By" := UserId;
                    CashierTransactions.Cashier := UserId;
                    CashierTransactions.Type := CashierTransactions.Type::Lien;
                    CashierTransactions."Global Dimension 1 Code" := Dim1;
                    CashierTransactions."Global Dimension 2 Code" := Dim2;
                    CashierTransactions."ID No" := SavAcc."ID No.";
                    CashierTransactions."Responsibility Center" := LoanApps."Responsibility Centre";
                    CashierTransactions."Transaction Description" := LoanApps."Loan No.";
                    CashierTransactions."Employer Code" := SavAcc."Employer Code";
                    CashierTransactions.Insert(true);
                    //******Create a Lien for One Month Repayment.

                    SavAcc.Status := SavAcc.Status::Frozen;
                    SavAcc.Blocked := SavAcc.Blocked::All;
                    SavAcc."Status Change Reason" := 'Awaiting Bank Clearance';
                    SavAcc.Validate(Status);
                    //SavAcc.MODIFY;

                end;
            end;

        end;


        //UNTIL BatchLines.NEXT=0;

        //Post New
        JournalPosting.CompletePosting(Jtemplate, JBatch);//remove

        /*
        GenJournalLine.RESET;
        GenJournalLine.SETRANGE("Journal Template Name",Jtemplate);
        GenJournalLine.SETRANGE("Journal Batch Name",JBatch);
        IF GenJournalLine.FIND('-') THEN BEGIN
        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJournalLine);
        END;
        */

        //Post New
        Post := false;
        Post := JournalPostingSucc.PostedSuccessfully;



        SavAcc.Modify;
        Commit;
        if Post = true then begin
            LoanApps.Reset;
            LoanApps.SetRange("Loan No.", LoanNo);
            if LoanApps.Find('-') then begin
                repeat
                    LoanApps.Advice := true;
                    LoanApps."Advice Type" := LoanApps."advice type"::"Fresh Loan";
                    LoanApps."Disbursement Date" := Today;
                    LoanApps.Posted := true;
                    //**
                    TempLoans.Reset;
                    TempLoans.SetRange("Loan No.", LoanApps."Loan No.");
                    if not TempLoans.Find('-') then begin
                        TempLoans.TransferFields(LoanApps, true);
                        TempLoans.Insert;
                    end;
                    LoanApps."Disbursement Date" := Today;
                    LoanApps.Validate("Disbursement Date");
                    LoanApps."Posted By" := UserId;
                    LoanApps.Modify;
                    Commit;
                    AdviceLoan(LoanApps."Loan No.", false);
                until LoanApps.Next = 0;
            end;

        end;

    end;
}
