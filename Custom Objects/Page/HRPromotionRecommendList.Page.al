page 52185519 "HR Promotion Recommend List"
{
    CardPageID = "HR Promotion Recommend Header";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Promo. Recommend Header";
    SourceTableView = WHERE(Promoted = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field(Reason; Rec.Reason)
                {
                }
            }
        }
    }

    actions
    {
    }
}

