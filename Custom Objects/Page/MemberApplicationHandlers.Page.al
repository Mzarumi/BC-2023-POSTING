page 52186689 "Member Application Handlers"
{
    PageType = List;
    UsageCategory = Administration;
    SourceTable = "Portal Member App Handlers";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Payroll Number"; Rec."Payroll Number")
                {
                }
                field("Member Number"; Rec."Member Number")
                {
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field("Job Tittle"; Rec.Department)
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
    }
}

