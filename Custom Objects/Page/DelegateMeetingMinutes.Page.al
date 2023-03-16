page 52186323 "Delegate Meeting Minutes"
{
    CardPageID = "Degate Meeting Minutes Card";
    PageType = List;
    SourceTable = "Delegates Meeting Minutes";

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field(Details; Rec.Details)
                {
                }
                field(Feedback; Rec.Feedback)
                {
                }
                field("Feedback By"; Rec."Feedback By")
                {
                }
                field("Feedback Date"; Rec."Feedback Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

