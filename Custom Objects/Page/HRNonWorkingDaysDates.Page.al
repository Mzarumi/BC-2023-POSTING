page 52185596 "HR Non Working Days & Dates"
{
    Caption = 'HR Non Working Dates';
    PageType = ListPart;
    SourceTable = "HR Non Working Days & Dates";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field(Date; Rec.Date)
                {
                }
                field(Reason; Rec.Reason)
                {
                }
                field(Recurring; Rec.Recurring)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        DayOfWeek_Visible: Boolean;
        DateVisible: Boolean;
        HRCalendar: Record "HR Leave Calendar";
        ReasonVisible: Boolean;
}

