page 52185477 "Internet Banking Transactions"
{
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    ShowFilter = true;
    SourceTable = "Online Transactions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Account To"; Rec."Account To")
                {
                }
                field("Utility Type"; Rec."Utility Type")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
                field("Time Posted"; Rec."Time Posted")
                {
                }
                field("Account Status"; Rec."Account Status")
                {
                }
                field("Needs Change"; Rec."Needs Change")
                {
                }
                field("Change Transaction No"; Rec."Change Transaction No")
                {
                }
                field("Old Account No"; Rec."Old Account No")
                {
                }
                field(Changed; Rec.Changed)
                {
                }
                field("Date Changed"; Rec."Date Changed")
                {
                }
                field("Time Changed"; Rec."Time Changed")
                {
                }
                field("Changed By"; Rec."Changed By")
                {
                }
                field("Approved By"; Rec."Approved By")
                {
                }
            }
        }
    }

    actions
    {
    }
}

