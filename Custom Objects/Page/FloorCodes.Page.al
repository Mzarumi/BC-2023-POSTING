page 52186225 "Floor Codes"
{
    CardPageID = "Floor Description Card";
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
            }
        }
    }

    actions
    {
    }
}

