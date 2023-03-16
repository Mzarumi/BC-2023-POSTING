page 52186219 "Water Billing rates"
{
    PageType = List;
    SourceTable = "Water Billing rate";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Tier Code"; Rec."Tier Code")
                {
                }
                field("Bill Rate tier"; Rec."Bill Rate tier")
                {
                }
                field(Rate; Rec.Rate)
                {
                }
                field("Type of Tarrif"; Rec."Type of Tarrif")
                {
                }
            }
        }
    }

    actions
    {
    }
}

