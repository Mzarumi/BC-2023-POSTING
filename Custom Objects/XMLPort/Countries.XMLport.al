#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185448 Countries
{
    Format = VariableText;

    schema
    {
        textelement(Name)
        {
            tableelement("Temp Data";"Temp Data")
            {
                XmlName = 'Countries';
                fieldelement(a; "Temp Data".No)
                {
                }
                fieldelement(b; "Temp Data"."Mobile Number")
                {
                }
                fieldelement(c; "Temp Data"."Member Updated")
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
