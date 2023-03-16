// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52186018 "Periodic Standing Orders"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Periodic Standing Orders.rdlc';
//     ProcessingOnly = false;

//     dataset
//     {
//         dataitem("Standing Order Header";"Standing Order Header")
//         {
//             //DataItemTableView = where(Status = const(Approved), "Income Type" = const(Periodic), "Allow Partial Deduction" = const(Yes));
//             RequestFilterFields = "No.";
//             column(ReportForNavId_1; 1)
//             {
//             }

//             trigger OnAfterGetRecord()
//             var
//                 ProcessingCharge: Decimal;
//                 ExciseDuty: Decimal;
//                 //SaccoTrans: Codeunit 52185456;
//                 JTemplate: Code[50];
//                 JBatch: Code[50];
//                 DocNo: Code[50];
//                 PDate: Date;
//                 LineNo: Integer;
//                 BalAccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
//                 AccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
//                 TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
//                 Dim1: Code[20];
//                 Dim2: Code[20];
//                 SystemCreated: Boolean;
//                 TransAmt: Decimal;
//                 LoanNo: Code[50];
//                 ExtDoc: Code[50];
//                 AccNo: Code[50];
//                 Description: Text[50];
//                 StandingOrderLines: Record 52185718;
//                 RunBal: Decimal;
//                 Loans: Record 52185729;
//                 OutstandingBalance: Decimal;
//                 OutstandingInterest: Decimal;
//                 OutstandingBills: Decimal;
//                 TotalDeducted: Decimal;
//                 ProcFeeGlAccount: Code[30];
//                 ExciseDutyGL: Code[30];
//                 FoundFullPayment: Boolean;
//                 NoSetup: Record 52185781;
//                 //NoSeriesMgt: Codeunit NoSeriesManagement;
//                 STRNo: Code[50];
//                 Members: Record "Members";
//                 SavingsAccounts: Record 52185730;
//                 ProductFactory: Record 52185690;
//                 AmountDeducted: Decimal;
//                 AmountToDeductPerLine: Decimal;
//             begin
//                 LastEntry := 0;
//                 RunSTO := true;
//                 if (Today < "Standing Order Header"."Effective/Start Date") then
//                     RunSTO := false;
//                 if ("Standing Order Header"."Next Run Date" <> 0D) and ("Standing Order Header"."Next Run Date" > Today) then
//                     RunSTO := false;

//                 if RunSTO then begin
//                     //  RunSTO := FALSE;

//                     //  StandingOrderRegister.RESET;
//                     //  StandingOrderRegister.SETCURRENTKEY("Date Processed");
//                     //  StandingOrderRegister.ASCENDING(FALSE);
//                     //  StandingOrderRegister.SETRANGE("Standing Order No.","Standing Order Header"."No.");
//                     //  IF StandingOrderRegister.FINDFIRST THEN BEGIN
//                     //    IF (StandingOrderRegister."Deduction Status" = StandingOrderRegister."Deduction Status"::"Partial Deduction") OR
//                     //       (StandingOrderRegister."Deduction Status" = StandingOrderRegister."Deduction Status"::Failed) THEN
//                     //      RunSTO := TRUE;
//                     //
//                     //  END ELSE RunSTO := TRUE;

//                     StandingOrderLines.Reset;
//                     StandingOrderLines.SetRange("Document No.", "Standing Order Header"."No.");
//                     if StandingOrderLines.FindFirst then begin
//                         StandingOrderLines.CalcSums("Remaining Amount");
//                         AmountToDeduct := StandingOrderLines."Remaining Amount";
//                     end;

//                     if AmountToDeduct > 0 then begin
//                         //    StandingOrderRegister.RESET;
//                         //    StandingOrderRegister.SETCURRENTKEY("Date Processed");
//                         //    StandingOrderRegister.ASCENDING(FALSE);
//                         //    StandingOrderRegister.SETRANGE("Standing Order No.","Standing Order Header"."No.");
//                         //    IF StandingOrderRegister.FINDFIRST THEN BEGIN
//                         //      REPEAT
//                         //        IF StandingOrderRegister."Deduction Status" = StandingOrderRegister."Deduction Status"::"Partial Deduction" THEN
//                         //          TotalAmountDeductedWithinPeriod += StandingOrderRegister."Amount Deducted";
//                         //        IF StandingOrderRegister."Deduction Status" = StandingOrderRegister."Deduction Status"::Successfull THEN
//                         //          FoundFullPayment := TRUE;
//                         //      UNTIL (StandingOrderRegister.NEXT = 0) OR (FoundFullPayment = TRUE);
//                         //    END;

