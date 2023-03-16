page 52185599 "HR Commitee Members"
{
    PageType = List;
    SourceTable = "HR Commitee Members";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Member No."; Rec."Member No.")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field(Role; Rec.Role)
                {
                }
                field("Date Appointed"; Rec."Date Appointed")
                {
                }
                field(Active; Rec.Active)
                {
                }
            }
        }
    }

    actions
    {
    }
}

