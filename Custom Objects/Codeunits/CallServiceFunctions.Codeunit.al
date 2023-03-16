#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52185424 CallServiceFunctions
{

    trigger OnRun()
    begin

        /*
        FOR j := 1 TO 10 DO BEGIN
            k := RANDOM(5);
            SkyMbanking.CallServiceFunction(k);
        END;
        */

        ResendNewPins;
        Message('DOne');

    end;

    var
        SkyMbanking: Codeunit "Sky Mbanking";
        k: Integer;
        j: Integer;
        SkySMSMessages: Record 52185478;
        SkyUSSDAuth: Record 52185476;
        Source: Option NEW_MEMBER,NEW_ACCOUNT,LOAN_ACCOUNT_APPROVAL,DEPOSIT_CONFIRMATION,CASH_WITHDRAWAL_CONFIRM,LOAN_APPLICATION,LOAN_APPRAISAL,LOAN_GUARANTORS,LOAN_REJECTED,LOAN_POSTED,LOAN_DEFAULTED,SALARY_PROCESSING,TELLER_CASH_DEPOSIT,TELLER_CASH_WITHDRAWAL,TELLER_CHEQUE_DEPOSIT,FIXED_DEPOSIT_MATURITY,INTERACCOUNT_TRANSFER,ACCOUNT_STATUS,STATUS_ORDER,EFT_EFFECTED,ATM_APPLICATION_FAILED,ATM_COLLECTION,MBANKING,MEMBER_CHANGES,CASHIER_BELOW_LIMIT,CASHIER_ABOVE_LIMIT,INTERNETBANKING,CRM,MOBILE_PIN,WITHDRAWAL;

    local procedure ResendNewPins()
    begin

        SkyUSSDAuth.Reset;
        SkyUSSDAuth.SetRange(IMSI, '');
        //SkyUSSDAuth.SETRANGE("Mobile No.",'+254110444395');
        SkyUSSDAuth.SetRange("Pin Resent", false);
        if SkyUSSDAuth.FindFirst then begin
            repeat
                SkySMSMessages.Reset;
                SkySMSMessages.SetRange(receiver, CopyStr(SkyUSSDAuth."Mobile No.", 2, 13));
                SkySMSMessages.SetRange(msg_category, 'MOBILE_PIN');
                if SkySMSMessages.FindFirst then begin
                    if SkySMSMessages.Count = 1 then begin
                        SkyUSSDAuth."Pin Resent" := true;
                        SkyUSSDAuth.Modify;
                        SkyMbanking.SendSms(Source::MOBILE_PIN, SkyUSSDAuth."Mobile No.", SkySMSMessages.msg, SkyUSSDAuth."Account No.", SkyUSSDAuth."Account No.", false, 201, false);
                    end;
                end;
            until SkyUSSDAuth.Next = 0;
        end;
    end;
}
