#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186522 pageextension52186522 extends "Catalog Item List"
{

    //Unsupported feature: Property Modification (Name) on ""Catalog Item List"(Page 5726)".

    Caption = 'Nonstock Item List';

    //Unsupported feature: Property Modification (CardPageID) on ""Catalog Item List"(Page 5726)".

    layout
    {
        modify("Vendor Item No.")
        {
            ApplicationArea = Basic;
        }
        modify("Manufacturer Code")
        {
            ApplicationArea = Basic;
        }
        modify("Item No.")
        {
            ApplicationArea = Basic;
        }
        modify("Vendor No.")
        {
            ApplicationArea = Basic;
        }
        modify(Description)
        {
            ApplicationArea = Basic;
        }
        modify("Unit of Measure")
        {
            ApplicationArea = Basic;
        }
        modify("Published Cost")
        {
            ApplicationArea = Basic;
        }
        modify("Negotiated Cost")
        {
            ApplicationArea = Basic;
        }
        modify("Unit Price")
        {
            ApplicationArea = Basic;
        }
        modify("Gross Weight")
        {
            ApplicationArea = Basic;
        }
        modify("Net Weight")
        {
            ApplicationArea = Basic;
        }
        modify("Item Template Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Item Template Code"(Control 18)".


            //Unsupported feature: Property Modification (Name) on ""Item Template Code"(Control 18)".

        }
        modify("Last Date Modified")
        {
            ApplicationArea = Basic;
        }
        modify("Bar Code")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor Item No."(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Manufacturer Code"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item No."(Control 6)".


        //Unsupported feature: Property Deletion (Visible) on ""Item No."(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor No."(Control 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit of Measure"(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Published Cost"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Negotiated Cost"(Control 27)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit Price"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gross Weight"(Control 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Net Weight"(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item Template Code"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Last Date Modified"(Control 33)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bar Code"(Control 35)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter("Item Template Code")
        {
            // field("Product Group Code"; Rec."Product Group Code")
            // {
            //     ApplicationArea = Basic;
            // }
        }
    }
    actions
    {
        modify("Ca&talog Item")
        {
            Caption = 'Nonstoc&k Item';

            //Unsupported feature: Property Modification (Name) on ""Ca&talog Item"(Action 1102601002)".

        }
        modify("Substituti&ons")
        {
            ApplicationArea = Basic;
        }
        modify("Co&mments")
        {
            ApplicationArea = Basic;
        }
        modify("Catalog Item Sales")
        {
            Caption = 'Nonstock Item Sales';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on ""Catalog Item Sales"(Action 1907253406)".

        }
        modify("Item Substitutions")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Substituti&ons"(Action 1102601004)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 1102601005)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Catalog Item Sales"(Action 1907253406)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item Substitutions"(Action 1905753506)".

        addfirst(creation)
        {
            action("New Item")
            {
                ApplicationArea = Basic;
                Caption = 'New Item';
                Image = NewItem;
                Promoted = true;
                PromotedCategory = New;
                RunObject = Page "Item Card";
                RunPageMode = Create;
            }
        }
        addfirst(Reporting)
        {
            action("Inventory - List")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory - List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
               // RunObject = Report 701;
            }
            action("Inventory Availability")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory Availability';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
               // RunObject = Report 705;
            }
            action("Inventory - Availability Plan")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory - Availability Plan';
                Image = ItemAvailability;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory - Availability Plan";
            }
            action("Item/Vendor Catalog")
            {
                ApplicationArea = Basic;
                Caption = 'Item/Vendor Catalog';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
               // RunObject = Report 720;
            }
        }
    }

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (AdditionalSearchTermsML).

}
