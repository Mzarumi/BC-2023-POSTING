// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 826 "DO Payment Setup"
// {
//     Caption = 'Microsoft Dynamics ERP Payment Services Setup';
//     DeleteAllowed = false;
//     InsertAllowed = false;
//     PageType = Card;
//     SourceTable = 826;

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 Caption = 'General';
//                 field("Authorization Required"; "Authorization Required")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Days Before Auth. Expiry"; "Days Before Auth. Expiry")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//             group("Additional Charges")
//             {
//                 Caption = 'Additional Charges';
//                 field("Charge Type"; "Charge Type")
//                 {
//                     ApplicationArea = Basic;

//                     trigger OnValidate()
//                     begin
//                         MCAIsEnabled := "Charge Type" = "charge type"::Percent;
//                     end;
//                 }
//                 field("Charge Value"; "Charge Value")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Max. Charge Amount (LCY)"; "Max. Charge Amount (LCY)")
//                 {
//                     ApplicationArea = Basic;
//                     Enabled = MCAIsEnabled;
//                 }
//             }
//             group(Numbering)
//             {
//                 Caption = 'Numbering';
//                 field("Credit Card Nos."; "Credit Card Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }

//     trigger OnAfterGetRecord()
//     begin
//         MCAIsEnabled := "Charge Type" = "charge type"::Percent;
//     end;

//     trigger OnInit()
//     begin
//         MCAIsEnabled := true;
//     end;

//     trigger OnOpenPage()
//     begin
//         Rec.Reset;
//         if not Rec.Get then begin
//             Rec.Init;
//             Rec.Insert;
//         end;
//     end;

//     var
//         [InDataSet]
//         MCAIsEnabled: Boolean;
// }
