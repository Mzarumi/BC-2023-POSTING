page 52185625 "prInstitutional Membership"
{
    PageType = List;
    SourceTable = "prInstitutional Membership";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Group No"; Rec."Group No")
                {
                    Editable = false;
                }
                field("Institution No"; Rec."Institution No")
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

