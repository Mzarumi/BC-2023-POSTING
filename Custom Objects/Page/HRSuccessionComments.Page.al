page 52186506 "HR Succession Comments"
{
    PageType = List;
    SourceTable = "HR Succession Comments";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Comment; Rec.Comment)
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

