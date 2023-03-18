page 52186699 "Safaricom Charges"
{
    PageType = List;
    SourceTable = "Sky Safcom Corporate Charges";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field(Category; Rec.Category)
                {
                }
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

    trigger OnOpenPage()
    begin
        Permission.Reset;
        Permission.SetRange("User ID", UserId);
        Permission.SetRange("Sky Mobile Setups", true);
        if not Permission.FindFirst then
            Error('You do not have the following permission: "Safaricom Charges Setup');
    end;

    var
        Permission: Record "Sky Permissions";
}

