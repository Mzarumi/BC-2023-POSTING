// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185634 "Standing Order Processing"
// {
//     ProcessingOnly = true;

//     dataset
//     {
//         dataitem(StandingOrderHeader; StandingOrderHeader)
//         {
//             DataItemTableView = where(Status = const(Approved), "Income Type" = const(Periodic));
//             RequestFilterFields = "No.";
//             column(ReportForNavId_1; 1)
//             {
//             }

//             trigger OnAfterGetRecord()
//             var
//                 BankingUserTemplate: Record 52185782;
//                 JTemplate: Code[20];
//                 JBatch: Code[20];
//                 SOProcessing: Codeunit 52185458;
//             begin
//                 //SOProcessing.StandingOrderHeaderP(NextRunDate,StandingOrderHeader);

//                 GeneralSetUp.Get;
//                 BankingUserTemplate.Get(UserId);
//                 JTemplate := BankingUserTemplate."Cashier Journal Template";
//                 JBatch := BankingUserTemplate."Cashier Journal Batch";

//                 StandingOrdSRegister.Reset;
//                 StandingOrdSRegister.SetRange(StandingOrdSRegister."Date Processed", NextRunDate);
//                 StandingOrdSRegister.SetFilter(StandingOrdSRegister."Document No.", StandingOrderHeader."No.");
//                 if StandingOrdSRegister.Find('-') then
//                     StandingOrdSRegister.DeleteAll;

//                 AvailableBal := 0;
//                 RunBal := 0;
//                 AmountDedu := 0;

//                 if SavingsAccounts.Get(StandingOrderHeader."Source Account No.") then begin
//                     SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)", SavingsAccounts."Authorised Over Draft",
//                                                SavingsAccounts."Uncleared Cheques", SavingsAccounts."ATM Transactions");

//                     GlobalDim1 := SavingsAccounts."Global Dimension 1 Code";
//                     GlobalDim2 := SavingsAccounts."Global Dimension 2 Code";

//                     getChargeAmount(StandingOrderHeader);

//                     if ProductFactory.Get(SavingsAccounts."Product Type") then
//                         AvailableBal := (SavingsAccounts."Balance (LCY)" + SavingsAccounts."Authorised Over Draft") -
//                                        (SavingsAccounts."Uncleared Cheques" + SavingsAccounts."ATM Transactions" + ProductFactory."Minimum Balance" + TCharges);


//                     //**CASE StandingOrderHeader."Income Type" OF
//                     //**IF StandingOrderHeader."Income Type" = StandingOrderHeader."Income Type"::Periodic THEN BEGIN
//                     if StandingOrderHeader."Next Run Date" = NextRunDate then begin
//                         RunBal := AvailableBal;


//                         //sms on Standing order expiry
//                         MobNo := '';

//                         if CalcDate('3M', Today) >= StandingOrderHeader."End Date" then begin

//                             if Account.Get(StandingOrderHeader."Source Account No.") then begin
//                                 MobNo := Account."Transactional Mobile No";
//                             end;

//                             //your standing order of amount is due to expire on + end date
//                             SendSMS.SendSms(Sourcetype::"Status Order", MobNo, Text0001 + Format(StandingOrderHeader.Amount) + Text0005 +
//                             Format(StandingOrderHeader."End Date") + ' ' + Format(Today) + ' ' + Format(Time) + ' ' + COMPANYNAME, "No.", "No.", false);

//                         end;
//                         //sms on Standing order expiry

//                         STOlinesname := '';
//                         if not StandingOrderHeader."Allow Partial Deduction" then begin
//                             if RunBal >= StandingOrderHeader.Amount then begin
//                                 StandingOrderLines.Reset;
//                                 StandingOrderLines.SetRange(StandingOrderLines."Document No.", StandingOrderHeader."No.");
//                                 if StandingOrderLines.Find('-') then begin
//                                     repeat

//                                         STOlinesname := StandingOrderLines."Destination Account Name";
//                                         //MESSAGE('The Lines name is %1',STOlinesname);

//                                         case StandingOrderLines."Destination Account Type" of
//                                             StandingOrderLines."destination account type"::Internal, StandingOrderLines."destination account type"::External:
//                                                 begin

//                                                     //MESSAGE('No :%1 Name :%2 Amount :%3',StandingOrderLines."Destination Account No.",StandingOrderLines."Destination Account Name",StandingOrderLines.Amount);

//                                                     LineN += 1;
//                                                     GenJLine.Init;
//                                                     GenJLine."Journal Template Name" := JTemplate;
//                                                     GenJLine."Journal Batch Name" := JBatch;
//                                                     GenJLine."Line No." := LineN;
//                                                     GenJLine."Posting Date" := NextRunDate;
//                                                     GenJLine."Document No." := StandingOrderHeader."No.";
//                                                     GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                     //GenJLine.VALIDATE(GenJLine."Account No.",StandingOrderLines."Destination Account No.");

//                                                     GenSetup.Get;

//                                                     //Brought
//                                                     case StandingOrderLines."Destination Account Type" of
//                                                         StandingOrderLines."destination account type"::External:
//                                                             begin
//                                                                 GenJLine."Account Type" := GenJLine."account type"::"G/L Account";
//                                                                 GenJLine.Validate(GenJLine."Account No.", GenSetup."External STO Account No.");
//                                                             end;
//                                                         StandingOrderLines."destination account type"::Internal:
//                                                             begin
//                                                                 GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                                 GenJLine.Validate(GenJLine."Account No.", StandingOrderLines."Destination Account No.");
//                                                             end;
//                                                     end;
//                                                     //Brought

//                                                     //GenJLine.Description:=PADSTR('Destination:- '+StandingOrderLines."Destination Account No."+'-'+StandingOrderLines."Destination Account Name",50);
//                                                     //GenJLine.Description:=PADSTR('Destination:- '+StandingOrderHeader."Source Account No."+'-'+StandingOrderHeader."Source Account Name",50);
//                                                     GenJLine.Description := PadStr('STO:-' + Format(StandingOrderHeader."No.") + '-' + Format(StandingOrderHeader."Source Account Name"), 50);
//                                                     GenJLine.Validate(GenJLine.Amount, -StandingOrderLines.Amount);
//                                                     GenJLine.Validate(GenJLine."Loan No", StandingOrderLines."Loan No.");
//                                                     GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                                                     GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                                                     if GenJLine.Amount <> 0 then
//                                                         GenJLine.Insert;

//                                                     RunBal -= Abs(GenJLine.Amount);
//                                                     AmountDedu += Abs(GenJLine.Amount); //MESSAGE('TE1 :%1',AmountDedu);
//                                                 end;

