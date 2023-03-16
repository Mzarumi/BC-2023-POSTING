#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185527 "Update Loan ACC/RepaymentMtd"
{
    Format = VariableText;

    schema
    {
        textelement(Nme)
        {
            tableelement(Loans; Loans)
            {
                AutoReplace = false;
                AutoUpdate = true;
                RequestFilterFields = "Loan No.";
                XmlName = 'Loans';
                fieldelement(no; Loans."Loan No.")
                {
                    FieldValidate = no;
                }
                fieldelement(r; Loans."Loan Account")
                {
                    FieldValidate = no;
                }
                fieldelement(go; Loans."Recovery Mode")
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
