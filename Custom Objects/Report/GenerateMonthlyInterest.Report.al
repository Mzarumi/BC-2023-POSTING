// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185756 "Generate Monthly Interest"
// {
//     ProcessingOnly = true;

//     dataset
//     {
//         dataitem(Loans; Loans)
//         {
//             CalcFields = "Outstanding Balance", "Outstanding Bills", "Outstanding Interest";
//             //DataItemTableView = where("Loan Product Type" = filter(<> 123 | 126), Posted = filter(Yes), "Outstanding Balance" = filter(> 0));
//             RequestFilterFields = "Loan No.", "Member No.", "Loan Product Type", "Outstanding Balance", "Outstanding Bills", "Outstanding Interest", "Disbursement Date", "Employer Code";
//             column(ReportForNavId_4645; 4645)
//             {
//             }

//             trigger OnAfterGetRecord()
//             var
//                 UserSetup: Record "User Setup";
//             begin
//                 GeneralSetUp.Get();
//                 Members.Reset;
//                 Members.SetRange("No.", Loans."Member No.");
//                 Members.SetFilter(Status, '<>%1', Members.Status::Deceased);
//                 if Members.Find('-') then begin


//                     Dim1 := Loans."Global Dimension 1 Code";
//                     Dim2 := Loans."Global Dimension 2 Code";

//                     if Dim2 = '' then begin
//                         UserSetup.Reset;
//                         UserSetup.SetRange("User ID", Loans."Posted By");
//                         if UserSetup.FindFirst then begin
//                             Dim1 := UserSetup."Global Dimension 1 Code";
//                             Dim2 := UserSetup."Global Dimension 2 Code";
//                         end;
//                     end;

//                     if Dim2 = '' then begin
//                         UserSetup.Reset;
//                         UserSetup.SetRange("User ID", UserId);
//                         if UserSetup.FindFirst then begin
//                             Dim1 := UserSetup."Global Dimension 1 Code";
//                             Dim2 := UserSetup."Global Dimension 2 Code";
//                         end;
//                     end;






//                     CurrDate := Today;
//                     Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Bills", Loans."Outstanding Interest", "Loans Category-SASRA");

//                     CurrMonth := CalcDate('+CM', CurrDate);
//                     FirstMonthDate := CalcDate('CM', CurrDate);
//                     FirstDate := CalcDate('-CM', CurrDate);
//                     MidDate := CalcDate('15D', FirstDate);
//                     EndDate := CalcDate('+1M', CurrMonth);
//                     LastMonthDate := CalcDate('CM', FirstMonthDate);
//                     FirstDay := CalcDate('-2M', LastMonthDate);
//                     Principle := 0;
//                     IntCharged := 0;
//                     MonthDays := 0;
//                     LoanAmount := "Approved Amount";
//                     Loans.CalcFields("Outstanding Balance");
//                     if Loans."Loans Category-SASRA" < GeneralSetUp."Allowed Loan Categories" then begin
//                         RecBuffer.Reset;
//                         RecBuffer.SetRange(RecBuffer."No.", "Document No.");
//                         if RecBuffer.Find('-') then begin
//                             if "Document No." <> RecBuffer."No." then
//                                 Error(Text001);
//                             if RecBuffer.Status <> RecBuffer.Status::Open then
//                                 Error('You canot generate entries since the document is already %1', RecBuffer.Status);
//                             InterestDuePeriod.Get(RecBuffer."Interest Due Date");
//                             MonthDays := ((CalcDate('CM', InterestDuePeriod."Interest Due Date")) - InterestDuePeriod."Interest Due Date") + 1;
//                             if LoanType.Get(Loans."Loan Product Type") then begin
//                                 if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Straight Line" then
//                                     IntCharged := ROUND(((Interest * 1) / 1200) * LoanAmount, 1, '>')
//                                 else
//                                     IntCharged := ROUND("Outstanding Balance" * ((Interest * 1) / 1200), 1, '>');
//                                 if Memb.Get(Loans."Member No.") then begin
//                                     if Memb.Status = Memb.Status::Deceased then
//                                         IntCharged := 0;
//                                 end;
//                                 LoanType.Get(Loans."Loan Product Type");
//                                 if LoanType."No Interest Bills" = true then
//                                     IntCharged := 0;

