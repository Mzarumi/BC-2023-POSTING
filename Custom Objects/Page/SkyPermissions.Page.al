page 52185439 "Sky Permissions"
{
    PageType = List;
    SourceTable = "Sky Permissions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User ID"; Rec."User ID")
                {
                }
                field("Reset Mpesa Pin"; Rec."Reset Mpesa Pin")
                {
                }
                field("Update Paybill Transaction"; Rec."Update Paybill Transaction")
                {
                }
                field("Sky Mobile Setups"; Rec."Sky Mobile Setups")
                {
                }
                field("Reverse Sky Transactions"; Rec."Reverse Sky Transactions")
                {
                }
                field("Black-List Accounts"; Rec."Black-List Accounts")
                {
                }
                field("View BlackListed Accounts"; Rec."View BlackListed Accounts")
                {
                }
                field("Update MPESA Withdrawal"; Rec."Update MPESA Withdrawal")
                {
                }
                field("Update Transactional Mobile No"; Rec."Update Transactional Mobile No")
                {
                }
                field("Clear Transactional Mobile"; Rec."Clear Transactional Mobile")
                {
                }
                field(IMSI_IMEI_Suspension; Rec.IMSI_IMEI_Suspension)
                {
                }
                field("Activate_Deactivate Account"; Rec."Activate_Deactivate Account")
                {
                }
                field("Initiate Service Change"; Rec."Initiate Service Change")
                {
                }
                field("Approve Service Change"; Rec."Approve Service Change")
                {
                }
                field("ATM Setups"; Rec."ATM Setups")
                {
                }
                field("Release ATM Transactions"; Rec."Release ATM Transactions")
                {
                }
                field("Return Loans to Appraisal"; Rec."Return Loans to Appraisal")
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

    trigger OnOpenPage()
    begin
        //RestrictAccess(USERID);
    end;

    var
        Permission: Record "Sky Permissions";

    //[Scope('Internal')]
    procedure RestrictAccess(UserNo: Code[100])
    var
        StatusPermission: Record "User Setup";
        ErrorOnRestrictViewTxt: Label 'You do not have permissions to EDIT this Page. Contact your system administrator for further details';
    begin
        StatusPermission.Reset;
        StatusPermission.SetRange("User ID", UserNo);
        StatusPermission.SetRange("Approval Administrator", true);
        if not StatusPermission.Find('-') then begin
            Error('You do not have permission to access this page');
        end;
    end;
}

