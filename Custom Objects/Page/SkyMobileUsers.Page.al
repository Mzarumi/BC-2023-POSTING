page 52185434 "Sky Mobile Users"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Sky USSD Auth";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Mobile No."; Rec."Mobile No.")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("User Status"; Rec."User Status")
                {
                }
            }
        }
    }

    actions
    {
    }
}

