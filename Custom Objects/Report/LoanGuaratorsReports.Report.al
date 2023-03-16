// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185727 "Loan Guarators Reports"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Loan Guarators Reports.rdlc';

//     dataset
//     {
//         dataitem("Agent Applications"; "Agent Applications")
//         {
//             //RequestFilterFields = "No.", "Member No.";
//             //column(ReportForNavId_1102755000; 1102755000)
//             {
//             }
//             column(No_Members; "Credit Accounts"."No.")
//             {
//             }
//             column(Name_SACCOAccount; "Credit Accounts".Name)
//             {
//             }
//             column(MemberNo_SACCOAccount; "Credit Accounts"."Member No.")
//             {
//             }
//             column(CompName; Company.Name)
//             {
//             }
//             column(CompAddress; Company.Address)
//             {
//             }
//             column(CompPic; Company.Picture)
//             {
//             }
//             dataitem(Loans; Loans)
//             {
//                 // DataItemLink = "Member No." = field("Member No.");
//                 // column(ReportForNavId_1102755001; 1102755001)
//                 // {
//                 // }
//                 column(LoanNo_Loans; Loans."Loan No.")
//                 {
//                 }
//                 column(ApplicationDate_Loans; Loans."Application Date")
//                 {
//                 }
//                 column(LoanProductType_Loans; Loans."Loan Product Type")
//                 {
//                 }
//                 column(RequestedAmount_Loans; Loans."Requested Amount")
//                 {
//                 }
//                 column(LoanProductTypeNam; Loans."Loan Product Type Name")
//                 {
//                 }
//                 column(ApprovedAmount_Loans; Loans."Approved Amount")
//                 {
//                 }
//                 column(OutStanding_Interest; Loans."Outstanding Interest")
//                 {
//                 }
//                 dataitem("Loan Guarantors and Security";"Loan Guarantors and Security")
//                 {
//                     DataItemLink = "Loan No" = field("Loan No.");
//                     column(ReportForNavId_1102755002; 1102755002)
//                     {
//                     }
//                     column(MemberNo_LoanGuarantors; "Loan Guarantors and Security"."Member No")
//                     {
//                     }
//                     column(Name_LoanGuarantors; "Loan Guarantors and Security".Name)
//                     {
//                     }
//                     column(LoanBalance_LoanGuarantors; "Loan Guarantors and Security"."Loan Balance")
//                     {
//                     }
//                     column(Shares_LoanGuarantors; "Loan Guarantors and Security"."Deposits/Shares")
//                     {
//                     }
//                     column(NoOfLoansGuaranteed_LoanGuarantors; "Loan Guarantors and Security"."No Of Loans Guaranteed")
//                     {
//                     }
//                     column(Substituted_LoanGuarantors; "Loan Guarantors and Security".Substituted)
//                     {
//                     }
//                     column(Date_LoanGuarantors; "Loan Guarantors and Security".Date)
//                     {
//                     }
//                     column(SharesRecovery_LoanGuarantors; "Loan Guarantors and Security"."Shares Recovery")
//                     {
//                     }
//                     column(NewUpload_LoanGuarantors; "Loan Guarantors and Security"."New Upload")
//                     {
//                     }
//                     column(AmontGuaranteed_LoanGuarantors; "Loan Guarantors and Security"."Amount Guaranteed")
//                     {
//                     }
//                     column(StaffPayrollNo_LoanGuarantors; "Loan Guarantors and Security"."Staff/Payroll No.")
//                     {
//                     }
//                     column(AccountNo_LoanGuarantors; "Loan Guarantors and Security"."Account No.")
//                     {
//                     }
//                     column(SelfGuarantee_LoanGuarantors; "Loan Guarantors and Security"."Self Guarantee")
//                     {
//                     }
//                     column(IDNo_LoanGuarantors; "Loan Guarantors and Security"."ID No.")
//                     {
//                     }
//                     column(OutstandingBalance_LoanGuarantors; "Loan Guarantors and Security"."Outstanding Balance")
//                     {
//                     }
//                     column(MemberGuaranteed_LoanGuarantors; "Loan Guarantors and Security"."Member Guaranteed")
//                     {
//                     }
//                     column(TLoan; TotalLoan)
//                     {
//                     }

//                     trigger OnAfterGetRecord()
//                     begin
//                         TotalLoan := 0;
//                         TotalLoan := "Loan Guarantors and Security"."Outstanding Balance" + Loans."Outstanding Interest";
//                     end;
//                 }
//             }
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
//         Company.Get;
//         Company.CalcFields(Company.Picture);
//     end;

//     var
//         Company: Record "Company Information";
//         TotalLoan: Decimal;
// }
