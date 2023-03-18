#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185441 "Bank Import derrick"
{
    Format = VariableText;

    schema
    {
        textelement(root)
        {
            tableelement("Temp Data"; "Temp Data")
            {
                XmlName = 'General';
                fieldelement(a; "Temp Data".No)
                {
                }
                fieldelement(aa; "Temp Data"."Mobile Number")
                {
                    FieldValidate = no;
                }
                fieldelement(ba; "Temp Data"."Member Updated")
                {
                }
                fieldelement(c; "Temp Data"."Account Updated")
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
