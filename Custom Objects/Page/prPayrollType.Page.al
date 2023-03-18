page 52185632 "prPayroll Type"
{
    PageType = List;
    SourceTable = "prPayroll Type";

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;
                field("Payroll Code"; Rec."Payroll Code")
                {
                }
                field("Payroll Name"; Rec."Payroll Name")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("Period Length"; Rec."Period Length")
                {
                }
            }
        }
    }

    actions
    {
    }
}

