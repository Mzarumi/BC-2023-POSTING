// Query 102 "Item Sales by Customer"
// {
//     Caption = 'Item Sales by Customer';

//     elements
//     {
//         dataitem(5802;5802)
//         {
//             DataItemTableFilter = "Source Type"=filter(Customer),"Item Ledger Entry No."=filter(<>0),"Document Type"=filter("Sales Invoice");
//             column(Entry_No;"Entry No.")
//             {
//             }
//             column(Document_No;"Document No.")
//             {
//             }
//             column(Posting_Date;"Posting Date")
//             {
//             }
//             column(Item_No;"Item No.")
//             {
//             }
//             column(Item_Ledger_Entry_Quantity;"Item Ledger Entry Quantity")
//             {
//             }
//             dataitem(18;18)
//             {
//                 DataItemLink = "No."=Value_Entry."Source No.";
//                 column(CustomerNo;"No.")
//                 {
//                 }
//                 column(Name;Name)
//                 {
//                 }
//                 dataitem(27;27)
//                 {
//                     DataItemLink = "No."=Value_Entry."Item No.";
//                     column(Description;Description)
//                     {
//                     }
//                     column(Gen_Prod_Posting_Group;"Gen. Prod. Posting Group")
//                     {
//                     }
//                 }
//             }
//         }
//     }
// }
