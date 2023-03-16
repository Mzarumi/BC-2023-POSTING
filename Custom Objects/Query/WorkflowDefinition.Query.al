// Query 1502 "Workflow Definition"
// {
//     Caption = 'Workflow Definition';
//     OrderBy = ascending(Sequence_No);

//     elements
//     {
//         dataitem(1501;1501)
//         {
//             column("Code";"Code")
//             {
//             }
//             column(Workflow_Description;Description)
//             {
//             }
//             column(Enabled;Enabled)
//             {
//             }
//             dataitem(1502;1502)
//             {
//                 DataItemLink = "Workflow Code"=Workflow.Code;
//                 column(ID;ID)
//                 {
//                 }
//                 column(Step_Description;Description)
//                 {
//                 }
//                 column(Entry_Point;"Entry Point")
//                 {
//                 }
//                 column(Type;Type)
//                 {
//                 }
//                 column(Function_Name;"Function Name")
//                 {
//                 }
//                 column(Argument;Argument)
//                 {
//                 }
//                 column(Sequence_No;"Sequence No.")
//                 {
//                 }
//                 dataitem(1520;1520)
//                 {
//                     DataItemLink = "Function Name"=Workflow_Step."Function Name";
//                     column(Table_ID;"Table ID")
//                     {
//                     }
//                 }
//             }
//         }
//     }
// }
