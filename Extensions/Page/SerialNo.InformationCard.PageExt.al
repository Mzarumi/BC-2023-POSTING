#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186753 pageextension52186753 extends "Serial No. Information Card" 
{
    layout
    {
        modify("Item No.")
        {
            ApplicationArea = Basic;
        }
        modify("Variant Code")
        {
            ApplicationArea = Basic;
        }
        modify("Serial No.")
        {
            ApplicationArea = Basic;
        }
        modify(Description)
        {
            ApplicationArea = Basic;
        }
        modify(Blocked)
        {
            ApplicationArea = Basic;
        }
        modify(Control19)
        {
            ApplicationArea = Basic;
        }
        modify("Expired Inventory")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Item No."(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Variant Code"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Serial No."(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Blocked(Control 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Control19(Control 19)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Expired Inventory"(Control 20)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify("Item &Tracking Entries")
        {
            ApplicationArea = Basic;
        }
        modify(Comment)
        {
            ApplicationArea = Basic;
        }
        modify("&Item Tracing")
        {
            ApplicationArea = Basic;
        }
        modify(CopyInfo)
        {
            ApplicationArea = Basic;
        }
        modify(Navigate)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Item &Tracking Entries"(Action 6500)".


        //Unsupported feature: Code Insertion on "Comment(Action 17)".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //begin
            /*
            IF INSERT THEN;
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Comment(Action 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Item Tracing"(Action 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on "CopyInfo(Action 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Navigate(Action 23)".

    }


    //Unsupported feature: Property Modification (Id) on "CopyInfo(Action 22).OnAction.SerialNoInfoList(Variable 1000)".

    //var
        //>>>> ORIGINAL VALUE:
        //CopyInfo : 1000;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //CopyInfo : 1003;
        //Variable type has not been exported.


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SETFILTER("Date Filter",'..%1',WORKDATE);
        IF ShowButtonFunctions THEN
          ButtonFunctionsVisible := TRUE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SETRANGE("Date Filter",00000101D,WORKDATE);
        IF ShowButtonFunctions THEN
          ButtonFunctionsVisible := TRUE;
        */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "Init(PROCEDURE 1)".


    //Unsupported feature: Property Deletion (Attributes) on "InitWhse(PROCEDURE 2)".

}
