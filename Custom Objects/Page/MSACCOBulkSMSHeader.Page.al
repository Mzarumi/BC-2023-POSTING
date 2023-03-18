page 52185791 "MSACCO Bulk SMS Header"
{
    SourceTable = "M-SACCO Bulk SMS Header";

    layout
    {
        area(content)
        {
            field(No; Rec.No)
            {
                Editable = false;
            }
            field("Date Entered"; Rec."Date Entered")
            {
                Editable = false;
            }
            field("Time Entered"; Rec."Time Entered")
            {
                Editable = false;
            }
            field("Entered By"; Rec."Entered By")
            {
                Editable = false;
            }
            field("SMS Type"; Rec."SMS Type")
            {
            }
            field("SMS Status"; Rec."SMS Status")
            {
                Editable = false;
            }
            field("Status Date"; Rec."Status Date")
            {
                Editable = false;
            }
            field("Status Time"; Rec."Status Time")
            {
                Editable = false;
            }
            field("Status By"; Rec."Status By")
            {
                Editable = false;
            }
            field(Message_; Rec.Message_)
            {
                Editable = Mssage;
            }
            field("Approval Status"; Rec."Approval Status")
            {
                Editable = false;
            }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
            }
            part(Control1000000012; "M-SACCO Bulk SMS Lines Part")
            {
                Editable = BulkSMSLines;
                SubPageLink = No = FIELD(No);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Send)
            {
                Image = PutawayLines;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    /*
                    IF "Approval Status" <> "Approval Status"::Approved THEN
                        ERROR('This document requires approval');
                        */

                    if UserSetup.Get(UserId) then begin
                        if UserSetup."Post Reversals" = false then
                            Error('You do not have permission');
                    end;

                    if Rec."SMS Status" <> Rec."SMS Status"::Pending then
                        Error('This sms has already been sent');
                    if Confirm('Are you sure you would like to send the SMS(ES)?', false) = true then begin
                        if Rec."SMS Type" <> Rec."SMS Type"::Telephone then begin
                            Rec.TestField(Message_);
                        end;

                        if Rec."SMS Type" = Rec."SMS Type"::Telephone then begin
                            if Rec."Use Line Message" = true then begin
                                Rec.TestField(Message_);
                            end;
                        end;


                        BulkHeader.Reset;
                        BulkHeader.SetRange(BulkHeader.No, Rec.No);
                        if BulkHeader.Find('-') then begin

                            //ALL
                            if BulkHeader."SMS Type" = BulkHeader."SMS Type"::Everyone then begin
                                Vend.Reset;
                                Vend.SetRange(Vend."Product Type", '505');
                                Vend.SetFilter(Vend.Status, '%1|%2|%3', Vend.Status::Active, Vend.Status::Dormant, Vend.Status::Frozen);
                                if Vend.Find('-') then begin
                                    repeat
                                        //SMS MESSAGE
                                        SMSMessage.Reset;
                                        SMSMessage.SetRange("SMS Message", Rec.Message_);
                                        SMSMessage.SetRange("Telephone No", Vend."Mobile Phone No");
                                        if SMSMessage.Find('-') then begin
                                        end
                                        else begin

                                            SMSMessage.Reset;
                                            if SMSMessage.Find('+') then begin
                                                iEntryNo := SMSMessage."Entry No";
                                                iEntryNo := iEntryNo + 1;
                                            end
                                            else begin
                                                iEntryNo := 1;
                                            end;

                                            SMSMessage.Init;
                                            SMSMessage."Entry No" := iEntryNo;
                                            SMSMessage."Document No" := '';
                                            SMSMessage."Account No" := Vend."No.";
                                            SMSMessage."Date Entered" := Today;
                                            SMSMessage."Time Entered" := Time;
                                            SMSMessage.Source := SMSMessage.Source::MSACCO;
                                            SMSMessage."Entered By" := UserId;
                                            SMSMessage."Sent To Server" := SMSMessage."Sent To Server"::No;
                                            SMSMessage."SMS Message" := Rec.Message_;
                                            SMSMessage."Telephone No" := Vend."Mobile Phone No";
                                            if Vend."Mobile Phone No" <> '' then
                                                SMSMessage.Insert;
                                        end;
                                    until Vend.Next = 0
                                end;
                            end;


                            //DIMENSION
                            if BulkHeader."SMS Type" = BulkHeader."SMS Type"::Dimension then begin
                                BulkLines.Reset;
                                BulkLines.SetRange(BulkLines.No, Rec.No);
                                if BulkLines.Find('-') then begin
                                    repeat

                                        Vend.Reset;
                                        Vend.SetRange(Vend."Product Type", '505');
                                        Vend.SetFilter(Vend.Status, '%1|%2|%3', Vend.Status::Active, Vend.Status::Dormant, Vend.Status::Frozen);
                                        if Vend.Find('-') then begin
                                            repeat
                                                //SMS MESSAGE
                                                SMSMessage.Reset;
                                                if SMSMessage.Find('+') then begin
                                                    iEntryNo := SMSMessage."Entry No";
                                                    iEntryNo := iEntryNo + 1;
                                                end
                                                else begin
                                                    iEntryNo := 1;
                                                end;

                                                SMSMessage.Init;
                                                SMSMessage."Entry No" := iEntryNo;
                                                SMSMessage."Document No" := '';
                                                SMSMessage."Account No" := Vend."No.";
                                                SMSMessage."Date Entered" := Today;
                                                SMSMessage."Time Entered" := Time;
                                                SMSMessage.Source := SMSMessage.Source::MSACCO;
                                                SMSMessage."Entered By" := UserId;
                                                SMSMessage."Sent To Server" := SMSMessage."Sent To Server"::No;
                                                SMSMessage."SMS Message" := Rec.Message_;
                                                SMSMessage."Telephone No" := Vend."Mobile Phone No";
                                                if Vend."Mobile Phone No" <> '' then
                                                    SMSMessage.Insert;

                                            until Vend.Next = 0
                                        end;

                                    until BulkLines.Next = 0
                                end;
                            end;


                            //Telephone
                            if BulkHeader."SMS Type" = BulkHeader."SMS Type"::Telephone then begin
                                BulkLines.Reset;
                                BulkLines.SetRange(BulkLines.No, Rec.No);
                                if BulkLines.Find('-') then begin
                                    repeat

                                        //SMS MESSAGE
                                        SMSMessage.Reset;
                                        if SMSMessage.Find('+') then begin
                                            iEntryNo := SMSMessage."Entry No";
                                            iEntryNo := iEntryNo + 1;
                                        end
                                        else begin
                                            iEntryNo := 1;
                                        end;



                                        SMSMessage.Init;
                                        SMSMessage."Entry No" := iEntryNo;
                                        SMSMessage."Document No" := '';
                                        SMSMessage."Account No" := BulkLines.Code;
                                        SMSMessage."Date Entered" := Today;
                                        SMSMessage."Time Entered" := Time;
                                        SMSMessage.Source := SMSMessage.Source::MSACCO;
                                        SMSMessage."Entered By" := UserId;
                                        SMSMessage."Sent To Server" := SMSMessage."Sent To Server"::No;
                                        if Rec."Use Line Message" = true then begin
                                            SMSMessage."SMS Message" := Rec.Message_;
                                        end
                                        else begin
                                            SMSMessage."SMS Message" := Rec.Message_;
                                        end;

                                        SMSMessage."Telephone No" := BulkLines.Code;
                                        if BulkLines.Code <> '' then
                                            SMSMessage.Insert;

                                    until BulkLines.Next = 0
                                end;
                            end;


                        end;

                        Rec."SMS Status" := Rec."SMS Status"::Sent;
                        Rec."Status Date" := Today;
                        Rec."Status Time" := Time;
                        Rec."Status By" := UserId;
                        Rec.Modify;

                    end;

                end;
            }
            action("Import Telephone Nos")
            {
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    if Rec."SMS Type" <> Rec."SMS Type"::Telephone then begin
                        Error('SMS Type must be Telephone.');
                    end;

                    BulkHeader.Reset;
                    BulkHeader.SetRange(BulkHeader.No, Rec.No);
                    if BulkHeader.Find('-') then begin
                        BulkLines.Reset;
                        BulkLines.SetRange(BulkLines.No, BulkHeader.No);
                        XMLPORT.Run(52185690);
                    end;
                end;
            }
            separator(Action4)
            {
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        UpdateControl();
    end;

    var
        BulkHeader: Record "M-SACCO Bulk SMS Header";
        BulkLines: Record "M-SACCO Bulk SMS Lines";
        Vend: Record "Savings Accounts";
        SMSMessage: Record "M-SACCO SMS Messages";
        iEntryNo: Integer;
        StatusPermissions: Record "Credit Ledger Entry";
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batches,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,"HRTransport Request",HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation","Overdraft ",BLA,"Member Editable","Member Refund",FosaAct,mpesaTrans,"change Pin","Bulk SMS";
        text001: Label 'Status must be Open';
        text002: Label 'Status must be Pending';
        Mssage: Boolean;
        UseHeader: Boolean;
        BulkSMSLines: Boolean;
        UserSetup: Record "User Setup";

    //[Scope('Internal')]
    procedure UpdateControl()
    begin
        if Rec.Status = Rec.Status::Open then begin
            Mssage := true;
            UseHeader := true;
            BulkSMSLines := true;
        end;

        if Rec.Status = Rec.Status::Pending then begin
            Mssage := false;
            UseHeader := false;
            BulkSMSLines := false;
        end;

        if Rec.Status = Rec.Status::Rejected then begin
            Mssage := false;
            UseHeader := false;
            BulkSMSLines := false;
        end;


        if Rec.Status = Rec.Status::Approved then begin
            Mssage := false;
            UseHeader := false;
            BulkSMSLines := false;
        end;
    end;
}

