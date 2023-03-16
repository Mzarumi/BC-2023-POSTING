#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185528 "Update Member Status"
{
    Direction = Both;
    Format = VariableText;

    schema
    {
        textelement(meb)
        {
            tableelement(Members; Members)
            {
                AutoUpdate = true;
                XmlName = 'Member';
                fieldelement(a; Members."No.")
                {
                }
                fieldelement(d; Members.Status)
                {
                    FieldValidate = no;
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
