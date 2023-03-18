#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186521 pageextension52186521 extends "Catalog Item Card"
{

    //Unsupported feature: Property Modification (Name) on ""Catalog Item Card"(Page 5725)".

    Caption = 'Nonstock Item Card';
    layout
    {
        modify("Entry No.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Importance) on ""Entry No."(Control 2)".

        }
        modify("Manufacturer Code")
        {
            ApplicationArea = Basic;
        }
        modify("Vendor No.")
        {
            ApplicationArea = Basic;
        }
        modify("Vendor Item No.")
        {
            ApplicationArea = Basic;
        }
        modify("Item No.")
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
        modify("Last Date Modified")
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

            //Unsupported feature: Property Modification (Importance) on ""Negotiated Cost"(Control 27)".

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
        modify("Bar Code")
        {
            ApplicationArea = Basic;
        }
        modify("Item Template Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Item Template Code"(Control 22)".


            //Unsupported feature: Property Modification (Name) on ""Item Template Code"(Control 22)".

        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Entry No."(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Manufacturer Code"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor No."(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor Item No."(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item No."(Control 10)".


        //Unsupported feature: Property Deletion (Importance) on ""Item No."(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit of Measure"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Last Date Modified"(Control 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Published Cost"(Control 16)".


        //Unsupported feature: Property Deletion (Importance) on ""Published Cost"(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Negotiated Cost"(Control 27)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit Price"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gross Weight"(Control 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Net Weight"(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bar Code"(Control 31)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item Template Code"(Control 22)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter("Item Template Code")
        {
            // field("Product Group Code";Rec."Product Group Code")
            // {
            //     ApplicationArea = Basic;
            // }// 
        }
    }
    actions
    {
        modify("Ca&talog Item")
        {
            Caption = 'Nonstoc&k Item';

            //Unsupported feature: Property Modification (Name) on ""Ca&talog Item"(Action 24)".

        }
        modify("Substituti&ons")
        {
            ApplicationArea = Basic;
        }
        modify("Co&mments")
        {
            ApplicationArea = Basic;
        }
        modify("&Create Item")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Substituti&ons"(Action 33)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 44)".



        //Unsupported feature: Code Modification on ""&Create Item"(Action 41).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CatalogItemMgt.NonstockAutoItem(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        NonstockItemMgt.NonstockAutoItem(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""&Create Item"(Action 41)".

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
    }

    var
        NonstockItemMgt: Codeunit "Catalog Item Management";
}
