page 52186258 "Payment Schedule"
{
    PageType = List;
    SourceTable = "Payment Schedule";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Lease No"; Rec."Lease No")
                {
                    Editable = false;
                }
                field("Invoice Date"; Rec."Invoice Date")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Paid; Rec.Paid)
                {
                }
            }
        }
    }

    actions
    {
    }
}

