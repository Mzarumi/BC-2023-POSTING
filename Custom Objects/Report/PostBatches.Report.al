// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185427 PostBatches
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/PostBatches.rdlc';

//     dataset
//     {
//         dataitem(52185431;52185431)
//         {
//             column(ReportForNavId_1; 1)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 "Regnation not".DeleteAll;
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
//         GenJnl: Record "Gen. Journal Line";
// }
