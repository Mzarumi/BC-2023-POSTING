page 52186659 "Mobile Guarantor Setup"
{
    Editable = true;
    PageType = List;
    SourceTable = "Mobile Guarantors Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Product Code"; Rec."Product Code")
                {
                }
                field("Product Name"; Rec."Product Name")
                {
                }
                field("Lower Limit"; Rec."Lower Limit")
                {
                }
                field("Upper Limit"; Rec."Upper Limit")
                {
                }
                field("No. of Guarantors"; Rec."No. of Guarantors")
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
        // Permission.RESET;
        // Permission.SETRANGE("User ID",USERID);
        // Permission.SETRANGE("Sky Mobile Setups",TRUE);
        // IF NOT Permission.FINDFIRST THEN
        //  ERROR('You do not have the following permission: "Sky Mobile Setups"');
    end;

    var
        Permission: Record "Sky Permissions";
}

