page 52185427 "Sky Email Update -Posted"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Sky Email Update Buffer";
    SourceTableView = WHERE(Posted = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Email; Rec.Email)
                {
                }
                field(Validated; Rec.Validated)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
            }
        }
    }

    actions
    {
    }
}

