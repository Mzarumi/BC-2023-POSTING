// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52186010 "Proposed Resolutions"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Proposed Resolutions.rdlc';

//     dataset
//     {
//         dataitem(52186056;52186056)
//         {
//             RequestFilterFields = Year, Month;
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(PrintedBy; PrintedBy)
//             {
//             }
//             column(PrintedAt; PrintedAt)
//             {
//             }
//             column(BookNo; BookNo)
//             {
//             }
//             column(TotalBranchMembers; TotalBranchMembers)
//             {
//             }
//             column(BranchName; BranchName)
//             {
//             }
//             column(MonthText; MonthText)
//             {
//             }
//             column(Date; Date)
//             {
//             }
//             column(Defaulters; Defaulters)
//             {
//             }
//             column(MortgageLoan; MortgageLoan)
//             {
//             }
//             column(NewLoans; NewLoans)
//             {
//             }
//             column(NewMembers; NewMembers)
//             {
//             }
//             column(Rejoiner; Rejoiner)
//             {
//             }
//             column(SalaryAccount; SalaryAccount)
//             {
//             }
//             column(TotoAccounts; TotoAccounts)
//             {
//             }
//             column(VariationUp; VariationUp)
//             {
//             }
//             column(WafanisiAccounts; WafanisiAccounts)
//             {
//             }
//             column(Withdrawals; Withdrawals)
//             {
//             }
//             column(ElectoralRegion_DelegatesMinutesHeader; "Delegates Minutes Header"."Electoral Region")
//             {
//             }
//             column(ElectoralName_DelegatesMinutesHeader; "Delegates Minutes Header"."Electoral Name")
//             {
//             }
//             column(TotalCount; TotalCount)
//             {
//             }
//             column(Complain; Complain)
//             {
//             }
//             column(Suggestions; Suggestions)
//             {
//             }
//             column(OtherRemarks; OtherRemarks)
//             {
//             }
//             column(Month; Month)
//             {
//             }
//             column(Year; Year)
//             {
//             }
//             dataitem("Complains And Remarks"; "Complains And Remarks")
//             {
//                 DataItemLink = "Header No" = field(Code);
//                 DataItemTableView = where(Type = const("Complains and Remarks"));
//                 column(ReportForNavId_38; 38)
//                 {
//                 }
//                 column(HeaderNo_ComplainsAndRemarks; "Complains And Remarks"."Header No")
//                 {
//                 }
//                 column(LineNo_ComplainsAndRemarks; "Complains And Remarks"."Line No")
//                 {
//                 }
//                 column(Type_ComplainsAndRemarks; "Complains And Remarks".Type)
//                 {
//                 }
//                 column(Complain_ComplainsAndRemarks; "Complains And Remarks".Complain)
//                 {
//                 }
//                 column(Suggestion_ComplainsAndRemarks; "Complains And Remarks".Suggestion)
//                 {
//                 }
//                 column(Numbering_ComplainsAndRemarks; "Complains And Remarks".Numbering)
//                 {
//                 }
//                 column(Resolutions_ComplainsAndRemarks; "Complains And Remarks"."Proposed Resolutions")
//                 {
//                 }
//             }
//             dataitem("Other Remarks"; "Other Remarks")
//             {
//                 DataItemLink = "Header No" = field(Code);
//                 DataItemTableView = where(Type = const("Other Remarks"));
//                 column(ReportForNavId_31; 31)
//                 {
//                 }
//                 column(HeaderNo_OtherRemarks; "Other Remarks"."Header No")
//                 {
//                 }
//                 column(LineNo_OtherRemarks; "Other Remarks"."Line No")
//                 {
//                 }
//                 column(Type_OtherRemarks; "Other Remarks".Type)
//                 {
//                 }
//                 column(Complain_OtherRemarks; "Other Remarks".Complain)
//                 {
//                 }
//                 column(Suggestion_OtherRemarks; "Other Remarks".Suggestion)
//                 {
//                 }
//                 column(Remark_OtherRemarks; "Other Remarks"."Proposed Resolutions")
//                 {
//                 }
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 //DelegatesMinutesHeader
//                 BranchName := '';
//                 DelegatesMonthlyReturns.Reset;
//                 DelegatesMonthlyReturns.SetRange("Header No", "Delegates Minutes Header".Code);
//                 DelegatesMonthlyReturns.SetRange("Caption Type", 'TOTAL_BRANCH_MEMBERS');
//                 if DelegatesMonthlyReturns.FindFirst then
//                     TotalBranchMembers := DelegatesMonthlyReturns."Total Branch Members";

//                 DelegateRegion.Reset;
//                 DelegateRegion.SetRange(Code, "Delegates Minutes Header"."Delegate Region");
//                 if DelegateRegion.FindFirst then
//                     BranchName := DelegateRegion."Delegate Region Description";
//                 MonthText := SkyHarambeePortal.FormatDateToMonth("Delegates Minutes Header".Month);
//                 Date := SkyHarambeePortal.FormatDate("Delegates Minutes Header"."Created Date");

//                 ComplainandRemarks.Reset;
//                 ComplainandRemarks.SetRange("Header No", "Delegates Minutes Header".Code);
//                 if ComplainandRemarks.FindFirst then begin
//                     Complain := ComplainandRemarks.Complain;
//                     Suggestions := ComplainandRemarks.Suggestion;
//                     OtherRemarks := ComplainandRemarks."Proposed Resolutions";
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

//     trigger OnPreReport()
//     var
//         MonthInt: Integer;
//         YearInt: Integer;
//     begin
//         Company.Get;
//         Company.CalcFields(Picture);
//         PrintedBy := CopyStr(UserId, StrPos(UserId, '\') + 1, StrLen(UserId));
//         PrintedAt := SkyHarambeePortal.FormatDateTimeReverse(CurrentDatetime);
//         Year := "Delegates Minutes Header".GetFilter(Year);
//         Month := "Delegates Minutes Header".GetFilter(Month);
//         if (Month = '') and (Year = '') then Error('Year and Month should have a value');
//         if (Year = '') then Error('Year should have a value');
//         if (Month = '') then Error('Month should have a value');

//         Evaluate(MonthInt, Month);
//         Evaluate(YearInt, Year);

//         if MonthInt > 12 then Error('Month cannot be greater than 12');
//         if YearInt > Date2dmy(Today, 3) then Error('Year cannot be greater than %1.', Format(Date2dmy(Today, 3)));
//     end;

//     var
//         BookNo: Code[10];
//         PrintedBy: Code[50];
//         PrintedAt: Text;
//         // SkyHarambeePortal: Codeunit 52185428;
//         DelegatesReturnsLines: Record 52186226;
//         LinesCount: Integer;
//         Company: Record "Company Information";
//         LinesMemberNumbers: Text;
//         DelegatesMonthlyReturns: Record 52186225;
//         TotalBranchMembers: Integer;
//         BranchName: Text;
//         MonthText: Text;
//         Date: Text;
//         DelegateRegion: Record 52186062;
//         DelegatesMinutesHeader: Record 52186056;
//         Defaulters: Integer;
//         MortgageLoan: Integer;
//         NewLoans: Integer;
//         NewMembers: Integer;
//         Rejoiner: Integer;
//         SalaryAccount: Integer;
//         VariationUp: Integer;
//         TotoAccounts: Integer;
//         WafanisiAccounts: Integer;
//         Withdrawals: Integer;
//         TotalCount: Integer;
//         Month: Text;
//         Year: Text;
//         ComplainandRemarks: Record 52186227;
//         Complain: Text;
//         Suggestions: Text;
//         OtherRemarks: Text;
// }
