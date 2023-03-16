#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186454 pageextension52186454 extends "Fixed Asset Setup"
{
    layout
    {
        modify("Default Depr. Book")
        {
            ApplicationArea = Basic;
        }
        modify("Allow Posting to Main Assets")
        {
            ApplicationArea = Basic;
        }
        modify("Allow FA Posting From")
        {
            ApplicationArea = Basic;
        }
        modify("Allow FA Posting To")
        {
            ApplicationArea = Basic;
        }
        modify("Insurance Depr. Book")
        {
            ApplicationArea = Basic;
        }
        modify("Automatic Insurance Posting")
        {
            ApplicationArea = Basic;
        }
        modify("Fixed Asset Nos.")
        {
            ApplicationArea = Basic;
        }
        modify("Insurance Nos.")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Default Depr. Book"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Allow Posting to Main Assets"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Allow FA Posting From"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Allow FA Posting To"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Insurance Depr. Book"(Control 11)".


        //Unsupported feature: Property Deletion (Importance) on ""Insurance Depr. Book"(Control 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Automatic Insurance Posting"(Control 13)".


        //Unsupported feature: Property Deletion (Importance) on ""Automatic Insurance Posting"(Control 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Fixed Asset Nos."(Control 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Insurance Nos."(Control 17)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter("Insurance Nos.")
        {
            //field("Asset Transfer Nos."; "Asset Transfer Nos.")
            //{
                //ApplicationArea = Basic;
            //}
        }
    }
    actions
    {
        // modify(ActionContainer20)
        // {
        //     Visible = false;
        // }
        modify("Depreciation Books")
        {
            Visible = false;
        }
        modify("Depreciation Tables")
        {
            Visible = false;
        }
        modify("FA Classes")
        {
            Visible = false;
        }
        modify("FA Subclasses")
        {
            Visible = false;
        }
        modify("FA Locations")
        {
            Visible = false;
        }
        modify(Posting)
        {
            Visible = false;
        }
        modify("FA Posting Type Setup")
        {
            Visible = false;
        }
        modify("FA Posting Groups")
        {
            Visible = false;
        }
        modify("FA Journal Templates")
        {
            Visible = false;
        }
        modify("FA Reclass. Journal Templates")
        {
            Visible = false;
        }
    }

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (AdditionalSearchTermsML).


    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
