#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187169 pageextension52187169 extends "Budget Names Purchase" 
{
    Caption = 'Budget Names Purchase';
    layout
    {
        modify(Name)
        {
            ApplicationArea = Basic;
        }
        modify(Description)
        {
            ApplicationArea = Basic;
        }
        modify(Blocked)
        {
            ApplicationArea = Basic;
        }
        modify("Budget Dimension 1 Code")
        {
            ApplicationArea = Basic;
        }
        modify("Budget Dimension 2 Code")
        {
            ApplicationArea = Basic;
        }
        modify("Budget Dimension 3 Code")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Name(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Blocked(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Budget Dimension 1 Code"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Budget Dimension 2 Code"(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Budget Dimension 3 Code"(Control 12)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify(EditBudget)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "EditBudget(Action 17)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "EditBudget(Action 17)".

    }

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).

}
