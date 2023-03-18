#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185459 pageextension52185459 extends "Purchase Order"
{

    //Unsupported feature: Property Modification (PromotedActionCategoriesML) on ""Purchase Order"(Page 50)".

    layout
    {
        modify("No.")
        {
            ApplicationArea = Basic;
        }
        modify("Buy-from Vendor No.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Importance) on ""Buy-from Vendor No."(Control 4)".

            ShowMandatory = true;
        }
        // modify("Buy-from Vendor Name")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("Buy-from")
        // {

        //     //Unsupported feature: Property Modification (ControlType) on ""Buy-from"(Control 62)".


        //     //Unsupported feature: Property Modification (Name) on ""Buy-from"(Control 62)".


        //     //Unsupported feature: Property Insertion (SourceExpr) on ""Buy-from"(Control 62)".

        //     ApplicationArea = Basic;
        // }
        modify("Buy-from Address")
        {

            //Unsupported feature: Property Modification (Level) on ""Buy-from Address"(Control 89)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Buy-from Address"(Control 89)".

        }
        modify("Buy-from Address 2")
        {

            //Unsupported feature: Property Modification (Level) on ""Buy-from Address 2"(Control 91)".

            ApplicationArea = Basic;
        }
        modify("Buy-from City")
        {

            //Unsupported feature: Property Modification (Level) on ""Buy-from City"(Control 93)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Buy-from City"(Control 93)".

        }
        modify("Buy-from Post Code")
        {

            //Unsupported feature: Property Modification (Level) on ""Buy-from Post Code"(Control 76)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Buy-from Post Code"(Control 76)".

        }
        modify("Buy-from Contact No.")
        {

            //Unsupported feature: Property Modification (Level) on ""Buy-from Contact No."(Control 174)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Buy-from Contact No."(Control 174)".

        }
        modify("Buy-from Contact")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Importance) on ""Buy-from Contact"(Control 8)".


            //Unsupported feature: Property Insertion (Visible) on ""Buy-from Contact"(Control 8)".

        }
        modify("Document Date")
        {
            ApplicationArea = Basic;
        }
        // modify("Posting Date")
        // {
        //     ApplicationArea = Basic;
        // }
        modify("Due Date")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Importance) on ""Due Date"(Control 36)".


            //Unsupported feature: Property Insertion (Visible) on ""Due Date"(Control 36)".

        }
        modify("Vendor Invoice No.")
        {
            ApplicationArea = Basic;
        }
        modify("Purchaser Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Purchaser Code"(Control 10)".

        }
        modify("No. of Archived Versions")
        {
            ApplicationArea = Basic;
        }
        modify("Order Date")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Importance) on ""Order Date"(Control 14)".


            //Unsupported feature: Property Modification (Name) on ""Order Date"(Control 14)".

            Caption = 'Delivery Date';
        }
        modify("Quote No.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Quote No."(Control 237)".

        }
        modify("Vendor Order No.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Vendor Order No."(Control 16)".

        }
        modify("Vendor Shipment No.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Vendor Shipment No."(Control 18)".


            //Unsupported feature: Property Modification (Name) on ""Vendor Shipment No."(Control 18)".


            //Unsupported feature: Property Insertion (Visible) on ""Vendor Shipment No."(Control 18)".

        }
        modify("Order Address Code")
        {
            ApplicationArea = Basic;
        }
        modify("Responsibility Center")
        {
            ApplicationArea = Basic;
        }
        modify("Assigned User ID")
        {
            ApplicationArea = Basic;
        }
        modify(Status)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Importance) on "Status(Control 133)".

            Editable = false;
        }
        modify("Job Queue Status")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Job Queue Status"(Control 7)".


            //Unsupported feature: Property Modification (Name) on ""Job Queue Status"(Control 7)".

        }
        modify("Invoice Details")
        {
            Caption = 'Invoicing';

            //Unsupported feature: Property Modification (Name) on ""Invoice Details"(Control 1905885101)".

        }
        modify("Currency Code")
        {
            ApplicationArea = Basic;
        }
        modify("Expected Receipt Date")
        {
            ApplicationArea = Basic;
        }
        modify("VAT Bus. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("Payment Terms Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Payment Terms Code"(Control 34)".

        }
        modify("Payment Method Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Payment Method Code"(Control 117)".

        }
        modify("Payment Discount %")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Payment Discount %"(Control 38)".

        }
        modify("Pmt. Discount Date")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Pmt. Discount Date"(Control 40)".

        }
        modify("Shipment Method Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Shipment Method Code"(Control 52)".

        }
        modify("Payment Reference")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Payment Reference"(Control 27)".

        }
        modify("Creditor No.")
        {
            ApplicationArea = Basic;
        }
        modify("On Hold")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""On Hold"(Control 106)".

        }
        modify("Inbound Whse. Handling Time")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Inbound Whse. Handling Time"(Control 144)".

        }
        modify("Lead Time Calculation")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Lead Time Calculation"(Control 146)".

        }
        modify("Requested Receipt Date")
        {
            ApplicationArea = Basic;
        }
        modify("Promised Receipt Date")
        {
            ApplicationArea = Basic;
        }
        modify("Shipping and Payment")
        {
            Caption = 'Shipping';

            //Unsupported feature: Property Modification (Name) on ""Shipping and Payment"(Control 1906801201)".


            //Unsupported feature: Property Insertion (Visible) on ""Shipping and Payment"(Control 1906801201)".

        }
        // modify(Control83)
        // {

        //     //Unsupported feature: Property Modification (ControlType) on "Control83(Control 83)".


        //     //Unsupported feature: Property Modification (Name) on "Control83(Control 83)".


        //     //Unsupported feature: Property Insertion (SourceExpr) on "Control83(Control 83)".


        //     //Unsupported feature: Property Insertion (Visible) on "Control83(Control 83)".

        //     ApplicationArea = Basic;
        // }
        modify("Location Code")
        {

            //Unsupported feature: Property Modification (Level) on ""Location Code"(Control 104)".

            ApplicationArea = Basic;
        }
        modify("Sell-to Customer No.")
        {

            //Unsupported feature: Property Modification (Level) on ""Sell-to Customer No."(Control 87)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Sell-to Customer No."(Control 87)".

        }
        modify("Ship-to Code")
        {

            //Unsupported feature: Property Modification (Level) on ""Ship-to Code"(Control 85)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Ship-to Code"(Control 85)".

        }
        modify("Ship-to Name")
        {

            //Unsupported feature: Property Modification (Level) on ""Ship-to Name"(Control 42)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Ship-to Name"(Control 42)".

        }
        modify("Ship-to Address")
        {

            //Unsupported feature: Property Modification (Level) on ""Ship-to Address"(Control 44)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Ship-to Address"(Control 44)".

        }
        modify("Ship-to Address 2")
        {

            //Unsupported feature: Property Modification (Level) on ""Ship-to Address 2"(Control 46)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Ship-to Address 2"(Control 46)".

        }
        modify("Ship-to City")
        {

            //Unsupported feature: Property Modification (Level) on ""Ship-to City"(Control 48)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Ship-to City"(Control 48)".

        }
        modify("Ship-to Post Code")
        {

            //Unsupported feature: Property Modification (Level) on ""Ship-to Post Code"(Control 109)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Ship-to Post Code"(Control 109)".

        }
        modify("Ship-to Contact")
        {

            //Unsupported feature: Property Modification (Level) on ""Ship-to Contact"(Control 50)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Ship-to Contact"(Control 50)".

        }
        // modify(Control71)
        // {

        //     //Unsupported feature: Property Modification (ControlType) on "Control71(Control 71)".


        //     //Unsupported feature: Property Modification (Name) on "Control71(Control 71)".


        //     //Unsupported feature: Property Insertion (SourceExpr) on "Control71(Control 71)".

        //     ApplicationArea = Basic;
        // }
        // modify("Pay-to Name")
        // {

        //Unsupported feature: Property Modification (Level) on ""Pay-to Name"(Control 24)".

        //     ApplicationArea = Basic;
        // }
        modify("Pay-to Address")
        {

            //Unsupported feature: Property Modification (Level) on ""Pay-to Address"(Control 26)".

            ApplicationArea = Basic;
        }
        modify("Pay-to Address 2")
        {

            //Unsupported feature: Property Modification (Level) on ""Pay-to Address 2"(Control 28)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Pay-to Address 2"(Control 28)".

        }
        modify("Pay-to City")
        {

            //Unsupported feature: Property Modification (Level) on ""Pay-to City"(Control 30)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Pay-to City"(Control 30)".

        }
        modify("Pay-to Post Code")
        {

            //Unsupported feature: Property Modification (Level) on ""Pay-to Post Code"(Control 97)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Pay-to Post Code"(Control 97)".

        }
        modify("Pay-to Contact No.")
        {

            //Unsupported feature: Property Modification (Level) on ""Pay-to Contact No."(Control 176)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Pay-to Contact No."(Control 176)".

        }
        modify("Pay-to Contact")
        {

            //Unsupported feature: Property Modification (Level) on ""Pay-to Contact"(Control 32)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Importance) on ""Pay-to Contact"(Control 32)".


            //Unsupported feature: Property Insertion (Visible) on ""Pay-to Contact"(Control 32)".

        }

        //Unsupported feature: Property Insertion (Visible) on ""Foreign Trade"(Control 1907468901)".

        modify("Transaction Specification")
        {
            ApplicationArea = Basic;
        }
        modify("Transaction Type")
        {
            ApplicationArea = Basic;
        }
        modify("Transport Method")
        {
            ApplicationArea = Basic;
        }
        modify("Entry Point")
        {
            ApplicationArea = Basic;
        }
        modify("Area")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Insertion (Visible) on "Prepayment(Control 1900201301)".

        modify("Prepayment %")
        {
            ApplicationArea = Basic;
        }
        modify("Compress Prepayment")
        {
            ApplicationArea = Basic;
        }
        modify("Prepmt. Payment Terms Code")
        {
            ApplicationArea = Basic;
        }
        modify("Prepayment Due Date")
        {
            ApplicationArea = Basic;
        }
        modify("Prepmt. Payment Discount %")
        {
            ApplicationArea = Basic;
        }
        modify("Prepmt. Pmt. Discount Date")
        {
            ApplicationArea = Basic;
        }
        modify("Vendor Cr. Memo No.")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Modification (Name) on "ApprovalFactBox(Control 1906354007)".


        //Unsupported feature: Property Insertion (SubPageLink) on "ApprovalFactBox(Control 1906354007)".


        //Unsupported feature: Property Insertion (Visible) on "Control1904651607(Control 1904651607)".


        //Unsupported feature: Property Insertion (Visible) on "Control1903435607(Control 1903435607)".


        //Unsupported feature: Property Insertion (Visible) on "Control1905767507(Control 1905767507)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 2)".


        //Unsupported feature: Code Modification on ""Buy-from Vendor No."(Control 4).OnValidate".

        //trigger "(Control 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        OnAfterValidateBuyFromVendorNo(Rec,xRec);
        CurrPage.UPDATE;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        BuyfromVendorNoOnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (CaptionML) on ""Buy-from Vendor No."(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Buy-from Vendor No."(Control 4)".


        //Unsupported feature: Property Deletion (NotBlank) on ""Buy-from Vendor No."(Control 4)".

        // modify("Buy-from Vendor Name")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (CaptionML) on ""Buy-from Vendor Name"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Buy-from Vendor Name"(Control 6)".


        //Unsupported feature: Property Deletion (Importance) on ""Buy-from Vendor Name"(Control 6)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""Buy-from Vendor Name"(Control 6)".

        modify("Posting Description")
        {
            Visible = false;
        }


        //Unsupported feature: Code Insertion on ""Shortcut Dimension 2 Code"(Control 62)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        ShortcutDimension2CodeOnAfterV;
        */
        //end;

        //Unsupported feature: Property Deletion (CaptionML) on ""Buy-from"(Control 62)".


        //Unsupported feature: Property Deletion (GroupType) on ""Buy-from"(Control 62)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Buy-from Address"(Control 89)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Buy-from Address"(Control 89)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Buy-from Address"(Control 89)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Buy-from Address 2"(Control 91)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Buy-from Address 2"(Control 91)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Buy-from Address 2"(Control 91)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Buy-from City"(Control 93)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Buy-from City"(Control 93)".


        //Unsupported feature: Property Deletion (Importance) on ""Buy-from City"(Control 93)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Buy-from City"(Control 93)".

        modify(Control122)
        {
            Visible = false;
        }
        modify("Buy-from County")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (CaptionML) on ""Buy-from Post Code"(Control 76)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Buy-from Post Code"(Control 76)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Buy-from Post Code"(Control 76)".

        modify("Buy-from Country/Region Code")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (CaptionML) on ""Buy-from Contact No."(Control 174)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Buy-from Contact No."(Control 174)".


        //Unsupported feature: Property Deletion (Importance) on ""Buy-from Contact No."(Control 174)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Buy-from Contact"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Buy-from Contact"(Control 8)".


        //Unsupported feature: Property Deletion (Editable) on ""Buy-from Contact"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Date"(Control 49)".

        // modify("Posting Date")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Posting Date"(Control 12)".


        //Unsupported feature: Property Deletion (Importance) on ""Posting Date"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Due Date"(Control 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor Invoice No."(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Purchaser Code"(Control 10)".


        //Unsupported feature: Property Deletion (Importance) on ""Purchaser Code"(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""No. of Archived Versions"(Control 171)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Order Date"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Quote No."(Control 237)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor Order No."(Control 16)".


        //Unsupported feature: Property Deletion (Importance) on ""Vendor Order No."(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor Shipment No."(Control 18)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Order Address Code"(Control 96)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Order Address Code"(Control 96)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Responsibility Center"(Control 131)".


        //Unsupported feature: Property Deletion (Importance) on ""Responsibility Center"(Control 131)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assigned User ID"(Control 72)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Status(Control 133)".



        //Unsupported feature: Code Insertion on ""Prices Including VAT"(Control 7)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        PricesIncludingVATOnAfterValid;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Queue Status"(Control 7)".


        //Unsupported feature: Property Deletion (Importance) on ""Job Queue Status"(Control 7)".


        //Unsupported feature: Property Deletion (Visible) on ""Job Queue Status"(Control 7)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "PurchLines(Control 60)".


        //Unsupported feature: Property Deletion (Enabled) on "PurchLines(Control 60)".


        //Unsupported feature: Property Deletion (Editable) on "PurchLines(Control 60)".


        //Unsupported feature: Property Deletion (PartType) on "PurchLines(Control 60)".


        //Unsupported feature: Property Deletion (GroupType) on ""Invoice Details"(Control 1905885101)".



        //Unsupported feature: Code Modification on ""Currency Code"(Control 119).OnAssistEdit".

        //trigger OnAssistEdit()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CLEAR(ChangeExchangeRate);
        IF "Posting Date" <> 0D THEN
          ChangeExchangeRate.SetParameter("Currency Code","Currency Factor","Posting Date")
        ELSE
          ChangeExchangeRate.SetParameter("Currency Code","Currency Factor",WORKDATE);
        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
          VALIDATE("Currency Factor",ChangeExchangeRate.GetParameter);
          SaveInvoiceDiscountAmount;
        END;
        CLEAR(ChangeExchangeRate);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..7
          CurrPage.UPDATE;
        END;
        CLEAR(ChangeExchangeRate);
        */
        //end;


        //Unsupported feature: Code Modification on ""Currency Code"(Control 119).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SAVERECORD;
        PurchCalcDiscByType.ApplyDefaultInvoiceDiscount(0,Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CurrPage.UPDATE;
        PurchCalcDiscByType.ApplyDefaultInvoiceDiscount(0,Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 119)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Expected Receipt Date"(Control 54)".

        modify("Prices Including VAT")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Bus. Posting Group"(Control 191)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Terms Code"(Control 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Method Code"(Control 117)".

        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Discount %"(Control 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pmt. Discount Date"(Control 40)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shipment Method Code"(Control 52)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Reference"(Control 27)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Creditor No."(Control 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""On Hold"(Control 106)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Inbound Whse. Handling Time"(Control 144)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Lead Time Calculation"(Control 146)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Requested Receipt Date"(Control 127)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Promised Receipt Date"(Control 139)".


        //Unsupported feature: Property Deletion (GroupType) on ""Shipping and Payment"(Control 1906801201)".


        //Unsupported feature: Property Deletion (GroupType) on "Control83(Control 83)".

        modify(Control94)
        {
            Visible = false;
        }
        modify(ShippingOptionWithLocation)
        {
            Visible = false;
        }
        // modify(ShippingOptionWithoutLocation)
        // {
        //     Visible = false;
        // }
        modify(Control99)
        {
            Visible = false;
        }
        modify(Control98)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Location Code"(Control 104)".

        modify(Control101)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (CaptionML) on ""Sell-to Customer No."(Control 87)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sell-to Customer No."(Control 87)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to Code"(Control 85)".


        //Unsupported feature: Property Deletion (Editable) on ""Ship-to Code"(Control 85)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Ship-to Name"(Control 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to Name"(Control 42)".


        //Unsupported feature: Property Deletion (Importance) on ""Ship-to Name"(Control 42)".


        //Unsupported feature: Property Deletion (Editable) on ""Ship-to Name"(Control 42)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Ship-to Address"(Control 44)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to Address"(Control 44)".


        //Unsupported feature: Property Deletion (Editable) on ""Ship-to Address"(Control 44)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Ship-to Address"(Control 44)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Ship-to Address 2"(Control 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to Address 2"(Control 46)".


        //Unsupported feature: Property Deletion (Editable) on ""Ship-to Address 2"(Control 46)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Ship-to Address 2"(Control 46)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Ship-to City"(Control 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to City"(Control 48)".


        //Unsupported feature: Property Deletion (Importance) on ""Ship-to City"(Control 48)".


        //Unsupported feature: Property Deletion (Editable) on ""Ship-to City"(Control 48)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Ship-to City"(Control 48)".

        modify(Control124)
        {
            Visible = false;
        }
        modify("Ship-to County")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (CaptionML) on ""Ship-to Post Code"(Control 109)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to Post Code"(Control 109)".


        //Unsupported feature: Property Deletion (Editable) on ""Ship-to Post Code"(Control 109)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Ship-to Post Code"(Control 109)".

        modify("Ship-to Country/Region Code")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (CaptionML) on ""Ship-to Contact"(Control 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to Contact"(Control 50)".


        //Unsupported feature: Property Deletion (Importance) on ""Ship-to Contact"(Control 50)".


        //Unsupported feature: Property Deletion (Editable) on ""Ship-to Contact"(Control 50)".



        //Unsupported feature: Code Insertion on ""Shortcut Dimension 1 Code"(Control 71)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        ShortcutDimension1CodeOnAfterV;
        */
        //end;

        //Unsupported feature: Property Deletion (GroupType) on "Control71(Control 71)".

        modify(PayToOptions)
        {
            Visible = false;
        }
        modify(Control95)
        {
            Visible = false;
        }
        // modify("Pay-to Name")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (CaptionML) on ""Pay-to Name"(Control 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pay-to Name"(Control 24)".


        //Unsupported feature: Property Deletion (Importance) on ""Pay-to Name"(Control 24)".


        //Unsupported feature: Property Deletion (Enabled) on ""Pay-to Name"(Control 24)".


        //Unsupported feature: Property Deletion (Editable) on ""Pay-to Name"(Control 24)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Pay-to Address"(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pay-to Address"(Control 26)".


        //Unsupported feature: Property Deletion (Enabled) on ""Pay-to Address"(Control 26)".


        //Unsupported feature: Property Deletion (Editable) on ""Pay-to Address"(Control 26)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Pay-to Address"(Control 26)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Pay-to Address 2"(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pay-to Address 2"(Control 28)".


        //Unsupported feature: Property Deletion (Enabled) on ""Pay-to Address 2"(Control 28)".


        //Unsupported feature: Property Deletion (Editable) on ""Pay-to Address 2"(Control 28)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Pay-to Address 2"(Control 28)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Pay-to City"(Control 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pay-to City"(Control 30)".


        //Unsupported feature: Property Deletion (Importance) on ""Pay-to City"(Control 30)".


        //Unsupported feature: Property Deletion (Enabled) on ""Pay-to City"(Control 30)".


        //Unsupported feature: Property Deletion (Editable) on ""Pay-to City"(Control 30)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Pay-to City"(Control 30)".

        modify(Control123)
        {
            Visible = false;
        }
        modify("Pay-to County")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (CaptionML) on ""Pay-to Post Code"(Control 97)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pay-to Post Code"(Control 97)".


        //Unsupported feature: Property Deletion (Enabled) on ""Pay-to Post Code"(Control 97)".


        //Unsupported feature: Property Deletion (Editable) on ""Pay-to Post Code"(Control 97)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Pay-to Post Code"(Control 97)".

        modify("Pay-to Country/Region Code")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (CaptionML) on ""Pay-to Contact No."(Control 176)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pay-to Contact No."(Control 176)".


        //Unsupported feature: Property Deletion (Enabled) on ""Pay-to Contact No."(Control 176)".


        //Unsupported feature: Property Deletion (Editable) on ""Pay-to Contact No."(Control 176)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Pay-to Contact"(Control 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pay-to Contact"(Control 32)".


        //Unsupported feature: Property Deletion (Enabled) on ""Pay-to Contact"(Control 32)".


        //Unsupported feature: Property Deletion (Editable) on ""Pay-to Contact"(Control 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Transaction Specification"(Control 115)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Transaction Type"(Control 56)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Transport Method"(Control 58)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Entry Point"(Control 111)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Area(Control 113)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prepayment %"(Control 197)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Compress Prepayment"(Control 199)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prepmt. Payment Terms Code"(Control 215)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prepayment Due Date"(Control 212)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prepmt. Payment Discount %"(Control 217)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prepmt. Pmt. Discount Date"(Control 196)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor Cr. Memo No."(Control 207)".

        modify("Attached Documents")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control23(Control 23)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1903326807(Control 1903326807)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "ApprovalFactBox(Control 1906354007)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1901138007(Control 1901138007)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1904651607(Control 1904651607)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "IncomingDocAttachFactBox(Control 39)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1903435607(Control 1903435607)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1906949207(Control 1906949207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control3(Control 3)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "WorkflowStatus(Control 59)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter("Vendor Invoice No.")
        {
            // field("Quotation No."; "Quotation No.")
            // {
            //     ApplicationArea = Basic;
            // }
            field("Contract Ref No"; Rec."Contract Ref No")
            {
                ApplicationArea = Basic;
            }
            field("Quotation Date"; Rec."Quotation Date")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Control83)
        {
            field("Receiving No. Series"; Rec."Receiving No. Series")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
        addfirst("Invoice Details")
        {
            field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
            {
                ApplicationArea = Basic;
                Importance = Promoted;

                trigger OnValidate()
                begin
                    PaytoVendorNoOnAfterValidate;
                end;
            }
        }
        moveafter("Buy-from Vendor No."; "Buy-from Contact No.")
        moveafter("Buy-from Vendor Name"; "Buy-from Address 2")
        moveafter("Buy-from Address 2"; "Buy-from Address")
        moveafter("Buy-from Address"; "Buy-from Post Code")
        moveafter("Buy-from Post Code"; "Buy-from City")
        moveafter("Buy-from City"; "Buy-from Contact")
        moveafter("Buy-from Contact"; "No. of Archived Versions")
        moveafter("No. of Archived Versions"; "Posting Date")
        moveafter("Posting Date"; "Order Date")
        // moveafter("Delivery Date"; "Document Date")
        // moveafter("Document Date"; "Quote No.")
        // moveafter("Vendor Delivery Note No."; "Vendor Invoice No.")
        moveafter("Vendor Invoice No."; "Order Address Code")
        moveafter("Order Address Code"; "Purchaser Code")
        moveafter("Purchaser Code"; "Responsibility Center")
        moveafter("Responsibility Center"; Control71)
        moveafter("Shortcut Dimension 2 Code"; "Assigned User ID")
        moveafter("Prices Including VAT"; Control83)
        moveafter("Posting Description"; PurchLines)
        //moveafter(Invoicing; "Pay-to Contact No.")
        moveafter("Pay-to Contact No."; "Pay-to Name")
        moveafter("Pay-to Address 2"; "Pay-to Post Code")
        moveafter("Pay-to Post Code"; "Pay-to City")
        moveafter("Pay-to City"; "Pay-to Contact")
        moveafter("Pay-to Contact"; "Payment Terms Code")
        moveafter("Due Date"; "Payment Discount %")
        moveafter("Pmt. Discount Date"; "Payment Method Code")
        moveafter("Payment Method Code"; "Payment Reference")
        moveafter("On Hold"; "VAT Bus. Posting Group")
        moveafter("VAT Bus. Posting Group"; "Shipping and Payment")
        // moveafter(Shipping; "Ship-to Name")
        moveafter("Ship-to Address 2"; "Ship-to Post Code")
        moveafter("Ship-to Post Code"; "Ship-to City")
        moveafter("Ship-to City"; "Ship-to Contact")
        moveafter("Ship-to Contact"; "Location Code")
        moveafter("Location Code"; "Inbound Whse. Handling Time")
        moveafter("Inbound Whse. Handling Time"; "Shipment Method Code")
        moveafter("Shipment Method Code"; "Lead Time Calculation")
        moveafter("Promised Receipt Date"; "Expected Receipt Date")
        moveafter("Expected Receipt Date"; "Sell-to Customer No.")
        moveafter("Ship-to Code"; "Foreign Trade")
        moveafter("Currency Code"; "Transaction Type")
    }
    actions
    {
        modify(Dimensions)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Promoted) on "Dimensions(Action 129)".


            //Unsupported feature: Property Modification (PromotedIsBig) on "Dimensions(Action 129)".

        }
        modify(Statistics)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Statistics(Action 63)".

        }
        modify(Vendor)
        {
            Caption = 'Card';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunPageLink) on "Vendor(Action 64)".


            //Unsupported feature: Property Modification (Promoted) on "Vendor(Action 64)".


            //Unsupported feature: Property Modification (Image) on "Vendor(Action 64)".


            //Unsupported feature: Property Modification (Name) on "Vendor(Action 64)".


            //Unsupported feature: Property Insertion (PromotedIsBig) on "Vendor(Action 64)".

        }
        modify(Approvals)
        {

            //Unsupported feature: Property Modification (Name) on "Approvals(Action 53)".

            ApplicationArea = Basic;
        }
        modify("Co&mments")
        {
            ApplicationArea = Basic;
        }
        modify(Receipts)
        {
            ApplicationArea = Basic;
        }
        modify(Invoices)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Promoted) on "Invoices(Action 67)".

        }
        modify(PostedPrepaymentInvoices)
        {

            //Unsupported feature: Property Modification (Name) on "PostedPrepaymentInvoices(Action 205)".

            ApplicationArea = Basic;
        }
        modify(PostedPrepaymentCrMemos)
        {

            //Unsupported feature: Property Modification (Name) on "PostedPrepaymentCrMemos(Action 206)".

            ApplicationArea = Basic;
        }
        modify("In&vt. Put-away/Pick Lines")
        {
            ApplicationArea = Basic;
        }
        modify("Whse. Receipt Lines")
        {
            ApplicationArea = Basic;
        }
        modify("Warehouse_GetSalesOrder")
        {

            //Unsupported feature: Property Modification (Name) on ""Warehouse_GetSalesOrder"(Action 226)".

            ApplicationArea = Basic;
        }
        modify("Get &Sales Order")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on ""Get &Sales Order"(Action 228)".

        }
        // modify(Approval)
        // {

        //     //Unsupported feature: Property Modification (Level) on "Approval(Action 37)".


        //     //Unsupported feature: Property Modification (ActionType) on "Approval(Action 37)".

        //     Caption = 'Approvals';

        //     //Unsupported feature: Property Modification (Name) on "Approval(Action 37)".


        //     //Unsupported feature: Property Insertion (Image) on "Approval(Action 37)".

        //     ApplicationArea = Basic;
        // }
        modify(Reject)
        {

            //Unsupported feature: Property Modification (Name) on "Reject(Action 33)".

            Caption = 'Print LSO';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Image) on "Reject(Action 33)".


            //Unsupported feature: Property Modification (PromotedCategory) on "Reject(Action 33)".

        }
        modify(Release)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Release(Action 137)".

        }
        modify(Reopen)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on "Reopen(Action 138)".

        }
        modify(CalculateInvoiceDiscount)
        {
            ApplicationArea = Basic;
        }
        modify(GetRecurringPurchaseLines)
        {

            //Unsupported feature: Property Modification (Name) on "GetRecurringPurchaseLines(Action 179)".

            Caption = 'Get St&d. Vend. Purchase Codes';
            ApplicationArea = Basic;
        }
        modify(CopyDocument)
        {
            ApplicationArea = Basic;
        }
        modify(MoveNegativeLines)
        {

            //Unsupported feature: Property Modification (Name) on "MoveNegativeLines(Action 142)".

            ApplicationArea = Basic;
        }
        modify("Functions_GetSalesOrder")
        {

            //Unsupported feature: Property Modification (Name) on ""Functions_GetSalesOrder"(Action 184)".

            ApplicationArea = Basic;
        }
        modify(Action187)
        {
            ApplicationArea = Basic;
        }
        modify("Archive Document")
        {
            ApplicationArea = Basic;
        }
        modify("Send Intercompany Purchase Order")
        {
            Caption = 'Send IC Purchase Order';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on ""Send Intercompany Purchase Order"(Action 195)".

        }
        modify(IncomingDocCard)
        {
            ToolTip = '';
            ApplicationArea = Basic;
        }
        modify(SelectIncomingDoc)
        {
            ToolTip = '';
            ApplicationArea = Basic;
        }
        modify(IncomingDocAttachFile)
        {
            ToolTip = '';
            ApplicationArea = Basic;
            // Enabled = not HasIncomingDocument;
        }
        modify(RemoveIncomingDoc)
        {
            ToolTip = '';
            ApplicationArea = Basic;
        }
        modify(SendApprovalRequest)
        {
            ApplicationArea = Basic;
            // Enabled = not OpenApprovalEntriesExist;
        }
        modify(CancelApprovalRequest)
        {
            ApplicationArea = Basic;
            // Enabled = OpenApprovalEntriesExist;

            //Unsupported feature: Property Modification (Image) on "CancelApprovalRequest(Action 55)".

        }
        modify(CreateFlow)
        {

            //Unsupported feature: Property Modification (Level) on "CreateFlow(Action 88)".


            //Unsupported feature: Property Modification (Name) on "CreateFlow(Action 88)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Image) on "CreateFlow(Action 88)".


            //Unsupported feature: Property Modification (PromotedCategory) on "CreateFlow(Action 88)".


            //Unsupported feature: Property Insertion (PromotedIsBig) on "CreateFlow(Action 88)".

        }
        modify("Create &Whse. Receipt")
        {
            ApplicationArea = Basic;
        }
        modify("Create Inventor&y Put-away/Pick")
        {
            ApplicationArea = Basic;
        }
        modify(Post)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Post(Action 79)".

        }
        modify(Preview)
        {
            ApplicationArea = Basic;
        }
        modify("Post and &Print")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""Post and &Print"(Action 80)".

        }
        modify("Test Report")
        {
            ApplicationArea = Basic;
        }
        modify("Post &Batch")
        {
            ApplicationArea = Basic;
        }
        modify("Remove From Job Queue")
        {
            ApplicationArea = Basic;
        }
        modify("Prepayment Test &Report")
        {
            ApplicationArea = Basic;
        }
        modify(PostPrepaymentInvoice)
        {
            ApplicationArea = Basic;
        }
        modify("Post and Print Prepmt. Invoic&e")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Modification (Level) on "PreviewPrepmtInvoicePosting(Action 73)".


        //Unsupported feature: Property Modification (ActionType) on "PreviewPrepmtInvoicePosting(Action 73)".


        //Unsupported feature: Property Modification (Name) on "PreviewPrepmtInvoicePosting(Action 73)".

        modify(PostPrepaymentCreditMemo)
        {
            ApplicationArea = Basic;
        }
        modify("Post and Print Prepmt. Cr. Mem&o")
        {
            ApplicationArea = Basic;
        }
        modify("&Print")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""&Print"(Action 82)".


            //Unsupported feature: Property Insertion (Visible) on ""&Print"(Action 82)".

        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 129)".


        //Unsupported feature: Property Deletion (Enabled) on "Dimensions(Action 129)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Dimensions(Action 129)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Statistics(Action 63)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Vendor(Action 64)".


        //Unsupported feature: Property Deletion (Enabled) on "Vendor(Action 64)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Vendor(Action 64)".



        //Unsupported feature: Code Insertion (VariableCollection) on "Action53(Action 53).OnAction".

        //trigger (Variable: ApprovalEntries)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "Approvals(Action 53).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        WorkflowsEntriesBuffer.RunWorkflowEntriesPage(RECORDID,DATABASE::"Purchase Header","Document Type","No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ApprovalEntries.Setfilters(DATABASE::"Purchase Header","Document Type","No.");
        ApprovalEntries.RUN;
        */
        //end;

        //Unsupported feature: Property Deletion (AccessByPermission) on "Approvals(Action 53)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Approvals(Action 53)".


        //Unsupported feature: Property Deletion (Promoted) on "Approvals(Action 53)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Approvals(Action 53)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 65)".


        //Unsupported feature: Property Deletion (Promoted) on ""Co&mments"(Action 65)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Co&mments"(Action 65)".

        modify(DocAttach)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Receipts(Action 66)".


        //Unsupported feature: Property Deletion (Promoted) on "Receipts(Action 66)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Receipts(Action 66)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Invoices(Action 67)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Invoices(Action 67)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PostedPrepaymentInvoices(Action 205)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PostedPrepaymentCrMemos(Action 206)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""In&vt. Put-away/Pick Lines"(Action 180)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Whse. Receipt Lines"(Action 148)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Warehouse_GetSalesOrder"(Action 226)".



        //Unsupported feature: Code Modification on ""Get &Sales Order"(Action 228).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PurchHeader.COPY(Rec);
        DistIntegration.GetSpecialOrders(PurchHeader);
        Rec := PurchHeader;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Get &Sales Order"(Action 228)".



        //Unsupported feature: Code Insertion on "Approvals(Action 37)".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //var
        //ApprovalEntries: Page "Approval Entries";
        //approvalsMgmt: Codeunit "Approvals Mgmt.";
        //begin
        /*

        approvalsMgmt.OpenApprovalEntriesPage(RECORDID);
        */
        //end;
        modify(Approve)
        {
            Visible = false;
        }


        //Unsupported feature: Code Modification on "Reject(Action 33).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD(Status,Status::Released);
        PurchaseHeader.RESET;
        PurchaseHeader.SETRANGE(PurchaseHeader."Document Type",PurchaseHeader."Document Type"::Order);
        PurchaseHeader.SETRANGE(PurchaseHeader."No.","No.");
        IF PurchaseHeader.FINDFIRST THEN
          REPORT.RUN(52186081,TRUE,FALSE,PurchaseHeader)
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Reject(Action 33)".


        //Unsupported feature: Property Deletion (Visible) on "Reject(Action 33)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "Reject(Action 33)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Reject(Action 33)".

        modify(Delegate)
        {
            Visible = false;
        }
        modify(Comment)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Release(Action 137)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "Release(Action 137)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Release(Action 137)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Reopen(Action 138)".


        //Unsupported feature: Property Deletion (Promoted) on "Reopen(Action 138)".


        //Unsupported feature: Property Deletion (Enabled) on "Reopen(Action 138)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Reopen(Action 138)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Reopen(Action 138)".


        //Unsupported feature: Property Deletion (ToolTipML) on "CalculateInvoiceDiscount(Action 69)".


        //Unsupported feature: Property Deletion (ToolTipML) on "GetRecurringPurchaseLines(Action 179)".



        //Unsupported feature: Code Modification on "CopyDocument(Action 70).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CopyPurchDoc.SetPurchHeader(Rec);
        CopyPurchDoc.RUNMODAL;
        CLEAR(CopyPurchDoc);
        IF GET("Document Type","No.") THEN;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "CopyDocument(Action 70)".


        //Unsupported feature: Property Deletion (Enabled) on "CopyDocument(Action 70)".


        //Unsupported feature: Property Deletion (ToolTipML) on "MoveNegativeLines(Action 142)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Functions_GetSalesOrder"(Action 184)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Action187(Action 187)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Archive Document"(Action 173)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Send Intercompany Purchase Order"(Action 195)".



        //Unsupported feature: Code Modification on "SelectIncomingDoc(Action 45).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        VALIDATE("Incoming Document Entry No.",IncomingDocument.SelectIncomingDocument("Incoming Document Entry No.",RECORDID));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        VALIDATE("Incoming Document Entry No.",IncomingDocument.SelectIncomingDocument("Incoming Document Entry No."));
        */
        //end;


        //Unsupported feature: Code Modification on "RemoveIncomingDoc(Action 41).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF IncomingDocument.GET("Incoming Document Entry No.") THEN
          IncomingDocument.RemoveLinkToRelatedRecord;
        "Incoming Document Entry No." := 0;
        MODIFY(TRUE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        "Incoming Document Entry No." := 0;
        */
        //end;


        //Unsupported feature: Code Modification on "SendApprovalRequest(Action 57).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //IF NOT SomeLinesCommitted THEN ERROR('All lines must be committed');

        TESTFIELD(Status,Status::Open);
        TESTFIELD("Prices Including VAT");
        //Ensure Lines Filled
        PurchaseLine.RESET;
        PurchaseLine.SETRANGE("Document No.","No.");
        IF NOT PurchaseLine.FIND('-') THEN
        BEGIN
            ERROR('Lines do not exist');
        END ELSE
        BEGIN
             REPEAT
                  PurchaseLine.TESTFIELD(PurchaseLine.Amount);
                  PurchaseLine.TESTFIELD(PurchaseLine.Quantity);
                  PurchaseLine.TESTFIELD(PurchaseLine."Direct Unit Cost");
             UNTIL PurchaseLine.NEXT =0;
        END;

        IF PurchaseLine."Gen. Prod. Posting Group"='' THEN ERROR('General Product Posting Group Must have a value');

        IF ApprovalsMgmt.CheckPurchaseApprovalsWorkflowEnabled(Rec) THEN
          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "SendApprovalRequest(Action 57)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "SendApprovalRequest(Action 57)".



        //Unsupported feature: Code Modification on "CancelApprovalRequest(Action 55).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
        WorkflowWebhookMgt.FindAndCancel(RECORDID);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "CancelApprovalRequest(Action 55)".

        modify(Flow)
        {
            Visible = false;
        }


        //Unsupported feature: Code Insertion (VariableCollection) on ""Cancel Budget Commitment"(Action 88).OnAction".

        //trigger (Variable: PurchLine)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "CreateFlow(Action 88).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        // Opens page 6400 where the user can use filtered templates to create new flows.
        FlowTemplateSelector.SetSearchText(FlowServiceManagement.GetPurchasingTemplateFilter);
        FlowTemplateSelector.RUN;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD(Status,Status::Open);

           IF NOT CONFIRM( 'Are you sure you want to Cancel All Commitments Done for this document',TRUE, "Document Type") THEN
                ERROR('Budget Availability Check and Commitment Aborted');

          DeleteCommitment.RESET;
          DeleteCommitment.SETRANGE(DeleteCommitment."Document Type",DeleteCommitment."Document Type"::LPO);
          DeleteCommitment.SETRANGE(DeleteCommitment."Document No.","No.");
          DeleteCommitment.DELETEALL;
          //Tag all the Purchase Line entries as Uncommitted
          PurchLine.RESET;
          PurchLine.SETRANGE(PurchLine."Document Type","Document Type");
          PurchLine.SETRANGE(PurchLine."Document No.","No.");
          IF PurchLine.FIND('-') THEN BEGIN
             REPEAT
                PurchLine.Committed:=FALSE;
                PurchLine.MODIFY;
             UNTIL PurchLine.NEXT=0;
          END;

        MESSAGE('Commitments Cancelled Successfully for Doc. No %1',"No.");
        */
        //end;

        //Unsupported feature: Property Deletion (CaptionML) on "CreateFlow(Action 88)".


        //Unsupported feature: Property Deletion (ToolTipML) on "CreateFlow(Action 88)".


        //Unsupported feature: Property Deletion (Visible) on "CreateFlow(Action 88)".

        modify(SeeFlows)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Create &Whse. Receipt"(Action 149)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Create Inventor&y Put-away/Pick"(Action 150)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Post(Action 79)".



        //Unsupported feature: Code Insertion (VariableCollection) on "Preview(Action 21).OnAction".

        //trigger (Variable: PurchPostYesNo)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "Preview(Action 21).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowPreview;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        PurchPostYesNo.Preview(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Preview(Action 21)".


        //Unsupported feature: Property Deletion (Promoted) on "Preview(Action 21)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Preview(Action 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post and &Print"(Action 80)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Test Report"(Action 78)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post &Batch"(Action 81)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Remove From Job Queue"(Action 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prepayment Test &Report"(Action 202)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PostPrepaymentInvoice(Action 203)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post and Print Prepmt. Invoic&e"(Action 210)".

        modify(PreviewPrepmtInvoicePosting)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (CaptionML) on "PreviewPrepmtInvoicePosting(Action 73)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PreviewPrepmtInvoicePosting(Action 73)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "PreviewPrepmtInvoicePosting(Action 73)".


        //Unsupported feature: Property Deletion (Image) on "PreviewPrepmtInvoicePosting(Action 73)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PostPrepaymentCreditMemo(Action 204)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post and Print Prepmt. Cr. Mem&o"(Action 211)".

        modify(PreviewPrepmtCrMemoPosting)
        {
            Visible = false;
        }


        //Unsupported feature: Code Modification on ""&Print"(Action 82).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PurchaseHeader := Rec;
        CurrPage.SETSELECTIONFILTER(PurchaseHeader);
        PurchaseHeader.PrintRecords(TRUE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        DocPrint.PrintPurchHeader(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""&Print"(Action 82)".

        modify(SendCustom)
        {
            Visible = false;
        }
        addfirst(Warehouse)
        {
            separator(Action181)
            {
            }
        }
        addafter("Whse. Receipt Lines")
        {
            separator(Action182)
            {
            }
        }
        addafter(Reopen)
        {
            separator(Action611)
            {
            }
        }
        addafter(CalculateInvoiceDiscount)
        {
            separator(Action190)
            {
            }
        }
        addafter(GetRecurringPurchaseLines)
        {
            separator(Action75)
            {
            }
        }
        addafter(MoveNegativeLines)
        {
            action("Check Budget Availability")
            {
                ApplicationArea = Basic;
                Image = Balance;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Doctype: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance;
                    PurchaseLine: Record "Purchase Line";
                    RequisitionLine: Record "Purchase Line";
                    CommittmentLine: Record 52185867;
                begin
                    Rec.TestField(Rec.Status, Rec.Status::Open);

                    BCSetup.Get;
                    if not BCSetup.Mandatory then
                        exit;

                    if Rec.Status = Rec.Status::Released then
                        Error('This document has already been released. This functionality is available for open documents only');

                    PurchaseLine.Reset;
                    PurchaseLine.SetRange("Document No.", Rec."No.");
                    PurchaseLine.SetFilter("Requisition No", '<>%1', '');
                    if PurchaseLine.FindSet then
                        repeat
                            CommittmentLine.Reset;
                            CommittmentLine.SetRange(CommittmentLine."Document No.", PurchaseLine."Requisition No");
                            CommittmentLine.SetRange(CommittmentLine."Document Line No.", PurchaseLine."Requisition Line No.");
                            CommittmentLine.SetRange(CommittmentLine.Committed, false);
                            if not CommittmentLine.FindFirst then
                                Commitment.ReverseEntries(Doctype::Requisition, PurchaseLine."Requisition No");
                        until PurchaseLine.Next = 0;
                    if SomeLinesCommitted then begin
                        if not Confirm('Some or All the Lines Are already Committed do you want to continue', true, Rec."Document Type") then
                            Error('Budget Availability Check and Commitment Aborted');
                        DeleteCommitment.Reset;
                        DeleteCommitment.SetRange(DeleteCommitment."Document Type", DeleteCommitment."document type"::LPO);
                        DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                        DeleteCommitment.DeleteAll;
                    end;
                    Commitment.CheckPurchase(Rec);
                    Message('Budget Availability Checking Complete');
                end;
            }
        }
        addafter("Send Intercompany Purchase Order")
        {
            separator(Action189)
            {
            }
        }
        addafter("Create Inventor&y Put-away/Pick")
        {
            separator(Action74)
            {
            }
        }
        addafter("Remove From Job Queue")
        {
            separator(Action201)
            {
            }
        }
        addfirst(Print)
        {
            action("Print LPO")
            {
                ApplicationArea = Basic;
                Caption = 'Print LPO';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.TestField(Rec.Status, Rec.Status::Released);
                    PurchaseHeader.Reset;
                    PurchaseHeader.SetRange(PurchaseHeader."Document Type", PurchaseHeader."document type"::Order);
                    PurchaseHeader.SetRange(PurchaseHeader."No.", Rec."No.");
                    // if PurchaseHeader.FindFirst then
                    //     Report.Run(Report::"Order 2", true, false, PurchaseHeader)
                end;
            }
        }
        addafter(Reject)
        {
            action("EDMS [Case 360]")
            {
                ApplicationArea = Basic;
                Image = Document;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    DMS: Record 52185686;
                begin
                    /*
                    DMS.RESET;
                    DMS.SETRANGE(DMS.Key, DMS.Key::"Loan File");
                    IF DMS.FIND('-') THEN BEGIN
                    HYPERLINK(DMS."url path"+"Loan No.");
                    END;
                    */

                end;
            }
        }
        // moveafter(ActionContainer1900000004; ActionGroup13)
        // moveafter(ActionGroup13; PreviewPrepmtInvoicePosting)
        // moveafter(Action73; Release)
        // moveafter("Move Negative Lines"; CreateFlow)
        // moveafter("Cancel Budget Commitment"; ActionGroup225)
        // moveafter(Approvals; ActionGroup17)
        moveafter("Post and Print Prepmt. Invoic&e"; PostPrepaymentCreditMemo)
    }

    var
        ApprovalEntries: Page "Approval Entries";

    var
        PurchLine: Record "Purchase Line";

    var
        PurchPostYesNo: Codeunit "Purch.-Post (Yes/No)";


    //Unsupported feature: Property Modification (Subtype) on "UserMgt(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //UserMgt : "User Setup Management";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UserMgt : 52185486;
    //Variable type has not been exported.

    var
        DocPrint: Codeunit "Document-Print";

    var
        Commitment: Codeunit 52185483;
        BCSetup: Record 52185866;
        DeleteCommitment: Record 52185867;
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetControlAppearance;
    CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    CurrPage.ApprovalFactBox.PAGE.UpdateApprovalEntriesFromSourceRecord(RECORDID);
    ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    */
    //end;


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CalculateCurrentShippingAndPayToOption;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SetControlAppearance;
    */
    //end;


    //Unsupported feature: Code Modification on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    JobQueueUsed := PurchasesPayablesSetup.JobQueueActive;
    SetExtDocNoMandatoryCondition;
    ShowShippingOptionsWithLocation := ApplicationAreaMgmtFacade.IsLocationEnabled OR ApplicationAreaMgmtFacade.IsAllDisabled;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SetExtDocNoMandatoryCondition;
    */
    //end;


    //Unsupported feature: Code Modification on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Responsibility Center" := UserMgt.GetPurchasesFilter;

    IF (NOT DocNoVisible) AND ("No." = '') THEN
      SetBuyFromVendorFromFilter;

    CalculateCurrentShippingAndPayToOption;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Responsibility Center" := UserMgt.GetPurchasesFilter;
     //Add dimensions if set by default here
     "Shortcut Dimension 1 Code":=UserMgt.GetSetDimensions(USERID,1);
     VALIDATE("Shortcut Dimension 1 Code");
     "Shortcut Dimension 2 Code":=UserMgt.GetSetDimensions(USERID,2);
     VALIDATE("Shortcut Dimension 2 Code");
    */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetDocNoVisible;
    IsSaaS := PermissionManager.SoftwareAsAService;

    IF UserMgt.GetPurchasesFilter <> '' THEN BEGIN
      FILTERGROUP(2);
      SETRANGE("Responsibility Center",UserMgt.GetPurchasesFilter);
      FILTERGROUP(0);
    END;
    IF ("No." <> '') AND ("Buy-from Vendor No." = '') THEN
      DocumentIsPosted := (NOT GET("Document Type","No."));

    SETRANGE("Date Filter",0D,WORKDATE);

    ActivateFields;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SetDocNoVisible;
    #3..8
    */
    //end;


    //Unsupported feature: Code Modification on "Post(PROCEDURE 4)".

    //procedure Post();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF ApplicationAreaMgmtFacade.IsFoundationEnabled THEN
      LinesInstructionMgt.PurchaseCheckAllLinesHaveQuantityAssigned(Rec);

    SendToPosting(PostingCodeunitID);

    IsScheduledPosting := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
    DocumentIsPosted := (NOT PurchaseHeader.GET("Document Type","No.")) OR IsScheduledPosting;

    IF IsScheduledPosting THEN
      CurrPage.CLOSE;
    CurrPage.UPDATE(FALSE);

    IF PostingCodeunitID <> CODEUNIT::"Purch.-Post (Yes/No)" THEN
      EXIT;

    IF InstructionMgt.IsEnabled(InstructionMgt.ShowPostedConfirmationMessageCode) THEN
      ShowPostedConfirmationMessage;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SendToPosting(PostingCodeunitID);
    IF "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting" THEN
      CurrPage.CLOSE;
    CurrPage.UPDATE(FALSE);
    */
    //end;


    //Unsupported feature: Code Modification on "SetControlAppearance(PROCEDURE 5)".

    //procedure SetControlAppearance();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
    HasIncomingDocument := "Incoming Document Entry No." <> 0;
    SetExtDocNoMandatoryCondition;

    OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
    OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);

    WorkflowWebhookMgt.GetCanRequestAndCanCancel(RECORDID,CanRequestApprovalForFlow,CanCancelApprovalForFlow);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
    OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    */
    //end;

    local procedure BuyfromVendorNoOnAfterValidate()
    begin
        if Rec.GetFilter(Rec."Buy-from Vendor No.") = xRec."Buy-from Vendor No." then
            if Rec."Buy-from Vendor No." <> xRec."Buy-from Vendor No." then
                Rec.SetRange(Rec."Buy-from Vendor No.");
        CurrPage.Update;
    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PaytoVendorNoOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.Update;
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.Update;
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update;
    end;

    local procedure Prepayment37OnAfterValidate()
    begin
        CurrPage.Update;
    end;

    procedure LinesCommitted() Exists: Boolean
    var
        PurchLines: Record "Purchase Line";
    begin
        if BCSetup.Get() then begin
            if not BCSetup.Mandatory then begin
                Exists := false;
                exit;
            end;
        end else begin
            Exists := false;
            exit;
        end;
        if BCSetup.Get then begin
            Exists := false;
            PurchLines.Reset;
            PurchLines.SetRange(PurchLines."Document Type", Rec."Document Type");
            PurchLines.SetRange(PurchLines."Document No.", Rec."No.");
            PurchLines.SetRange(PurchLines.Committed, false);
            if PurchLines.Find('-') then
                Exists := true;
        end else
            Exists := false;
    end;

    procedure SomeLinesCommitted() Exists: Boolean
    var
        PurchLines: Record "Purchase Line";
    begin
        if BCSetup.Get then begin
            Exists := false;
            PurchLines.Reset;
            PurchLines.SetRange(PurchLines."Document Type", Rec."Document Type");
            PurchLines.SetRange(PurchLines."Document No.", Rec."No.");
            PurchLines.SetRange(PurchLines.Committed, true);
            if PurchLines.Find('-') then
                Exists := true;
        end else
            Exists := false;
    end;

    //Unsupported feature: Deletion (VariableCollection) on "Post(PROCEDURE 4).PurchaseHeader(Variable 1001)".


    //Unsupported feature: Deletion (VariableCollection) on "Post(PROCEDURE 4).InstructionMgt(Variable 1002)".


    //Unsupported feature: Deletion (VariableCollection) on "Post(PROCEDURE 4).ApplicationAreaMgmtFacade(Variable 1004)".


    //Unsupported feature: Deletion (VariableCollection) on "Post(PROCEDURE 4).LinesInstructionMgt(Variable 1005)".


    //Unsupported feature: Deletion (VariableCollection) on "Post(PROCEDURE 4).IsScheduledPosting(Variable 1003)".


    //Unsupported feature: Deletion (VariableCollection) on "SetControlAppearance(PROCEDURE 5).WorkflowWebhookMgt(Variable 1000)".

}
