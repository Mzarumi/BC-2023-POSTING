#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185443 Members
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Name)
        {
            tableelement(Members; Members)
            {
                AutoReplace = false;
                AutoUpdate = true;
                XmlName = 'No';
                fieldelement(a; Members."No.")
                {
                    FieldValidate = yes;
                }
                fieldelement(name; Members.Name)
                {
                }
                fieldelement(dsd; Members."First Name")
                {
                    FieldValidate = no;
                    MinOccurs = Zero;
                }
                fieldelement(bdbdsfbd; Members."Second Name")
                {
                }
                fieldelement(ssbsbb; Members."Last Name")
                {
                }
                fieldelement(r; Members."Payroll/Staff No.")
                {
                }
                fieldelement(wqgqwgqwgqw; Members."Mobile Phone No")
                {
                }
                fieldelement(h; Members."ID No.")
                {
                }
                fieldelement(gegeg; Members."Date of Birth")
                {
                    FieldValidate = no;
                }
                fieldelement(egeg; Members."Current Address")
                {
                }
                fieldelement(l; Members."Employer Code")
                {
                }
                fieldelement(hebe1; Members."Member Category")
                {
                }
                fieldelement(fw; Members.Status)
                {
                }
                fieldelement(re; Members."Account Category")
                {
                }
                fieldelement(a1; Members."Member Type")
                {
                }
                fieldelement(b1; Members."Global Dimension 1 Code")
                {
                }
                fieldelement(b3; Members."Global Dimension 2 Code")
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
