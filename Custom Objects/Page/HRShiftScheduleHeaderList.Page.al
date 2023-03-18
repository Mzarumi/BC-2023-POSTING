page 52186615 "HR Shift Schedule Header List"
{
    CardPageID = "HR Shift Schedule Header Card";
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Shift Schedule Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Shift Code"; Rec."Shift Code")
                {
                }
                field("Assigned Employees"; Rec."Assigned Employees")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Outlook)
            {
            }
            systempart(Control8; Notes)
            {
            }
        }
    }

    actions
    {
    }
}

