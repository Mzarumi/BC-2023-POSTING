#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186874 pageextension52186874 extends "Warehouse Shipment" 
{
    layout
    {
        modify("No.")
        {
            ApplicationArea = Basic;
        }
        modify("Location Code")
        {
            ApplicationArea = Basic;
        }
        modify("Zone Code")
        {
            ApplicationArea = Basic;
        }
        modify("Bin Code")
        {
            ApplicationArea = Basic;
        }
        modify("Document Status")
        {
            ApplicationArea = Basic;
        }
        modify(Status)
        {
            ApplicationArea = Basic;
        }
        modify("Posting Date")
        {
            ApplicationArea = Basic;
        }
        modify("Assigned User ID")
        {
            ApplicationArea = Basic;
        }
        modify("Assignment Date")
        {
            ApplicationArea = Basic;
        }
        modify("Assignment Time")
        {
            ApplicationArea = Basic;
        }
        modify("Sorting Method")
        {
            ApplicationArea = Basic;
        }
        modify("External Document No.")
        {
            ApplicationArea = Basic;
        }
        modify("Shipment Date")
        {
            ApplicationArea = Basic;
        }
        modify("Shipping Agent Code")
        {
            ApplicationArea = Basic;
        }
        modify("Shipping Agent Service Code")
        {
            ApplicationArea = Basic;
        }
        modify("Shipment Method Code")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Location Code"(Control 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Zone Code"(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bin Code"(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Status"(Control 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Status(Control 47)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posting Date"(Control 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assigned User ID"(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assignment Date"(Control 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assignment Time"(Control 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sorting Method"(Control 13)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "WhseShptLines(Control 97)".


        //Unsupported feature: Property Deletion (PartType) on "WhseShptLines(Control 97)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""External Document No."(Control 55)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shipment Date"(Control 40)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shipping Agent Code"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shipping Agent Service Code"(Control 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shipment Method Code"(Control 19)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1901796907(Control 1901796907)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify(List)
        {
            ApplicationArea = Basic;
        }
        modify("Co&mments")
        {
            ApplicationArea = Basic;
        }
        modify("Pick Lines")
        {
            ApplicationArea = Basic;
        }
        modify("Registered P&ick Lines")
        {
            ApplicationArea = Basic;
        }
        modify("Posted &Whse. Shipments")
        {

            //Unsupported feature: Property Modification (Name) on ""Posted &Whse. Shipments"(Action 53)".

            Caption = 'Posted &Whse. Shipments';
            ApplicationArea = Basic;
        }
        modify("Use Filters to Get Src. Docs.")
        {
            ApplicationArea = Basic;
        }
        modify("Get Source Documents")
        {
            ApplicationArea = Basic;
        }
        modify("Re&lease")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""Re&lease"(Action 45)".

        }
        modify("Re&open")
        {
            ApplicationArea = Basic;
        }
        modify("Autofill Qty. to Ship")
        {
            ApplicationArea = Basic;
        }
        modify("Delete Qty. to Ship")
        {
            ApplicationArea = Basic;
        }
        modify("Create Pick")
        {
            ApplicationArea = Basic;
        }
        modify("P&ost Shipment")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""P&ost Shipment"(Action 25)".

        }
        modify("Post and &Print")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""Post and &Print"(Action 26)".

        }
        modify("&Print")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""&Print"(Action 57)".

        }

        //Unsupported feature: Property Deletion (ToolTipML) on "List(Action 101)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 31)".


        //Unsupported feature: Property Deletion (Promoted) on ""Co&mments"(Action 31)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Co&mments"(Action 31)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pick Lines"(Action 52)".


        //Unsupported feature: Property Deletion (Promoted) on ""Pick Lines"(Action 52)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Pick Lines"(Action 52)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Registered P&ick Lines"(Action 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted &Whse. Shipments"(Action 53)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Use Filters to Get Src. Docs."(Action 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Get Source Documents"(Action 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Re&lease"(Action 45)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on ""Re&lease"(Action 45)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""Re&lease"(Action 45)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Re&open"(Action 46)".


        //Unsupported feature: Property Deletion (Promoted) on ""Re&open"(Action 46)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Re&open"(Action 46)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""Re&open"(Action 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Autofill Qty. to Ship"(Action 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Delete Qty. to Ship"(Action 49)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Create Pick"(Action 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""P&ost Shipment"(Action 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post and &Print"(Action 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Print"(Action 57)".

    }

    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
