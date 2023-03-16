#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185435 "Invalid Loans Import"
{
    Direction = Both;
    Format = VariableText;

    schema
    {
        textelement(root)
        {
            tableelement("Loans Employer Loan No.";"Loans Employer Loan No.")
            {
                AutoUpdate = true;
                XmlName = 'LoansImport';
                fieldelement(a;"Loans Employer Loan No."."Loan No")
                {
                }
                fieldelement(b;"Loans Employer Loan No."."Employer Loan No.")
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

    trigger OnPostXmlPort()
    begin
        Message('Loans Import Complete');
    end;
}
