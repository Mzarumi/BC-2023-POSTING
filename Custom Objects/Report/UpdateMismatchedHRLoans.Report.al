#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185851 "Update Mismatched HR Loans"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Mismatched HR Loans.rdlc';

    dataset
    {
        dataitem(Members; Members)
        {
            RequestFilterFields = "No.", "Employer Code";
            column(ReportForNavId_2; 2)
            {
            }
            dataitem("Credit Ledger Entry"; "Credit Ledger Entry")
            {
                DataItemLink = "Member No." = field("No.");
                RequestFilterFields = "Posting Date";
                column(ReportForNavId_1; 1)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    OnViewCurrRec();
                    Loans.Reset;
                    Loans.SetRange("Loan No.", "Credit Ledger Entry"."Loan No");
                    if Loans.Find('-') then begin

                        "Credit Ledger Entry"."Customer No." := Loans."Loan Account";
                        "Credit Ledger Entry".Modify;
                    end;
                end;
            }
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
        ProductFactory: Record 52185690;
        Resignation: Record 52185428;
        BBFRequisationLines: Record 52186127;
        Customer: Record Customer;
        Member: Record "Members";
        ATMNos: Record 52185432;
        Loans: Record 52185729;


    procedure OnViewCurrRec()
    var
        ChangePermission: Record 52185687;
        ErrorOnRestricViewTxt: label 'You do not have Permissions to VIEW,MODIFY or DELETE on this record. Contact system administrator for assistance. %';
    begin
        ChangePermission.Reset;
        ChangePermission.SetRange("User ID", UserId);
        ChangePermission.SetRange("View Payroll", true);
        if not ChangePermission.Find('-') then
            Error(ErrorOnRestricViewTxt, UserId);
    end;
}
