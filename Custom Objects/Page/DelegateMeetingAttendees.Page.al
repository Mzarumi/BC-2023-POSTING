page 52186322 "Delegate Meeting Attendees"
{
    PageType = List;
    SourceTable = "Delegates Meeting Attendees";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Delegate No."; Rec."Delegate No.")
                {
                }
                field("Delegate Name"; Rec."Delegate Name")
                {
                }
                field("Delegate Email"; Rec."Delegate Email")
                {
                }
                field("Delegate Phone"; Rec."Delegate Phone")
                {
                }
                field("Delegate Position"; Rec."Delegate Position")
                {
                }
                field("Delegate Region"; Rec."Delegate Region")
                {
                }
            }
        }
    }

    actions
    {
    }
}

