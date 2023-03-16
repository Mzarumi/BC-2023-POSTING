#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 52185500 "Import Telephone Nos"
{
    Format = VariableText;

    schema
    {
        textelement("<import_bulksms>")
        {
            XmlName = 'Import_BulkSMS';
            tableelement("M-SACCO Bulk SMS Lines";"M-SACCO Bulk SMS Lines")
            {
                XmlName = 'Import_BulkSMS';
                fieldelement(No;"M-SACCO Bulk SMS Lines".No)
                {
                }
                fieldelement(Code;"M-SACCO Bulk SMS Lines".Code)
                {
                }
                fieldelement(Description;"M-SACCO Bulk SMS Lines".Description)
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
