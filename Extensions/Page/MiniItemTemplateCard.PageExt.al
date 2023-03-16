#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186178 pageextension52186178 extends "Item Template Card" 
{

    //Unsupported feature: Property Modification (Name) on ""Item Template Card"(Page 1342)".


    //Unsupported feature: Property Modification (CardPageID) on ""Item Template Card"(Page 1342)".

    layout
    {
        modify("Template Name")
        {
            ApplicationArea = Basic;
        }
        modify("Base Unit of Measure")
        {
            ToolTip = 'Specifies the unit in which the item is held on inventory. The base unit of measure also serves as the conversion basis for alternate units of measure.';
            ApplicationArea = Basic;
        }
        modify(Type)
        {
            ApplicationArea = Basic;
        }
        modify("Automatic Ext. Texts")
        {
            ToolTip = 'Specifies that an extended text that you have set up will be added automatically on sales or purchase documents for this item.';
            ApplicationArea = Basic;
        }
        modify("Price Includes VAT")
        {
            ApplicationArea = Basic;
        }
        modify("Price/Profit Calculation")
        {
            ToolTip = 'Specifies if the Profit % field, the Unit Price field, or neither field is calculated and filled. The value in the Profit % field is what is generally understood as the profit margin.';
            ApplicationArea = Basic;
        }
        modify("Profit %")
        {
            ToolTip = 'Specifies how much profit you have made from the customer in the current fiscal year, expressed as a percentage of the customer''s total sales. The calculation takes into account any changes that occurred in purchase prices of the sold goods.';
            ApplicationArea = Basic;
        }
        modify("Allow Invoice Disc.")
        {
            ApplicationArea = Basic;
        }
        modify("Item Disc. Group")
        {
            ApplicationArea = Basic;
        }
        modify("Costing Method")
        {
            ToolTip = 'Links business transactions made for this item with the general ledger to account for VAT amounts that result from trade with the item.';
            ApplicationArea = Basic;
        }
        modify("Indirect Cost %")
        {
            ApplicationArea = Basic;
        }
        modify("Gen. Prod. Posting Group")
        {
            ToolTip = 'Links business transactions made for this item with the general ledger to account for the value of trade with the item.';
            ApplicationArea = Basic;
        }
        modify("VAT Prod. Posting Group")
        {
            ToolTip = 'Links business transactions made for this item with the general ledger to account for VAT amounts that result from trade with the item.';
            ApplicationArea = Basic;
        }
        modify("Inventory Posting Group")
        {
            ToolTip = 'Links business transactions made for the item with an inventory account in the general ledger to group amounts for that item type.';
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
        modify("Tax Group Code")
        {
            Visible = false;
        }
        modify(Categorization)
        {
            Visible = false;
        }
        modify("Item Category Code")
        {
            Visible = false;
        }
        modify("Service Item Group")
        {
            Visible = false;
        }
        modify("Warehouse Class Code")
        {
            Visible = false;
        }
    }
    actions
    {
        modify("Default Dimensions")
        {
            ToolTip = 'View or edit any dimensions that are set up for the item that you want to reuse for the template.';
            ApplicationArea = Basic;
        }
    }

    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetInventoryPostingGroupEditable;
        SetDimensionsEnabled;
        SetTemplateEnabled;
        SetCostingMethodDefault;
        SetNoSeries;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SetInventoryPostingGroupEditable;
        SetDimensionsEnabled;
        */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "SetInventoryPostingGroupEditable(PROCEDURE 1)".



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

    //Unsupported feature: Property Deletion (Attributes) on "CreateFromItem(PROCEDURE 3)".

}
