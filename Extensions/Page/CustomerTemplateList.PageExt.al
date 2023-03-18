#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186336 pageextension52186336 extends "Customer Template List" 
{
    Caption = 'Customer Template List';
    layout
    {
        modify("Code")
        {
            ApplicationArea = Basic;
        }
        modify(Description)
        {
            ApplicationArea = Basic;
        }
        modify("Country/Region Code")
        {
            ApplicationArea = Basic;
        }
        modify("Territory Code")
        {
            ApplicationArea = Basic;
        }
        modify("Currency Code")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Code(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 4)".

        modify("Contact Type")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Country/Region Code"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Territory Code"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 10)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify("&Contact Conversion Template")
        {
            Caption = '&Customer Template';

            //Unsupported feature: Property Modification (Name) on ""&Contact Conversion Template"(Action 15)".

        }
        modify("Dimensions-Single")
        {
            ApplicationArea = Basic;
        }
        modify("Dimensions-&Multiple")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Dimensions-Single"(Action 19)".


        //Unsupported feature: Code Modification on ""Dimensions-&Multiple"(Action 20).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CurrPage.SETSELECTIONFILTER(CustTemplate);
            DefaultDimMultiple.SetMultiRecord(CustTemplate,FIELDNO(Code));
            DefaultDimMultiple.RUNMODAL;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CurrPage.SETSELECTIONFILTER(CustTemplate);
            DefaultDimMultiple.SetMultiCustTemplate(CustTemplate);
            DefaultDimMultiple.RUNMODAL;
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Dimensions-&Multiple"(Action 20)".

    }

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (AdditionalSearchTermsML).

}
