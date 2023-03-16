// Query 101 "Sales Dashboard"
// {
//     Caption = 'Sales Dashboard';

//     elements
//     {
//         dataitem(Item_Ledger_Entry;32)
//         {
//             DataItemTableFilter = "Entry Type"=filter(Sale);
//             column(Entry_No;"Entry No.")
//             {
//             }
//             column(Document_No;"Document No.")
//             {
//             }
//             column(Posting_Date;"Posting Date")
//             {
//             }
//             column(Entry_Type;"Entry Type")
//             {
//             }
//             column(Quantity;Quantity)
//             {
//             }
//             column(Sales_Amount_Actual;"Sales Amount (Actual)")
//             {
//             }
//             column(Sales_Amount_Expected;"Sales Amount (Expected)")
//             {
//             }
//             column(Cost_Amount_Actual;"Cost Amount (Actual)")
//             {
//             }
//             column(Cost_Amount_Expected;"Cost Amount (Expected)")
//             {
//             }
//             dataitem(Country_Region;9)
//             {
//                 DataItemLink = Code=Item_Ledger_Entry."Country/Region Code";
//                 column(CountryRegionName;Name)
//                 {
//                 }
//                 dataitem(Customer;18)
//                 {
//                     DataItemLink = "No."=Item_Ledger_Entry."Source No.";
//                     column(CustomerName;Name)
//                     {
//                     }
//                     column(Customer_Posting_Group;"Customer Posting Group")
//                     {
//                     }
//                     column(Customer_Disc_Group;"Customer Disc. Group")
//                     {
//                     }
//                     column(City;City)
//                     {
//                     }
//                     dataitem(Item;27)
//                     {
//                         DataItemLink = "No."=Item_Ledger_Entry."Item No.";
//                         column(Description;Description)
//                         {
//                         }
//                         dataitem(Salesperson_Purchaser;13)
//                         {
//                             DataItemLink = Code=Customer."Salesperson Code";
//                             column(SalesPersonName;Name)
//                             {
//                             }
//                         }
//                     }
//                 }
//             }
//         }
//     }
// }
