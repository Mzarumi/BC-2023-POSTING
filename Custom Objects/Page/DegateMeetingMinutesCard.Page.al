page 52186324 "Degate Meeting Minutes Card"
{
    PageType = Card;
    SourceTable = "Delegates Meeting Minutes";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Meeting No."; Rec."Meeting No.")
                {
                }
                field(Category; Rec.Category)
                {
                }
                field(Subject; Rec.Subject)
                {
                }
                group("Minutes Details")
                {
                    field(Details; Rec.Details)
                    {
                    }
                    field(Feedback; Rec.Feedback)
                    {
                    }
                }
            }
        }
    }

    actions
    {
    }
}

