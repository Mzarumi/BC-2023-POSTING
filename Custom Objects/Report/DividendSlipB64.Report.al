// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185880 "Dividend Slip B64"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Dividend Slip B64.rdlc';

//     dataset
//     {
//         dataitem(DividendProgression; UnknownTable52185713)
//         {
//             RequestFilterFields = "Member No", Year, "Start Date", "End Date", "Employer Code";
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(SaccoName; SaccoName)
//             {
//             }
//             column(SaccoAddress; SaccoAddress)
//             {
//             }
//             column(MemberName; MemberName)
//             {
//             }
//             column(MemberAccountName; MemberAccountName)
//             {
//             }
//             column(MemberAccountNumber; MemberAccountNumber)
//             {
//             }
//             column(Slogan; Slogan)
//             {
//             }
//             column(SaccoPhone; SaccoPhone)
//             {
//             }
//             column(DateIssued; DateIssued)
//             {
//             }
//             column(memberPhone; MemberPhone)
//             {
//             }
//             column(Email; Email)
//             {
//             }
//             column(Website; Website)
//             {
//             }
//             column(StartDate_DividendProgression; DividendProgression."End Date")
//             {
//             }
//             column(ProductType_DividendProgression; DividendProgression."Product Type")
//             {
//             }
//             column(ProductName_DividendProgression; DividendProgression."Product Name")
//             {
//             }
//             column(QualifyingShares_DividendProgression; DividendProgression."Qualifying Shares")
//             {
//             }
//             column(Shares_DividendProgression; DividendProgression.Shares)
//             {
//             }
//             column(GrossDividends_DividendProgression; DividendProgression."Gross Dividends")
//             {
//             }
//             column(WitholdingTax_DividendProgression; DividendProgression."Witholding Tax")
//             {
//             }
//             column(NetDividends_DividendProgression; DividendProgression."Net Dividends")
//             {
//             }
//             column(No_Members; DividendProgression."Member No")
//             {
//             }
//             column(ElectrolZone; ElectrolZone)
//             {
//             }
//             column(Maddress; Maddress)
//             {
//             }
//             column(Mcity; Mcity)
//             {
//             }
//             column(MPayrollNo; MPayrollNo)
//             {
//             }
//             column(DivRate; DivRate)
//             {
//             }
//             column(IntRate; IntRate)
//             {
//             }
//             column(WthTax; WthTax)
//             {
//             }
//             column(Status; Status)
//             {
//             }
//             column(Retained; Retained)
//             {
//             }
//             column(RetainedTotal; RetainedTotal)
//             {
//             }
//             column(rates; rates)
//             {
//             }
//             column(RateRetained; RateRetained)
//             {
//             }
//             column(LastContr; LastContr)
//             {
//             }
//             column(LastDate; LastDate)
//             {
//             }
//             column(EndDate; EndDate)
//             {
//             }
//             column(ProcessingYear; ProcessingYear)
//             {
//             }
//             column(ProductName; ProductName)
//             {
//             }
//             column(AmountPaid; AmountPaid)
//             {
//             }

//             trigger OnAfterGetRecord()
//             var
//                 DocumentNo: Code[10];
//             begin
//                 ProcessingYear := DividendProgression.Year;
//                 EndDate := Format(Dmy2date(31, 12, ProcessingYear));

//                 AmountPaid := 0;
//                 DocumentNo := 'DIV-' + Format(ProcessingYear);
//                 CreditLedgerEntry.Reset;
//                 CreditLedgerEntry.SetRange("Document No.", DocumentNo);
//                 CreditLedgerEntry.SetRange("Member No.", DividendProgression."Member No");
//                 CreditLedgerEntry.SetRange("Transaction Type", CreditLedgerEntry."transaction type"::Repayment);
//                 if CreditLedgerEntry.FindFirst then begin
//                     repeat
//                         AmountPaid += CreditLedgerEntry.Amount;
//                     until CreditLedgerEntry.Next = 0;
//                 end;

//                 AmountPaid := Abs(AmountPaid);

//                 ProductFactory.Get(DividendProgression."Product Type");
//                 ProductName := ProductFactory."Product Description";
//                 Members.Reset;
//                 Members.SetRange("No.", DividendProgression."Member No");
//                 if Members.Find('-') then begin
//                     ElectrolZone := Members."Region Code";
//                     //Department:=
//                     Maddress := Members."Post Code";
//                     Mcity := Members.City;
//                     MemberName := Members.Name;
//                     MemberAccountNumber := Members."No.";
//                     MPayrollNo := Members."Payroll/Staff No.";
//                     Status := Members.Status;
//                 end;

//                 Retained := 0;
//                 RetainedTotal := 0;
//                 rates := 0;


//                 if ProductFactory.Get(DividendProgression."Product Type") then begin
//                     if ProductFactory."Interest Rate (Max.)" <> 0 then
//                         DivRate := ProductFactory."Interest Rate (Max.)" / 100;
//                     if ProductFactory."Interest Rate (Min.)" <> 0 then
//                         DivRate := ProductFactory."Interest Rate (Min.)" / 100;
//                     if ProductFactory."WithHolding Tax" <> 0 then
//                         WthTax := ROUND(ProductFactory."WithHolding Tax", 0.5, '>');

