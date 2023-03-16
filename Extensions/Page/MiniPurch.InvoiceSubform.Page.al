// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1355 "Mini Purch. Invoice Subform"
// {
//     AutoSplitKey = true;
//     Caption = 'Lines';
//     DelayedInsert = true;
//     LinksAllowed = false;
//     MultipleNewLines = true;
//     PageType = ListPart;
//     SourceTable = "Purchase Line";
//     SourceTableView = where("Document Type" = filter(Invoice));

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
//                     ToolTip = 'Specifies the number of the product that you want to purchase. The product can be either an inventory item or a service. Choose the field to select an item card that represents the item or service.';

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
//                     ToolTip = 'Specifies the description of the product that you entered in Item No. field. To add a message for the customer, enter text in the Description/Comment field on an empty line.';

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
//                     Width = 8;

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
//                     Width = 8;

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
//                     Width = 8;

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
//                 field("Allow Invoice Disc."; Rec."Allow Invoice Disc.")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = RowEditable;
//                     Enabled = RowEditable;
//                     ToolTip = 'Specifies whether the invoice line is included when the invoice discount is calculated.';
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
//                 field("Inv. Discount Amount"; Rec."Inv. Discount Amount")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                     Enabled = RowEditable;
//                     ToolTip = 'Specifies the invoice discount amount that was calculated on the line if you clicked Actions, Functions and then clicked Calculate Invoice Discount. If you have placed a check mark in the Prices Including VAT field, the amount displayed will include VAT.';
//                     Visible = false;

//                     trigger OnValidate()
//                     begin
//                         UpdatePage;
//                     end;
//                 }
//                 field("Job No."; Rec."Job No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'If you fill in this field and the  Job Task No. field, then a job ledger entry will be posted together with the purchase order line.';
//                 }
//                 field("Job Task No."; Rec."Job Task No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the number of the job task that corresponds to the purchase document (invoice or credit memo). You must enter a job number in the Job No. field before you can enter a job task number in this field.';
//                 }
//                 field("Job Line Type"; Rec."Job Line Type")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies a Job Planning Line together with the posting of a job ledger entry. The options are:';
//                     Visible = false;
//                 }
//                 field("Job Unit Price"; Rec."Job Unit Price")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the sales price per unit that applies to the item or general ledger expense that will be posted on the job that is linked to the purchase line. The amount must be entered in the currency specified for the job.';
//                     Visible = false;
//                 }
//                 field("Job Line Amount"; Rec."Job Line Amount")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the net amount of the line that the purchase line applies to. The amount is in the currency specified for the job.';
//                     Visible = false;
//                 }
//                 field("Job Line Discount Amount"; Rec."Job Line Discount Amount")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the amount of the discount that the purchase line applies to. The amount is in the currency specified for the job.';
//                     Visible = false;
//                 }
//                 field("Job Line Discount %"; Rec."Job Line Discount %")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the line discount percent that applies to the item or general ledger expense that will be posted on the job linked to the purchase line.';
//                     Visible = false;
//                 }
//                 field("Job Total Price"; Rec."Job Total Price")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the gross amount of the line that the purchase line applies to. The amount is in the currency specified for the job.';
//                     Visible = false;
//                 }
//                 field("Job Unit Price (LCY)"; Rec."Job Unit Price (LCY)")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the sales price per unit that applies to the item or general ledger expense that will be posted on the job that is linked to the purchase line. The amount must be specified in your local currency.';
//                     Visible = false;
//                 }
//                 field("Job Total Price (LCY)"; Rec."Job Total Price (LCY)")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the gross amount of the line, in the local currency.';
//                     Visible = false;
//                 }
//                 field("Job Line Amount (LCY)"; Rec."Job Line Amount (LCY)")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the net amount of the line that the purchase line applies to. The amount is in the local currency.';
//                     Visible = false;
//                 }
//                 field("Job Line Disc. Amount (LCY)"; Rec."Job Line Disc. Amount (LCY)")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the amount of the discount that the purchase line applies to. The amount is in the local currency.';
//                     Visible = false;
//                 }
//                 field("Deferral Code"; Rec."Deferral Code")
//                 {
//                     ApplicationArea = Basic;
//                     TableRelation = "Deferral Template"."Deferral Code";
//                 }
//             }
//             group(Control25)
//             {
//                 group(Control22)
//                 {
//                     field("Invoice Discount Amount"; TotalPurchaseHeader."Invoice Discount Amount")
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalPurchaseHeader."Currency Code";
//                         AutoFormatType = 1;
//                         Caption = 'Invoice Discount Amount';
//                         Editable = InvDiscAmountEditable;
//                         ToolTip = 'Specifies a discount amount that is deducted from the value in the Total Incl. VAT field. You can enter or change the amount manually. If you have set up invoice discounts, the specified percentage is shown in the Invoice Discount % field if the criteria are met. The calculated discount amount is then inserted in the Invoice Discount Amount field.';

