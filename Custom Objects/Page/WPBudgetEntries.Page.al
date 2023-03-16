page 52186142 "W/P Budget Entries"
{
    Caption = 'W/P Budget Entries';
    DataCaptionFields = "Workplan Code", "Activity Code";
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Workplan Entry";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Workplan Code"; Rec."Workplan Code")
                {
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                }
                field("Activity Code"; Rec."Activity Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Expense Code"; Rec."Expense Code")
                {
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Enabled = "Global Dimension 1 CodeEnable";
                    Visible = "Global Dimension 1 CodeVisible";
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Enabled = "Global Dimension 2 CodeEnable";
                    Visible = "Global Dimension 2 CodeVisible";
                }
                field("Budget Dimension 1 Code"; Rec."Budget Dimension 1 Code")
                {
                    Enabled = "Budget Dimension 1 CodeEnable";
                    Visible = "Budget Dimension 1 CodeVisible";
                }
                field("Budget Dimension 2 Code"; Rec."Budget Dimension 2 Code")
                {
                    Enabled = "Budget Dimension 2 CodeEnable";
                    Visible = "Budget Dimension 2 CodeVisible";
                }
                field("Budget Dimension 3 Code"; Rec."Budget Dimension 3 Code")
                {
                    Enabled = "Budget Dimension 3 CodeEnable";
                    Visible = "Budget Dimension 3 CodeVisible";
                }
                field("Budget Dimension 4 Code"; Rec."Budget Dimension 4 Code")
                {
                    Enabled = "Budget Dimension 4 CodeEnable";
                    Visible = "Budget Dimension 4 CodeVisible";
                }
                field("Business Unit Code"; Rec."Business Unit Code")
                {
                    Visible = false;
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Processed to Budget"; Rec."Processed to Budget")
                {
                    Editable = false;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    Editable = false;
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    Editable = false;
                }
                field("Created By:"; Rec."Created By:")
                {
                    Editable = false;
                }
                field("Last Modified By:"; Rec."Last Modified By:")
                {
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';
                Image = Entry;
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDimensions;
                        CurrPage.SaveRecord;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec."Entry No." <> 0 then
            if Rec."Dimension Set ID" <> xRec."Dimension Set ID" then
                LowestModifiedEntryNo := Rec."Entry No.";
    end;

    trigger OnClosePage()
    var
        UpdateAnalysisView: Codeunit "Update Analysis View";
    begin
        if LowestModifiedEntryNo < 2147483647 then
            UpdateAnalysisView.SetLastBudgetEntryNo(LowestModifiedEntryNo - 1);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec."Entry No." < LowestModifiedEntryNo then
            LowestModifiedEntryNo := Rec."Entry No.";
        exit(true);
    end;

    trigger OnInit()
    begin
        "Budget Dimension 4 CodeEnable" := true;
        "Budget Dimension 3 CodeEnable" := true;
        "Budget Dimension 2 CodeEnable" := true;
        "Budget Dimension 1 CodeEnable" := true;
        "Global Dimension 2 CodeEnable" := true;
        "Global Dimension 1 CodeEnable" := true;
        "Budget Dimension 4 CodeVisible" := true;
        "Budget Dimension 3 CodeVisible" := true;
        "Budget Dimension 2 CodeVisible" := true;
        "Budget Dimension 1 CodeVisible" := true;
        "Global Dimension 2 CodeVisible" := true;
        "Global Dimension 1 CodeVisible" := true;
        LowestModifiedEntryNo := 2147483647;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Entry No." < LowestModifiedEntryNo then
            LowestModifiedEntryNo := Rec."Entry No.";
        exit(true);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if Rec.GetFilter("Workplan Code") <> '' then
            Rec."Workplan Code" := Rec.GetRangeMin("Workplan Code");
        if GLBudgetName."Workplan Code" <> Rec."Workplan Code" then
            GLBudgetName.Get(Rec."Workplan Code");
        if Rec.GetFilter(Rec."Activity Code") <> '' then
            Rec."Activity Code" := GetFirstGLAcc(Rec.GetFilter("Activity Code"));
        Rec."Date" := GetFirstDate(Rec.GetFilter("Date"));
        Rec."User ID" := UserId;

        if Rec.GetFilter("Global Dimension 1 Code") <> '' then
            Rec."Global Dimension 1 Code" :=
              GetFirstDimValue(GLSetup."Global Dimension 1 Code", Rec.GetFilter("Global Dimension 1 Code"));

        if Rec.GetFilter("Global Dimension 2 Code") <> '' then
            Rec."Global Dimension 2 Code" :=
              GetFirstDimValue(GLSetup."Global Dimension 2 Code", Rec.GetFilter("Global Dimension 2 Code"));

        if Rec.GetFilter("Budget Dimension 1 Code") <> '' then
            Rec."Budget Dimension 1 Code" :=
              GetFirstDimValue(GLBudgetName."Budget Dimension 1 Code", Rec.GetFilter("Budget Dimension 1 Code"));

        if Rec.GetFilter("Budget Dimension 2 Code") <> '' then
            Rec."Budget Dimension 2 Code" :=
              GetFirstDimValue(GLBudgetName."Budget Dimension 2 Code", Rec.GetFilter("Budget Dimension 2 Code"));

        if Rec.GetFilter("Budget Dimension 3 Code") <> '' then
            Rec."Budget Dimension 3 Code" :=
              GetFirstDimValue(GLBudgetName."Budget Dimension 3 Code", Rec.GetFilter("Budget Dimension 3 Code"));

        if Rec.GetFilter("Budget Dimension 4 Code") <> '' then
            Rec."Budget Dimension 4 Code" :=
              GetFirstDimValue(GLBudgetName."Budget Dimension 4 Code", Rec.GetFilter("Budget Dimension 4 Code"));

        if Rec.GetFilter("Business Unit Code") <> '' then
            Rec."Business Unit Code" := GetFirstBusUnit(Rec.GetFilter("Business Unit Code"));
    end;

    trigger OnOpenPage()
    var
        GLBudgetName: Record Workplan;
    begin


        if Rec.GetFilter("Workplan Code") = '' then
            GLBudgetName.Init
        else begin
            Rec.CopyFilter("Workplan Code", GLBudgetName."Workplan Code");
            GLBudgetName.FindFirst;
        end;
        CurrPage.Editable := not GLBudgetName.Blocked;
        GLSetup.Get;
        "Global Dimension 1 CodeEnable" := GLSetup."Global Dimension 1 Code" <> '';
        "Global Dimension 2 CodeEnable" := GLSetup."Global Dimension 2 Code" <> '';
        "Budget Dimension 1 CodeEnable" := GLBudgetName."Budget Dimension 1 Code" <> '';
        "Budget Dimension 2 CodeEnable" := GLBudgetName."Budget Dimension 2 Code" <> '';
        "Budget Dimension 3 CodeEnable" := GLBudgetName."Budget Dimension 3 Code" <> '';
        "Budget Dimension 4 CodeEnable" := GLBudgetName."Budget Dimension 4 Code" <> '';
        "Global Dimension 1 CodeVisible" := GLSetup."Global Dimension 1 Code" <> '';
        "Global Dimension 2 CodeVisible" := GLSetup."Global Dimension 2 Code" <> '';
        "Budget Dimension 1 CodeVisible" := GLBudgetName."Budget Dimension 1 Code" <> '';
        "Budget Dimension 2 CodeVisible" := GLBudgetName."Budget Dimension 2 Code" <> '';
        "Budget Dimension 3 CodeVisible" := GLBudgetName."Budget Dimension 3 Code" <> '';
        "Budget Dimension 4 CodeVisible" := GLBudgetName."Budget Dimension 4 Code" <> '';
    end;

    var
        GLSetup: Record "General Ledger Setup";
        GLBudgetName: Record Workplan;
        LowestModifiedEntryNo: Integer;
        [InDataSet]
        "Global Dimension 1 CodeVisible": Boolean;
        [InDataSet]
        "Global Dimension 2 CodeVisible": Boolean;
        [InDataSet]
        "Budget Dimension 1 CodeVisible": Boolean;
        [InDataSet]
        "Budget Dimension 2 CodeVisible": Boolean;
        [InDataSet]
        "Budget Dimension 3 CodeVisible": Boolean;
        [InDataSet]
        "Budget Dimension 4 CodeVisible": Boolean;
        [InDataSet]
        "Global Dimension 1 CodeEnable": Boolean;
        [InDataSet]
        "Global Dimension 2 CodeEnable": Boolean;
        [InDataSet]
        "Budget Dimension 1 CodeEnable": Boolean;
        [InDataSet]
        "Budget Dimension 2 CodeEnable": Boolean;
        [InDataSet]
        "Budget Dimension 3 CodeEnable": Boolean;
        [InDataSet]
        "Budget Dimension 4 CodeEnable": Boolean;

    local procedure GetFirstGLAcc(GLAccFilter: Text[250]): Code[20]
    var
        GLAcc: Record "Workplan Activities";
    begin
        with GLAcc do begin
            SetFilter("Activity Code", GLAccFilter);
            if FindFirst then
                exit("Activity Code");

            exit('');
        end;
    end;

    local procedure GetFirstDate(DateFilter: Text[250]): Date
    var
        Period: Record Date;
    begin
        if DateFilter = '' then
            exit(0D);
        with Period do begin
            SetRange("Period Type", "Period Type"::Date);
            SetFilter("Period Start", DateFilter);
            if FindFirst then
                exit("Period Start");

            exit(0D);
        end;
    end;

    local procedure GetFirstDimValue(DimCode: Code[20]; DimValFilter: Text[250]): Code[20]
    var
        DimVal: Record "Dimension Value";
    begin
        if (DimCode = '') or (DimValFilter = '') then
            exit('');
        with DimVal do begin
            SetRange("Dimension Code", DimCode);
            SetFilter(Code, DimValFilter);
            if FindFirst then
                exit(Code);

            exit('');
        end;
    end;

    local procedure GetFirstBusUnit(BusUnitFilter: Text[250]): Code[10]
    var
        BusUnit: Record "Business Unit";
    begin
        with BusUnit do begin
            SetFilter(Code, BusUnitFilter);
            if FindFirst then
                exit(Code);

            exit('');
        end;
    end;
}

