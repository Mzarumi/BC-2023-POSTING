page 52185637 prSalaryArrears
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "prSalary Arrears";

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
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Salary Arrears"; Rec."Salary Arrears")
                {
                }
                field("PAYE Arrears"; Rec."PAYE Arrears")
                {
                }
                field("Period Month"; Rec."Period Month")
                {
                }
                field("Period Year"; Rec."Period Year")
                {
                }
                field("Current Basic"; Rec."Current Basic")
                {
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                }
            }
        }
    }

    actions
    {
    }
}

