#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186758 pageextension52186758 extends "Countries/Regions" 
{

    //Unsupported feature: Property Insertion (Permissions) on ""Countries/Regions"(Page 10)".

    layout
    {
        modify("Code")
        {
            ApplicationArea = Basic;
        }
        modify(Name)
        {
            ApplicationArea = Basic;
        }
        modify("Address Format")
        {
            ApplicationArea = Basic;
        }
        modify("Contact Address Format")
        {
            ApplicationArea = Basic;
        }
        modify("EU Country/Region Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""EU Country/Region Code"(Control 11)".

        }
        modify("Intrastat Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Intrastat Code"(Control 13)".

        }
        modify("VAT Scheme")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Code(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Name(Control 4)".

        modify("ISO Code")
        {
            Visible = false;
        }
        modify("ISO Numeric Code")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Address Format"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Contact Address Format"(Control 15)".

        modify("County Name")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""EU Country/Region Code"(Control 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Intrastat Code"(Control 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Scheme"(Control 3)".

        modify(Control8)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter("VAT Scheme")
        {
            field("County Phone Code";Rec."County Phone Code")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        modify("VAT Reg. No. Formats")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Reg. No. Formats"(Action 18)".

        modify(CustomAddressFormat)
        {
            Visible = false;
        }
    }

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).

}
