page 52185561 "HR Leave Family Groups List"
{
    CardPageID = "HR Leave Family Groups Card";
    PageType = List;
    SourceTable = "HR Leave Family Groups";

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
                field(Remarks; Rec.Remarks)
                {
                }
                field("Max Employees On Leave"; Rec."Max Employees On Leave")
                {
                }
            }
        }
    }

    actions
    {
    }
}

