page 52185425 "Update PIN Change"
{
    PageType = Card;
    SourceTable = "Sky USSD Auth";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Mobile No."; Rec."Mobile No.")
                {
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    Editable = false;
                }
                field("User Status"; Rec."User Status")
                {
                }
                field("Reset PIN"; Rec."Reset PIN")
                {
                }
                field("Force PIN"; Rec."Force PIN")
                {
                    Editable = false;
                }
                field(IMSI; Rec.IMSI)
                {
                    Editable = false;
                    ExtendedDatatype = Masked;
                }
                field(IMEI; Rec.IMEI)
                {
                    Editable = false;
                    ExtendedDatatype = Masked;
                }
                field("Mobile App KYC Login Enabled"; Rec."Mobile App KYC Login Enabled")
                {
                    Caption = 'Mobile App KYC Enabled';
                }
                field("<Clear M-Banking Suspension>"; Rec."Clear M-Banking Suspension")
                {
                    Caption = 'Clear M-Banking Suspension';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Reset IMEI")
            {

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to reset the IMEI Code?') then begin
                        Rec.IMEI := '';
                        Rec.Modify;
                        Message('Reset Successful');
                    end;
                end;
            }
            action("Reset IMSI")
            {

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to reset the IMSI Code?') then begin
                        Rec.IMSI := '';
                        Rec.Modify;
                        Message('Reset Successful');
                    end;
                end;
            }
        }
    }

    trigger OnClosePage()
    var
        SkyAuth: Record "Sky USSD Auth";
    begin

        // SkyMbanking.PinReset;


        if Rec."Clear M-Banking Suspension" then begin
            SkyAuth.Reset;
            SkyAuth.SetRange("Mobile No.", Rec."Mobile No.");
            if (SkyAuth.Find('-')) then begin
                SkyAuth."Login Attempts Action" := 'NONE';
                SkyAuth."Login Attempts Tag" := '';
                Clear(SkyAuth."Login Attempts Action Expiry");
                SkyAuth."Login Attempts Count" := 0;
                SkyAuth."OTP Attempts Action" := 'NONE';
                SkyAuth."OTP Attempts Tag" := '';
                Clear(SkyAuth."OTP Attempts Action Expiry");
                SkyAuth."OTP Attempts Count" := 0;
                SkyAuth."Clear M-Banking Suspension" := false;
                SkyAuth.Modify;
                SkyAuth.Reset;
            end;
        end;
    end;

    trigger OnInit()
    begin
        StatusPermissions.Reset;
        StatusPermissions.SetRange("Reset Mpesa Pin", true);
        StatusPermissions.SetRange("User ID", UserId);
        if not StatusPermissions.FindFirst then
            Error('You do not have the following permission: "Reset Mpesa Pin"');
    end;

    var
        StatusPermissions: Record "Sky Permissions";
        // SkyMbanking: Codeunit "Sky Mbanking";
}

