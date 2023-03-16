page 52185668 "prNSSF List"
{
    PageType = List;
    SourceTable = "prNSSF Tiers";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Tier; Rec.Tier)
                {
                }
                field(Earnings; Rec.Earnings)
                {
                }
                field("Pensionable Earnings"; Rec."Pensionable Earnings")
                {
                }
                field("Tier 1 earnings"; Rec."Tier 1 earnings")
                {
                }
                field("Tier 1 Employee Deduction"; Rec."Tier 1 Employee Deduction")
                {
                }
                field("Tier 1 Employer Contribution"; Rec."Tier 1 Employer Contribution")
                {
                }
                field("Tier 2 earnings"; Rec."Tier 2 earnings")
                {
                }
                field("Tier 2 Employee Deduction"; Rec."Tier 2 Employee Deduction")
                {
                }
                field("Tier 2 Employer Contribution"; Rec."Tier 2 Employer Contribution")
                {
                }
                field("Lower Limit"; Rec."Lower Limit")
                {
                }
                field("Upper Limit"; Rec."Upper Limit")
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
        OnViewCurrRec();
    end;

    //[Scope('Internal')]
    procedure OnViewCurrRec()
    var
        ChangePermission: Record "Status Change Permissions.";
        ErrorOnRestricViewTxt: Label 'You do not have Permissions to VIEW,MODIFY or DELETE on this record. Contact system administrator for assistance. %';
    begin
        ChangePermission.Reset;
        ChangePermission.SetRange("User ID", UserId);
        ChangePermission.SetRange("View Payroll", true);
        ChangePermission.SetRange("Function Extended", ChangePermission."Function Extended"::"Edit HR Setups");
        if not ChangePermission.Find('-') then
            Error(ErrorOnRestricViewTxt, UserId);
    end;
}

