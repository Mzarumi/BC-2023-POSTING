page 52186369 "Dialy Mortgage Interest List"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Daily Mortgage Interest Buffer";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No"; Rec."Loan No")
                {
                }
                field("Loan Type"; Rec."Loan Type")
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Interest Date"; Rec."Interest Date")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
            }
        }
    }

    actions
    {
    }
}

