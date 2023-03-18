// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1370 "Mini Purch. Cr.Memo Subform"
// {
//     AutoSplitKey = true;
//     Caption = 'Lines';
//     DelayedInsert = true;
//     LinksAllowed = false;
//     MultipleNewLines = true;
//     PageType = ListPart;
//     SourceTable = "Purchase Line";
//     SourceTableView = where("Document Type" = filter("Credit Memo"));

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
//                     ShowMandatory = true;
//                     ToolTip = 'Specifies the number of a general ledger account, an item, an additional cost or a fixed asset, depending on what you selected in the Type field.';

//                     trigger OnValidate()
//                     begin
//                         NoOnAfterValidate;
//                         UpdateEditableOnRow;
//                         UpdatePage;
//                     end;
//                 }
//                 field("Cross-Reference No."; Rec."Cross-Reference No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the cross-reference number for this item. To see the available item cross-reference numbers, click the field.';
//                     Visible = false;

//                     trigger OnLookup(var Text: Text): Boolean
//                     begin
//                         CrossReferenceNoLookUp;
//                         InsertExtendedText(false);
//                     end;

//                     trigger OnValidate()
//                     begin
//                         CrossReferenceNoOnAfterValidat;
//                     end;
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Description/Comment';
//                     ToolTip = 'Contains a description of the entry. The description depends on what you chose in the Type field. If you did not choose Blank, the program will fill in the field when you enter something in the No. field.';

//                     trigger OnValidate()
//                     var
//                         MiniLinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
//                     begin
//                         MiniLinesInstructionMgt.ShowCreateLineInstruction(Rec."No.");
//                     end;
//                 }
//                 field(Quantity; Rec.Quantity)
//                 {
//                     ApplicationArea = Basic;
//                     BlankZero = true;
//                     Editable = RowEditable;
//                     Enabled = RowEditable;
//                     ShowMandatory = true;
//                     ToolTip = 'Specifies the number of units of the item that will be specified on the line. Even if you later change the item number, this quantity stays unchanged on the line.';

//                     trigger OnValidate()
//                     begin
//                         UpdatePage;
//                     end;
//                 }
//                 field("Unit of Measure Code"; Rec."Unit of Measure Code")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = RowEditable;
//                     Enabled = RowEditable;
//                     ToolTip = 'Specifies the unit of measure code that is valid for the purchase line.';

//                     trigger OnValidate()
//                     begin
//                         UpdatePage;
//                     end;
//                 }
//                 field("Direct Unit Cost"; Rec."Direct Unit Cost")
//                 {
//                     ApplicationArea = Basic;
//                     BlankZero = true;
//                     Editable = RowEditable;
//                     Enabled = RowEditable;
//                     ShowMandatory = true;
//                     ToolTip = 'Specifies the direct unit cost of the item on the line.';

//                     trigger OnValidate()
//                     begin
//                         UpdatePage;
//                     end;
//                 }
//                 field("Line Discount %"; Rec."Line Discount %")
//                 {
//                     ApplicationArea = Basic;
//                     BlankZero = true;
//                     Editable = RowEditable;
//                     Enabled = RowEditable;
//                     ToolTip = 'Specifies the line discount percentage that is valid for the item on the line.';

//                     trigger OnValidate()
//                     begin
//                         UpdatePage;
//                     end;
//                 }
//                 field("Line Discount Amount"; Rec."Line Discount Amount")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = RowEditable;
//                     Enabled = RowEditable;
//                     ToolTip = 'Specifies the amount of the line discount that will be granted on the purchase line. The amount is shown in the currency of the purchase document.';
//                     Visible = false;

//                     trigger OnValidate()
//                     begin
//                         UpdatePage;
//                     end;
//                 }
//                 field("Line Amount"; Rec."Line Amount")
//                 {
//                     ApplicationArea = Basic;
//                     BlankZero = true;
//                     Editable = RowEditable;
//                     Enabled = RowEditable;
//                     ToolTip = 'Specifies the net amount (excluding the invoice discount amount) of the line, in the currency of the purchase document. If you have placed a check mark in the Prices Including VAT field, the amount displayed will include VAT.';

//                     trigger OnValidate()
//                     begin
//                         UpdatePage;
//                     end;
//                 }
//                 field("Deferral Code"; Rec."Deferral Code")
//                 {
//                     ApplicationArea = Basic;
//                     TableRelation = "Deferral Template"."Deferral Code";
//                 }
//             }
//             group(Control103)
//             {
//                 group(Control106)
//                 {
//                     field("Invoice Discount Amount"; TotalPurchHeader."Invoice Discount Amount")
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalPurchHeader."Currency Code";
//                         AutoFormatType = 1;
//                         Caption = 'Invoice Discount Amount';
//                         Editable = InvDiscAmountEditable;
//                         ToolTip = 'Specifies a discount amount that is deducted from the value in the Total Incl. VAT field. You can enter or change the amount manually. If you have set up invoice discounts, the specified percentage is shown in the Invoice Discount % field if the criteria are met. The calculated discount amount is then inserted in the Invoice Discount Amount field.';

