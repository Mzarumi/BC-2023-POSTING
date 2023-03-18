page 52185740 "Fixed Deposit Type"
{
    DeleteAllowed = false;
    SourceTable = "Fixed Deposit Type";

    layout
    {
        area(content)
        {
            field("Code"; Rec.Code)
            {
            }
            field(Description; Rec.Description)
            {
            }
            field(Duration; Rec.Duration)
            {
            }
            field("Call Deposit"; Rec."Call Deposit")
            {
            }
            field(Blocked; Rec.Blocked)
            {
            }
            part(Control1102755004; "FD Interest Calculation")
            {
                SubPageLink = Code = FIELD(Code);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("User Notification")
            {
                Caption = 'User Notification';
                Image = UserSetup;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Member List";
                RunPageLink = "Search Name" = FIELD(Code);
            }
        }
    }
}