//                                             StandingOrderLines."destination account type"::Credit:
//                                                 begin

//                                                     LoanInterest := 0;
//                                                     LoanPrincipal := 0;
//                                                     LoanRepayment := 0;

//                                                     LoanApps.Reset;
//                                                     LoanApps.SetRange(LoanApps."Loan No.", StandingOrderLines."Loan No.");
//                                                     if LoanApps.Find('-') then begin
//                                                         LoanApps.CalcFields(LoanApps."Outstanding Interest", LoanApps."Outstanding Bills", LoanApps."Outstanding Balance");

//                                                         //MESSAGE('No :%1 Name :%2 Amount :%3',StandingOrderLines."Destination Account No.",StandingOrderLines."Destination Account Name",StandingOrderLines.Amount);

//                                                         LoanPrincipal := StandingOrderLines.Amount;

//                                                         if LoanApps."Outstanding Interest" > 0 then begin
//                                                             LineN += 1;
//                                                             GenJLine.Init;
//                                                             GenJLine."Journal Template Name" := JTemplate;
//                                                             GenJLine."Journal Batch Name" := JBatch;
//                                                             GenJLine."Line No." := LineN;
//                                                             GenJLine."Posting Date" := NextRunDate;
//                                                             GenJLine."Document No." := StandingOrderHeader."No.";
//                                                             GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                             GenJLine.Validate(GenJLine."Account No.", StandingOrderLines."Destination Account No.");
//                                                             GenJLine.Description := PadStr('Destination:-' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
//                                                                                          Format(GenJLine."transaction type"::"Interest Paid"), 50);

//                                                             if LoanApps."Outstanding Interest" > StandingOrderLines.Amount then begin
//                                                                 LoanInterest := StandingOrderLines.Amount;
//                                                                 LoanPrincipal := StandingOrderLines.Amount - LoanInterest;
//                                                             end else
//                                                                 LoanInterest := LoanApps."Outstanding Interest";

//                                                             if RunBal > LoanInterest then
//                                                                 GenJLine.Validate(GenJLine.Amount, -LoanInterest)
//                                                             else
//                                                                 GenJLine.Validate(GenJLine.Amount, -RunBal);

//                                                             GenJLine.Validate(GenJLine."Loan No", StandingOrderLines."Loan No.");
//                                                             GenJLine."Transaction Type" := GenJLine."transaction type"::"Interest Paid";
//                                                             GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                                                             GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                                                             if GenJLine.Amount <> 0 then
//                                                                 GenJLine.Insert;

//                                                             RunBal -= Abs(GenJLine.Amount);
//                                                             AmountDedu += Abs(GenJLine.Amount); //MESSAGE('TE2 :%1',AmountDedu);
//                                                         end;

//                                                         if (LoanApps."Outstanding Balance" > 0) and (LoanApps."Outstanding Bills" > 0) then begin
//                                                             LineN += 1;
//                                                             GenJLine.Init;
//                                                             GenJLine."Journal Template Name" := JTemplate;
//                                                             GenJLine."Journal Batch Name" := JBatch;
//                                                             GenJLine."Line No." := LineN;
//                                                             GenJLine."Posting Date" := NextRunDate;
//                                                             GenJLine."Document No." := StandingOrderHeader."No.";
//                                                             GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                             GenJLine.Validate(GenJLine."Account No.", StandingOrderLines."Destination Account No.");
//                                                             GenJLine.Description := PadStr('Destination:- ' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
//                                                                                          Format(GenJLine."transaction type"::Bills), 50);

//                                                             if LoanApps."Outstanding Bills" >= LoanPrincipal then
//                                                                 LoanRepayment := LoanPrincipal
//                                                             else
//                                                                 LoanRepayment := LoanApps."Outstanding Bills";

//                                                             if RunBal >= LoanRepayment then
//                                                                 GenJLine.Validate(GenJLine.Amount, -LoanRepayment)
//                                                             else
//                                                                 GenJLine.Validate(GenJLine.Amount, -RunBal);

//                                                             GenJLine.Validate(GenJLine."Loan No", StandingOrderLines."Loan No.");
//                                                             GenJLine."Transaction Type" := GenJLine."transaction type"::Bills;
//                                                             if ProductFactory.Get(LoanApps."Loan Product Type") then begin
//                                                                 GenJLine."Bal. Account Type" := GenJLine."bal. account type"::"G/L Account";
//                                                                 GenJLine.Validate(GenJLine."Bal. Account No.", ProductFactory."Billed Account");
//                                                             end;
//                                                             GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                                                             GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                                                             if GenJLine.Amount <> 0 then
//                                                                 GenJLine.Insert;

//                                                             LineN += 1;
//                                                             GenJLine.Init;
//                                                             GenJLine."Journal Template Name" := JTemplate;
//                                                             GenJLine."Journal Batch Name" := JBatch;
//                                                             GenJLine."Line No." := LineN;
//                                                             GenJLine."Posting Date" := NextRunDate;
//                                                             GenJLine."Document No." := StandingOrderHeader."No.";
//                                                             GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                             GenJLine.Validate(GenJLine."Account No.", StandingOrderLines."Destination Account No.");
//                                                             GenJLine.Description := PadStr('Destination:-' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
//                                                                                          Format(GenJLine."transaction type"::Repayment), 50);

//                                                             if LoanApps."Outstanding Bills" >= LoanPrincipal then
//                                                                 LoanRepayment := LoanPrincipal
//                                                             else
//                                                                 LoanRepayment := LoanApps."Outstanding Bills";

//                                                             if RunBal >= LoanRepayment then
//                                                                 GenJLine.Validate(GenJLine.Amount, -LoanRepayment)
//                                                             else
//                                                                 GenJLine.Validate(GenJLine.Amount, -RunBal);

//                                                             GenJLine.Validate(GenJLine."Loan No", StandingOrderLines."Loan No.");
//                                                             GenJLine."Transaction Type" := GenJLine."transaction type"::Repayment;
//                                                             GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                                                             GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                                                             if GenJLine.Amount <> 0 then
//                                                                 GenJLine.Insert;

//                                                             RunBal -= Abs(GenJLine.Amount);
//                                                             AmountDedu += Abs(GenJLine.Amount); //MESSAGE('TE3 :%1',AmountDedu);
//                                                         end;

//                                                         if (LoanApps."Outstanding Balance" > 0) and (LoanApps."Outstanding Bills" = 0) then begin
//                                                             LineN += 1;
//                                                             GenJLine.Init;
//                                                             GenJLine."Journal Template Name" := JTemplate;
//                                                             GenJLine."Journal Batch Name" := JBatch;
//                                                             GenJLine."Line No." := LineN;
//                                                             GenJLine."Posting Date" := NextRunDate;
//                                                             GenJLine."Document No." := StandingOrderHeader."No.";
//                                                             GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                             GenJLine.Validate(GenJLine."Account No.", StandingOrderLines."Destination Account No.");
//                                                             GenJLine.Description := PadStr('Destination:- ACCRUAL ' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
//                                                                                          Format(GenJLine."transaction type"::Bills), 50);

