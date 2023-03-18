page 52185722 "Member App Picture & Signature"
{
    Caption = 'Member App Picture & Signature';
    PageType = Card;
    SourceTable = "Member Application";

    layout
    {
        area(content)
        {
            group(Pictures)
            {
                field(Picture; Rec.Picture)
                {
                    Caption = 'Picture';
                    ShowMandatory = true;
                }
            }
            group(Signatures)
            {
                field(Signature; Rec.Signature)
                {
                    Caption = 'Signature';
                }
            }
            group("ID Cards")
            {
                field("ID Card"; Rec."ID Card")
                {
                }
                field("ID Card Back"; Rec."ID Card Back")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Take Picture")
            {
                Caption = 'Take Picture';
                Image = Camera;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = CameraAvailable;

                trigger OnAction()
                begin
                    // IF NOT CameraAvailable THEN
                    //  EXIT;
                    // CameraOptions := CameraOptions.CameraOptions;
                    // CameraOptions.Quality := 100;
                    // CameraProvider.RequestPictureAsync(CameraOptions);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        UpdateControl;
    end;

    trigger OnOpenPage()
    begin
        // CameraAvailable := CameraProvider.IsAvailable;
        // IF CameraAvailable THEN
        //  CameraProvider := CameraProvider.Create;

        UpdateControl;
    end;

    var
        // [RunOnClient]
        // [WithEvents]
        // CameraProvider: DotNet CameraProvider;
        CameraAvailable: Boolean;

    //[Scope('Internal')]
    procedure UpdateControl()
    var
        MemberAppl: Record "Member Application";
    begin
        if MemberAppl.Get(Rec."No.") then begin
            case MemberAppl.Status of
                MemberAppl.Status::Pending, MemberAppl.Status::Approved, MemberAppl.Status::Rejected, MemberAppl.Status::Created:
                    begin
                        CurrPage.Editable := false;
                    end;

                MemberAppl.Status::Open:
                    begin
                        CurrPage.Editable := true;
                    end;
            end;
        end;
    end;

    //trigger CameraProvider::PictureAvailable(PictureName: Text; PictureFilePath: Text)
    var
        File: File;
        OutStream: OutStream;
        Instream: InStream;
    //begin
    // if (PictureName = '') or (PictureFilePath = '') then
    //     exit;
    // File.Open(PictureFilePath);
    // File.CreateInStream(Instream);

    // Picture.CreateOutStream(OutStream);
    // CopyStream(OutStream, Instream);
    // Modify(true);

    // File.Close;
    // if Erase(PictureFilePath) then;
    //end;
}

