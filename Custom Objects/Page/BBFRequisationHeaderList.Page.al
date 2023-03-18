page 52186432 "BBF Requisation Header List"
{
    CardPageID = "BBF Requisation Headers";
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "BBF Requisation Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
            }
        }
    }

    actions
    {
    }
}

