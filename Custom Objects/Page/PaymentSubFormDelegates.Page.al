page 52186178 "Payment Sub Form Delegates"
{
    PageType = ListPart;
    SourceTable = "Payment Line Delegate";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                }
                field("External DOC No"; Rec."External DOC No")
                {
                }
                field("Payment Types"; Rec."Payment Types")
                {
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                    Editable = true;
                }
                field("Savings Account"; Rec."Savings Account")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                    Editable = true;
                }
                field("Net Amount"; Rec."Net Amount")
                {
                }
                field("SMS Sent"; Rec."SMS Sent")
                {
                }
            }
        }
    }

    actions
    {
    }
}

