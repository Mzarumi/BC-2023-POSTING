#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186403 pageextension52186403 extends "Outlook Synch. Fields" 
{
    layout
    {
        modify(Condition)
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
        modify("Table Relation")
        {
            ApplicationArea = Basic;
        }
        modify("Field No.")
        {
            ApplicationArea = Basic;
        }
        modify(GetFieldCaption)
        {
            ApplicationArea = Basic;
        }
        modify("Field Default Value")
        {
            ApplicationArea = Basic;
        }
        modify("User-Defined")
        {
            ApplicationArea = Basic;
            Editable = "User-DefinedEditable";
        }
        modify("Outlook Property")
        {
            ApplicationArea = Basic;
        }
        modify("Search Field")
        {
            ApplicationArea = Basic;
            Editable = "Search FieldEditable";
        }
        modify("Read-Only Status")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Condition(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Table No."(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Table Caption"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Table Relation"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Field No."(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on "GetFieldCaption(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Field Default Value"(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""User-Defined"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Outlook Property"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Search Field"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Read-Only Status"(Control 22)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify("Option Correlations")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Option Correlations"(Action 32)".

    }
    var
        [InDataSet]
        "Search FieldEditable": Boolean;
        [InDataSet]
        "User-DefinedEditable": Boolean;


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SearchFieldEditable := "Element No." <> 0;
        UserDefinedEditable := "Element No." = 0;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        "Search FieldEditable" := "Element No." <> 0;
        "User-DefinedEditable" := "Element No." = 0;
        */
    //end;


    //Unsupported feature: Code Modification on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        UserDefinedEditable := TRUE;
        SearchFieldEditable := TRUE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        "User-DefinedEditable" := TRUE;
        "Search FieldEditable" := TRUE;
        */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "GetFormCaption(PROCEDURE 2)".

}
