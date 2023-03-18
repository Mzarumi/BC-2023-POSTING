#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185423 "Emp Loan Update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Emp Loan Update.rdlc';

    dataset
    {
        dataitem("Loans Employer Loan No.";"Loans Employer Loan No.")
        {
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                // "Bankers Cheque Application"."Global Dimension 2 Code":='ksm';
                // "Bankers Cheque Application".MODIFY;
                if LoansR.Get("Loans Employer Loan No."."Loan No") then begin
                  LoansR."Employer Loan No.":="Loans Employer Loan No."."Employer Loan No.";
                  LoansR.Modify;
                  end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Employer Loan Nos Updated');
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
        GenJnl: Record "Gen. Journal Line";
        LoansR: Record 52185729;
}
