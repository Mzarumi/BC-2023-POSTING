page 52186416 "Loan Payment Method"
{
    PageType = List;
    SourceTable = "Payment Methods";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Payment Method"; Rec."Payment Method")
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

