page 52186354 "File Stations"
{
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
                field("Duration (Hr)"; Rec."Duration (Hr)")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

