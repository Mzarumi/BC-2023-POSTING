// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 5370 "Service Connection Status Part"
// {
//     Caption = 'Service Connection Status';
//     DeleteAllowed = false;
//     Editable = false;
//     PageType = ListPart;
//     SourceTable = 5372;
//     SourceTableTemporary = true;

//     layout
//     {
//         area(content)
//         {
//             group("CRM Connection Status")
//             {
//                 Caption = 'Dynamics CRM';
//                 repeater(Control3)
//                 {
//                     field("Server Address"; "Server Address")
//                     {
//                         ApplicationArea = Basic;
//                     }
//                     field(StatusText; StatusText)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Status';
//                         ShowCaption = true;
//                         Style = Favorable;
//                         StyleExpr = StatusStyle;
//                     }
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             action("Dynamics CRM Connection Failures")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Dynamics CRM Connection Failures';
//                 Image = ViewDetails;
//                 RunObject = Page "CRM Connection Failures";
//             }
//             action("<Page CRM Connection Setup>")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Dynamics CRM Connection Setup';
//                 Image = Setup;
//                 RunObject = Page "CRM Connection Setup";
//             }
//             action("Check Connection")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Check Dynamics CRM Connection';
//                 Image = Refresh;

//                 trigger OnAction()
//                 begin
//                     CRMConnectionStatus.SetRec(Rec, true);
//                 end;
//             }
//         }
//     }

//     trigger OnAfterGetRecord()
//     begin
//         CRMConnectionStatus.SetStyleAndText(StatusStyle, StatusText, Status);
//     end;

//     trigger OnClosePage()
//     begin
//         if not IsNull(Timer) then
//             Timer.Stop;
//     end;

//     trigger OnOpenPage()
//     begin
//         CRMConnectionStatus.SetRec(Rec, true);
//         CRMConnectionStatus.InitTimer(Timer);
//     end;

//     var
//         CRMConnectionStatus: Codeunit 5373;
//         [WithEvents]
//         Timer: dotnet Timer;
//         [InDataSet]
//         StatusText: Text;s
//         [InDataSet]
//         StatusStyle: Text;

//     trigger Timer::Elapsed(sender: Variant; e: dotnet EventArgs)
//     begin
//         if Rec.FindSet then
//             repeat
//                 CRMConnectionStatus.UpdateConnectionStatus(Rec);
//             until Rec.Next = 0;
//     end;

//     trigger Timer::ExceptionOccurred(sender: Variant; e: dotnet ExceptionOccurredEventArgs)
//     begin
//     end;
// }
