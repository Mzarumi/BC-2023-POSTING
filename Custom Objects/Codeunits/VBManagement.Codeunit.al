#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52185498 "VB Management"
{

    trigger OnRun()
    begin
        RegerateSALSchedule;
    end;


    procedure PostLoan(LoanRec: Record 52185729) Posted: Boolean
    var
        GenJnlLn: Record "Gen. Journal Line";
        GLEntry: Record "G/L Entry";
        vbSetup: Record 52185730;
        batchName: Code[10];
        memb: Record 52185873;
        JBatch: Record "Gen. Journal Batch";
        Product: Record 52185690;
        vend: Record Vendor;
        LineNo: Integer;
        RevenueAmount: Decimal;
    begin

        Error('Posting not allowed');
        /*
        //Generate Schedule
        GenerateSchedule(LoanRec);
        vbSetup.GET(USERID);
        Product.GET(LoanRec."Loan Product Type");
        batchName:='L'+FORMAT(DATE2DMY(TODAY,1))+'-'+FORMAT(DATE2DMY(TODAY,2))+'-'+FORMAT(DATE2DMY(TODAY,3));
        LineNo:=0;
        //create Batch
        IF NOT JBatch.GET(vbSetup."Journal Template Loan",batchName) THEN BEGIN
         JBatch.INIT;
         JBatch."Journal Template Name":=vbSetup."Journal Template Loan";
         JBatch.Name :=batchName;
         JBatch.Status:=JBatch.Status::Approved;
         JBatch.INSERT;
        END;
        
        //Delete existig entries
        GenJnlLn.RESET;
        GenJnlLn.SETRANGE("Journal Template Name",vbSetup."Journal Template Loan");
        GenJnlLn.SETRANGE("Journal Batch Name",batchName);
        GenJnlLn.DELETEALL;
        
        //debit member
        GenJnlLn.INIT;
        GenJnlLn."Journal Template Name":=vbSetup."Journal Template Loan";
        GenJnlLn."Journal Batch Name":=batchName;
        LineNo+=10000;
        GenJnlLn."Line No.":=LineNo;
        GenJnlLn."Account Type":=GenJnlLn."Account Type"::Member;
        GenJnlLn."Account No.":=LoanRec."Client Code";
        GenJnlLn.VALIDATE("Account No.");
        GenJnlLn."Posting Date":=TODAY;
        GenJnlLn."Document No.":=LoanRec."Loan No.";
        GenJnlLn.Description:='Virtual Loan Disbursement '+LoanRec."Loan No.";
        GenJnlLn.Amount:=LoanRec."Approved Amount";
        GenJnlLn."Shortcut Dimension 1 Code":='';
        GenJnlLn."Transaction Type":=GenJnlLn."Transaction Type"::Loan;
        GenJnlLn."Loan No":=LoanRec."Loan No.";
        GenJnlLn."Loan Product Type":=LoanRec."Loan Product Type";
        IF GenJnlLn.Amount<>0 THEN
        GenJnlLn.INSERT;
        
        //credit vendor
        GenJnlLn.INIT;
        GenJnlLn."Journal Template Name":=vbSetup."Journal Template Loan";
        GenJnlLn."Journal Batch Name":=batchName;
        LineNo+=10000;
        GenJnlLn."Line No.":=LineNo;
        GenJnlLn."Posting Date":=TODAY;
        GenJnlLn."Document No.":=LoanRec."Loan No.";
        //get FOSA Account - Credit FOSA Account
        GenJnlLn."Account Type":=GenJnlLn."Account Type"::Vendor;
        GenJnlLn."Account No.":=LoanRec."Client Code";
        GenJnlLn.VALIDATE("Account No.");
        GenJnlLn.Description:='Virtual Loan Disbursement '+LoanRec."Loan No.";
        GenJnlLn.Amount:=LoanRec."Approved Amount"*-1;
        GenJnlLn."Shortcut Dimension 1 Code":='';
        GenJnlLn."Transaction Type":=GenJnlLn."Transaction Type"::Loan;
        GenJnlLn."Loan No":=LoanRec."Loan No.";
        GenJnlLn."Loan Product Type":=LoanRec."Loan Product Type";
        IF GenJnlLn.Amount<>0 THEN
        GenJnlLn.INSERT;
        
        //Dr vendorInterest
        GenJnlLn.INIT;
        GenJnlLn."Journal Template Name":=vbSetup."Journal Template Loan";
        GenJnlLn."Journal Batch Name":=batchName;
        LineNo+=10000;
        GenJnlLn."Line No.":=LineNo;
        GenJnlLn."Posting Date":=TODAY;
        GenJnlLn."Document No.":=LoanRec."Loan No.";
        //get FOSA Account - Credit FOSA Account
        GenJnlLn."Account Type":=GenJnlLn."Account Type"::Vendor;
        GenJnlLn."Account No.":=LoanRec."Client Code";
        GenJnlLn.VALIDATE("Account No.");
        GenJnlLn.Description:='Virtual Loan Disbursement '+LoanRec."Loan No.";
        GenJnlLn.Amount:=LoanRec.Interest;
        GenJnlLn."Shortcut Dimension 1 Code":='';
        GenJnlLn."Loan No":=LoanRec."Loan No.";
        GenJnlLn."Loan Product Type":=LoanRec."Loan Product Type";
        IF GenJnlLn.Amount<>0 THEN
        GenJnlLn.INSERT;
        
        
        //Cr Revenue Interest
        GenJnlLn.INIT;
        GenJnlLn."Journal Template Name":=vbSetup."Journal Template Loan";
        GenJnlLn."Journal Batch Name":=batchName;
        LineNo+=10000;
        GenJnlLn."Line No.":=LineNo;
        GenJnlLn."Account Type":=GenJnlLn."Account Type"::"G/L Account";
        GenJnlLn."Account No.":=Product."Loan Interest Account";
        GenJnlLn."Posting Date":=TODAY;
        GenJnlLn."Document No.":=LoanRec."Loan No.";
        GenJnlLn.Description:='Interest Revenue on Loan '+LoanRec."Loan No.";
        RevenueAmount:= LoanRec.Interest*Product."Service Tarrif Percentage";
        GenJnlLn.Amount:=RevenueAmount*-1;
        GenJnlLn."Shortcut Dimension 1 Code":='';
        GenJnlLn."Loan No":=LoanRec."Loan No.";
        GenJnlLn."Loan Product Type":=LoanRec."Loan Product Type";
        IF GenJnlLn.Amount<>0 THEN
        GenJnlLn.INSERT;
        
        //Cr Service Interest
        GenJnlLn.INIT;
        GenJnlLn."Journal Template Name":=vbSetup."Journal Template Loan";
        GenJnlLn."Journal Batch Name":=batchName;
        LineNo+=1000;
        GenJnlLn."Line No.":=LineNo;
        GenJnlLn."Account Type":=GenJnlLn."Account Type"::"G/L Account";
        GenJnlLn."Account No.":=Product."Revenue Share Account";
        GenJnlLn."Posting Date":=TODAY;
        GenJnlLn."Document No.":=LoanRec."Loan No.";
        GenJnlLn.Description:='CORETEC Interest Share ';
        GenJnlLn.Amount:=(LoanRec.Interest-RevenueAmount)*-1;
        GenJnlLn."Shortcut Dimension 1 Code":='';
        GenJnlLn."Loan No":=LoanRec."Loan No.";
        GenJnlLn."Loan Product Type":=LoanRec."Loan Product Type";
        IF GenJnlLn.Amount<>0 THEN
        GenJnlLn.INSERT;
        
        
        GenJnlLn.RESET;
        GenJnlLn.SETRANGE(GenJnlLn."Journal Template Name",vbSetup."Journal Template Loan");
        GenJnlLn.SETRANGE(GenJnlLn."Journal Batch Name",batchName);
        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnlLn);
        
        GLEntry.RESET;
        GLEntry.SETCURRENTKEY("Document No.","Posting Date");
        GLEntry.SETRANGE("Document No.",LoanRec."Loan No.");
        GLEntry.SETRANGE("Journal Batch Name",batchName);
        IF GLEntry.FINDSET THEN
        */
        Posted := true;

    end;


    procedure GenerateSchedule(LoanRec: Record 52185729)
    var
        ScheduleCode: Code[20];
        RSchedule: Record 52185738;
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
        GrPrinciple: Integer;
        GrInterest: Integer;
        QPrinciple: Decimal;
        QCounter: Integer;
        InPeriod: DateFormula;
        InitialGraceInt: Integer;
        InitialInstal: Decimal;
        RepayCode: Code[40];
    begin
        /*
        IF LoanRec."Repayment Frequency"=LoanRec."Repayment Frequency"::Daily THEN
        EVALUATE(InPeriod,'1D')
        ELSE IF LoanRec."Repayment Frequency"=LoanRec."Repayment Frequency"::Weekly THEN
        EVALUATE(InPeriod,'1W')
        ELSE IF LoanRec."Repayment Frequency"=LoanRec."Repayment Frequency"::Monthly THEN
        EVALUATE(InPeriod,'1M')
        ELSE IF LoanRec."Repayment Frequency"=LoanRec."Repayment Frequency"::Quarterly THEN
        EVALUATE(InPeriod,'1Q');
        
        QCounter:=0;
        QCounter:=3;
        GrPrinciple:=LoanRec."Grace Period - Principle (M)";
        GrInterest:=LoanRec."Grace Period - Interest (M)";
        InitialGraceInt:=LoanRec."Grace Period - Interest (M)";
        
        //LoanRec.TESTFIELD("Loan Disbursement Date");
        LoanRec.TESTFIELD("Repayment Start Date");
        
        //delete prior schedule
        RSchedule.RESET;
        RSchedule.SETRANGE(RSchedule."Loan No.",LoanRec."Loan No.");
        RSchedule.DELETEALL;
        
        LoanAmount:=LoanRec."Approved Amount";
        InterestRate:=LoanRec.Interest;
        RepayPeriod:=LoanRec.Installments;
        InitialInstal:=LoanRec.Installments+LoanRec."Grace Period - Principle (M)";
        LBalance:=LoanRec."Approved Amount";
        RunDate:=LoanRec."Repayment Start Date";
        
        InstalNo:=0;
        
        //Repayment Frequency
        IF LoanRec."Repayment Frequency"=LoanRec."Repayment Frequency"::Daily THEN
        RunDate:=CALCDATE('-1D',RunDate)
        ELSE IF LoanRec."Repayment Frequency"=LoanRec."Repayment Frequency"::Weekly THEN
        RunDate:=CALCDATE('-1W',RunDate)
        ELSE IF LoanRec."Repayment Frequency"=LoanRec."Repayment Frequency"::Monthly THEN
        RunDate:=CALCDATE('-1M',RunDate)
        ELSE IF LoanRec."Repayment Frequency"=LoanRec."Repayment Frequency"::Quaterly THEN
        RunDate:=CALCDATE('-1Q',RunDate);
        
        REPEAT
          InstalNo:=InstalNo+1;
        
          //Repayment Frequency
          IF LoanRec."Repayment Frequency"=LoanRec."Repayment Frequency"::Daily THEN
          RunDate:=CALCDATE('1D',RunDate)
          ELSE IF LoanRec."Repayment Frequency"=LoanRec."Repayment Frequency"::Weekly THEN
          RunDate:=CALCDATE('1W',RunDate)
          ELSE IF LoanRec."Repayment Frequency"=LoanRec."Repayment Frequency"::Monthly THEN
          RunDate:=CALCDATE('1M',RunDate)
          ELSE IF LoanRec."Repayment Frequency"=LoanRec."Repayment Frequency"::Quaterly THEN
          RunDate:=CALCDATE('1Q',RunDate);
        
          IF LoanRec."Repayment Method"=LoanRec."Repayment Method"::Amortised THEN BEGIN
            LoanRec.TESTFIELD(Interest);
            LoanRec.TESTFIELD(Installments);
            TotalMRepay:=ROUND((InterestRate/12/100) / (1 - POWER((1 +(InterestRate/12/100)),- (RepayPeriod))) * (LoanAmount),0.0001,'>');
            LInterest:=ROUND(LBalance / 100 / 12 * InterestRate,0.0001,'>');
            LPrincipal:=TotalMRepay-LInterest;
          END;
        
          IF LoanRec."Repayment Method"=LoanRec."Repayment Method"::"Straight Line" THEN BEGIN
            LoanRec.TESTFIELD(Interest);
            LoanRec.TESTFIELD(Installments);
            LPrincipal:=LoanAmount/RepayPeriod;
            LInterest:=(InterestRate/12/100)*LoanAmount;
          END;
        
          IF LoanRec."Repayment Method"=LoanRec."Repayment Method"::"Reducing Balance" THEN BEGIN
            LoanRec.TESTFIELD(Interest);
            LoanRec.TESTFIELD(Installments);
            LPrincipal:=LoanAmount/RepayPeriod;
            LInterest:=(InterestRate/12/100)*LBalance;
          END;
        
          IF LoanRec."Repayment Method"=LoanRec."Repayment Method"::Constants THEN BEGIN
            LoanRec.TESTFIELD(Repayment);
            IF LBalance < LoanRec.Repayment THEN
            LPrincipal:=LBalance
            ELSE
            LPrincipal:=LoanRec.Repayment;
            LInterest:=LoanRec.Interest;
          END;
        
          IF GrPrinciple > 0 THEN
          LPrincipal:=0;
        
          LBalance:=LBalance-LPrincipal;
        
          IF GrInterest > 0 THEN
          LInterest:=0;
        
          GrPrinciple:=GrPrinciple-1;
          GrInterest:=GrInterest-1;
        
          EVALUATE(RepayCode,FORMAT(InstalNo));
        
          RSchedule.INIT;
          RSchedule."Repayment Code":=RepayCode;
          RSchedule."Loan No.":=LoanRec."Loan No.";
          RSchedule."Loan Amount":=LoanAmount;
          RSchedule."Instalment No":=InstalNo;
          RSchedule."Repayment Date":=RunDate;
          RSchedule."Member No.":=LoanRec."Client Code";
          RSchedule."Loan Category":=LoanRec."Loan Product Type";
          RSchedule."Monthly Repayment":=LInterest + LPrincipal;
          RSchedule."Monthly Interest":=LInterest;
          RSchedule."Principal Repayment":=LPrincipal;
          RSchedule.INSERT;
        UNTIL LBalance < 1
        */

    end;


    procedure RegerateSALSchedule()
    var
        LoanRec: Record 52185729;
        Product: Record 52185690;
    begin
        //,'FLEX','GOLDEN' %2|%3
        /*
        LoanRec.RESET;
        LoanRec.SETRANGE(Posted,TRUE);
        LoanRec.SETFILTER("Approved Amount",'>%1',0);
        LoanRec.SETFILTER("Repayment Start Date",'<>%1',0D);
        LoanRec.SETFILTER("Loan Product Type",'=%1|%2|%3','GOLDEN','SAL ADV','FLEX');
        IF LoanRec.FIND('-') THEN
        REPEAT
         IF Product.GET(LoanRec."Loan Product Type") THEN BEGIN
          LoanRec.Interest:=Product."Interest rate";
          LoanRec.MODIFY();
         END;
         GenerateSchedule(LoanRec);
        UNTIL LoanRec.NEXT=0;
        */

    end;
}
