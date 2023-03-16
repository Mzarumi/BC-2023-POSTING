#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185424 "Generate Loans Schedule"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Generate Loans Schedule.rdlc';

    dataset
    {
        dataitem(Loans; Loans)
        {
            //DataItemTableView = where("Outstanding Balance" = filter(> 0), "Disbursement Date" = filter(<> ""), "Repayment Start Date" = filter(<> ""), "Loan No." = const(LN00104522));
            column(ReportForNavId_2; 2)
            {
            }

            trigger OnAfterGetRecord()
            begin

                RSchedule.Reset;
                RSchedule.SetRange(RSchedule."Loan No.", "Loan No.");
                RSchedule.DeleteAll;

                QCounter := 0;
                QCounter := 3;

                LoansR.Reset;
                LoansR.SetRange(LoansR."Loan No.", "Loan No.");
                if LoansR.Find('-') then begin

                    Loans.TestField("Disbursement Date");
                    Loans.TestField("Repayment Start Date");


                    LoanAmount := LoansR."Approved Amount";
                    InterestRate := LoansR.Interest;
                    RepayPeriod := LoansR.Installments;
                    InitialInstal := LoansR.Installments;
                    LBalance := LoansR."Approved Amount";
                    RunDate := "Repayment Start Date";

                    InstalNo := 0;

                    repeat
                        InstalNo := InstalNo + 1;

                        if "Interest Calculation Method" = "interest calculation method"::Amortised then begin
                            Loans.TestField(Interest);
                            Loans.TestField(Installments);
                            TotalMRepay := ROUND((InterestRate / 12 / 100) / (1 - Power((1 + (InterestRate / 12 / 100)), -(RepayPeriod))) * (LoanAmount), 0.0001, '>');
                            LInterest := ROUND(LBalance / 100 / 12 * InterestRate, 0.0001, '>');
                            LPrincipal := TotalMRepay - LInterest;
                            Repayment := LPrincipal + LInterest;
                        end;

                        if "Interest Calculation Method" = "interest calculation method"::"Straight Line" then begin
                            Loans.TestField(Interest);
                            Loans.TestField(Installments);
                            LPrincipal := LoanAmount / RepayPeriod;
                            LInterest := (InterestRate / 12 / 100) * LoanAmount;
                        end;

                        if "Interest Calculation Method" = "interest calculation method"::"Reducing Balance" then begin
                            Loans.TestField(Interest);
                            Loans.TestField(Installments);
                            LPrincipal := LoanAmount / RepayPeriod;
                            LInterest := (InterestRate / 12 / 100) * LBalance;
                        end;

                        if "Interest Calculation Method" = "interest calculation method"::"Reducing Flat" then begin
                            Loans.TestField(Repayment);
                            if LBalance < Repayment then
                                LPrincipal := LBalance
                            else
                                LPrincipal := Repayment;
                            LInterest := Interest;
                        end;

                        if GrPrinciple > 0 then begin
                            LPrincipal := 0
                        end else begin
                            LBalance := LBalance - LPrincipal;

                        end;

                        if GrInterest > 0 then
                            LInterest := 0;

                        GrPrinciple := GrPrinciple - 1;
                        GrInterest := GrInterest - 1;
                        Evaluate(RepayCode, Format(InstalNo));

                        RSchedule.Init;
                        RSchedule."Repayment Code" := RepayCode;
                        RSchedule."Loan No." := "Loan No.";
                        RSchedule."Loan Amount" := LoanAmount;
                        RSchedule."Instalment No" := InstalNo;
                        RSchedule."Repayment Date" := RunDate;
                        RSchedule."Member No." := "Member No.";
                        RSchedule."Loan Category" := "Loan Product Type";
                        RSchedule."Monthly Repayment" := LInterest + LPrincipal;
                        RSchedule."Monthly Interest" := LInterest;
                        RSchedule."Principal Repayment" := LPrincipal;
                        RSchedule.Insert;

                        if "Repayment Frequency" = "repayment frequency"::Daily then
                            RunDate := CalcDate('1D', RunDate)
                        else
                            if "Repayment Frequency" = "repayment frequency"::Weekly then
                                RunDate := CalcDate('1W', RunDate)
                            else
                                if "Repayment Frequency" = "repayment frequency"::Monthly then
                                    RunDate := CalcDate('1M', RunDate)
                                else
                                    if "Repayment Frequency" = "repayment frequency"::Quarterly then
                                        RunDate := CalcDate('1Q', RunDate)
                                    else
                                        if "Repayment Frequency" = "repayment frequency"::"Bi-Annual" then
                                            RunDate := CalcDate('6M', RunDate)
                                        else
                                            if "Repayment Frequency" = "repayment frequency"::Yearly then
                                                RunDate := CalcDate('1Y', RunDate);
                    until LBalance < 1
                end;
                Loans.Modify;
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
        CustM: Record "Members";
        LoansR: Record 52185729;
        LoanAmount: Decimal;
        InterestRate: Decimal;
        RepayPeriod: Integer;
        LBalance: Decimal;
        RunDate: Date;
        InstalNo: Decimal;
        RepayInterval: DateFormula;
        TotalMRepay: Decimal;
        LInterest: Decimal;
        LPrincipal: Decimal;
        RepayCode: Code[40];
        GrPrinciple: Integer;
        GrInterest: Integer;
        QPrinciple: Decimal;
        QCounter: Integer;
        InPeriod: DateFormula;
        InitialInstal: Integer;
        InitialGraceInt: Integer;
        RSchedule: Record 52185738;
        LoanApp: Record 52185729;
        PartialSched: Record 52185751;
        AppraisalDetailsSetup: Record 52185745;
        AppraisalSalDetails: Record 52185744;
        LReq: Record 52186096;
        LoanGua: Record 52185739;
        Coll: Record 52185746;
        Found: Boolean;
        SavAcc: Record 52185730;
        ApplDocs: Record 52185725;
        LoanReqDocs: Record 52185728;
        BusinessIncome: Record 52186097;
        //SendSMS: Codeunit 52185466;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        Members: Record "Members";
        LoansTopup: Record 52185742;
        ExternalComm: Record 52185743;
        TotalOffset: Decimal;
        ProdFac: Record 52185690;
        Vend: Record Vendor;
        GLAcc: Record "G/L Account";
        PaymentMethods: Record 52186122;
        LoanRepay: Decimal;
        RepMethods: Record 52186122;
        CompInfo: Record "Company Information";
        EndDateSalo: Date;
        SalProc: Record 52185784;
}
