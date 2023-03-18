page 52186086 "HR Employee Change Log"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Employee Change Log";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("Staff Name"; Rec."Staff Name")
                {
                }
                field("Date Modified"; Rec."Date Modified")
                {
                }
                field("Time Modified"; Rec."Time Modified")
                {
                }
                field("Modified by"; Rec."Modified by")
                {
                }
                field("Field Changed"; Rec."Field Changed")
                {
                }
                field("Old Value"; Rec."Old Value")
                {
                }
                field("New Value"; Rec."New Value")
                {
                }
                field("Reason for Change"; Rec."Reason for Change")
                {
                }
            }
        }
    }

    actions
    {
    }
}

