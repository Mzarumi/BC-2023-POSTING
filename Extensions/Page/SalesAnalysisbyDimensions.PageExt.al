#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186826 pageextension52186826 extends "Sales Analysis by Dimensions" 
{
    layout
    {
        modify(CurrentItemAnalysisViewCode)
        {
            ApplicationArea = Basic;
        }
        modify(LineDimCode)
        {
            ApplicationArea = Basic;
        }
        modify(ColumnDimCode)
        {
            ApplicationArea = Basic;
        }
        modify(ValueType)
        {
            ApplicationArea = Basic;
        }
        modify(DateFilter)
        {
            ApplicationArea = Basic;
        }
        modify(ItemFilter)
        {
            ApplicationArea = Basic;
        }
        modify(LocationFilter)
        {
            ApplicationArea = Basic;
        }
        modify(BudgetFilter)
        {
            ApplicationArea = Basic;
        }
        modify(Dim1FilterControl)
        {
            ApplicationArea = Basic;
        }
        modify(Dim2FilterControl)
        {
            ApplicationArea = Basic;
        }
        modify(Dim3FilterControl)
        {
            ApplicationArea = Basic;
        }
        modify(ShowActualBudget)
        {
            ApplicationArea = Basic;
        }
        modify(RoundingFactor)
        {
            ApplicationArea = Basic;
        }
        modify(ShowColumnName)
        {
            ApplicationArea = Basic;
        }
        modify(ShowOppositeSign)
        {
            ApplicationArea = Basic;
        }
        modify(PeriodType)
        {
            ApplicationArea = Basic;
        }
        modify(ColumnSet)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Code Modification on "CurrentItemAnalysisViewCode(Control 5).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ItemAnalysisMgt.CheckAnalysisView(CurrentAnalysisArea,CurrentItemAnalysisViewCode,ItemAnalysisView);
            CurrentItemAnalysisViewCodeOnA;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            AVBreakdownBuffer.DELETEALL;
            ItemAnalysisMgt.CheckAnalysisView(CurrentAnalysisArea,CurrentItemAnalysisViewCode,ItemAnalysisView);
            CurrentItemAnalysisViewCodeOnA;
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "CurrentItemAnalysisViewCode(Control 5)".



        //Unsupported feature: Code Modification on "LineDimCode(Control 6).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF (UPPERCASE(LineDimCode) = UPPERCASE(ColumnDimCode)) AND (LineDimCode <> '') THEN BEGIN
              ColumnDimCode := '';
              ItemAnalysisMgt.ValidateColumnDimCode(
            #4..11
            ELSE
              SETCURRENTKEY(Code);
            LineDimCodeOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            AVBreakdownBuffer.DELETEALL;
            #1..14
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "LineDimCode(Control 6)".



        //Unsupported feature: Code Modification on "ColumnDimCode(Control 9).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF (UPPERCASE(LineDimCode) = UPPERCASE(ColumnDimCode)) AND (LineDimCode <> '') THEN BEGIN
              LineDimCode := '';
              ItemAnalysisMgt.ValidateLineDimCode(
            #4..8
              InternalDateFilter,DateFilter,ItemStatisticsBuffer,PeriodInitialized);
            MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
            ColumnDimCodeOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            AVBreakdownBuffer.DELETEALL;
            #1..11
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "ColumnDimCode(Control 9)".



        //Unsupported feature: Code Insertion on "ValueType(Control 47)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
            /*
            AVBreakdownBuffer.DELETEALL;
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "ValueType(Control 47)".



        //Unsupported feature: Code Insertion (VariableCollection) on "DateFilter(Control 25).OnValidate".

        //trigger (Variable: ApplicationManagement)()
        //Parameters and return type have not been exported.
        //begin
            /*
            */
        //end;


        //Unsupported feature: Code Modification on "DateFilter(Control 25).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TextManagement.MakeDateFilter(DateFilter);
            ItemStatisticsBuffer.SETFILTER("Date Filter",DateFilter);
            DateFilter := ItemStatisticsBuffer.GETFILTER("Date Filter");
            InternalDateFilter := DateFilter;
            MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
            DateFilterOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF ApplicationManagement.MakeDateFilter(DateFilter) = 0 THEN;
            #2..6
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "DateFilter(Control 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ItemFilter(Control 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on "LocationFilter(Control 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on "BudgetFilter(Control 17)".



        //Unsupported feature: Code Modification on "Dim1FilterControl(Control 34).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ItemStatisticsBuffer.SETFILTER("Dimension 1 Filter",Dim1Filter);
            MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
            Dim1FilterOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
            Dim1FilterOnAfterValidate;
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Dim1FilterControl(Control 34)".



        //Unsupported feature: Code Modification on "Dim2FilterControl(Control 30).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ItemStatisticsBuffer.SETFILTER("Dimension 2 Filter",Dim2Filter);
            MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
            Dim2FilterOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
            Dim2FilterOnAfterValidate;
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Dim2FilterControl(Control 30)".



        //Unsupported feature: Code Modification on "Dim3FilterControl(Control 46).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ItemStatisticsBuffer.SETFILTER("Dimension 3 Filter",Dim3Filter);
            MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
            Dim3FilterOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
            Dim3FilterOnAfterValidate;
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Dim3FilterControl(Control 46)".



        //Unsupported feature: Code Insertion on "ShowActualBudget(Control 32)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
            /*
            AVBreakdownBuffer.DELETEALL;
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "ShowActualBudget(Control 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on "RoundingFactor(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ShowColumnName(Control 4)".



        //Unsupported feature: Code Insertion on "ShowOppositeSign(Control 50)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
            /*
            AVBreakdownBuffer.DELETEALL;
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "ShowOppositeSign(Control 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PeriodType(Control 19)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ColumnSet(Control 20)".

    }
    actions
    {
        modify("Reverse Lines and Columns")
        {
            ApplicationArea = Basic;
        }
        modify("ShowMatrix_Process")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (PromotedIsBig) on ""ShowMatrix_Process"(Action 16)".

        }
        modify(PreviousSet)
        {
            ToolTip = 'Previous Set';
            ApplicationArea = Basic;
        }
        modify(NextSet)
        {
            ToolTip = 'Next Set';
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (PromotedIsBig) on "NextSet(Action 2)".

        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Reverse Lines and Columns"(Action 15)".


        //Unsupported feature: Property Deletion (Promoted) on ""Reverse Lines and Columns"(Action 15)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Reverse Lines and Columns"(Action 15)".



        //Unsupported feature: Code Modification on ""ShowMatrix_Process"(Action 16).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CLEAR(SalesAnalysisByDimMatrix);
            ShowMatrix;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CLEAR(SalesAnalysisByDimMatrix);
            CLEAR(DimCodeBufferColumn);
            ShowMatrix;
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""ShowMatrix_Process"(Action 16)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""ShowMatrix_Process"(Action 16)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "PreviousSet(Action 21)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "NextSet(Action 2)".

    }
    //Unsupported feature: Property Modification (Id) on ""MATRIX_PeriodRecords"(Variable 1003)".

    //var
        //>>>> ORIGINAL VALUE:
        //"MATRIX_PeriodRecords" : 1003;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //"MATRIX_PeriodRecords" : 1050;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (Length) on "MatrixColumnCaptions(Variable 1022)".

    //var
        //>>>> ORIGINAL VALUE:
        //MatrixColumnCaptions : 80;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //MatrixColumnCaptions : 1024;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (Length) on ""MATRIX_CodeRange"(Variable 1023)".

    //var
        //>>>> ORIGINAL VALUE:
        //"MATRIX_CodeRange" : 250;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //"MATRIX_CodeRange" : 100;
        //Variable type has not been exported.

    var
        AVBreakdownBuffer: Record "Dimension Code Amount Buffer" temporary;
        DimCodeBufferColumn: Record "Dimension Code Buffer";

    var
        Steps: Integer;

    var
        FirstColumn: Text[1024];
        LastColumn: Text[1024];


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CurrentAnalysisArea := CurrentAnalysisArea::Sales;

        GLSetup.GET;
        #4..7

        IF (NewItemAnalysisCode <> '') AND (NewItemAnalysisCode <> CurrentItemAnalysisViewCode) THEN BEGIN
          CurrentItemAnalysisViewCode := NewItemAnalysisCode;
          ItemAnalysisMgt.CheckAnalysisView(CurrentAnalysisArea,CurrentItemAnalysisViewCode,ItemAnalysisView);
          ItemAnalysisMgt.SetItemAnalysisView(
            CurrentAnalysisArea,CurrentItemAnalysisViewCode,ItemAnalysisView,ItemStatisticsBuffer,
        #14..21

        NoOfColumns := SalesAnalysisByDimMatrix.GetMatrixDimension;
        MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..10
          AVBreakdownBuffer.DELETEALL;
        #11..24
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: Item) (VariableCollection) on "FindPeriod(PROCEDURE 2)".


    //Unsupported feature: Variable Insertion (Variable: Calendar) (VariableCollection) on "FindPeriod(PROCEDURE 2)".



    //Unsupported feature: Code Modification on "FindPeriod(PROCEDURE 2)".

    //procedure FindPeriod();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        PeriodFormMgt.FindPeriodOnMatrixPage(
          DateFilter,InternalDateFilter,SearchText,PeriodType,
          (LineDimOption <> LineDimOption::Period) AND (ColumnDimOption <> ColumnDimOption::Period));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF DateFilter <> '' THEN BEGIN
          Calendar.SETFILTER("Period Start",DateFilter);
          IF NOT PeriodFormMgt.FindDate('+',Calendar,PeriodType) THEN
            PeriodFormMgt.FindDate('+',Calendar,PeriodType::Day);
          Calendar.SETRANGE("Period Start");
        END;
        PeriodFormMgt.FindDate(SearchText,Calendar,PeriodType);
        Item.SETRANGE("Date Filter",Calendar."Period Start",Calendar."Period End");
        IF Item.GETRANGEMIN("Date Filter") = Item.GETRANGEMAX("Date Filter") THEN
          Item.SETRANGE("Date Filter",Item.GETRANGEMIN("Date Filter"));
        InternalDateFilter := Item.GETFILTER("Date Filter");
        IF (LineDimOption <> LineDimOption::Period) AND (ColumnDimOption <> ColumnDimOption::Period) THEN
          DateFilter := InternalDateFilter;
        AVBreakdownBuffer.DELETEALL;
        */
    //end;


    //Unsupported feature: Code Modification on ""MATRIX_GenerateColumnCaptions"(PROCEDURE 5)".

    //procedure "MATRIX_GenerateColumnCaptions"();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE ColumnDimOption OF
          ColumnDimOption::Item:
            SetPointsItem(SetWanted);
          ColumnDimOption::Location:
            SetPointsLocation(SetWanted);
          ColumnDimOption::Period:
            BEGIN
              MatrixMgt.GeneratePeriodMatrixData(SetWanted,NoOfColumns,ShowColumnName,PeriodType,DateFilter,MATRIX_PKFirstRecInCurrSet,
                MatrixColumnCaptions,MATRIX_CaptionRange,MATRIX_CurrSetLength,MATRIX_PeriodRecords);
              IF MATRIX_CurrSetLength > 0 THEN BEGIN
                FirstColumnDate := MATRIX_PeriodRecords[1]."Period Start";
                LastColumnDate := MATRIX_PeriodRecords[MATRIX_CurrSetLength]."Period Start";
              END;
              RefreshInternalDateFilter;
            END;
        #16..19
          ColumnDimOption::"Dimension 3":
            SetPointsDim(ItemAnalysisView."Dimension 3 Code",Dim3Filter,SetWanted);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
              FirstColumn := '';
              LastColumn := '';
        #8..12
                FirstColumn := MatrixColumnCaptions[1];
                LastColumn := FORMAT(MATRIX_PeriodRecords[MATRIX_CurrSetLength]."Period End");
        #13..22
        */
    //end;


    //Unsupported feature: Code Modification on "SetPointsItem(PROCEDURE 22)".

    //procedure SetPointsItem();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(MatrixColumnCaptions);
        Item.SETFILTER("No.",ItemFilter);
        RecRef.GETTABLE(Item);
        RecRef.SETTABLE(Item);

        IF ShowColumnName THEN
          CaptionFieldNo := Item.FIELDNO(Description)
        ELSE
          CaptionFieldNo := Item.FIELDNO("No.");

        MatrixMgt.GenerateMatrixData(RecRef,SetWanted,NoOfColumns,CaptionFieldNo,MATRIX_PKFirstRecInCurrSet,MatrixColumnCaptions,
          MATRIX_CaptionRange,MATRIX_CurrSetLength);
        MATRIX_CodeRange :=
          MatrixMgt.GetPKRange(RecRef,Item.FIELDNO("No."),MATRIX_PKFirstRecInCurrSet,MATRIX_CurrSetLength);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CLEAR(MatrixColumnCaptions);
        FirstColumn := '';
        LastColumn := '';
        #2..4
        #6..12

        IF ShowColumnName THEN
          MATRIX_CodeRange :=
            MatrixMgt.GetPKRange(RecRef,Item.FIELDNO("No."),MATRIX_PKFirstRecInCurrSet,MATRIX_CurrSetLength);

        IF MATRIX_CurrSetLength > 0 THEN BEGIN
          FirstColumn := MatrixColumnCaptions[1];
          LastColumn := MatrixColumnCaptions[MATRIX_CurrSetLength];
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "SetPointsLocation(PROCEDURE 6)".

    //procedure SetPointsLocation();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(MatrixColumnCaptions);
        Location.SETFILTER(Code,LocationFilter);
        RecRef.GETTABLE(Location);
        RecRef.SETTABLE(Location);

        IF ShowColumnName THEN
          CaptionFieldNo := Location.FIELDNO(Name)
        ELSE
          CaptionFieldNo := Location.FIELDNO(Code);

        MatrixMgt.GenerateMatrixData(RecRef,SetWanted,NoOfColumns,CaptionFieldNo,MATRIX_PKFirstRecInCurrSet,MatrixColumnCaptions,
          MATRIX_CaptionRange,MATRIX_CurrSetLength);
        MATRIX_CodeRange :=
          MatrixMgt.GetPKRange(RecRef,Location.FIELDNO(Code),MATRIX_PKFirstRecInCurrSet,MATRIX_CurrSetLength)
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CLEAR(MatrixColumnCaptions);
        FirstColumn := '';
        LastColumn := '';
        #2..4
        #6..12

        IF ShowColumnName THEN
          MATRIX_CodeRange :=
            MatrixMgt.GetPKRange(RecRef,Location.FIELDNO(Code),MATRIX_PKFirstRecInCurrSet,MATRIX_CurrSetLength);

        IF MATRIX_CurrSetLength > 0 THEN BEGIN
          FirstColumn := MatrixColumnCaptions[1];
          LastColumn := MatrixColumnCaptions[MATRIX_CurrSetLength];
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "SetPointsDim(PROCEDURE 17)".

    //procedure SetPointsDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(MatrixColumnCaptions);
        DimVal.SETRANGE("Dimension Code",DimensionCode);
        IF DimFilter <> '' THEN
          DimVal.SETFILTER(Code,DimFilter);
        #5..9
        ELSE
          CaptionFieldNo := DimVal.FIELDNO(Code);

        MatrixMgt.GenerateMatrixData(RecRef,SetWanted,NoOfColumns,CaptionFieldNo,MATRIX_PKFirstRecInCurrSet,MatrixColumnCaptions,
          MATRIX_CaptionRange,MATRIX_CurrSetLength);
        IF DimensionCode <> '' THEN
          MATRIX_CodeRange :=
            MatrixMgt.GetPKRange(RecRef,DimVal.FIELDNO(Code),MATRIX_PKFirstRecInCurrSet,MATRIX_CurrSetLength);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CLEAR(MatrixColumnCaptions);
        FirstColumn := '';
        LastColumn := '';
        #2..12
        IF ShowColumnName THEN BEGIN
          MatrixMgt.GenerateMatrixData(RecRef,SetWanted,NoOfColumns,DimVal.FIELDNO(Code),MATRIX_PKFirstRecInCurrSet,MatrixColumnCaptions,
            MATRIX_CaptionRange,MATRIX_CurrSetLength);
          MATRIX_CodeRange :=
            MatrixMgt.GetPKRange(RecRef,DimVal.FIELDNO(Code),MATRIX_PKFirstRecInCurrSet,MATRIX_CurrSetLength);
        END;

        MatrixMgt.GenerateMatrixData(RecRef,SetWanted,NoOfColumns,CaptionFieldNo,MATRIX_PKFirstRecInCurrSet,MatrixColumnCaptions,
          MATRIX_CaptionRange,MATRIX_CurrSetLength);

        IF MATRIX_CurrSetLength > 0 THEN BEGIN
          FirstColumn := MatrixColumnCaptions[1];
          LastColumn := MatrixColumnCaptions[MATRIX_CurrSetLength];
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "ShowMatrix(PROCEDURE 10)".

    //procedure ShowMatrix();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        PeriodInitialized := ColumnDimOption = ColumnDimOption::Period;
        IF CurItemFilter = '' THEN
          CurItemFilter := ItemFilter;
        IF CurLocationFilter = '' THEN
        #5..9
        IF CurDim3Filter = '' THEN
          CurDim3Filter := Dim3Filter;

        SalesAnalysisByDimMatrix.LoadVariables(ItemAnalysisView,
          CurrentItemAnalysisViewCode,CurrentAnalysisArea,
          LineDimOption,ColumnDimOption,PeriodType,ValueType,
          RoundingFactor,ShowActualBudget,MatrixColumnCaptions,
          ShowOppositeSign,PeriodInitialized,ShowColumnName,MATRIX_CurrSetLength);
        SalesAnalysisByDimMatrix.LoadFilters(CurItemFilter,CurLocationFilter,CurDim1Filter,CurDim2Filter,CurDim3Filter,
          DateFilter,BudgetFilter,InternalDateFilter);
        SalesAnalysisByDimMatrix.LoadCodeRange(MATRIX_CodeRange);

        SalesAnalysisByDimMatrix.RUNMODAL;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CASE ColumnDimOption OF
          ColumnDimOption::Item:
            CurItemFilter := MATRIX_CodeRange;
          ColumnDimOption::Location:
            CurLocationFilter := MATRIX_CodeRange;
          ColumnDimOption::"Dimension 1":
            CurDim1Filter := MATRIX_CodeRange;
          ColumnDimOption::"Dimension 2":
            CurDim2Filter := MATRIX_CodeRange;
          ColumnDimOption::"Dimension 3":
            CurDim3Filter := MATRIX_CodeRange;
          ColumnDimOption::Period:
            BEGIN
              FirstColumn := FORMAT(FirstColumnDate);
              LastColumn := FORMAT(LastColumnDate);
              PeriodInitialized := TRUE;
            END;
        END;
        #2..12
        SalesAnalysisByDimMatrix.LoadVariables(ItemAnalysisView,ItemStatisticsBuffer,
          CurrentItemAnalysisViewCode,CurrentAnalysisArea,
          LineDimOption,ColumnDimOption,LineDimCode,ColumnDimCode,PeriodType,ValueType,
        #16..19

        SalesAnalysisByDimMatrix.RUNMODAL;
        */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "SetCurrentAnalysisViewCode(PROCEDURE 7)".



    //Unsupported feature: Code Modification on "Dim2FilterOnAfterValidate(PROCEDURE 19005475)".

    //procedure Dim2FilterOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CurrPage.UPDATE;
        MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        AVBreakdownBuffer.DELETEALL;
        CurrPage.UPDATE;
        MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
        */
    //end;


    //Unsupported feature: Code Modification on "Dim1FilterOnAfterValidate(PROCEDURE 19005240)".

    //procedure Dim1FilterOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CurrPage.UPDATE;
        MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        AVBreakdownBuffer.DELETEALL;
        CurrPage.UPDATE;
        MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
        */
    //end;


    //Unsupported feature: Code Modification on "Dim3FilterOnAfterValidate(PROCEDURE 19064950)".

    //procedure Dim3FilterOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CurrPage.UPDATE;
        MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        AVBreakdownBuffer.DELETEALL;
        CurrPage.UPDATE;
        MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
        */
    //end;


    //Unsupported feature: Code Modification on "ItemFilterOnAfterValidate(PROCEDURE 19051257)".

    //procedure ItemFilterOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ItemStatisticsBuffer.SETFILTER("Item Filter",ItemFilter);
        CurrPage.UPDATE(FALSE);
        MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        AVBreakdownBuffer.DELETEALL;
        #1..3
        */
    //end;


    //Unsupported feature: Code Modification on "LocationFilterOnAfterValidate(PROCEDURE 19070361)".

    //procedure LocationFilterOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ItemStatisticsBuffer.SETFILTER("Location Filter",LocationFilter);
        CurrPage.UPDATE(FALSE);
        MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        AVBreakdownBuffer.DELETEALL;
        ItemStatisticsBuffer.SETFILTER("Location Filter",LocationFilter);

        CurrPage.UPDATE(FALSE);
        MATRIX_GenerateColumnCaptions(MATRIX_SetWanted::Initial);
        */
    //end;


    //Unsupported feature: Code Modification on "BudgetFilterOnAfterValidate(PROCEDURE 19069837)".

    //procedure BudgetFilterOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ItemStatisticsBuffer.SETFILTER("Budget Filter",BudgetFilter);
        CurrPage.UPDATE(FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        AVBreakdownBuffer.DELETEALL;
        ItemStatisticsBuffer.SETFILTER("Budget Filter",BudgetFilter);
        CurrPage.UPDATE(FALSE);
        */
    //end;


    //Unsupported feature: Code Modification on "DateFilterOnAfterValidate(PROCEDURE 19006009)".

    //procedure DateFilterOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CurrPage.UPDATE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        AVBreakdownBuffer.DELETEALL;
        CurrPage.UPDATE;
        */
    //end;

    local procedure ClearPoints()
    begin
        Clear(FirstColumn);
        Clear(LastColumn);
    end;

    //Unsupported feature: Property Modification (Length) on "FindPeriod(PROCEDURE 2).SearchText(Parameter 1000)".


    //Unsupported feature: Move on "SetPointsDim(PROCEDURE 17).MatrixMgt(Variable 1000)".

}
