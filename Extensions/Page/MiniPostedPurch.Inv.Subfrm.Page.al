// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1358 "Mini Posted Purch. Inv. Subfrm"
// {
//     AutoSplitKey = true;
//     Caption = 'Lines';
//     Editable = false;
//     LinksAllowed = false;
//     PageType = ListPart;
//     SourceTable = "Purch. Inv. Line";

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
//                     ToolTip = 'Specifies an item number that identifies the item or a general ledger account number that identifies the general ledger account used when posting the line.';
//                 }
//                 field("Cross-Reference No."; Rec."Cross-Reference No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the cross-reference number related to this item.';
//                     Visible = false;
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Description/Comment';
//                     ToolTip = 'Specifies either the name of or a description of the item or general ledger account.';
//                 }
//                 field(Quantity; Rec.Quantity)
//                 {
//                     ApplicationArea = Basic;
//                     BlankZero = true;
//                     ToolTip = 'Specifies the quantity posted from the line.';
//                     Width = 8;
//                 }
//                 field("Unit of Measure Code"; Rec."Unit of Measure Code")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the unit of measure code for the item.';
//                     Width = 8;
//                 }
//                 field("Direct Unit Cost"; Rec."Direct Unit Cost")
//                 {
//                     ApplicationArea = Basic;
//                     BlankZero = true;
//                     ToolTip = 'Specifies the direct unit cost of one unit of the item.';
//                 }
//                 field("Line Discount %"; Rec."Line Discount %")
//                 {
//                     ApplicationArea = Basic;
//                     BlankZero = true;
//                     ToolTip = 'Specifies the line discount percentage granted on items on each individual line.';
//                     Width = 8;
//                 }
//                 field("Line Amount"; Rec."Line Amount")
//                 {
//                     ApplicationArea = Basic;
//                     BlankZero = true;
//                     ToolTip = 'Specifies the net amount (before subtracting the invoice discount amount) that must be paid for the items. If you have placed a check mark in the Prices Including VAT field, the amount displayed will include VAT.';
//                 }
//                 field("Job No."; Rec."Job No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the number of the job that the purchase invoice line is linked to.';
//                 }
//                 field("Deferral Code"; Rec."Deferral Code")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//             group(Control21)
//             {
//                 group(Control18)
//                 {
//                     field("Invoice Discount Amount"; TotalPurchInvHeader."Invoice Discount Amount")
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalPurchInvHeader."Currency Code";
//                         AutoFormatType = 1;
//                         Caption = 'Invoice Discount Amount';
//                         Editable = false;
//                         ToolTip = 'Specifies a discount amount that is deducted from the value in the Total Incl. VAT field. You can enter or change the amount manually. If you have set up invoice discounts, the specified percentage is shown in the Invoice Discount % field if the criteria are met. The calculated discount amount is then inserted in the Invoice Discount Amount field.';
//                     }
//                 }
//                 group(Control5)
//                 {
//                     field("Total Amount Excl. VAT"; TotalPurchInvHeader.Amount)
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalPurchInvHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalExclVATCaption(TotalPurchInvHeader."Currency Code");
//                         Caption = 'Total Amount Excl. VAT';
//                         DrillDown = false;
//                         Editable = false;
//                         ToolTip = 'Specifies the sum of the value in the Line Amount Excl. VAT field on all lines in the document minus any discount amount in the Invoice Discount Amount field. Note that amounts on document lines are shown with or without VAT depending on what you selected in the Prices Including VAT field on the customer or vendor card.';
//                     }
//                     field("Total VAT Amount"; VATAmount)
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalPurchInvHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalVATCaption(TotalPurchInvHeader."Currency Code");
//                         Caption = 'Total VAT';
//                         Editable = false;
//                         ToolTip = 'Specifies the sum of VAT amounts on all lines in the document. Note that amounts on document lines are shown with or without VAT depending on what you selected in the Prices Including VAT field on the customer or vendor card.';
//                     }
//                     field("Total Amount Incl. VAT"; TotalPurchInvHeader."Amount Including VAT")
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalPurchInvHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalInclVATCaption(TotalPurchInvHeader."Currency Code");
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
//         MiniDocumentTotals.CalculatePostedPurchInvoiceTotals(TotalPurchInvHeader, VATAmount, Rec);
//     end;

//     var
//         TotalPurchInvHeader: Record "Purch. Inv. Header";
//         MiniDocumentTotals: Codeunit 1301;
//         VATAmount: Decimal;
// }
