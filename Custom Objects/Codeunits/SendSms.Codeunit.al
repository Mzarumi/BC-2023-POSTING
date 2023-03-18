#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52185466 SendSms
{

    trigger OnRun()
    begin
    end;

    var
        Sms: Record 52185764;
        Subs: Record 52185771;


    procedure SendSms(Source: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit",InternetBanking,CRM,Agency; Telephone: Text[200]; Textsms: Text[250]; Reference: Text[30]; AccNo: Text[30]; Chargeable: Boolean)
    begin

        //Subs.RESET;


        Sms.Reset;
        if Sms.FindLast then begin

            Sms.Init;
            Sms."Entry No" := Sms."Entry No" + 1;
        end
        else begin
            Sms.Init;
            Sms."Entry No" := 1;
        end;


        Sms.Init;
        Sms.Source := Source;
        Sms."Telephone No" := Replacestring(Telephone, '-', '');
        Sms."Date Entered" := Today;
        Sms."Time Entered" := Time;
        Sms."Entered By" := UserId;
        Sms."SMS Message" := Textsms;
        Sms."Sent To Server" := Sms."sent to server"::No;
        Sms."Document No" := Reference;
        Sms."Account No" := AccNo;
        Sms.IsChargeable := Chargeable;
        Sms.Posted := false;
        Sms.Insert;
    end;


    procedure Replacestring(string: Text[200]; findwhat: Text[30]; replacewith: Text[200]) Newstring: Text[200]
    begin
        while StrPos(string, findwhat) > 0 do
            string := DelStr(string, StrPos(string, findwhat)) + replacewith + CopyStr(string, StrPos(string, findwhat) + StrLen(findwhat));
        Newstring := string;
    end;
}
