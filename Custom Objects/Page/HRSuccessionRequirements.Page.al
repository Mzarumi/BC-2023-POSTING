page 52185549 "HR Succession Requirements"
{
    PageType = List;
    SourceTable = "HR Succession Requirements";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requirement Code"; Rec."Requirement Code")
                {
                }
                field(Requirement; Rec.Requirement)
                {
                }
            }
        }
    }

    actions
    {
    }
}

