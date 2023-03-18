page 52185635 "Pension Contribution Details"
{
    PageType = List;
    SourceTable = "prPension Details";

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
                field("Inception Date"; Rec."Inception Date")
                {
                }
                field("Pension Number"; Rec."Pension Number")
                {
                }
                field(Company; Rec.Company)
                {
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

