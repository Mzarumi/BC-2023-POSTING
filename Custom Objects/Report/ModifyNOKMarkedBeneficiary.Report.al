// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185950 "Modify NOK Marked Beneficiary"
// {
//     ProcessingOnly = true;

//     dataset
//     {
//         dataitem(NextofKIN; NextofKIN)
//         {
//             DataItemTableView = where(Type = const("Next of Kin"), Beneficiary = const(Yes));
//             RequestFilterFields = "Account No";
//             column(ReportForNavId_1; 1)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 NextofKIN.Beneficiary := false;
//                 NextofKIN.Modify;
//             end;

//             trigger OnPostDataItem()
//             begin
//                 Message('Done!!!');
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
// }
