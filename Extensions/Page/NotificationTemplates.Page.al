// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1510 "Notification Templates"
// {
//     Caption = 'Notification Templates';
//     DelayedInsert = true;
//     PageType = List;
//     SourceTable = 1510;

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Code"; Code)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Description; Description)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Notification Method"; "Notification Method")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Type; Type)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Default; Default)
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             action(ExportContent)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Export Template Content';
//                 Image = Export;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     ExportNotification(true);
//                 end;
//             }
//             action(ImportContent)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Import Template Content';
//                 Image = Import;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     ImportNotification;
//                 end;
//             }
//             action(DeleteContent)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Delete Template Content';
//                 Image = Delete;

//                 trigger OnAction()
//                 begin
//                     DeleteNotification;
//                 end;
//             }
//         }
//     }

//     trigger OnOpenPage()
//     var
//         NotificationManagement: Codeunit "Notification Management";
//     begin
//         NotificationManagement.CreateDefaultNotificationTemplate(Rec, Type::"New Record");
//         NotificationManagement.CreateDefaultNotificationTemplate(Rec, Type::Approval);
//         NotificationManagement.CreateDefaultNotificationTemplate(Rec, Type::Overdue);

//         Rec.Reset;
//     end;
// }