//                                                             if LoanApps."Outstanding Balance" > LoanPrincipal then
//                                                                 LoanRepayment := LoanPrincipal
//                                                             else
//                                                                 LoanRepayment := LoanApps."Outstanding Balance";

//                                                             //MESSAGE('Bill :%1 PPay :%2 RunBal :%3',LoanRepayment ,LoanPrincipal,Runbal);

//                                                             if RunBal > LoanRepayment then
//                                                                 GenJLine.Validate(GenJLine.Amount, LoanRepayment)
//                                                             else
//                                                                 GenJLine.Validate(GenJLine.Amount, RunBal);

//                                                             GenJLine.Validate(GenJLine."Loan No", StandingOrderLines."Loan No.");
//                                                             GenJLine."Transaction Type" := GenJLine."transaction type"::Bills;
//                                                             GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                                                             GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                                                             if ProductFactory.Get(LoanApps."Loan Product Type") then begin
//                                                                 GenJLine."Bal. Account Type" := GenJLine."bal. account type"::"G/L Account";
//                                                                 GenJLine.Validate(GenJLine."Bal. Account No.", ProductFactory."Billed Account");
//                                                             end;
//                                                             if GenJLine.Amount <> 0 then
//                                                                 GenJLine.Insert;

//                                                             LineN += 1;
//                                                             GenJLine.Init;
//                                                             GenJLine."Journal Template Name" := JTemplate;
//                                                             GenJLine."Journal Batch Name" := JBatch;
//                                                             GenJLine."Line No." := LineN;
//                                                             GenJLine."Posting Date" := NextRunDate;
//                                                             GenJLine."Document No." := StandingOrderHeader."No.";
//                                                             GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                             GenJLine.Validate(GenJLine."Account No.", StandingOrderLines."Destination Account No.");
//                                                             GenJLine.Description := PadStr('Destination:-' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
//                                                                                          Format(GenJLine."transaction type"::Bills), 50);

//                                                             if LoanApps."Outstanding Balance" > LoanPrincipal then
//                                                                 LoanRepayment := LoanPrincipal
//                                                             else
//                                                                 LoanRepayment := LoanApps."Outstanding Balance";

//                                                             if RunBal > LoanRepayment then
//                                                                 GenJLine.Validate(GenJLine.Amount, -LoanRepayment)
//                                                             else
//                                                                 GenJLine.Validate(GenJLine.Amount, -RunBal);

//                                                             GenJLine.Validate(GenJLine."Loan No", StandingOrderLines."Loan No.");
//                                                             GenJLine."Transaction Type" := GenJLine."transaction type"::Bills;
//                                                             if ProductFactory.Get(LoanApps."Loan Product Type") then begin
//                                                                 GenJLine."Bal. Account Type" := GenJLine."bal. account type"::"G/L Account";
//                                                                 GenJLine.Validate(GenJLine."Bal. Account No.", ProductFactory."Billed Account");
//                                                             end;
//                                                             GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                                                             GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                                                             if GenJLine.Amount <> 0 then
//                                                                 GenJLine.Insert;

//                                                             LineN += 1;
//                                                             GenJLine.Init;
//                                                             GenJLine."Journal Template Name" := JTemplate;
//                                                             GenJLine."Journal Batch Name" := JBatch;
//                                                             GenJLine."Line No." := LineN;
//                                                             GenJLine."Posting Date" := NextRunDate;
//                                                             GenJLine."Document No." := StandingOrderHeader."No.";
//                                                             GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                             GenJLine.Validate(GenJLine."Account No.", StandingOrderLines."Destination Account No.");
//                                                             GenJLine.Description := PadStr('Destination:-' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
//                                                                                          Format(GenJLine."transaction type"::Repayment), 50);

//                                                             if LoanApps."Outstanding Balance" > LoanPrincipal then
//                                                                 LoanRepayment := LoanPrincipal
//                                                             else
//                                                                 LoanRepayment := LoanApps."Outstanding Balance";

//                                                             if RunBal > LoanRepayment then
//                                                                 GenJLine.Validate(GenJLine.Amount, -LoanRepayment)
//                                                             else
//                                                                 GenJLine.Validate(GenJLine.Amount, -RunBal);

//                                                             GenJLine.Validate(GenJLine."Loan No", StandingOrderLines."Loan No.");
//                                                             GenJLine."Transaction Type" := GenJLine."transaction type"::Repayment;
//                                                             GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                                                             GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                                                             if GenJLine.Amount <> 0 then
//                                                                 GenJLine.Insert;

//                                                             RunBal -= Abs(GenJLine.Amount);
//                                                             AmountDedu += Abs(GenJLine.Amount); //MESSAGE('TE4 :%1',AmountDedu);
//                                                         end;
//                                                     end;
//                                                 end;
//                                         end;
//                                     until StandingOrderLines.Next = 0;
//                                 end;

//                                 if Account.Get(StandingOrderHeader."Source Account No.") then begin
//                                     MobNo := Account."Transactional Mobile No";
//                                 end;



//                                 SendSMS.SendSms(Sourcetype::"Status Order", MobNo, Text0001 + Format(StandingOrderHeader.Amount) + Text0003
//                                 + Format(Today) + ' ' + Format(Time) + ' ' + COMPANYNAME, "No.", "No.", false);
//                             end;
//                         end; //Non Partial

//                         if StandingOrderHeader."Allow Partial Deduction" then begin //Partial Deduction
//                             StandingOrderLines.Reset;
//                             StandingOrderLines.SetRange(StandingOrderLines."Document No.", StandingOrderHeader."No.");
//                             if StandingOrderLines.Find('-') then begin
//                                 repeat
//                                     STOlinesname := StandingOrderLines."Destination Account Name";
//                                     Message('The Lines name is %1', STOlinesname);
//                                     case StandingOrderLines."Destination Account Type" of
//                                         StandingOrderLines."destination account type"::Internal, StandingOrderLines."destination account type"::External:
//                                             begin
//                                                 LineN += 1;
//                                                 GenJLine.Init;
//                                                 GenJLine."Journal Template Name" := JTemplate;
//                                                 GenJLine."Journal Batch Name" := JBatch;
//                                                 GenJLine."Line No." := LineN;
//                                                 GenJLine."Posting Date" := NextRunDate;
//                                                 GenJLine."Document No." := StandingOrderHeader."No.";
//                                                 GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                 GenJLine.Validate(GenJLine."Account No.", StandingOrderLines."Destination Account No.");
//                                                 //GenJLine.Description:=PADSTR('Destination:- '+StandingOrderHeader."Source Account No."+'-'+StandingOrderHeader."Source Account Name",50);
//                                                 GenJLine.Description := PadStr('STO:-' + Format(StandingOrderHeader."No.") + '-' + Format(StandingOrderHeader."Source Account Name"), 50);
//                                                 if RunBal >= StandingOrderLines.Amount then
//                                                     GenJLine.Validate(GenJLine.Amount, -StandingOrderLines.Amount)
//                                                 else
//                                                     GenJLine.Validate(GenJLine.Amount, -RunBal);

