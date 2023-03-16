#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185426 "Dividend Status"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Dividend Status.rdlc';

    dataset
    {
        dataitem(Members;Members)
        {
            column(ReportForNavId_2; 2)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Members."Dividend Action":=Members."dividend action"::" ";
                  Members.Modify;
            end;
        }
        dataitem("Temp Data";"Temp Data")
        {
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnPreDataItem()
            begin
                "Temp Data".DeleteAll;
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
        TempData: Record 52185423;
}