//                                 LoansInterest.Init;
//                                 LoansInterest.No := "Document No.";
//                                 LoansInterest."Loan No." := Loans."Loan No.";
//                                 LoansInterest.TestField(LoansInterest."Loan No.");
//                                 LoansInterest."Account Type" := LoansInterest."account type"::Credit;
//                                 LoansInterest."Account No" := Loans."Loan Account";
//                                 LoansInterest.TestField(LoansInterest."Account No");
//                                 LoansInterest."Interest Date" := RecBuffer."Posting Date";//TODAY;
//                                 LoansInterest."Issued Date" := Loans."Disbursement Date";
//                                 //Grace Period Interest
//                                 if Format(LoanType."Grace Period - Interest") <> '' then begin
//                                     if CalcDate(LoanType."Grace Period - Interest", Loans."Disbursement Date") <= Today then
//                                         LoansInterest."Interest Bill" := IntCharged else
//                                         LoansInterest."Interest Bill" := 0;
//                                 end else begin
//                                     LoansInterest."Interest Bill" := IntCharged;
//                                 end;

//                                 if Loans."Outstanding Balance" > (Loans.Repayment - IntCharged) then
//                                     Principle := (Loans.Repayment - IntCharged)
//                                 else
//                                     Principle := Loans."Outstanding Balance";

//                                 if (Principle + Loans."Outstanding Bills") > Loans."Outstanding Balance" then
//                                     Principle := Loans."Outstanding Balance" - Loans."Outstanding Bills";
//                                 LoansInterest."Repayment Amount" := Principle;

//                                 if Format(LoanType."Grace Period - Principle") <> '' then begin
//                                     if CalcDate(LoanType."Grace Period - Principle", Loans."Disbursement Date") <= Today then
//                                         LoansInterest."Repayment Bill" := (Principle) else
//                                         LoansInterest."Repayment Bill" := 0;
//                                 end else begin
//                                     LoansInterest."Repayment Bill" := Principle;
//                                 end;
//                                 if LoansInterest."Repayment Bill" < 0 then
//                                     LoansInterest."Repayment Bill" := 0;
//                                 if Loans.Installments <> 0 then
//                                     LoansInterest."Appraisal Amount" := Loans."Appraisal Fee" / Loans.Installments;
//                                 LoansInterest.Description := RecBuffer.Description;
//                                 LoansInterest."Interest Amount" := IntCharged;
//                                 LoansInterest."Shortcut Dimension 1 Code" := Dim1;
//                                 LoansInterest."Shortcut Dimension 2 Code" := Dim2;
//                                 LoansInterest."Monthly Repayment" := LoansInterest."Repayment Bill" + LoansInterest."Interest Bill";
//                                 Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Bills", Loans."Outstanding Interest");
//                                 LoansInterest."Outstanding Balance" := Loans."Outstanding Balance";
//                                 LoansInterest."Outstanding Interest" := Loans."Outstanding Interest";
//                                 LoansInterest."Outstanding Bill" := Loans."Outstanding Bills";
//                                 LoansInterest."Loan Product type" := Loans."Loan Product Type";
//                                 //LoansInterest."Repayment Bill":=Principle;
//                                 if LoanType.Get(Loans."Loan Product Type") then begin
//                                     LoansInterest."Bal. Account Type" := LoansInterest."bal. account type"::"G/L Account";
//                                     LoansInterest."Bill Account" := LoanType."Billed Account";
//                                     if (Loans."Loans Category-SASRA" = Loans."loans category-sasra"::Perfoming) or (Loans."Loans Category-SASRA" = Loans."loans category-sasra"::Watch) then
//                                         LoansInterest."Bal. Account No." := LoanType."Loan Interest Account [G/L]" else begin
//                                         LoansInterest."Bal. Account No." := LoanType."Suspend Interest Account [G/L]";
//                                         //Insert Entries to buffer
//                                         SuspendedInterestAccounts.Init;
//                                         SuspendedInterestAccounts."Loan No." := Loans."Loan No.";
//                                         SuspendedInterestAccounts."Loan Product type" := LoanType."Product ID";
//                                         SuspendedInterestAccounts."Loans Category-SASRA" := Loans."Loans Category-SASRA";
//                                         SuspendedInterestAccounts."Interest Amount" := IntCharged;
//                                         SuspendedInterestAccounts."Interest Date" := RecBuffer."Posting Date";
//                                         SuspendedInterestAccounts."Issued Date" := Loans."Disbursement Date";
//                                         SuspendedInterestAccounts.Insert(true);
//                                     end;
//                                 end;
//                                 LoansInterest.TestField(LoansInterest."Bal. Account No.");
//                                 if CustMember.Get(Loans."Loan Account") then begin
//                                     //LoansInterest."Shortcut Dimension 1 Code":=CustMember."Global Dimension 1 Code";
//                                     //LoansInterest."Shortcut Dimension 2 Code":=CustMember."Global Dimension 2 Code";
//                                     LoansInterest.Status := CustMember.Status;
//                                     LoansInterest.Blocked := CustMember.Blocked;
//                                     if LoansInterest."Repayment Bill" < 0 then
//                                         LoansInterest."Repayment Bill" := 0;
//                                 end;
//                                 if (LoansInterest."Monthly Repayment" <> 0) and ((LoansInterest."Outstanding Balance" + LoansInterest."Outstanding Interest" + LoansInterest."Appraisal Amount") <> 0) then
//                                     LoansInterest.Insert;
//                             end;
//                         end;
//                     end;
//                 end;
//             end;

