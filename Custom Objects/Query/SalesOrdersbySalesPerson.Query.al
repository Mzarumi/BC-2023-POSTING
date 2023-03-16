// Query 104 "Sales Orders by Sales Person"
// {
//     Caption = 'Sales Orders by Sales Person';

//     elements
//     {
//         dataitem(Sales_Line;37)
//         {
//             column(ItemNo;"No.")
//             {
//             }
//             column(ItemDescription;Description)
//             {
//             }
//             column(Document_No;"Document No.")
//             {
//             }
//             column(Posting_Date;"Posting Date")
//             {
//             }
//             column(Amount;Amount)
//             {
//             }
//             column(Line_No;"Line No.")
//             {
//             }
//             dataitem(Currency;4)
//             {
//                 DataItemLink = Code=Sales_Line."Currency Code";
//                 column(CurrenyDescription;Description)
//                 {
//                 }
//                 dataitem(Sales_Header;36)
//                 {
//                     DataItemLink = "No."=Sales_Line."Document No.";
//                     column(Currency_Code;"Currency Code")
//                     {
//                     }
//                     dataitem(Salesperson_Purchaser;13)
//                     {
//                         DataItemLink = Code=Sales_Header."Salesperson Code";
//                         column(SalesPersonCode;"Code")
//                         {
//                         }
//                         column(SalesPersonName;Name)
//                         {
//                         }
//                     }
//                 }
//             }
//         }
//     }
// }
