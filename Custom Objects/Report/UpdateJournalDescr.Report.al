#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185445 "Update Journal Descr"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Journal Descr.rdlc';

    dataset
    {
        dataitem("Gen. Journal Line";"Gen. Journal Line")
        {
            RequestFilterFields = "Journal Template Name","Journal Batch Name";
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                "Gen. Journal Line".Description:=CopyStr("Gen. Journal Line".Description,10,50);
                "Gen. Journal Line".Modify;
            end;
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

    labels
    {
    }
}
