page 52186563 "HR Leave Calendar List"
{
    CardPageID = "HR Leave Calendar Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Leave Calendar";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Calendar Code"; Rec."Calendar Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Current Leave Calendar"; Rec."Current Leave Calendar")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
            }
        }
    }

    actions
    {
    }
}

