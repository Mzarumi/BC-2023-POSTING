#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186857 pageextension52186857 extends "Warehouse Movement" 
{
    layout
    {
        modify("No.")
        {
            ApplicationArea = Basic;
        }
        modify(CurrentLocationCode)
        {
            ApplicationArea = Basic;
        }
        modify("Breakbulk Filter")
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


        //Unsupported feature: Property Deletion (ToolTipML) on "CurrentLocationCode(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Breakbulk Filter"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assigned User ID"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assignment Date"(Control 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assignment Time"(Control 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sorting Method"(Control 12)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "WhseMovLines(Control 97)".


        //Unsupported feature: Property Deletion (PartType) on "WhseMovLines(Control 97)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1901796907(Control 1901796907)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control5(Control 5)".


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
        modify("Registered Movements")
        {
            ApplicationArea = Basic;
        }
        modify("&Autofill Qty. to Handle")
        {
            ApplicationArea = Basic;
        }
        modify("&Delete Qty. to Handle")
        {
            ApplicationArea = Basic;
        }
        modify("&Register Movement")
        {
            ApplicationArea = Basic;
        }
        modify("&Print")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "List(Action 101)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Registered Movements"(Action 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Autofill Qty. to Handle"(Action 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Delete Qty. to Handle"(Action 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Register Movement"(Action 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Print"(Action 6)".

        addafter("&Delete Qty. to Handle")
        {
            separator(Action4)
            {
            }
        }
    }
}
