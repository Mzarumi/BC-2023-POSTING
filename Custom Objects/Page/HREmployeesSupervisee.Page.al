page 52185548 "HR Employees Supervisee"
{
    PageType = List;
    SourceTable = "HR Employees Supervisees";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Supervisor No."; Rec."Supervisor No.")
                {
                }
                field("Supervisee No."; Rec."Supervisee No.")
                {
                }
                field(Department; Rec.Department)
                {
                }
                field("Job Title"; Rec."Job Title")
                {
                }
                field("Key Experience"; Rec."Key Experience")
                {
                }
                field(From; Rec.From)
                {
                }
                field("To"; Rec."To")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("Number of Supervisees"; Rec."Number of Supervisees")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755011; Outlook)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        /*HREmployeeSupervisees.RESET;
        HREmployeeSupervisees.SETRANGE(HREmployeeSupervisees."Supervisor No.","Supervisor No.");
        IF HREmployeeSupervisees.GET THEN
        SETRANGE("Supervisor No.",HREmployeeSupervisees."Supervisor No.")
        ELSE
        //user id may not be the creator of the doc
        SETRANGE("Supervisor No.","Supervisor No.");
         */

    end;
}

