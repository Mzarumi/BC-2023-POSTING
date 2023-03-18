page 52185446 "Sky SMS Messages"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Sky SMS Messages";
    SourceTableView = SORTING(date_created)
                      ORDER(Descending)
                      WHERE(msg_general_flag = FILTER(<> 'NOT_MASKED'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(msg_id; Rec.msg_id)
                {
                }
                field(msg_status_code; Rec.msg_status_code)
                {
                }
                field(msg_status_description; Rec.msg_status_description)
                {
                }
                field(sender; Rec.sender)
                {
                }
                field(receiver; Rec.receiver)
                {
                }
                field(msg; Rec.msg)
                {
                }
                field(msg_type; Rec.msg_type)
                {
                }
                field(msg_priority; Rec.msg_priority)
                {
                }
                field("SMS Date"; Rec."SMS Date")
                {
                }
                field("Account To Charge"; Rec."Account To Charge")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field(date_created; Rec.date_created)
                {
                }
                field(Finalized; Rec.Finalized)
                {
                }
                field("Split Charge"; Rec."Split Charge")
                {
                }
            }
        }
    }

    actions
    {
    }
}

