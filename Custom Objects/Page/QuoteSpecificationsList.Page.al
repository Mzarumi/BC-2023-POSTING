page 52186046 "Quote Specifications List"
{
    PageType = List;
    SourceTable = "Quote Specifications";

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
                field("Value/Weight"; Rec."Value/Weight")
                {
                }
            }
        }
    }

    actions
    {
    }
}

