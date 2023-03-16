#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187067 pageextension52187067 extends "User Personalization List" 
{
    Caption = 'User Personalization List';
    layout
    {
        modify("User ID")
        {
            ApplicationArea = Basic;
        }
        // modify("Profile ID")
        // {
        //     ApplicationArea = Basic;
        // }
        modify("Language ID")
        {
            ApplicationArea = Basic;
        }
        modify("Locale ID")
        {
            ApplicationArea = Basic;
        }
        modify("Time Zone")
        {
            ApplicationArea = Basic;
        }
        modify(Company)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""User ID"(Control 4)".

        modify("Profile ID")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Profile ID"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Language ID"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Locale ID"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Time Zone"(Control 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Company(Control 10)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).

}
