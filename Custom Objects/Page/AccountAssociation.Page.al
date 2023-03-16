page 52186424 "Account Association"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Account Associations";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EntyNo;Rec.EntyNo)
                {
                }
                field("Account No.";Rec."Account No.")
                {
                }
                field(Description;Rec.Description)
                {
                }
                field("ID No.";Rec."ID No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

