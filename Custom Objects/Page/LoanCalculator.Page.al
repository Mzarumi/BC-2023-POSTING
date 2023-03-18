page 52186341 "Loan Calculator"
{
    PageType = Card;
    SourceTable = "Loan Calculator";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Member No."; Rec."Member No.")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                    Editable = false;
                }
                field("Employer Code"; Rec."Employer Code")
                {
                    Editable = false;
                }
                field("Staff No"; Rec."Staff No")
                {
                    Editable = false;
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                }
                field("Loan Span"; Rec."Loan Span")
                {
                    Editable = false;
                }
                field("Loan Product Type Name"; Rec."Loan Product Type Name")
                {
                }
                field("Max. Loan Allowed"; Rec."Max. Loan Allowed")
                {
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                }
                field(Interest; Rec.Interest)
                {
                }
                field("Total Loan Balance"; Rec."Total Loan Balance")
                {
                }
                field("Deposit Contribution"; Rec."Deposit Contribution")
                {
                }
                field("Deposits Multiplied"; Rec."Deposits Multiplied")
                {
                }
                field("Maximum Credit"; Rec."Maximum Credit")
                {
                }
                field(Installments; Rec.Installments)
                {
                }
                field(Repayment; Rec.Repayment)
                {
                }
                field("Interest Calculation Method"; Rec."Interest Calculation Method")
                {
                }
                field("Repayment Start Date"; Rec."Repayment Start Date")
                {
                }
                field("Loan Repayment"; Rec."Loan Principle Repayment")
                {
                    Editable = false;
                }
                field("Loan Interest Repayment"; Rec."Loan Interest Repayment")
                {
                    Editable = false;
                }
                group("Salary Details")
                {
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                }
                field("Total Earnings"; Rec."Total Earnings")
                {
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                }
                field("Net Income"; Rec."Net Income")
                {
                }
                field("1/3 of Basic"; Rec."1/3 of Basic")
                {
                }
                field("Amount Available for Borrowing"; Rec."Amount Available for Borrowing")
                {
                }
                field("Max. Qualification on Salary"; Rec."Max. Qualification on Salary")
                {
                }
                field("Recommended Amount"; Rec."Recommended Amount")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Generate Repayment  Schedule")
            {
                Image = ReceivableBill;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //Delete schedule
                    RSchedule.Reset;
                    RSchedule.SetRange(RSchedule."Loan No.", Rec."Loan No.");
                    RSchedule.DeleteAll;

                    QCounter := 0;
                    QCounter := 3;
                    LoansR.Reset;
                    LoansR.SetRange(LoansR."Loan No.", Rec."Loan No.");
                    if LoansR.Find('-') then begin

                        Rec.TestField("Disbursement Date");
                        Rec.TestField("Repayment Start Date");


                        LoanAmount := LoansR."Recommended Amount";//"Approved Amount";
                        InterestRate := LoansR.Interest;
                        RepayPeriod := LoansR.Installments;
                        InitialInstal := LoansR.Installments;
                        LBalance := LoansR."Recommended Amount";//"Approved Amount";
                        RunDate := Rec."Repayment Start Date";

                        InstalNo := 0;
                        //Repayment Frequency
                        repeat
                            InstalNo := InstalNo + 1;
                            //kma
                            if Rec."Interest Calculation Method" = Rec."Interest Calculation Method"::Amortised then begin
                                Rec.TestField(Interest);
                                Rec.TestField(Installments);
                                TotalMRepay := Round((InterestRate / 12 / 100) / (1 - Power((1 + (InterestRate / 12 / 100)), -(RepayPeriod))) * (LoanAmount), 0.0001, '>');
                                LInterest := Round(LBalance / 100 / 12 * InterestRate, 0.0001, '>');
                                LPrincipal := TotalMRepay - LInterest;
                            end;

                            if Rec."Interest Calculation Method" = Rec."Interest Calculation Method"::"Straight Line" then begin
                                Rec.TestField(Interest);
                                Rec.TestField(Installments);
                                LPrincipal := LoanAmount / RepayPeriod;
                                LInterest := (InterestRate / 12 / 100) * LoanAmount;
                                //Grace Period Interest
                                //LInterest:=(LInterest*InitialInstal)/(InitialInstal-InitialGraceInt);
                            end;

                            if (Rec."Interest Calculation Method" = Rec."Interest Calculation Method"::"Reducing Balance") or
                              (Rec."Interest Calculation Method" = Rec."Interest Calculation Method"::"Reducing Flat") then begin
                                Rec.TestField(Interest);
                                Rec.TestField(Installments);
                                LPrincipal := LoanAmount / RepayPeriod;
                                LInterest := Round((InterestRate / 12 / 100) * LBalance, 1.0, '>');
                            end;
                            /*
                            IF "Interest Calculation Method"="Interest Calculation Method"::"Straight Line" THEN BEGIN
                            Rec.TestField(Repayment);
                            IF LBalance < Repayment THEN
                            LPrincipal:=LBalance
                            ELSE
                            LPrincipal:=Repayment;
                            LInterest:=Interest;
                            END;
                            */
                            //kma



                            //Grace Period
                            if GrPrinciple > 0 then begin
                                LPrincipal := 0
                            end else begin
                                //IF "Instalment Period" <> InPeriod THEN
                                LBalance := LBalance - LPrincipal;

                            end;

                            if GrInterest > 0 then
                                LInterest := 0;

                            GrPrinciple := GrPrinciple - 1;
                            GrInterest := GrInterest - 1;

                            Evaluate(RepayCode, Format(InstalNo));

                            RSchedule.Init;
                            RSchedule."Repayment Code" := RepayCode;
                            RSchedule."Loan No." := Rec."Loan No.";
                            RSchedule."Loan Amount" := LoanAmount;
                            RSchedule."Instalment No" := InstalNo;
                            RSchedule."Repayment Date" := RunDate;
                            RSchedule."Member No." := Rec."Member No.";
                            RSchedule."Loan Category" := Rec."Loan Product Type";
                            RSchedule."Monthly Repayment" := LInterest + LPrincipal;
                            RSchedule."Monthly Interest" := LInterest;
                            RSchedule."Principal Repayment" := LPrincipal;
                            RSchedule.Insert;


                            //Repayment Frequency
                            if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Daily then
                                RunDate := CalcDate('1D', RunDate)
                            else
                                if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Weekly then
                                    RunDate := CalcDate('1W', RunDate)
                                else
                                    if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Monthly then
                                        RunDate := CalcDate('1M', RunDate)
                                    else
                                        if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Quarterly then
                                            RunDate := CalcDate('1Q', RunDate)
                                        else
                                            if Rec."Repayment Frequency" = Rec."Repayment Frequency"::"Bi-Annual" then
                                                RunDate := CalcDate('6M', RunDate)
                                            else
                                                if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Yearly then
                                                    RunDate := CalcDate('1Y', RunDate);

                        until LBalance < 1

                    end;

                    Commit;
                    LoanApp.Reset;
                    LoanApp.SetRange(LoanApp."Loan No.", Rec."Loan No.");
                    //if LoanApp.Find('-') then
                    //REPORT.Run(52186072, true, false, LoanApp);

                end;
            }
        }
    }

    var
        CustMembr: Record Members;
        LoanProcess: Codeunit "Loans Process";
        UpdateMember: Codeunit "DCS Management";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        GetScore: Codeunit "DCS Management";
        LoansR: Record "Loan Calculator";
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
        RSchedule: Record "Loan Repayment Schedule-Calc";
        LoanApp: Record "Loan Calculator";
        PartialSched: Record "Partial Disbursement Schedule";
        AppraisalDetailsSetup: Record "Appraisal Salary Set-up";
        AppraisalSalDetails: Record "Appraisal Salary Details";
        LReq: Record "Loan Mandatory Requirements";
        LoanGua: Record "Loan Guarantors and Security";
        Coll: Record "Loan Collateral";
        Found: Boolean;
        SavAcc: Record "Savings Accounts";
        ApplDocs: Record "Product Documents";
        LoanReqDocs: Record "Loan Required Documents";
        BusinessIncome: Record "Business Income";
        SendSMS: Codeunit SendSms;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        Members: Record Members;
        LoansTopup: Record "Loans Top up";
        ExternalComm: Record "Other Commitements Clearance";
        TotalOffset: Decimal;
        ProdFac: Record "Product Factory";
        Vend: Record Vendor;
        GLAcc: Record "G/L Account";
        PaymentMethods: Record "Payment Methods";
        LoanRepay: Decimal;
        RepMethods: Record "Payment Methods";
        CompInfo: Record "Company Information";
        EndDateSalo: Date;
        SalProc: Record "Salary Lines";
        BusAppr: Record "Financial Appraisal setup";
        BusApprDet: Record "Business Loan Appraisal";
        TotalLoans: Decimal;
        GenSetup: Record "General Set-Up";
        Cust: Record Customer;
        "******************************************************Controls": Integer;
        ApplicationDetailsEdit: Boolean;
        DisbursementEdit: Boolean;
        ApprovedEdit: Boolean;
}