//                         trigger OnValidate()
//                         var
//                             PurchHeader: Record "Purchase Header";
//                         begin
//                             PurchHeader.Get(Rec."Document Type", Rec."Document No.");
//                             MiniPurchCalcDiscByType.ApplyInvDiscBasedOnAmt(TotalPurchHeader."Invoice Discount Amount", PurchHeader);
//                             CurrPage.Update;
//                         end;
//                     }
//                     field("Vend. Invoice Disc. Pct."; MiniPurchCalcDiscByType.GetVendInvoiceDiscountPct(Rec))
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Vendor Invoice Discount %';
//                         DecimalPlaces = 0 : 1;
//                         Editable = false;
//                         ToolTip = 'Specifies a discount percentage that is granted if the criteria are met that you have set up for invoice discounts. The calculated discount amount is inserted in the Invoice Discount Amount field, but you can change it manually.';
//                     }
//                 }
//                 group(Control131)
//                 {
//                     field("Total Amount Excl. VAT"; TotalPurchHeader.Amount)
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalPurchHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalExclVATCaption(TotalPurchHeader."Currency Code");
//                         Caption = 'Total Amount Excl. VAT';
//                         DrillDown = false;
//                         Editable = false;
//                         ToolTip = 'Specifies the sum of the value in the Line Amount Excl. VAT field on all lines in the document minus any discount amount in the Invoice Discount Amount field. Note that amounts on document lines are shown with or without VAT depending on what you selected in the Prices Including VAT field on the customer or vendor card.';
//                     }
//                     field("Total VAT Amount"; VATAmount)
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalPurchHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalVATCaption(TotalPurchHeader."Currency Code");
//                         Caption = 'Total VAT';
//                         Editable = false;
//                         ToolTip = 'Specifies the sum of VAT amounts on all lines in the document. Note that amounts on document lines are shown with or without VAT depending on what you selected in the Prices Including VAT field on the customer or vendor card.';
//                     }
//                     field("Total Amount Incl. VAT"; TotalPurchHeader."Amount Including VAT")
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalPurchHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalInclVATCaption(TotalPurchHeader."Currency Code");
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
//             action(InsertExtTextsAction)
//             {
//                 AccessByPermission = TableData "Extended Text Header" = R;
//                 ApplicationArea = Basic;
//                 Caption = 'Insert &Ext. Texts';
//                 Image = Text;
//                 Scope = Repeater;
//                 ToolTip = 'Insert the extended item description that is set up for the item.';

//                 trigger OnAction()
//                 begin
//                     InsertExtendedText(true);
//                 end;
//             }
//             action(Dimensions)
//             {
//                 AccessByPermission = TableData Dimension = R;
//                 ApplicationArea = Basic;
//                 Caption = 'Dimensions';
//                 Image = Dimensions;
//                 Scope = Repeater;
//                 ShortCutKey = 'Shift+Ctrl+D';
//                 ToolTip = 'View or edit the dimension sets that are set up for the combination of vendor and item on the invoice line.';

//                 trigger OnAction()
//                 begin
//                     Rec.ShowDimensions;
//                 end;
//             }
//             action(DeferralSchedule)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Deferral Schedule';
//                 Enabled = "Deferral Code" <> '';
//                 Image = PaymentPeriod;

//                 trigger OnAction()
//                 begin
//                     TotalPurchHeader.Get(Rec."Document Type", Rec."Document No.");
//                     Rec.ShowDeferrals(TotalPurchHeader."Posting Date", TotalPurchHeader."Currency Code");
//                 end;
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     var
//         SalesLine: Record "Sales Line";
//     begin
//         MiniDocumentTotals.CalculatePurchHeaderTotals(TotalPurchHeader, VATAmount, Rec);
//         UpdateEditableOnRow;

//         SalesLine.SetRange("Document Type", Rec."Document Type");
//         SalesLine.SetRange("Document No.", Rec."Document No.");
//         InvDiscAmountEditable := SalesLine.FindFirst and CurrPage.Editable;
//     end;

//     trigger OnDeleteRecord(): Boolean
//     begin
//         Rec.Delete;
//         MiniDocumentTotals.CalculatePurchHeaderTotals(TotalPurchHeader, VATAmount, Rec);
//         UpdatePage;
//     end;

//     trigger OnInsertRecord(BelowxRec: Boolean): Boolean
//     begin
//         Rec.Type := Rec.Type::Item;
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin
//         Rec.Type := Rec.Type::Item;
//     end;

//     var
//         TotalPurchHeader: Record "Purchase Header";
//         TransferExtendedText: Codeunit "Transfer Extended Text";
//         MiniPurchCalcDiscByType: Codeunit "O365 Activities Dictionary";
//         MiniDocumentTotals: Codeunit 1301;
//         VATAmount: Decimal;
//         RowEditable: Boolean;
//         InvDiscAmountEditable: Boolean;

//     local procedure InsertExtendedText(Unconditionally: Boolean)
//     begin
//         if TransferExtendedText.PurchCheckIfAnyExtText(Rec, Unconditionally) then begin
//             CurrPage.SaveRecord;
//             Commit;
//             TransferExtendedText.InsertPurchExtText(Rec);
//         end;
//         if TransferExtendedText.MakeUpdate then
//             UpdatePage;
//     end;

//     local procedure UpdatePage()
//     var
//         PurchHeader: Record "Purchase Header";
//     begin
//         CurrPage.Update;
//         PurchHeader.Get(Rec."Document Type", Rec."Document No.");
//         MiniPurchCalcDiscByType.ApplyDefaultInvoiceDiscount(TotalPurchHeader."Invoice Discount Amount", PurchHeader);
//     end;

//     local procedure NoOnAfterValidate()
//     begin
//         InsertExtendedText(false);
//         Rec.TestField(Rec.Type, Rec.Type::Item);
//     end;

//     local procedure CrossReferenceNoOnAfterValidat()
//     begin
//         InsertExtendedText(false);
//     end;

//     local procedure UpdateEditableOnRow()
//     begin
//         RowEditable := Rec."No." <> '';
//     end;
// }
