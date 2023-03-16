// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185429 "Update Savings Details"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Update Savings Details.rdlc';

//     dataset
//     {
//         dataitem(52185431;52185431)
//         {
//             column(ReportForNavId_1; 1)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 if SavingsAccounts.Get("Regnation not".No) then begin
//                 SavingsAccounts.Status:=SavingsAccounts.Status::Active;
//                 SavingsAccounts.Modify;
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
//         ProductFactory: Record 52185690;
//         SavingsAccounts: Record 52185730;
// }
