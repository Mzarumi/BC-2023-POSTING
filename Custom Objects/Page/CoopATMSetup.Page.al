page 52185503 "Coop ATM Setup"
{
    PageType = Card;
    SourceTable = "Coop ATM  Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Coop Commission Account"; Rec."Coop Commission Account")
                {
                }
                field("Coop Fee Account"; Rec."Coop Fee Account")
                {
                }
                field("Coop Bank Account"; Rec."Coop Bank Account")
                {
                }
                field("Daily Withdrawal Limit"; Rec."Daily Withdrawal Limit")
                {
                }
                field("Transactional Withdrawal Limit"; Rec."Transactional Withdrawal Limit")
                {
                }
                field("Institution Code"; Rec."Institution Code")
                {
                }
                field("Institution Name"; Rec."Institution Name")
                {
                }
                field("Transaction Valid Days"; Rec."Transaction Valid Days")
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
        SkyPermissions.Reset;
        SkyPermissions.SetRange("User ID", UserId);
        SkyPermissions.SetRange("ATM Setups", false);
        if SkyPermissions.FindFirst then Error('You do nto have permission ATM Setups in MBanking Permissions');
    end;

    var
        SkyPermissions: Record "Sky Permissions";
}

