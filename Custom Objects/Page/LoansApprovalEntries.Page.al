page 52186318 "Loans Approval Entries"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Approval Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Primary Rec"; Rec."Primary Rec")
                {
                }
                field("Approval Code"; Rec."Approval Code")
                {
                }
                field("Sender ID"; Rec."Sender ID")
                {
                }
                field("Approver ID"; Rec."Approver ID")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Date-Time Sent for Approval"; Rec."Date-Time Sent for Approval")
                {
                }
                field("Last Date-Time Modified"; Rec."Last Date-Time Modified")
                {
                }
                field("Last Modified By User ID"; Rec."Last Modified By User ID")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("Due Date"; Rec."Due Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

