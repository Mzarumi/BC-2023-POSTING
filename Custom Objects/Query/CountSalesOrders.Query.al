// Query 9060 "Count Sales Orders"
// {
//     Caption = 'Count Sales Orders';

//     elements
//     {
//         dataitem(36;36)
//         {
//             DataItemTableFilter = "Document Type"=const(Order);
//             filter(Status;Status)
//             {
//             }
//             filter(Completely_Shipped;"Completely Shipped")
//             {
//             }
//             filter(Responsibility_Center;"Responsibility Center")
//             {
//             }
//             filter(Ship;Ship)
//             {
//             }
//             filter(Invoice;Invoice)
//             {
//             }
//             filter(Shipment_Date;"Shipment Date")
//             {
//             }
//             column(Count_Orders)
//             {
//                 Method = Count;
//             }
//         }
//     }
// }
