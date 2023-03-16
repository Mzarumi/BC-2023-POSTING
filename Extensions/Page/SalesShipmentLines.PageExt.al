#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186578 pageextension52186578 extends "Sales Shipment Lines" 
{
    layout
    {
        modify("Document No.")
        {
            ApplicationArea = Basic;
            HideValue = "Document No.HideValue";
        }
        modify("Sell-to Customer No.")
        {
            ApplicationArea = Basic;
        }
        modify("Bill-to Customer No.")
        {
            ApplicationArea = Basic;
        }
        modify(Type)
        {
            ApplicationArea = Basic;
        }
        modify("No.")
        {
            ApplicationArea = Basic;
        }
        modify("Variant Code")
        {
            ApplicationArea = Basic;
        }
        modify(Description)
        {
            ApplicationArea = Basic;
        }
        modify("Shortcut Dimension 1 Code")
        {
            ApplicationArea = Basic;
        }
        modify("Shortcut Dimension 2 Code")
        {
            ApplicationArea = Basic;
        }
        modify("Location Code")
        {
            ApplicationArea = Basic;
        }
        modify(Quantity)
        {
            ApplicationArea = Basic;
        }
        modify("Unit of Measure Code")
        {
            ApplicationArea = Basic;
        }
        modify("Unit of Measure")
        {
            ApplicationArea = Basic;
        }
        modify("Appl.-to Item Entry")
        {
            ApplicationArea = Basic;
        }
        modify("Job No.")
        {
            ApplicationArea = Basic;
        }
        modify("Shipment Date")
        {
            ApplicationArea = Basic;
        }
        modify("Quantity Invoiced")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Document No."(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sell-to Customer No."(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bill-to Customer No."(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Type(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Variant Code"(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shortcut Dimension 1 Code"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shortcut Dimension 2 Code"(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Location Code"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Quantity(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit of Measure Code"(Control 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit of Measure"(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Appl.-to Item Entry"(Control 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job No."(Control 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shipment Date"(Control 40)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Quantity Invoiced"(Control 45)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify("Show Document")
        {
            ApplicationArea = Basic;
        }
        modify(Dimensions)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Show Document"(Action 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 49)".

    }
    var
        [InDataSet]
        "Document No.HideValue": Boolean;


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DocumentNoHideValue := FALSE;
        DocumentNoOnFormat;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        "Document No.HideValue" := FALSE;
        DocumentNoOnFormat;
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF AssignmentType = AssignmentType::Sale THEN BEGIN
          SETCURRENTKEY("Sell-to Customer No.");
          SETRANGE("Sell-to Customer No.",SellToCustomerNo);
        END;
        FILTERGROUP(2);
        SetFilters;
        FILTERGROUP(0);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
        SETRANGE(Type,Type::Item);
        SETFILTER(Quantity,'<>0');
        SETRANGE(Correction,FALSE);
        SETRANGE("Job No.",'');
        FILTERGROUP(0);
        */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "InitializeSales(PROCEDURE 1)".


    //Unsupported feature: Property Deletion (Attributes) on "InitializePurchase(PROCEDURE 4)".



    //Unsupported feature: Code Modification on "IsFirstLine(PROCEDURE 2)".

    //procedure IsFirstLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TempSalesShptLine.RESET;
        TempSalesShptLine.COPYFILTERS(Rec);
        TempSalesShptLine.SETRANGE("Document No.",DocNo);
        IF NOT TempSalesShptLine.FINDFIRST THEN BEGIN
          SalesShptLine.COPYFILTERS(Rec);
          SalesShptLine.SETRANGE("Document No.",DocNo);
          IF SalesShptLine.FINDFIRST THEN BEGIN
            TempSalesShptLine := SalesShptLine;
            TempSalesShptLine.INSERT;
          END;
        END;
        IF TempSalesShptLine."Line No." = LineNo THEN
          EXIT(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6
          SalesShptLine.FINDFIRST;
          TempSalesShptLine := SalesShptLine;
          TempSalesShptLine.INSERT;
        #11..13
        */
    //end;


    //Unsupported feature: Code Modification on "DocumentNoOnFormat(PROCEDURE 19001080)".

    //procedure DocumentNoOnFormat();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF NOT IsFirstLine("Document No.","Line No.") THEN
          DocumentNoHideValue := TRUE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF NOT IsFirstLine("Document No.","Line No.") THEN
          "Document No.HideValue" := TRUE;
        */
    //end;
}