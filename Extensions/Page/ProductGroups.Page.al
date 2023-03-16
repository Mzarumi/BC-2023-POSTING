// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 5731 "Product Groups"
// {
//     Caption = 'Product Groups';
//     DataCaptionFields = "Item Category Code";
//     PageType = List;
//     SourceTable = "Product Group";

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 field("Item Category Code";Rec."Item Category Code")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Code";Rec.Code)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Warehouse Class Code";Rec."Warehouse Class Code")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field(Description;Rec.Description)
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             systempart(Control1900383207;Links)
//             {
//                 Visible = false;
//             }
//             systempart(Control1905767507;Notes)
//             {
//                 Visible = false;
//             }
//         }
//     }

//     actions
//     {
//     }
// }
