#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185987 "Term Loan-Offer Letter"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Term Loan-Offer Letter.rdlc';

    dataset
    {
        dataitem(Loans; Loans)
        {
            column(ReportForNavId_1; 1)
            {
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
}
