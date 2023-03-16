// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185530 "prMonthly Variance"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/prMonthly Variance.rdlc';

//     dataset
//     {
//         dataitem("PrMonthly Variance";"PrMonthly Variance")
//         {
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(CI_Name;CI.Name)
//             {
//                 IncludeCaption = true;
//             }
//             column(CI_Address;CI.Address)
//             {
//                 IncludeCaption = true;
//             }
//             column(CI_Address2;CI."Address 2" )
//             {
//                 IncludeCaption = true;
//             }
//             column(CI_PhoneNo;CI."Phone No.")
//             {
//                 IncludeCaption = true;
//             }
//             column(CI_Picture;CI.Picture)
//             {
//                 IncludeCaption = true;
//             }
//             column(CI_City;CI.City)
//             {
//                 IncludeCaption = true;
//             }
//             column(USERID;UserId)
//             {
//             }
//             column(TODAY;Today)
//             {
//             }
//             column(Transaction_Code;"PrMonthly Variance"."Trans Code")
//             {
//             }
//             column(Employee_Code;"PrMonthly Variance"."Employee code")
//             {
//             }
//             column(Current_Amount;"PrMonthly Variance"."Curr Amount")
//             {
//             }
//             column(Previous_Amount;"PrMonthly Variance"."Prev Amount")
//             {
//             }
//             column(Variance;"PrMonthly Variance".Variance)
//             {
//             }
//             column(Transaction_Name;"PrMonthly Variance"."Trans Name")
//             {
//             }
//             column(Current_Period;"PrMonthly Variance"."Current Period")
//             {
//             }
//             column(Previous_Period;"PrMonthly Variance"."Previous Period")
//             {
//             }
//             column(Employee_Name;"PrMonthly Variance"."Employee Name")
//             {
//             }
//             column(PreviousPeriodName;PreviousPeriodName)
//             {
//             }
//             column(CurrentPeriodName;CurrentPeriodName)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 if "PrMonthly Variance".Variance = 0
//                   then CurrReport.Skip;
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
//         if CI.Get() then
//         CI.CalcFields(CI.Picture);

//         Variance.Reset;
//         if Variance.Find('-') then begin

//             PayPeriods.Reset;
//             PayPeriods.SetRange(PayPeriods."Date Opened",Variance."Previous Period");
//             if PayPeriods.Find('-') then
//             PreviousPeriodName := PayPeriods."Period Name";

//             PayPeriods.Reset;
//             PayPeriods.SetRange(PayPeriods."Date Opened",Variance."Current Period");
//             if PayPeriods.Find('-') then
//             CurrentPeriodName := PayPeriods."Period Name";

//         end;
//     end;

//     var
//         CI: Record "Company Information";
//         Variance: Record 52185667;
//         PayPeriods: Record 52185613;
//         PreviousPeriodName: Text[50];
//         CurrentPeriodName: Text[50];
// }
