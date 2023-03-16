page 52185424 "Change PIN Log Entries"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Sky PIN Change Log";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date; Rec.Date)
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field("Changed By"; Rec."Changed By")
                {
                }
                field("Field Modified"; Rec."Field Modified")
                {
                }
                field("Old Value"; Rec."Old Value")
                {
                }
                field("New Value"; Rec."New Value")
                {
                }
            }
        }
    }

    actions
    {
    }
}

