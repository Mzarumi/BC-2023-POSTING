#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186548 pageextension52186548 extends "Warehouse Receipt" 
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
        modify("Posting Date")
        {
            ApplicationArea = Basic;
        }
        modify("Vendor Shipment No.")
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

        //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Location Code"(Control 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Zone Code"(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bin Code"(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Status"(Control 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posting Date"(Control 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor Shipment No."(Control 44)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assigned User ID"(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assignment Date"(Control 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assignment Time"(Control 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sorting Method"(Control 13)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "WhseReceiptLines(Control 97)".


        //Unsupported feature: Property Deletion (PartType) on "WhseReceiptLines(Control 97)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1901796907(Control 1901796907)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter("Sorting Method")
        {
            field("Receiving No. Series";Rec."Receiving No. Series")
            {
                ApplicationArea = Basic;
            }
        }
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
        modify("Posted &Whse. Receipts")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""Posted &Whse. Receipts"(Action 6)".

        }
        modify("Use Filters to Get Src. Docs.")
        {
            ApplicationArea = Basic;
        }
        modify("Get Source Documents")
        {
            ApplicationArea = Basic;
        }
        modify("Autofill Qty. to Receive")
        {
            ApplicationArea = Basic;
        }
        modify("Delete Qty. to Receive")
        {
            ApplicationArea = Basic;
        }
        modify(CalculateCrossDock)
        {
            ApplicationArea = Basic;
        }
        modify("Post Receipt")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""Post Receipt"(Action 25)".

        }
        modify("Post and &Print")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""Post and &Print"(Action 47)".

        }
        modify("Post and Print P&ut-away")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""Post and Print P&ut-away"(Action 26)".

        }
        modify("&Print")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""&Print"(Action 21)".

        }

        //Unsupported feature: Property Deletion (ToolTipML) on "List(Action 101)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 31)".


        //Unsupported feature: Property Deletion (Promoted) on ""Co&mments"(Action 31)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Co&mments"(Action 31)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted &Whse. Receipts"(Action 6)".



        //Unsupported feature: Code Modification on ""Use Filters to Get Src. Docs."(Action 34).OnAction".

        //trigger  Docs()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            GetSourceDocInbound.GetInboundDocs(Rec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            GetSourceDocInbound.GetInboundDocs(Rec);
            "Document Status" := GetHeaderStatus(0);
            MODIFY;
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Use Filters to Get Src. Docs."(Action 34)".



        //Unsupported feature: Code Modification on ""Get Source Documents"(Action 23).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            GetSourceDocInbound.GetSingleInboundDoc(Rec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            GetSourceDocInbound.GetSingleInboundDoc(Rec);
            "Document Status" := GetHeaderStatus(0);
            MODIFY;
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Get Source Documents"(Action 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Autofill Qty. to Receive"(Action 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Delete Qty. to Receive"(Action 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on "CalculateCrossDock(Action 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post Receipt"(Action 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post and &Print"(Action 47)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post and Print P&ut-away"(Action 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Print"(Action 21)".

    }

    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
