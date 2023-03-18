page 52186685 "Complaint Categories"
{
    PageType = List;
    SourceTable = "Complaint Categories";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Complaint Category"; Rec."Complaint Category")
                {
                }
            }
        }
    }

    actions
    {
    }
}

