page 52185629 "prPeriodTransaction List"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "PR Period Transactions";

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;
                field("Payroll Period"; Rec."Payroll Period")
                {
                }
                field("Employee Code"; Rec."Employee Code")
                {
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Balance; Rec.Balance)
                {
                }
                field(Membership; Rec.Membership)
                {
                }
                field("Reference No"; Rec."Reference No")
                {
                }
            }
        }
    }

    actions
    {
    }
}

