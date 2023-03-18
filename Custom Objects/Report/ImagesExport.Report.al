#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185462 "Images Export"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Images Export.rdlc';

    dataset
    {
        dataitem(Members;Members)
        {
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                PicturesandSigntures.Init;
                PicturesandSigntures."Member No":=Members."No.";
                PicturesandSigntures."Signature No":=Members."No."+'S';
                PicturesandSigntures."Picture No":=Members."No."+'P';
                PicturesandSigntures.Insert;
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
        InStrm: InStream;
        PicturesandSigntures: Record 52185426;
}
