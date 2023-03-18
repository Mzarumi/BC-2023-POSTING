page 52186561 "HR Dept. Responsiblities Lines"
{
    PageType = List;
    SourceTable = "HR Dept. Responsibilities";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Responsibility code"; Rec."Responsibility code")
                {
                }
                field("Responsibility Description"; Rec."Responsibility Description")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
            }
        }
    }

    actions
    {
    }
}

