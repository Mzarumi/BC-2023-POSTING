page 52185885 "End Year Interest Buffer"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "End Year Interest Buffer";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Interest Date"; Rec."Interest Date")
                {
                }
                field("Interest Amount"; Rec."Interest Amount")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Product Factory Code"; Rec."Product Factory Code")
                {
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                }
                field("Payable Account"; Rec."Payable Account")
                {
                    Caption = 'Payable Account';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("Account Balance"; Rec."Account Balance")
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

