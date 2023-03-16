#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185452 "Update External STO"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update External STO.rdlc';

    dataset
    {
        dataitem(Loans; Loans)
        {
            RequestFilterFields = Posted, "Recovery Mode", "Loan No.", Status;
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if Loans."Client Bank Code" <> '' then begin
                    Loans."Recovery Mode" := Loans."recovery mode"::"External STO";
                    Loans.Modify;
                end else
                    CurrReport.Skip;
            end;

            trigger OnPostDataItem()
            begin
                Message('Im through Hahhah!');
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
