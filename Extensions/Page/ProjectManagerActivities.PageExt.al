#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187026 pageextension52187026 extends "Project Manager Activities" 
{
    layout
    {
        modify("Upcoming Invoices")
        {
            ApplicationArea = Basic;
        }
        modify("Invoices Due - Not Created")
        {
            ApplicationArea = Basic;
        }
        modify("WIP Not Posted")
        {
            ApplicationArea = Basic;
        }
        modify("Completed - WIP Not Calculated")
        {
            ApplicationArea = Basic;
        }
        modify("Intelligent Cloud")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (Visible) on "Invoicing(Control 7)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Upcoming Invoices"(Control 1)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Invoices Due - Not Created"(Control 5)".


        //Unsupported feature: Property Deletion (Visible) on ""Work in Process"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""WIP Not Posted"(Control 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Completed - WIP Not Calculated"(Control 12)".

        modify("Jobs to Budget")
        {
            Visible = false;
        }
        modify("Jobs Over Budget")
        {
            Visible = false;
        }
        // modify("My User Tasks")
        // {
        //     Visible = false;
        // }
        // modify("UserTaskManagement.GetMyPendingUserTasksCount")
        // {
        //     Visible = false;
        // }
        modify("Get started")
        {
            Visible = false;
        }
        modify(Jobs)
        {
            Visible = false;
        }
    }
    actions
    {
        // modify("Invoicing(Control 7).""Job Create Sales Invoice""")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("""Work in Process""(Control 8).""Update Job Item Cost""")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("""Work in Process""(Control 8).""<Action15>""")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify(ActionContainer17)
        // {
        //     Visible = false;
        // }
        modify("Set Up Cues")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Invoicing(Control 7)."Job Create Sales Invoice"(Action 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Work in Process"(Control 8)."Update Job Item Cost"(Action 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Work in Process"(Control 8)."<Action15>"(Action 15)".

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

        SETFILTER("Date Filter",'>=%1',WORKDATE);
        SETFILTER("Date Filter2",'<%1&<>%2',WORKDATE,0D);
        SETRANGE("User ID Filter",USERID);

        RoleCenterNotificationMgt.ShowChangeToPremiumExpNotification;

        ShowIntelligentCloud := NOT PermissionManager.SoftwareAsAService;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
        */
    //end;

    //Unsupported feature: Property Deletion (RefreshOnActivate).


    //Unsupported feature: Property Deletion (ShowFilter).

}
