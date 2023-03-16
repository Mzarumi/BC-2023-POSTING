// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 677 "Job Queue Card"
// {
//     Caption = 'Job Queue Card';
//     PageType = Card;
//     SourceTable = 470;

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 Caption = 'General';
//                 field("Code"; Code)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Description; Description)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Job Queue Category Filter"; "Job Queue Category Filter")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Started; Started)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Last Heartbeat"; "Last Heartbeat")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Server Instance ID"; "Server Instance ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Session ID"; "Session ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Running as User ID"; "Running as User ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Running on Server Computer"; "Running on Server Computer")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Running on Server Instance"; "Running on Server Instance")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//             group("NAS Settings")
//             {
//                 Caption = 'NAS Settings';
//                 field("Start Automatically From NAS"; "Start Automatically From NAS")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Start on This NAS Computer"; "Start on This NAS Computer")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Start on This NAS Instance"; "Start on This NAS Instance")
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
//             action(StartJobQueue)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Start Job Queue';
//                 Image = Start;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     StartQueueFromUI(COMPANYNAME);
//                 end;
//             }
//             action(StopJobQueue)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Stop Job Queue';
//                 Image = Stop;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     StopQueue;
//                 end;
//             }
//         }
//     }

//     trigger OnModifyRecord(): Boolean
//     begin
//         SaveEditedRecord;
//         exit(false);
//     end;
// }
