page 52185450 "Mobile Loan Installments"
{
    PageType = List;
    SourceTable = "Mobile Loan Installments";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Installments; Rec.Installments)
                {
                }
                field(Caption; Rec.Caption)
                {
                }
            }
        }
    }

    actions
    {
    }
}

