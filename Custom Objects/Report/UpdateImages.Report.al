#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185461 "Update Images"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Images.rdlc';

    dataset
    {
        dataitem("Pictures and Signtures"; "Pictures and Signtures")
        {
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //??Francis
                //*********Insert Uploaded Images to Image Data..
                "Pictures and Signtures".CalcFields("Pictures and Signtures".Signature, "Pictures and Signtures".Picture);
                if not Img.Get("Pictures and Signtures"."Member No") then begin
                    Img.Init;
                    Img."Member No" := "Pictures and Signtures"."Member No";
                    if "Pictures and Signtures".Picture.Hasvalue then
                        Img.Picture := "Pictures and Signtures".Picture;
                    if "Pictures and Signtures".Signature.Hasvalue then
                        Img.Signature := "Pictures and Signtures".Signature;
                    Img.Insert;
                end else begin
                    if "Pictures and Signtures".Picture.Hasvalue then
                        Img.Picture := "Pictures and Signtures".Picture;
                    if "Pictures and Signtures".Signature.Hasvalue then
                        Img.Signature := "Pictures and Signtures".Signature;
                    Img.Modify;
                end;
                //..........
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
        SaccoAccount: Record 52185863;
        Img: Record 52185702;
}
