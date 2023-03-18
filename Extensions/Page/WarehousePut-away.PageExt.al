#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186550 pageextension52186550 extends "Warehouse Put-away" 
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


        //Unsupported feature: Property Deletion (ToolTipML) on "CurrentLocationCode(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Breakbulk Filter"(Control 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assigned User ID"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assignment Date"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assignment Time"(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sorting Method"(Control 12)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "WhseActivityLines(Control 97)".


        //Unsupported feature: Property Deletion (PartType) on "WhseActivityLines(Control 97)".


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
        modify("Registered Put-aways")
        {
            ApplicationArea = Basic;
        }
        modify("Autofill Qty. to Handle")
        {
            ApplicationArea = Basic;
        }
        modify("Delete Qty. to Handle")
        {
            ApplicationArea = Basic;
        }
        modify("&Register Put-away")
        {
            ApplicationArea = Basic;
        }
        modify("&Print")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "List(Action 101)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Registered Put-aways"(Action 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Autofill Qty. to Handle"(Action 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Delete Qty. to Handle"(Action 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Register Put-away"(Action 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Print"(Action 6)".

    }
}
