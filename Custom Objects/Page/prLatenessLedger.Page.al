page 52185663 prLatenessLedger
{
    PageType = List;
    SourceTable = prLatenessLedger;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee Code"; Rec."Employee Code")
                {
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                }
                field("No. Of Days"; Rec."No. Of Days")
                {
                }
            }
        }
    }

    actions
    {
    }
}

