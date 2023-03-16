#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187014 pageextension52187014 extends "Production Planner Activities" 
{
    layout
    {
        modify("Planned Prod. Orders - All")
        {
            ApplicationArea = Basic;
        }
        modify("Firm Plan. Prod. Orders - All")
        {
            ApplicationArea = Basic;
        }
        modify("Released Prod. Orders - All")
        {
            ApplicationArea = Basic;
        }
        modify("Purchase Orders")
        {
            ApplicationArea = Basic;
        }
        modify("Prod. BOMs under Development")
        {
            ApplicationArea = Basic;
        }
        modify("Routings under Development")
        {
            ApplicationArea = Basic;
        }
        modify("Intelligent Cloud")
        {
            Visible = false;
        }
        modify("Simulated Prod. Orders")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Planned Prod. Orders - All"(Control 1)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Firm Plan. Prod. Orders - All"(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Released Prod. Orders - All"(Control 7)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Purchase Orders"(Control 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prod. BOMs under Development"(Control 19)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Routings under Development"(Control 18)".

        // modify("My User Tasks")
        // {
        //     Visible = false;
        // }
        // modify("UserTaskManagement.GetMyPendingUserTasksCount")
        // {
        //     Visible = false;
        // }
    }
    actions
    {
        // modify("""Production Orders""(Control 2).""Change Production Order Status""")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("""Production Orders""(Control 2).""New Production Order""")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("""Production Orders""(Control 2).Navigate")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("""Planning - Operations""(Control 3).""New Purchase Order""")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("""Planning - Operations""(Control 3).""Edit Planning Worksheet""")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("""Planning - Operations""(Control 3).""Edit Subcontracting Worksheet""")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("Design(Control 10).""New Item""")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("Design(Control 10).""New Production BOM""")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("Design(Control 10).""New Routing""")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify(ActionContainer9)
        // {
        //     Visible = false;
        // }
        // modify("Set Up Cues")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Production Orders"(Control 2)."Change Production Order Status"(Action 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Production Orders"(Control 2)."New Production Order"(Action 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Production Orders"(Control 2).Navigate(Action 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Planning - Operations"(Control 3)."New Purchase Order"(Action 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Planning - Operations"(Control 3)."Edit Planning Worksheet"(Action 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Planning - Operations"(Control 3)."Edit Subcontracting Worksheet"(Action 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Design(Control 10)."New Item"(Action 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Design(Control 10)."New Production BOM"(Action 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Design(Control 10)."New Routing"(Action 26)".

    }

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        RESET;
        IF NOT GET THEN BEGIN
          INIT;
          INSERT;
        END;

        SETRANGE("User ID Filter",USERID);

        RoleCenterNotificationMgt.ShowChangeToPremiumExpNotification;

        ShowIntelligentCloud := NOT PermissionManager.SoftwareAsAService;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
        */
    //end;

    //Unsupported feature: Property Deletion (RefreshOnActivate).

}