//                     if ProductFactory."Product Category" = ProductFactory."product category"::"Share Capital" then begin
//                         if Members.Status = Members.Status::Active then
//                             DivRate := 1
//                         else
//                             //DivRate:=0;
//                             DivRate := ProductFactory."Interest Rate (Max.)";
//                         DividendProgression1.Reset;
//                         DividendProgression1.SetRange("Member No", Members."No.");
//                         DividendProgression1.SetRange("Product Type", ProductFactory."Product ID");
//                         if DividendProgression1.Find('-') then begin
//                             DividendProgression1.CalcSums("Net Dividends");
//                             Retained := 0;//((DividendProgression1."Net Dividends")/DivRate);
//                             ShareCp := Retained;
//                             WthTax := ROUND(ProductFactory."WithHolding Tax", 0.05, '=');
//                             RateRetained := '100 % of Net Dividends ';
//                             rates := ProductFactory."Interest Rate (Max.)";
//                         end;
//                     end else
//                         if ProductFactory."Product Category" = ProductFactory."product category"::"Deposit Contribution" then begin
//                             DividendProgression1.Reset;
//                             DividendProgression1.SetRange("Member No", Members."No.");
//                             DividendProgression1.SetRange("Product Type", ProductFactory."Product ID");
//                             if DividendProgression1.Find('-') then begin
//                                 DividendProgression1.CalcSums("Net Dividends");
//                                 Retained := 0;//((DividendProgression1."Net Dividends")/DivRate)/100;
//                                 DepContr := Retained;
//                                 WthTax := ROUND(ProductFactory."WithHolding Tax", 0.5, '>');
//                                 rates := ROUND(ProductFactory."Interest Rate (Max.)", 0.05, '=');
//                                 RateRetained := '';//'1/7 % of Net Interest';
//                             end;

//                         end;

//                     RetainedTotal := 0;//DepContr+ShareCp;
//                 end;

//                 LastContr := 0;
//                 CurrentYear := (Date2dmy(Today, 3)) - 1;
//                 SLedgerEntry.SetRange(SLedgerEntry."Customer No.", DividendProgression."Account No");
//                 SLedgerEntry.SetFilter("Posting Date", '%1..%2', Dmy2date(1, 12, CurrentYear), Dmy2date(31, 12, CurrentYear));
//                 if SLedgerEntry.Find('-') then begin
//                     SLedgerEntry.CalcSums(Amount);
//                     LastContr := -SLedgerEntry.Amount;
//                 end;

//                 LastDate := Dmy2date(31, 12, CurrentYear);
//             end;

//             trigger OnPreDataItem()
//             begin
//                 if DividendProgression.GetFilter(DividendProgression.Year) = '' then
//                     DividendProgression.Year := (Date2dmy(Today, 3)) - 1
//                 else
//                     DividendProgression.Year := DividendProgression.Year;
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

//     trigger OnPreReport()
//     begin
//         CompanyInformation.Get;
//         SaccoName := CompanyInformation.Name;
//         SaccoAddress := CompanyInformation.Address;
//         SaccoPhone := CompanyInformation."Phone No.";
//         Slogan := 'Your Future Our Concern';
//         Email := CompanyInformation."E-Mail";
//         Website := CompanyInformation."Home Page";
//         DateIssued := MemPort.FormatDate(Today);
//     end;

//     var
//         CompanyInformation: Record "Company Information";
//         SaccoName: Text;
//         SaccoAddress: Text;
//         SaccoPhone: Text;
//         Slogan: Text;
//         Email: Text;
//         Website: Text;
//         DateIssued: Text;
//         MemberPhone: Text;
//         MemberAccountNumber: Code[50];
//         MemberAccountName: Text;
//         MemberName: Text[100];
//         MPayrollNo: Code[50];
//         MIDNumber: Code[50];
//         MEmployer: Code[50];
//         Members: Record "Members";
//         ElectrolZone: Text;
//         Department: Code[20];
//         Section: Code[20];
//         Maddress: Text[20];
//         Mcity: Text[20];
//         ProductFactory: Record 52185690;
//         DivRate: Decimal;
//         IntRate: Decimal;
//         WthTax: Decimal;
//         Status: Option " ",New,Active,Dormant,Frozen,"Withdrawal Application",Withdrawn,Deceased,Defaulter,Closed;
//         Retained: Decimal;
//         DividendProgression1: Record 52185713;
//         RetainedTotal: Decimal;
//         ShareCp: Decimal;
//         DepContr: Decimal;
//         rates: Decimal;
//         RateRetained: Text;
//         SLedgerEntry: Record 52185732;
//         CurrentYear: Integer;
//         LastContr: Decimal;
//         LastDate: Date;
//         ProcessingYear: Integer;
//         EndDate: Text;
//         MemPort: Codeunit 52185428;
//         ProductName: Text;
//         DocumentNo: Code[30];
//         CreditLedgerEntry: Record 52185733;
//         AmountPaid: Decimal;
// }
