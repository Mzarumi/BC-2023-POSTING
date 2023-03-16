#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185515 "Import Emails Update"
{
    Direction = Both;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement(Members; Members)
            {
                AutoUpdate = true;
                XmlName = 'MemberEmail';
                fieldelement(a; Members."No.")
                {
                }
                fieldelement(b; Members."E-Mail")
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
