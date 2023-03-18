page 52186578 "HR Shortlisting Panel"
{
    PageType = List;
    SourceTable = "HR Shortlisting Panel";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                }
                field("Job Id"; Rec."Job Id")
                {
                    Editable = false;
                }
                field(Department; Rec.Department)
                {
                    Editable = false;
                }
                field(Region; Rec.Region)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

