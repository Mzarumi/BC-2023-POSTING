page 52186675 "Return Lines List"
{
    Editable = false;
    PageType = List;
    SourceTable = "Delegates Returns Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Phone Number"; Rec."Phone Number")
                {
                }
                field("ID/Personal/Member Number"; Rec."ID/Personal/Member Number")
                {
                }
                field(Name; Rec.Name)
                {
                }
            }
        }
    }

    actions
    {
    }
}

