// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185517 "prDeductions Report"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/prDeductions Report.rdlc';

//     dataset
//     {
//         dataitem("PR Period Transactions";"PR Period Transactions")
//         {
//             //DataItemTableView = sorting("Group Order", "Transaction Code", "Period Month", "Period Year", Membership, "Reference No", "Department Code") where("Group Text" = filter(DEDUCTIONS));
//             RequestFilterFields = "Employee Code", "Transaction Code";
//             column(ReportForNavId_7769; 7769)
//             {
//             }
//             column(HideBalance; HideBalance)
//             {
//             }
//             column(CI_Name; CI.Name)
//             {
//                 IncludeCaption = true;
//             }
//             column(CI_Address; CI.Address)
//             {
//                 IncludeCaption = true;
//             }
//             column(CI_Address2; CI."Address 2")
//             {
//                 IncludeCaption = true;
//             }
//             column(CI_PhoneNo; CI."Phone No.")
//             {
//                 IncludeCaption = true;
//             }
//             column(CI_Picture; CI.Picture)
//             {
//                 IncludeCaption = true;
//             }
//             column(CI_City; CI.City)
//             {
//                 IncludeCaption = true;
//             }
//             column(USERID; UserId)
//             {
//             }
//             column(TODAY; Today)
//             {
//             }
//             column(PeriodName; PeriodName)
//             {
//             }
//             column(CurrReport_PAGENO; CurrReport.PageNo)
//             {
//             }
//             column(CompanyInfo_Picture; CompanyInfo.Picture)
//             {
//             }
//             column(prPeriod_Transactions__Group_Text_; "Group Text")
//             {
//             }
//             column(prPeriod_Transactions_Amount; Amount)
//             {
//             }
//             column(prPeriod_Transactions__Transaction_Name_; "Transaction Name")
//             {
//             }
//             column(TotalsAllowances; TotalsAllowances)
//             {
//             }
//             column(TOTAL_ALLOWANCES_; 'TOTAL ALLOWANCES')
//             {
//             }
//             column(Allowances_ReportCaption; Allowances_ReportCaptionLbl)
//             {
//             }
//             column(User_Name_Caption; User_Name_CaptionLbl)
//             {
//             }
//             column(Print_Date_Caption; Print_Date_CaptionLbl)
//             {
//             }
//             column(Period_Caption; Period_CaptionLbl)
//             {
//             }
//             column(Page_No_Caption; Page_No_CaptionLbl)
//             {
//             }
//             column(Transaction_Name_Caption; Transaction_Name_CaptionLbl)
//             {
//             }
//             column(Period_Amount_Caption; Period_Amount_CaptionLbl)
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
//             column(prPeriod_Transactions_Employee_Code; "Employee Code")
//             {
//             }
//             column(prPeriod_Transactions_Transaction_Code; "Transaction Code")
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
//             column(prPeriod_Transactions_Group_Order; "Group Order")
//             {
//             }
//             column(prPeriod_Transactions_Department_Code; "Department Code")
//             {
//             }
//             column(EmployeeName; EmployeeName)
//             {
//             }
//             column(Period; "PR Period Transactions"."Payroll Period")
//             {
//             }
//             column(Balance_PRPeriodTransactions; "PR Period Transactions".Balance)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 "PR Period Transactions".SetRange("Payroll Period", SelectedPeriod);
//                 //"prPeriod Transactions".SETFILTER("Group Order",'=1|3');
//                 //"prPeriod Transactions".SETFILTER("prPeriod Transactions"."Sub Group Order",'=2');
//                 if Amount <= 0 then
//                     CurrReport.Skip;

//                 if "Transaction Code" = 'TOT-DED' then
//                     CurrReport.Skip;

//                 if "PR Period Transactions"."Payroll Period" <> SelectedPeriod then
//                     CurrReport.Skip;

//                 Employees.Reset;
//                 if Employees.Get("Employee Code") then
//                     EmployeeName := Employees."First Name" + ' ' + Employees."Middle Name" + ' ' + Employees."Last Name"
//                 else
//                     EmployeeName := ' ';
//             end;

//             trigger OnPreDataItem()
//             begin
//                 OnViewCurrRec();
//                 LastFieldNo := "PR Period Transactions".FieldNo("Period Year");
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field(HideBalance; HideBalance)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Hide Balance';
//                 }
//                 field(SelectedPeriod; SelectedPeriod)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Selected Period';
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

//     trigger OnPreReport()
//     begin
//         if SelectedPeriod = 0D then Error('You must specify the period filter');

//         objPeriod.Reset;
//         objPeriod.SetRange(objPeriod."Date Opened", SelectedPeriod);
//         if objPeriod.Find('-') then begin
//             PeriodName := objPeriod."Period Name";
//         end;


//         if CI.Get() then
//             CI.CalcFields(CI.Picture);
//     end;

//     var
//         LastFieldNo: Integer;
//         FooterPrinted: Boolean;
//         TotalFor: label 'Total for ';
//         PeriodTrans: Record 52185624;
//         GroupOrder: label '3';
//         objPeriod: Record 52185613;
//         SelectedPeriod: Date;
//         PeriodName: Text[30];
//         CompanyInfo: Record "Company Information";
//         TotalsAllowances: Decimal;
//         Dept: Boolean;
//         Allowances_ReportCaptionLbl: label 'Allowances Report';
//         User_Name_CaptionLbl: label 'User Name:';
//         Print_Date_CaptionLbl: label 'Print Date:';
//         Period_CaptionLbl: label 'Period:';
//         Page_No_CaptionLbl: label 'Page No:';
//         Transaction_Name_CaptionLbl: label 'Transaction Name:';
//         Period_Amount_CaptionLbl: label 'Period Amount:';
//         Prepared_by_______________________________________Date_________________CaptionLbl: label 'Prepared by……………………………………………………..                 Date……………………………………………';
//         Checked_by________________________________________Date_________________CaptionLbl: label 'Checked by…………………………………………………..                   Date……………………………………………';
//         Authorized_by____________________________________Date_________________CaptionLbl: label 'Authorized by……………………………………………………..              Date……………………………………………';
//         Approved_by______________________________________Date_________________CaptionLbl: label 'Approved by……………………………………………………..                Date……………………………………………';
//         Employees: Record "HR Employees";
//         EmployeeName: Text[100];
//         CI: Record "Company Information";
//         ID: Integer;
//         HideBalance: Boolean;


//     procedure OnViewCurrRec()
//     var
//         ChangePermission: Record 52185687;
//         ErrorOnRestricViewTxt: label 'You do not have Permissions to VIEW,MODIFY or DELETE on this record. Contact system administrator for assistance. %';
//     begin
//         ChangePermission.Reset;
//         ChangePermission.SetRange("User ID", UserId);
//         ChangePermission.SetRange("View Payroll", true);
//         ChangePermission.SetRange("Function Extended", ChangePermission."function extended"::"View Payroll");
//         if not ChangePermission.Find('-') then
//             Error(ErrorOnRestricViewTxt, UserId);
//     end;
// }
