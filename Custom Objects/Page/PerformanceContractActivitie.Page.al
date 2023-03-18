page 52186128 "Performance Contract Activitie"
{
    Editable = true;
    PageType = List;

    layout
    {
        area(content)
        {
            // repeater(Group)
            // {
            //     IndentationColumn = NameIndent;
            //     IndentationControls = Control20, Control15;
            //     ShowAsTree = false;
            // }
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
                    RunObject = Codeunit "Workplan Indent";
                }
                action("Import Workplan Activities")
                {
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ////RunObject = XMLport WorkPlan;
                }
            }
        }
    }

    var
        [InDataSet]
        NoEmphasize: Boolean;
        [InDataSet]
        NameEmphasize: Boolean;
        [InDataSet]
        NameIndent: Integer;
        Text0001: Label 'Convert to Workplan Activity [ %1-%2 ]to a Workplan Budget Entry?';
        Text0002: Label 'Workplan Budget Entry created for Workplan Activity [ %1-%2 ]';

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
        // NoEmphasize := "Account Type" <> "Account Type"::"0";
        // NameIndent := Indentation;
        // NameEmphasize := "Account Type" <> "Account Type"::"0";

    end;
}

