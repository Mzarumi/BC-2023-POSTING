#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185983 "Loans Cleared Early"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Loans Cleared Early.rdlc';

    dataset
    {
        dataitem(Loans; Loans)
        {
            CalcFields = "Outstanding Balance";
            // DataItemTableView = where(Posted = filter(Yes));
            RequestFilterFields = "Loan No.", "Member No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(CName; Company.Name)
            {
            }
            column(CAddress; Company.Address)
            {
            }
            column(CPicture; Company.Picture)
            {
            }
            column(LoanNo; Loans."Loan No.")
            {
            }
            column(LoanType; Loans."Loan Product Type")
            {
            }
            column(ApprovedAmount; Loans."Approved Amount")
            {
            }
            column(ExpectedCompletionDate; Loans."Expected Date of Completion")
            {
            }
            column(DateCleared; DateCleared)
            {
            }
            column(MemberNo; Loans."Member No.")
            {
            }
            column(MemberName; Loans."Member Name")
            {
            }

            trigger OnAfterGetRecord()
            begin
                DateCleared := 0D;
                if Loans."Expected Date of Completion" > Today then begin
                    if Loans."Outstanding Balance" <= 0 then begin
                        CreditLedgerEntry.Reset;
                        CreditLedgerEntry.SetRange(CreditLedgerEntry."Customer No.", Loans."Loan Account");
                        CreditLedgerEntry.SetRange(CreditLedgerEntry."Loan No", Loans."Loan No.");
                        CreditLedgerEntry.SetRange(CreditLedgerEntry."Transaction Type", CreditLedgerEntry."transaction type"::Repayment);
                        if CreditLedgerEntry.Find('+') then
                            DateCleared := CreditLedgerEntry."Posting Date";
                    end;
                end else
                    CurrReport.Skip;
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
        DateCleared: Date;
        CreditLedgerEntry: Record 52185733;
        Company: Record "Company Information";
}
