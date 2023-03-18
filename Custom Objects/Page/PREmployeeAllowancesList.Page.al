page 52185891 "PR Employee Allowances List"
{
    CardPageID = "PR Employee Allowances Card";
    PageType = List;
    SourceTable = "PR Employee Allowances";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Job Grade"; Rec."Job Grade")
                {
                }
                field(County; Rec.County)
                {
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
            }
        }
    }

    actions
    {
    }
}

