page 52185654 "HR Lateness Ledger"
{
    PageType = List;
    SourceTable = "HR Lateness Ledger";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No."; Rec."Employee No.")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Date of Entry"; Rec."Date of Entry")
                {
                    Visible = false;
                }
                field(Time; Rec.Time)
                {
                }
                field(Absent; Rec.Absent)
                {
                }
            }
        }
    }

    actions
    {
    }
}

