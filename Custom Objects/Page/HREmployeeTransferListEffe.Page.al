page 52186477 "HR Employee Transfer List Effe"
{
    CardPageID = "HR Employee Transfer Card Effe";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Employee Transfer Header";
    SourceTableView = WHERE("Transfer details Updated" = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Request No"; Rec."Request No")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("Date Requested"; Rec."Date Requested")
                {
                }
                field(Status; Rec.Status)
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Transfer details Updated"; Rec."Transfer details Updated")
                {
                }
            }
        }
    }

    actions
    {
    }
}

