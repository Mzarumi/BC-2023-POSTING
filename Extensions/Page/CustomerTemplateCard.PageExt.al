#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186337 pageextension52186337 extends "Customer Template Card" 
{
    layout
    {
        modify("Code")
        {
            ApplicationArea = Basic;
        }
        modify(Description)
        {
            ApplicationArea = Basic;
        }
        modify("Country/Region Code")
        {
            ApplicationArea = Basic;
        }
        modify("Territory Code")
        {
            ApplicationArea = Basic;
        }
        modify("Currency Code")
        {
            ApplicationArea = Basic;
        }
        modify("Gen. Bus. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("VAT Bus. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("Customer Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("Customer Price Group")
        {
            ApplicationArea = Basic;
        }
        modify("Customer Disc. Group")
        {
            ApplicationArea = Basic;
        }
        modify("Allow Line Disc.")
        {
            ApplicationArea = Basic;
        }
        modify("Invoice Disc. Code")
        {
            ApplicationArea = Basic;
        }
        modify("Payment Terms Code")
        {
            ApplicationArea = Basic;
        }
        modify("Payment Method Code")
        {
            ApplicationArea = Basic;
        }
        modify("Shipment Method Code")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Code(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 4)".

        modify("Contact Type")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Country/Region Code"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Territory Code"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Bus. Posting Group"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Bus. Posting Group"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Customer Posting Group"(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Customer Price Group"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Customer Disc. Group"(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Allow Line Disc."(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Invoice Disc. Code"(Control 24)".

        modify("Prices Including VAT")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Terms Code"(Control 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Method Code"(Control 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shipment Method Code"(Control 36)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify("&Contact Conversion Template")
        {
            Caption = '&Customer Template';

            //Unsupported feature: Property Modification (Name) on ""&Contact Conversion Template"(Action 29)".

        }
        modify(Dimensions)
        {
            ApplicationArea = Basic;
        }
        modify("Invoice &Discounts")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 31)".


        //Unsupported feature: Property Deletion (Promoted) on "Dimensions(Action 31)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Dimensions(Action 31)".

        modify(CopyTemplate)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Invoice &Discounts"(Action 28)".

    }
}
