table 52185697 "Signatory Application"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "Account No"; Code[20])
        {
            NotBlank = true;
        }
        field(3; Names; Text[50])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                if "Account Type" = "Account Type"::Member then
                    TestField("Member No.");
            end;
        }
        field(4; "Date Of Birth"; Date)
        {

            trigger OnValidate()
            var
                DateofBirthError: Label 'This date cannot be greater than today.';
                MinMemberAge: Text;
            begin

                if "Date Of Birth" > Today then
                    Error(DateofBirthError);
                GeneralSetup.Get;
                MinMemberAge := Format(GeneralSetup."Min. Member Age");

                if "Date Of Birth" > CalcDate(GeneralSetup."Min. Member Age", Today) then
                    Error('Minimum age required is %1', GeneralSetup."Min. Member Age");


                if (CalcDate(GeneralSetup."Max. Age Non-Common Bond", "Date Of Birth")) < Today
                then
                    Error('The member age of %1 is exceeded', GeneralSetup."Max. Age Non-Common Bond");
            end;
        }
        field(5; "Staff/Payroll"; Code[20])
        {
        }
        field(6; "ID Number"; Code[50])
        {
        }
        field(7; Signatory; Boolean)
        {

            trigger OnValidate()
            begin
                if Type <> Type::Member then
                    TestField("PIN Number");
            end;
        }
        field(8; "Must Sign"; Boolean)
        {

            trigger OnValidate()
            begin
                if Type <> Type::Member then
                    TestField("PIN Number");
            end;
        }
        field(9; "Must be Present"; Boolean)
        {
        }
        field(10; Picture; BLOB)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(11; Signature; BLOB)
        {
            Caption = 'Signature';
            SubType = Bitmap;
        }
        field(12; "Expiry Date"; Date)
        {
        }
        field(13; Type; Option)
        {
            OptionCaption = 'Member,Chair Person,Secretary,Treasurer,Vice Chair Persion';
            OptionMembers = Member,"Chair Person",Secretary,Treasurer,"Vice Chair Persion";

            trigger OnValidate()
            begin
                SignatoryApplication.Reset;
                SignatoryApplication.SetRange("Account No", "Account No");
                SignatoryApplication.SetRange(Type, Type);
                if SignatoryApplication.Find('-') then begin
                    if Type <> Type::Member then
                        Error('Error %1', Type);
                end;
                TestField("Account Type", "Account Type"::Member);
                if Type <> Type::Member then
                    TestField("PIN Number");
            end;
        }
        field(14; "Member No."; Code[10])
        {
            TableRelation = IF ("Account Type" = CONST (Member)) Members WHERE ("Customer Type" = FILTER (" " | "Micro finance"),
                                                                             Status = FILTER (Active | New | Dormant),
                                                                             "Group Account No." = FILTER (''));

            trigger OnValidate()
            var
                Members: Record Members;
                ImageData: Record "Image Data";
            begin
                //    Picture:='';
                //    Signature:='';
                Names := '';
                "ID Number" := '';
                "Date Of Birth" := 0D;
                "Staff/Payroll" := '';
                "Phone No." := '';
                "PIN Number" := '';
                if "Account Type" = "Account Type"::Member then begin
                    if Members.Get("Member No.") then begin
                        Names := Members.Name;
                        "ID Number" := Members."ID No.";
                        "Date Of Birth" := Members."Date of Birth";
                        "Staff/Payroll" := Members."Payroll/Staff No.";
                        "Phone No." := Members."Mobile Phone No";
                        //VALIDATE("Phone No.");
                        "PIN Number" := Members."P.I.N Number";

                        ImageData.Reset;
                        ImageData.SetRange(ImageData."Member No", Members."No.");
                        if ImageData.Find('-') then begin
                            ImageData.CalcFields(Picture, Signature);
                            Picture := ImageData.Picture;
                            Signature := ImageData.Signature;
                        end;
                    end;
                end;
                if "Account Type" = "Account Type"::Member then begin
                    if "Member No." <> '' then begin
                        SignatoryApplication.SetRange("Account No", "Account No");
                        SignatoryApplication.SetRange("Member No.", "Member No.");
                        if SignatoryApplication.Find('-') then begin
                            Error('This member is already a signatory within this application');
                        end;
                    end;
                end;
            end;
        }
        field(15; "Entry Type"; Option)
        {
            OptionCaption = 'Initial,Changes';
            OptionMembers = Initial,Changes;
        }
        field(16; "Phone No."; Code[20])
        {

            trigger OnValidate()
            begin
                "Phone No." := DelChr("Phone No.", '=', 'A|B|C|D|E|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|.|,|!|@|#|$|%|^|&|*|(|)|[|]|{|}|/|\|"|;|:|<|>|?|-|_');

                if "Phone No." <> '' then begin

                    ///CountryRegion.GET(Nationality);
                    if (CopyStr("Phone No.", 1, 4)) <> ('+254') then
                        Error('The Mobile phone No. should take the format of ' + '+254');
                    if StrLen("Phone No.") <> 13 then
                        Error('Phone No. should be equal to 13 characters');
                end;
            end;
        }
        field(17; "Account Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Member,Non-Member';
            OptionMembers = Member,"Non-Member";

            trigger OnValidate()
            begin
                "Member No." := '';
            end;
        }
        field(18; "PIN Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Account No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GeneralSetup: Record "General Set-Up";
        SignatoryApplication: Record "Signatory Application";
}

