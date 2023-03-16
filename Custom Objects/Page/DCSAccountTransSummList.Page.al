page 52186448 "DCS Account Trans Summ List"
{
    PageType = List;
    SourceTable = "Salary Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Date; Rec."Posting Date")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                    Caption = '<Account No.>';
                }
                field("Document No"; Rec."Salary Header No.")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
            }
        }
    }

    actions
    {
    }
}

