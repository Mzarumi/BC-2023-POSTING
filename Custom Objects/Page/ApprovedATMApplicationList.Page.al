page 52185873 "Approved ATM Application List"
{
    CardPageID = "Approved ATM Application Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "ATM Applications";
    SourceTableView = WHERE(Status = FILTER(Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Branch Code"; Rec."Branch Code")
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Customer ID"; Rec."Customer ID")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

