#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185425 "Delete Progression"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Delete Progression.rdlc';

    dataset
    {
        dataitem("Dividend Progression";"Dividend Progression")
        {
            DataItemTableView = where(Year=filter(2018));
            RequestFilterFields = "Member No","Processing Date","Entry No.";
            column(ReportForNavId_2; 2)
            {
            }

            trigger OnAfterGetRecord()
            begin
                "Dividend Progression".DeleteAll;
            end;

            trigger OnPreDataItem()
            begin
                 if "Dividend Progression".GetFilter("Dividend Progression"."Member No") ='' then
                  Error('Kindly insert a fillter');
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

    var
        hrjob: Record 52185508;
        TempData: Record 52185423;
}
