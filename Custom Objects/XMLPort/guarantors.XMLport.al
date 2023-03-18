#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185483 guarantors
{
    Format = VariableText;

    schema
    {
        textelement(Name)
        {
            tableelement("Loan Guarantors and Security"; "Loan Guarantors and Security")
            {
                AutoReplace = true;
                XmlName = 'Guarantors';
                fieldelement(a; "Loan Guarantors and Security"."Loan No")
                {
                    FieldValidate = no;
                }
                fieldelement(b; "Loan Guarantors and Security"."Savings Account No./Member No.")
                {
                    FieldValidate = no;
                }
                fieldelement(c; "Loan Guarantors and Security".Name)
                {
                }
                fieldelement(d; "Loan Guarantors and Security"."Outstanding Balance")
                {
                }
                fieldelement(e; "Loan Guarantors and Security".Substituted)
                {
                }
                fieldelement(f; "Loan Guarantors and Security".Date)
                {
                }
                fieldelement(g; "Loan Guarantors and Security"."New Upload")
                {
                }
                fieldelement(h; "Loan Guarantors and Security"."Member No")
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
