// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185697 "Standing Order"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Standing Order.rdlc';

//     dataset
//     {
//         dataitem("Standing Order Header";"Standing Order Header")
//         {
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(No;"Standing Order Header"."No.")
//             {
//             }
//             column(AccNo;"Standing Order Header"."Source Account No.")
//             {
//             }
//             column(Name;"Standing Order Header"."Source Account Name")
//             {
//             }
//             column(Amount;"Standing Order Header".Amount)
//             {
//             }
//             column(EndDate;"Standing Order Header"."End Date")
//             {
//             }
//             column(Status;"Standing Order Header".Status)
//             {
//             }
//             column(MemberNo;"Standing Order Header"."Member No.")
//             {
//             }
//             // column(Picture;Company.Picture)
//             // {
//             // }
//             // column(Address;Company.Address)
//             // {
//             // }
//             // column(Company_Name;Company.Name)
//             // {
//             // }
//             dataitem("Standing Order Lines";"Standing Order Lines")
//             {
//                 DataItemLink = "Document No."=field("No.");
//                 column(ReportForNavId_8; 8)
//                 {
//                 }
//                 column(Type;"Standing Order Lines"."Destination Account Type")
//                 {
//                 }
//                 column(DAcccNo;"Standing Order Lines"."Destination Account No.")
//                 {
//                 }
//                 column(DAmount;"Standing Order Lines".Amount)
//                 {
//                 }
//                 column(LoanNo;"Standing Order Lines"."Loan No.")
//                 {
//                 }
//                 column(LoanType;LoanType)
//                 {
//                 }
//                 column(LoanBal;LoanBal)
//                 {
//                 }
//                 column(LoanInt;LoanInt)
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     if Loans.Get("Standing Order Lines"."Loan No.") then
//                       LoanType:=Loans."Loan Product Type"
//                     else
//                       LoanType:='';

//                     if LoanType='' then begin
//                       if SavingsAccounts.Get("Standing Order Lines"."Destination Account No.") then
//                         LoanType:=SavingsAccounts."Product Type"
//                       else
//                         LoanType:='';
//                       end;
//                       LoanBal:=0;
//                       LoanInt:=0;
//                       if "Standing Order Lines"."Destination Account Type"="Standing Order Lines"."destination account type"::Credit then begin
//                     Loans.Reset;
//                     Loans.SetRange("Loan No.","Standing Order Lines"."Loan No.");
//                     if Loans.Find('-') then begin
//                       Loans.CalcFields("Outstanding Balance","Outstanding Interest");
//                       LoanBal:=Loans."Outstanding Balance";
//                       LoanInt:=Loans."Outstanding Interest";
//                     end;
//                     end;
//                 end;
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
//         if Company.Get() then
//           Company.CalcFields(Company.Picture);
//     end;

//     var
//         Company: Record "Company Information";
//         Loans: Record 52185729;
//         LoanType: Code[20];
//         SavingsAccounts: Record 52185730;
//         LoanBal: Decimal;
//         LoanInt: Decimal;
// }
