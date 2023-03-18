// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185590 "Payroll Summary Detailed"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Payroll Summary Detailed.rdlc';

//     dataset
//     {
//         dataitem("HR Employees"; "HR EMPLOYEES")
//         {
//             column(ReportForNavId_1102755002; 1102755002)
//             {
//             }
//             column(No_HREmployee; "HR Employees"."No.")
//             {
//             }
//             column(FirstName_HREmployee; "HR Employees"."First Name")
//             {
//             }
//             column(MiddleName_HREmployee; "HR Employees"."Middle Name")
//             {
//             }
//             column(LastName_HREmployee; "HR Employees"."Last Name")
//             {
//             }
//             // column(CompanyInfoName; CompanyInfo.Name)
//             // {
//             // }
//          ress; CompanyInfo.Address)
//             {
//             }
//             column(CompanyInfoPicture; CompanyInfo.Picture)
//             {
//             }
//             column(LocationDivisionCode_HREmployee; "HR Employees"."Location/Division Code")
//             {
//             }
//             column(DepartmentCode_HREmployee; "HR Employees"."Department Code")
//             {
//             }
//             column(Office_HREmployee; "HR Employees".Office)
//             {
//             }
//             column(CostCenterCode_HREmployee; "HR Employees"."Cost Center Code")
//             {
//             }
//             column(JobTitle_HREmployee; "HR Employees"."Job Title")
//             {
//             }
//             dataitem("PR Period Transactions";"PR Period Transactions")
//             {
//                 DataItemLink = "Employee Code"=field("No."),"Payroll Period"=field("Current Month Filter");
//                 column(ReportForNavId_1102755000; 1102755000)
//                 {
//                 }
//                 column(TransactionCode_prPeriodTransactions;"PR Period Transactions"."Transaction Code")
//                 {
//                 }
//                 column(GroupText_prPeriodTransactions;"PR Period Transactions"."Group Text")
//                 {
//                 }
//                 column(TransactionName_prPeriodTransactions;"PR Period Transactions"."Transaction Name")
//                 {
//                 }
//                 column(Amount_prPeriodTransactions;"PR Period Transactions".Amount)
//                 {
//                 }
//                 column(Balance_prPeriodTransactions;"PR Period Transactions".Balance)
//                 {
//                 }
//                 column(OriginalAmount_prPeriodTransactions;"PR Period Transactions"."Original Amount")
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     //ERROR('%1 vs %2 vs %3',"prPeriod Transactions"."Employee Code","prPeriod Transactions"."Transaction Code","prPeriod Transactions"."Payroll Period");
//                 end;
//             }

//             trigger OnPreDataItem()
//             begin
//                 //UnknownTable"HR EMPLOYEES".SetFilter("Current Month Filter",Format("Current Period Filter"));
//                 if "HR Employees".GetFilter("HR Employees"."Current Month Filter") = '' then
//                 Error('You must specify current Period filter.');
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field("Current Period Filter";"Current Period Filter")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Period Filter';
//                     TableRelation = "PR Payroll Periods";
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

//     trigger OnInitReport()
//     begin
//         //clear("HR-Employee"."Current Month Filter");
//     end;

//     trigger OnPreReport()
//     begin
//         CompanyInfo.Get;
//         CompanyInfo.CalcFields(Picture);
//     end;

//     var
//         CompanyInfo: Record "Company Information";
//         "Current Period Filter": Date;
// }
