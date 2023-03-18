page 52185845 "Checkoff Advice List"
{
    CardPageID = "Checkoff Advice Header";
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Checkoff Advice Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
                field("Employer Name"; Rec."Employer Name")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
                field("Date Entered"; Rec."Date Entered")
                {
                }
            }
        }
    }

    actions
    {
    }
}

