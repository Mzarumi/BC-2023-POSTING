page 52186562 "HR Employee Confirmation List"
{
    CardPageID = "HR Employee confirmation";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Employee Confirmation";

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
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("Request Date"; Rec."Request Date")
                {
                }
                field("Probation Start Date"; Rec."Probation Start Date")
                {
                }
                field("Probation End Date"; Rec."Probation End Date")
                {
                }
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

