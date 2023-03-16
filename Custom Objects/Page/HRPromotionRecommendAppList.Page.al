page 52186619 "HR Promotion Recommend AppList"
{
    CardPageID = "HR Promotion Recommend AppHead";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Promo. Recommend Header";
    SourceTableView = WHERE(Promoted = CONST(true));

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
                field(Status; Rec.Status)
                {
                    Style = AttentionAccent;
                    StyleExpr = TRUE;
                }
            }
        }
    }

    actions
    {
    }
}

