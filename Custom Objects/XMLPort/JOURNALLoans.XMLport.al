#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185424 "JOURNAL Loans"
{
    Format = VariableText;

    schema
    {
        textelement(NME)
        {
            tableelement(Resignation; Resignation)
            {
                AutoReplace = true;
                AutoUpdate = false;
                MinOccurs = Zero;
                XmlName = 'JOURNAL';
                fieldelement(a; Resignation."Ln No")
                {
                    FieldValidate = no;
                }
                fieldelement(b; Resignation."STO Effective Date")
                {
                }
                fieldelement(c; Resignation."BNK Code")
                {
                }
                fieldelement(d; Resignation."Account No")
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
