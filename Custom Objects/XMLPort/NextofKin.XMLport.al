#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185478 "Next of Kin"
{
    Format = VariableText;

    schema
    {
        textelement(root)
        {
            tableelement("Gen. Journal Line Loans";"Gen. Journal Line Loans")
            {
                AutoReplace = true;
                XmlName = 'kin';
                fieldelement(i;"Gen. Journal Line Loans"."Journal Template Name")
                {
                }
                fieldelement(a;"Gen. Journal Line Loans"."No. of Depreciation Days")
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
