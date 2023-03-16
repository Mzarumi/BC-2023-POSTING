page 52185547 "HR Employee Course of Study"
{
    PageType = List;
    SourceTable = "HR Employee Course of Study";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Years of Study"; Rec."Years of Study")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755006; Outlook)
            {
            }
            systempart(Control1102755007; Notes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            group(Action1102755009)
            {
            }
        }
    }
}

