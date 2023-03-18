#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186177 pageextension52186177 extends "Cust. Template Card" 
{

    //Unsupported feature: Property Modification (Name) on ""Cust. Template Card"(Page 1341)".


    //Unsupported feature: Property Modification (CardPageID) on ""Cust. Template Card"(Page 1341)".

    layout
    {
        modify("Template Name")
        {
            ApplicationArea = Basic;
        }
        modify("Post Code")
        {
            ToolTip = 'Specifies the customer''s post code.';
            ApplicationArea = Basic;
        }
        modify(City)
        {
            ApplicationArea = Basic;
        }
        modify("Country/Region Code")
        {
            ToolTip = 'Specifies a country/region code for the customer. To see the country/region codes and address formats in the Countries/Regions window, choose the field.';
            ApplicationArea = Basic;
        }
        modify("Document Sending Profile")
        {
            ApplicationArea = Basic;
        }
        modify("Gen. Bus. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("VAT Bus. Posting Group")
        {
            ToolTip = 'Specifies the customer''s VAT specification to link transactions made for this customer with the appropriate general ledger account according to the VAT posting setup.';
            ApplicationArea = Basic;
        }
        modify("Customer Posting Group")
        {
            ToolTip = 'Specifies the customer''s market type to link business transactions made for the customer with the appropriate account in the general ledger.';
            ApplicationArea = Basic;
        }
        modify("Customer Price Group")
        {
            ToolTip = 'Specifies the customer price group code, which you can use as a criterion to set up special sales prices in the Sales Prices window.';
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
        modify("Prices Including VAT")
        {
            ToolTip = 'Specifies if the Unit Price and Line Amount fields on sales lines for this customer should be shown with or without VAT.';
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
            ToolTip = 'Specifies how to apply payments to entries for this customer. Select Manual to manually specify the document that a payment applies to. This is the default method. Select Apply to Oldest to automatically apply payments to the oldest open customer ledger entry.';
            ApplicationArea = Basic;
        }
        modify("Payment Terms Code")
        {
            ToolTip = 'Specifies at which terms you require the customer to pay for products. The payment terms code that you define in this field is inserted on sales invoices for the customer.';
            ApplicationArea = Basic;
        }
        modify("Payment Method Code")
        {
            ToolTip = 'Specifies how payment for the sales document must be submitted, such as bank transfer or check. By default, the payment method from the customer card is entered.';
            ApplicationArea = Basic;
        }
        modify("Reminder Terms Code")
        {
            ApplicationArea = Basic;
        }
        modify("Fin. Charge Terms Code")
        {
            ToolTip = 'Specifies the finance charges that are calculated for the customer. A finance charge term contains information about the interest calculation method, interest rate, and so on.';
            ApplicationArea = Basic;
        }
        modify("Print Statements")
        {
            ApplicationArea = Basic;
        }
        modify("Block Payment Tolerance")
        {
            ToolTip = 'Specifies that the customer is not allowed payment tolerance.';
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

        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Sending Profile"(Control 33)".

        modify("Validate EU Vat Reg. No.")
        {
            Visible = false;
        }
    }
    actions
    {
        modify("Default Dimensions")
        {
            ToolTip = 'View or edit any dimensions that are set up for the customer that you want to reuse for the template.';
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

    //Unsupported feature: Property Deletion (Attributes) on "CreateFromCust(PROCEDURE 1)".

}
