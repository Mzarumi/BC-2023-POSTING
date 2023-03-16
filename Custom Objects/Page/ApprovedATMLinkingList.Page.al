page 52186287 "Approved ATM Linking List"
{
    CardPageID = "Approved ATM Linking Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "ATM Linking Applications";
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
                field("ATM Application No."; Rec."ATM Application No.")
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
                field("ATM Linked"; Rec."ATM Linked")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
                field("Capture Date"; Rec."Capture Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

