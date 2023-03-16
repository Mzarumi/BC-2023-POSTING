// Query 1501 "Workflow Instance"
// {
//     Caption = 'Workflow Instance';
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
//             dataitem(1504;1504)
//             {
//                 DataItemLink = "Workflow Code"=Workflow.Code;
//                 column(Instance_ID;ID)
//                 {
//                 }
//                 column(Workflow_Code;"Workflow Code")
//                 {
//                 }
//                 column(Step_ID;"Workflow Step ID")
//                 {
//                 }
//                 column(Step_Description;Description)
//                 {
//                 }
//                 column(Entry_Point;"Entry Point")
//                 {
//                 }
//                 column(Record_ID;"Record ID")
//                 {
//                 }
//                 column(Created_Date_Time;"Created Date-Time")
//                 {
//                 }
//                 column(Created_By_User_ID;"Created By User ID")
//                 {
//                 }
//                 column(Last_Modified_Date_Time;"Last Modified Date-Time")
//                 {
//                 }
//                 column(Last_Modified_By_User_ID;"Last Modified By User ID")
//                 {
//                 }
//                 column(Status;Status)
//                 {
//                 }
//                 column(Previous_Workflow_Step_ID;"Previous Workflow Step ID")
//                 {
//                 }
//                 column(Next_Workflow_Step_ID;"Next Workflow Step ID")
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
//                 column(Original_Workflow_Code;"Original Workflow Code")
//                 {
//                 }
//                 column(Original_Workflow_Step_ID;"Original Workflow Step ID")
//                 {
//                 }
//                 column(Sequence_No;"Sequence No.")
//                 {
//                 }
//                 dataitem(1520;1520)
//                 {
//                     DataItemLink = "Function Name"=Workflow_Step_Instance."Function Name";
//                     column(Table_ID;"Table ID")
//                     {
//                     }
//                 }
//             }
//         }
//     }
// }
