#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187099 pageextension52187099 extends "G/L Balance by Dim. Matrix" 
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
        modify(TotalAmount)
        {
            ApplicationArea = Basic;
        }
        modify(Field1)
        {
            ApplicationArea = Basic;
        }
        modify(Field2)
        {
            ApplicationArea = Basic;
        }
        modify(Field3)
        {
            ApplicationArea = Basic;
        }
        modify(Field4)
        {
            ApplicationArea = Basic;
        }
        modify(Field5)
        {
            ApplicationArea = Basic;
        }
        modify(Field6)
        {
            ApplicationArea = Basic;
        }
        modify(Field7)
        {
            ApplicationArea = Basic;
        }
        modify(Field8)
        {
            ApplicationArea = Basic;
        }
        modify(Field9)
        {
            ApplicationArea = Basic;
        }
        modify(Field10)
        {
            ApplicationArea = Basic;
        }
        modify(Field11)
        {
            ApplicationArea = Basic;
        }
        modify(Field12)
        {
            ApplicationArea = Basic;
        }
        modify(Field13)
        {
            ApplicationArea = Basic;
        }
        modify(Field14)
        {
            ApplicationArea = Basic;
        }
        modify(Field15)
        {
            ApplicationArea = Basic;
        }
        modify(Field16)
        {
            ApplicationArea = Basic;
        }
        modify(Field17)
        {
            ApplicationArea = Basic;
        }
        modify(Field18)
        {
            ApplicationArea = Basic;
        }
        modify(Field19)
        {
            ApplicationArea = Basic;
        }
        modify(Field20)
        {
            ApplicationArea = Basic;
        }
        modify(Field21)
        {
            ApplicationArea = Basic;
        }
        modify(Field22)
        {
            ApplicationArea = Basic;
        }
        modify(Field23)
        {
            ApplicationArea = Basic;
        }
        modify(Field24)
        {
            ApplicationArea = Basic;
        }
        modify(Field25)
        {
            ApplicationArea = Basic;
        }
        modify(Field26)
        {
            ApplicationArea = Basic;
        }
        modify(Field27)
        {
            ApplicationArea = Basic;
        }
        modify(Field28)
        {
            ApplicationArea = Basic;
        }
        modify(Field29)
        {
            ApplicationArea = Basic;
        }
        modify(Field30)
        {
            ApplicationArea = Basic;
        }
        modify(Field31)
        {
            ApplicationArea = Basic;
        }
        modify(Field32)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Code(Control 120)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Name(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on "TotalAmount(Control 24)".

    }

    //Unsupported feature: Property Modification (Id) on "MatrixRecord(Variable 1005)".

    //var
        //>>>> ORIGINAL VALUE:
        //MatrixRecord : 1005;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //MatrixRecord : 1217;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (Data type) on "GLAccFilter(Variable 1208)".

    //var
        //>>>> ORIGINAL VALUE:
        //GLAccFilter : Text;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //GLAccFilter : Code;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (Data type) on "BudgetFilter(Variable 1209)".

    //var
        //>>>> ORIGINAL VALUE:
        //BudgetFilter : Text;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //BudgetFilter : Code;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (Data type) on "BusUnitFilter(Variable 1210)".

    //var
        //>>>> ORIGINAL VALUE:
        //BusUnitFilter : Text;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //BusUnitFilter : Code;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (Data type) on "GlobalDim1Filter(Variable 1211)".

    //var
        //>>>> ORIGINAL VALUE:
        //GlobalDim1Filter : Text;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //GlobalDim1Filter : Code;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (Data type) on "GlobalDim2Filter(Variable 1212)".

    //var
        //>>>> ORIGINAL VALUE:
        //GlobalDim2Filter : Text;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //GlobalDim2Filter : Code;
        //Variable type has not been exported.

    var
        ShowColumnName: Boolean;

    var
        MatrixHeader: Text[50];

    //Unsupported feature: Variable Insertion (Variable: DimValList) (VariableCollection) on "LookUpCode(PROCEDURE 1252)".



    //Unsupported feature: Code Modification on "LookUpCode(PROCEDURE 1252)".

    //procedure LookUpCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE DimOption OF
          DimOption::"G/L Account":
            BEGIN
        #4..14
            BEGIN
              DimVal.SETRANGE("Dimension Code",DimCode);
              DimVal.GET(DimCode,Code);

              PAGE.RUNMODAL(PAGE::"Dimension Value List",DimVal);
            END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..17
              DimValList.SETTABLEVIEW(DimVal);
              DimValList.SETRECORD(DimVal);
              DimValList.RUNMODAL;
            END;
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "SetCommonFilters(PROCEDURE 1260)".

    //procedure SetCommonFilters();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(TheGLAcc);
        WITH TheGLAcc DO BEGIN
          IF DateFilter = '' THEN
        #4..17
          ELSE
            SETRANGE("No.");
          IF GLAccFilter <> '' THEN
            Totaling := COPYSTR(GLAccFilter,1,MAXSTRLEN(Totaling))
          ELSE
            IF "No." = '' THEN
              Totaling := STRSUBSTNO('>%1','''''');
        #25..33
          ELSE
            SETFILTER("Budget Filter",BudgetFilter);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..20
            Totaling := GLAccFilter
        #22..36
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: MATRIX_CurrentColumnOrdinal) (VariableCollection) on ""MATRIX_UpdateMatrixRecord"(PROCEDURE 1279)".



    //Unsupported feature: Code Modification on ""MATRIX_UpdateMatrixRecord"(PROCEDURE 1279)".

    //procedure "MATRIX_UpdateMatrixRecord"();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        MATRIX_ColumnOrdinal := MATRIX_NewColumnOrdinal;
        MatrixRecord.SETPOSITION(MATRIX_PrimKeyFirstCol);
        MATRIX_OnFindRecord('=');
        IF MATRIX_ColumnOrdinal <> 1 THEN
          MATRIX_OnNextRecord(MATRIX_ColumnOrdinal - 1);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        MATRIX_CurrentColumnOrdinal := 1;
        IF MATRIX_ColumnOrdinal <> 1 THEN
          MATRIX_OnNextRecord(MATRIX_ColumnOrdinal - 1);
        */
    //end;


    //Unsupported feature: Code Modification on ""MATRIX_OnAfterGetRecord"(PROCEDURE 1283)".

    //procedure "MATRIX_OnAfterGetRecord"();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        MatrixAmount := MatrixMgt.RoundValue(CalcAmount(TRUE),RoundingFactor);

        MATRIX_CellData[MATRIX_ColumnOrdinal] := MatrixAmount;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF ShowColumnName THEN
          MatrixHeader := MatrixRecord.Name
        ELSE
          MatrixHeader := MatrixRecord.Code;
        #1..3
        */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "Load(PROCEDURE 1)".


    //Unsupported feature: Property Deletion (Attributes) on "SetColumnVisibility(PROCEDURE 2)".



    //Unsupported feature: Code Modification on ""MATRIX_GenerateColumnCaptions"(PROCEDURE 7)".

    //procedure "MATRIX_GenerateColumnCaptions"();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        MATRIX_CurrSetLength := 0;
        CLEAR(MATRIX_ColumnCaptions);

        #4..15
        IF Found THEN BEGIN
          REPEAT
            MATRIX_CurrSetLength := MATRIX_CurrSetLength + 1;
            MATRIX_ColumnCaptions[MATRIX_CurrSetLength] := DimCodeBuffer.Code;
          UNTIL (MATRIX_CurrSetLength = MATRIX_NoOfMatrixColumns) OR (NextRec(ColumnDimOption,DimCodeBuffer,1) <> 1);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..18
            IF ShowColumnName THEN
              MATRIX_ColumnCaptions[MATRIX_CurrSetLength] := DimCodeBuffer.Name
            ELSE
              MATRIX_ColumnCaptions[MATRIX_CurrSetLength] := DimCodeBuffer.Code;
          UNTIL (MATRIX_CurrSetLength = MATRIX_NoOfMatrixColumns) OR (NextRec(ColumnDimOption,DimCodeBuffer,1) <> 1);
        END;
        */
    //end;

    //Unsupported feature: Property Insertion (Length) on "SetCommonFilters(PROCEDURE 1260).DateFilter2(Variable 1261)".


    //Unsupported feature: Property Modification (Id) on "SetDimFilters(PROCEDURE 1262).DimCodeBuf(Variable 1002)".


    //Unsupported feature: Move on "SetDimFilters(PROCEDURE 1262).DimOption(Variable 1263)".


    //Unsupported feature: Property Insertion (Length) on "Load(PROCEDURE 1).NewDateFilter(Parameter 1003)".


    //Unsupported feature: Property Modification (Data type) on "Load(PROCEDURE 1).NewGLAccFilter(Parameter 1004)".


    //Unsupported feature: Property Insertion (Length) on "Load(PROCEDURE 1).NewGLAccFilter(Parameter 1004)".


    //Unsupported feature: Property Modification (Data type) on "Load(PROCEDURE 1).NewBusUnitFilter(Parameter 1017)".


    //Unsupported feature: Property Insertion (Length) on "Load(PROCEDURE 1).NewBusUnitFilter(Parameter 1017)".


    //Unsupported feature: Property Modification (Data type) on "Load(PROCEDURE 1).NewBudgetFilter(Parameter 1005)".


    //Unsupported feature: Property Insertion (Length) on "Load(PROCEDURE 1).NewBudgetFilter(Parameter 1005)".


    //Unsupported feature: Property Modification (Data type) on "Load(PROCEDURE 1).NewGlobalDim1Filter(Parameter 1006)".


    //Unsupported feature: Property Insertion (Length) on "Load(PROCEDURE 1).NewGlobalDim1Filter(Parameter 1006)".


    //Unsupported feature: Property Modification (Data type) on "Load(PROCEDURE 1).NewGlobalDim2Filter(Parameter 1007)".


    //Unsupported feature: Property Insertion (Length) on "Load(PROCEDURE 1).NewGlobalDim2Filter(Parameter 1007)".

}
