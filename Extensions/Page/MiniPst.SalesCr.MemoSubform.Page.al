// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1323 "Mini Pst.Sales Cr.Memo Subform"
// {
//     AutoSplitKey = true;
//     Caption = 'Lines';
//     Editable = false;
//     LinksAllowed = false;
//     PageType = ListPart;
//     SourceTable = "Sales Cr.Memo Line";

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Item No.';
//                     LookupPageID = "Mini Item List";
//                     ToolTip = 'Specifies a general ledger account number or an item number that identifies the general ledger account or item specified when the line was posted.';
//                 }
//                 field("Cross-Reference No."; Rec."Cross-Reference No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the cross-reference number of the item specified on the line.';
//                     Visible = false;
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Description/Comment';
//                     ToolTip = 'Specifies the name of the item or general ledger account, or some descriptive text.';
//                 }
//                 field(Quantity; Rec.Quantity)
//                 {
//                     ApplicationArea = Basic;
//                     BlankZero = true;
//                     ToolTip = 'Specifies the number of units of the item specified on the line.';
//                     Width = 8;
//                 }
//                 field("Unit of Measure Code"; Rec."Unit of Measure Code")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the unit of measure code for the items sold.';
//                     Width = 8;
//                 }
//                 field("Unit Price"; Rec."Unit Price")
//                 {
//                     ApplicationArea = Basic;
//                     BlankZero = true;
//                     ToolTip = 'Specifies the price of one unit of the item.';
//                 }
//                 field("Line Discount %"; Rec."Line Discount %")
//                 {
//                     ApplicationArea = Basic;
//                     BlankZero = true;
//                     ToolTip = 'Specifies the line discount percentage that was given on the line.';
//                     Width = 8;
//                 }
//                 field("Line Amount"; Rec."Line Amount")
//                 {
//                     ApplicationArea = Basic;
//                     BlankZero = true;
//                     ToolTip = 'Specifies the net amount (excluding the invoice discount amount) that will be posted. If you have placed a check mark in the Prices Including VAT field, the amount displayed will include VAT.';
//                 }
//                 field("Deferral Code"; Rec."Deferral Code")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//             group(Control22)
//             {
//                 group(Control18)
//                 {
//                     field("Invoice Discount Amount"; SalesCrMemoHeader."Invoice Discount Amount")
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = SalesCrMemoHeader."Currency Code";
//                         AutoFormatType = 1;
//                         Caption = 'Invoice Discount Amount';
//                         Editable = false;
//                         ToolTip = 'Specifies the sum of the value in the Line Amount Excl. VAT field on all lines in the document minus any discount amount in the Invoice Discount Amount field. Note that amounts on document lines are shown with or without VAT depending on what you selected in the Prices Including VAT field on the customer or vendor card.';
//                     }
//                 }
//                 group(Control7)
//                 {
//                     field("Total Amount Excl. VAT"; SalesCrMemoHeader.Amount)
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = SalesCrMemoHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalExclVATCaption(SalesCrMemoHeader."Currency Code");
//                         Caption = 'Total Amount Excl. VAT';
//                         DrillDown = false;
//                         Editable = false;
//                         ToolTip = 'Specifies the sum of the value in the Line Amount Excl. VAT field on all lines in the document minus any discount amount in the Invoice Discount Amount field. Note that amounts on document lines are shown with or without VAT depending on what you selected in the Prices Including VAT field on the customer or vendor card.';
//                     }
//                     field("Total VAT Amount"; VATAmount)
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = SalesCrMemoHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalVATCaption(SalesCrMemoHeader."Currency Code");
//                         Caption = 'Total VAT';
//                         Editable = false;
//                         ToolTip = 'Specifies the sum of VAT amounts on all lines in the document. Note that amounts on document lines are shown with or without VAT depending on what you selected in the Prices Including VAT field on the customer or vendor card.';
//                     }
//                     field("Total Amount Incl. VAT"; SalesCrMemoHeader."Amount Including VAT")
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = SalesCrMemoHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalInclVATCaption(SalesCrMemoHeader."Currency Code");
//                         Caption = 'Total Amount Incl. VAT';
//                         Editable = false;
//                         Style = Strong;
//                         StyleExpr = true;
//                         ToolTip = 'Specifies the sum of the value in the Line Amount Incl. VAT field on all lines in the document minus any discount amount in the Invoice Discount Amount field. Note that amounts on document lines are shown with or without VAT depending on what you selected in the Prices Including VAT field on the customer or vendor card.';
//                     }
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             action(DeferralSchedule)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Deferral Schedule';
//                 Image = PaymentPeriod;

//                 trigger OnAction()
//                 begin
//                     Rec.ShowDeferrals;
//                 end;
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     begin
//         MiniDocumentTotals.CalculatePostedSalesCreditMemoTotals(SalesCrMemoHeader, VATAmount, Rec);
//     end;

//     var
//         SalesCrMemoHeader: Record "Sales Cr.Memo Header";
//         MiniDocumentTotals: Codeunit 1301;
//         VATAmount: Decimal;
// }
