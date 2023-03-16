#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185859 pageextension52185859 extends "Change Log Entries"
{
    layout
    {
        modify("Entry No.")
        {
            ApplicationArea = Basic;
        }
        modify("Date and Time")
        {
            ApplicationArea = Basic;
        }
        modify("User ID")
        {
            ApplicationArea = Basic;
        }
        modify("Table No.")
        {
            ApplicationArea = Basic;
        }
        modify("Table Caption")
        {
            ApplicationArea = Basic;
        }
        modify("Primary Key")
        {
            ApplicationArea = Basic;
        }
        modify("Primary Key Field 1 No.")
        {
            ApplicationArea = Basic;
        }
        modify("Primary Key Field 1 Caption")
        {
            ApplicationArea = Basic;
        }
        modify("Primary Key Field 1 Value")
        {
            ApplicationArea = Basic;
        }
        modify("Primary Key Field 2 No.")
        {
            ApplicationArea = Basic;
        }
        modify("Primary Key Field 2 Caption")
        {
            ApplicationArea = Basic;
        }
        modify("Primary Key Field 2 Value")
        {
            ApplicationArea = Basic;
        }
        modify("Primary Key Field 3 No.")
        {
            ApplicationArea = Basic;
        }
        modify("Primary Key Field 3 Caption")
        {
            ApplicationArea = Basic;
        }
        modify("Primary Key Field 3 Value")
        {
            ApplicationArea = Basic;
        }
        modify("Field No.")
        {
            ApplicationArea = Basic;
        }
        modify("Field Caption")
        {
            ApplicationArea = Basic;
        }
        modify("Type of Change")
        {
            ApplicationArea = Basic;
        }
        modify("Old Value")
        {
            ApplicationArea = Basic;
        }
        modify("Old Value Local")
        {
            ApplicationArea = Basic;
        }
        modify("New Value")
        {
            ApplicationArea = Basic;
        }
        modify("New Value Local")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Entry No."(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Date and Time"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""User ID"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Table No."(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Table Caption"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Primary Key"(Control 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Primary Key Field 1 No."(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Primary Key Field 1 Caption"(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Primary Key Field 1 Value"(Control 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Primary Key Field 2 No."(Control 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Primary Key Field 2 Caption"(Control 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Primary Key Field 2 Value"(Control 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Primary Key Field 3 No."(Control 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Primary Key Field 3 Caption"(Control 40)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Primary Key Field 3 Value"(Control 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Field No."(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Field Caption"(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Type of Change"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Old Value"(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Old Value Local"(Control 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""New Value"(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""New Value Local"(Control 5)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify("&Print")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Code Insertion (VariableCollection) on ""&Print"(Action 47).OnAction".

        //trigger (Variable: ChangeLogEntriesRep)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on ""&Print"(Action 47).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        REPORT.RUN(REPORT::"Change Log Entries",TRUE,FALSE,Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ChangeLogEntriesRep.SETTABLEVIEW(Rec);
        ChangeLogEntriesRep.RUN;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""&Print"(Action 47)".

        modify(Setup)
        {
            Visible = false;
        }
        // modify("Delete Entries")
        // {
        //     Visible = false;
        // }
    }

    var
        ChangeLogEntriesRep: Report "Change Log Entries";

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (AdditionalSearchTermsML).

}
