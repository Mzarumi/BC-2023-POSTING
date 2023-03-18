#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185906 "Guarantors Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Guarantors Report.rdlc';

    dataset
    {
        dataitem("Loan Guarantors and Security";"Loan Guarantors and Security")
        {
            //DataItemTableView = where("Outstanding Balance" = filter(> 0), Substituted = const(No));
            RequestFilterFields = "Loan No", "Savings Account No./Member No.", "Guarantor Type", "Outstanding Balance";
            column(ReportForNavId_1; 1)
            {
            }
            column(OutstandingBalance; "Loan Guarantors and Security"."Outstanding Balance")
            {
            }
            column(AmountGuaranteed; "Loan Guarantors and Security"."Amount Guaranteed")
            {
            }
            column(LoanNo; "Loan Guarantors and Security"."Loan No")
            {
            }
            column(SavingsAccountNoMemberNo; "Loan Guarantors and Security"."Savings Account No./Member No.")
            {
            }
            column(Name; "Loan Guarantors and Security".Name)
            {
            }
            column(GuarantorName; GuarantorName)
            {
            }
            column(LoaneeName; LoaneeName)
            {
            }
            column(MemberNo; MemberNo)
            {
            }
            column(GuarantorMember; GuarantorMember)
            {
            }
            column(GuarantorType; "Loan Guarantors and Security"."Guarantor Type")
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
            column(LoanType; "Loan Guarantors and Security"."Loan Type")
            {
            }
            column(DepositBalance; DepositBalance)
            {
            }
            column(CollateralRegNo; "Loan Guarantors and Security"."Collateral Reg. No.")
            {
            }
            column(CollateralValue; "Loan Guarantors and Security"."Collateral Value")
            {
            }

            trigger OnAfterGetRecord()
            begin
                GuarantorMember := '';
                GuarantorName := '';
                LoaneeName := '';
                MemberNo := '';
                DepositBalance := 0;
                if "Loan Guarantors and Security"."Guarantor Type" = "Loan Guarantors and Security"."guarantor type"::Guarantor then begin
                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange("No.", "Loan Guarantors and Security"."Savings Account No./Member No.");
                    SavingsAccounts.SetFilter("Product Category", '%1', SavingsAccounts."product category"::"Deposit Contribution");
                    if SavingsAccounts.Find('-') then begin
                        SavingsAccounts.CalcFields("Balance (LCY)");
                        DepositBalance := SavingsAccounts."Balance (LCY)";
                        GuarantorMember := SavingsAccounts."Member No.";
                        GuarantorName := SavingsAccounts.Name;
                    end else begin
                        Members.Reset;
                        Members.SetRange("No.", "Loan Guarantors and Security"."Savings Account No./Member No.");
                        if Members.Find('-') then begin
                            SavingsAccounts.Reset;
                            SavingsAccounts.SetRange("Member No.", "Loan Guarantors and Security"."Savings Account No./Member No.");
                            SavingsAccounts.SetFilter("Product Category", '%1', SavingsAccounts."product category"::"Deposit Contribution");
                            if SavingsAccounts.Find('-') then begin
                                SavingsAccounts.CalcFields("Balance (LCY)");
                                DepositBalance := SavingsAccounts."Balance (LCY)";
                            end;
                            GuarantorMember := Members."No.";
                            GuarantorName := Members.Name;

                        end;
                    end;
                end;


                Loans.Reset;
                Loans.SetRange("Loan No.", "Loan Guarantors and Security"."Loan No");
                if Loans.Find('-') then begin
                    LoaneeName := Loans."Member Name";
                    MemberNo := Loans."Member No.";
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
        Company.CalcFields(Picture);
    end;

    var
        Loans: Record 52185729;
        GuarantorName: Text;
        LoaneeName: Text;
        MemberNo: Code[10];
        GuarantorMember: Code[10];
        SavingsAccounts: Record 52185730;
        Company: Record "Company Information";
        DepositBalance: Decimal;
        Members: Record "Members";
}
