// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1363 "Mini Standard Purchase Codes"
// {
//     Caption = 'Standard Recurring Purchase Lines';
//     CardPageID = "Mini Std. Purchase Code Card";
//     PageType = List;
//     SourceTable = "Standard Purchase Code";

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 field("Code";Rec.Code)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies a code which identifies this standard purchase code.';
//                 }
//                 field(Description;Rec.Description)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies a description of the standard purchase code.';
//                 }
//                 field("Currency Code";Rec."Currency Code")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the code for the currency of the amounts on the standard purchase lines.';
//                     Visible = false;
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }
// }
