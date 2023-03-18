#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185804 "Modify Item Ledger"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Modify Item Ledger.rdlc';

    dataset
    {
        dataitem("Item Ledger Entry";"Item Ledger Entry")
        {
            DataItemTableView = where("Entry Type"=const(Output));
            column(ReportForNavId_1102755000; 1102755000)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //"Item Ledger Entry"."Output From Line No.":='LINE3';
                //MODIFY;
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
