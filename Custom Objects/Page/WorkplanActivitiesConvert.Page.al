page 52186156 "Workplan Activities - Convert"
{
    Editable = true;
    PageType = List;
    SourceTable = "Workplan Activities";
    SourceTableView = WHERE("Uploaded to Procurement Workpl" = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                IndentationColumn = NameIndent;
                IndentationControls = "Activity Code";
                field("Activity Code"; Rec."Activity Code")
                {
                    Caption = 'Activity Code';
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                }
                field("Workplan Code"; Rec."Workplan Code")
                {
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                }
                field("Account Type"; Rec."Account Type")
                {
                    Style = Strong;
                    StyleExpr = NoEmphasize;

                    trigger OnValidate()
                    begin
                        UpdateControls;
                    end;
                }
                field(Type; Rec.Type)
                {
                    Caption = 'Type';
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                }
                field("Expense Code"; Rec."Expense Code")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Totaling; Rec.Totaling)
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = NoEmphasize;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Amount to Transfer"; Rec."Amount to Transfer")
                {
                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                }
                field("Converted to Budget"; Rec."Converted to Budget")
                {
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control2; Outlook)
            {
            }
            systempart(Control1; Notes)
            {
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
                Visible = false;
                action(IndentWorkPlan)
                {
                    Caption = 'Indent Workplan Activities';
                    Image = IndentChartOfAccounts;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    // RunObject = Codeunit "Workplan Indent";
                }
                action(Convert)
                {
                    Caption = 'Convert to Workplan Budget Entry';
                    Image = InsertFromCheckJournal;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        //DW
                        if Rec."Account Type" <> Rec."Account Type"::Posting then begin
                            Rec.TestField("Account Type", Rec."Account Type"::Posting);
                        end else begin
                            //Check Required Fields
                            CheckRequiredFields;

                            //Dialog
                            // if Confirm(Text0001, false, Rec."Activity Code", Rec."Activity Description") = false then exit;

                            //Upload to Workplan Entry Table and mark as converted to Workplan Entry

                            //Completion
                            Message(Text0002, Rec."Activity Code", Rec."Activity Description");
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        UpdateControls;
    end;

    var
        [InDataSet]
        NoEmphasize: Boolean;
        [InDataSet]
        NameEmphasize: Boolean;
        [InDataSet]
        NameIndent: Integer;
        Text0001: Label 'Convert to Workplan Activity %1-%2 to a Workplan Budget Entry?';
        Text0002: Label 'Workplan Budget Entry created for Workplan Activity %1-%2.';

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

    //[Scope('Internal')]
    procedure UpdateControls()
    begin
        /*
        IF (Type = Type::"Begin-Total") OR (Type = Type::"End-Total") THEN
        BEGIN
            FieldEditable:=FALSE;
        END ELSE
        BEGIN
            FieldEditable:=TRUE;
        END;
        */

        //For Bold and Indentation
        NoEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
        NameIndent := Rec.Indentation;
        NameEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;

    end;

    //[Scope('Internal')]
    procedure CheckRequiredFields()
    begin
        /*
        Rec.TestField(Type);
        Rec.TestField();
        Rec.TestField();
        */

    end;
}

