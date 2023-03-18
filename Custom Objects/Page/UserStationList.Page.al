page 52186384 "User Station List"
{
    CardPageID = "User Station Card";
    Editable = false;
    PageType = List;
    SourceTable = "User Stations";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User Id"; Rec."User Id")
                {
                }
                field("Station Code"; Rec."Station Code")
                {
                }
                field("Station Name"; Rec."Station Name")
                {
                }
                field("Can Create New"; Rec."Can Create New")
                {
                }
                field("Can Issue"; Rec."Can Issue")
                {
                }
            }
        }
    }

    actions
    {
    }
}

