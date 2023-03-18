page 52186386 "File Station List"
{
    CardPageID = "File Stations";
    Editable = false;
    PageType = List;
    SourceTable = "File Stations";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Station No."; Rec."Station No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Station Code"; Rec."Station Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

