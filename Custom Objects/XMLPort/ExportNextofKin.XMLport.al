#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185508 "Export Next of Kin"
{
    Direction = Export;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Next of KIN";"Next of KIN")
            {
                XmlName = 'NextKin';
                fieldelement(AccountNo;"Next of KIN"."Account No")
                {
                }
                fieldelement(Name;"Next of KIN".Name)
                {
                }
                fieldelement(Relationship;"Next of KIN".Relationship)
                {
                }
                fieldelement(Beneficiary;"Next of KIN".Beneficiary)
                {
                }
                fieldelement(DOB;"Next of KIN"."Date of Birth")
                {
                }
                fieldelement(IDNO;"Next of KIN"."ID No.")
                {
                }
                fieldelement(Type;"Next of KIN".Type)
                {
                }
                fieldelement(EntitlementCode;"Next of KIN"."BBF Entitlement Code")
                {
                }
                fieldelement(BBF_Entitlement;"Next of KIN"."BBF Entitlement")
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