//                                                 GenJLine.Validate(GenJLine."Loan No", StandingOrderLines."Loan No.");
//                                                 GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                                                 GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                                                 if GenJLine.Amount <> 0 then
//                                                     GenJLine.Insert;

//                                                 RunBal -= Abs(GenJLine.Amount);
//                                                 AmountDedu += Abs(GenJLine.Amount); //MESSAGE('TE5 :%1',AmountDedu);
//                                             end;

//                                         StandingOrderLines."destination account type"::Credit:
//                                             begin

//                                                 LoanInterest := 0;
//                                                 LoanPrincipal := 0;
//                                                 LoanRepayment := 0;

//                                                 LoanApps.Reset;
//                                                 LoanApps.SetRange(LoanApps."Loan No.", StandingOrderLines."Loan No.");
//                                                 if LoanApps.Find('-') then begin
//                                                     LoanApps.CalcFields(LoanApps."Outstanding Interest", LoanApps."Outstanding Bills", LoanApps."Outstanding Balance");

//                                                     LoanPrincipal := StandingOrderLines.Amount;

//                                                     if LoanApps."Outstanding Interest" > 0 then begin
//                                                         LineN += 1;
//                                                         GenJLine.Init;
//                                                         GenJLine."Journal Template Name" := JTemplate;
//                                                         GenJLine."Journal Batch Name" := JBatch;
//                                                         GenJLine."Line No." := LineN;
//                                                         GenJLine."Posting Date" := NextRunDate;
//                                                         GenJLine."Document No." := StandingOrderHeader."No.";
//                                                         GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                         GenJLine.Validate(GenJLine."Account No.", StandingOrderLines."Destination Account No.");
//                                                         GenJLine.Description := PadStr('Destination:-' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
//                                                                                      Format(GenJLine."transaction type"::"Interest Paid"), 50);

//                                                         if LoanApps."Outstanding Interest" > StandingOrderLines.Amount then begin
//                                                             LoanInterest := StandingOrderLines.Amount;
//                                                             LoanPrincipal := StandingOrderLines.Amount - LoanInterest;
//                                                         end else
//                                                             LoanInterest := LoanApps."Outstanding Interest";

//                                                         if RunBal > LoanInterest then
//                                                             GenJLine.Validate(GenJLine.Amount, -LoanInterest)
//                                                         else
//                                                             GenJLine.Validate(GenJLine.Amount, -RunBal);

//                                                         GenJLine.Validate(GenJLine."Loan No", StandingOrderLines."Loan No.");
//                                                         GenJLine."Transaction Type" := GenJLine."transaction type"::"Interest Paid";
//                                                         GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                                                         GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                                                         if GenJLine.Amount <> 0 then
//                                                             GenJLine.Insert;

//                                                         RunBal -= Abs(GenJLine.Amount);
//                                                         AmountDedu += Abs(GenJLine.Amount); //MESSAGE('TE6 :%1',AmountDedu);
//                                                     end;

//                                                     if (LoanApps."Outstanding Balance" > 0) and (LoanApps."Outstanding Bills" > 0) then begin
//                                                         LineN += 1;
//                                                         GenJLine.Init;
//                                                         GenJLine."Journal Template Name" := JTemplate;
//                                                         GenJLine."Journal Batch Name" := JBatch;
//                                                         GenJLine."Line No." := LineN;
//                                                         GenJLine."Posting Date" := NextRunDate;
//                                                         GenJLine."Document No." := StandingOrderHeader."No.";
//                                                         GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                         GenJLine.Validate(GenJLine."Account No.", StandingOrderLines."Destination Account No.");
//                                                         GenJLine.Description := PadStr('Destination:- ' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
//                                                                                      Format(GenJLine."transaction type"::Bills), 50);

//                                                         if LoanApps."Outstanding Bills" >= LoanPrincipal then
//                                                             LoanRepayment := LoanPrincipal
//                                                         else
//                                                             LoanRepayment := LoanApps."Outstanding Bills";

//                                                         if RunBal >= LoanRepayment then
//                                                             GenJLine.Validate(GenJLine.Amount, -LoanRepayment)
//                                                         else
//                                                             GenJLine.Validate(GenJLine.Amount, -RunBal);

//                                                         GenJLine.Validate(GenJLine."Loan No", StandingOrderLines."Loan No.");
//                                                         GenJLine."Transaction Type" := GenJLine."transaction type"::Bills;
//                                                         if ProductFactory.Get(LoanApps."Loan Product Type") then begin
//                                                             GenJLine."Bal. Account Type" := GenJLine."bal. account type"::"G/L Account";
//                                                             GenJLine.Validate(GenJLine."Bal. Account No.", ProductFactory."Billed Account");
//                                                         end;
//                                                         GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                                                         GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                                                         if GenJLine.Amount <> 0 then
//                                                             GenJLine.Insert;

//                                                         LineN += 1;
//                                                         GenJLine.Init;
//                                                         GenJLine."Journal Template Name" := JTemplate;
//                                                         GenJLine."Journal Batch Name" := JBatch;
//                                                         GenJLine."Line No." := LineN;
//                                                         GenJLine."Posting Date" := NextRunDate;
//                                                         GenJLine."Document No." := StandingOrderHeader."No.";
//                                                         GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                         GenJLine.Validate(GenJLine."Account No.", StandingOrderLines."Destination Account No.");
//                                                         GenJLine.Description := PadStr('Destination:-' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
//                                                                                      Format(GenJLine."transaction type"::Repayment), 50);

//                                                         if LoanApps."Outstanding Bills" >= LoanPrincipal then
//                                                             LoanRepayment := LoanPrincipal
//                                                         else
//                                                             LoanRepayment := LoanApps."Outstanding Bills";

//                                                         if RunBal >= LoanRepayment then
//                                                             GenJLine.Validate(GenJLine.Amount, -LoanRepayment)
//                                                         else
//                                                             GenJLine.Validate(GenJLine.Amount, -RunBal);

