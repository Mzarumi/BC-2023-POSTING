page 52186306 "Payment Sub Form Staff"
{
    PageType = ListPart;
    SourceTable = "Payment Line Staff";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                }
                field("Staff Allowance Grade"; Rec."Staff Allowance Grade")
                {
                }
                field("Member No."; Rec."Member No.")
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
                field("Destination Code"; Rec."Destination Code")
                {
                }
                field("No of Days"; Rec."No of Days")
                {
                }
                field("Daily Rate(Amount)"; Rec."Daily Rate(Amount)")
                {
                    Editable = false;
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
                field("Loan No."; Rec."Loan No.")
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
                field("W/Tax Amount"; Rec."W/Tax Amount")
                {
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

