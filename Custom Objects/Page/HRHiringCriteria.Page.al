page 52186555 "HR Hiring Criteria"
{
    PageType = List;
    SourceTable = "HR Hiring Criteria";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application Code"; Rec."Application Code")
                {
                }
                field("Hiring Criteria"; Rec."Hiring Criteria")
                {
                }
            }
        }
    }

    actions
    {
    }
}

