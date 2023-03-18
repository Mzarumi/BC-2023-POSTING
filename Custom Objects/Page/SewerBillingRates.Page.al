page 52186224 "Sewer Billing Rates"
{
    PageType = List;
    SourceTable = "Sewer Billing rate";

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

