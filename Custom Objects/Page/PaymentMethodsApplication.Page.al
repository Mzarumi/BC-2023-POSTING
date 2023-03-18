page 52186423 "Payment Methods Application"
{
    PageType = List;
    SourceTable = "Payment Methods Application";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Member No."; Rec."Member No.")
                {
                }
                field("Payment Method"; Rec."Payment Method")
                {
                }
                field("Loan No."; Rec."Loan No.")
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

