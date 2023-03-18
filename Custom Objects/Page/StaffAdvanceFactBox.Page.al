page 52185983 "Staff Advance FactBox"
{
    PageType = CardPart;
    SourceTable = "Staff Advance Lines";

    layout
    {
        area(content)
        {
            field("Line No."; Rec."Line No.")
            {
            }
            field(No; Rec.No)
            {
            }
            //here
            // field("STRSUBSTNO('%1',BudgetaryControl.PaneMgt(Rec,0))"; Rec.StrSubstNo('%1', BudgetaryControl.PaneMgt(Rec, 0)))
            // {
            //     Caption = 'Budgeted Amount';
            // }
            // field("STRSUBSTNO('%1',BudgetaryControl.PaneMgt(Rec,2))"; Rec.StrSubstNo('%1', BudgetaryControl.PaneMgt(Rec, 2)))
            // {
            //     Caption = 'Committed Amount';
            // }
            // field("STRSUBSTNO('%1',BudgetaryControl.PaneMgt(Rec,1))"; Rec.StrSubstNo('%1', BudgetaryControl.PaneMgt(Rec, 1)))
            // {
            //     Caption = 'Actual Amount';
            // }
            // field("STRSUBSTNO('%1',BudgetaryControl.PaneMgt(Rec,0)-BudgetaryControl.PaneMgt(Rec,2)-BudgetaryControl.PaneMgt(Rec,1))"; Rec.StrSubstNo('%1', BudgetaryControl.PaneMgt(Rec, 0) - BudgetaryControl.PaneMgt(Rec, 2) - BudgetaryControl.PaneMgt(Rec, 1)))
            // {
            //     Caption = 'Balance';
            // }
            field("Amount LCY"; Rec."Amount LCY")
            {
                Caption = 'Line Amount';
            }
        }
    }

    actions
    {
    }

    var
        //BudgetaryControl: Codeunit "Budgetary Control";
}

