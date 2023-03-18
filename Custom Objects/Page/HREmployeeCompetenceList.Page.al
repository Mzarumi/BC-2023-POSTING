page 52186606 "HR Employee Competence List"
{
    PageType = List;
    SourceTable = "HR Employee Competence";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Competence Code"; Rec."Competence Code")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                }
                field("Competency Score"; Rec."Competency Score")
                {
                }
            }
        }
    }

    actions
    {
    }
}

