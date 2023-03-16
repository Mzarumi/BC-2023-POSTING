page 52186017 "HR Disc Withdrawal list"
{
    CardPageID = "HR Disc Wthdrawal Card";
    PageType = List;
    SourceTable = "HRDisciplinary Case Withdrawal";

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

