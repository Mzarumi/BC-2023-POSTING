#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185455 "Modify Header"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Modify Header.rdlc';

    dataset
    {
        dataitem("Loan Disbursement Header"; "Loan Disbursement Header")
        {
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                "Loan Disbursement Header".Status := "Loan Disbursement Header".Status::Approved;
                "Loan Disbursement Header".Posted := false;
                "Loan Disbursement Header".Modify;
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
