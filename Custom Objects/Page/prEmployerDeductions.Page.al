page 52185640 "prEmployer Deductions"
{
    Editable = false;
    PageType = List;
    SourceTable = "prEmployer Deductions";

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;
                field("Employee Code"; Rec."Employee Code")
                {
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Period Month"; Rec."Period Month")
                {
                }
                field("Period Year"; Rec."Period Year")
                {
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                }
                field("Payroll Code"; Rec."Payroll Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

