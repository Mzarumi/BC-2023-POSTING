page 52185562 "HR Leave Family Employees List"
{
    PageType = List;
    SourceTable = "HR Leave Family Employees";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Family; Rec.Family)
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
            }
        }
    }

    actions
    {
    }
}

