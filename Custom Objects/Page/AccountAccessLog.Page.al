page 52185843 "Account Access Log"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Account Access Log";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Sno; Rec.Sno)
                {
                }
                field(Source; Rec.Source)
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field(Time; Rec.Time)
                {
                }
                field("Info Source"; Rec."Info Source")
                {
                }
                field("User Id"; Rec."User Id")
                {
                }
            }
        }
    }

    actions
    {
    }
}

