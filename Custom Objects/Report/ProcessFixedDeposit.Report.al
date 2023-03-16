#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185895 "Process Fixed Deposit"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Process Fixed Deposit.rdlc';
    ProcessingOnly = false;

    dataset
    {
        dataitem("Savings Accounts"; "Savings Accounts")
        {
            DataItemTableView = where("Product Category" = const("Fixed Deposit"), "Fixed Deposit Status" = const(Active), "Balance (LCY)" = filter(> 0));
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin

                // if "Savings Accounts"."FD Maturity Instructions" = "Savings Accounts"."fd maturity instructions"::"Transfer all to Savings" then
                //     FDManagement.RollOver("Savings Accounts", RunDate, JTemplate, JBatch)
                // else
                //     if "Savings Accounts"."FD Maturity Instructions" = "Savings Accounts"."fd maturity instructions"::"Renew Principal" then
                //         FDManagement.Renew("Savings Accounts", RunDate, JTemplate, JBatch)
                //     else
                //         if "Savings Accounts"."FD Maturity Instructions" = "Savings Accounts"."fd maturity instructions"::"Renew Principal & Interest" then
                //             FDManagement.CloseNonRenewable("Savings Accounts", RunDate, JTemplate, JBatch);
                Message(Format(RunDate));
                if CalcDate('-5D', "Savings Accounts"."FD Maturity Date") = Today then begin
                    //  SendMessage:=TRUE;
                    //  LoanGuarantorsandSecurity.RESET;
                    //  LoanGuarantorsandSecurity.SETRANGE("Savings Account No./Member No.","Savings Accounts"."No.");
                    //  IF LoanGuarantorsandSecurity.FIND('-') THEN BEGIN
                    //    REPEAT
                    //      IF Loans.GET(LoanGuarantorsandSecurity."Loan No") THEN BEGIN
                    //        Loans.CALCFIELDS("Outstanding Balance");
                    //        IF Loans."Outstanding Balance"<>0 THEN
                    //        SendMessage:=FALSE;
                    //      END;
                    //      UNTIL LoanGuarantorsandSecurity.NEXT=0;
                    //    END;
                    //    IF SendMessage=TRUE THEN
                    Members.Get("Savings Accounts"."Member No.");
                    //SendSMS.SendSms(Sourcetype::"Fixed Deposit Maturity", Members."Mobile Phone No", 'Your Fixed Deposit will Mature on ' + Format("Savings Accounts"."FD Maturity Date"), '', "Savings Accounts"."Savings Account No.", false);
                end;
            end;

            trigger OnPreDataItem()
            begin

                if RunDate = 0D then
                    RunDate := Today;


                Temp.Get(UserId);

                JTemplate := Temp."Cashier Journal Template";
                JBatch := Temp."Cashier Journal Batch";

                //JTemplate := 'GENERAL';
                //JBatch := 'DEFAULT';

                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", JTemplate);
                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                if GenJournalLine.Find('-') then
                    GenJournalLine.DeleteAll;


                DefaultBatch.Reset;
                DefaultBatch.SetRange(DefaultBatch."Journal Template Name", JTemplate);
                DefaultBatch.SetRange(DefaultBatch.Name, JBatch);
                if DefaultBatch.Find('-') = false then begin

                    DefaultBatch.Init;
                    DefaultBatch."Journal Template Name" := JTemplate;
                    DefaultBatch.Name := JBatch;
                    DefaultBatch.Description := 'Fixed Deposit Journal';
                    DefaultBatch.Validate(DefaultBatch."Journal Template Name");
                    DefaultBatch.Validate(DefaultBatch.Name);
                    DefaultBatch.Insert;
                end;
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
        //FDManagement: Codeunit 52185456;
        RunDate: Date;
        GenJournalLine: Record "Gen. Journal Line";
        FDDays: Integer;
        DefaultBatch: Record "Gen. Journal Batch";
        JTemplate: Code[10];
        JBatch: Code[10];
        Members: Record "Members";
        // SendSMS: Codeunit 52185466;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        Loans: Record 52185729;
        LoanGuarantorsandSecurity: Record 52185739;
        SendMessage: Boolean;
        Temp: Record 52185782;
}
