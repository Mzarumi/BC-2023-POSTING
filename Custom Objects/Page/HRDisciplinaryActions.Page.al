page 52185582 "HR Disciplinary Actions"
{
    PageType = List;
    SourceTable = "HR Disciplinary Actions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Action Code"; Rec."Action Code")
                {
                }
                field(Instance; Rec.Instance)
                {
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                }
            }
        }
    }

    actions
    {
    }
}

