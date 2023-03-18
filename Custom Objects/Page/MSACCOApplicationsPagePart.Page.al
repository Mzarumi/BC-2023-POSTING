page 52185784 "MSACCO Applications Page Part"
{
    DeleteAllowed = false;
    PageType = ListPart;
    SourceTable = "M-SACCO Application Details";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

