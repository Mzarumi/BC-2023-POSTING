page 52186470 "HR Succession Planning List"
{
    CardPageID = "HR Succession Planning";
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Succession Employee";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan No."; Rec."Plan No.")
                {
                }
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("Staff Names"; Rec."Staff Names")
                {
                }
                field("Job ID"; Rec."Job ID")
                {
                }
                field("Job Title"; Rec."Job Title")
                {
                }
                field("Position to Succeed"; Rec."Position to Succeed")
                {
                }
                field("Position Description"; Rec."Position Description")
                {
                }
                field("Succession Date"; Rec."Succession Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
    }
}

