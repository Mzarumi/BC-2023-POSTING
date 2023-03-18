#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185456 pageextension52185456 extends "Sales Invoice Subform"
{
    layout
    {
        modify(Type)
        {
            ApplicationArea = Basic;
        }
        modify("No.")
        {
            ApplicationArea = Basic;
            ShowMandatory = TypeChosen;
        }
        // modify("Cross-Reference No.")
        // {
        //     ApplicationArea = Basic;
        // }
        modify("IC Partner Code")
        {
            ApplicationArea = Basic;
        }
        modify("IC Partner Ref. Type")
        {
            ApplicationArea = Basic;
        }
        modify("IC Partner Reference")
        {
            ApplicationArea = Basic;
        }
        modify("Variant Code")
        {
            ApplicationArea = Basic;
        }
        modify(Nonstock)
        {
            ApplicationArea = Basic;
        }
        modify("VAT Prod. Posting Group")
        {
            ApplicationArea = Basic;
        }
        // modify(Description)
        // {
        //     ApplicationArea = Basic;
        // }
        modify("Return Reason Code")
        {
            ApplicationArea = Basic;
        }
        // modify("Location Code")
        // {
        //     ApplicationArea = Basic;
        // }
        modify("Bin Code")
        {
            ApplicationArea = Basic;
        }
        modify(Quantity)
        {
            ApplicationArea = Basic;
            ShowMandatory = TypeChosen;
        }
        modify("Unit of Measure Code")
        {
            ApplicationArea = Basic;
        }
        modify("Unit of Measure")
        {
            ApplicationArea = Basic;
        }
        modify("Unit Cost (LCY)")
        {
            ApplicationArea = Basic;
        }
        modify(PriceExists)
        {
            ApplicationArea = Basic;
        }
        modify("Unit Price")
        {
            ApplicationArea = Basic;
            ShowMandatory = TypeChosen;
        }
        modify("Line Discount %")
        {
            ApplicationArea = Basic;
        }
        modify("Line Amount")
        {
            ApplicationArea = Basic;
        }
        modify(LineDiscExists)
        {
            ApplicationArea = Basic;
        }
        modify("Line Discount Amount")
        {
            ApplicationArea = Basic;
        }
        // modify("Allow Invoice Disc.")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("Inv. Discount Amount")
        // {
        //     ApplicationArea = Basic;
        // }
        modify("Allow Item Charge Assignment")
        {
            ApplicationArea = Basic;
        }
        modify("Qty. to Assign")
        {
            ApplicationArea = Basic;
            BlankZero = true;
        }
        modify("Qty. Assigned")
        {
            ApplicationArea = Basic;
        }
        modify("Job No.")
        {
            ApplicationArea = Basic;
        }
        modify("Job Task No.")
        {
            ApplicationArea = Basic;
        }
        modify("Job Contract Entry No.")
        {
            ApplicationArea = Basic;
        }
        modify("Tax Category")
        {
            ApplicationArea = Basic;
        }
        modify("Work Type Code")
        {
            ApplicationArea = Basic;
        }
        modify("Blanket Order No.")
        {
            ApplicationArea = Basic;
        }
        modify("Blanket Order Line No.")
        {
            ApplicationArea = Basic;
        }
        modify("FA Posting Date")
        {
            ApplicationArea = Basic;
        }
        modify("Depr. until FA Posting Date")
        {
            ApplicationArea = Basic;
        }
        modify("Depreciation Book Code")
        {
            ApplicationArea = Basic;
        }
        modify("Use Duplication List")
        {
            ApplicationArea = Basic;
        }
        modify("Duplicate in Depreciation Book")
        {
            ApplicationArea = Basic;
        }
        modify("Appl.-from Item Entry")
        {
            ApplicationArea = Basic;
        }
        modify("Appl.-to Item Entry")
        {
            ApplicationArea = Basic;
        }
        // modify("Deferral Code")
        // {
        //     ApplicationArea = Basic;
        // }
        modify("Shortcut Dimension 1 Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on ""Shortcut Dimension 1 Code"(Control 20)".

        }
        modify("Shortcut Dimension 2 Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on ""Shortcut Dimension 2 Code"(Control 22)".

        }
        modify(ShortcutDimCode3)
        {

            //Unsupported feature: Property Modification (Name) on "ShortcutDimCode3(Control 300)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on "ShortcutDimCode3(Control 300)".

        }
        modify(ShortcutDimCode4)
        {

            //Unsupported feature: Property Modification (Name) on "ShortcutDimCode4(Control 302)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on "ShortcutDimCode4(Control 302)".

        }
        modify(ShortcutDimCode5)
        {

            //Unsupported feature: Property Modification (Name) on "ShortcutDimCode5(Control 304)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on "ShortcutDimCode5(Control 304)".

        }
        modify(ShortcutDimCode6)
        {

            //Unsupported feature: Property Modification (Name) on "ShortcutDimCode6(Control 306)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on "ShortcutDimCode6(Control 306)".

        }
        modify(ShortcutDimCode7)
        {

            //Unsupported feature: Property Modification (Name) on "ShortcutDimCode7(Control 308)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on "ShortcutDimCode7(Control 308)".

        }
        modify(ShortcutDimCode8)
        {

            //Unsupported feature: Property Modification (Name) on "ShortcutDimCode8(Control 310)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on "ShortcutDimCode8(Control 310)".

        }
        modify("Document No.")
        {
            ApplicationArea = Basic;
        }
        modify("Line No.")
        {
            ApplicationArea = Basic;
        }
        modify("TotalSalesLine.""Line Amount""")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""TotalSalesLine.""Line Amount"""(Control 7)".


            //Unsupported feature: Property Modification (Name) on ""TotalSalesLine.""Line Amount"""(Control 7)".


            //Unsupported feature: Property Insertion (DrillDown) on ""TotalSalesLine.""Line Amount"""(Control 7)".

            Enabled = RefreshMessageEnabled;
            ShowCaption = false;
        }
        modify("Invoice Discount Amount")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Invoice Discount Amount"(Control 31)".


            //Unsupported feature: Property Modification (AutoFormatExpr) on ""Invoice Discount Amount"(Control 31)".

            Style = Subordinate;
            StyleExpr = RefreshMessageEnabled;
        }
        // modify("Invoice Disc. Pct.")
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (DecimalPlaces) on ""Invoice Disc. Pct."(Control 29)".


        //     //Unsupported feature: Property Modification (SourceExpr) on ""Invoice Disc. Pct."(Control 29)".

        //     Editable = false;

        //     //Unsupported feature: Property Insertion (Visible) on ""Invoice Disc. Pct."(Control 29)".

        //     Style = Subordinate;
        //     StyleExpr = RefreshMessageEnabled;
        // }
        modify("Total Amount Excl. VAT")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (AutoFormatExpr) on ""Total Amount Excl. VAT"(Control 13)".

            //CaptionClass = DocumentTotals.GetTotalExclVATCaption(SalesHeader."Currency Code");
            Style = Subordinate;
            StyleExpr = RefreshMessageEnabled;
        }
        modify("Total VAT Amount")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (AutoFormatExpr) on ""Total VAT Amount"(Control 11)".

            // CaptionClass = DocumentTotals.GetTotalVATCaption(SalesHeader."Currency Code");
            Style = Subordinate;
            StyleExpr = RefreshMessageEnabled;
        }
        modify("Total Amount Incl. VAT")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (AutoFormatExpr) on ""Total Amount Incl. VAT"(Control 9)".

            // CaptionClass = DocumentTotals.GetTotalInclVATCaption(SalesHeader."Currency Code");
            StyleExpr = TotalAmountStyle;
        }

        //Unsupported feature: Code Modification on "Type(Control 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        NoOnAfterValidate;
        UpdateEditableOnRow;
        UpdateTypeText;
        DeltaUpdateTotals;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TypeOnAfterValidate;
        NoOnAfterValidate;
        TypeChosen := HasTypeToFillMandatotyFields;

        IF xRec."No." <> '' THEN
          RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Type(Control 2)".

        modify(FilteredTypeField)
        {
            Visible = false;
        }


        //Unsupported feature: Code Modification on ""No."(Control 4).OnValidate".

        //trigger "(Control 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        NoOnAfterValidate;
        UpdateEditableOnRow;
        ShowShortcutDimCode(ShortcutDimCode);
        UpdateTypeText;
        DeltaUpdateTotals;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ShowShortcutDimCode(ShortcutDimCode);
        NoOnAfterValidate;

        IF xRec."No." <> '' THEN
          RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 4)".



        //Unsupported feature: Code Modification on ""Cross-Reference No."(Control 58).OnLookup".

        //trigger "(Control 58)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CrossReferenceNoLookUp;
        NoOnAfterValidate;
        UpdateEditableOnRow;
        OnCrossReferenceNoOnLookup(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CrossReferenceNoLookUp;
        InsertExtendedText(FALSE);
        NoOnAfterValidate;
        */
        //end;


        //Unsupported feature: Code Modification on ""Cross-Reference No."(Control 58).OnValidate".

        //trigger "(Control 58)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        NoOnAfterValidate;
        UpdateEditableOnRow;
        DeltaUpdateTotals;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CrossReferenceNoOnAfterValidat;
        NoOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Cross-Reference No."(Control 58)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""IC Partner Code"(Control 74)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""IC Partner Ref. Type"(Control 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""IC Partner Reference"(Control 70)".

        // modify("Variant Code")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Variant Code"(Control 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Nonstock(Control 62)".



        //Unsupported feature: Code Modification on ""VAT Prod. Posting Group"(Control 14).OnValidate".

        //trigger  Posting Group"(Control 14)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DeltaUpdateTotals;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Prod. Posting Group"(Control 14)".

        modify(Description)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 6)".


        //Unsupported feature: Property Deletion (ShowMandatory) on "Description(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Return Reason Code"(Control 50)".

        modify("Location Code")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Location Code"(Control 32)".


        //Unsupported feature: Property Deletion (Visible) on ""Location Code"(Control 32)".


        //Unsupported feature: Property Deletion (Enabled) on ""Location Code"(Control 32)".


        //Unsupported feature: Property Deletion (Editable) on ""Location Code"(Control 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bin Code"(Control 76)".



        //Unsupported feature: Code Modification on "Quantity(Control 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateAutoReserve;
        DeltaUpdateTotals;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        QuantityOnAfterValidate;
        RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Quantity(Control 8)".


        //Unsupported feature: Property Deletion (Enabled) on "Quantity(Control 8)".


        //Unsupported feature: Property Deletion (Editable) on "Quantity(Control 8)".



        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Control 34).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateAutoReserve;
        DeltaUpdateTotals;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        UnitofMeasureCodeOnAfterValida;
        RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit of Measure Code"(Control 34)".


        //Unsupported feature: Property Deletion (Enabled) on ""Unit of Measure Code"(Control 34)".


        //Unsupported feature: Property Deletion (Editable) on ""Unit of Measure Code"(Control 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit of Measure"(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit Cost (LCY)"(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PriceExists(Control 88)".



        //Unsupported feature: Code Modification on ""Unit Price"(Control 12).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DeltaUpdateTotals;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit Price"(Control 12)".


        //Unsupported feature: Property Deletion (Enabled) on ""Unit Price"(Control 12)".


        //Unsupported feature: Property Deletion (Editable) on ""Unit Price"(Control 12)".



        //Unsupported feature: Code Modification on ""Line Discount %"(Control 16).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DeltaUpdateTotals;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Line Discount %"(Control 16)".


        //Unsupported feature: Property Deletion (Enabled) on ""Line Discount %"(Control 16)".


        //Unsupported feature: Property Deletion (Editable) on ""Line Discount %"(Control 16)".



        //Unsupported feature: Code Modification on ""Line Amount"(Control 64).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DeltaUpdateTotals;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Line Amount"(Control 64)".


        //Unsupported feature: Property Deletion (Enabled) on ""Line Amount"(Control 64)".


        //Unsupported feature: Property Deletion (Editable) on ""Line Amount"(Control 64)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""Line Amount"(Control 64)".


        //Unsupported feature: Property Deletion (ToolTipML) on "LineDiscExists(Control 90)".



        //Unsupported feature: Code Modification on ""Line Discount Amount"(Control 40).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DeltaUpdateTotals;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Line Discount Amount"(Control 40)".

        modify("Allow Invoice Disc.")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Allow Invoice Disc."(Control 42)".

        modify("Inv. Discount Amount")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Inv. Discount Amount"(Control 80)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Allow Item Charge Assignment"(Control 84)".



        //Unsupported feature: Code Modification on ""Qty. to Assign"(Control 36).OnDrillDown".

        //trigger  to Assign"(Control 36)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SAVERECORD;
        ShowItemChargeAssgnt;
        UpdatePage(FALSE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CurrPage.SAVERECORD;
        ShowItemChargeAssgnt;
        UpdateForm(FALSE);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Qty. to Assign"(Control 36)".


        //Unsupported feature: Property Deletion (StyleExpr) on ""Qty. to Assign"(Control 36)".



        //Unsupported feature: Code Modification on ""Qty. Assigned"(Control 82).OnDrillDown".

        //trigger  Assigned"(Control 82)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SAVERECORD;
        ShowItemChargeAssgnt;
        UpdatePage(FALSE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CurrPage.SAVERECORD;
        ShowItemChargeAssgnt;
        UpdateForm(FALSE);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Qty. Assigned"(Control 82)".


        //Unsupported feature: Property Deletion (Visible) on ""Qty. Assigned"(Control 82)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job No."(Control 52)".


        //Unsupported feature: Property Deletion (Editable) on ""Job No."(Control 52)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Task No."(Control 18)".


        //Unsupported feature: Property Deletion (Editable) on ""Job Task No."(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Contract Entry No."(Control 60)".


        //Unsupported feature: Property Deletion (Editable) on ""Job Contract Entry No."(Control 60)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Tax Category"(Control 19)".

        modify("Shipping Agent Code")
        {
            Visible = false;
        }
        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Work Type Code"(Control 72)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Blanket Order No."(Control 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Blanket Order Line No."(Control 56)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""FA Posting Date"(Control 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Depr. until FA Posting Date"(Control 44)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Depreciation Book Code"(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Use Duplication List"(Control 68)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Duplicate in Depreciation Book"(Control 66)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Appl.-from Item Entry"(Control 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Appl.-to Item Entry"(Control 48)".

        modify("Deferral Code")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Deferral Code"(Control 21)".


        //Unsupported feature: Property Deletion (Visible) on ""Deferral Code"(Control 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shortcut Dimension 1 Code"(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shortcut Dimension 2 Code"(Control 22)".



        //Unsupported feature: Code Modification on "ShortcutDimCode3(Control 300).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(3,ShortcutDimCode[3]);

        OnAfterValidateShortcutDimCode(Rec,ShortcutDimCode,3);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateShortcutDimCode(3,ShortcutDimCode[3]);
        */
        //end;


        //Unsupported feature: Code Modification on "ShortcutDimCode4(Control 302).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(4,ShortcutDimCode[4]);

        OnAfterValidateShortcutDimCode(Rec,ShortcutDimCode,4);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateShortcutDimCode(4,ShortcutDimCode[4]);
        */
        //end;


        //Unsupported feature: Code Modification on "ShortcutDimCode5(Control 304).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(5,ShortcutDimCode[5]);

        OnAfterValidateShortcutDimCode(Rec,ShortcutDimCode,5);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateShortcutDimCode(5,ShortcutDimCode[5]);
        */
        //end;


        //Unsupported feature: Code Modification on "ShortcutDimCode6(Control 306).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(6,ShortcutDimCode[6]);

        OnAfterValidateShortcutDimCode(Rec,ShortcutDimCode,6);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateShortcutDimCode(6,ShortcutDimCode[6]);
        */
        //end;


        //Unsupported feature: Code Modification on "ShortcutDimCode7(Control 308).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(7,ShortcutDimCode[7]);

        OnAfterValidateShortcutDimCode(Rec,ShortcutDimCode,7);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateShortcutDimCode(7,ShortcutDimCode[7]);
        */
        //end;


        //Unsupported feature: Code Modification on "ShortcutDimCode8(Control 310).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(8,ShortcutDimCode[8]);

        OnAfterValidateShortcutDimCode(Rec,ShortcutDimCode,8);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateShortcutDimCode(8,ShortcutDimCode[8]);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Document No."(Control 104)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Line No."(Control 106)".



        //Unsupported feature: Code Insertion on "RefreshTotals(Control 7)".

        //trigger OnDrillDown()
        //begin
        /*
        DocumentTotals.SalesRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalSalesLine);
        CurrPage.UPDATE(FALSE);
        */
        //end;

        //Unsupported feature: Property Deletion (CaptionML) on ""TotalSalesLine.""Line Amount"""(Control 7)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""TotalSalesLine.""Line Amount"""(Control 7)".


        //Unsupported feature: Property Deletion (AutoFormatType) on ""TotalSalesLine.""Line Amount"""(Control 7)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""TotalSalesLine.""Line Amount"""(Control 7)".


        //Unsupported feature: Property Deletion (CaptionClass) on ""TotalSalesLine.""Line Amount"""(Control 7)".



        //Unsupported feature: Code Insertion (VariableCollection) on ""Invoice Discount Amount"(Control 31).OnValidate".

        //trigger (Variable: SalesHeader)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on ""Invoice Discount Amount"(Control 31).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DocumentTotals.SalesDocTotalsNotUpToDate;
        ValidateInvoiceDiscountAmount;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        SalesHeader.GET("Document Type","Document No.");
        SalesCalcDiscByType.ApplyInvDiscBasedOnAmt(TotalSalesLine."Inv. Discount Amount",SalesHeader);
        CurrPage.UPDATE(FALSE);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Invoice Discount Amount"(Control 31)".


        //Unsupported feature: Property Deletion (CaptionClass) on ""Invoice Discount Amount"(Control 31)".

        modify("Invoice Disc. Pct.")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Invoice Disc. Pct."(Control 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Total Amount Excl. VAT"(Control 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Total VAT Amount"(Control 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Total Amount Incl. VAT"(Control 9)".

        moveafter("Unit Price"; "Line Amount")
        moveafter(Control33; "Invoice Discount Amount")
    }
    actions
    {

        //Unsupported feature: Property Modification (Level) on ""F&unctions"(Action 1906587504)".

        modify("Get &Price")
        {

            //Unsupported feature: Property Modification (Level) on ""Get &Price"(Action 1903079504)".

            ApplicationArea = Basic;
        }
        modify("Get Li&ne Discount")
        {

            //Unsupported feature: Property Modification (Level) on ""Get Li&ne Discount"(Action 1907415004)".

            ApplicationArea = Basic;
        }
        modify("E&xplode BOM")
        {

            //Unsupported feature: Property Modification (Level) on ""E&xplode BOM"(Action 1903098604)".

            ApplicationArea = Basic;
        }
        modify(InsertExtTexts)
        {

            //Unsupported feature: Property Modification (Level) on "InsertExtTexts(Action 1900206204)".


            //Unsupported feature: Property Modification (Name) on "InsertExtTexts(Action 1900206204)".

            ApplicationArea = Basic;
        }
        modify(GetShipmentLines)
        {

            //Unsupported feature: Property Modification (Level) on "GetShipmentLines(Action 1900545004)".

            ApplicationArea = Basic;
        }
        modify("Event")
        {
            ApplicationArea = Basic;
        }
        modify(Period)
        {
            ApplicationArea = Basic;
        }
        modify(Variant)
        {
            ApplicationArea = Basic;
        }
        modify(Location)
        {
            ApplicationArea = Basic;
        }
        modify("BOM Level")
        {
            ApplicationArea = Basic;
        }
        modify(Dimensions)
        {

            //Unsupported feature: Property Modification (Level) on "Dimensions(Action 1904522204)".

            ApplicationArea = Basic;
        }
        modify("Co&mments")
        {

            //Unsupported feature: Property Modification (Level) on ""Co&mments"(Action 1900948904)".

            ApplicationArea = Basic;
        }
        modify("Item Charge &Assignment")
        {

            //Unsupported feature: Property Modification (Level) on ""Item Charge &Assignment"(Action 1907184504)".

            ApplicationArea = Basic;
        }
        modify("Item &Tracking Lines")
        {

            //Unsupported feature: Property Modification (Level) on ""Item &Tracking Lines"(Action 1905987604)".

            ApplicationArea = Basic;
        }
        modify(DeferralSchedule)
        {

            //Unsupported feature: Property Modification (Level) on "DeferralSchedule(Action 17)".

            ApplicationArea = Basic;
        }
        modify(SelectMultiItems)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Get &Price"(Action 1903079504)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Get Li&ne Discount"(Action 1907415004)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""E&xplode BOM"(Action 1903098604)".


        //Unsupported feature: Property Deletion (ToolTipML) on "InsertExtTexts(Action 1900206204)".


        //Unsupported feature: Property Deletion (Scope) on "InsertExtTexts(Action 1900206204)".


        //Unsupported feature: Property Deletion (ToolTipML) on "GetShipmentLines(Action 1900545004)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Event(Action 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Period(Action 1900639404)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Variant(Action 1904974904)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Location(Action 1904945204)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""BOM Level"(Action 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""BOM Level"(Action 3)".

        modify("Related Information")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 1904522204)".


        //Unsupported feature: Property Deletion (Scope) on "Dimensions(Action 1904522204)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 1900948904)".



        //Unsupported feature: Code Modification on ""Item Charge &Assignment"(Action 1907184504).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowItemChargeAssgnt;
        SetItemChargeFieldsStyle;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ShowItemChargeAssgnt;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Item Charge &Assignment"(Action 1907184504)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item &Tracking Lines"(Action 1905987604)".

        modify(DocAttach)
        {
            Visible = false;
        }


        //Unsupported feature: Code Modification on "DeferralSchedule(Action 17).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowDeferralSchedule;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        SalesHeader.GET("Document Type","Document No.");
        ShowDeferrals(SalesHeader."Posting Date",SalesHeader."Currency Code");
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "DeferralSchedule(Action 17)".

        //moveafter(ActionContainer1900000004; "F&unctions")
    }

    var
        SalesHeader: Record "Sales Header";

    var
        //SalesHeader: Record "Sales Header";

    var
        [InDataSet]
        ItemPanelVisible: Boolean;

    var
        TotalAmountStyle: Text;
        RefreshMessageEnabled: Boolean;
        RefreshMessageText: Text;
        TypeChosen: Boolean;


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetTotalSalesHeader;
    CalculateTotals;
    UpdateEditableOnRow;
    SetItemChargeFieldsStyle;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF SalesHeader.GET("Document Type","Document No.") THEN;

    DocumentTotals.SalesUpdateTotalsControls(Rec,TotalSalesHeader,TotalSalesLine,RefreshMessageEnabled,
      TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,CurrPage.EDITABLE,VATAmount);

    TypeChosen := HasTypeToFillMandatotyFields;
    */
    //end;


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);
    UpdateTypeText;
    SetItemChargeFieldsStyle;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);
    */
    //end;


    //Unsupported feature: Code Modification on "OnDeleteRecord".

    //trigger OnDeleteRecord(): Boolean
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF (Quantity <> 0) AND ItemExists("No.") THEN BEGIN
      COMMIT;
      IF NOT ReserveSalesLine.DeleteLineConfirm(Rec) THEN
        EXIT(FALSE);
      ReserveSalesLine.DeleteLine(Rec);
    END;
    DocumentTotals.SalesDocTotalsNotUpToDate;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    */
    //end;


    //Unsupported feature: Code Modification on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //>>>> ORIGINAL CODE:
    //begin
    /*
    InitType;
    SetDefaultType;

    CLEAR(ShortcutDimCode);
    UpdateTypeText;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    InitType;
    CLEAR(ShortcutDimCode);
    */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "ApproveCalcInvDisc(PROCEDURE 1)".



    //Unsupported feature: Code Modification on "ApproveCalcInvDisc(PROCEDURE 1)".

    //procedure ApproveCalcInvDisc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CODEUNIT.RUN(CODEUNIT::"Sales-Disc. (Yes/No)",Rec);
    DocumentTotals.SalesDocTotalsNotUpToDate;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CODEUNIT.RUN(CODEUNIT::"Sales-Disc. (Yes/No)",Rec);
    */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "CalcInvDisc(PROCEDURE 8)".



    //Unsupported feature: Code Modification on "CalcInvDisc(PROCEDURE 8)".

    //procedure CalcInvDisc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesCalcDiscount.CalculateInvoiceDiscountOnLine(Rec);
    DocumentTotals.SalesDocTotalsNotUpToDate;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CODEUNIT.RUN(CODEUNIT::"Sales-Calc. Discount",Rec);
    */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "ExplodeBOM(PROCEDURE 3)".



    //Unsupported feature: Code Modification on "ExplodeBOM(PROCEDURE 3)".

    //procedure ExplodeBOM();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CODEUNIT.RUN(CODEUNIT::"Sales-Explode BOM",Rec);
    DocumentTotals.SalesDocTotalsNotUpToDate;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CODEUNIT.RUN(CODEUNIT::"Sales-Explode BOM",Rec);
    */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "GetShipment(PROCEDURE 4)".


    //Unsupported feature: Property Deletion (Attributes) on "InsertExtendedText(PROCEDURE 7)".



    //Unsupported feature: Code Modification on "InsertExtendedText(PROCEDURE 7)".

    //procedure InsertExtendedText();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OnBeforeInsertExtendedText(Rec);
    IF TransferExtendedText.SalesCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
      CurrPage.SAVERECORD;
      COMMIT;
      TransferExtendedText.InsertSalesExtText(Rec);
    END;
    IF TransferExtendedText.MakeUpdate THEN
      UpdatePage(TRUE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #2..7
      UpdateForm(TRUE);
    */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "UpdatePage(PROCEDURE 12)".


    //Unsupported feature: Property Modification (Name) on "UpdatePage(PROCEDURE 12)".


    //Unsupported feature: Property Deletion (Attributes) on "ShowPrices(PROCEDURE 15)".



    //Unsupported feature: Code Modification on "ShowPrices(PROCEDURE 15)".

    //procedure ShowPrices();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TotalSalesHeader.GET("Document Type","Document No.");
    CLEAR(SalesPriceCalcMgt);
    SalesPriceCalcMgt.GetSalesLinePrice(TotalSalesHeader,Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SalesHeader.GET("Document Type","Document No.");
    CLEAR(SalesPriceCalcMgt);
    SalesPriceCalcMgt.GetSalesLinePrice(SalesHeader,Rec);
    */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "ShowLineDisc(PROCEDURE 16)".



    //Unsupported feature: Code Modification on "ShowLineDisc(PROCEDURE 16)".

    //procedure ShowLineDisc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TotalSalesHeader.GET("Document Type","Document No.");
    CLEAR(SalesPriceCalcMgt);
    SalesPriceCalcMgt.GetSalesLineLineDisc(TotalSalesHeader,Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SalesHeader.GET("Document Type","Document No.");
    CLEAR(SalesPriceCalcMgt);
    SalesPriceCalcMgt.GetSalesLineLineDisc(SalesHeader,Rec);
    */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "SetUpdateAllowed(PROCEDURE 5)".


    //Unsupported feature: Property Deletion (Attributes) on "UpdateAllowed(PROCEDURE 20)".



    //Unsupported feature: Code Modification on "NoOnAfterValidate(PROCEDURE 19066594)".

    //procedure NoOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    InsertExtendedText(FALSE);

    IF (Type = Type::"Charge (Item)") AND ("No." <> xRec."No.") AND (xRec."No." <> '') THEN
      CurrPage.SAVERECORD;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    InsertExtendedText(FALSE);
    IF (Type = Type::"Charge (Item)") AND ("No." <> xRec."No.") AND
       (xRec."No." <> '')
    THEN
      CurrPage.SAVERECORD;
    */
    //end;

    //Unsupported feature: Property Modification (Name) on "ValidateAutoReserve(PROCEDURE 19032465)".


    //Unsupported feature: Property Modification (Name) on "DeltaUpdateTotals(PROCEDURE 2)".



    //Unsupported feature: Code Modification on "DeltaUpdateTotals(PROCEDURE 2)".

    //procedure DeltaUpdateTotals();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DocumentTotals.SalesDeltaUpdateTotals(Rec,xRec,TotalSalesLine,VATAmount,InvoiceDiscountAmount,InvoiceDiscountPct);
    IF "Line Amount" <> xRec."Line Amount" THEN
      SendLineInvoiceDiscountResetNotification;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CurrPage.SAVERECORD;

    SalesHeader.GET("Document Type","Document No.");
    IF DocumentTotals.SalesCheckNumberOfLinesLimit(SalesHeader) THEN
      DocumentTotals.SalesRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalSalesLine);
    CurrPage.UPDATE;
    */
    //end;

    local procedure TypeOnAfterValidate()
    begin
        ItemPanelVisible := Rec.Type = Rec.Type::Item;
    end;

    local procedure CrossReferenceNoOnAfterValidat()
    begin
        InsertExtendedText(false);
    end;

    local procedure UnitofMeasureCodeOnAfterValida()
    begin
        if Rec.Reserve = Rec.Reserve::Always then begin
            CurrPage.SaveRecord;
            Rec.AutoReserve;
        end;
    end;

    //Unsupported feature: Deletion (VariableCollection) on "CalcInvDisc(PROCEDURE 8).SalesCalcDiscount(Variable 1000)".

}
