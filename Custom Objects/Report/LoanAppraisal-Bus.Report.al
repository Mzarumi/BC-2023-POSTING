#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185641 "Loan Appraisal - Bus"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Loan Appraisal - Bus.rdlc';

    dataset
    {
        dataitem(Loans; Loans)
        {
            RequestFilterFields = "Loan No.";
            column(ReportForNavId_1; 1)
            {
            }
            // column(CName; Company.Name)
            // {
            // }
            // column(CAdress; Company.Address)
            // {
            // }
            // column(CPicture; Company.Picture)
            // {
            // }
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
            column(LoanInterest; Loans."Loan Interest Repayment")
            {
            }
            column(RecommendedAmt; Loans."Recommended Amount")
            {
            }
            column(StaffNo; Loans."Staff No")
            {
            }
            // column(MemberDeposits; MemberDeposits)
            // {
            // }
            // column(TotalLoanBal; TotalLoanBal)
            // {
            // }
            // column(CountNo; CountNo)
            // {
            // }
            // column(LoanRecoverd; LoanRecoverd)
            // {
            // }
            // column(MemberDueRetire; MemberDueRetire)
            // {
            // }
            // column(GuarantorMax; GuarantorMax)
            // {
            // }
            // column(SecurityRisk; SecurityRisk)
            // {
            // }
            // column(ReapplicationPeriod; ReapplicationPeriod)
            // {
            // }
            // column(LoanDepositRation; LoanDepositRation)
            // {
            // }
            // column(TotalBasic; TBasic)
            // {
            // }
            // column(TotalEarning; TEarning)
            // {
            // }
            // column(TotalAllowance; TAllowance)
            // {
            // }
            // column(TotalDeductions; TDeductions)
            // {
            // }
            // column(NetSalary; NetSalary)
            // {
            // }
            // column(AdjNet; AdjustedNet)
            // {
            // }
            // column(NetAverageIncome; NetAverageIncome)
            // {
            // }
            // column(QualifyingIncome; QualifyingBusiness)
            // {
            // }
            // column(NetOnDeposits; NetOnDeposits)
            // {
            // }
            // column(ExternalRecovered; TotalExteralRec)
            // {
            // }
            // column(TopupRepayments; TopupRepayments)
            // {
            // }
            // column(Dim1; Dimension1)
            // {
            // }
            // column(Dim2; Dimension2)
            // {
            // }
            // column(DirectorWarning; DirectorWarning)
            // {
            // }
            // column(Currentratio; Currentratio)
            // {
            // }
            // column(StockTurnover; StockTurnover)
            // {
            // }
            // column(Debtratio; Debtratio)
            // {
            // }
            // column(LoanToCurrentasset; LoanToCurrentasset)
            // {
            // }
            // column(InstallmentToNetHousehold; InstallmentToNetHousehold)
            // {
            // }
            // column(QuickRatio; QuickRatio)
            // {
            // }
            dataitem(AllLoans; Loans)
            {
                DataItemLink = "Member No." = field("Member No.");
                //DataItemTableView = where(Posted = const(Yes), "Outstanding Balance" = filter(> 0));
                column(ReportForNavId_18; 18)
                {
                }
                column(LoansLoanNo; AllLoans."Loan No.")
                {
                }
                column(LoansProductType; AllLoans."Loan Product Type")
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
                    // if LoansTopup.Get(AllLoans."Loan No.") then
                    //     CurrReport.Skip;
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

                // trigger OnAfterGetRecord()
                // begin
                //     CountNo := CountNo + 1;
                //     if ProductFactory.Get(Loans."Loan Product Type") then
                //         if CountNo < ProductFactory."Minimum Guarantors" then
                //             GuarantorMax := true;
                //     SecurityTotal := SecurityTotal + "Loan Guarantors and Security"."Amount Guaranteed";
                //     if SecurityTotal < Loans."Requested Amount" then
                //         SecurityRisk := true;
                // end;
            }
            dataitem("Loan Required Documents";"Loan Required Documents")
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
                Deposit_Multiplier := 0;
                RelatedBal := 0;
                NetOnDeposits := 0;
                TopupRepayments := 0;
                AdjustedNet := 0;
                NetSalary := 0;
                TotalExteralRec := 0;
                NetOnSalary := 0;
                QualifyingAmount := 0;
                NewContr := 0;
                Dimension1 := '';
                Dimension2 := '';

                if Members.Get(Loans."Member No.") then begin
                    Dimension1 := Members."Global Dimension 1 Code";
                    Dimension2 := Members."Global Dimension 2 Code";
                end;


                //Qualification on deposits
                MemberDeposits := 0;
                SavingsAccounts.Reset;
                SavingsAccounts.SetRange(SavingsAccounts."Member No.", Loans."Member No.");
                SavingsAccounts.SetRange(SavingsAccounts."Product Category", SavingsAccounts."product category"::"Deposit Contribution");
                if SavingsAccounts.Find('-') then begin
                    SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                    MemberDeposits := SavingsAccounts."Balance (LCY)";
                end;

                if ProductFactory.Get(Loans."Loan Product Type") then
                    Deposit_Multiplier := MemberDeposits * ProductFactory."Ordinary Deposits Multiplier";

                NetOnDeposits := Deposit_Multiplier;

                //Less balances from related loans
                RelatedProduct.Reset;
                RelatedProduct.SetRange("Product Code", ProductFactory."Product ID");
                if RelatedProduct.Find('-') then begin
                    repeat
                        Loan.Reset;
                        Loan.SetRange(Loan."Member No.", Loans."Member No.");
                        Loan.SetRange(Loan.Posted, true);
                        Loan.SetRange(Loan."Loan Product Type", RelatedProduct."Related Product Code");
                        if Loan.Find('-') then begin
                            repeat
                                Loan.CalcFields("Outstanding Balance");
                                RelatedBal := RelatedBal + Loan."Outstanding Balance";
                            until Loan.Next = 0;
                        end;

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
                                        TopupRepayments := TopupRepayments + Loan.Repayment;
                                    until Loan.Next = 0;
                                end;
                            until LoansTopup.Next = 0;
                        end;



                    until RelatedProduct.Next = 0;
                end;

                NetOnDeposits := NetOnDeposits - RelatedBal;

                //contractual shares
                SavAcc.Reset;
                SavAcc.SetRange("Member No.", Loans."Member No.");
                SavAcc.SetRange("Product Category", SavAcc."product category"::"Deposit Contribution");
                if SavAcc.Find('-') then begin
                    if ProductFactory."Minimum Dep. Contribution %" = 0 then begin
                        if SavAcc."Monthly Contribution" < ProductFactory."Maximum Deposit Contribution" then
                            NewContr := ProductFactory."Maximum Deposit Contribution";
                    end else begin
                        if ProductFactory."Maximum Deposit Contribution" > ProductFactory."Minimum Dep. Contribution %" * Loans."Approved Amount" * 0.01 then begin
                            if SavAcc."Monthly Contribution" < ProductFactory."Minimum Contribution" then
                                NewContr := ProductFactory."Maximum Deposit Contribution";
                        end else begin
                            if (SavAcc."Monthly Contribution" < ProductFactory."Minimum Dep. Contribution %" * Loans."Approved Amount" * 0.01) and (SavAcc."Monthly Contribution" < ProductFactory."Minimum Contribution") then
                                NewContr := ProductFactory."Maximum Deposit Contribution";
                        end;
                    end;
                end;

                //Business income
                "Business Expenses" := 0;
                "Cash Sales" := 0;
                "Cost of Sales" := 0;
                "Credit sales" := 0;
                "Current Assets" := 0;
                "Current Assets(Stock)" := 0;
                "Fixed Assets" := 0;
                "Household Income" := 0;
                "Long Term Liabilities" := 0;
                "Short Term Liabilities" := 0;
                //New approach
                FinancialRatios.Reset;
                FinancialRatios.SetRange("Loan No.", Loans."Loan No.");
                if FinancialRatios.Find('-') then begin
                    repeat
                        if FinancialRatios."Financial Classification Code" = FinancialRatios."financial classification code"::"Business Expenses" then
                            "Business Expenses" := "Business Expenses" + FinancialRatios."Amount (LCY)"
                        else
                            if FinancialRatios."Financial Classification Code" = FinancialRatios."financial classification code"::"Cash Sales" then
                                "Cash Sales" := "Cash Sales" + FinancialRatios."Amount (LCY)"
                            else
                                if FinancialRatios."Financial Classification Code" = FinancialRatios."financial classification code"::"Cost of Sales" then
                                    "Cost of Sales" := "Cost of Sales" + "Cost of Sales" + FinancialRatios."Amount (LCY)"
                                else
                                    if FinancialRatios."Financial Classification Code" = FinancialRatios."financial classification code"::"Credit sales" then
                                        "Credit sales" := "Credit sales" + FinancialRatios."Amount (LCY)"
                                    else
                                        if FinancialRatios."Financial Classification Code" = FinancialRatios."financial classification code"::"Current Assets" then
                                            "Current Assets" := "Current Assets" + FinancialRatios."Amount (LCY)"
                                        else
                                            if FinancialRatios."Financial Classification Code" = FinancialRatios."financial classification code"::"Current Assets(Stock)" then
                                                "Current Assets(Stock)" := "Current Assets(Stock)" + FinancialRatios."Amount (LCY)"
                                            else
                                                if FinancialRatios."Financial Classification Code" = FinancialRatios."financial classification code"::"Fixed Assets" then
                                                    "Fixed Assets" := "Fixed Assets" + FinancialRatios."Amount (LCY)"
                                                else
                                                    if FinancialRatios."Financial Classification Code" = FinancialRatios."financial classification code"::"Household Income" then
                                                        "Household Income" := "Household Income" + FinancialRatios."Amount (LCY)"
                                                    else
                                                        if FinancialRatios."Financial Classification Code" = FinancialRatios."financial classification code"::"Short Term Liabilities" then
                                                            "Short Term Liabilities" := "Short Term Liabilities" + FinancialRatios."Amount (LCY)"
                                                        else
                                                            if FinancialRatios."Financial Classification Code" = FinancialRatios."financial classification code"::"Long Term Liabilities" then
                                                                "Long Term Liabilities" := "Long Term Liabilities" + FinancialRatios."Amount (LCY)";
                    until FinancialRatios.Next = 0;
                end;

                //

                //Create ratios
                Equity := ("Current Assets" + "Fixed Assets") - ("Short Term Liabilities" + "Long Term Liabilities");


                if "Short Term Liabilities" > 0 then
                    QuickRatio := ("Current Assets" - "Current Assets(Stock)") / "Short Term Liabilities";


                if "Short Term Liabilities" > 0 then
                    Currentratio := "Current Assets" / "Short Term Liabilities";

                if "Current Assets(Stock)" > 0 then
                    StockTurnover := "Cost of Sales" / "Current Assets(Stock)";

                if Equity > 0 then
                    Debtratio := (("Short Term Liabilities" + "Long Term Liabilities") / Equity) * 0.01;


                if "Current Assets" > 0 then
                    LoanToCurrentasset := (Loans."Requested Amount" / "Current Assets") * 0.01;

                if "Household Income" > 0 then
                    InstallmentToNetHousehold := (Loans.Repayment / "Household Income") * 0.01;


                BusinessIncome.Reset;
                BusinessIncome.SetRange("Loan No.", Loans."Loan No.");
                if BusinessIncome.Find('-') then begin
                    if BusinessIncome.Count < ProductFactory."No. of Salary Times" then
                        Error(NoofSalaryErr);
                    BusinessIncome.CalcSums("Average Amount (External)", "Average Amount (Internal)");
                    NetAverageIncome := (BusinessIncome."Average Amount (External)" + BusinessIncome."Average Amount (Internal)") / ProductFactory."No. Of Months for Appr. Saving";
                    QualifyingBusiness := NetAverageIncome * ProductFactory."Computation %" * Loans.Installments * 0.01;
                    if QualifyingBusiness < 0 then
                        QualifyingBusiness := 0;
                end;

                if NetOnDeposits >= QualifyingBusiness then begin
                    if Loans."Requested Amount" > QualifyingBusiness then begin
                        QualifyingAmount := QualifyingBusiness;
                        Loans."Recommended Amount" := QualifyingAmount;
                    end else begin
                        QualifyingAmount := Loans."Requested Amount";
                        Loans."Recommended Amount" := QualifyingAmount;
                    end;
                end else begin
                    if Loans."Requested Amount" > NetOnDeposits then begin
                        QualifyingAmount := NetOnDeposits;
                        Loans."Recommended Amount" := QualifyingAmount;
                    end else begin
                        QualifyingAmount := Loans."Requested Amount";
                        Loans."Recommended Amount" := QualifyingAmount;
                    end;

                end;

                /*
                //Qualification on salary
                AppraisalSal.RESET;
                AppraisalSal.SETRANGE("Loan No","Loan No.");
                IF AppraisalSal.FIND('-') THEN BEGIN
                  REPEAT
                   IF AppraisalSal.Type=AppraisalSal.Type::Basic THEN
                     TBasic:=TBasic+AppraisalSal.Amount
                   ELSE IF AppraisalSal.Type=AppraisalSal.Type::Earnings THEN
                     TEarning:=AppraisalSal.Amount
                   ELSE IF AppraisalSal.Type=AppraisalSal.Type::"Other Allowances" THEN
                     TAllowance:=TAllowance+AppraisalSal.Amount
                   ELSE IF AppraisalSal.Type=AppraisalSal.Type::"Other Allowances" THEN
                     TDeductions:=TDeductions+AppraisalSal.Amount;
                   UNTIL AppraisalSal.NEXT=0;
                END;
                
                
                //Cleared external effects affecting qualification
                ExternalEff.RESET;
                ExternalEff.SETRANGE("Loan No.","Loan No.");
                ExternalEff.SETRANGE("Affects 2/3 Rule",TRUE);
                IF ExternalEff.FIND('-') THEN BEGIN
                  ExternalEff.CALCSUMS(Amount);
                  TotalExteralRec:=ExternalEff.Amount;
                
                END;
                */

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



                if (MemberDeposits * ProductFactory."Ordinary Deposits Multiplier") - TotalLoanBal < Loans."Requested Amount" then
                    LoanDepositRation := true;



                if Members.Get(Loans."Member No.") then begin
                    if Members."Group Account" = false then begin
                        if Today > CalcDate(Format(GeneralSetUp."Max. Member Age"), Members."Date of Birth") then
                            MemberDueRetire := true;
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

                //Insert Warnings---Directors
                DirectorWarning := true;
                if Members.Get(Loans."Member No.") then begin
                    AccountSignatories.Reset;
                    AccountSignatories.SetRange("ID Number", Members."ID No.");
                    if AccountSignatories.Find('-') then begin
                        repeat
                            Loan.Reset;
                            Loan.SetFilter("Outstanding Bills", '>0');
                            Loan.SetRange("Member No.", AccountSignatories."Account No");
                            if Loan.Find('-') then begin
                                repeat
                                    Loan.CalcFields("Outstanding Bills");
                                    if Loan."Outstanding Bills" > 0 then
                                        DirectorWarning := false;
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
        DCSParameterMatrix: Record 52186091;
        ParameterBold: Boolean;
        ParamContribution: Option "Formula Factor","Flat Rate",Range,Ceiling,Multiplier,Divisor,Frequency,"Sum",Difference,"Graduated Range",Exponential,Terminate,Probability,Floor;
        ParamFormula: Text;
        SavingsAccounts: Record 52185730;
        MemberDeposits: Decimal;
        Loan: Record 52185729;
        TotalLoanBal: Decimal;
        Company: Record "Company Information";
        LoansTopup: Record 52185742;
        CountNo: Integer;
        GuarantorMax: Boolean;
        ProductFactory: Record 52185690;
        LoanRecoverd: Boolean;
        GeneralSetUp: Record 52185689;
        Members: Record "Members";
        MemberDueRetire: Boolean;
        SecurityTotal: Decimal;
        SecurityRisk: Boolean;
        LoanDepositRation: Boolean;
        ReapplicationPeriod: Boolean;
        Deposit_Multiplier: Decimal;
        RelatedProduct: Record 52185750;
        RelatedBal: Decimal;
        NetOnDeposits: Decimal;
        AppraisalSal: Record 52185744;
        TBasic: Decimal;
        TEarning: Decimal;
        TAllowance: Decimal;
        TDeductions: Decimal;
        LoanTopup: Record 52185742;
        TopupRepayments: Decimal;
        AdjustedNet: Decimal;
        NetSalary: Decimal;
        ExternalEff: Record 52185743;
        TotalExteralRec: Decimal;
        NetOnSalary: Decimal;
        QualifyingAmount: Decimal;
        BusinessIncome: Record 52186097;
        NoofSalaryErr: label 'The expected number of salary times have not been factored';
        NetAverageIncome: Decimal;
        QualifyingBusiness: Decimal;
        NewContr: Decimal;
        SavAcc: Record 52185730;
        Dimension1: Code[20];
        Dimension2: Code[20];
        AccountSignatories: Record 52185703;
        DirectorWarning: Boolean;
        Currentratio: Decimal;
        StockTurnover: Decimal;
        Debtratio: Decimal;
        LoanToCurrentasset: Decimal;
        InstallmentToNetHousehold: Decimal;
        FinancialRatios: Record 52185699;
        "Cash Sales": Decimal;
        "Cost of Sales": Decimal;
        "Credit sales": Decimal;
        "Household Income": Decimal;
        "Business Expenses": Decimal;
        "Houselold Expenses": Decimal;
        "Current Assets": Decimal;
        "Fixed Assets": Decimal;
        "Short Term Liabilities": Decimal;
        "Long Term Liabilities": Decimal;
        "Current Assets(Stock)": Decimal;
        Equity: Decimal;
        QuickRatio: Decimal;
}