//                                                         GenJLine.Validate(GenJLine."Loan No", StandingOrderLines."Loan No.");
//                                                         GenJLine."Transaction Type" := GenJLine."transaction type"::Repayment;
//                                                         GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                                                         GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                                                         if GenJLine.Amount <> 0 then
//                                                             GenJLine.Insert;

//                                                         RunBal -= Abs(GenJLine.Amount);
//                                                         AmountDedu += Abs(GenJLine.Amount); //MESSAGE('TE7 :%1',AmountDedu);
//                                                     end;

//                                                     if (LoanApps."Outstanding Balance" > 0) and (LoanApps."Outstanding Bills" = 0) then begin
//                                                         LineN += 1;
//                                                         GenJLine.Init;
//                                                         GenJLine."Journal Template Name" := JTemplate;
//                                                         GenJLine."Journal Batch Name" := JBatch;
//                                                         GenJLine."Line No." := LineN;
//                                                         GenJLine."Posting Date" := NextRunDate;
//                                                         GenJLine."Document No." := StandingOrderHeader."No.";
//                                                         GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                         GenJLine.Validate(GenJLine."Account No.", StandingOrderLines."Destination Account No.");
//                                                         GenJLine.Description := PadStr('Destination:- ACCRUAL' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
//                                                                                      Format(GenJLine."transaction type"::Bills), 50);

//                                                         if LoanApps."Outstanding Balance" > LoanPrincipal then
//                                                             LoanRepayment := LoanPrincipal
//                                                         else
//                                                             LoanRepayment := LoanApps."Outstanding Balance";

//                                                         //MESSAGE('Bill :%1 PPay :%2 RunBal :%3',LoanRepayment ,LoanPrincipal,Runbal);

//                                                         if RunBal > LoanRepayment then
//                                                             GenJLine.Validate(GenJLine.Amount, LoanRepayment)
//                                                         else
//                                                             GenJLine.Validate(GenJLine.Amount, RunBal);

//                                                         GenJLine.Validate(GenJLine."Loan No", StandingOrderLines."Loan No.");
//                                                         GenJLine."Transaction Type" := GenJLine."transaction type"::Bills;
//                                                         if ProductFactory.Get(LoanApps."Loan Product Type") then begin
//                                                             GenJLine."Bal. Account Type" := GenJLine."bal. account type"::"G/L Account";
//                                                             GenJLine.Validate(GenJLine."Bal. Account No.", ProductFactory."Billed Account");
//                                                         end;
//                                                         GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                                                         GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                                                         if GenJLine.Amount <> 0 then
//                                                             GenJLine.Insert;

//                                                         LineN += 1;
//                                                         GenJLine.Init;
//                                                         GenJLine."Journal Template Name" := JTemplate;
//                                                         GenJLine."Journal Batch Name" := JBatch;
//                                                         GenJLine."Line No." := LineN;
//                                                         GenJLine."Posting Date" := NextRunDate;
//                                                         GenJLine."Document No." := StandingOrderHeader."No.";
//                                                         GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                         GenJLine.Validate(GenJLine."Account No.", StandingOrderLines."Destination Account No.");
//                                                         GenJLine.Description := PadStr('Destination:-' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
//                                                                                      Format(GenJLine."transaction type"::Bills), 50);

//                                                         if LoanApps."Outstanding Balance" > LoanPrincipal then
//                                                             LoanRepayment := LoanPrincipal
//                                                         else
//                                                             LoanRepayment := LoanApps."Outstanding Balance";

//                                                         if RunBal > LoanRepayment then
//                                                             GenJLine.Validate(GenJLine.Amount, -LoanRepayment)
//                                                         else
//                                                             GenJLine.Validate(GenJLine.Amount, -RunBal);

//                                                         GenJLine.Validate(GenJLine."Loan No", StandingOrderLines."Loan No.");
//                                                         GenJLine."Transaction Type" := GenJLine."transaction type"::Bills;
//                                                         if ProductFactory.Get(LoanApps."Loan Product Type") then begin
//                                                             GenJLine."Bal. Account Type" := GenJLine."bal. account type"::"G/L Account";
//                                                             GenJLine.Validate(GenJLine."Bal. Account No.", ProductFactory."Billed Account");
//                                                         end;
//                                                         GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                                                         GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                                                         if GenJLine.Amount <> 0 then
//                                                             GenJLine.Insert;

//                                                         LineN += 1;
//                                                         GenJLine.Init;
//                                                         GenJLine."Journal Template Name" := JTemplate;
//                                                         GenJLine."Journal Batch Name" := JBatch;
//                                                         GenJLine."Line No." := LineN;
//                                                         GenJLine."Posting Date" := NextRunDate;
//                                                         GenJLine."Document No." := StandingOrderHeader."No.";
//                                                         GenJLine."Account Type" := StandingOrderLines."Destination Account Type";
//                                                         GenJLine.Validate(GenJLine."Account No.", StandingOrderLines."Destination Account No.");
//                                                         GenJLine.Description := PadStr('Destination:-' + LoanApps."Loan No." + '-' + StandingOrderHeader."Source Account No." + '-' +
//                                                                                      Format(GenJLine."transaction type"::Repayment), 50);

//                                                         if LoanApps."Outstanding Balance" > LoanPrincipal then
//                                                             LoanRepayment := LoanPrincipal
//                                                         else
//                                                             LoanRepayment := LoanApps."Outstanding Balance";

//                                                         if RunBal > LoanRepayment then
//                                                             GenJLine.Validate(GenJLine.Amount, -LoanRepayment)
//                                                         else
//                                                             GenJLine.Validate(GenJLine.Amount, -RunBal);

//                                                         GenJLine.Validate(GenJLine."Loan No", StandingOrderLines."Loan No.");
//                                                         GenJLine."Transaction Type" := GenJLine."transaction type"::Repayment;
//                                                         GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                                                         GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                                                         if GenJLine.Amount <> 0 then
//                                                             GenJLine.Insert;

//                                                         RunBal -= Abs(GenJLine.Amount);
//                                                         AmountDedu += Abs(GenJLine.Amount);  //MESSAGE('TE8 :%1',AmountDedu);
//                                                     end;
//                                                 end;
//                                             end;
//                                     end;
//                                 until StandingOrderLines.Next = 0;
//                             end;

//                             //send sms on partial

//                             if StandingOrderHeader.Amount < AvailableBal then begin
//                                 Bal := 0;
//                                 Bal := StandingOrderHeader.Amount - AvailableBal;

//                                 if Account.Get(StandingOrderHeader."Source Account No.") then begin
//                                     MobNo := Account."Transactional Mobile No";
//                                 end;


