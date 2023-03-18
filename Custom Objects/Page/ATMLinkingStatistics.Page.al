page 52186279 "ATM Linking Statistics"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "ATM Linking  Statistics";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Linking Type"; Rec."Linking Type")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Activity Date"; Rec."Activity Date")
                {
                }
                field("Activity Time"; Rec."Activity Time")
                {
                }
                field("Reason for change"; Rec."Reason for change")
                {
                }
            }
        }
    }

    actions
    {
    }
}

