page 52186192 "Floor List"
{
    Editable = false;
    PageType = List;
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

    var
        Unit: Record Unit;
}

