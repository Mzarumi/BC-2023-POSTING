// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185659 "SASRA Loan Categorization"
// {
//     ProcessingOnly = true;

//     dataset
//     {
//         dataitem(Loans; Loans)
//         {
//             CalcFields = "Outstanding Balance", "Outstanding Interest", "Outstanding Bills";
//             //DataItemTableView = sorting("Loan No.") where("Dummy Appraisal" = filter(No));
//             //RequestFilterFields = "Loan No.", "Date Filter", "Member No.";
//             column(ReportForNavId_1; 1)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 AddOnRepayments := 0;
//                 if Loans."Loan Product Type" = '' then CurrReport.Skip;
//                 ProductFactory.Get(Loans."Loan Product Type");
//                 if ProductFactory."Interest Recovered Upfront" then
//                     AddOnRepayments := ROUND((ProductFactory."Interest Rate (Max.)" / 1200) * Loans."Approved Amount", 1, '<');

//                 SASRACategory.Reset;
//                 SASRACategory.SetRange("Loan No.", "Loan No.");
//                 if SASRACategory.Find('-') then
//                     SASRACategory.DeleteAll;

//                 CountMonths := 0;
//                 NoDays := 0;
//                 if Loans.Repayment <> 0 then begin
//                     if Loans."Loan Span" = Loans."loan span"::"Long Term" then begin
//                         CountMonths := ROUND((Loans."Outstanding Bills"/*+Loans."Outstanding Interest"*/) / (Loans.Repayment), 0.001, '>');
//                         if CountMonths < 0 then
//                             CountMonths := 0;
//                     end else
//                         if Loans."Loan Span" = Loans."loan span"::"Short Term" then begin
//                             if Loans.Repayment = 0 then
//                                 CountMonths := ROUND((Loans."Outstanding Bills") / (Loans."Loan Principle Repayment" + AddOnRepayments), 0.001, '>')
//                             else
//                                 CountMonths := ROUND((Loans."Outstanding Bills") / (Loans.Repayment + AddOnRepayments), 0.001, '>');

//                             if CountMonths < 0 then
//                                 CountMonths := 0;
//                         end else begin
//                             CountMonths := ROUND((Loans."Outstanding Bills"/*+Loans."Outstanding Interest"*/) / (Loans.Repayment + AddOnRepayments), 0.001, '>');
//                             if CountMonths < 0 then
//                                 CountMonths := 0;
//                         end;

//                     if (Loans."Loan Product Type" = '126') or (Loans."Loan Product Type" = '123') then begin
//                         if Loans."Outstanding Balance" > 0 then begin
//                             CreditLedgerEntry.Reset;
//                             CreditLedgerEntry.SetRange("Customer No.", Loans."Loan Account");
//                             CreditLedgerEntry.SetRange("Loan No", Loans."Loan No.");
//                             //CreditLedgerEntry.SETFILTER("Posting Date",Loans.GETFILTER("Date Filter"));
//                             CreditLedgerEntry.SetRange("Transaction Type", CreditLedgerEntry."transaction type"::Loan);
//                             if CreditLedgerEntry.Find('+') then begin
//                                 NoDays := Today - CreditLedgerEntry."Posting Date";
//                             end else
//                                 // IF CreditLedgerEntry."Posting Date"=0D THEN
//                                 NoDays := Today - Loans."Disbursement Date";

//                             CountMonths := ROUND(NoDays / 30, 0.001, '>');
//                             if CountMonths < 0 then
//                                 CountMonths := 0;
//                         end;
//                     end;
//                     //ERROR('%1 %2 and %3',NoDays,Loans.GETRANGEMAX("Date Filter"),CountMonths);
//                     //MESSAGE('Bills %1 Int %2 Rep %3 Months %4',Loans."Outstanding Bills",Loans."Outstanding Interest",Loans.Repayment,CountMonths);

//                     if CountMonths < 1 then
//                         Loans."Loans Category-SASRA" := Loans."loans category-sasra"::Perfoming;

//                     if CountMonths >= 1 then
//                         Loans."Loans Category-SASRA" := Loans."loans category-sasra"::Watch;

//                     if (CountMonths >= 2) and (CountMonths < 7) then
//                         Loans."Loans Category-SASRA" := Loans."loans category-sasra"::Substandard;

