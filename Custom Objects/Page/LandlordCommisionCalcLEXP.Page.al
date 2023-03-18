page 52186243 "Landlord Commision Calc LEXP"
{
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Landlord Commision Calc LEXP";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Supplier; Rec.Supplier)
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

