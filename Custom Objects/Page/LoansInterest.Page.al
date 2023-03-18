page 52185878 "Loans Interest"
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
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Loan Product type"; Rec."Loan Product type")
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                }
                field("Bill Account"; Rec."Bill Account")
                {
                    Caption = 'Bill Account';
                }
                field("Interest Date"; Rec."Interest Date")
                {
                }
                field("Repayment Bill"; Rec."Repayment Bill")
                {
                }
                field("Interest Bill"; Rec."Interest Bill")
                {
                }
                field("Appraisal Amount"; Rec."Appraisal Amount")
                {
                }
                field("Issued Date"; Rec."Issued Date")
                {
                }
                field("Outstanding Interest"; Rec."Outstanding Interest")
                {
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                }
                field("Outstanding Bill"; Rec."Outstanding Bill")
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
                field(Status; Rec.Status)
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