//                                 SendSMS.SendSms(Sourcetype::"Status Order", MobNo, Text0001 + Format(StandingOrderHeader.Amount) + Text0002 + Format(Bal)
//                                 + Format(Today) + ' ' + Format(Time) + ' ' + COMPANYNAME, StandingOrderHeader."No.", StandingOrderHeader."No.", false);
//                                 //send sms on partial
//                             end else begin

//                                 SendSMS.SendSms(Sourcetype::"Status Order", MobNo, Text0001 + Format(StandingOrderHeader.Amount) + Text0003
//                                 + Format(Today) + ' ' + Format(Time) + ' ' + COMPANYNAME, "No.", "No.", false);
//                             end;
//                         end; //Partial Deduction

//                         //getTransactionCharges(StandingOrderHeader); //MESSAGE('TE9 :%1',AmountDedu);

//                         LineN += 1;
//                         GenJLine.Init;
//                         GenJLine."Journal Template Name" := JTemplate;
//                         GenJLine."Journal Batch Name" := JBatch;
//                         GenJLine."Line No." := LineN;
//                         GenJLine."Posting Date" := NextRunDate;
//                         GenJLine."Document No." := StandingOrderHeader."No.";
//                         GenJLine."Account Type" := StandingOrderHeader."Source Account Type";
//                         GenJLine.Validate(GenJLine."Account No.", StandingOrderHeader."Source Account No.");
//                         //GenJLine.Description:=PADSTR('Source:- '+StandingOrderHeader."Source Account No."+'-'+StandingOrderHeader."Source Account Name",50);
//                         GenJLine.Description := PadStr('STO:-' + Format(StandingOrderHeader."No.") + '-' + Format(STOlinesname), 50);
//                         GenJLine.Validate(GenJLine.Amount, AmountDedu);
//                         GenJLine.Validate(GenJLine."Loan No", '');
//                         GenJLine."Transaction Type" := GenJLine."transaction type"::" ";
//                         GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                         GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                         if GenJLine.Amount <> 0 then
//                             GenJLine.Insert;
//                     end;  //Next Run Date

//                     // StandingOrderHeader."Next Run Date":=CALCDATE(StandingOrderHeader."Frequency (Months)",StandingOrderHeader."Next Run Date"); StandingOrderHeader.MODIFY;

//                     //**END;  //Income Type::Periodic
//                     //**END;   //Income Type
//                 end;    //Savings

//                 /*GenJLine.RESET;
//                 GenJLine.SETRANGE(GenJLine."Journal Template Name",JTemplate);
//                 GenJLine.SETRANGE(GenJLine."Journal Template Name",JBatch);
//                 CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post New",GenJLine);*/

//                 if not StandingOrderHeader."Allow Partial Deduction" then begin
//                     if AvailableBal >= StandingOrderHeader.Amount then begin
//                         DeductionStatus := Deductionstatus::Successfull;
//                         getTransactionCharges(StandingOrderHeader)
//                     end else begin
//                         DeductionStatus := Deductionstatus::Failed;
//                         getTransactionChargesFailedSTO(StandingOrderHeader);
//                         //Send sms on fail
//                         if Account.Get(StandingOrderHeader."Source Account No.") then begin
//                             MobNo := Account."Transactional Mobile No";
//                         end;

//                         SendSMS.SendSms(Sourcetype::"Status Order", MobNo, Text0001 + Format(StandingOrderHeader.Amount) + Text0004
//                         + Format(Today) + ' ' + Format(Time) + ' ' + COMPANYNAME, "No.", "No.", false);


//                         //send sms on fail
//                     end;
//                 end;
//                 if StandingOrderHeader."Allow Partial Deduction" then begin
//                     if AvailableBal >= StandingOrderHeader.Amount then
//                         DeductionStatus := Deductionstatus::Successfull
//                     else
//                         DeductionStatus := Deductionstatus::"Partial Deduction";
//                 end;

//                 if DeductionStatus = Deductionstatus::Successfull then
//                     StandingOrderHeader."Next Run Date" := CalcDate(StandingOrderHeader."Frequency (Months)", StandingOrderHeader."Next Run Date");
//                 StandingOrderHeader.Modify;

//                 InitializeStandingOrderRegister('', Today, StandingOrderHeader."No.", '', StandingOrderHeader."Source Account No.", StandingOrderHeader."Source Account Name",
//                                                 StandingOrderHeader."Member No.", StandingOrderHeader."Payroll/Staff No.", StandingOrderHeader."Allow Partial Deduction",
//                                                 DeductionStatus, StandingOrderHeader.Amount, AvailableBal, StandingOrderHeader."Effective/Start Date", StandingOrderHeader."Duration (Months)",
//                                                 StandingOrderHeader."Frequency (Months)", StandingOrderHeader."End Date", StandingOrderHeader.Description, StandingOrderHeader."Transfered to EFT", false, StandingOrderHeader."No.");

//             end;

//             trigger OnPostDataItem()
//             begin
//                 Message(SuccessfullyPosted);
//             end;

//             trigger OnPreDataItem()
//             begin
//                 if NextRunDate = 0D then
//                     NextRunDate := Today;

//                 BankingUserTemplate.Get(UserId);
//                 JTemplate := BankingUserTemplate."Cashier Journal Template";
//                 JBatch := BankingUserTemplate."Cashier Journal Batch";
//                 GenJLine.Reset;
//                 GenJLine.SetRange(GenJLine."Journal Template Name", JTemplate);
//                 GenJLine.SetRange(GenJLine."Journal Batch Name", JBatch);
//                 GenJLine.DeleteAll;
//                 StandingOrderHeader.SetFilter("Next Run Date", '%1..%2', 20900101D, NextRunDate);
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field("Next Run Date"; NextRunDate)
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     var
//         SuccessfullyPosted: label 'Successfully Processed.';
//         NextRunDate: Date;
//         GeneralSetUp: Record 52185689;
//         SavingsAccounts: Record 52185730;
//         GlobalDim1: Code[20];
//         GlobalDim2: Code[20];
//         ProductFactory: Record 52185690;
//         TCharges: Decimal;
//         AvailableBal: Decimal;
//         RunBal: Decimal;
//         AmountDedu: Decimal;
//         BankingUserTemplate: Record 52185782;
//         JTemplate: Code[20];
//         JBatch: Code[20];
//         LineN: Integer;
//         GenJLine: Record "Gen. Journal Line";
//         StandingOrderLines: Record 52185718;
//         LoanApps: Record 52185729;
//         DeductionStatus: Option " ",Successfull,"Partial Deduction",Failed;
//         StandingOrdSRegister: Record 52185719;
//         LoanInterest: Decimal;
//         LoanPrincipal: Decimal;
//         LoanRepayment: Decimal;
//         MobNo: Code[20];
//         Account: Record 52185730;
//         SendSMS: Codeunit 52185466;
//         Bal: Decimal;
//         Text0001: label 'Your standing order of ';
//         Text0002: label ' has been effected partially the amount due is ';
//         SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book";
//         Text0003: label ' has been effected successfully ';
//         Text0004: label ' has been unsuccessful ';
//         Text0005: label ' is due to expire on ';
//         STOlinesname: Text[80];
//         GenSetup: Record 52185689;


