// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 5073 "Sales Cycle Stages List"
// {
//     Caption = 'Sales Cycle Stages List';
//     Editable = false;
//     PageType = List;
//     SourceTable = "Sales Cycle Stage";

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 field(Stage;Rec.Stage)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Description;Rec.Description)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Completed %";Rec."Completed %")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Activity Code";Rec."Activity Code")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Quote Required";Rec."Quote Required")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Allow Skip";Rec."Allow Skip")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Date Formula";Rec."Date Formula")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Comment;Rec.Comment)
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
//                 Visible = true;
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             group("&Sales Cycle Stage")
//             {
//                 Caption = '&Sales Cycle Stage';
//                 Image = Stages;
//                 action(Statistics)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Statistics';
//                     Image = Statistics;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     RunObject = Page "Sales Cycle Stage Statistics";
//                     RunPageLink = "Sales Cycle Code"=field("Sales Cycle Code"),
//                                   Stage=field(Stage);
//                     ShortCutKey = 'F7';
//                 }
//                 action("Co&mments")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Co&mments';
//                     Image = ViewComments;
//                     RunObject = Page "Rlshp. Mgt. Comment Sheet";
//                     RunPageLink = "Table Name"=const("Sales Cycle Stage"),
//                                   "No."=field("Sales Cycle Code"),
//                                   "Sub No."=field(Stage);
//                 }
//             }
//         }
//     }
// }
