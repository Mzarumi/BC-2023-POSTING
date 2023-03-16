#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185425 "Div Temp Data Upload"
{
    Format = VariableText;

    schema
    {
        textelement(Node)
        {
            tableelement("Temp Data";"Temp Data")
            {
                AutoReplace = false;
                AutoUpdate = true;
                XmlName = 'TempData';
                fieldelement(A; "Temp Data".No)
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
