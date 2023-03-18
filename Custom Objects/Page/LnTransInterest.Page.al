page 52185896 "LnTrans Interest"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Loans Interest";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Loan Product type"; Rec."Loan Product type")
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                }
                field("Bal. Account No.(Suspended)"; Rec."Bal. Account No.(Suspended)")
                {
                    Caption = 'Bal. Account No.[Suspended Int]';
                }
                field("Interest Date"; Rec."Interest Date")
                {
                }
                field("Interest Amount"; Rec."Interest Amount")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field(Transferred; Rec.Transferred)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
            }
        }
    }

    actions
    {
    }
}

