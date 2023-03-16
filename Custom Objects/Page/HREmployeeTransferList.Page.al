page 52186475 "HR Employee Transfer List"
{
    CardPageID = "HR Employee Transfer Card";
    Editable = false;
    PageType = List;
    SourceTable = "HR Employee Transfer Header";
    SourceTableView = WHERE("Transfer details Updated" = CONST(false));

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

