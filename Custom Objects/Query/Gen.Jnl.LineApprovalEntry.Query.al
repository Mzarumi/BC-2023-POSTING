// // Query 1581 "Gen. Jnl. Line Approval Entry"
// // {
// //     Caption = 'Gen. Jnl. Line Approval Entry';


//     elements
//     {
//         dataitem(Gen__Journal_Line; "Gen. Journal Line")
//         {
//             column(Journal_Template_Name; "Journal Template Name")
//             {
//             }
//             column(Journal_Batch_Name; "Journal Batch Name")
//             {
//             }
//             column(Line_No; "Line No.")
//             {
//             }
//             dataitem(Approval_Entry; "Approval Entry")
//             {
//                 DataItemLink = "Document Type" = Gen_Journal_Line."Document Type", "Document No." = Gen_Journal_Line."Document No.";
//                 column(Sender_ID; "Sender ID")
//                 {
//                 }
//                 column(Approver_ID; "Approver ID")
//                 {
//                 }
//                 column(Pending_Approvals; "Pending Approvals")
//                 {
//                 }
//             }
//         }
//     }
// }

