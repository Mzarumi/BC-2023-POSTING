page 52186709 "Meeting Types List"
{
    CardPageID = "Meeting Type Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Meeting Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Intervals; Rec.Intervals)
                {
                }
                field("Processing Fee"; Rec."Processing Fee")
                {
                }
            }
        }
    }

    actions
    {
    }
}

