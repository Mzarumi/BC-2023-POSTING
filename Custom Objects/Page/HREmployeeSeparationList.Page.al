page 52186605 "HR Employee Separation List"
{
    CardPageID = "HR Employee Separation";
    PageType = List;
    SourceTable = "HR Employee Separation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Separation No."; Rec."Separation No.")
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
                field("Job Title"; Rec."Job Title")
                {
                }
                field("Nature of Separation"; Rec."Nature of Separation")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
            }
        }
    }

    actions
    {
    }
}

