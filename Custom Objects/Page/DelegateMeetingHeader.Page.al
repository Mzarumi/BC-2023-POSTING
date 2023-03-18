page 52186320 "Delegate Meeting Header"
{
    //CardPageID = "Delegate Meeting Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Delegates Minutes Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Electoral Name"; Rec."Electoral Name")
                {
                }
                field(Venue; Rec.Venue)
                {
                }
                field("Start Time"; Rec."Start Time")
                {
                }
                field("End Time"; Rec."End Time")
                {
                }
                field(Month; Rec.Month)
                {
                }
                field(Year; Rec.Year)
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        StatusChangePermissions: Record "Status Change Permissions.";
}

