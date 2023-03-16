// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1311 "Mini Standard Sales Code Card"
// {
//     Caption = 'Recurring Sales Lines Card';
//     PageType = ListPlus;
//     SourceTable = "Standard Sales Code";

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 Caption = 'General';
//                 field("Code";Rec.Code)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies a code which identifies this standard sales code.';
//                 }
//                 field(Description;Rec.Description)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies a description of the standard sales code.';
//                 }
//                 field("Currency Code";Rec."Currency Code")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the code for the currency of the amounts on the standard sales lines.';
//                 }
//             }
//             part(StdSalesLines;"Office 365 Credentials")
//             {
//                 SubPageLink = "Standard Sales Code"=field(Code);
//             }
//         }
//     }

//     actions
//     {
//     }
// }
