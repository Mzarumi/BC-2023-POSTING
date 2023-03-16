#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187030 pageextension52187030 extends "RapidStart Services Activities" 
{
    layout
    {
        modify(Promoted)
        {
            ApplicationArea = Basic;
        }
        modify("Not Started")
        {
            ApplicationArea = Basic;
        }
        modify("In Progress")
        {
            ApplicationArea = Basic;
        }
        modify(Completed)
        {
            ApplicationArea = Basic;
        }
        modify(Ignored)
        {
            ApplicationArea = Basic;
        }
        modify(Blocked)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Promoted(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Not Started"(Control 7)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""In Progress"(Control 1)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Completed(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Ignored(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Blocked(Control 3)".

        // modify("My User Tasks")
        // {
        //     Visible = false;
        // }
        // modify("UserTaskManagement.GetMyPendingUserTasksCount")
        // {
        //     Visible = false;
        // }
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

        SETFILTER("User ID Filter",USERID);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
        */
    //end;

    //Unsupported feature: Property Deletion (RefreshOnActivate).

}
