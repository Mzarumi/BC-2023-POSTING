page 52186376 "Salary Thru FOSA Update"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Salary Thru FOSA Update";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account No."; Rec."Account No.")
                {
                }
                field("Date Unmarked"; Rec."Date Unmarked")
                {
                }
                field("Last Salary Date"; Rec."Last Salary Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

