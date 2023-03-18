#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185469 "Delegate Officials"
{
    Format = VariableText;

    schema
    {
        textelement(NME)
        {
            tableelement("Delegate Memberss";"Delegate Memberss")
            {
                MinOccurs = Zero;
                XmlName = 'JOURNAL';
                fieldelement(a;"Delegate Memberss".Code)
                {
                    FieldValidate = no;
                }
                fieldelement(b;"Delegate Memberss"."Delegate MNO.")
                {
                }
                fieldelement(c;"Delegate Memberss"."Delegate Name")
                {
                    FieldValidate = no;
                }
                fieldelement(d;"Delegate Memberss".Position)
                {
                }
                fieldelement(e;"Delegate Memberss".Status)
                {
                }
                fieldelement(f;"Delegate Memberss"."Appointment Date")
                {
                }
                fieldelement(g;"Delegate Memberss"."Expiry Date")
                {
                }
                fieldelement(h;"Delegate Memberss"."Electoral Zone")
                {
                }
                fieldelement(i;"Delegate Memberss"."Electoral Zone Name")
                {
                }
                fieldelement(j;"Delegate Memberss"."Global Dimension 1 Code")
                {
                }
                fieldelement(k;"Delegate Memberss"."Global Dimension 1 Name")
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
