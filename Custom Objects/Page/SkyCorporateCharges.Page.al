page 52185441 "Sky Corporate Charges"
{
    PageType = List;
    SourceTable = "Sky Safcom Corporate Charges";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Minimum; Rec.Minimum)
                {
                }
                field(Maximum; Rec.Maximum)
                {
                }
                field(Charge; Rec.Charge)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        Permission.Reset;
        Permission.SetRange("User ID", UserId);
        Permission.SetRange("Sky Mobile Setups", true);
        if not Permission.FindFirst then
            Error('You do not have the following permission: "Sky Mobile Setups"');
    end;

    var
        Permission: Record "Sky Permissions";
}