//             trigger OnPostDataItem()
//             begin
//                 Message('Process Complete');
//                 //LoansInterest.SETFILTER(No,"Document No.");
//                 Page.Run(52185879);//,LoansInterest,"Document No.");
//             end;

//             trigger OnPreDataItem()
//             begin
//                 if "Document No." = '' then
//                     Error('Document No. Must have a Value')
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field("Document No."; "Document No.")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'No.';
//                 }
//                 field(PDate; PDate)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Posting Date';
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
//         RecBuffLines.Reset;
//         RecBuffLines.SetRange(RecBuffLines.No, "Document No.");
//         if RecBuffLines.Find('-') then
//             RecBuffLines.DeleteAll;
//     end;

//     var
//         LoanType: Record 52185690;
//         Gnljnline: Record "Gen. Journal Line";
//         LineNo: Integer;
//         DocNo: Code[20];
//         PDate: Date;
//         LoansCaptionLbl: label 'Loans';
//         CurrReport_PAGENOCaptionLbl: label 'Page';
//         VarienceCaptionLbl: label 'Varience';
//         "Document No.": Code[20];
//         RecBuffer: Record 52185860;
//         RecBuffLines: Record 52185859;
//         LoanAmount: Decimal;
//         CustMember: Record 52185731;
//         Text001: label 'Document No. Must be equal to No.';
//         CurrDate: Date;
//         FirstMonthDate: Date;
//         CurrMonth: Date;
//         MidDate: Date;
//         EndDate: Date;
//         LastMonthDate: Date;
//         FirstDay: Date;
//         FirstDate: Date;
//         RecBuffers: Record 52185860;
//         LoansInterest: Record 52185859;
//         IntCharged: Decimal;
//         Principle: Decimal;
//         SuspendedInterestAccounts: Record 52185854;
//         MonthDays: Integer;
//         InterestDuePeriod: Record 52185861;
//         Members: Record "Members";
//         GeneralSetUp: Record 52185689;
//         Memb: Record "Members";
//         Dim1: Code[50];
//         Dim2: Code[50];
// }
