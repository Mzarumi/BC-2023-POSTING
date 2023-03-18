// Query 9063 "Count Purchase Orders"
// {
//     Caption = 'Count Purchase Orders';

//     elements
//     {
//         dataitem(38;38)
//         {
//             DataItemTableFilter = "Document Type"=const(Order);
//             filter(Completely_Received;"Completely Received")
//             {
//             }
//             filter(Responsibility_Center;"Responsibility Center")
//             {
//             }
//             filter(Status;Status)
//             {
//             }
//             filter(Invoice;Invoice)
//             {
//             }
//             column(Count_Orders)
//             {
//                 Method = Count;
//             }
//         }
//     }
// }
