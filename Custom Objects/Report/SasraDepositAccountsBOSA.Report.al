#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185715 "Sasra Deposit Accounts BOSA"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Sasra Deposit Accounts BOSA.rdlc';

    dataset
    {
        dataitem("Savings Accounts"; "Savings Accounts")
        {
            RequestFilterFields = "Global Dimension 1 Code", "Balance (LCY)", "Product Type", "Account Category", "Fixed Deposit Status", "Fixed Deposit Type", "FD Maturity Date", "FD Duration", "FD Maturity Instructions", "Fixed Deposit Amount";
            column(ReportForNavId_1; 1)
            {
            }
            column(CompanyInformation_Name; CompanyInformation.Name)
            {
            }
            column(CompanyInformation_Picture; CompanyInformation.Picture)
            {
            }
            column(CompanyAddress; CompanyAddress)
            {
            }
            column(CompanyTelephone; CompanyTelephone)
            {
            }
            column(CommunicationOnline; CommunicationOnline)
            {
            }
            column(Contribution; Contribution)
            {
            }
            column(SNo; "SNo.")
            {
            }
            column(MonthlyContribution; "Savings Accounts"."Monthly Contribution")
            {
            }
            column(FixedDepositStatus_SavingsAccounts; "Savings Accounts"."Fixed Deposit Status")
            {
            }
            column(PhoneNo_SavingsAccounts; "Savings Accounts"."Phone No.")
            {
            }
            column(Balance_SavingsAccounts; "Savings Accounts".Balance)
            {
            }
            column(BalanceLCY_SavingsAccounts; "Savings Accounts"."Balance (LCY)")
            {
            }
            column(Status_SavingsAccounts; "Savings Accounts".Status)
            {
            }
            column(EmployerCode_SavingsAccounts; "Savings Accounts"."Employer Code")
            {
            }
            column(DateofBirth_SavingsAccounts; "Savings Accounts"."Date of Birth")
            {
            }
            column(PayrollStaffNo_SavingsAccounts; "Savings Accounts"."Payroll/Staff No.")
            {
            }
            column(IDNo_SavingsAccounts; "Savings Accounts"."ID No.")
            {
            }
            column(MobilePhoneNo_SavingsAccounts; "Savings Accounts"."Mobile Phone No")
            {
            }
            column(Gender_SavingsAccounts; "Savings Accounts".Gender)
            {
            }
            column(AccountCategory_SavingsAccounts; "Savings Accounts"."Account Category")
            {
            }
            column(ProductType_SavingsAccounts; "Savings Accounts"."Product Name")
            {
            }
            column(MemberNo_SavingsAccounts; "Savings Accounts"."Member No.")
            {
            }
            column(FixedDepositType_SavingsAccounts; "Savings Accounts"."Fixed Deposit Type")
            {
            }
            column(FDMaturityDate_SavingsAccounts; "Savings Accounts"."FD Maturity Date")
            {
            }
            column(NegInterestRate_SavingsAccounts; "Savings Accounts"."Neg. Interest Rate")
            {
            }
            column(FDDuration_SavingsAccounts; "Savings Accounts"."FD Duration")
            {
            }
            column(FDMaturityInstructions_SavingsAccounts; "Savings Accounts"."FD Maturity Instructions")
            {
            }
            column(FixedDepositcertno_SavingsAccounts; "Savings Accounts"."Fixed Deposit cert. no")
            {
            }
            column(FixedDepositAmount_SavingsAccounts; "Savings Accounts"."Fixed Deposit Amount")
            {
            }
            column(SavingsAccountNo_SavingsAccounts; "Savings Accounts"."Savings Account No.")
            {
            }
            column(FDDateRenewed_SavingsAccounts; "Savings Accounts"."FD Date Renewed")
            {
            }
            column(No_SavingsAccounts; "Savings Accounts"."No.")
            {
            }
            column(Name_SavingsAccounts; "Savings Accounts".Name)
            {
            }
            column(GlobalDimension1Code_SavingsAccounts; "Savings Accounts"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_SavingsAccounts; "Savings Accounts"."Global Dimension 2 Code")
            {
            }
            column(BranchName; BranchName)
            {
            }
            column(CommitedAmnt; CommitedAmnt)
            {
            }
            column(LoansGuaranteed; LoansGuaranteed)
            {
            }

            trigger OnAfterGetRecord()
            begin
                "SNo." += 1;
                Contribution := 0;
                CommitedAmnt := 0;
                SavingsLedgerEntry.Reset;
                SavingsLedgerEntry.SetRange("Customer No.", "Savings Accounts"."No.");
                SavingsLedgerEntry.SetFilter("Document No.", "Savings Accounts".GetFilter("Savings Accounts"."Document No. Filter"));
                if SavingsLedgerEntry.Find('-') then begin
                    SavingsLedgerEntry.CalcSums("Amount (LCY)");
                    Contribution := Abs(SavingsLedgerEntry."Amount (LCY)");
                end;
                if "Savings Accounts"."Global Dimension 2 Code" = '' then
                    BranchName := 'Nairobi'
                else
                    DimensionValue.Reset;
                DimensionValue.SetRange(Code, "Savings Accounts"."Global Dimension 2 Code");
                if DimensionValue.Find('-') then begin
                    BranchName := DimensionValue.Name;
                end;
                if "Savings Accounts"."Can Guarantee Loan" = true then begin
                    CommitedAmnt := 0;
                    LoanGuarantorsandSecurity.Reset;
                    LoanGuarantorsandSecurity.SetRange("Savings Account No./Member No.", "Savings Accounts"."No.");
                    LoanGuarantorsandSecurity.SetRange("Member No", "Savings Accounts"."Member No.");
                    LoanGuarantorsandSecurity.SetFilter("Outstanding Balance", '>0');
                    if LoanGuarantorsandSecurity.Find('-') then begin

                        repeat
                            LoanGuarantorsandSecurity.CalcSums("Amount Guaranteed");
                            CommitedAmnt := CommitedAmnt + LoanGuarantorsandSecurity."Amount Guaranteed";
                        until LoanGuarantorsandSecurity.Next = 0;
                    end;
                    if CommitedAmnt > "Savings Accounts"."Balance (LCY)" then
                        CommitedAmnt := "Savings Accounts"."Balance (LCY)" else
                        CommitedAmnt := CommitedAmnt;
                end;
                LoanGuar.Reset;
                LoanGuar.SetRange("Member No", "Savings Accounts"."Member No.");
                LoanGuar.SetRange(Substituted, false);
                if LoanGuar.Find('-') then begin
                    repeat
                        LoanGuar.CalcFields("Outstanding Balance");
                        if LoanGuar."Outstanding Balance" > 0 then begin
                            //NoLoanGua:=(NoLoanGua+'-'+FORMAT(LoanGuar."Loan No"));
                        end;
                    until LoanGuar.Next = 0;
                end;
                LoansGuaranteed := NoLoanGua;
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
        if CompanyInformation.Get then
            CompanyInformation.CalcFields(CompanyInformation.Picture);
        CompanyAddress := CompanyInformation.Address + ' -Post Code: ' + CompanyInformation."Post Code" + ' -City:' + CompanyInformation.City + ' Region: ' + CompanyInformation."Country/Region Code";
        CompanyTelephone := 'Tel: ' + CompanyInformation."Phone No." + ' -Office Tel: ' + CompanyInformation."Phone No. 2";
        CommunicationOnline := 'E-mail: ' + CompanyInformation."E-Mail" + '- Website: ' + CompanyInformation."Home Page";
    end;

    var
        CompanyInformation: Record "Company Information";
        CompanyAddress: Text;
        CompanyTelephone: Text;
        CommunicationOnline: Text;
        "SNo.": Integer;
        SavingsLedgerEntry: Record 52185732;
        Contribution: Decimal;
        BranchName: Code[10];
        DimensionValue: Record "Dimension Value";
        LoanGuarantorsandSecurity: Record 52185739;
        CommitedAmnt: Decimal;
        LoansGuaranteed: Text;
        LoanGuar: Record 52185739;
        NoLoanGua: Code[1024];
}
