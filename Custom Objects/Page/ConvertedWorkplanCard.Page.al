page 52186148 "Converted Workplan Card"
{
    Editable = true;
    PageType = Card;
    SourceTable = "Workplan Activities";
    SourceTableView = WHERE("Converted to Budget" = FILTER(true));

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                IndentationColumn = ActivitiesIndent;
                IndentationControls = "Activity Description";
                ShowCaption = false;
                field("Activity Code"; Rec."Activity Code")
                {
                }
                field("Activity Description"; Rec."Activity Description")
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field(Totaling; Rec.Totaling)
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Converted to Budget"; Rec."Converted to Budget")
                {
                }
                field("Workplan Code"; Rec."Workplan Code")
                {
                }
                field(Indentation; Rec.Indentation)
                {
                    Editable = false;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Indent Workplan")
                {
                    Caption = 'Indent Workplan';
                    RunObject = Codeunit "Workplan Indent";
                }
                action("Import Workplan")
                {
                    Caption = 'Import Workplan';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ActivitiesIndent := 0;
        WorkPlanCodeOnFormat;
        ActivitiesOnFormat;
        TypeOnFormat;
        TotalingOnFormat;
    end;

    var
        [InDataSet]
        "WorkPlan CodeEmphasize": Boolean;
        [InDataSet]
        ActivitiesEmphasize: Boolean;
        [InDataSet]
        ActivitiesIndent: Integer;
        [InDataSet]
        TypeEmphasize: Boolean;
        [InDataSet]
        TotalingEmphasize: Boolean;

    //[Scope('Internal')]
    procedure SetSelection(var GLAcc: Record "Workplan Activities")
    begin
        CurrPage.SetSelectionFilter(GLAcc);
    end;

    //[Scope('Internal')]
    procedure GetSelectionFilter(): Code[80]
    var
        GLAcc: Record "Workplan Activities";
        FirstAcc: Text[20];
        LastAcc: Text[20];
        SelectionFilter: Code[80];
        GLAccCount: Integer;
        More: Boolean;
    begin
        CurrPage.SetSelectionFilter(GLAcc);
        GLAcc.SetCurrentKey("Activity Code");
        GLAccCount := GLAcc.Count;
        if GLAccCount > 0 then begin
            GLAcc.Find('-');
            while GLAccCount > 0 do begin
                GLAccCount := GLAccCount - 1;
                GLAcc.MarkedOnly(false);
                FirstAcc := GLAcc."Activity Code";
                LastAcc := FirstAcc;
                More := (GLAccCount > 0);
                while More do
                    if GLAcc.Next = 0 then
                        More := false
                    else
                        if not GLAcc.Mark then
                            More := false
                        else begin
                            LastAcc := GLAcc."Activity Code";
                            GLAccCount := GLAccCount - 1;
                            if GLAccCount = 0 then
                                More := false;
                        end;
                if SelectionFilter <> '' then
                    SelectionFilter := SelectionFilter + '|';
                if FirstAcc = LastAcc then
                    SelectionFilter := SelectionFilter + FirstAcc
                else
                    SelectionFilter := SelectionFilter + FirstAcc + '..' + LastAcc;
                if GLAccCount > 0 then begin
                    GLAcc.MarkedOnly(true);
                    GLAcc.Next;
                end;
            end;
        end;
        exit(SelectionFilter);
    end;

    local procedure WorkPlanCodeOnFormat()
    begin
        "WorkPlan CodeEmphasize" := Rec."Account Type" <> Rec."Account Type"::Posting;
    end;

    local procedure ActivitiesOnFormat()
    begin
        ActivitiesIndent := Rec.Indentation;
        ActivitiesEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
    end;

    local procedure TypeOnFormat()
    begin
        TypeEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
    end;

    local procedure TotalingOnFormat()
    begin
        TotalingEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
    end;
}

