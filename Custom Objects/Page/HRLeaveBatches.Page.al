page 52185554 "HR Leave Batches"
{
    PageType = List;
    SourceTable = "HR Leave Journal Batch";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field(Name; Rec.Name)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Posting Description"; Rec."Posting Description")
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

