page 52185690 "Payslip Email Status"
{
    PageType = List;
    SourceTable = "PR Email Status";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                }
                field("Date Sent"; Rec."Date Sent")
                {
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

