#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185620 pageextension52185620 extends "Ship-to Address List" 
{
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
        modify(Address)
        {
            ApplicationArea = Basic;
        }
        modify("Address 2")
        {
            ApplicationArea = Basic;
        }
        modify("Post Code")
        {
            ApplicationArea = Basic;
        }
        modify(City)
        {
            ApplicationArea = Basic;
        }
        modify("Country/Region Code")
        {
            ApplicationArea = Basic;
        }
        modify("Phone No.")
        {
            ApplicationArea = Basic;
        }
        modify("Fax No.")
        {
            ApplicationArea = Basic;
        }
        modify(Contact)
        {
            ApplicationArea = Basic;
        }
        modify("Location Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Location Code"(Control 23)".

        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Code(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Name(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Address(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Address 2"(Control 27)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post Code"(Control 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on "City(Control 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Country/Region Code"(Control 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Phone No."(Control 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Fax No."(Control 19)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Contact(Control 21)".

        modify(GLN)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Location Code"(Control 23)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify("Online Map")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Online Map"(Action 1102601000)".

    }
}