//                         //    "Standing Order Header".CALCFIELDS("Allocated Amount");
//                         //
//                         //    STOAllocatedAmount := "Standing Order Header"."Allocated Amount";

//                         AccountBal := SkyMbanking.GetAccountBalance("Standing Order Header"."Source Account No.");
//                         TotalCharges := GetChargeAmount(AmountToDeduct, "Standing Order Header", ProcessingCharge, ExciseDuty, ProcFeeGlAccount, ExciseDutyGL);
//                         if TotalCharges + 120 < AccountBal then
//                             AccountBal -= TotalCharges
//                         else begin
//                             TotalCharges := 0;
//                             ExciseDuty := 0;
//                             ProcessingCharge := 0;
//                             AccountBal := 0;
//                         end;

//                         if AccountBal <= 0 then begin
//                             TotalCharges := 0;
//                             ExciseDuty := 0;
//                             ProcessingCharge := 0;
//                             AccountBal := 0;
//                         end;

//                         //    AmountToDeduct := STOAllocatedAmount-TotalAmountDeductedWithinPeriod;

//                         if AmountToDeduct > AccountBal then
//                             AmountToDeduct := AccountBal;


//                         RunBal := AmountToDeduct;
//                         if RunBal <= 0 then RunBal := 0;

//                         //initiate the journal
//                         UserSetup.Reset;
//                         UserSetup.SetRange("User ID", 'DESKTOP-2F60KII\ADMIN');
//                         if UserSetup.FindFirst then begin
//                             Dim1 := UserSetup."Global Dimension 1 Code";
//                             Dim2 := UserSetup."Global Dimension 2 Code";
//                         end;

//                         if BankingUserTemplate.Get('DESKTOP-2F60KII\ADMIN') then begin
//                             JTemplate := BankingUserTemplate."Cashier Journal Template";
//                             JBatch := BankingUserTemplate."Cashier Journal Batch";
//                         end;

//                         SaccoTrans.InitJournal(JTemplate, JBatch);

//                         StandingOrderRegister.Reset;
//                         StandingOrderRegister.SetCurrentkey("Run Count");
//                         StandingOrderRegister.Ascending(false);
//                         StandingOrderRegister.SetRange("Standing Order No.", "Standing Order Header"."No.");
//                         if StandingOrderRegister.FindFirst then
//                             LastEntry := StandingOrderRegister."Run Count";

//                         DocNo := "Standing Order Header"."No." + '-PERIOD-' + Format(LastEntry + 1);
//                         ExtDoc := DocNo;
//                         PDate := Today;
//                         SystemCreated := true;

//                         /*-------------PROCESSING FEE AND EXCISE DUTY-------------------------------*/
//                         Description := 'STO:-' + "Standing Order Header"."No." + ' Processing Fee';
//                         Description := CopyStr(Description, 1, 50);

//                         AccType := Acctype::"G/L Account";
//                         AccNo := ProcFeeGlAccount;
//                         TransType := Transtype::" ";
//                         SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, AccType, AccNo, CopyStr(Description, 1, 50), Balaccounttype::"G/L Account",
//                                             '', -ProcessingCharge, ExtDoc, '', TransType, Dim1, Dim2, SystemCreated);

//                         AccType := Acctype::Savings;
//                         AccNo := "Standing Order Header"."Source Account No.";
//                         TransType := Transtype::" ";
//                         SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, AccType, AccNo, CopyStr(Description, 1, 50), Balaccounttype::"G/L Account",
//                                             '', ProcessingCharge, ExtDoc, '', TransType, Dim1, Dim2, SystemCreated);


//                         Description := "Standing Order Header"."No." + ' Excise Duty';

//                         AccType := Acctype::"G/L Account";
//                         AccNo := ExciseDutyGL;
//                         TransType := Transtype::" ";
//                         SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, AccType, AccNo, CopyStr(Description, 1, 50), Balaccounttype::"G/L Account",
//                                             '', -ExciseDuty, ExtDoc, '', TransType, Dim1, Dim2, SystemCreated);

//                         AccType := Acctype::Savings;
//                         AccNo := "Standing Order Header"."Source Account No.";
//                         TransType := Transtype::" ";
//                         SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, AccType, AccNo, CopyStr(Description, 1, 50), Balaccounttype::"G/L Account",
//                                             '', ExciseDuty, ExtDoc, '', TransType, Dim1, Dim2, SystemCreated);

