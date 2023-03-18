page 52185552 "HR Leave Types"
{
    CardPageID = "HR Leave Types Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Leave Types";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Gender; Rec.Gender)
                {
                }
                field(Active; Rec.Active)
                {
                }
                field(Days; Rec.Days)
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755003; Outlook)
            {
            }
            systempart(Control1102755004; Notes)
            {
            }
        }
    }

    actions
    {
    }
}

