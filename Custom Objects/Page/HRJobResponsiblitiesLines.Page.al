page 52185511 "HR Job Responsiblities Lines"
{
    PageType = List;
    SourceTable = "HR Job Responsiblities";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
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

