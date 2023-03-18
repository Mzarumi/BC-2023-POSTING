page 52185604 "HR OSAccident Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "HR OSAccident";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Accident No"; Rec."Accident No")
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
            part(Control5; "HR OSAccident Line")
            {
                SubPageLink = "Accident No" = FIELD("Accident No");
            }
            part(Control6; "HR OSMeasure Line")
            {
                SubPageLink = "Measure No" = FIELD("Accident No");
            }
        }
    }

    actions
    {
    }
}

