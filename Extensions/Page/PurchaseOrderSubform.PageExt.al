#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185462 pageextension52185462 extends "Purchase Order Subform"
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
            //ShowMandatory = TypeChosen;
        }
        // modify("Cross-Reference No.")
        // {
        //     ApplicationArea = Basic;

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
        // modify("Variant Code")
        // {
        //     ApplicationArea = Basic;
        // }
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
        modify("Drop Shipment")
        {
            ApplicationArea = Basic;
        }
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
        modify("Reserved Quantity")
        {
            ApplicationArea = Basic;
        }
        modify("Job Remaining Qty.")
        {
            ApplicationArea = Basic;
        }
        modify("Unit of Measure Code")
        {
            ApplicationArea = Basic;
        }
        modify("Unit of Measure")
        {
            ApplicationArea = Basic;
        }
        modify("Direct Unit Cost")
        {
            ApplicationArea = Basic;
            ShowMandatory = TypeChosen;
        }
        modify("Indirect Cost %")
        {
            ApplicationArea = Basic;
        }
        modify("Unit Cost (LCY)")
        {
            ApplicationArea = Basic;
        }
        modify("Unit Price (LCY)")
        {
            ApplicationArea = Basic;
        }
        modify("Line Discount %")
        {
            ApplicationArea = Basic;
        }
        modify("Line Amount")
        {
            ApplicationArea = Basic;
        }
        modify("Line Discount Amount")
        {
            ApplicationArea = Basic;
        }
        modify("Prepayment %")
        {
            ApplicationArea = Basic;
        }
        modify("Prepmt. Line Amount")
        {
            ApplicationArea = Basic;
        }
        modify("Prepmt. Amt. Inv.")
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
        modify("Qty. to Receive")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on ""Qty. to Receive"(Control 18)".

            Caption = 'Qty Delivered';
        }
        modify("Quantity Received")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on ""Quantity Received"(Control 20)".

            Caption = 'Qty Already Delivered';
        }
        modify("Qty. to Invoice")
        {
            ApplicationArea = Basic;
        }
        modify("Quantity Invoiced")
        {
            ApplicationArea = Basic;
        }
        modify("Prepmt Amt to Deduct")
        {
            ApplicationArea = Basic;
        }
        modify("Prepmt Amt Deducted")
        {
            ApplicationArea = Basic;
        }
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
        modify("Job Planning Line No.")
        {
            ApplicationArea = Basic;
        }
        modify("Job Line Type")
        {
            ApplicationArea = Basic;
        }
        modify("Job Unit Price")
        {
            ApplicationArea = Basic;
        }
        modify("Job Line Amount")
        {
            ApplicationArea = Basic;
        }
        modify("Job Line Discount Amount")
        {
            ApplicationArea = Basic;
        }
        modify("Job Line Discount %")
        {
            ApplicationArea = Basic;
        }
        modify("Job Total Price")
        {
            ApplicationArea = Basic;
        }
        modify("Job Unit Price (LCY)")
        {
            ApplicationArea = Basic;
        }
        modify("Job Total Price (LCY)")
        {
            ApplicationArea = Basic;
        }
        modify("Job Line Amount (LCY)")
        {
            ApplicationArea = Basic;
        }
        modify("Job Line Disc. Amount (LCY)")
        {
            ApplicationArea = Basic;
        }
        modify("Requested Receipt Date")
        {
            ApplicationArea = Basic;
        }
        modify("Promised Receipt Date")
        {
            ApplicationArea = Basic;
        }
        modify("Planned Receipt Date")
        {
            ApplicationArea = Basic;
        }
        modify("Expected Receipt Date")
        {
            ApplicationArea = Basic;
        }
        modify("Order Date")
        {
            ApplicationArea = Basic;
        }
        modify("Lead Time Calculation")
        {
            ApplicationArea = Basic;
        }
        modify("Planning Flexibility")
        {
            ApplicationArea = Basic;
        }
        modify("Prod. Order No.")
        {
            ApplicationArea = Basic;
        }
        modify("Prod. Order Line No.")
        {
            ApplicationArea = Basic;
        }
        modify("Operation No.")
        {
            ApplicationArea = Basic;
        }
        modify("Work Center No.")
        {
            ApplicationArea = Basic;
        }
        modify(Finished)
        {
            ApplicationArea = Basic;
        }
        modify("Whse. Outstanding Qty. (Base)")
        {
            ApplicationArea = Basic;
        }
        modify("Inbound Whse. Handling Time")
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

            //Unsupported feature: Property Modification (Visible) on ""Shortcut Dimension 1 Code"(Control 78)".

        }
        modify("Shortcut Dimension 2 Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on ""Shortcut Dimension 2 Code"(Control 76)".

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

            //Unsupported feature: Property Modification (SourceExpr) on ""Document No."(Control 25)".


            //Unsupported feature: Property Modification (Name) on ""Document No."(Control 25)".

        }
        modify("Line No.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Line No."(Control 27)".


            //Unsupported feature: Property Modification (Name) on ""Line No."(Control 27)".

        }
        modify("Invoice Discount Amount")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Invoice Discount Amount"(Control 35)".


            //Unsupported feature: Property Modification (AutoFormatExpr) on ""Invoice Discount Amount"(Control 35)".

            Style = Subordinate;
            StyleExpr = RefreshMessageEnabled;
        }
        // modify("Invoice Disc. Pct.")
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (DecimalPlaces) on ""Invoice Disc. Pct."(Control 33)".


        //     //Unsupported feature: Property Modification (SourceExpr) on ""Invoice Disc. Pct."(Control 33)".

        //     Editable = false;

        //     //Unsupported feature: Property Insertion (Visible) on ""Invoice Disc. Pct."(Control 33)".

        //     Style = Subordinate;
        //     StyleExpr = RefreshMessageEnabled;
        // }
        modify("Total Amount Excl. VAT")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (AutoFormatExpr) on ""Total Amount Excl. VAT"(Control 17)".

            //CaptionClass = DocumentTotals.GetTotalExclVATCaption(PurchHeader."Currency Code");
            Style = Subordinate;
            StyleExpr = RefreshMessageEnabled;
        }
        modify("Total VAT Amount")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (AutoFormatExpr) on ""Total VAT Amount"(Control 15)".

            //CaptionClass = DocumentTotals.GetTotalVATCaption(PurchHeader."Currency Code");
            Style = Subordinate;
            StyleExpr = RefreshMessageEnabled;
        }
        modify("Total Amount Incl. VAT")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (AutoFormatExpr) on ""Total Amount Incl. VAT"(Control 13)".

            //CaptionClass = DocumentTotals.GetTotalInclVATCaption(PurchHeader."Currency Code");
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
        ShowShortcutDimCode(ShortcutDimCode);
        NoOnAfterValidate;

        UpdateTypeText;
        DeltaUpdateTotals;

        CurrPage.UPDATE;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3
        IF xRec."No." <> '' THEN
          RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 4)".



        //Unsupported feature: Code Modification on ""Cross-Reference No."(Control 62).OnLookup".

        //trigger "(Control 62)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CrossReferenceNoLookUp;
        InsertExtendedText(FALSE);
        NoOnAfterValidate;
        OnCrossReferenceNoOnLookup(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3
        */
        //end;


        //Unsupported feature: Code Modification on ""Cross-Reference No."(Control 62).OnValidate".

        //trigger "(Control 62)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CrossReferenceNoOnAfterValidat;
        NoOnAfterValidate;
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

        //Unsupported feature: Property Deletion (ToolTipML) on ""Cross-Reference No."(Control 62)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""IC Partner Code"(Control 1108)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""IC Partner Ref. Type"(Control 104)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""IC Partner Reference"(Control 106)".

        // modify("Variant Code")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Variant Code"(Control 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Nonstock(Control 82)".



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

        // modify(Description)
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Drop Shipment"(Control 80)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Return Reason Code"(Control 88)".

        // modify("Location Code")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Location Code"(Control 74)".


        //Unsupported feature: Property Deletion (Enabled) on ""Location Code"(Control 74)".


        //Unsupported feature: Property Deletion (Editable) on ""Location Code"(Control 74)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bin Code"(Control 102)".



        //Unsupported feature: Code Modification on "Quantity(Control 8).OnValidate".

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

        //Unsupported feature: Property Deletion (ToolTipML) on "Quantity(Control 8)".


        //Unsupported feature: Property Deletion (Enabled) on "Quantity(Control 8)".


        //Unsupported feature: Property Deletion (Editable) on "Quantity(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reserved Quantity"(Control 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Remaining Qty."(Control 9)".



        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Control 36).OnValidate".

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

        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit of Measure Code"(Control 36)".



        //Unsupported feature: Code Insertion on ""Unit of Measure"(Control 10)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit of Measure"(Control 10)".



        //Unsupported feature: Code Modification on ""Direct Unit Cost"(Control 12).OnValidate".

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

        //Unsupported feature: Property Deletion (ToolTipML) on ""Direct Unit Cost"(Control 12)".


        //Unsupported feature: Property Deletion (Enabled) on ""Direct Unit Cost"(Control 12)".


        //Unsupported feature: Property Deletion (Editable) on ""Direct Unit Cost"(Control 12)".



        //Unsupported feature: Code Insertion on ""Indirect Cost %"(Control 28)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Indirect Cost %"(Control 28)".



        //Unsupported feature: Code Insertion on ""Unit Cost (LCY)"(Control 68)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit Cost (LCY)"(Control 68)".



        //Unsupported feature: Code Insertion on ""Unit Price (LCY)"(Control 30)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit Price (LCY)"(Control 30)".



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


        //Unsupported feature: Property Deletion (Visible) on ""Line Discount %"(Control 16)".


        //Unsupported feature: Property Deletion (Enabled) on ""Line Discount %"(Control 16)".


        //Unsupported feature: Property Deletion (Editable) on ""Line Discount %"(Control 16)".



        //Unsupported feature: Code Modification on ""Line Amount"(Control 44).OnValidate".

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

        //Unsupported feature: Property Deletion (ToolTipML) on ""Line Amount"(Control 44)".


        //Unsupported feature: Property Deletion (Enabled) on ""Line Amount"(Control 44)".


        //Unsupported feature: Property Deletion (Editable) on ""Line Amount"(Control 44)".



        //Unsupported feature: Code Modification on ""Line Discount Amount"(Control 60).OnValidate".

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

        //Unsupported feature: Property Deletion (ToolTipML) on ""Line Discount Amount"(Control 60)".



        //Unsupported feature: Code Insertion on ""Prepayment %"(Control 108)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Prepayment %"(Control 108)".



        //Unsupported feature: Code Insertion on ""Prepmt. Line Amount"(Control 110)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Prepmt. Line Amount"(Control 110)".



        //Unsupported feature: Code Insertion on ""Prepmt. Amt. Inv."(Control 112)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        RedistributeTotalsOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Prepmt. Amt. Inv."(Control 112)".

        // modify("Allow Invoice Disc.")
        // {
        //     Visible = false;
        // }

        // //Unsupported feature: Property Deletion (ToolTipML) on ""Allow Invoice Disc."(Control 58)".

        // modify("Inv. Discount Amount")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Inv. Discount Amount"(Control 26)".

        modify("Inv. Disc. Amount to Invoice")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Qty. to Receive"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Quantity Received"(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Qty. to Invoice"(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Quantity Invoiced"(Control 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prepmt Amt to Deduct"(Control 114)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prepmt Amt Deducted"(Control 116)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Allow Item Charge Assignment"(Control 56)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Qty. to Assign"(Control 66)".


        //Unsupported feature: Property Deletion (StyleExpr) on ""Qty. to Assign"(Control 66)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Qty. Assigned"(Control 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job No."(Control 126)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Task No."(Control 128)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Planning Line No."(Control 7)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Line Type"(Control 130)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Unit Price"(Control 132)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Line Amount"(Control 134)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Line Discount Amount"(Control 136)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Line Discount %"(Control 138)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Total Price"(Control 140)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Unit Price (LCY)"(Control 142)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Total Price (LCY)"(Control 144)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Line Amount (LCY)"(Control 146)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Line Disc. Amount (LCY)"(Control 148)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Requested Receipt Date"(Control 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Promised Receipt Date"(Control 90)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Planned Receipt Date"(Control 92)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Expected Receipt Date"(Control 100)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Order Date"(Control 94)".


        //Unsupported feature: Property Deletion (Visible) on ""Order Date"(Control 94)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Lead Time Calculation"(Control 96)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Planning Flexibility"(Control 84)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prod. Order No."(Control 40)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prod. Order Line No."(Control 86)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Operation No."(Control 64)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Work Center No."(Control 70)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Finished(Control 72)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Whse. Outstanding Qty. (Base)"(Control 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Inbound Whse. Handling Time"(Control 98)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Blanket Order No."(Control 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Blanket Order Line No."(Control 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Appl.-to Item Entry"(Control 52)".

        // modify("Deferral Code")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Deferral Code"(Control 21)".


        //Unsupported feature: Property Deletion (Visible) on ""Deferral Code"(Control 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shortcut Dimension 1 Code"(Control 78)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shortcut Dimension 2 Code"(Control 76)".



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

        //Unsupported feature: Property Deletion (ToolTipML) on ""Document No."(Control 25)".


        //Unsupported feature: Property Deletion (Visible) on ""Document No."(Control 25)".


        //Unsupported feature: Property Deletion (Editable) on ""Document No."(Control 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Line No."(Control 27)".


        //Unsupported feature: Property Deletion (Visible) on ""Line No."(Control 27)".


        //Unsupported feature: Property Deletion (Editable) on ""Line No."(Control 27)".

        modify(AmountBeforeDiscount)
        {
            Visible = false;
        }


        //Unsupported feature: Code Insertion (VariableCollection) on ""Invoice Discount Amount"(Control 35).OnValidate".

        //trigger (Variable: PurchaseHeader)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on ""Invoice Discount Amount"(Control 35).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateInvoiceDiscountAmount;
        DocumentTotals.PurchaseDocTotalsNotUpToDate;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        PurchaseHeader.GET("Document Type","Document No.");
        PurchCalcDiscByType.ApplyInvDiscBasedOnAmt(TotalPurchaseLine."Inv. Discount Amount",PurchaseHeader);
        CurrPage.UPDATE(FALSE);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Invoice Discount Amount"(Control 35)".


        //Unsupported feature: Property Deletion (CaptionClass) on ""Invoice Discount Amount"(Control 35)".

        // modify("Invoice Disc. Pct.")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Invoice Disc. Pct."(Control 33)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Total Amount Excl. VAT"(Control 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Total VAT Amount"(Control 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Total Amount Incl. VAT"(Control 13)".

        addafter("VAT Prod. Posting Group")
        {
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Total Amount Incl. VAT")
        {
            field(RefreshTotals; RefreshMessageText)
            {
                ApplicationArea = Basic;
                DrillDown = true;
                Editable = false;
                Enabled = RefreshMessageEnabled;
                ShowCaption = false;

                trigger OnDrillDown()
                begin
                    // DocumentTotals.PurchaseRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalPurchaseLine);
                    CurrPage.Update(false);
                end;
            }
        }
        moveafter(Type; "Document No.")
        moveafter("Unit Price (LCY)"; "Line Amount")
    }
    actions
    {
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
        modify("Reservation Entries")
        {
            ApplicationArea = Basic;
        }
        modify("Item Tracking Lines")
        {
            ApplicationArea = Basic;
        }
        modify(Dimensions)
        {
            ApplicationArea = Basic;
        }
        modify("Co&mments")
        {
            ApplicationArea = Basic;
        }
        modify(ItemChargeAssignment)
        {
            ApplicationArea = Basic;
        }
        modify(DeferralSchedule)
        {
            ApplicationArea = Basic;
        }
        modify("E&xplode BOM")
        {
            ApplicationArea = Basic;
        }
        modify("Insert Ext. Texts")
        {
            ApplicationArea = Basic;
        }
        modify(Reserve)
        {
            ApplicationArea = Basic;
        }
        modify(OrderTracking)
        {
            ApplicationArea = Basic;
        }
        modify("Sales &Order")
        {
            ApplicationArea = Basic;
        }
        modify(Action1901038504)
        {
            ApplicationArea = Basic;
        }
        modify(SelectMultiItems)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Event(Action 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Period(Action 1902027204)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Variant(Action 1901633104)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Location(Action 1902479904)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""BOM Level"(Action 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""BOM Level"(Action 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reservation Entries"(Action 1902085804)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item Tracking Lines"(Action 1905987604)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 1903984904)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 1903079404)".



        //Unsupported feature: Code Modification on "ItemChargeAssignment(Action 1907184504).OnAction".

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

        //Unsupported feature: Property Deletion (ToolTipML) on "ItemChargeAssignment(Action 1907184504)".

        modify(DocumentLineTracking)
        {
            Visible = false;
        }


        //Unsupported feature: Code Modification on "DeferralSchedule(Action 23).OnAction".

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
        PurchHeader.GET("Document Type","Document No.");
        ShowDeferrals(PurchHeader."Posting Date",PurchHeader."Currency Code")
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "DeferralSchedule(Action 23)".

        modify(DocAttach)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""E&xplode BOM"(Action 1901312904)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Insert Ext. Texts"(Action 1901313304)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Reserve(Action 1906391504)".


        //Unsupported feature: Property Deletion (ToolTipML) on "OrderTracking(Action 1903502504)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sales &Order"(Action 1903563204)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Action1901038504(Action 1901038504)".

        modify(BlanketOrder)
        {
            Visible = false;
        }
    }

    var
        PurchaseHeader: Record "Purchase Header";


    //Unsupported feature: Property Modification (Id) on "InvDiscAmountEditable(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //InvDiscAmountEditable : 1012;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InvDiscAmountEditable : 1016;
    //Variable type has not been exported.

    var
        PurchHeader: Record "Purchase Header";

    var
        Text000: label 'Unable to run this function while in View mode.';
    //PurchPriceCalcMgt: Codeunit "Purch. Price Calc. Mgt.";

    var
        UpdateAllowedVar: Boolean;

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
    GetTotalsPurchaseHeader;
    CalculateTotals;
    UpdateEditableOnRow;
    UpdateTypeText;
    SetItemChargeFieldsStyle;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF PurchHeader.GET("Document Type","Document No.") THEN;

    DocumentTotals.PurchaseUpdateTotalsControls(Rec,TotalPurchaseHeader,TotalPurchaseLine,RefreshMessageEnabled,
      TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,VATAmount);
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
    TypeChosen := HasTypeToFillMandatotyFields;
    */
    //end;


    //Unsupported feature: Code Modification on "OnDeleteRecord".

    //trigger OnDeleteRecord(): Boolean
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF (Quantity <> 0) AND ItemExists("No.") THEN BEGIN
      COMMIT;
      IF NOT ReservePurchLine.DeleteLineConfirm(Rec) THEN
        EXIT(FALSE);
      ReservePurchLine.DeleteLine(Rec);
    END;
    DocumentTotals.PurchaseDocTotalsNotUpToDate;
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
    // Default to Item for the first line and to previous line type for the others
    IF ApplicationAreaMgmtFacade.IsFoundationEnabled THEN
      IF xRec."Document No." = '' THEN
        Type := Type::Item;

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

    //Unsupported feature: Property Deletion (Attributes) on "ApproveCalcInvDisc(PROCEDURE 7)".



    //Unsupported feature: Code Modification on "ApproveCalcInvDisc(PROCEDURE 7)".

    //procedure ApproveCalcInvDisc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CODEUNIT.RUN(CODEUNIT::"Purch.-Disc. (Yes/No)",Rec);
    DocumentTotals.PurchaseDocTotalsNotUpToDate;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CODEUNIT.RUN(CODEUNIT::"Purch.-Disc. (Yes/No)",Rec);
    */
    //end;


    //Unsupported feature: Code Modification on "ExplodeBOM(PROCEDURE 3)".

    //procedure ExplodeBOM();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Prepmt. Amt. Inv." <> 0 THEN
      ERROR(Text001);
    CODEUNIT.RUN(CODEUNIT::"Purch.-Explode BOM",Rec);
    DocumentTotals.PurchaseDocTotalsNotUpToDate;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "InsertExtendedText(PROCEDURE 6)".


    //Unsupported feature: Property Insertion (Local) on "InsertExtendedText(PROCEDURE 6)".



    //Unsupported feature: Code Modification on "InsertExtendedText(PROCEDURE 6)".

    //procedure InsertExtendedText();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OnBeforeInsertExtendedText(Rec);
    IF TransferExtendedText.PurchCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
      CurrPage.SAVERECORD;
      TransferExtendedText.InsertPurchExtText(Rec);
    END;
    IF TransferExtendedText.MakeUpdate THEN
      UpdateForm(TRUE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #2..7
    */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "ShowTracking(PROCEDURE 10)".


    //Unsupported feature: Property Deletion (Attributes) on "UpdateForm(PROCEDURE 13)".


    //Unsupported feature: Property Modification (Name) on "CalculateTotals(PROCEDURE 16)".



    //Unsupported feature: Code Modification on "CalculateTotals(PROCEDURE 16)".

    //procedure CalculateTotals();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DocumentTotals.PurchaseCheckIfDocumentChanged(Rec,xRec);
    DocumentTotals.CalculatePurchaseSubPageTotals(
      TotalPurchaseHeader,TotalPurchaseLine,VATAmount,InvoiceDiscountAmount,InvoiceDiscountPct);
    DocumentTotals.RefreshPurchaseLine(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    PurchHeader.GET("Document Type","Document No.");
    CLEAR(PurchPriceCalcMgt);
    PurchPriceCalcMgt.GetPurchLineLineDisc(PurchHeader,Rec);
    */
    //end;

    //Unsupported feature: Property Modification (Name) on "DeltaUpdateTotals(PROCEDURE 2)".



    //Unsupported feature: Code Modification on "DeltaUpdateTotals(PROCEDURE 2)".

    //procedure DeltaUpdateTotals();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DocumentTotals.PurchaseDeltaUpdateTotals(Rec,xRec,TotalPurchaseLine,VATAmount,InvoiceDiscountAmount,InvoiceDiscountPct);
    IF "Line Amount" <> xRec."Line Amount" THEN
      SendLineInvoiceDiscountResetNotification;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CurrPage.SAVERECORD;

    PurchHeader.GET("Document Type","Document No.");
    IF DocumentTotals.PurchaseCheckNumberOfLinesLimit(PurchHeader) THEN
      DocumentTotals.PurchaseRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalPurchaseLine);
    CurrPage.UPDATE;
    */
    //end;

    //Unsupported feature: Parameter Insertion (Parameter: UpdateAllowed) (ParameterCollection) on "SetUpdateAllowed(PROCEDURE 14)".


    //Unsupported feature: Property Deletion (Local) on "UpdateTypeText(PROCEDURE 14)".


    //Unsupported feature: Property Modification (Name) on "UpdateTypeText(PROCEDURE 14)".



    //Unsupported feature: Code Modification on "UpdateTypeText(PROCEDURE 14)".

    //procedure UpdateTypeText();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF NOT IsFoundation THEN
      EXIT;

    RecRef.GETTABLE(Rec);
    TypeAsText := TempOptionLookupBuffer.FormatOption(RecRef.FIELD(FIELDNO(Type)));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    UpdateAllowedVar := UpdateAllowed;
    */
    //end;

    //Unsupported feature: ReturnValue Insertion (ReturnValue: <Blank>) (ReturnValueCollection) on "UpdateAllowed(PROCEDURE 4)".


    //Unsupported feature: Property Deletion (Attributes) on "OnCrossReferenceNoOnLookup(PROCEDURE 4)".


    //Unsupported feature: Property Modification (Name) on "OnCrossReferenceNoOnLookup(PROCEDURE 4)".



    //Unsupported feature: Code Modification on "OnCrossReferenceNoOnLookup(PROCEDURE 4)".

    //procedure OnCrossReferenceNoOnLookup();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF UpdateAllowedVar = FALSE THEN BEGIN
      MESSAGE(Text000);
      EXIT(FALSE);
    END;
    EXIT(TRUE);
    */
    //end;

    local procedure CalcInvDisc()
    begin
        // Codeunit.Run(Codeunit::"Purch.-Calc.Discount",Rec);
    end;

    local procedure ShowPrices()
    begin
        PurchHeader.Get(Rec."Document Type", Rec."Document No.");
        // Clear(PurchPriceCalcMgt);
        // PurchPriceCalcMgt.GetPurchLinePrice(PurchHeader, Rec);
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

    //Unsupported feature: Deletion (VariableCollection) on "UpdateTypeText(PROCEDURE 14).RecRef(Variable 1000)".


    //Unsupported feature: Deletion (ParameterCollection) on "OnCrossReferenceNoOnLookup(PROCEDURE 4).PurchaseLine(Parameter 1000)".

}