//                         /*-------------PROCESSING FEE AND EXCISE DUTY-------------------------------*/


//                         /*-------------INSERT JOURNAL STO LINES-------------------------------*/
//                         AmountDeducted := 0;
//                         AmountToDeductPerLine := 0;
//                         StandingOrderLines.Reset;
//                         StandingOrderLines.SetRange("Document No.", "Standing Order Header"."No.");
//                         StandingOrderLines.SetRange("Destination Account Type", StandingOrderLines."destination account type"::Credit);
//                         if StandingOrderLines.FindFirst then begin
//                             repeat
//                                 AmountToDeductPerLine := StandingOrderLines."Remaining Amount";

//                                 LoanNo := StandingOrderLines."Loan No.";
//                                 if Loans.Get(LoanNo) then begin
//                                     Loans.CalcFields("Outstanding Balance", "Outstanding Interest", "Outstanding Bills");
//                                     OutstandingInterest := Loans."Outstanding Interest";
//                                     if OutstandingInterest <= 0 then OutstandingInterest := 0;
//                                     OutstandingBalance := Loans."Outstanding Balance";
//                                     if OutstandingBalance <= 0 then OutstandingBalance := 0;
//                                 end;

//                                 AccType := Acctype::Credit;
//                                 AccNo := Loans."Loan Account";
//                                 Description := "Standing Order Header"."No." + '_LOAN:-' + StandingOrderLines."Loan No.";
//                                 TransType := Transtype::"Interest Paid";
//                                 TransAmt := OutstandingInterest;
//                                 if OutstandingInterest > RunBal then
//                                     TransAmt := RunBal;
//                                 SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, AccType, AccNo, CopyStr(Description, 1, 50), Balaccounttype::"G/L Account",
//                                                     '', -TransAmt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystemCreated);

//                                 AccType := Acctype::Savings;
//                                 AccNo := "Standing Order Header"."Source Account No.";
//                                 Description := "Standing Order Header"."No." + '_LOAN:-' + StandingOrderLines."Loan No.";
//                                 TransType := Transtype::" ";
//                                 SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, AccType, AccNo, CopyStr(Description, 1, 50), Balaccounttype::"G/L Account",
//                                                     '', TransAmt, ExtDoc, '', TransType, Dim1, Dim2, SystemCreated);


//                                 RunBal -= Abs(TransAmt);
//                                 TotalDeducted += Abs(TransAmt);
//                                 AmountDeducted := Abs(TransAmt);
//                                 AmountToDeductPerLine -= Abs(TransAmt);

//                                 AccType := Acctype::Credit;
//                                 AccNo := Loans."Loan Account";
//                                 Description := "Standing Order Header"."No." + '_LOAN:-' + StandingOrderLines."Loan No.";
//                                 TransType := Transtype::Repayment;
//                                 TransAmt := AmountToDeductPerLine;
//                                 if AmountToDeductPerLine > OutstandingBalance then
//                                     TransAmt := OutstandingBalance;
//                                 if TransAmt > RunBal then
//                                     TransAmt := RunBal;

//                                 SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, AccType, AccNo, CopyStr(Description, 1, 50), Balaccounttype::"G/L Account",
//                                                     '', -TransAmt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystemCreated);

//                                 AccType := Acctype::Savings;
//                                 AccNo := "Standing Order Header"."Source Account No.";
//                                 Description := "Standing Order Header"."No." + '_LOAN:-' + StandingOrderLines."Loan No.";
//                                 TransType := Transtype::" ";
//                                 SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, AccType, AccNo, CopyStr(Description, 1, 50), Balaccounttype::"G/L Account",
//                                                     '', TransAmt, ExtDoc, '', TransType, Dim1, Dim2, SystemCreated);


//                                 if RunBal > OutstandingBalance then
//                                     TransAmt := Loans."Outstanding Bills";
//                                 TransType := Transtype::Bills;
//                                 AccNo := Loans."Loan Account";
//                                 AccType := Acctype::Credit;
//                                 ProductFactory.Get(Loans."Loan Product Type");
//                                 SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, AccType, AccNo, CopyStr(Description, 1, 50), Balaccounttype::"G/L Account",
//                                                     ProductFactory."Billed Account", -TransAmt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystemCreated);

//                                 RunBal -= Abs(TransAmt);
//                                 TotalDeducted += Abs(TransAmt);
//                                 AmountDeducted += Abs(TransAmt);

