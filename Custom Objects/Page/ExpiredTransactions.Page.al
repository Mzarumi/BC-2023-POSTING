page 52186693 "Expired Transactions"
{
    Editable = false;
    PageType = List;
    SourceTable = "Reverse ATM Expired Trans";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Trace ID"; Rec."Trace ID")
                {
                }
                field("Account Number"; Rec."Account Number")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Actioned; Rec.Actioned)
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Reverse Transactions")
            {
                Image = ReverseLines;
                Promoted = true;

                trigger OnAction()
                var
                    SkyPermissions: Record "Sky Permissions";
                    ATMTransactions: Record "ATM Transactions";
                begin
                    SkyPermissions.Reset;
                    SkyPermissions.SetRange("User ID", UserId);
                    SkyPermissions.SetRange("Reverse Sky Transactions", true);
                    if not SkyPermissions.FindFirst then begin
                        Error('You do not have the permission to Reverse Mpesa Transactions');
                    end;


                    if Confirm('Are you sure you want Reverse all this transactions?') then begin
                        ReverseATMExpiredTrans.Reset;
                        ReverseATMExpiredTrans.SetRange(Actioned, false);
                        if ReverseATMExpiredTrans.FindSet then begin
                            repeat

                                ReverseWithdrawalRequest(ReverseATMExpiredTrans."Trace ID");

                                ReverseATMExpiredTrans.Actioned := true;
                                ReverseATMExpiredTrans.Modify;

                            until ReverseATMExpiredTrans.Next = 0;
                        end;
                        Message('Done');
                    end;
                end;
            }
            action("Import Transactions")
            {
                Image = Import;
                Promoted = true;
                ////RunObject = XMLport "Import Expired Transactions";
            }
        }
    }

    var
        Source: Option NEW_MEMBER,NEW_ACCOUNT,LOAN_ACCOUNT_APPROVAL,DEPOSIT_CONFIRMATION,CASH_WITHDRAWAL_CONFIRM,LOAN_APPLICATION,LOAN_APPRAISAL,LOAN_GUARANTORS,LOAN_REJECTED,LOAN_POSTED,LOAN_DEFAULTED,SALARY_PROCESSING,TELLER_CASH_DEPOSIT,TELLER_CASH_WITHDRAWAL,TELLER_CHEQUE_DEPOSIT,FIXED_DEPOSIT_MATURITY,INTERACCOUNT_TRANSFER,ACCOUNT_STATUS,STATUS_ORDER,EFT_EFFECTED,ATM_APPLICATION_FAILED,ATM_COLLECTION,MBANKING,MEMBER_CHANGES,CASHIER_BELOW_LIMIT,CASHIER_ABOVE_LIMIT,INTERNETBANKING,CRM,MOBILE_PIN;
        ReverseATMExpiredTrans: Record "Reverse ATM Expired Trans";

    //[Scope('Internal')]
    procedure ReverseWithdrawalRequest(TraceID: Code[30]): Boolean
    var
        SaccoFee: Decimal;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        SavAcc: Record "Savings Accounts";
        SaccoAccount: Code[20];
        VendorAccount: Code[20];
        MpesaTrans: Record "Sky Transactions";
        TransAmt: Decimal;
        BUser: Record "Banking User Template";
        JTemplate: Code[10];
        JBatch: Code[10];
        DocNo: Code[20];
        PDate: Date;
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
        AccNo: Code[20];
        BalAccNo: Code[20];
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued";
        ExtDoc: Code[20];
        LoanNo: Code[20];
        Dim1: Code[10];
        Dim2: Code[10];
        SystCreated: Boolean;
        RunBal: Decimal;
        AccBal: Decimal;
        Loans: Record Loans;
        IntAmt: Decimal;
        PrAmt: Decimal;
        ATMTrans: Record "ATM Transactions";
        SafcomAcc: Code[20];
        SafcomFee: Decimal;
        MobileWithdrawalsBuffer: Record "ATM Transactions";
        Msg: Text;
        HMember: Record Members;
        FName: Text;
        SkyMbanking: Codeunit "Sky Mbanking";
    begin
        MobileWithdrawalsBuffer.Reset;
        MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer."Trace ID", TraceID);
        MobileWithdrawalsBuffer.SetRange(MobileWithdrawalsBuffer.Source, MobileWithdrawalsBuffer.Source::"M-PESA");
        MobileWithdrawalsBuffer.SetRange(Posted, false);
        MobileWithdrawalsBuffer.SetRange(Reversed, false);
        if MobileWithdrawalsBuffer.Find('-') then begin

            MobileWithdrawalsBuffer.Posted := true;
            MobileWithdrawalsBuffer."Posting Date" := Today;
            MobileWithdrawalsBuffer.Reversed := true;
            MobileWithdrawalsBuffer.Description := 'Reversal due to expired transaction';

            MobileWithdrawalsBuffer."Customer Names" := CopyStr('Reversed By:HARAMBEESACCO\MBANKING', 1, 100);
            MobileWithdrawalsBuffer.Modify;

            if SavAcc.Get(MobileWithdrawalsBuffer."Account No") then begin
                HMember.Get(SavAcc."Member No.");
                FName := HMember."First Name";
                if FName = '' then
                    FName := HMember."Second Name";
                Msg := 'Dear ' + SkyMbanking.FirstName(FName) + ',' + SkyMbanking.NewLine + 'Your transaction of KES ' + Format(MobileWithdrawalsBuffer.Amount) +
                ' has expired. Please try again later.' + SkyMbanking.NewLine + 'REF: ' + MobileWithdrawalsBuffer."Trace ID";
                SkyMbanking.SendSms(Source::MBANKING, SavAcc."Transactional Mobile No", Msg, SavAcc."No.", '', true, 201, false);
            end;
        end;
        // ELSE BEGIN
        //    MobileWithdrawalsBuffer.RESET;
        //    MobileWithdrawalsBuffer.SETRANGE(MobileWithdrawalsBuffer."Trace ID",EntryCode);
        //    MobileWithdrawalsBuffer.SETRANGE(MobileWithdrawalsBuffer.Source,MobileWithdrawalsBuffer.Source::"M-PESA");
        //    //MobileWithdrawalsBuffer.SETRANGE(MobileWithdrawalsBuffer."Account No",SavAcc."No.");
        //    //MobileWithdrawalsBuffer.SETRANGE(MobileWithdrawalsBuffer.Amount,Amount);
        //    MobileWithdrawalsBuffer.SETRANGE(Posted,TRUE);
        //    MobileWithdrawalsBuffer.SETRANGE(Reversed,TRUE);
        //    IF MobileWithdrawalsBuffer.FIND('-') THEN BEGIN
        //
        //        IF SavAcc.GET(MobileWithdrawalsBuffer."Account No") THEN BEGIN
        //            HMember.GET(SavAcc."Member No.");
        //            FName:=HMember."First Name";
        //            IF FName='' THEN
        //              FName := HMember."Second Name";
        //            Msg := 'Dear '+FirstName(FName)+','+NewLine+'The '+MobileWithdrawalsBuffer.Description+' of KES '+FORMAT(MobileWithdrawalsBuffer.Amount)+
        //            ' was unsuccessful. Please try again later'+NewLine+'REF: '+MobileWithdrawalsBuffer."Trace ID";
        //            SendSms(Source::MBANKING,SavAcc."Transactional Mobile No",Msg,SavAcc."No.",'',TRUE,Priority,FALSE);
        //        END;
        //
        //        EXIT(TRUE);
        //    END
        // END;
    end;
}

