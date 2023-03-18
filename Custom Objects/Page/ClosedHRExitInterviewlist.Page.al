page 52185527 "Closed HR Exit Interview list"
{
    CardPageID = "HR Employee Exit Interviews";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Employee Exit Interviews";
    SourceTableView = WHERE(Closed = FILTER(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Exit Interview No"; Rec."Exit Interview No")
                {
                    Style = Unfavorable;
                    StyleExpr = TRUE;
                }
                field("Date Of Interview"; Rec."Date Of Interview")
                {
                }
                field("Interviewer Name"; Rec."Interviewer Name")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("Reason For Leaving"; Rec."Reason For Leaving")
                {
                }
            }
        }
    }

    actions
    {
    }
}

