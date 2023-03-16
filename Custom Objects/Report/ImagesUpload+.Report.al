#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185472 "Images Upload+"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Images Upload+.rdlc';

    dataset
    {
        dataitem("Pictures and Signtures"; "Pictures and Signtures")
        {
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            var
                PicFileName: Text[1024];
                PicFileName2: Text[1024];
            begin
                //???**Francis
                //Import Picture
                //MESSAGE('%1',"Member No");

                "Pictures and Signtures".CalcFields(Picture, Signature);

                if Picture.Hasvalue then
                    Clear(Picture);

                // PicFileName := StrSubstNo('%1%2.JPG', FilePath, "Picture No");
                // if FILE.Exists(PicFileName) then begin
                //     InputFile.Open(PicFileName);
                //     InputFile.CreateInstream(InStream1);
                //     Picture.CreateOutstream(OutStream1);
                //     CopyStream(OutStream1, InStream1);
                //     "Pictures and Signtures".Modify;

                //     InputFile.Close;
                // end;

                //Signature
                if Signature.Hasvalue then
                    Clear(Signature);

                PicFileName2 := StrSubstNo('%1%2.JPG', FilePath2, "Signature No");
                // if FILE.Exists(PicFileName2) then begin
                //     InputFile.Open(PicFileName2);
                //     InputFile.CreateInstream(InStream1);
                //     Signature.CreateOutstream(OutStream1);
                //     CopyStream(OutStream1, InStream1);
                //     "Pictures and Signtures".Modify;

                //     InputFile.Close;
                // end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Done Successfully');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(FilePath; FilePath)
                {
                    ApplicationArea = Basic;
                    Caption = 'Picture Path';
                }
                field(FilePath2; FilePath2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Signature Path';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        FilePath: Text[1024];
        Imge: Codeunit "File Management";
        //PicTable: Record TempBlob;
        InStream1: InStream;
        InputFile: File;
        OutStream1: OutStream;
        TempBlob: Record 52185426;
        FilePath2: Text[1024];
}
