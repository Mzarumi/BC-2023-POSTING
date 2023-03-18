page 52185449 "Black-Listed Names"
{
    PageType = List;
    SourceTable = "Sky Black-Listed Names";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {
                }
                field(Reason; Rec.Reason)
                {
                }
                field("Black-Listed"; Rec."Black-Listed")
                {
                }
                field("Black-Listed By"; Rec."Black-Listed By")
                {
                }
                field("Date Black-Listed"; Rec."Date Black-Listed")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Import)
            {
                Promoted = true;
                PromotedIsBig = true;
                ////RunObject = XMLport XMLport50057;
            }
        }
    }

    trigger OnInit()
    begin

        StatusPermission.Reset;
        StatusPermission.SetRange("User ID", UserId);
        StatusPermission.SetRange("View BlackListed Accounts", true);
        if not StatusPermission.Find('-') then begin
            Error('You do not have the following permission: "Black-List Accounts"');
        end;
    end;

    var
        StatusPermission: Record "Sky Permissions";
}

