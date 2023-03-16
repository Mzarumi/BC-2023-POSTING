#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185431 "Update PVs"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update PVs.rdlc';

    dataset
    {
        dataitem("Payments Header"; "Payments Header")
        {
            //DataItemTableView = where(Status = const(Approved), Posted = const(No));
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                "Payments Header".Date := 20191231D;
                "Payments Header"."Payment Release Date" := 20191231D;
                "Payments Header".Modify;
            end;

            trigger OnPreDataItem()
            begin
                if "Payments Header".GetFilter("Payments Header"."No.") = '' then Error('Kindly Selct the PV No');
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
        SavingsAccounts: Record 52185730;
        MPESATransactions: Record 52185759;
}