//                         trigger OnValidate()
//                         var
//                             PurchaseHeader: Record "Purchase Header";
//                         begin
//                             PurchaseHeader.Get(Rec."Document Type", Rec."Document No.");
//                             MiniPurchCalcDiscByType.ApplyInvDiscBasedOnAmt(TotalPurchaseHeader."Invoice Discount Amount", PurchaseHeader);
//                             CurrPage.Update;
//                         end;
//                     }
//                     field("Cust. Invoice Disc. Pct."; MiniPurchCalcDiscByType.GetVendInvoiceDiscountPct(Rec))
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Vendor Invoice Discount %';
//                         DecimalPlaces = 0 : 1;
//                         Editable = false;
//                         ToolTip = 'Specifies a discount percentage that is granted if the criteria are met that you have set up for invoice discounts. The calculated discount amount is inserted in the Invoice Discount Amount field, but you can change it manually.';
//                         Visible = true;
//                     }
//                 }
//                 group(Control12)
//                 {
//                     field("Total Amount Excl. VAT"; TotalPurchaseHeader.Amount)
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalPurchaseHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalExclVATCaption(TotalPurchaseHeader."Currency Code");
//                         Caption = 'Total Amount Excl. VAT';
//                         DrillDown = false;
//                         Editable = false;
//                         ToolTip = 'Specifies the sum of the value in the Line Amount Excl. VAT field on all lines in the document minus any discount amount in the Invoice Discount Amount field. Note that amounts on document lines are shown with or without VAT depending on what you selected in the Prices Including VAT field on the customer or vendor card.';
//                     }
//                     field("Total VAT Amount"; VATAmount)
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalPurchaseHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalVATCaption(TotalPurchaseHeader."Currency Code");
//                         Caption = 'Total VAT';
//                         Editable = false;
//                         ToolTip = 'Specifies the sum of VAT amounts on all lines in the document. Note that amounts on document lines are shown with or without VAT depending on what you selected in the Prices Including VAT field on the customer or vendor card.';
//                     }
//                     field("Total Amount Incl. VAT"; TotalPurchaseHeader."Amount Including VAT")
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalPurchaseHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalInclVATCaption(TotalPurchaseHeader."Currency Code");
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
//             action(InsertExtTexts)
//             {
//                 AccessByPermission = TableData "Extended Text Header" = R;
//                 ApplicationArea = Basic;
//                 Caption = 'Insert &Ext. Texts';
//                 Image = Text;
//                 Scope = Repeater;
//                 ToolTip = 'Insert the extended item description that is set up for the item on the purchase document line.';

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
//                 ToolTip = 'View or edit the dimension sets that are set up for the combination of vendor and item on the purchase document line.';

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
//                     TotalPurchaseHeader.Get(Rec."Document Type", Rec."Document No.");
//                     Rec.ShowDeferrals(TotalPurchaseHeader."Posting Date", TotalPurchaseHeader."Currency Code");
//                 end;
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     var
//         SalesLine: Record "Sales Line";
//     begin
//         MiniDocumentTotals.CalculatePurchHeaderTotals(TotalPurchaseHeader, VATAmount, Rec);
//         UpdateEditableOnRow;

//         SalesLine.SetRange("Document Type", Rec."Document Type");
//         SalesLine.SetRange("Document No.", Rec."Document No.");
//         InvDiscAmountEditable := SalesLine.FindFirst and CurrPage.Editable;
//     end;

//     trigger OnDeleteRecord(): Boolean
//     begin
//         Rec.Delete;
//         MiniDocumentTotals.CalculatePurchHeaderTotals(TotalPurchaseHeader, VATAmount, Rec);
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
//         TotalPurchaseHeader: Record "Purchase Header";
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
//             TransferExtendedText.InsertPurchExtText(Rec);
//         end;
//         if TransferExtendedText.MakeUpdate then
//             UpdatePage;
//     end;

//     local procedure UpdatePage()
//     var
//         PurchaseHeader: Record "Purchase Header";
//     begin
//         CurrPage.Update;
//         PurchaseHeader.Get(Rec."Document Type", Rec."Document No.");
//         MiniPurchCalcDiscByType.ApplyDefaultInvoiceDiscount(TotalPurchaseHeader."Invoice Discount Amount", PurchaseHeader);
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
