#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/*
Report 52185676 "Member Loan Statement II"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Member Loan Statement II.rdlc';
    PreviewMode = Normal;

    dataset
    { 
        dataitem(members;members)
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1102755000; 1102755000)
            {
            }
            column(USERID; UserId)
            {
            }
            column(PayrollStaffNo_Members; Members."Payroll/Staff No.")
            {
            }
            column(No_Members; Members."No.")
            {
            }
            column(Name_Members; Members.Name)
            {
            }
            column(PageNo_Members; CurrReport.PageNo)
            {
            }
            column(IDNo_Members; Members."ID No.")
            {
            }
            column(Department; Members."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_Members; Members."Global Dimension 2 Code")
            {
            }
            column(Company_Name; Company.Name)
            {
            }
            column(Company_Address; Company.Address)
            {
            }
            column(Company_Picture; Company.Picture)
            {
            }
            column(MobilePhoneNo_Members; Members."Mobile Phone No")
            {
            }
            column(PhoneNo_Members; Members."Phone No.")
            {
            }
            dataitem(Loans; Loans)
            {
                DataItemLink = "Member No." = field("No.");
                DataItemTableView = sorting("Loan No.") where(Posted = const(Yes));
                RequestFilterFields = "Date Filter", "Loan No.", "Loan Product Type";
                column(ReportForNavId_1102755024; 1102755024)
                {
                }
                column(PrincipleBF; PrincipleBF)
                {
                }
                column(LoanNumber; Loans."Loan No.")
                {
                }
                column(ProductType; Loans."Loan Product Type")
                {
                }
                column(LoanProductTypeName_Loans; Loans."Loan Product Type Name")
                {
                }
                column(RequestedAmount; Loans."Requested Amount")
                {
                }
                column(Interest; Loans.Interest)
                {
                }
                column(Installments; Loans.Installments)
                {
                }
                column(LoanPrincipleRepayment; Loans."Loan Principle Repayment")
                {
                }
                column(TotalBalance_Loans; Loans."Total Balance")
                {
                }
                dataitem(loan; UnknownTable52185733)
                {
                    DataItemLink = "Loan No" = field("Loan No.");
                    //DataItemTableView = sorting("Entry No.") order(ascending) where("Transaction Type" = filter(Repayment | Loan), Reversed = const(No));
                    column(ReportForNavId_1102755031; 1102755031)
                    {
                    }
                    column(PostingDate_loan; loan."Posting Date")
                    {
                    }
                    column(DocumentNo_loan; loan."Document No.")
                    {
                    }
                    column(Description_loan; loan.Description)
                    {
                    }
                    column(DebitAmount_Loan; loan."Debit Amount")
                    {
                    }
                    column(CreditAmount_Loan; loan."Credit Amount")
                    {
                    }
                    column(Amount_Loan; loan.Amount)
                    {
                    }
                    column(openBalance_loan; OpenBalance)
                    {
                    }
                    column(CLosingBalance_loan; CLosingBalance)
                    {
                    }
                    column(TransactionType_loan; loan."Transaction Type")
                    {
                    }
                    column(LoanNo; loan."Loan No")
                    {
                    }
                    column(PrincipleBF_loans; PrincipleBF)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        CLosingBalance := CLosingBalance + loan.Amount;
                    end;

                    trigger OnPreDataItem()
                    begin
                        CLosingBalance := PrincipleBF;
                        OpeningBal := PrincipleBF;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    /*PrincipleBF:=0;
                    
                    IF DateFilterBF <> '' THEN BEGIN
                    LoansR.RESET;
                    LoansR.SETRANGE(LoansR."Loan  No.","Loan  No.");
                    LoansR.SETFILTER(LoansR."Date filter",DateFilterBF);
                    IF LoansR.FIND('-') THEN BEGIN
                    LoansR.CALCFIELDS(LoansR."Loan Balances");
                    PrincipleBF:=LoansR."Loan Balances";
                    END;
                    END;
                        */
/*
                end;
            }
            dataitem(LoansI; Loans)
            {
                DataItemLink = "Member No." = field("No.");
                DataItemTableView = sorting("Loan No.") where(Posted = const(Yes));
                RequestFilterFields = "Date Filter";
                column(ReportForNavId_24; 24)
                {
                }
                column(PrincipleBFI; PrincipleBFI)
                {
                }
                column(LoanNumberI; LoansI."Loan No.")
                {
                }
                column(ProductTypeI; LoansI."Loan Product Type")
                {
                }
                column(LoanProductTypeName_LoansI; LoansI."Loan Product Type Name")
                {
                }
                column(RequestedAmountI; LoansI."Requested Amount")
                {
                }
                column(InterestI; LoansI.Interest)
                {
                }
                column(InstallmentsI; LoansI.Installments)
                {
                }
                column(LoanPrincipleRepaymentI; LoansI."Loan Principle Repayment")
                {
                }
                column(TotalBalance_LoansI; LoansI."Total Balance")
                {
                }
                column(OutstandingBalance_LoansI; LoansI."Outstanding Balance")
                {
                }
                column(OutstandingInterest_LoansI; LoansI."Outstanding Interest")
                {
                }
                dataitem(loanI; UnknownTable52185733)
                {
                    DataItemLink = "Loan No" = field("Loan No.");
                    //DataItemTableView = sorting("Entry No.") order(ascending) where("Transaction Type" = filter("Interest Due" | "Interest Paid"), Reversed = const(No));
                    column(ReportForNavId_15; 15)
                    {
                    }
                    column(PostingDate_loanI; loanI."Posting Date")
                    {
                    }
                    column(DocumentNo_loanI; loanI."Document No.")
                    {
                    }
                    column(Description_loanI; loanI.Description)
                    {
                    }
                    column(DebitAmount_LoanI; loanI."Debit Amount")
                    {
                    }
                    column(CreditAmount_LoanI; loanI."Credit Amount")
                    {
                    }
                    column(Amount_LoanI; loanI.Amount)
                    {
                    }
                    column(openBalance_loanI; OpenBalanceI)
                    {
                    }
                    column(CLosingBalance_loanI; CLosingBalanceI)
                    {
                    }
                    column(TransactionType_loanI; loanI."Transaction Type")
                    {
                    }
                    column(LoanNoI; loanI."Loan No")
                    {
                    }
                    column(PrincipleBF_loansI; PrincipleBFI)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        CLosingBalanceI := CLosingBalanceI + loanI.Amount;
                    end;

                    trigger OnPreDataItem()
                    begin
                        CLosingBalanceI := PrincipleBFI;
                        OpeningBali := PrincipleBFI;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    /*PrincipleBF:=0;
                    
                    IF DateFilterBF <> '' THEN BEGIN
                    LoansR.RESET;
                    LoansR.SETRANGE(LoansR."Loan  No.","Loan  No.");
                    LoansR.SETFILTER(LoansR."Date filter",DateFilterBF);
                    IF LoansR.FIND('-') THEN BEGIN
                    LoansR.CALCFIELDS(LoansR."Loan Balances");
                    PrincipleBF:=LoansR."Loan Balances";
                    END;
                    END;
                        */
                        /*

                end;
            }

            trigger OnAfterGetRecord()
            begin

                SharesBF := 0;
                InsuranceBF := 0;
                ShareCapBF := 0;
                XmasBF := 0;
                UnnalocatedBF := 0;
                if DateFilterBF <> '' then begin
                    Cust.Reset;
                    Cust.SetRange(Cust."No.", "No.");
                    Cust.SetFilter(Cust."Date Filter", DateFilterBF);
                    if Cust.Find('-') then begin
                    end;
                end;
            end;

            trigger OnPreDataItem()
            begin

                if Members.GetFilter(Members."Date Filter") <> '' then
                    //DateFilterBF:='..'+ FORMAT(CALCDATE('-1D',Members.GETRANGEMIN(Members."Date Filter")));
                    DateFilterBF := '..' + Format(Members.GetRangeMin(Members."Date Filter"));
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
        Company.Get();
        Company.CalcFields(Company.Picture);
    end;

    var
        no: Integer;
        OpenBalance: Decimal;
        CLosingBalance: Decimal;
        OpenBalanceXmas: Decimal;
        CLosingBalanceXmas: Decimal;
        Cust: Record "Members";
        OpeningBal: Decimal;
        OpeningBali: Decimal;
        PrincipleBFI: Decimal;
        CLosingBalanceI: Decimal;
        OpenBalanceI: Decimal;
        ClosingBal: Decimal;
        FirstRec: Boolean;
        PrevBal: Integer;
        BalBF: Decimal;
        LoansR: Record 52185729;
        DateFilterBF: Text[150];
        SharesBF: Decimal;
        InsuranceBF: Decimal;
        LoanBF: Decimal;
        PrincipleBF: Decimal;
        InterestBF: Decimal;
        ShowZeroBal: Boolean;
        ClosingBalSHCAP: Decimal;
        ShareCapBF: Decimal;
        XmasBF: Decimal;
        Company: Record "Company Information";
        OpenBalInt: Decimal;
        ClosingBalInt: Decimal;
        IntBF: Integer;
        UnnalocatedBF: Decimal;
        ClosingBalUnna: Decimal;
}
*/