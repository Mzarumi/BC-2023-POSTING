#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186896 pageextension52186896 extends "Whse. Internal Pick" 
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
        modify("To Zone Code")
        {
            ApplicationArea = Basic;
        }
        modify("To Bin Code")
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
        modify("Due Date")
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


        //Unsupported feature: Property Deletion (ToolTipML) on ""To Zone Code"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""To Bin Code"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Status"(Control 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Status(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Due Date"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assigned User ID"(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assignment Date"(Control 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assignment Time"(Control 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sorting Method"(Control 13)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "WhseInternalPickLines(Control 97)".


        //Unsupported feature: Property Deletion (PartType) on "WhseInternalPickLines(Control 97)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control6(Control 6)".


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
        modify("Re&lease")
        {
            ApplicationArea = Basic;
        }
        modify("Re&open")
        {
            ApplicationArea = Basic;
        }
        modify(CreatePick)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "List(Action 101)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 31)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pick Lines"(Action 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Re&lease"(Action 45)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Re&open"(Action 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on "CreatePick(Action 24)".

        addafter("Re&open")
        {
            separator(Action17)
            {
            }
        }
    }
}
