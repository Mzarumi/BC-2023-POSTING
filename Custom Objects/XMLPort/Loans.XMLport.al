#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185452 Loans
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
                XmlName = 'Loans';
                fieldelement(no; Loans."Loan No.")
                {
                    FieldValidate = no;
                }
                fieldelement(r; Loans."Loan Account")
                {
                    FieldValidate = no;
                }
                fieldelement(c; Loans."Loan Product Type")
                {
                    FieldValidate = no;
                }
                fieldelement(egr; Loans."Member No.")
                {
                    FieldValidate = no;
                }
                fieldelement(b; Loans."Application Date")
                {
                    FieldValidate = no;
                }
                fieldelement(grv; Loans."Requested Amount")
                {
                    FieldValidate = no;
                }
                fieldelement(efe; Loans."Approved Amount")
                {
                    FieldValidate = no;
                }
                fieldelement(er; Loans.Interest)
                {
                    FieldValidate = no;
                }
                fieldelement(ffd; Loans."Member Name")
                {
                    FieldValidate = no;
                }
                fieldelement(rhh; Loans.Status)
                {
                    FieldValidate = no;
                }
                fieldelement(eee; Loans.Installments)
                {
                    FieldValidate = no;
                }
                fieldelement(dd; Loans."Disbursement Date")
                {
                    FieldValidate = no;
                }
                fieldelement(jtjt; Loans."Loan Product Type Name")
                {
                    FieldValidate = no;
                }
                fieldelement(sg; Loans.Posted)
                {
                    FieldValidate = no;
                }
                fieldelement(d; Loans."Repayment Frequency")
                {
                }
                fieldelement(sf; Loans."Mode of Disbursement")
                {
                    FieldValidate = no;
                }
                fieldelement(e; Loans."Employer Code")
                {
                    FieldValidate = no;
                }
                fieldelement(gh; Loans."Staff No")
                {
                }
                fieldelement(go; Loans."Recovery Mode")
                {
                }
                fieldelement(bn; Loans."Interest Calculation Method")
                {
                }
                fieldelement(bhj; Loans.Repayment)
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
