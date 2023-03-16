page 52186458 "Online Users"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Online Users";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Date Created"; Rec."Date Created")
                {
                }
                field("ID Number"; Rec."ID Number")
                {
                }
                field("BOSA No"; Rec."BOSA No")
                {
                }
                field("Last Login"; Rec."Last Login")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("Changed Password"; Rec."Changed Password")
                {
                }
            }
        }
    }

    actions
    {
    }
}

