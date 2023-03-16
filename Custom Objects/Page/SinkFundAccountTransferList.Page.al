page 52186134 "SinkFund Account Transfer List"
{
    CardPageID = "SinkFund Account Transfer";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Account Transfer Header";
    SourceTableView = WHERE("Account Transfer Type" = CONST(SinkFund));

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
}

