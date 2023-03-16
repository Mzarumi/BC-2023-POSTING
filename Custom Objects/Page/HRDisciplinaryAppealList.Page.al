page 52185541 "HR Disciplinary Appeal List"
{
    CardPageID = "HR Disciplinary Appeal Card";
    PageType = List;
    SourceTable = "HRDisciplinary Appeal";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field(Department; Rec.Department)
                {
                }
            }
        }
    }

    actions
    {
    }
}