//                                 if AmountDeducted >= OutstandingInterest + OutstandingBalance then begin
//                                     StandingOrderLines."Remaining Amount" := StandingOrderLines.Amount;
//                                     StandingOrderLines."Amount Deducted" := 0;
//                                 end;

//                                 if AmountDeducted >= StandingOrderLines."Remaining Amount" then begin
//                                     StandingOrderLines."Remaining Amount" := StandingOrderLines.Amount;
//                                     StandingOrderLines."Amount Deducted" := 0;
//                                 end else begin
//                                     StandingOrderLines."Remaining Amount" := StandingOrderLines."Remaining Amount" - AmountDeducted;
//                                     StandingOrderLines."Amount Deducted" += AmountDeducted;
//                                 end;
//                                 StandingOrderLines.Modify;

//                             until StandingOrderLines.Next = 0;
//                         end;


//                         AmountToDeductPerLine := 0;
//                         AmountDeducted := 0;
//                         if RunBal > 0 then begin
//                             StandingOrderLines.Reset;
//                             StandingOrderLines.SetRange("Document No.", "Standing Order Header"."No.");
//                             StandingOrderLines.SetRange("Destination Account Type", StandingOrderLines."destination account type"::Internal);
//                             if StandingOrderLines.FindFirst then begin
//                                 repeat
//                                     AmountToDeductPerLine := StandingOrderLines."Remaining Amount";

//                                     TransType := Transtype::" ";
//                                     AccType := Acctype::Savings;
//                                     Description := "Standing Order Header"."No." + '_Acc:-' + StandingOrderLines."Destination Account No.";
//                                     TransAmt := AmountToDeductPerLine;
//                                     if TransAmt > RunBal then
//                                         TransAmt := RunBal;

//                                     AccNo := StandingOrderLines."Destination Account No.";
//                                     SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, AccType, AccNo, CopyStr(Description, 1, 50), Balaccounttype::"G/L Account",
//                                                         '', -TransAmt, ExtDoc, LoanNo, TransType, Dim1, Dim2, SystemCreated);


//                                     AccNo := "Standing Order Header"."Source Account No.";
//                                     SaccoTrans.JournalInsert(JTemplate, JBatch, DocNo, PDate, AccType, AccNo, CopyStr(Description, 1, 50), Balaccounttype::"G/L Account",
//                                                         '', TransAmt, ExtDoc, '', TransType, Dim1, Dim2, SystemCreated);


//                                     RunBal -= Abs(TransAmt);
//                                     TotalDeducted += Abs(TransAmt);
//                                     AmountDeducted += Abs(TransAmt);
//                                     if AmountDeducted >= StandingOrderLines."Remaining Amount" then begin
//                                         StandingOrderLines."Remaining Amount" := StandingOrderLines.Amount;
//                                         StandingOrderLines."Amount Deducted" := 0;
//                                     end else begin
//                                         StandingOrderLines."Remaining Amount" := StandingOrderLines."Remaining Amount" - AmountDeducted;
//                                         StandingOrderLines."Amount Deducted" += AmountDeducted;
//                                     end;
//                                     StandingOrderLines.Modify;
//                                 until StandingOrderLines.Next = 0;
//                             end;
//                         end;



//                         /*-------------INSERT JOURNAL STO LINES-------------------------------*/
//                         NoSetup.Get();
//                         NoSetup.TestField(NoSetup."Standing Order Reg. Nos.");
//                         //NoSeriesMgtInitSeries(NoSetup."Standing Order Reg. Nos.", STRNo, 0D, STRNo, StandingOrderRegister."No. Series");

//                         Members.Get("Standing Order Header"."Member No.");
//                         SavingsAccounts.Get("Standing Order Header"."Source Account No.");

//                         StandingOrderRegister.Init;
//                         StandingOrderRegister."No." := STRNo;
//                         StandingOrderRegister."Date Processed" := PDate;
//                         StandingOrderRegister."Document No." := DocNo;
//                         StandingOrderRegister."Source Account No." := "Standing Order Header"."Source Account No.";
//                         StandingOrderRegister."Source Account Name" := SavingsAccounts.Name;
//                         StandingOrderRegister."Member No" := "Standing Order Header"."Member No.";
//                         StandingOrderRegister."Staff/Payroll No." := Members."Payroll/Staff No.";
//                         StandingOrderRegister."Allow Partial Deduction" := "Standing Order Header"."Allow Partial Deduction";

