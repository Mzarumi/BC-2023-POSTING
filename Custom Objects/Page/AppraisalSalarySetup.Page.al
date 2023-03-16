page 52185771 "Appraisal Salary Set-up"
{
    PageType = Card;
    SourceTable = "Appraisal Salary Set-up";

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Type; Rec.Type)
                {
                }
            }
        }
    }

    actions
    {
    }
}