//     procedure getChargeAmount(StandingOrderHeader: Record UnknownRecord52185717)
//     var
//         TransactionCharges: Record 52185774;
//         ChargeAmount: Decimal;
//         TChargeAmount: Decimal;
//         TariffDetails: Record 52185777;
//     begin
//         TCharges := 0;
//         TransactionCharges.Reset;
//         TransactionCharges.SetRange(TransactionCharges."Transaction Type", StandingOrderHeader."Transaction Type");
//         if TransactionCharges.Find('-') then begin
//             repeat

//                 if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::Normal) or
//                   (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::"Failed STO Charge") then begin

//                     ChargeAmount := 0;
//                     if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" then
//                         ChargeAmount := (StandingOrderHeader.Amount * TransactionCharges."Percentage of Amount") * 0.01
//                     else
//                         ChargeAmount := TransactionCharges."Charge Amount";

//                     if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin
//                         TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
//                         TariffDetails.Reset;
//                         TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
//                         if TariffDetails.Find('-') then begin
//                             repeat
//                                 if (StandingOrderHeader.Amount >= TariffDetails."Lower Limit") and
//                                     (StandingOrderHeader.Amount <= TariffDetails."Upper Limit") then begin
//                                     if TariffDetails."Use Percentage" then
//                                         ChargeAmount := StandingOrderHeader.Amount * TariffDetails.Percentage * 0.01
//                                     else
//                                         ChargeAmount := TariffDetails."Charge Amount";
//                                 end;

//                             until TariffDetails.Next = 0;
//                         end;
//                     end;

//                     TChargeAmount += ChargeAmount;
//                 end;
//             until TransactionCharges.Next = 0;
//         end;
//         TCharges := TChargeAmount;
//     end;


//     procedure getTransactionCharges(StandingOrderHeader: Record UnknownRecord52185717)
//     var
//         TransactionCharges: Record 52185774;
//         ChargeAmount: Decimal;
//         TChargeAmount: Decimal;
//         TariffDetails: Record 52185777;
//         GenSetup: Record 52185689;
//     begin
//         //*Charges Posting

//         GenSetup.Get;

//         TCharges := 0;
//         TransactionCharges.Reset;
//         TransactionCharges.SetRange(TransactionCharges."Transaction Type", StandingOrderHeader."Transaction Type");
//         if TransactionCharges.Find('-') then begin
//             repeat

//                 if (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::Normal) then begin //OR
//                                                                                                                                             //(TransactionCharges."Transaction Charge Category"=TransactionCharges."Transaction Charge Category"::"Failed STO Charge") THEN BEGIN

//                     ChargeAmount := 0;
//                     if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" then
//                         ChargeAmount := (StandingOrderHeader.Amount * TransactionCharges."Percentage of Amount") * 0.01
//                     else
//                         ChargeAmount := TransactionCharges."Charge Amount";

//                     if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin
//                         TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
//                         TariffDetails.Reset;
//                         TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
//                         if TariffDetails.Find('-') then begin
//                             repeat
//                                 if (StandingOrderHeader.Amount >= TariffDetails."Lower Limit") and
//                                     (StandingOrderHeader.Amount <= TariffDetails."Upper Limit") then begin
//                                     if TariffDetails."Use Percentage" then
//                                         ChargeAmount := StandingOrderHeader.Amount * TariffDetails.Percentage * 0.01
//                                     else
//                                         ChargeAmount := TariffDetails."Charge Amount";
//                                 end;
//                             until TariffDetails.Next = 0;
//                         end;
//                     end;

//                     LineN += 1;
//                     GenJLine.Init;
//                     GenJLine."Journal Template Name" := JTemplate;
//                     GenJLine."Journal Batch Name" := JBatch;
//                     GenJLine."Line No." := LineN;
//                     GenJLine."Posting Date" := Today;
//                     GenJLine."Document No." := StandingOrderHeader."No.";
//                     GenJLine."External Document No." := StandingOrderHeader."Member No.";
//                     GenJLine."Account Type" := StandingOrderHeader."Source Account Type";
//                     GenJLine.Validate(GenJLine."Account No.", StandingOrderHeader."Source Account No.");
//                     GenJLine.Description := TransactionCharges.Description;
//                     GenJLine.Validate(GenJLine.Amount, ChargeAmount);
//                     GenJLine."Bal. Account Type" := GenJLine."bal. account type"::"G/L Account";
//                     GenJLine.Validate(GenJLine."Bal. Account No.", TransactionCharges."G/L Account");
//                     GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                     GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                     if GenJLine.Amount <> 0 then
//                         GenJLine.Insert;


//                     if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
//                         (TransactionCharges."Recover Excise Duty" = true) then begin
//                         //Excise
//                         LineN += 1;
//                         GenJLine.Init;
//                         GenJLine."Journal Template Name" := JTemplate;
//                         GenJLine."Journal Batch Name" := JBatch;
//                         GenJLine."Line No." := LineN;
//                         GenJLine."Posting Date" := Today;
//                         GenJLine."Document No." := StandingOrderHeader."No.";
//                         GenJLine."External Document No." := StandingOrderHeader."Member No.";
//                         GenJLine."Account Type" := StandingOrderHeader."Source Account Type";
//                         GenJLine.Validate(GenJLine."Account No.", StandingOrderHeader."Source Account No.");
//                         GenJLine.Description := 'Excise Duty';//TransactionCharges.Description;
//                         GenJLine.Validate(GenJLine.Amount, (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01);
//                         GenJLine."Bal. Account Type" := GenJLine."bal. account type"::"G/L Account";
//                         GenJLine.Validate(GenJLine."Bal. Account No.", GenSetup."Excise Duty G/L");
//                         GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                         GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                         if GenJLine.Amount <> 0 then
//                             GenJLine.Insert;
//                         //Excise
//                     end;
//                     TChargeAmount += ChargeAmount;
//                 end;
//             until TransactionCharges.Next = 0;
//         end;
//         TCharges := TChargeAmount;
//     end;


