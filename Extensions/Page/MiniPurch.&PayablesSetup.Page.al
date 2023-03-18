// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1349 "Mini Purch. & Payables Setup"
// {
//     Caption = 'Purchases & Payables Setup';
//     DeleteAllowed = false;
//     InsertAllowed = false;
//     PageType = Card;
//     SourceTable = "Purchases & Payables Setup";

//     layout
//     {
//         area(content)
//         {
//             group("Setup Fields")
//             {
//                 Caption = 'Setup Fields';
//                 field("Discount Posting";Rec."Discount Posting")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the type of purchase discounts to post separately.';
//                 }
//                 field("Invoice Rounding";Rec."Invoice Rounding")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies that amounts are rounded for purchase invoices.';
//                 }
//                 field("Ext. Doc. No. Mandatory";Rec."Ext. Doc. No. Mandatory")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies whether it is mandatory to enter an external document number in the following situations:';
//                 }
//                 field("Exact Cost Reversing Mandatory";Rec."Exact Cost Reversing Mandatory")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies that a return transaction cannot be posted unless the Appl.-to Item Entry field on the purchase order line contains an entry.';
//                 }
//                 field("Allow VAT Difference";Rec."Allow VAT Difference")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies whether to allow the manual adjustment of VAT amounts in purchase documents.';
//                 }
//                 field("Calc. Inv. Discount";Rec."Calc. Inv. Discount")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies whether the invoice discount amount is automatically calculated with purchase documents.';
//                 }
//                 field("Calc. Inv. Disc. per VAT ID";Rec."Calc. Inv. Disc. per VAT ID")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies that the invoice discount is calculated according to VAT Identifier. If you choose not to place a check mark here, the invoice discount will be calculated on the invoice total. The two methods may lead to a small difference in the VAT amount calculated by the program.';
//                 }
//                 field("Appln. between Currencies";Rec."Appln. between Currencies")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies to what extent the application of entries in different currencies is allowed in the Purchases and Payables application area. You can select one of these options:';
//                 }
//                 field("Default Posting Date";Rec."Default Posting Date")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies how to use the Posting Date field on purchase documents.';
//                 }
//             }
//             group("Number Series")
//             {
//                 Caption = 'Number Series';
//                 field("Vendor Nos.";Rec."Vendor Nos.")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Vendor Numbers';
//                     Lookup = true;
//                     TableRelation = "No. Series".Code;
//                     ToolTip = 'Specifies the code for the number series that will be used to assign numbers to vendors. To see the number series that have been set up in the No. Series table, click the field.';
//                 }
//                 field("Invoice Nos.";Rec."Invoice Nos.")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Purchase Invoice Numbers';
//                     Lookup = true;
//                     TableRelation = "No. Series".Code;
//                     ToolTip = 'Specifies the code for the number series that will be used to assign numbers to purchase invoices. To see the number series that have been set up in the No. Series table, click the field.';
//                 }
//                 field("Posted Invoice Nos.";Rec."Posted Invoice Nos.")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Posted Purchase Invoice Numbers';
//                     Lookup = true;
//                     TableRelation = "No. Series".Code;
//                     ToolTip = 'Specifies the code for the number series that will be used to assign numbers to purchase invoices when they are posted. To see the number series that have been set up in the No. Series table, click the field.';
//                 }
//                 field("Credit Memo Nos.";Rec."Credit Memo Nos.")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Purchase Credit Memo Numbers';
//                     Lookup = true;
//                     TableRelation = "No. Series".Code;
//                     ToolTip = 'Specifies the code for the number series that will be used to assign numbers to purchase credit memos. To see the number series that have been set up in the No. Series table, click the field.';
//                 }
//                 field("Posted Credit Memo Nos.";Rec."Posted Credit Memo Nos.")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Posted Purchase Credit Memo Numbers';
//                     Lookup = true;
//                     TableRelation = "No. Series".Code;
//                     ToolTip = 'Specifies the code for the number series that will be used to assign numbers to purchase credit memos when they are posted. To see the number series that have been set up in the No. Series table, click the field.';
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             action("Vendor Posting Groups")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Vendor Posting Groups';
//                 Image = Vendor;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 RunObject = Page "Vendor Posting Groups";
//                 ToolTip = 'Set up the posting groups to select from when you set up vendor cards to link business transactions made for the vendor with the appropriate account in the general ledger.';
//             }
//             action("Incoming Documents Setup")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Incoming Documents Setup';
//                 Image = Documents;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 RunObject = Page "Incoming Documents Setup";
//                 ToolTip = 'Set up the journal template that will be used to create general journal lines from electronic external documents, such as invoices from your vendors on email.';
//             }
//         }
//     }

//     trigger OnOpenPage()
//     begin
//         Rec.Reset;
//         if not Rec.Get then begin
//           Rec.Init;
//           Rec.Insert;
//         end;
//     end;
// }
