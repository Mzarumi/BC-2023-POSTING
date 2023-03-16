#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185700 "Loan Approved Schedule"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Loan Approved Schedule.rdlc';

    dataset
    {
        dataitem(Loans; Loans)
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(LoanNo; Loans."Loan No.")
            {
            }
            column(MemberNo; Loans."Member No.")
            {
            }
            column(MemberName; Loans."Member Name")
            {
            }
            column(LoanType; Loans."Loan Product Type")
            {
            }
            column(RequestedAmount; Loans."Requested Amount")
            {
            }
            column(ApprovedAmount; Loans."Approved Amount")
            {
            }
            column(Installments; Loans.Installments)
            {
            }
            column(DisbursementDate; Loans."Disbursement Date")
            {
            }
            column(Picture; Company.Picture)
            {
            }
            column(Address; Company.Address)
            {
            }
            column(Company_Name; Company.Name)
            {
            }
            column(EmployerCode; Loans."Employer Code")
            {
            }
            column(Balance; Loans."Outstanding Balance")
            {
            }
            column(Interest; Loans."Outstanding Interest")
            {
            }
            column(SASRA; Loans."Loans Category-SASRA")
            {
            }
            column(OutstandingBills; Loans."Outstanding Bills")
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

    trigger OnPreReport()
    begin
        if Company.Get() then
            Company.CalcFields(Company.Picture);
    end;

    var
        Company: Record "Company Information";
}
