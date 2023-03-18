page 52185621 "prEmployee Posting Group"
{
    PageType = List;
    SourceTable = "prEmployee Posting Group";

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Salary Account"; Rec."Salary Account")
                {
                }
                field("Income Tax Account"; Rec."Income Tax Account")
                {
                }
                field("SSF Employer Account"; Rec."SSF Employer Account")
                {
                    Caption = 'SSF Employer Expense Account';
                }
                field("SSF Employee Account"; Rec."SSF Employee Account")
                {
                    Caption = 'SSF Total Payable Account';
                }
                field("Net Salary Payable"; Rec."Net Salary Payable")
                {
                }
                field("Pension Employer Acc"; Rec."Pension Employer Acc")
                {
                    Caption = 'PF Employer Expense Account';
                }
                field("Pension Employee Acc"; Rec."Pension Employee Acc")
                {
                    Caption = 'PF Total Payable Account';
                }
                field("Tax Code"; Rec."Tax Code")
                {
                }
                field("Payslip Report"; Rec."Payslip Report")
                {
                }
                field("Employment Tax Debit"; Rec."Employment Tax Debit")
                {
                }
                field("Employment Tax Credit"; Rec."Employment Tax Credit")
                {
                }
                field("NHIF Employee Account"; Rec."NHIF Employee Account")
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
        OnViewCurrRec
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
        ChangePermission.SetRange("Function Extended", ChangePermission."Function Extended"::"View Payroll");
        if not ChangePermission.Find('-') then
            Error(ErrorOnRestricViewTxt, UserId);
    end;
}