//                     if (CountMonths >= 7) and (CountMonths <= 12) then
//                         Loans."Loans Category-SASRA" := Loans."loans category-sasra"::Doubtful;

//                     if CountMonths > 12 then
//                         Loans."Loans Category-SASRA" := Loans."loans category-sasra"::Loss;


//                     // CASE CountMonths OF
//                     // 0:
//                     // Loans."Loans Category-SASRA":=Loans."Loans Category-SASRA"::Performing;
//                     // 1:
//                     // Loans."Loans Category-SASRA":=Loans."Loans Category-SASRA"::Performing;
//                     // 2:
//                     // Loans."Loans Category-SASRA":=Loans."Loans Category-SASRA"::Watch;
//                     // 3:
//                     // Loans."Loans Category-SASRA":=Loans."Loans Category-SASRA"::Substandard;
//                     // 4:
//                     // Loans."Loans Category-SASRA":=Loans."Loans Category-SASRA"::Substandard;
//                     // 5:
//                     // Loans."Loans Category-SASRA":=Loans."Loans Category-SASRA"::Substandard;
//                     // 6:
//                     // Loans."Loans Category-SASRA":=Loans."Loans Category-SASRA"::Substandard;
//                     // 7:
//                     // Loans."Loans Category-SASRA":=Loans."Loans Category-SASRA"::Doubtful;
//                     // 8:
//                     // Loans."Loans Category-SASRA":=Loans."Loans Category-SASRA"::Doubtful;
//                     // 9:
//                     // Loans."Loans Category-SASRA":=Loans."Loans Category-SASRA"::Doubtful;
//                     // 10:
//                     // Loans."Loans Category-SASRA":=Loans."Loans Category-SASRA"::Doubtful;
//                     // 11:
//                     // Loans."Loans Category-SASRA":=Loans."Loans Category-SASRA"::Doubtful;
//                     // 12:
//                     // Loans."Loans Category-SASRA":=Loans."Loans Category-SASRA"::Doubtful;
//                     // ELSE
//                     // Loans."Loans Category-SASRA":=Loans."Loans Category-SASRA"::Loss
//                     // END
//                 end else
//                     Loans."Loans Category-SASRA" := Loans."loans category-sasra"::Loss;
//                 Counter := Counter + 1;

//                 if Loans.Posted = false then Loans."Loans Category-SASRA" := Loans."loans category-sasra"::Perfoming;


//                 ProgressWindow.Update(1, Counter);
//                 SASRACategory.Init;
//                 SASRACategory."Loan No." := Loans."Loan No.";
//                 SASRACategory."Loans Category-SASRA" := Loans."Loans Category-SASRA";
//                 SASRACategory.Insert;

//             end;

//             trigger OnPostDataItem()
//             begin
//                 ProgressWindow.Close;
//                 Message('Done!!!');
//             end;

//             trigger OnPreDataItem()
//             begin

//                 Counter := 0;
//                 ProgressWindow.Open('Processing Loan No. #1#######');
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field(PostingDate; PostingDate)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Posting Date';
//                     Visible = false;
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

//     trigger OnPreReport()
//     begin
//         UserSetup.Get(UserId);
//         if UserSetup."Run Sasra Report" = false then
//             Error(Text001);
//     end;

//     var
//         SaccoAcc: Record 52185731;
//         AvailableBal: Decimal;
//         SavAcc: Code[20];
//         LineNo: Integer;
//         GenJournalLine: Record "Gen. Journal Line";
//         DActivity: Code[10];
//         PostingDate: Date;
//         ProdF: Record 52185825;
//         GenSetup: Record 52185688;
//         BillAmount: Decimal;
//         InterestAmount: Decimal;
//         CountMonths: Decimal;
//         ProgressWindow: Dialog;
//         Counter: Integer;
//         SASRACategory: Record 52185709;
//         NoDays: Integer;
//         CreditLedgerEntry: Record 52185733;
//         UserSetup: Record "User Setup";
//         Text001: label 'You do not have permission to run this report kindly contact Credit Section staff on the said loan';
//         ProductFactory: Record 52185690;
//         AddOnRepayments: Integer;
// }
