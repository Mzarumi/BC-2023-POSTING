#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186551 pageextension52186551 extends "Whse. Put-away Subform" 
{
    layout
    {
        modify("Action Type")
        {
            ApplicationArea = Basic;
        }
        modify("Source Document")
        {
            ApplicationArea = Basic;
        }
        modify("Source No.")
        {
            ApplicationArea = Basic;
        }
        modify("Item No.")
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
        modify("Serial No.")
        {
            ApplicationArea = Basic;
        }
        modify("Lot No.")
        {
            ApplicationArea = Basic;
        }
        modify("Expiration Date")
        {
            ApplicationArea = Basic;
        }
        modify("Location Code")
        {
            ApplicationArea = Basic;
        }
        modify("Zone Code")
        {
            ApplicationArea = Basic;
            Editable = "Zone CodeEditable";
        }
        modify("Bin Code")
        {
            ApplicationArea = Basic;
            Editable = "Bin CodeEditable";
        }
        modify("Shelf No.")
        {
            ApplicationArea = Basic;
        }
        modify(Quantity)
        {
            ApplicationArea = Basic;
        }
        modify("Qty. (Base)")
        {
            ApplicationArea = Basic;
        }
        modify("Qty. to Handle")
        {
            ApplicationArea = Basic;
            Editable = "Qty. to HandleEditable";
        }
        modify("Qty. Handled")
        {
            ApplicationArea = Basic;
        }
        modify("Qty. to Handle (Base)")
        {
            ApplicationArea = Basic;
        }
        modify("Qty. Handled (Base)")
        {
            ApplicationArea = Basic;
        }
        modify("Qty. Outstanding")
        {
            ApplicationArea = Basic;
        }
        modify("Qty. Outstanding (Base)")
        {
            ApplicationArea = Basic;
        }
        modify("Due Date")
        {
            ApplicationArea = Basic;
        }
        modify("Unit of Measure Code")
        {
            ApplicationArea = Basic;
        }
        modify("Qty. per Unit of Measure")
        {
            ApplicationArea = Basic;
        }
        modify("Destination Type")
        {
            ApplicationArea = Basic;
        }
        modify("Destination No.")
        {
            ApplicationArea = Basic;
        }
        modify("Whse. Document Type")
        {
            ApplicationArea = Basic;
        }
        modify("Whse. Document No.")
        {
            ApplicationArea = Basic;
        }
        modify("Whse. Document Line No.")
        {
            ApplicationArea = Basic;
        }
        modify("Special Equipment Code")
        {
            ApplicationArea = Basic;
        }
        modify("Cross-Dock Information")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Action Type"(Control 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Source Document"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Source No."(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item No."(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Variant Code"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Serial No."(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Lot No."(Control 40)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Expiration Date"(Control 1106000000)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Location Code"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Zone Code"(Control 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bin Code"(Control 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shelf No."(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Quantity(Control 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Qty. (Base)"(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Qty. to Handle"(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Qty. Handled"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Qty. to Handle (Base)"(Control 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Qty. Handled (Base)"(Control 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Qty. Outstanding"(Control 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Qty. Outstanding (Base)"(Control 44)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Due Date"(Control 62)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Unit of Measure Code"(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Qty. per Unit of Measure"(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Destination Type"(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Destination No."(Control 56)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Whse. Document Type"(Control 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Whse. Document No."(Control 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Whse. Document Line No."(Control 52)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Special Equipment Code"(Control 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Cross-Dock Information"(Control 58)".

    }
    actions
    {
        modify(SplitWhseActivityLine)
        {

            //Unsupported feature: Property Modification (Name) on "SplitWhseActivityLine(Action 1901991804)".

            ApplicationArea = Basic;
        }
        modify(ChangeUnitOfMeasure)
        {
            ApplicationArea = Basic;
        }
        modify("Source Document Line")
        {
            ApplicationArea = Basic;
        }
        modify("Whse. Document Line")
        {
            ApplicationArea = Basic;
        }
        modify("Bin Contents List")
        {
            ApplicationArea = Basic;
        }
        modify("Event")
        {
            ApplicationArea = Basic;
        }
        modify(Period)
        {
            ApplicationArea = Basic;
        }
        modify(Variant)
        {
            ApplicationArea = Basic;
        }
        modify(Location)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Code Modification on "SplitWhseActivityLine(Action 1901991804).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            WhseActivLine.COPY(Rec);
            SplitLine(WhseActivLine);
            COPY(WhseActivLine);
            CurrPage.UPDATE(FALSE);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            WhseActivLine.COPY(Rec);
            SplitLine(WhseActivLine);
            CurrPage.UPDATE(FALSE);
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "SplitWhseActivityLine(Action 1901991804)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ChangeUnitOfMeasure(Action 1901313404)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Source Document Line"(Action 1902759804)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Whse. Document Line"(Action 1901652504)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bin Contents List"(Action 1900545304)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Event(Action 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Period(Action 1901313504)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Variant(Action 1900295904)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Location(Action 1901742304)".

    }

    var
        [InDataSet]
        "Zone CodeEditable": Boolean;
        [InDataSet]
        "Bin CodeEditable": Boolean;
        [InDataSet]
        "Qty. to HandleEditable": Boolean;


    //Unsupported feature: Code Modification on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        QtyToHandleEditable := TRUE;
        BinCodeEditable := TRUE;
        ZoneCodeEditable := TRUE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        "Qty. to HandleEditable" := TRUE;
        "Bin CodeEditable" := TRUE;
        "Zone CodeEditable" := TRUE;
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: WhseRegisterPutAwayYesNo) (VariableCollection) on "RegisterPutAwayYesNo(PROCEDURE 3)".


    //Unsupported feature: Property Deletion (Attributes) on "RegisterPutAwayYesNo(PROCEDURE 3)".



    //Unsupported feature: Code Modification on "RegisterPutAwayYesNo(PROCEDURE 3)".

    //procedure RegisterPutAwayYesNo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WhseActivLine.COPY(Rec);
        WhseActivLine.FILTERGROUP(3);
        WhseActivLine.SETRANGE(Breakbulk);
        WhseActivLine.FILTERGROUP(0);
        CODEUNIT.RUN(CODEUNIT::"Whse.-Act.-Register (Yes/No)",WhseActivLine);
        RESET;
        SETCURRENTKEY("Activity Type","No.","Sorting Sequence No.");
        FILTERGROUP(4);
        #9..11
        SETRANGE(Breakbulk,FALSE);
        FILTERGROUP(0);
        CurrPage.UPDATE(FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
        WhseRegisterPutAwayYesNo.RUN(WhseActivLine);
        #6..14
        */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "AutofillQtyToHandle(PROCEDURE 10)".



    //Unsupported feature: Code Modification on "AutofillQtyToHandle(PROCEDURE 10)".

    //procedure AutofillQtyToHandle();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WhseActivLine.COPY(Rec);
        WhseActivLine.SETRANGE("Activity Type","Activity Type");
        WhseActivLine.SETRANGE("No.","No.");
        AutofillQtyToHandle(WhseActivLine);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        WhseActivLine.COPY(Rec);
        AutofillQtyToHandle(WhseActivLine);
        */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "DeleteQtyToHandle(PROCEDURE 6)".



    //Unsupported feature: Code Modification on "DeleteQtyToHandle(PROCEDURE 6)".

    //procedure DeleteQtyToHandle();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WhseActivLine.COPY(Rec);
        WhseActivLine.SETRANGE("Activity Type","Activity Type");
        WhseActivLine.SETRANGE("No.","No.");
        DeleteQtyToHandle(WhseActivLine);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        WhseActivLine.COPY(Rec);
        DeleteQtyToHandle(WhseActivLine);
        */
    //end;


    //Unsupported feature: Code Modification on "EnableZoneBin(PROCEDURE 4)".

    //procedure EnableZoneBin();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ZoneCodeEditable :=
          ("Action Type" = "Action Type"::Place) AND ("Breakbulk No." = 0);
        BinCodeEditable :=
          ("Action Type" = "Action Type"::Place) AND ("Breakbulk No." = 0);
        QtyToHandleEditable :=
          ("Action Type" = "Action Type"::Take) OR ("Breakbulk No." = 0);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        "Zone CodeEditable" :=
          ("Action Type" = "Action Type"::Place) AND ("Breakbulk No." = 0);
        "Bin CodeEditable" :=
          ("Action Type" = "Action Type"::Place) AND ("Breakbulk No." = 0);
        "Qty. to HandleEditable" :=
          ("Action Type" = "Action Type"::Take) OR ("Breakbulk No." = 0);
        */
    //end;

    //Unsupported feature: Property Modification (Id) on "SerialNoOnAfterValidate(PROCEDURE 19074494).ItemTrackingMgt(Variable 1000)".


    //Unsupported feature: Move on "SerialNoOnAfterValidate(PROCEDURE 19074494).ExpDate(Variable 1106000002)".


    //Unsupported feature: Property Modification (Id) on "LotNoOnAfterValidate(PROCEDURE 19045288).ItemTrackingMgt(Variable 1000)".


    //Unsupported feature: Move on "LotNoOnAfterValidate(PROCEDURE 19045288).ExpDate(Variable 1106000000)".

}
