page 52186637 "HR Succession Job Rotation"
{
    PageType = List;
    SourceTable = "HR Succession Job Rotation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job ID"; Rec."Job ID")
                {
                }
                field("Job Title"; Rec."Job Title")
                {
                }
                // field(From; Rec.From)
                // {
                // }
                field("Up to"; Rec."Up to")
                {
                }
                field(Duration; Rec.Duration)
                {
                }
                field("Competency Acquired"; Rec."Competency Acquired")
                {
                }
            }
        }
    }

    actions
    {
    }
}

