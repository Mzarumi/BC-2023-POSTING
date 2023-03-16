page 52186020 Others
{
    PageType = List;
    SourceTable = Contracts;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Review Interval"; Rec."Review Interval")
                {
                }
                field("Type Of Service"; Rec."Type Of Service")
                {
                }
                field("Nature Of Service"; Rec."Nature Of Service")
                {
                }
            }
        }
    }

    actions
    {
    }
}

