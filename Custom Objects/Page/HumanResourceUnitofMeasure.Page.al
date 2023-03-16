page 52185583 "Human Resource Unit of Measure"
{
    PageType = List;
    SourceTable = "Human Resource Unit of Measure";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                }
            }
        }
    }

    actions
    {
    }
}

