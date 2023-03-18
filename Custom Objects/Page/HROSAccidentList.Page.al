page 52185603 "HR OSAccident List"
{
    CardPageID = "HR OSAccident Card";
    PageType = List;
    SourceTable = "HR OSAccident";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Accident No"; Rec."Accident No")
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

