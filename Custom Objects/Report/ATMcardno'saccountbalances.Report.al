// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185752 "ATM card no's account balances"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/ATM card no's account balances.rdlc';

//     dataset
//     {
//         dataitem("Savings Accounts"; "Savings Accounts")
//         {
//             DataItemTableView = where("ATM No." = filter(<> ""));
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(No_SavingsAccounts; "Savings Accounts"."No.")
//             {
//             }
//             column(Name_SavingsAccounts; "Savings Accounts".Name)
//             {
//             }
//             column(PhoneNo_SavingsAccounts; "Savings Accounts"."Phone No.")
//             {
//             }
//             column(GlobalDimension1Code_SavingsAccounts; "Savings Accounts"."Global Dimension 1 Code")
//             {
//             }
//             column(GlobalDimension2Code_SavingsAccounts; "Savings Accounts"."Global Dimension 2 Code")
//             {
//             }
//             column(Balance_SavingsAccounts; "Savings Accounts".Balance)
//             {
//             }
//             column(BalanceLCY_SavingsAccounts; "Savings Accounts"."Balance (LCY)")
//             {
//             }
//             column(PayrollStaffNo_SavingsAccounts; "Savings Accounts"."Payroll/Staff No.")
//             {
//             }
//             column(IDNo_SavingsAccounts; "Savings Accounts"."ID No.")
//             {
//             }
//             column(ATMTransactions_SavingsAccounts; "Savings Accounts"."ATM Transactions")
//             {
//             }
//             column(ATMNo_SavingsAccounts; "Savings Accounts"."ATM No.")
//             {
//             }
//             column(sno; SNo)
//             {
//             }
//             column(HomePage; CompanyInfo."Home Page")
//             {
//             }
//             column(EMail; CompanyInfo."E-Mail")
//             {
//             }
//             column(CompanyInfoPicture; CompanyInfo.Picture)
//             {
//             }
//             column(CompanyInfoName; CompanyInfo.Name)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 SNo += 1;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 CompanyInfo.Get;
//                 CompanyInfo.CalcFields(Picture);
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
//         SNo: Integer;
//         CompanyInfo: Record "Company Information";
// }
