page 52185489 "Insurance Requisition List"
{
    CardPageID = "Sky Insurance Card";
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Sky Insurance";
    SourceTableView = WHERE(Actioned = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Session ID"; Rec."Session ID")
                {
                }
                field(Purpose; Rec.Purpose)
                {
                }
                field(Email; Rec.Email)
                {
                }
                field("Phone Number"; Rec."Phone Number")
                {
                }
                field("Entry Time"; Rec."Entry Time")
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field(Names; Rec.Names)
                {
                }
                field(Actioned; Rec.Actioned)
                {
                }
                field("Actioned By"; Rec."Actioned By")
                {
                }
            }
        }
    }

    actions
    {
    }
}

