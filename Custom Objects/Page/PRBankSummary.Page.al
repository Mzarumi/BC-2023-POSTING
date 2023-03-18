page 52186630 "PR Bank Summary"
{
    PageType = List;
    SourceTable = "HR Bank Summary";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("Bank Code"; Rec."Bank Code")
                {
                }
                field("Bank Name"; Rec."Bank Name")
                {
                }
                field("Branch Code"; Rec."Branch Code")
                {
                }
                field("Branch Name"; Rec."Branch Name")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control2; Outlook)
            {
            }
            systempart(Control1; Notes)
            {
            }
        }
    }

    actions
    {
    }
}

