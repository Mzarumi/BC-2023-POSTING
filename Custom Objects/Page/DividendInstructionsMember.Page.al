page 52185734 "Dividend Instructions - Member"
{
    PageType = List;
    SourceTable = "Dividend Instructions - Member";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    Visible = false;
                }
                field("Member No."; Rec."Member No.")
                {
                    Visible = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ValuesAllowed = Savings, Credit;
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Recovery Type"; Rec."Recovery Type")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Priority; Rec.Priority)
                {
                }
                field("Recurrent Over Years"; Rec."Recurrent Over Years")
                {
                }
                field("Last Modified Date"; Rec."Last Modified Date")
                {
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control3; Notes)
            {
            }
            systempart(Control2; MyNotes)
            {
            }
            systempart(Control1; Links)
            {
            }
        }
    }

    actions
    {
    }
}

