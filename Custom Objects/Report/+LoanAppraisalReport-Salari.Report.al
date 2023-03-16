#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185458 "+Loan Appraisal Report-Salari"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/+Loan Appraisal Report-Salari.rdlc';

    dataset
    {
        dataitem(Loans; Loans)
        {
            RequestFilterFields = "Loan No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(CName; Company.Name)
            {
            }
            column(CAdress; Company.Address)
            {
            }
            column(CPicture; Company.Picture)
            {
            }
            column(LoanNo; Loans."Loan No.")
            {
            }
            column(MemberNo; Loans."Member No.")
            {
            }
            column(MemberName; Loans."Member Name")
            {
            }
            column(LoanProduct; Loans."Loan Product Type")
            {
            }
            column(LoanProductName; Loans."Loan Product Type Name")
            {
            }
            column(ApplicationDate; Loans."Application Date")
            {
            }
            column(LoanRequestedAmount; Loans."Requested Amount")
            {
            }
            column(Installment; Loans.Installments)
            {
            }
            column(LoanRepayment; Loans.Repayment)
            {
            }
            column(AverageInt; AvInterest)
            {
            }
            column(RecommendedAmt; Loans."Recommended Amount")
            {
            }
            column(StaffNo; Loans."Staff No")
            {
            }
            column(MemberDeposits; MemberDeposits)
            {
            }
            column(TotalLoanBal; TotalLoanBal)
            {
            }
            column(CountNo; CountNo)
            {
            }
            column(LoanRecoverd; LoanRecoverd)
            {
            }
            column(MemberDueRetire; MemberDueRetire)
            {
            }
            column(GuarantorMax; GuarantorMax)
            {
            }
            column(SecurityRisk; SecurityRisk)
            {
            }
            column(ReapplicationPeriod; ReapplicationPeriod)
            {
            }
            column(LoanDepositRation; LoanDepositRation)
            {
            }
            column(TotalBasic; TBasic)
            {
            }
            column(TotalEarning; TEarning)
            {
            }
            column(TotalAllowance; TAllowance)
            {
            }
            column(TotalDeductions; TDeductions)
            {
            }
            column(NetSalary; NetSalary)
            {
            }
            column(AdjNet; AdjustedNet)
            {
            }
            column(NetOnSalary; NetOnSalary)
            {
            }
            column(NetOnDeposits; NetOnDeposits)
            {
            }
            column(ExternalRecovered; TotalExteralRec)
            {
            }
            column(TopupRepayments; TopupRepayments)
            {
            }
            column(NewRep; NewRepayment)
            {
            }
            column(Dim1; Dimension1)
            {
            }
            column(Dim2; Dimension2)
            {
            }
            column(Mult; Mult)
            {
            }
            column(DepositMult; Deposit_Multiplier)
            {
            }
            column(SalProcessed; SalProcessed)
            {
            }
            column(SelfGua; Loans."Self Guarantee")
            {
            }
            column(CurrBal; CurrLoanBal)
            {
            }
            column(RelatedBal; RelatedBal)
            {
            }
            column(TakeHome; NetTakeHome)
            {
            }
            column(OffsetTotal; OffsetBalance)
            {
            }
            column(MaxDeposit; ProductFactory."Maximum Deposit Contribution")
            {
            }
            column(MonthlyContr; SavAcc."Monthly Contribution")
            {
            }
            column(DirectorWarning; DirectorWarning)
            {
            }
            column(TwoThird; Twothird)
            {
            }
            column(TopUpComms; TopUpComms)
            {
            }
            column(Discmt; DiscAmt)
            {
            }
            column(TExternalEffects; TExternalEffects)
            {
            }
            column(Inactive; Inactive)
            {
            }
            dataitem(AllLoans; Loans)
            {
                DataItemLink = "Member No." = field("Member No.");
                //DataItemTableView = where(Posted=const(Yes),"Outstanding Balance"=filter(>0));
                column(ReportForNavId_18; 18)
                {
                }
                column(LoansLoanNo; AllLoans."Loan No.")
                {
                }
                column(LoansProductType; AllLoans."Loan Product Type")
                {
                }
                column(LoansProductName; AllLoans."Loan Product Type Name")
                {
                }
                column(ApprovedAmount; AllLoans."Approved Amount")
                {
                }
                column(PrincipalRepayment; AllLoans."Loan Principle Repayment")
                {
                }
                column(OutstandingInterest; AllLoans."Outstanding Interest")
                {
                }
                column(OutStandingBalance; AllLoans."Outstanding Balance")
                {
                }
                column(Defaulted; AllLoans.Defaulted)
                {
                }
                column(Repayment; AllLoans.Repayment)
                {
                }

                trigger OnPreDataItem()
                begin
                    if LoansTopup.Get(AllLoans."Loan No.") then
                        CurrReport.Skip;
                end;
            }
            dataitem("Loan Guarantors and Security"; "Loan Guarantors and Security")
            {
                DataItemLink = "Loan No" = field("Loan No.");
                column(ReportForNavId_14; 14)
                {
                }
                column(AccountNo; "Loan Guarantors and Security"."Savings Account No./Member No.")
                {
                }
                column(GuarantorName; "Loan Guarantors and Security".Name)
                {
                }
                column(PayrollNo; "Loan Guarantors and Security"."Staff/Payroll No.")
                {
                }
                column(LoanBalance; "Loan Guarantors and Security"."Loan Balance")
                {
                }
                column(Deposits; "Loan Guarantors and Security"."Deposits/Shares")
                {
                }
                column(NoOfLoanGuranteed; "Loan Guarantors and Security"."No Of Loans Guaranteed")
                {
                }
                column(DifferenceSecurity; DifferenceSec)
                {
                }

                trigger OnAfterGetRecord()
                var
                    LoanGua: Record "Loan Guarantors and Security2";
                begin
                    LoanGua.Reset;
                    LoanGua.SetRange("Loan No", "Loan No");
                    LoanGua.SetRange("Guarantor Type", LoanGua."guarantor type"::Guarantor);
                    if LoanGua.Find('-') then
                        CountNo := LoanGua.Count;




                    DifferenceSec := 0;
                    "Loan Guarantors and Security".CalcSums("Loan Guarantors and Security"."Amount Guaranteed");
                    SecurityTotal := "Loan Guarantors and Security"."Amount Guaranteed";

                    if ProductFactory.Get(Loans."Loan Product Type") then
                        if CountNo < ProductFactory."Minimum Guarantors" then
                            GuarantorMax := true;
                    //SecurityTotal:=SecurityTotal+"Loan Guarantors and Security"."Amount Guaranteed";
                    if SecurityTotal < Loans."Requested Amount" then begin
                        SecurityRisk := true;
                        DifferenceSec := Loans."Requested Amount" - SecurityTotal;
                    end;
                end;
            }
            dataitem("Loan Required Documents"; "Loan Required Documents")
            {
                DataItemLink = "Loan No." = field("Loan No.");
                DataItemTableView = where("Provided ?" = filter(No));
                column(ReportForNavId_36; 36)
                {
                }
                column(DocumentType; "Loan Required Documents"."Document Type")
                {
                }
                column(DocumentNo; "Loan Required Documents"."Document No.")
                {
                }
                column(Description; "Loan Required Documents".Description)
                {
                }
                column(SingleMultiple; "Loan Required Documents"."Single Party/Multiple")
                {
                }
                column(LicenseExpiryDate; "Loan Required Documents"."License Expiry Date")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                CountNo := 0;
                SecurityTotal := 0;
                SecurityRisk := false;
                MemberDueRetire := false;
                GuarantorMax := false;
                LoanRecoverd := false;
                LoanDepositRation := false;
                Twothird := false;
                Deposit_Multiplier := 0;
                RelatedBal := 0;
                NetOnDeposits := 0;
                TopupRepayments := 0;
                AdjustedNet := 0;
                NetSalary := 0;
                TotalExteralRec := 0;
                NetOnSalary := 0;
                QualifyingAmount := 0;
                TDeductions := 0;
                TAllowance := 0;
                TBasic := 0;
                DiscAmt := 0;
                AvInterest := 0;
                NewRepayment := 0;
                CurrLoanBal := 0;
                Dimension1 := '';
                Dimension2 := '';
                Mult := 0;
                NetTakeHome := 0;
                TExternalEffects := 0;
                Inactive := false;

                SalProcessed := false;
                OffsetBalance := 0;
                if Loans."Interest Calculation Method" = Loans."interest calculation method"::Amortised then
                    AvInterest := ((Loans.Repayment * Loans.Installments) - Loans."Approved Amount") / Loans.Installments
                else
                    AvInterest := Loans."Loan Interest Repayment";

                SalProc.Reset;
                SalProc.SetRange("Member No.", Loans."Member No.");
                if SalProc.Find('-') then
                    SalProcessed := false;
                ProductFactory.Get(Loans."Loan Product Type");

                //Qualification on deposits
                MemberDeposits := 0;
                SavingsAccounts.Reset;
                SavingsAccounts.SetRange(SavingsAccounts."Member No.", Loans."Member No.");
                SavingsAccounts.SetRange(SavingsAccounts."Product Category", SavingsAccounts."product category"::"Deposit Contribution");
                if SavingsAccounts.Find('-') then begin
                    SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                    MemberDeposits := SavingsAccounts."Balance (LCY)";
                end;

                Mult := ProductFactory."Ordinary Deposits Multiplier";

                if ProductFactory.Get(Loans."Loan Product Type") then
                    Deposit_Multiplier := MemberDeposits * ProductFactory."Ordinary Deposits Multiplier";

                NetOnDeposits := Deposit_Multiplier;

                //MESSAGE('Dep %1 Deposits Mult %2 ',Deposit_Multiplier,ProductFactory."Ordinary Share Multiplier");

                //Less balances from related loans

                Loan.Reset;
                Loan.SetRange(Loan."Member No.", Loans."Member No.");
                Loan.SetRange(Loan.Posted, true);
                if Loan.Find('-') then begin
                    repeat
                        Loan.CalcFields("Outstanding Balance");
                        RelatedBal := RelatedBal + Loan."Outstanding Balance";
                    until Loan.Next = 0;
                end;

                RelatedProduct.Reset;
                //RelatedProduct.SetRange("Code",ProductFactory."Product ID");
                if RelatedProduct.Find('-') then begin
                    repeat
                        //Topped up loans related product
                        LoansTopup.Reset;
                        LoansTopup.SetRange("Loan No.", "Loan No.");
                        if LoansTopup.Find('-') then begin
                            repeat
                                Loan.Reset;
                                Loan.SetRange("Loan No.", LoansTopup."Loan Top Up");
                                Loan.SetRange("Loan Product Type", RelatedProduct."Related Product Code");
                                if Loan.Find('-') then begin
                                    repeat
                                        CurrLoanBal := CurrLoanBal + LoansTopup."Monthly Repayment";
                                        TopupRepayments := TopupRepayments + Loan.Repayment;
                                        OffsetBalance := OffsetBalance + LoansTopup."Principle Top Up";
                                    until Loan.Next = 0;
                                end;
                            until LoansTopup.Next = 0;
                        end;



                    until RelatedProduct.Next = 0;
                end;




                NetOnDeposits := NetOnDeposits - (RelatedBal + CurrLoanBal - OffsetBalance);

                if Members.Get(Loans."Member No.") then begin
                    Dimension1 := Members."Global Dimension 1 Code";
                    Dimension2 := Members."Global Dimension 2 Code";
                    if Members.Status <> Members.Status::Active then
                        Inactive := true;
                end;

                //contractual shares
                SavAcc.Reset;
                SavAcc.SetRange("Member No.", Loans."Member No.");
                //SavAcc.SetRange("Product Category",SavAcc."product category"::"Deposit Contribution");
                if SavAcc.Find('-') then begin
                    if ProductFactory."Minimum Dep. Contribution %" > 0 then begin
                        if ProductFactory."Minimum Dep. Contribution %" * Loans."Approved Amount" * 0.01 > ProductFactory."Maximum Deposit Contribution" then
                            NewContr := ProductFactory."Maximum Deposit Contribution"
                        else
                            NewContr := ProductFactory."Minimum Dep. Contribution %" * Loans."Approved Amount" * 0.01;
                    end;
                end;

                //MESSAGE('Curr Contr %1 New Contr %2 Prod fact %3',SavAcc."Monthly Contribution",NewContr,ProductFactory."Minimum Dep. Contribution %");
                //Difference
                if NewContr < ProductFactory."Minimum Deposit Contribution" then
                    NewContr := ProductFactory."Minimum Deposit Contribution";

                NewContr := NewContr - SavAcc."Monthly Contribution";



                //IF NewContr<0 THEN
                // NewContr:=0;

                //end of contribution


                //Qualification on salary
                AppraisalSal.Reset;
                //AppraisalSal.SetRange("Loan No","Loan No.");
                if AppraisalSal.Find('-') then begin
                    repeat
                        if AppraisalSal.Type = AppraisalSal.Type::Basic then
                            TBasic := TBasic + AppraisalSal.Amount
                        else
                            if AppraisalSal.Type = AppraisalSal.Type::Earnings then
                                TEarning := AppraisalSal.Amount
                            else
                                if AppraisalSal.Type = AppraisalSal.Type::"Other Allowances" then
                                    TAllowance := TAllowance + AppraisalSal.Amount
                                else
                                    if AppraisalSal.Type = AppraisalSal.Type::Deductions then
                                        TDeductions := TDeductions + AppraisalSal.Amount;
                    until AppraisalSal.Next = 0;
                end;

                //Cleared external effects affecting qualification
                ExternalEff.Reset;
                ExternalEff.SetRange("Loan No.", "Loan No.");
                // ExternalEff.SetRange("Affects 2/3 Rule",true);
                // if ExternalEff.Find('-') then begin
                //   ExternalEff.CalcSums("Monthly Deduction");
                //   TotalExteralRec:=ExternalEff."Monthly Deduction";
                // end;

                //Total cleared effects
                ExternalEff.Reset;
                ExternalEff.SetRange("Loan No.", "Loan No.");
                if ExternalEff.Find('-') then begin
                    ExternalEff.CalcSums(ExternalEff.Amount);
                    TExternalEffects := ExternalEff.Amount;
                end;

                NetSalary := (TBasic + TEarning + TAllowance - TDeductions);
                AdjustedNet := (NetSalary - TAllowance) + (TAllowance * 0.3) + TopupRepayments + TotalExteralRec - NewContr;
                NetOnSalary := (AdjustedNet - (1 / 3 * (TBasic + TEarning))) * Loans.Installments * ProductFactory."Net Salary Multiplier %" * 0.01;
                NewRepayment := (AdjustedNet - (1 / 3 * (TBasic + TEarning)));
                //MESSAGE('Adjnet %1 Tbasic %2 Tearning %3',AdjustedNet,TBasic,TEarning);



                //MESSAGE('Net On salary %1 Installments %2',NetOnSalary,Loans.Installments);

                if Loans."Requested Amount" > NetOnSalary then begin
                    QualifyingAmount := NetOnSalary;
                    Loans."Recommended Amount" := QualifyingAmount;
                end else begin
                    QualifyingAmount := Loans."Requested Amount";
                    Loans."Recommended Amount" := QualifyingAmount;
                end;



                //Toatl top ups
                TopUp.Reset;
                TopUp.SetRange("Loan No.", "Loan No.");
                if TopUp.Find('-') then begin
                    TopUpComms := 0;
                    repeat
                        PCharges.Reset;
                        PCharges.SetRange(PCharges."Product Code", Loans."Loan Product Type");
                        PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"Top up");
                        if PCharges.Find('-') then begin
                            repeat
                                if (PCharges."Use Percentage" = true) and (PCharges."Charging Option" = PCharges."charging option"::"On Approved Amount") then begin
                                    if TopUp."Additional Top Up Commission" = true then
                                        Amt := (Loans."Approved Amount" * (PCharges.Percentage + PCharges."Additional Charge %") / 100)
                                    else
                                        Amt := (Loans."Approved Amount" * (PCharges.Percentage / 100));
                                end else
                                    if (PCharges."Use Percentage" = true) and (PCharges."Charging Option" = PCharges."charging option"::"On Net Amount") then begin
                                        if TopUp."Additional Top Up Commission" = true then
                                            Amt := ((TopUp."Principle Top Up" + TopUp."Interest Top Up") * (PCharges.Percentage + PCharges."Additional Charge %") / 100)
                                        else
                                            Amt := ((TopUp."Principle Top Up" + TopUp."Interest Top Up") * (PCharges.Percentage / 100))
                                    end else
                                        Amt := PCharges."Charge Amount";


                                if Amt < PCharges.Minimum then
                                    Amt := PCharges.Minimum;

                                if Amt > PCharges.Maximum then
                                    Amt := PCharges.Maximum;

                                Amt := Amt * -1;

                                TopUpComms := TopUpComms + Amt;

                            until PCharges.Next = 0;
                        end;


                    until TopUp.Next = 0;
                end;

                //Balancing entry if disbursed via Savings
                //IF LoanApps."All Posting through Savings Ac"=TRUE THEN BEGIN



                // Twothird rule
                if NewRepayment < Loans.Repayment then
                    Twothird := true;


                //Total Loans
                Loan.Reset;
                Loan.SetRange(Loan."Member No.", Loans."Member No.");
                Loan.SetRange(Loan.Posted, true);
                if Loan.Find('-') then begin
                    repeat
                        Loan.CalcFields(Loan."Outstanding Balance");
                        TotalLoanBal := TotalLoanBal + Loan."Outstanding Balance";
                        if Loan."Recovered Loan" <> '' then
                            LoanRecoverd := true;
                    until Loan.Next = 0;
                end;



                //confirmIF NetOnDeposits<Loans."Requested Amount" THEN
                // LoanDepositRation:=TRUE;



                if Members.Get(Loans."Member No.") then begin
                    if Members."Group Account" = false then begin
                        // if Today>CalcDate(Format(GeneralSetUp."Max. Member Age"),Members."Date of Birth") then
                        // MemberDueRetire:=true;
                    end;
                end;

                if ProductFactory.Get(Loans."Loan Product Type") then begin
                    Loan.Reset;
                    Loan.SetRange(Loan."Member No.", Loans."Member No.");
                    Loan.SetRange(Loan."Loan Product Type", Loans."Loan Product Type");
                    Loan.SetRange(Loan.Posted, true);
                    if Loan.Find('-') then begin
                        if Today < CalcDate(Format(ProductFactory."Min. Re-application Period"), Loan."Application Date") then
                            ReapplicationPeriod := true;
                    end;

                end;
                if Loans."Recommended Amount" < 0 then
                    Loans."Recommended Amount" := 0;

                //NetTakeHome := LoanProcess.ComputeCharges(QualifyingAmount, Loans."Loan Product Type", Loans."Loan No.", Loans."Discounted Amount");
                Loans.Modify;

                //Discuting
                Loans2.Reset;
                Loans2.SetRange(Loans2."Discounted Loan No.", Loans."Loan No.");
                if Loans2.Find('-') then begin
                    Loans2.CalcSums(Loans2."Approved Amount");
                    DiscAmt := Loans2."Approved Amount";
                end;





                //Insert Warnings---Directors
                DirectorWarning := false;
                if Members.Get(Loans."Member No.") then begin
                    AccountSignatories.Reset;
                    //AccountSignatories.SetRange("ID Number",Members."ID No.");
                    if AccountSignatories.Find('-') then begin
                        repeat
                            Loan.Reset;
                            Loan.SetFilter("Outstanding Bills", '>0');
                            Loan.SetRange("Member No.", AccountSignatories."Account No");
                            if Loan.Find('-') then begin
                                repeat
                                    Loan.CalcFields("Outstanding Bills");
                                    if (Loan."Outstanding Bills" - Loan.Repayment) > 0 then
                                        DirectorWarning := true;
                                until Loan.Next = 0;
                            end;
                        until AccountSignatories.Next = 0;
                    end;
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

    trigger OnPreReport()
    begin
        Company.Get;
        Company.CalcFields(Company.Picture);
    end;

    var
        DCSParameterMatrix: Record "DCS Parameter Matrix";
        ParameterBold: Boolean;
        ParamContribution: Option "Formula Factor","Flat Rate",Range,Ceiling,Multiplier,Divisor,Frequency,"Sum",Difference,"Graduated Range",Exponential,Terminate,Probability,Floor;
        ParamFormula: Text;
        SavingsAccounts: Record "Savings Accounts";
        MemberDeposits: Decimal;
        Loan: Record Loans;
        TotalLoanBal: Decimal;
        Company: Record "Company Information";
        LoansTopup: Record "Loans Top up";
        CountNo: Integer;
        GuarantorMax: Boolean;
        ProductFactory: Record "Product Factory";
        LoanRecoverd: Boolean;
        GeneralSetUp: Record "General Setup";
        Members: Record Members;
        MemberDueRetire: Boolean;
        SecurityTotal: Decimal;
        SecurityRisk: Boolean;
        LoanDepositRation: Boolean;
        ReapplicationPeriod: Boolean;
        Deposit_Multiplier: Decimal;
        RelatedProduct: Record "Related Product";
        RelatedBal: Decimal;
        NetOnDeposits: Decimal;
        AppraisalSal: Record "Appraisal Salary Details";
        TBasic: Decimal;
        TEarning: Decimal;
        TAllowance: Decimal;
        TDeductions: Decimal;
        LoanTopup: Record "Loans Top up";
        TopupRepayments: Decimal;
        AdjustedNet: Decimal;
        NetSalary: Decimal;
        ExternalEff: Record "Other Commitements Clearance";
        TotalExteralRec: Decimal;
        NetOnSalary: Decimal;
        QualifyingAmount: Decimal;
        AvInterest: Decimal;
        NewContr: Decimal;
        SavAcc: Record "Savings Accounts";
        NewRepayment: Decimal;
        CurrLoanBal: Decimal;
        Dimension1: Code[20];
        Dimension2: Code[20];
        Mult: Decimal;
        NetTakeHome: Decimal;
        //LoanProcess: Codeunit "Loans Process";
        SalProc: Record "Salary Lines";
        SalProcessed: Boolean;
        OffsetBalance: Decimal;
        LoanGuarantorsandSecurity: Record "Loan Guarantors and Security";
        AccountSignatories: Record "Account Signatories";
        DirectorWarning: Boolean;
        MssgDefault: label 'This member has defaulted Loan-:';
        Twothird: Boolean;
        TopUp: Record "Loans Top up";
        PCharges: Record "Loan Product Charges";
        Amt: Decimal;
        TopUpComms: Decimal;
        Loans2: Record Loans;
        DiscAmt: Decimal;
        DifferenceSec: Decimal;
        TExternalEffects: Decimal;
        Inactive: Boolean;
}
