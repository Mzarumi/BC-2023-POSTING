#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185445 "Fa data"
{
    Format = VariableText;

    schema
    {
        textelement(Name)
        {
            tableelement("Temp Data";"Temp Data")
            {
                AutoReplace = false;
                AutoUpdate = true;
                XmlName = 'Fa';
                fieldelement(a; "Temp Data".No)
                {
                }
                fieldelement(b; "Temp Data"."Mobile Number")
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
