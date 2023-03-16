#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185436 "Modify Specific Loan"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Modify Specific Loan.rdlc';

    dataset
    {
        dataitem(Loans; Loans)
        {
            //DataItemTableView = where("Loan No." = const(LN00040264));
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Loans."Repayment Frequency" := Loans."repayment frequency"::Monthly;
                Loans.Modify;
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
}