//     procedure InitializeStandingOrderRegister(RNo: Code[10]; RDateProcessed: Date; RDocNo: Code[10]; RNoSeries: Code[10]; RSourceAccountNo: Code[20]; RSourceAccountName: Text; RMemberNo: Code[20]; RStaffNo: Code[10]; RPartialDeduction: Boolean; RDeductionStatus: Option " ",Successfull,"Partial Deduction",Failed; RDeductionAmount: Decimal; RAmountDeducted: Decimal; RStartDate: Date; RDuration: DateFormula; RFrequency: DateFormula; REndDate: Date; Rremarks: Text; Reft: Boolean; RTransferEft: Boolean; STONo: Code[20])
//     var
//         LineNo: Code[10];
//         StandingOrdSRegister: Record 52185719;
//     begin
//         StandingOrdSRegister.Init;
//         StandingOrdSRegister."No." := RNo;
//         StandingOrdSRegister."Date Processed" := RDateProcessed;
//         StandingOrdSRegister."Document No." := RDocNo;
//         StandingOrdSRegister."No. Series" := RNoSeries;
//         StandingOrdSRegister."Source Account No." := RSourceAccountNo;
//         StandingOrdSRegister."Source Account Name" := RSourceAccountName;
//         StandingOrdSRegister."Member No" := RMemberNo;
//         StandingOrdSRegister."Staff/Payroll No." := RStaffNo;
//         StandingOrdSRegister."Allow Partial Deduction" := RPartialDeduction;
//         StandingOrdSRegister."Deduction Status" := RDeductionStatus;
//         StandingOrdSRegister.Amount := RDeductionAmount;
//         StandingOrdSRegister."Amount Deducted" := RAmountDeducted;
//         StandingOrdSRegister."Effective/Start Date" := RStartDate;
//         StandingOrdSRegister.Duration := RDuration;
//         StandingOrdSRegister.Frequency := RFrequency;
//         StandingOrdSRegister."End Date" := REndDate;
//         StandingOrdSRegister.Remarks := Rremarks;
//         StandingOrdSRegister.EFT := Reft;
//         StandingOrdSRegister."Transfered to EFT" := RTransferEft;
//         StandingOrdSRegister."Standing Order No." := STONo;
//         StandingOrdSRegister.Insert(true);
//     end;


//     procedure getTransactionChargesFailedSTO(StandingOrderHeader: Record UnknownRecord52185717)
//     var
//         TransactionCharges: Record 52185774;
//         ChargeAmount: Decimal;
//         TChargeAmount: Decimal;
//         TariffDetails: Record 52185777;
//         GenSetup: Record 52185689;
//     begin
//         //*Charges Posting

//         GenSetup.Get;

//         TCharges := 0;
//         TransactionCharges.Reset;
//         TransactionCharges.SetRange(TransactionCharges."Transaction Type", StandingOrderHeader."Transaction Type");
//         if TransactionCharges.Find('-') then begin
//             repeat

//                 if /*(TransactionCharges."Transaction Charge Category"=TransactionCharges."Transaction Charge Category"::Normal) OR*/
//                 (TransactionCharges."Transaction Charge Category" = TransactionCharges."transaction charge category"::"Failed STO Charge") then begin

//                     ChargeAmount := 0;
//                     if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" then
//                         ChargeAmount := (StandingOrderHeader.Amount * TransactionCharges."Percentage of Amount") * 0.01
//                     else
//                         ChargeAmount := TransactionCharges."Charge Amount";

//                     if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin
//                         TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
//                         TariffDetails.Reset;
//                         TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
//                         if TariffDetails.Find('-') then begin
//                             repeat
//                                 if (StandingOrderHeader.Amount >= TariffDetails."Lower Limit") and
//                                     (StandingOrderHeader.Amount <= TariffDetails."Upper Limit") then begin
//                                     if TariffDetails."Use Percentage" then
//                                         ChargeAmount := StandingOrderHeader.Amount * TariffDetails.Percentage * 0.01
//                                     else
//                                         ChargeAmount := TariffDetails."Charge Amount";
//                                 end;
//                             until TariffDetails.Next = 0;
//                         end;
//                     end;

//                     LineN += 1;
//                     GenJLine.Init;
//                     GenJLine."Journal Template Name" := JTemplate;
//                     GenJLine."Journal Batch Name" := JBatch;
//                     GenJLine."Line No." := LineN;
//                     GenJLine."Posting Date" := Today;
//                     GenJLine."Document No." := StandingOrderHeader."No.";
//                     GenJLine."External Document No." := StandingOrderHeader."Member No.";
//                     GenJLine."Account Type" := StandingOrderHeader."Source Account Type";
//                     GenJLine.Validate(GenJLine."Account No.", StandingOrderHeader."Source Account No.");
//                     GenJLine.Description := TransactionCharges.Description;
//                     GenJLine.Validate(GenJLine.Amount, ChargeAmount);
//                     GenJLine."Bal. Account Type" := GenJLine."bal. account type"::"G/L Account";
//                     GenJLine.Validate(GenJLine."Bal. Account No.", TransactionCharges."G/L Account");
//                     GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                     GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                     if GenJLine.Amount <> 0 then
//                         GenJLine.Insert;


//                     if (TransactionCharges."Transaction Charge Category" <> TransactionCharges."transaction charge category"::"Stamp Duty") and
//                         (TransactionCharges."Recover Excise Duty" = true) then begin
//                         //Excise
//                         LineN += 1;
//                         GenJLine.Init;
//                         GenJLine."Journal Template Name" := JTemplate;
//                         GenJLine."Journal Batch Name" := JBatch;
//                         GenJLine."Line No." := LineN;
//                         GenJLine."Posting Date" := Today;
//                         GenJLine."Document No." := StandingOrderHeader."No.";
//                         GenJLine."External Document No." := StandingOrderHeader."Member No.";
//                         GenJLine."Account Type" := StandingOrderHeader."Source Account Type";
//                         GenJLine.Validate(GenJLine."Account No.", StandingOrderHeader."Source Account No.");
//                         GenJLine.Description := 'Excise Duty';//TransactionCharges.Description;
//                         GenJLine.Validate(GenJLine.Amount, (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01);
//                         GenJLine."Bal. Account Type" := GenJLine."bal. account type"::"G/L Account";
//                         GenJLine.Validate(GenJLine."Bal. Account No.", GenSetup."Excise Duty G/L");
//                         GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", GlobalDim1);
//                         GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", GlobalDim2);
//                         if GenJLine.Amount <> 0 then
//                             GenJLine.Insert;
//                         //Excise
//                     end;
//                     TChargeAmount += ChargeAmount;
//                 end;
//             until TransactionCharges.Next = 0;
//         end;
//         TCharges := TChargeAmount;

//     end;
// }
