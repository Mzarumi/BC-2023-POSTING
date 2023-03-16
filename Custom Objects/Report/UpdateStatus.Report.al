#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185901 "Update Status"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Status.rdlc';

    dataset
    {
        dataitem(Loans; Loans)
        {
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                LoanNumber := Loans.GetFilter("Loan No.");
                if LoanNumber = '' then
                    Error('Loan Number Must Have a value');

                SASRACategory.Reset;
                SASRACategory.SetRange("Loan No.", LoanNumber);
                if SASRACategory.Find('-') then
                    Loans.Delete;
                SASRACategory.Init;
                SASRACategory."Loan No." := Loans."Loan No.";
                SASRACategory."Loans Category-SASRA" := Loans."loans category-sasra"::Perfoming;
                SASRACategory.Insert;
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
        LoanNumber: Code[20];
        SASRACategory: Record 52185709;
}
