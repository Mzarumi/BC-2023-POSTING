page 52185606 "HR OSMeasure Line"
{
    PageType = ListPart;
    SourceTable = "HR OSMeasure Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Measure No"; Rec."Measure No")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

