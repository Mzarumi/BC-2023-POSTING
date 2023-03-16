page 52186480 "HR Asset Transfer List"
{
    CardPageID = "HR Asset Transfer Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HR Asset Transfer Header";
    SourceTableView = WHERE(Transfered = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("Current Holder"; Rec."Current Holder")
                {
                }
                field("Asset to Transfer"; Rec."Asset to Transfer")
                {
                }
                field("New Holder"; Rec."New Holder")
                {
                }
                field(Transfered; Rec.Transfered)
                {
                }
            }
        }
    }

    actions
    {
    }
}

