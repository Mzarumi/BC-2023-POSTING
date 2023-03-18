page 52185825 "Account Transfer List"
{
    CardPageID = "Account Transfer";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Account Transfer Header";
    SourceTableView = SORTING(No)
                      ORDER(Descending)
                      WHERE("Account Transfer Type" = CONST(" "),
                            Posted = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        AccountTransferHeader: Record "Account Transfer Header";
}

