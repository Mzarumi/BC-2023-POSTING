#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186107 pageextension52186107 extends "Chart of Cost Centers" 
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
        modify("Line Type")
        {
            ApplicationArea = Basic;
        }
        modify(Totaling)
        {
            ApplicationArea = Basic;
        }
        modify("Sorting Order")
        {
            ApplicationArea = Basic;
        }
        modify("Net Change")
        {
            ApplicationArea = Basic;
        }
        modify("Balance at Date")
        {
            ApplicationArea = Basic;
        }
        modify("Balance to Allocate")
        {
            ApplicationArea = Basic;
        }
        modify("Cost Subtype")
        {
            ApplicationArea = Basic;
        }
        modify("Responsible Person")
        {
            ApplicationArea = Basic;
        }
        modify(Blocked)
        {
            ApplicationArea = Basic;
        }
        modify("New Page")
        {
            ApplicationArea = Basic;
        }
        modify("Blank Line")
        {
            ApplicationArea = Basic;
        }
        modify(Comment)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Code(Control 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Name(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Line Type"(Control 19)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Totaling(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sorting Order"(Control 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Net Change"(Control 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Balance at Date"(Control 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Balance to Allocate"(Control 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Cost Subtype"(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Responsible Person"(Control 27)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Blocked(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""New Page"(Control 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Blank Line"(Control 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Comment(Control 31)".

    }
    actions
    {
        modify("Cost E&ntries")
        {
            ApplicationArea = Basic;
        }
        modify("&Balance")
        {
            ApplicationArea = Basic;
        }
        modify("I&ndent Cost Centers")
        {
            ApplicationArea = Basic;
        }
        modify("Get Cost Centers From Dimension")
        {
            ApplicationArea = Basic;
        }
        modify(PageDimensionValues)
        {

            //Unsupported feature: Property Modification (Name) on "PageDimensionValues(Action 11)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (AccessByPermission) on "PageDimensionValues(Action 11)".

        }
        modify("Cost Center with Budget")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Cost E&ntries"(Action 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Balance"(Action 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""I&ndent Cost Centers"(Action 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Get Cost Centers From Dimension"(Action 9)".


        //Unsupported feature: Property Deletion (Promoted) on ""Get Cost Centers From Dimension"(Action 9)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Get Cost Centers From Dimension"(Action 9)".


        //Unsupported feature: Code Insertion (VariableCollection) on ""Dimension Values"(Action 11).OnAction".

        //trigger (Variable: DimValue)()
        //Parameters and return type have not been exported.
        //begin
            /*
            */
        //end;


        //Unsupported feature: Code Modification on "PageDimensionValues(Action 11).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CostAccMgt.OpenDimValueListFiltered(CostAccSetup.FIELDNO("Cost Center Dimension"));
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CostAccSetup.GET;
            DimValue.SETRANGE("Dimension Code",CostAccSetup."Cost Center Dimension");
            PAGE.RUN(0,DimValue);
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "PageDimensionValues(Action 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Cost Center with Budget"(Action 14)".

    }

    var
        DimValue: Record "Dimension Value";

    //Unsupported feature: Property Deletion (Attributes) on "GetSelectionFilter(PROCEDURE 6)".


    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (AdditionalSearchTermsML).

}
