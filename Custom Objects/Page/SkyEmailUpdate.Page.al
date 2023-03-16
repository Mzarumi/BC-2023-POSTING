page 52185426 "Sky Email Update"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Sky Email Update Buffer";
    SourceTableView = WHERE(Posted = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Email; Rec.Email)
                {
                }
                field(Validated; Rec.Validated)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Validate Entries")
            {
                Image = ValidateEmailLoggingSetup;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to Validate Emails') then begin
                        j := 0;
                        SkyEmailUpdateBuffer.Reset;
                        SkyEmailUpdateBuffer.SetRange(Validated, false);
                        if SkyEmailUpdateBuffer.FindFirst then begin
                            repeat

                                if Members.Get(SkyEmailUpdateBuffer."Member No.") then
                                    if ValidEmailAddress(SkyEmailUpdateBuffer.Email) then begin
                                        SkyEmailUpdateBuffer.Validated := true;
                                        SkyEmailUpdateBuffer.Modify;
                                        j += 1;
                                    end;
                            until SkyEmailUpdateBuffer.Next = 0;
                        end;
                        Message('Operation Completed. %1 Email(s) Updated', j);
                    end;
                end;
            }
            action("Post Validated")
            {
                Image = ValidateEmailLoggingSetup;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to Post Validated Emails') then begin
                        j := 0;
                        SkyEmailUpdateBuffer.Reset;
                        SkyEmailUpdateBuffer.SetRange(Validated, true);
                        SkyEmailUpdateBuffer.SetRange(Posted, false);
                        if SkyEmailUpdateBuffer.FindFirst then begin
                            repeat
                                if ValidEmailAddress(SkyEmailUpdateBuffer.Email) then begin
                                    if Members.Get(SkyEmailUpdateBuffer."Member No.") then begin
                                        SkyEmailUpdateBuffer.Posted := true;
                                        SkyEmailUpdateBuffer.Validated := true;
                                        SkyEmailUpdateBuffer."Posted By" := UserId;
                                        SkyEmailUpdateBuffer."Date Posted" := Today;
                                        SkyEmailUpdateBuffer.Modify;
                                        Members."E-Mail" := SkyEmailUpdateBuffer.Email;
                                        Members.Modify;

                                        j += 1;
                                    end;
                                end;
                            until SkyEmailUpdateBuffer.Next = 0;
                        end;
                        Message('Operation Completed. %1 Email(s) Updated', j);
                    end;
                end;
            }
        }
    }

    var
        SkyEmailUpdateBuffer: Record "Sky Email Update Buffer";
        //SMTPMail: Codeunit "SMTP Mail";//here
        j: Integer;
        Members: Record Members;

    //[Scope('Internal')]
    procedure ValidEmailAddress(EmailAddress: Text): Boolean
    var
        i: Integer;
        NoOfAtSigns: Integer;
    begin
        EmailAddress := DelChr(EmailAddress, '<>');

        if EmailAddress = '' then
            exit(false);

        if (EmailAddress[1] = '@') or (EmailAddress[StrLen(EmailAddress)] = '@') then
            exit(false);

        for i := 1 to StrLen(EmailAddress) do begin
            if EmailAddress[i] = '@' then
                NoOfAtSigns := NoOfAtSigns + 1
            else
                if EmailAddress[i] = ' ' then
                    exit(false);
        end;

        if NoOfAtSigns <> 1 then
            exit(false);



        exit(true);
    end;
}

