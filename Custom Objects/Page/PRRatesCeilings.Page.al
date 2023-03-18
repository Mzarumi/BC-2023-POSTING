page 52185628 "PR Rates & Ceilings"
{
    PageType = Card;
    SourceTable = "PR Vital Setup Info";

    layout
    {
        area(content)
        {
            group("Tax Relief")
            {
                Caption = 'Tax Relief';
                field("Setup Code"; Rec."Setup Code")
                {
                    Editable = false;
                }
                field(Control20; Rec."Tax Relief")
                {
                }
                field("Insurance Relief"; Rec."Insurance Relief")
                {
                }
                field("NHIF Relief"; Rec."NHIF Relief")
                {
                }
                field("Max Relief"; Rec."Max Relief")
                {
                }
                field("Disbled Tax Limit"; Rec."Disbled Tax Limit")
                {
                }
                field("Minimum Relief Amount"; Rec."Minimum Relief Amount")
                {
                }
            }
            group("NSSF Contribution")
            {
                Caption = 'NSSF Contribution';
                field("NSSF Employee"; Rec."NSSF Employee")
                {
                }
                field("NSSF Employer Factor"; Rec."NSSF Employer Factor")
                {
                }
                field("NSSF Based on"; Rec."NSSF Based on")
                {
                }
            }
            group(NHIF)
            {
                Caption = 'NHIF';
                field("NHIF Based on"; Rec."NHIF Based on")
                {
                    Caption = 'Select one:';
                }
            }
            group(Pension)
            {
                Caption = 'Pension';
                field("Max Pension Contribution"; Rec."Max Pension Contribution")
                {
                }
                field("Tax On Excess Pension"; Rec."Tax On Excess Pension")
                {
                }
            }
            group(Mortgage)
            {
                Caption = 'Mortgage';
                field("Mortgage Relief"; Rec."Mortgage Relief")
                {
                    Caption = 'Mortgage Relief (Less from Taxable Pay)';
                }
                field("Mortgage Relief Percentage"; Rec."Mortgage Relief Percentage")
                {
                }
            }
            group("Owner Occupier Interest")
            {
                Caption = 'Owner Occupier Interest';
                field("OOI Deduction"; Rec."OOI Deduction")
                {
                    Caption = 'Max Monthly Contribution';
                }
                field("OOI December"; Rec."OOI December")
                {
                    Caption = 'December deduction';
                }
            }
            group("Staff Loans")
            {
                Caption = 'Staff Loans';
                field("Loan Market Rate"; Rec."Loan Market Rate")
                {
                }
                field("Loan Corporate Rate"; Rec."Loan Corporate Rate")
                {
                }
            }
            group(Allowances)
            {
                Caption = 'Allowances';
                field("Acting Allowance Percentage"; Rec."Acting Allowance Percentage")
                {
                }
                field("Acting Allowance Based On"; Rec."Acting Allowance Based On")
                {
                }
                field("Acting Allowance Duration"; Rec."Acting Allowance Duration")
                {
                }
                field("Leave Allowance Percentage"; Rec."Leave Allowance Percentage")
                {
                }
                field("Leave Allowance Based On"; Rec."Leave Allowance Based On")
                {
                }
                field("Training Deduction Percentage"; Rec."Training Deduction Percentage")
                {
                }
                field("Max. Leave Allowance"; Rec."Max. Leave Allowance")
                {
                }
                field("Salary increment %"; Rec."Salary increment %")
                {
                }
            }
        }
    }

    actions
    {
    }

    //[Scope('Internal')]
    procedure OnViewCurrRec()
    var
        ChangePermission: Record "Status Change Permissions.";
        ErrorOnRestricViewTxt: Label 'You do not have Permissions to VIEW,MODIFY or DELETE on this record. Contact system administrator for assistance. %';
    begin
        ChangePermission.Reset;
        ChangePermission.SetRange("User ID", UserId);
        ChangePermission.SetRange("Edit Setup", true);
        ChangePermission.SetRange("Function Extended", ChangePermission."Function Extended"::"Edit HR Setups");
        if not ChangePermission.Find('-') then
            Error(ErrorOnRestricViewTxt, UserId);
    end;
}

