page 52186546 "HR Appraisal Batches"
{
    PageType = List;
    SourceTable = "HR Appraisal Journal Batch";

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

