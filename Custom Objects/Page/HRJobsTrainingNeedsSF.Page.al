page 52185524 "HR Jobs Training Needs SF"
{
    PageType = ListPart;
    SourceTable = "HR Job Training Needs";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("CODE"; Rec.CODE)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Training Group"; Rec."Training Group")
                {
                }
                field("No of Participants"; Rec."No of Participants")
                {
                }
            }
        }
    }

    actions
    {
    }
}

