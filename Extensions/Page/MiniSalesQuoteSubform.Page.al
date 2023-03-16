// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1325 "Mini Sales Quote Subform"
// {
//     AutoSplitKey = true;
//     Caption = 'Lines';
//     DelayedInsert = true;
//     LinksAllowed = false;
//     MultipleNewLines = true;
//     PageType = ListPart;
//     SourceTable = "Sales Line";
//     SourceTableView = where("Document Type" = filter(Quote));

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
//                     ToolTip = 'Specifies the number of a general ledger account, an item, a resource, an additional cost or a fixed asset, depending on what you selected in the Type field.';

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
//                     ToolTip = 'Specifies an item cross-reference number.';
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
//                     ToolTip = 'Specifies how many units are being sold. This field affects the values in the Line Amount and Line Discount Amount fields and the Total fields at the bottom of the Lines FastTab.';
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
//                     ToolTip = 'Specifies the unit of measure that is used to determine the value in the Unit Price field on the sales line. By default, the field is filled with the value in the Sales Unit of Measure field on the item card or the Base Unit of Measure field on the resource card.';
//                     Width = 8;

//                     trigger OnValidate()
//                     begin
//                         UpdatePage;
//                     end;
//                 }
//                 field("Unit Price"; Rec."Unit Price")
//                 {
//                     ApplicationArea = Basic;
//                     BlankZero = true;
//                     Editable = RowEditable;
//                     Enabled = RowEditable;
//                     ShowMandatory = true;
//                     ToolTip = 'Specifies the price for one unit on the sales line. By default, the field is filled with the value in the Unit Price field on the item or resource card.';

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
//                     ToolTip = 'Contains the line discount percentage that is valid for the item quantity on the line.';
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
//                     ToolTip = 'Specifies the amount of the discount that will be given on the invoice line. The program uses the Line Discount %, Quantity and Unit Price tables to calculate the amount.';
//                     Visible = false;

//                     trigger OnValidate()
//                     begin
//                         UpdatePage;
//                     end;
//                 }
//                 field("Allow Invoice Disc."; Rec."Allow Invoice Disc.")
//                 {
//                     ApplicationArea = Basic;
//                     BlankZero = true;
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
//                     ToolTip = 'Specifies the amount of the sales line, calculated as the quantity times the unit price minus any percentage value in the Line Discount % field. If the Prices Including VAT check box on the customer card is selected, the amount includes VAT.';

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
//                     ToolTip = 'Specifies the invoice discount amount that is calculated on the line if you click Actions, point to Functions, and then click Calculate Invoice Discount. If you have placed a check mark in the Prices Including VAT field, the amount displayed include VATs.';
//                     Visible = false;

//                     trigger OnValidate()
//                     begin
//                         UpdatePage;
//                     end;
//                 }
//             }
//             group(Control103)
//             {
//                 group(Control106)
//                 {
//                     field("Invoice Discount Amount"; TotalSalesHeader."Invoice Discount Amount")
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalSalesHeader."Currency Code";
//                         AutoFormatType = 1;
//                         Caption = 'Invoice Discount Amount';
//                         Editable = InvDiscAmountEditable;

//                         trigger OnValidate()
//                         var
//                             SalesHeader: Record "Sales Header";
//                         begin
//                             SalesHeader.Get(Rec."Document Type", Rec."Document No.");
//                             MiniSalesCalcDiscByType.ApplyInvDiscBasedOnAmt(TotalSalesHeader."Invoice Discount Amount", SalesHeader);
//                             CurrPage.Update;
//                         end;
//                     }
//                     field("Cust. Invoice Disc. Pct."; MiniSalesCalcDiscByType.GetCustInvoiceDiscountPct(Rec))
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Customer Invoice Discount %';
//                         DecimalPlaces = 0 : 1;
//                         Editable = false;
//                         Visible = true;
//                     }
//                 }
//                 group(Control131)
//                 {
//                     field("Total Amount Excl. VAT"; TotalSalesHeader.Amount)
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalSalesHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalExclVATCaption(TotalSalesHeader."Currency Code");
//                         Caption = 'Total Amount Excl. VAT';
//                         DrillDown = false;
//                         Editable = false;
//                     }
//                     field("Total VAT Amount"; VATAmount)
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalSalesHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalVATCaption(TotalSalesHeader."Currency Code");
//                         Caption = 'Total VAT';
//                         Editable = false;
//                     }
//                     field("Total Amount Incl. VAT"; TotalSalesHeader."Amount Including VAT")
//                     {
//                         ApplicationArea = Basic;
//                         AutoFormatExpression = TotalSalesHeader."Currency Code";
//                         AutoFormatType = 1;
//                         CaptionClass = MiniDocumentTotals.GetTotalInclVATCaption(TotalSalesHeader."Currency Code");
//                         Caption = 'Total Amount Incl. VAT';
//                         Editable = false;
//                         Style = Strong;
//                         StyleExpr = true;
//                     }
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             action(InsertExtText)
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
//                 ToolTip = 'View or edit the dimension sets that are set up for the combination of customer and item on the invoice line.';

//                 trigger OnAction()
//                 begin
//                     Rec.ShowDimensions;
//                 end;
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     var
//         SalesLine: Record "Sales Line";
//     begin
//         MiniDocumentTotals.CalculateSalesHeaderTotals(TotalSalesHeader, VATAmount, Rec);
//         UpdateEditableOnRow;

//         SalesLine.SetRange("Document Type", Rec."Document Type");
//         SalesLine.SetRange("Document No.", Rec."Document No.");
//         InvDiscAmountEditable := SalesLine.FindFirst and CurrPage.Editable;
//     end;

//     trigger OnDeleteRecord(): Boolean
//     begin
//         Rec.Delete;
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
//         TotalSalesHeader: Record "Sales Header";
//         TransferExtendedText: Codeunit "Transfer Extended Text";
//         MiniSalesCalcDiscByType: Codeunit 1300;
//         MiniDocumentTotals: Codeunit 1301;
//         VATAmount: Decimal;
//         RowEditable: Boolean;
//         InvDiscAmountEditable: Boolean;

//     local procedure InsertExtendedText(Unconditionally: Boolean)
//     begin
//         if TransferExtendedText.SalesCheckIfAnyExtText(Rec, Unconditionally) then begin
//             CurrPage.SaveRecord;
//             Commit;
//             TransferExtendedText.InsertSalesExtText(Rec);
//         end;
//         if TransferExtendedText.MakeUpdate then
//             UpdatePage;
//     end;

//     local procedure UpdatePage()
//     var
//         SalesHeader: Record "Sales Header";
//     begin
//         CurrPage.Update;
//         SalesHeader.Get(Rec."Document Type", Rec."Document No.");
//         MiniSalesCalcDiscByType.ApplyDefaultInvoiceDiscount(TotalSalesHeader."Invoice Discount Amount", SalesHeader);
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
