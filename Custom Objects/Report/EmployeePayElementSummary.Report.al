// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185537 "Employee Pay Element Summary"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Employee Pay Element Summary.rdlc';

//     dataset
//     {
//         dataitem("PR Period Transactions";"PR Period Transactions")
//         {
//             DataItemTableView = where("Group Order" = const(3));
//             RequestFilterFields = "Employee Code", "Payroll Period";
//             column(ReportForNavId_7769; 7769)
//             {
//             }
//             column(CompanyInfo_Picture; CompanyInfo.Picture)
//             {
//             }
//             column(USERID; UserId)
//             {
//             }
//             column(TODAY; Today)
//             {
//             }
//             column(CurrReport_PAGENO; CurrReport.PageNo)
//             {
//             }
//             column(prPeriod_Transactions__Employee_Code_; "Employee Code")
//             {
//             }
//             column(Names; Names)
//             {
//             }
//             column(prPeriod_Transactions_Amount; Amount)
//             {
//             }
//             column(prPeriod_Transactions__Transaction_Code_; "Transaction Code")
//             {
//             }
//             column(prPeriod_Transactions__Transaction_Name_; "Transaction Name")
//             {
//             }
//             column(prPeriod_Transactions_Amount_Control1102756033; Amount)
//             {
//             }
//             column(prPeriod_Transactions_Amount_Control1102756030; Amount)
//             {
//             }
//             column(User_Name_Caption; User_Name_CaptionLbl)
//             {
//             }
//             column(Print_Date_Caption; Print_Date_CaptionLbl)
//             {
//             }
//             column(Page_No_Caption; Page_No_CaptionLbl)
//             {
//             }
//             column(Employee_Pay_Elements_to_DateCaption; Employee_Pay_Elements_to_DateCaptionLbl)
//             {
//             }
//             column(AmountCaption; AmountCaptionLbl)
//             {
//             }
//             column(prPeriod_Transactions__Transaction_Name_Caption; "PR Period Transactions".FieldCaption("Transaction Name"))
//             {
//             }
//             column(prPeriod_Transactions__Transaction_Code_Caption; "PR Period Transactions".FieldCaption("Transaction Code"))
//             {
//             }
//             column(Sub_TotalsCaption; Sub_TotalsCaptionLbl)
//             {
//             }
//             column(Prepared_by_______________________________________Date_________________Caption; Prepared_by_______________________________________Date_________________CaptionLbl)
//             {
//             }
//             column(Checked_by________________________________________Date_________________Caption; Checked_by________________________________________Date_________________CaptionLbl)
//             {
//             }
//             column(Authorized_by____________________________________Date_________________Caption; Authorized_by____________________________________Date_________________CaptionLbl)
//             {
//             }
//             column(Approved_by______________________________________Date_________________Caption; Approved_by______________________________________Date_________________CaptionLbl)
//             {
//             }
//             column(Grand_TotalsCaption; Grand_TotalsCaptionLbl)
//             {
//             }
//             column(prPeriod_Transactions_Period_Month; "Period Month")
//             {
//             }
//             column(prPeriod_Transactions_Period_Year; "Period Year")
//             {
//             }
//             column(prPeriod_Transactions_Membership; Membership)
//             {
//             }
//             column(prPeriod_Transactions_Reference_No; "Reference No")
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 Names := ' ';
//                 if HrEmp.Get("PR Period Transactions"."Employee Code") then
//                     Names := HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
//             end;

//             trigger OnPreDataItem()
//             begin
//                 LastFieldNo := "PR Period Transactions".FieldNo("Transaction Code");
//                 if CompanyInfo.Get() then
//                     CompanyInfo.CalcFields(CompanyInfo.Picture);

//                 if "PR Period Transactions".GetFilter("PR Period Transactions"."Employee Code") = '' then
//                     Error('You must specify the Employee Code.');
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
//         LastFieldNo: Integer;
//         FooterPrinted: Boolean;
//         TotalFor: label 'Total for ';
//         CompanyInfo: Record "Company Information";
//         HrEmp: Record "HR Employees";
//         Names: Text[250];
//         User_Name_CaptionLbl: label 'User Name:';
//         Print_Date_CaptionLbl: label 'Print Date:';
//         Page_No_CaptionLbl: label 'Page No:';
//         Employee_Pay_Elements_to_DateCaptionLbl: label 'Employee Pay Elements to Date';
//         AmountCaptionLbl: label 'Amount';
//         Sub_TotalsCaptionLbl: label 'Sub-Totals';
//         Prepared_by_______________________________________Date_________________CaptionLbl: label 'Prepared by……………………………………………………..                 Date……………………………………………';
//         Checked_by________________________________________Date_________________CaptionLbl: label 'Checked by…………………………………………………..                   Date……………………………………………';
//         Authorized_by____________________________________Date_________________CaptionLbl: label 'Authorized by……………………………………………………..              Date……………………………………………';
//         Approved_by______________________________________Date_________________CaptionLbl: label 'Approved by……………………………………………………..                Date……………………………………………';
//         Grand_TotalsCaptionLbl: label 'Grand-Totals';
// }
