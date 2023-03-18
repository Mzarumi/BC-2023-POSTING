#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185748 "Update Payroll Credit Accounts"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Payroll Credit Accounts.rdlc';

    dataset
    {
        dataitem("Agent Applications"; "Agent Applications")
        {
            //DataItemTableView = where("Balance (LCY)" = filter(> 0), "Payroll/Staff No." = const(""));
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                // if Members.Get("Credit Accounts"."Member No.") then begin
                //     "Credit Accounts"."Payroll/Staff No." := Members."Payroll/Staff No.";
                //     "Credit Accounts"."ID No." := Members."ID No.";
                //     "Credit Accounts"."Employer Code" := Members."Employer Code";
                //     "Credit Accounts".Modify;
                // end;
            end;

            trigger OnPreDataItem()
            begin
                OnViewCurrRec();
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Members: Record "Members";
        Loans: Record 52185729;


    procedure OnViewCurrRec()
    var
        ChangePermission: Record 52185687;
        ErrorOnRestricViewTxt: label 'You do not have Permissions to VIEW,MODIFY or DELETE on this record. Contact system administrator for assistance. %';
    begin
        ChangePermission.Reset;
        ChangePermission.SetRange("User ID", UserId);
        ChangePermission.SetRange("View Payroll", true);
        ChangePermission.SetRange("Function Extended", ChangePermission."function extended"::"View Payroll");
        if not ChangePermission.Find('-') then
            Error(ErrorOnRestricViewTxt, UserId);
    end;
}
