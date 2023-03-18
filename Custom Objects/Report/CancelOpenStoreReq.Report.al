#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185451 "Cancel Open Store Req"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Cancel Open Store Req.rdlc';

    dataset
    {
        dataitem("Store Requistion Header"; "Store Requistion Header")
        {
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if ("Store Requistion Header".Status = "Store Requistion Header".Status::Open) and ("Store Requistion Header"."Request date" <= 20201231D) then begin
                    "Store Requistion Header".Status := "Store Requistion Header".Status::Cancelled;
                    "Store Requistion Header".Modify;
                end else
                    CurrReport.Skip;
            end;

            trigger OnPostDataItem()
            begin
                Message('Im done, Hahha!');
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
