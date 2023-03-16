#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185435 "Empty Dividend Action"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Empty Dividend Action.rdlc';

    dataset
    {
        dataitem(Members;Members)
        {
            DataItemTableView = where("Dividend Action"=filter(<>" "));
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Members."Dividend Action" := Members."dividend action"::" ";
                Members.Modify;
            end;

            trigger OnPostDataItem()
            begin
                Message('Dividend Action Updated to Null');
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
