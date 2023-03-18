#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185766 "W/P Import Budget from Excel"
{
    Caption = 'Import Budget from Excel';
    ProcessingOnly = true;

    dataset
    {
        dataitem(BudgetBuf; "Budget Buffer")
        {
            //DataItemTableView = sorting("Workplan Code", "Dimension Value Code 1", "Dimension Value Code 2", "Dimension Value Code 3", "Dimension Value Code 4", "Dimension Value Code 5", "Dimension Value Code 6", "Dimension Value Code 7", "Dimension Value Code 8", Date);
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                RecNo := RecNo + 1;

                if ImportOption = Importoption::"Replace entries" then begin
                    //GLBudgetEntry.SetRange("Activity Code", BudgetBuf."Workplan Code");
                    GLBudgetEntry.SetRange(Date, Date);
                    GLBudgetEntry.SetFilter("Entry No.", '<=%1', LastEntryNoBeforeImport);
                    // if DimCode[1] <> '' then
                    //     SetBudgetDimFilter(DimCode[1], "Dimension Value Code 1", GLBudgetEntry);
                    // if DimCode[2] <> '' then
                    //     SetBudgetDimFilter(DimCode[2], "Dimension Value Code 2", GLBudgetEntry);
                    // if DimCode[3] <> '' then
                    //     SetBudgetDimFilter(DimCode[3], "Dimension Value Code 3", GLBudgetEntry);
                    // if DimCode[4] <> '' then
                    //     SetBudgetDimFilter(DimCode[4], "Dimension Value Code 4", GLBudgetEntry);
                    // if DimCode[5] <> '' then
                    //     SetBudgetDimFilter(DimCode[5], "Dimension Value Code 5", GLBudgetEntry);
                    // if DimCode[6] <> '' then
                    //     SetBudgetDimFilter(DimCode[6], "Dimension Value Code 6", GLBudgetEntry);
                    // if DimCode[7] <> '' then
                    //     SetBudgetDimFilter(DimCode[7], "Dimension Value Code 7", GLBudgetEntry);
                    // if DimCode[8] <> '' then
                    //     SetBudgetDimFilter(DimCode[8], "Dimension Value Code 8", GLBudgetEntry);
                    // if not GLBudgetEntry.IsEmpty then
                    //     GLBudgetEntry.DeleteAll(true);
                end;

                if Amount = 0 then
                    CurrReport.Skip;
                // if not PostingAccount("Workplan Code") then
                //     CurrReport.Skip;
                GLBudgetEntry.Init;
                GLBudgetEntry."Entry No." := EntryNo;
                GLBudgetEntry."Workplan Code" := ToGLBudgetName;
                //GLBudgetEntry."Activity Code" := "Workplan Code";
                GLBudgetEntry.Date := Date;
                GLBudgetEntry.Amount := ROUND(Amount);
                GLBudgetEntry.Description := Description;

                // Clear any entries in the temporary dimension set entry table
                if not TempDimSetEntry.IsEmpty then
                    TempDimSetEntry.DeleteAll(true);

                // if "Dimension Value Code 1" <> '' then
                //     InsertGLBudgetDim(DimCode[1], "Dimension Value Code 1", GLBudgetEntry);
                // if "Dimension Value Code 2" <> '' then
                //     InsertGLBudgetDim(DimCode[2], "Dimension Value Code 2", GLBudgetEntry);
                // if "Dimension Value Code 3" <> '' then
                //     InsertGLBudgetDim(DimCode[3], "Dimension Value Code 3", GLBudgetEntry);
                // if "Dimension Value Code 4" <> '' then
                //     InsertGLBudgetDim(DimCode[4], "Dimension Value Code 4", GLBudgetEntry);
                // if "Dimension Value Code 5" <> '' then
                //     InsertGLBudgetDim(DimCode[5], "Dimension Value Code 5", GLBudgetEntry);
                // if "Dimension Value Code 6" <> '' then
                //     InsertGLBudgetDim(DimCode[6], "Dimension Value Code 6", GLBudgetEntry);
                // if "Dimension Value Code 7" <> '' then
                //     InsertGLBudgetDim(DimCode[7], "Dimension Value Code 7", GLBudgetEntry);
                // if "Dimension Value Code 8" <> '' then
                //     InsertGLBudgetDim(DimCode[8], "Dimension Value Code 8", GLBudgetEntry);
                // GLBudgetEntry."Dimension Set ID" := DimMgt.GetDimensionSetID(TempDimSetEntry);
                // GLBudgetEntry.Insert;
                EntryNo := EntryNo + 1;
            end;

            trigger OnPostDataItem()
            begin
                if RecNo > 0 then
                    Message(Text004, GLBudgetEntry.TableCaption, RecNo);

                if ImportOption = Importoption::"Replace entries" then begin
                    AnalysisView.SetRange("Include Budgets", true);
                    if AnalysisView.FindSet(true, false) then
                        repeat
                            AnalysisView.AnalysisviewBudgetReset;
                            AnalysisView.Modify;
                        until AnalysisView.Next = 0;
                end;
            end;

            trigger OnPreDataItem()
            begin
                RecNo := 0;

                GLBudgetName.SetRange("Workplan Code", ToGLBudgetName);
                if not GLBudgetName.FindFirst then begin
                    if not Confirm(Text001, false, GLBudgetName.TableCaption, ToGLBudgetName)
                    then
                        CurrReport.Break;
                    GLBudgetName."Workplan Code" := ToGLBudgetName;
                    GLBudgetName.Insert;
                end else begin
                    if GLBudgetName.Blocked then begin
                        Message(Text002,
                          GLBudgetEntry.FieldCaption("Workplan Code"), ToGLBudgetName);
                        CurrReport.Break;
                    end;
                    if not Confirm(Text003, false, Lowercase(Format(SelectStr(ImportOption + 1, Text027))), ToGLBudgetName) then
                        CurrReport.Break;
                end;

                if GLBudgetEntry3.FindLast then
                    EntryNo := GLBudgetEntry3."Entry No." + 1
                else
                    EntryNo := 1;
                LastEntryNoBeforeImport := GLBudgetEntry3."Entry No.";
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ToGLBudgetName; ToGLBudgetName)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Budget Name';
                        TableRelation = "G/L Budget Name";
                    }
                    field(ImportOption; ImportOption)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Option';
                        OptionCaption = 'Replace entries,Add entries';
                    }
                    field(Description; Description)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Description';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            Description := Text005 + Format(WorkDate);
        end;

        trigger OnQueryClosePage(CloseAction: action): Boolean
        var
            FileMgt: Codeunit "File Management";
        begin
            if CloseAction = Action::OK then begin
                // ServerFileName := FileMgt.UploadFile(Text006, ExcelFileExtensionTok);
                // if ServerFileName = '' then
                //     exit(false);

                // SheetName := ExcelBuf.SelectSheetsName(ServerFileName);
                // if SheetName = '' then
                //     exit(false);
            end;
        end;
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        ExcelBuf.DeleteAll;
        BudgetBuf.DeleteAll;
    end;

    trigger OnPreReport()
    var
        BusUnit: Record "Business Unit";
    begin
        if ToGLBudgetName = '' then
            Error(StrSubstNo(Text000));

        BusUnitDimCode := 'BUSINESSUNIT_TAB220';
        TempDim.Init;
        TempDim.Code := BusUnitDimCode;
        TempDim."Code Caption" := UpperCase(BusUnit.TableCaption);
        TempDim.Insert;

        if Dim.Find('-') then begin
            repeat
                TempDim.Init;
                TempDim := Dim;
                TempDim."Code Caption" := UpperCase(TempDim."Code Caption");
                TempDim.Insert;
            until Dim.Next = 0;
        end;

        if GLAcc.Find('-') then begin
            repeat
                TempGLAcc.Init;
                TempGLAcc := GLAcc;
                TempGLAcc.Insert;
            until GLAcc.Next = 0;
        end;

        ExcelBuf.LockTable;
        BudgetBuf.LockTable;
        GLBudgetEntry.SetRange("Activity Code", ToGLBudgetName);
        if not GLBudgetName.Get(ToGLBudgetName) then
            Clear(GLBudgetName);

        GLSetup.Get;
        GlobalDim1Code := GLSetup."Global Dimension 1 Code";
        GlobalDim2Code := GLSetup."Global Dimension 2 Code";
        BudgetDim1Code := GLBudgetName."Budget Dimension 1 Code";
        BudgetDim2Code := GLBudgetName."Budget Dimension 2 Code";
        BudgetDim3Code := GLBudgetName."Budget Dimension 3 Code";
        BudgetDim4Code := GLBudgetName."Budget Dimension 4 Code";

        //ExcelBuf.OpenBook(ServerFileName, SheetName);
        ExcelBuf.ReadSheet;

        AnalyzeData;
    end;

    var
        Text000: label 'You must specify a budget name to import to.';
        Text001: label 'Do you want to create a %1 with the name %2?';
        Text002: label '%1 %2 is blocked. You cannot import entries.';
        Text003: label 'Are you sure that you want to %1 for the budget name %2?';
        Text004: label '%1 table has been successfully updated with %2 entries.';
        Text005: label 'Imported from Excel ';
        Text006: label 'Import Excel File';
        Text007: label 'Analyzing Data...\\';
        Text008: label 'You cannot specify more than 8 dimensions in your Excel worksheet.';
        Text009: label 'WORKPLAN CODE';
        Text010: label 'Workplan Code';
        Text011: label 'The text Workplan Activity Code. can only be specified once in the Excel worksheet.';
        Text012: label 'The dimensions specified by worksheet must be placed in the lines before the table.';
        Text013: label 'Dimension ';
        Text014: label 'Date';
        Text015: label 'Dimension 1';
        Text016: label 'Dimension 2';
        Text017: label 'Dimension 3';
        Text018: label 'Dimension 4';
        Text019: label 'Dimension 5';
        Text020: label 'Dimension 6';
        Text021: label 'Dimension 7';
        Text022: label 'Dimension 8';
        Text023: label 'You cannot import the same information twice.\';
        Text024: label 'The combination G/L Account No. - Dimensions - Date must be unique.';
        Text025: label 'Workplans have not been found in the Excel worksheet.';
        Text026: label 'Dates have not been recognized in the Excel worksheet.';
        ExcelBuf: Record "Excel Buffer";
        Dim: Record Dimension;
        TempDim: Record Dimension temporary;
        GLBudgetEntry: Record 52185985;
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        GLSetup: Record "General Ledger Setup";
        GLAcc: Record 52185902;
        TempGLAcc: Record 52185902 temporary;
        GLBudgetName: Record 52185981;
        GLBudgetEntry3: Record 52185985;
        AnalysisView: Record "Analysis View";
        //DimMgt: Codeunit DimensionManagement;
        ServerFileName: Text;
        SheetName: Text[250];
        ToGLBudgetName: Code[10];
        DimCode: array[8] of Code[20];
        EntryNo: Integer;
        LastEntryNoBeforeImport: Integer;
        GlobalDim1Code: Code[20];
        GlobalDim2Code: Code[20];
        TotalRecNo: Integer;
        RecNo: Integer;
        Window: Dialog;
        Description: Text[50];
        BusUnitDimCode: Code[20];
        BudgetDim1Code: Code[20];
        BudgetDim2Code: Code[20];
        BudgetDim3Code: Code[20];
        BudgetDim4Code: Code[20];
        ImportOption: Option "Replace entries","Add entries";
        Text027: label 'Replace entries,Add entries';
        Text028: label 'A filter has been used on the %1 when the budget was exported. When a filter on a dimension has been used, a column with the same dimension must be present in the worksheet imported. The column in the worksheet must specify the dimension value codes the program should use when importing the budget.';
        ExcelFileExtensionTok: label '.xlsx', Locked = true;

    local procedure AnalyzeData()
    var
        TempExcelBuf: Record "Excel Buffer" temporary;
        BudgetBuf: Record "Budget Buffer";
        TempBudgetBuf: Record "Budget Buffer" temporary;
        HeaderRowNo: Integer;
        CountDim: Integer;
        TestDateTime: DateTime;
        OldRowNo: Integer;
        DimRowNo: Integer;
        DimCode3: Code[20];
    begin
        Window.Open(
          Text007 +
          '@1@@@@@@@@@@@@@@@@@@@@@@@@@\');
        Window.Update(1, 0);
        TotalRecNo := ExcelBuf.Count;
        RecNo := 0;
        BudgetBuf.DeleteAll;

        if ExcelBuf.Find('-') then begin
            repeat
                RecNo := RecNo + 1;
                Window.Update(1, ROUND(RecNo / TotalRecNo * 10000, 1));
                TempDim.SetRange("Code Caption", UpperCase(FormatData(ExcelBuf."Cell Value as Text")));
                case true of
                    (StrPos(UpperCase(ExcelBuf."Cell Value as Text"), Text009) <> 0):
                        begin
                            if HeaderRowNo = 0 then begin
                                HeaderRowNo := ExcelBuf."Row No.";
                                TempExcelBuf := ExcelBuf;
                                TempExcelBuf.Comment := Text010;
                                TempExcelBuf.Insert;
                            end else
                                Error(Text011);
                        end;
                    TempDim.FindFirst and (ExcelBuf."Column No." > 2) and (ExcelBuf."Row No." <> HeaderRowNo):
                        begin
                            if HeaderRowNo <> 0 then
                                Error(Text012);

                            TempDim.Mark(true);
                            DimRowNo := ExcelBuf."Row No.";
                            DimCode3 := TempDim.Code;
                        end;
                    (ExcelBuf."Row No." = DimRowNo) and (ImportOption = Importoption::"Replace entries"):
                        case DimCode3 of
                            BusUnitDimCode:
                                GLBudgetEntry.SetFilter("Business Unit Code", ExcelBuf."Cell Value as Text");
                            GlobalDim1Code:
                                GLBudgetEntry.SetFilter("Global Dimension 1 Code", ExcelBuf."Cell Value as Text");
                            GlobalDim2Code:
                                GLBudgetEntry.SetFilter("Global Dimension 2 Code", ExcelBuf."Cell Value as Text");
                            BudgetDim1Code:
                                GLBudgetEntry.SetFilter("Budget Dimension 1 Code", ExcelBuf."Cell Value as Text");
                            BudgetDim2Code:
                                GLBudgetEntry.SetFilter("Budget Dimension 2 Code", ExcelBuf."Cell Value as Text");
                            BudgetDim3Code:
                                GLBudgetEntry.SetFilter("Budget Dimension 3 Code", ExcelBuf."Cell Value as Text");
                            BudgetDim4Code:
                                GLBudgetEntry.SetFilter("Budget Dimension 4 Code", ExcelBuf."Cell Value as Text");
                        end;
                    ExcelBuf."Row No." = HeaderRowNo:
                        begin
                            TempExcelBuf := ExcelBuf;
                            case true of
                                TempDim.FindFirst:
                                    begin
                                        TempDim.Mark(false);
                                        CountDim := CountDim + 1;
                                        if CountDim > 8 then
                                            Error(Text008);
                                        TempExcelBuf.Comment := Text013 + Format(CountDim);
                                        TempExcelBuf.Insert;
                                        DimCode[CountDim] := TempDim.Code;
                                    end;
                                Evaluate(TestDateTime, TempExcelBuf."Cell Value as Text"):
                                    begin
                                        TempExcelBuf."Cell Value as Text" := Format(Dt2Date(TestDateTime));
                                        TempExcelBuf.Comment := Text014;
                                        TempExcelBuf.Insert;
                                    end;
                            end;
                        end;
                    (ExcelBuf."Row No." > HeaderRowNo) and (HeaderRowNo > 0):
                        begin
                            if ExcelBuf."Row No." <> OldRowNo then begin
                                OldRowNo := ExcelBuf."Row No.";
                                Clear(TempBudgetBuf);
                            end;

                            TempExcelBuf.SetRange("Column No.", ExcelBuf."Column No.");
                            if TempExcelBuf.FindFirst then
                                case TempExcelBuf.Comment of
                                    Text010:
                                        begin
                                            TempGLAcc.SetRange(
                                              "No.",
                                              CopyStr(
                                                ExcelBuf."Cell Value as Text",
                                                1, MaxStrLen(TempBudgetBuf."G/L Account No.")));
                                            if TempGLAcc.FindFirst then
                                                TempBudgetBuf."G/L Account No." :=
                                                  CopyStr(
                                                    ExcelBuf."Cell Value as Text",
                                                    1, MaxStrLen(TempBudgetBuf."G/L Account No."))
                                            else
                                                TempBudgetBuf."G/L Account No." := '';
                                        end;
                                    Text015:
                                        TempBudgetBuf."Dimension Value Code 1" :=
                                          CopyStr(
                                            ExcelBuf."Cell Value as Text",
                                            1, MaxStrLen(TempBudgetBuf."Dimension Value Code 1"));
                                    Text016:
                                        TempBudgetBuf."Dimension Value Code 2" :=
                                          CopyStr(
                                            ExcelBuf."Cell Value as Text",
                                            1, MaxStrLen(TempBudgetBuf."Dimension Value Code 2"));
                                    Text017:
                                        TempBudgetBuf."Dimension Value Code 3" :=
                                          CopyStr(
                                            ExcelBuf."Cell Value as Text",
                                            1, MaxStrLen(TempBudgetBuf."Dimension Value Code 3"));
                                    Text018:
                                        TempBudgetBuf."Dimension Value Code 4" :=
                                          CopyStr(
                                            ExcelBuf."Cell Value as Text",
                                            1, MaxStrLen(TempBudgetBuf."Dimension Value Code 4"));
                                    Text019:
                                        TempBudgetBuf."Dimension Value Code 5" :=
                                          CopyStr(
                                            ExcelBuf."Cell Value as Text",
                                            1, MaxStrLen(TempBudgetBuf."Dimension Value Code 5"));
                                    Text020:
                                        TempBudgetBuf."Dimension Value Code 6" :=
                                          CopyStr(
                                            ExcelBuf."Cell Value as Text",
                                            1, MaxStrLen(TempBudgetBuf."Dimension Value Code 6"));
                                    Text021:
                                        TempBudgetBuf."Dimension Value Code 7" :=
                                          CopyStr(
                                            ExcelBuf."Cell Value as Text",
                                            1, MaxStrLen(TempBudgetBuf."Dimension Value Code 7"));
                                    Text022:
                                        TempBudgetBuf."Dimension Value Code 8" :=
                                          CopyStr(
                                            ExcelBuf."Cell Value as Text",
                                            1, MaxStrLen(TempBudgetBuf."Dimension Value Code 8"));
                                    Text014:
                                        if TempBudgetBuf."G/L Account No." <> '' then begin
                                            BudgetBuf := TempBudgetBuf;
                                            Evaluate(BudgetBuf.Date, TempExcelBuf."Cell Value as Text");
                                            Evaluate(BudgetBuf.Amount, ExcelBuf."Cell Value as Text");
                                            if not BudgetBuf.Find('=') then
                                                BudgetBuf.Insert
                                            else
                                                Error(Text023 + Text024);
                                        end;
                                end;
                        end;
                end;
            until ExcelBuf.Next = 0;
        end;

        TempDim.SetRange("Code Caption");
        TempDim.MarkedOnly(true);
        if TempDim.FindFirst then begin
            Dim.Get(TempDim.Code);
            Error(Text028, Dim."Code Caption");
        end;

        Window.Close;
        TempExcelBuf.Reset;
        TempExcelBuf.SetRange(Comment, Text010);
        if not TempExcelBuf.FindFirst then
            Error(Text025);
        TempExcelBuf.SetRange(Comment, Text014);
        if not TempExcelBuf.FindFirst then
            Error(Text026);
    end;

    local procedure InsertGLBudgetDim(DimCode2: Code[20]; DimValCode2: Code[20]; var GLBudgetEntry2: Record "Workplan Entry")
    var
        DimValue: Record "Dimension Value";
    begin
        if DimCode2 <> BusUnitDimCode then begin
            DimValue.Get(DimCode2, DimValCode2);
            TempDimSetEntry.Init;
            TempDimSetEntry.Validate("Dimension Code", DimCode2);
            TempDimSetEntry.Validate("Dimension Value Code", DimValCode2);
            TempDimSetEntry.Validate("Dimension Value ID", DimValue."Dimension Value ID");
            TempDimSetEntry.Insert;
        end;
        case DimCode2 of
            BusUnitDimCode:
                GLBudgetEntry2."Business Unit Code" := CopyStr(DimValCode2, 1, MaxStrLen(GLBudgetEntry2."Business Unit Code"));
            GlobalDim1Code:
                GLBudgetEntry2."Global Dimension 1 Code" := DimValCode2;
            GlobalDim2Code:
                GLBudgetEntry2."Global Dimension 2 Code" := DimValCode2;
            BudgetDim1Code:
                GLBudgetEntry2."Budget Dimension 1 Code" := DimValCode2;
            BudgetDim2Code:
                GLBudgetEntry2."Budget Dimension 2 Code" := DimValCode2;
            BudgetDim3Code:
                GLBudgetEntry2."Budget Dimension 3 Code" := DimValCode2;
            BudgetDim4Code:
                GLBudgetEntry2."Budget Dimension 4 Code" := DimValCode2;
        end;
    end;

    local procedure FormatData(TextToFormat: Text[250]): Text[250]
    var
        FormatInteger: Integer;
        FormatDecimal: Decimal;
        FormatDate: Date;
    begin
        case true of
            Evaluate(FormatInteger, TextToFormat):
                exit(Format(FormatInteger));
            Evaluate(FormatDecimal, TextToFormat):
                exit(Format(FormatDecimal));
            Evaluate(FormatDate, TextToFormat):
                exit(Format(FormatDate));
            else
                exit(TextToFormat);
        end;
    end;


    procedure SetGLBudgetName(NewToGLBudgetName: Code[10])
    begin
        ToGLBudgetName := NewToGLBudgetName;
    end;


    procedure SetBudgetDimFilter(DimCode2: Code[20]; DimValCode2: Code[20]; var GLBudgetEntry2: Record "Workplan Entry")
    begin
        case DimCode2 of
            BusUnitDimCode:
                GLBudgetEntry2.SetRange("Business Unit Code", DimValCode2);
            GlobalDim1Code:
                GLBudgetEntry2.SetRange("Global Dimension 1 Code", DimValCode2);
            GlobalDim2Code:
                GLBudgetEntry2.SetRange("Global Dimension 2 Code", DimValCode2);
            BudgetDim1Code:
                GLBudgetEntry2.SetRange("Budget Dimension 1 Code", DimValCode2);
            BudgetDim2Code:
                GLBudgetEntry2.SetRange("Budget Dimension 2 Code", DimValCode2);
            BudgetDim3Code:
                GLBudgetEntry2.SetRange("Budget Dimension 3 Code", DimValCode2);
            BudgetDim4Code:
                GLBudgetEntry2.SetRange("Budget Dimension 4 Code", DimValCode2);
        end;
    end;


    procedure PostingAccount(AccNo: Code[20]): Boolean
    var
        GLAccount: Record 52185902;
    begin
        if not GLAccount.Get(AccNo) then
            exit(false);
        exit(GLAccount."Account Type" in [GLAccount."account type"::Posting, GLAccount."account type"::"Begin-Total"]);
    end;
}
