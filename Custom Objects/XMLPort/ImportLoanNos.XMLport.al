#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185510 "Import Loan Nos"
{
    Format = VariableText;

    schema
    {
        textelement("<import_loans>")
        {
            XmlName = 'Import_Loans';
            tableelement("Loans Employer Loan No.";"Loans Employer Loan No.")
            {
                XmlName = 'Import_Loans';
                fieldelement(LoanNo;"Loans Employer Loan No."."Loan No")
                {
                }
                fieldelement(EmpLoanNo;"Loans Employer Loan No."."Employer Loan No.")
                {
                }
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
}
