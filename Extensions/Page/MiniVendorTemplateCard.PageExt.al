#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186180 pageextension52186180 extends "Vendor Template Card" 
{

    //Unsupported feature: Property Modification (Name) on ""Vendor Template Card"(Page 1344)".


    //Unsupported feature: Property Modification (CardPageID) on ""Vendor Template Card"(Page 1344)".

    layout
    {
        modify("Template Name")
        {
            ApplicationArea = Basic;
        }
        modify("Post Code")
        {
            ToolTip = 'Specifies the vendor''s post code.';
            ApplicationArea = Basic;
        }
        modify(City)
        {
            ApplicationArea = Basic;
        }
        modify("Country/Region Code")
        {
            ToolTip = 'Specifies the country/region code for this vendor.';
            ApplicationArea = Basic;
        }
        modify("Gen. Bus. Posting Group")
        {
            ToolTip = 'Specify the vendor''s trade type to link transactions made for this vendor with the appropriate general ledger account according to the general posting setup.';
            ApplicationArea = Basic;
        }
        modify("VAT Bus. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("Vendor Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("Invoice Disc. Code")
        {
            ApplicationArea = Basic;
        }
        modify("Prices Including VAT")
        {
            ToolTip = 'Specifies if the Direct Unit Cost and Line Amount fields on the purchase lines and in purchase reports should be shown with or without VAT.';
            ApplicationArea = Basic;
        }
        modify("Currency Code")
        {
            ApplicationArea = Basic;
        }
        modify("Language Code")
        {
            ApplicationArea = Basic;
        }
        modify("Application Method")
        {
            ToolTip = 'Specifies how to apply payments to entries for this vendor. Select Manual to manually specify the document that a payment applies to. This is the default method. Select Apply to Oldest to automatically apply payments to the oldest open vendor ledger entry.';
            ApplicationArea = Basic;
        }
        modify("Payment Terms Code")
        {
            ToolTip = 'Specifies a code that indicates the payment terms that the vendor usually requires. The payment terms code you define in this field is inserted on purchase invoices for the vendor.';
            ApplicationArea = Basic;
        }
        modify("Payment Method Code")
        {
            ToolTip = 'Specifies how the vendor requires you to submit payment, such as bank transfer or check. The payment method code that you select in this field is inserted on purchase invoices for the vendor.';
            ApplicationArea = Basic;
        }
        modify("Fin. Charge Terms Code")
        {
            ApplicationArea = Basic;
        }
        modify("Block Payment Tolerance")
        {
            ToolTip = 'Specifies if the vendor allows payment tolerance. You only fill this field if you know the vendor''s payment reminder policy.';
            ApplicationArea = Basic;
        }
        modify(TemplateEnabled)
        {
            Visible = false;
        }
        modify(NoSeries)
        {
            Visible = false;
        }
        modify("Validate EU Vat Reg. No.")
        {
            Visible = false;
        }
    }
    actions
    {
        modify("Default Dimensions")
        {
            ToolTip = 'View or edit any dimensions that are set up for the vendor that you want to reuse for the template.';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""Default Dimensions"(Action 31)".

        }

        //Unsupported feature: Property Deletion (PromotedOnly) on ""Default Dimensions"(Action 31)".

    }

    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetDimensionsEnabled;
        SetTemplateEnabled;
        SetNoSeries;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SetDimensionsEnabled;
        */
    //end;


    //Unsupported feature: Code Modification on "CheckTemplateNameProvided(PROCEDURE 2)".

    //procedure CheckTemplateNameProvided();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Template Name" = '' THEN
          ERROR(ProvideTemplateNameErr,FIELDCAPTION("Template Name"));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF "Template Name" = '' THEN
          ERROR(STRSUBSTNO(ProvideTemplateNameErr,FIELDCAPTION("Template Name")));
        */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "CreateFromVend(PROCEDURE 1)".

}
