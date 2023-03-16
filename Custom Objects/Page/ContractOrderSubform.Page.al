page 52186139 "Contract Order Subform"
{
    AutoSplitKey = true;
    Caption = 'Contract Order Subform';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Purchase Line";
    SourceTableView = WHERE("Document Type" = FILTER(Order));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Type; Rec.Type)
                {

                    trigger OnValidate()
                    begin
                        NoOnAfterValidate;
                        TypeChosen := Rec.HasTypeToFillMandatoryFields;

                        if xRec."No." <> '' then
                            RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Expense Code"; Rec."Expense Code")
                {
                }
                field("No."; Rec."No.")
                {
                    ShowMandatory = TypeChosen;

                    trigger OnValidate()
                    begin
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;

                        if xRec."No." <> '' then
                            RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Cross-Reference No."; Rec."Cross-Reference No.")
                {
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        //here//CrossReferenceNoLookUp;
                        InsertExtendedText(false);
                        NoOnAfterValidate;
                    end;

                    trigger OnValidate()
                    begin
                        CrossReferenceNoOnAfterValidat;
                        NoOnAfterValidate;
                    end;
                }
                field("IC Partner Code"; Rec."IC Partner Code")
                {
                    Visible = false;
                }
                field("IC Partner Ref. Type"; Rec."IC Partner Ref. Type")
                {
                    Visible = false;
                }
                field("IC Partner Reference"; Rec."IC Partner Reference")
                {
                    Visible = false;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    Visible = false;
                }
                field(Nonstock; Rec.Nonstock)
                {
                    Visible = false;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    Visible = false;

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field(Description; Rec.Description)
                {
                }
                field("Drop Shipment"; Rec."Drop Shipment")
                {
                    Visible = false;
                }
                field("Return Reason Code"; Rec."Return Reason Code")
                {
                    Visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    Visible = false;
                }
                field(Quantity; Rec.Quantity)
                {
                    BlankZero = true;
                    ShowMandatory = TypeChosen;

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Reserved Quantity"; Rec."Reserved Quantity")
                {
                    BlankZero = true;
                }
                field("Job Remaining Qty."; Rec."Job Remaining Qty.")
                {
                    BlankZero = true;
                    Visible = false;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    Visible = false;

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    BlankZero = true;
                    ShowMandatory = TypeChosen;

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Indirect Cost %"; Rec."Indirect Cost %")
                {
                    Visible = false;

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    Visible = false;

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Unit Price (LCY)"; Rec."Unit Price (LCY)")
                {
                    BlankZero = true;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    BlankZero = true;

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    BlankZero = true;

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    Visible = false;

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Prepayment %"; Rec."Prepayment %")
                {
                    Visible = false;

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Prepmt. Line Amount"; Rec."Prepmt. Line Amount")
                {
                    Visible = false;

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Prepmt. Amt. Inv."; Rec."Prepmt. Amt. Inv.")
                {
                    Visible = false;

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Allow Invoice Disc."; Rec."Allow Invoice Disc.")
                {
                    Visible = false;
                }
                field("Inv. Discount Amount"; Rec."Inv. Discount Amount")
                {
                    Visible = false;
                }
                field("Qty. to Receive"; Rec."Qty. to Receive")
                {
                    BlankZero = true;
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                    BlankZero = true;
                }
                field("Qty. to Invoice"; Rec."Qty. to Invoice")
                {
                    BlankZero = true;
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
                    BlankZero = true;
                }
                field("Prepmt Amt to Deduct"; Rec."Prepmt Amt to Deduct")
                {
                    Visible = false;
                }
                field("Prepmt Amt Deducted"; Rec."Prepmt Amt Deducted")
                {
                    Visible = false;
                }
                field("Allow Item Charge Assignment"; Rec."Allow Item Charge Assignment")
                {
                    Visible = false;
                }
                field("Qty. to Assign"; Rec."Qty. to Assign")
                {
                    BlankZero = true;

                    trigger OnDrillDown()
                    begin
                        CurrPage.SaveRecord;
                        Rec.ShowItemChargeAssgnt;
                        UpdateForm(false);
                    end;
                }
                field("Qty. Assigned"; Rec."Qty. Assigned")
                {
                    BlankZero = true;

                    trigger OnDrillDown()
                    begin
                        CurrPage.SaveRecord;
                        Rec.ShowItemChargeAssgnt;
                        UpdateForm(false);
                    end;
                }
                field("Job No."; Rec."Job No.")
                {
                    Visible = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    Visible = false;
                }
                field("Job Planning Line No."; Rec."Job Planning Line No.")
                {
                    Visible = false;
                }
                field("Job Line Type"; Rec."Job Line Type")
                {
                    Visible = false;
                }
                field("Job Unit Price"; Rec."Job Unit Price")
                {
                    Visible = false;
                }
                field("Job Line Amount"; Rec."Job Line Amount")
                {
                    Visible = false;
                }
                field("Job Line Discount Amount"; Rec."Job Line Discount Amount")
                {
                    Visible = false;
                }
                field("Job Line Discount %"; Rec."Job Line Discount %")
                {
                    Visible = false;
                }
                field("Job Total Price"; Rec."Job Total Price")
                {
                    Visible = false;
                }
                field("Job Unit Price (LCY)"; Rec."Job Unit Price (LCY)")
                {
                    Visible = false;
                }
                field("Job Total Price (LCY)"; Rec."Job Total Price (LCY)")
                {
                    Visible = false;
                }
                field("Job Line Amount (LCY)"; Rec."Job Line Amount (LCY)")
                {
                    Visible = false;
                }
                field("Job Line Disc. Amount (LCY)"; Rec."Job Line Disc. Amount (LCY)")
                {
                    Visible = false;
                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    Visible = false;
                }
                field("Promised Receipt Date"; Rec."Promised Receipt Date")
                {
                    Visible = false;
                }
                field("Planned Receipt Date"; Rec."Planned Receipt Date")
                {
                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                }
                field("Order Date"; Rec."Order Date")
                {
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    Visible = false;
                }
                field("Planning Flexibility"; Rec."Planning Flexibility")
                {
                    Visible = false;
                }
                field("Prod. Order No."; Rec."Prod. Order No.")
                {
                    Visible = false;
                }
                field("Prod. Order Line No."; Rec."Prod. Order Line No.")
                {
                    Visible = false;
                }
                field("Operation No."; Rec."Operation No.")
                {
                    Visible = false;
                }
                field("Work Center No."; Rec."Work Center No.")
                {
                    Visible = false;
                }
                field(Finished; Rec.Finished)
                {
                    Visible = false;
                }
                field("Whse. Outstanding Qty. (Base)"; Rec."Whse. Outstanding Qty. (Base)")
                {
                    Visible = false;
                }
                field("Inbound Whse. Handling Time"; Rec."Inbound Whse. Handling Time")
                {
                    Visible = false;
                }
                field("Blanket Order No."; Rec."Blanket Order No.")
                {
                    Visible = false;
                }
                field("Blanket Order Line No."; Rec."Blanket Order Line No.")
                {
                    Visible = false;
                }
                field("Appl.-to Item Entry"; Rec."Appl.-to Item Entry")
                {
                    Visible = false;
                }
                field("Deferral Code"; Rec."Deferral Code")
                {
                    Enabled = (Rec.Type <> Rec.Type::"Fixed Asset") AND (Rec.Type <> Rec.Type::" ");
                    TableRelation = "Deferral Template"."Deferral Code";
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                // field("ShortcutDimCode[3]"; Rec.ShortcutDimCode[3])
                // {
                //     CaptionClass = '1,2,3';
                //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                //                                                   "Dimension Value Type" = CONST(Standard),
                //                                                   Blocked = CONST(false));
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                //     end;
                // }
                // field("ShortcutDimCode[4]"; Rec.ShortcutDimCode[4])
                // {
                //     CaptionClass = '1,2,4';
                //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                //                                                   "Dimension Value Type" = CONST(Standard),
                //                                                   Blocked = CONST(false));
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                //     end;
                // }
                // field("ShortcutDimCode[5]"; Rec.ShortcutDimCode[5])
                // {
                //     CaptionClass = '1,2,5';
                //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                //                                                   "Dimension Value Type" = CONST(Standard),
                //                                                   Blocked = CONST(false));
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                //     end;
                // }
                // field("ShortcutDimCode[6]"; Rec.ShortcutDimCode[6])
                // {
                //     CaptionClass = '1,2,6';
                //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                //                                                   "Dimension Value Type" = CONST(Standard),
                //                                                   Blocked = CONST(false));
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                //     end;
                // }
                // field("ShortcutDimCode[7]"; Rec.ShortcutDimCode[7])
                // {
                //     CaptionClass = '1,2,7';
                //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                //                                                   "Dimension Value Type" = CONST(Standard),
                //                                                   Blocked = CONST(false));
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                //     end;
                // }
                // field("ShortcutDimCode[8]"; Rec.ShortcutDimCode[8])
                // {
                //     CaptionClass = '1,2,8';
                //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                //                                                   "Dimension Value Type" = CONST(Standard),
                //                                                   Blocked = CONST(false));
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                //     end;
                // }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                }
            }
            group(Control43)
            {
                ShowCaption = false;
                group(Control37)
                {
                    ShowCaption = false;
                    // field("Invoice Discount Amount"; Rec.TotalPurchaseLine."Inv. Discount Amount")
                    // {
                    //     AutoFormatExpression = TotalPurchaseHeader."Currency Code";
                    //     AutoFormatType = 1;
                    //     Caption = 'Invoice Discount Amount';
                    //     Editable = InvDiscAmountEditable;
                    //     Style = Subordinate;
                    //     StyleExpr = RefreshMessageEnabled;

                    //     trigger OnValidate()
                    //     var
                    //         PurchaseHeader: Record "Purchase Header";
                    //     begin
                    //         PurchaseHeader.Get("Document Type", "Document No.");
                    //         PurchCalcDiscByType.ApplyInvDiscBasedOnAmt(TotalPurchaseLine."Inv. Discount Amount", PurchaseHeader);
                    //         CurrPage.Update(false);
                    //     end;
                    // }
                    // field("Invoice Disc. Pct."; Rec.PurchCalcDiscByType.GetVendInvoiceDiscountPct(Rec))
                    // {
                    //     Caption = 'Invoice Discount %';
                    //     DecimalPlaces = 0 : 2;
                    //     Editable = false;
                    //     Style = Subordinate;
                    //     StyleExpr = RefreshMessageEnabled;
                    //     Visible = true;
                    // }
                }
                group(Control19)
                {
                    ShowCaption = false;
                    // field("Total Amount Excl. VAT"; Rec.TotalPurchaseLine.Amount)
                    // {
                    //     AutoFormatExpression = TotalPurchaseHeader."Currency Code";
                    //     AutoFormatType = 1;
                    //     CaptionClass = DocumentTotals.GetTotalExclVATCaption(PurchHeader."Currency Code");
                    //     Caption = 'Total Amount Excl. VAT';
                    //     DrillDown = false;
                    //     Editable = false;
                    //     Style = Subordinate;
                    //     StyleExpr = RefreshMessageEnabled;
                    // }
                    // field("Total VAT Amount"; Rec.VATAmount)
                    // {
                    //     AutoFormatExpression = TotalPurchaseHeader."Currency Code";
                    //     AutoFormatType = 1;
                    //     CaptionClass = DocumentTotals.GetTotalVATCaption(PurchHeader."Currency Code");
                    //     Caption = 'Total VAT';
                    //     Editable = false;
                    //     Style = Subordinate;
                    //     StyleExpr = RefreshMessageEnabled;
                    // }
                    // field("Total Amount Incl. VAT"; Rec.TotalPurchaseLine."Amount Including VAT")
                    // {
                    //     AutoFormatExpression = TotalPurchaseHeader."Currency Code";
                    //     AutoFormatType = 1;
                    //     CaptionClass = DocumentTotals.GetTotalInclVATCaption(PurchHeader."Currency Code");
                    //     Caption = 'Total Amount Incl. VAT';
                    //     Editable = false;
                    //     StyleExpr = TotalAmountStyle;
                    // }
                    // field(RefreshTotals; Rec.RefreshMessageText)
                    // {
                    //     DrillDown = true;
                    //     Editable = false;
                    //     Enabled = RefreshMessageEnabled;
                    //     ShowCaption = false;

                    //     trigger OnDrillDown()
                    //     begin
                    //         DocumentTotals.PurchaseRedistributeInvoiceDiscountAmounts(Rec, VATAmount, TotalPurchaseLine);
                    //         CurrPage.Update(false);
                    //     end;
                    // }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    Image = ItemAvailability;
                    action("Event")
                    {
                        Caption = 'Event';
                        Image = "Event";

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByEvent)
                        end;
                    }
                    action(Period)
                    {
                        Caption = 'Period';
                        Image = Period;

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByPeriod)
                        end;
                    }
                    action(Variant)
                    {
                        Caption = 'Variant';
                        Image = ItemVariant;

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByVariant)
                        end;
                    }
                    action(Location)
                    {
                        AccessByPermission = TableData Location = R;
                        Caption = 'Location';
                        Image = Warehouse;

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByLocation)
                        end;
                    }
                    action("BOM Level")
                    {
                        Caption = 'BOM Level';
                        Image = BOMLevel;

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByBOM)
                        end;
                    }
                }
                action("Reservation Entries")
                {
                    AccessByPermission = TableData Item = R;
                    Caption = 'Reservation Entries';
                    Image = ReservationLedger;

                    trigger OnAction()
                    begin
                        Rec.ShowReservationEntries(true);
                    end;
                }
                action("Item Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction()
                    begin
                        Rec.OpenItemTrackingLines;
                    end;
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDimensions;
                    end;
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;

                    trigger OnAction()
                    begin
                        Rec.ShowLineComments;
                    end;
                }
                action(ItemChargeAssignment)
                {
                    AccessByPermission = TableData "Item Charge" = R;
                    Caption = 'Item Charge &Assignment';
                    Image = ItemCosts;

                    trigger OnAction()
                    begin
                        Rec.ShowItemChargeAssgnt;
                    end;
                }
                action(DeferralSchedule)
                {
                    Caption = 'Deferral Schedule';
                    Enabled = Rec."Deferral Code" <> '';
                    Image = PaymentPeriod;

                    trigger OnAction()
                    begin
                        PurchHeader.Get(Rec."Document Type", Rec."Document No.");
                        Rec.ShowDeferrals(PurchHeader."Posting Date", PurchHeader."Currency Code")
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("E&xplode BOM")
                {
                    AccessByPermission = TableData "BOM Component" = R;
                    Caption = 'E&xplode BOM';
                    Image = ExplodeBOM;

                    trigger OnAction()
                    begin
                        ExplodeBOM;
                    end;
                }
                action("Insert Ext. Texts")
                {
                    AccessByPermission = TableData "Extended Text Header" = R;
                    Caption = 'Insert &Ext. Texts';
                    Image = Text;

                    trigger OnAction()
                    begin
                        InsertExtendedText(true);
                    end;
                }
                action(Reserve)
                {
                    Caption = '&Reserve';
                    Ellipsis = true;
                    Image = Reserve;

                    trigger OnAction()
                    begin
                        Rec.Find;
                        Rec.ShowReservation;
                    end;
                }
                action(OrderTracking)
                {
                    Caption = 'Order &Tracking';
                    Image = OrderTracking;

                    trigger OnAction()
                    begin
                        ShowTracking;
                    end;
                }
            }
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                group("Dr&op Shipment")
                {
                    Caption = 'Dr&op Shipment';
                    Image = Delivery;
                    action("Sales &Order")
                    {
                        AccessByPermission = TableData "Sales Shipment Header" = R;
                        Caption = 'Sales &Order';
                        Image = Document;

                        trigger OnAction()
                        begin
                            OpenSalesOrderForm;
                        end;
                    }
                }
                group("Speci&al Order")
                {
                    Caption = 'Speci&al Order';
                    Image = SpecialOrder;
                    action(Action1901038504)
                    {
                        AccessByPermission = TableData "Sales Shipment Header" = R;
                        Caption = 'Sales &Order';
                        Image = Document;

                        trigger OnAction()
                        begin
                            OpenSpecOrderSalesOrderForm;
                        end;
                    }
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if PurchHeader.Get(Rec."Document Type", Rec."Document No.") then;

        DocumentTotals.PurchaseUpdateTotalsControls(Rec, TotalPurchaseHeader, TotalPurchaseLine, RefreshMessageEnabled,
          TotalAmountStyle, RefreshMessageText, InvDiscAmountEditable, VATAmount);
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
        TypeChosen := Rec.HasTypeToFillMandatoryFields;
    end;

    trigger OnDeleteRecord(): Boolean
    var
        ReservePurchLine: Codeunit "Purch. Line-Reserve";
    begin
        if (Rec.Quantity <> 0) and Rec.ItemExists(Rec."No.") then begin
            Commit;
            if not ReservePurchLine.DeleteLineConfirm(Rec) then
                exit(false);
            ReservePurchLine.DeleteLine(Rec);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.InitType;
        Clear(ShortcutDimCode);
    end;

    var
        TotalPurchaseHeader: Record "Purchase Header";
        TotalPurchaseLine: Record "Purchase Line";
        PurchHeader: Record "Purchase Header";
        TransferExtendedText: Codeunit "Transfer Extended Text";
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
        Text000: Label 'Unable to run this function while in View mode.';
        PurchPriceCalcMgt: Codeunit "Purch. Price Calc. Mgt.";
        Text001: Label 'You cannot use the Explode BOM function because a prepayment of the purchase order has been invoiced.';
        PurchCalcDiscByType: Codeunit "Purch - Calc Disc. By Type";
        DocumentTotals: Codeunit "Document Totals";
        ShortcutDimCode: array[8] of Code[20];
        UpdateAllowedVar: Boolean;
        VATAmount: Decimal;
        InvDiscAmountEditable: Boolean;
        TotalAmountStyle: Text;
        RefreshMessageEnabled: Boolean;
        RefreshMessageText: Text;
        TypeChosen: Boolean;

    //[Scope('Internal')]
    procedure ApproveCalcInvDisc()
    begin
        CODEUNIT.Run(CODEUNIT::"Purch.-Disc. (Yes/No)", Rec);
    end;

    local procedure CalcInvDisc()
    begin
        CODEUNIT.Run(CODEUNIT::"Purch.-Calc.Discount", Rec);
    end;

    local procedure ExplodeBOM()
    begin
        if Rec."Prepmt. Amt. Inv." <> 0 then
            Error(Text001);
        CODEUNIT.Run(CODEUNIT::"Purch.-Explode BOM", Rec);
    end;

    local procedure OpenSalesOrderForm()
    var
        SalesHeader: Record "Sales Header";
        SalesOrder: Page "Sales Order";
    begin
        Rec.TestField("Sales Order No.");
        SalesHeader.SetRange("No.", Rec."Sales Order No.");
        SalesOrder.SetTableView(SalesHeader);
        SalesOrder.Editable := false;
        SalesOrder.Run;
    end;

    local procedure InsertExtendedText(Unconditionally: Boolean)
    begin
        if TransferExtendedText.PurchCheckIfAnyExtText(Rec, Unconditionally) then begin
            CurrPage.SaveRecord;
            TransferExtendedText.InsertPurchExtText(Rec);
        end;
        if TransferExtendedText.MakeUpdate then
            UpdateForm(true);
    end;

    //[Scope('Internal')]
    procedure ShowTracking()
    var
        TrackingForm: Page "Order Tracking";
    begin
        TrackingForm.SetPurchLine(Rec);
        TrackingForm.RunModal;
    end;

    local procedure OpenSpecOrderSalesOrderForm()
    var
        SalesHeader: Record "Sales Header";
        SalesOrder: Page "Sales Order";
    begin
        Rec.TestField("Special Order Sales No.");
        SalesHeader.SetRange("No.", Rec."Special Order Sales No.");
        SalesOrder.SetTableView(SalesHeader);
        SalesOrder.Editable := false;
        SalesOrder.Run;
    end;

    //[Scope('Internal')]
    procedure UpdateForm(SetSaveRecord: Boolean)
    begin
        CurrPage.Update(SetSaveRecord);
    end;

    //[Scope('Internal')]
    procedure SetUpdateAllowed(UpdateAllowed: Boolean)
    begin
        UpdateAllowedVar := UpdateAllowed;
    end;

    local procedure UpdateAllowed(): Boolean
    begin
        if UpdateAllowedVar = false then begin
            Message(Text000);
            exit(false);
        end;
        exit(true);
    end;

    local procedure ShowPrices()
    begin
        PurchHeader.Get(Rec."Document Type", Rec."Document No.");
        Clear(PurchPriceCalcMgt);
        PurchPriceCalcMgt.GetPurchLinePrice(PurchHeader, Rec);
    end;

    local procedure ShowLineDisc()
    begin
        PurchHeader.Get(Rec."Document Type", Rec."Document No.");
        Clear(PurchPriceCalcMgt);
        PurchPriceCalcMgt.GetPurchLineLineDisc(PurchHeader, Rec);
    end;

    local procedure NoOnAfterValidate()
    begin
        InsertExtendedText(false);
        if (Rec.Type = Rec.Type::"Charge (Item)") and (Rec."No." <> xRec."No.") and
           (xRec."No." <> '')
        then
            CurrPage.SaveRecord;
    end;

    local procedure CrossReferenceNoOnAfterValidat()
    begin
        InsertExtendedText(false);
    end;

    local procedure RedistributeTotalsOnAfterValidate()
    begin
        CurrPage.SaveRecord;

        PurchHeader.Get(Rec."Document Type", Rec."Document No.");
        if DocumentTotals.PurchaseCheckNumberOfLinesLimit(PurchHeader) then
            DocumentTotals.PurchaseRedistributeInvoiceDiscountAmounts(Rec, VATAmount, TotalPurchaseLine);
        CurrPage.Update;
    end;
}

