page 52186213 "Floor Description Card"
{
    PageType = Card;
    SourceTable = "Floor Codes";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Floor Code"; Rec."Floor Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Land; Rec.Land)
                {
                }
            }
        }
    }

    actions
    {
    }
}

