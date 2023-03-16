page 52185848 "Loan Rescheduling List"
{
    CardPageID = "Loan Rescheduling";
    Editable = false;
    InsertAllowed = false;
    UsageCategory = Lists;
    PageType = List;
    SourceTable = "Loan Rescheduling";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field(Rescheduled; Rec.Rescheduled)
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