//                         StandingOrderLines.Reset;
//                         StandingOrderLines.SetRange("Document No.", "Standing Order Header"."No.");
//                         if StandingOrderLines.FindFirst then begin
//                             StandingOrderLines.CalcSums(Amount, "Remaining Amount");
//                             if StandingOrderLines."Remaining Amount" >= StandingOrderLines.Amount then
//                                 StandingOrderRegister."Deduction Status" := StandingOrderRegister."deduction status"::Successful
//                             else
//                                 StandingOrderRegister."Deduction Status" := StandingOrderRegister."deduction status"::"Partial Deduction";
//                         end;

//                         if TotalDeducted = 0 then
//                             StandingOrderRegister."Deduction Status" := StandingOrderRegister."deduction status"::Failed;


//                         StandingOrderRegister.Amount := "Standing Order Header".Amount;
//                         StandingOrderRegister."Amount Deducted" := TotalDeducted;
//                         StandingOrderRegister."Effective/Start Date" := "Standing Order Header"."Effective/Start Date";
//                         StandingOrderRegister.Duration := "Standing Order Header"."Duration (Months)";
//                         StandingOrderRegister.Frequency := "Standing Order Header"."Frequency (Months)";
//                         StandingOrderRegister."End Date" := "Standing Order Header"."End Date";
//                         StandingOrderRegister."Standing Order No." := "Standing Order Header"."No.";
//                         StandingOrderRegister."Run Count" := LastEntry + 1;
//                         StandingOrderRegister.Insert;


//                         /*-------------FINALISE AND POST-------------------------------*/
//                         if TotalDeducted <> 0 then
//                             SaccoTrans.PostJournal(JTemplate, JBatch);
//                         if TotalDeducted = 0 then
//                             SaccoTrans.InitJournal(JTemplate, JBatch);


//                         if StandingOrderRegister."Deduction Status" = StandingOrderRegister."deduction status"::Successful then begin
//                             if "Standing Order Header"."Next Run Date" = 0D then
//                                 "Standing Order Header"."Next Run Date" := CalcDate("Standing Order Header"."Frequency (Months)", "Standing Order Header"."Effective/Start Date")
//                             else
//                                 "Standing Order Header"."Next Run Date" := CalcDate("Standing Order Header"."Frequency (Months)", "Standing Order Header"."Next Run Date");
//                         end;

//                         if Today >= "Standing Order Header"."End Date" then begin
//                             if StandingOrderRegister."Deduction Status" = StandingOrderRegister."deduction status"::Successful then
//                                 "Standing Order Header".Status := "Standing Order Header".Status::Stopped;
//                         end;
//                         "Standing Order Header".Modify

//                     end;
//                 end;

//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     var
//         StandingOrderRegister: Record 52185719;
//         HasNeverRan: Boolean;
//         SearchStartDate: Date;
//         SearchEndDate: Date;
//         SecondRunDate: Date;
//         TotalAmountDeductedWithinPeriod: Decimal;
//         STOAllocatedAmount: Decimal;
//         RunSTO: Boolean;
//         AmountToDeduct: Decimal;
//         AccountBal: Decimal;
//         SkyMbanking: Codeunit 52185423;
//         TotalCharges: Decimal;
//         BankingUserTemplate: Record 52185782;
//         LastEntry: Integer;
//         UserSetup: Record "User Setup";

//     local procedure GetChargeAmount(AmountToDeduct: Decimal; StandingOrderHeader: Record 52185717; var ProcessingCharge: Decimal; var ExciseDuty: Decimal; var GLAccount: Code[30]; var ExciseDutyGL: Code[30]): Decimal
//     var
//         TransactionCharges: Record 52185774;
//         GenSetup: Record 52185689;
//         ChargeAmount: Decimal;
//         TCharges: Decimal;
//     begin
//         GenSetup.Get;

//         TCharges := 0;
//         TransactionCharges.Reset;
//         TransactionCharges.SetRange(TransactionCharges."Transaction Type", StandingOrderHeader."Transaction Type");
//         if TransactionCharges.Find('-') then begin
//             ChargeAmount := TransactionCharges."Charge Amount";
//             GLAccount := TransactionCharges."G/L Account";
//         end;
//         ProcessingCharge := ChargeAmount;
//         ExciseDuty := ROUND(ChargeAmount * (GenSetup."Excise Duty (%)") * 0.01, 1, '>');
//         ExciseDutyGL := GenSetup."Excise Duty G/L";
//         exit(ChargeAmount + ExciseDuty);
//     end;
// }
