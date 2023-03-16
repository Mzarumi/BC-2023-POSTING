// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185968 "Salary Pass Through FOSA"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Salary Pass Through FOSA.rdlc';

//     dataset
//     {
//         dataitem(SavingsAccounts; "Savings Accounts")
//         {
//             //DataItemTableView = where("Product Type" = filter(505), "Salary Through FOSA" = const(Yes));
//             RequestFilterFields = "No.";
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(Account_No; SavingsAccounts."No.")
//             {
//             }
//             column(Member_No; SavingsAccounts."Member No.")
//             {
//             }
//             column(Member_Name; SavingsAccounts.Name)
//             {
//             }
//             column(LastSalaryDate; LastSalaryDate)
//             {
//             }
//             column(Employer_Code; SavingsAccounts."Employer Code")
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 LastSalaryDate := 0D;
//                 GeneralSetUp.Get();
//                 SalaryLines.Reset;
//                 SalaryLines.SetRange("Account No.", SavingsAccounts."No.");
//                 SalaryLines.SetRange(Posted, true);
//                 SalaryLines.SetCurrentkey("Posting Date");
//                 if SalaryLines.Find('+') then begin
//                     if SalaryLines."Posting Date" > CalcDate('-' + Format(GeneralSetUp."Salary Period"), Today) then CurrReport.Skip;
//                     LastSalaryDate := SalaryLines."Posting Date";
//                     SavingsAccounts."Salary Through FOSA" := false;
//                     SavingsAccounts.Modify;
//                     UpdateSalaryThruFOSA(SavingsAccounts."No.", LastSalaryDate);
//                 end else begin
//                     SavingsAccounts."Salary Through FOSA" := false;
//                     SavingsAccounts.Modify;
//                     UpdateSalaryThruFOSA(SavingsAccounts."No.", LastSalaryDate);
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

//     var
//         SalaryLines: Record 52185784;
//         LastSalaryDate: Date;
//         GeneralSetUp: Record 52185689;

//     local procedure UpdateSalaryThruFOSA(AccNo: Code[20]; DDate: Date)
//     var
//         SalaryThruFOSA: Record 52186055;
//     begin
//         SalaryThruFOSA.Init;
//         SalaryThruFOSA."Account No." := AccNo;
//         SalaryThruFOSA."Date Unmarked" := Today;
//         SalaryThruFOSA."Last Salary Date" := DDate;
//         SalaryThruFOSA.Insert;
//     end;
// }
