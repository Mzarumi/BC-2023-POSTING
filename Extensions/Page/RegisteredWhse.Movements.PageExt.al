#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187161 pageextension52187161 extends "Registered Whse. Movements" 
{
    Caption = 'Registered Whse. Movement List';
    layout
    {
        modify(Type)
        {
            ApplicationArea = Basic;
        }
        modify("No.")
        {
            ApplicationArea = Basic;
        }
        modify("Whse. Activity No.")
        {
            ApplicationArea = Basic;
        }
        modify("Location Code")
        {
            ApplicationArea = Basic;
        }
        modify("Assigned User ID")
        {
            ApplicationArea = Basic;
        }
        modify("Sorting Method")
        {
            ApplicationArea = Basic;
        }
        modify("No. Series")
        {
            ApplicationArea = Basic;
        }
        modify("Registering Date")
        {
            ApplicationArea = Basic;
        }
        modify("Assignment Date")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Type(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Whse. Activity No."(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Location Code"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assigned User ID"(Control 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sorting Method"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""No. Series"(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Registering Date"(Control 1102601001)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assignment Date"(Control 1102601004)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify("Co&mments")
        {
            ApplicationArea = Basic;
        }
        modify("Delete Registered Movements")
        {
            Visible = false;
        }
    }

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).

}
