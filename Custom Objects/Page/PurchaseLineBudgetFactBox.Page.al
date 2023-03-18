page 52185972 "Purchase Line Budget FactBox"
{
    PageType = CardPart;
    SourceTable = "Purchase Line";

    layout
    {
        //here
        // area(content)
        // {
        //     field("Line No."; Rec."Line No.")
        //     {
        //     }
        //     field("No."; Rec."No.")
        //     {
        //     }
        //     field("STRSUBSTNO('%1',BudgetaryControl.PaneMgt(Rec,0))"; Rec.StrSubstNo('%1', BudgetaryControl.PaneMgt(Rec, 0)))
        //     {
        //         Caption = 'Budgeted Amount';
        //     }
        //     field("STRSUBSTNO('%1',BudgetaryControl.PaneMgt(Rec,2))"; Rec.StrSubstNo('%1', BudgetaryControl.PaneMgt(Rec, 2)))
        //     {
        //         Caption = 'Committed Amount';
        //     }
        //     field("STRSUBSTNO('%1',BudgetaryControl.PaneMgt(Rec,1))"; Rec.StrSubstNo('%1', BudgetaryControl.PaneMgt(Rec, 1)))
        //     {
        //         Caption = 'Actual Amount';
        //     }
        //     field("STRSUBSTNO('%1',BudgetaryControl.PaneMgt(Rec,0)-BudgetaryControl.PaneMgt(Rec,2)-BudgetaryControl.PaneMgt(Rec,1))"; Rec.StrSubstNo('%1', BudgetaryControl.PaneMgt(Rec, 0) - BudgetaryControl.PaneMgt(Rec, 2) - BudgetaryControl.PaneMgt(Rec, 1)))
        //     {
        //         Caption = 'Balance';
        //     }
        //     field("Line Amount"; Rec."Line Amount")
        //     {
        //         Caption = 'Line Amount';
        //     }
        // }
    }

    actions
    {
    }

    var
        //BudgetaryControl: Codeunit "Budgetary Control";
}

