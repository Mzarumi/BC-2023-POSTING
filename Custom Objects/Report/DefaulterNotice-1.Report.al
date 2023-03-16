#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185985 "Defaulter Notice-1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Defaulter Notice-1.rdlc';

    dataset
    {
        dataitem(Members;Members)
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(PhoneNo_Members; Members."Phone No.")
            {
            }
            column(No_Members; Members."No.")
            {
            }
            column(Name_Members; Members.Name)
            {
            }
            column(CompName; CompName)
            {
            }
            dataitem(Loans; Loans)
            {
                DataItemLink = "Member No." = field("No.");
                RequestFilterFields = "Loan No.";
                column(ReportForNavId_2; 2)
                {
                }
                column(OutstandingBalance_Loans; Loans."Outstanding Balance")
                {
                }
                column(LoanNo_Loans; Loans."Loan No.")
                {
                }
                column(ApplicationDate_Loans; Loans."Application Date")
                {
                }
                column(LoanProductType_Loans; Loans."Loan Product Type")
                {
                }
                column(MemberNo_Loans; Loans."Member No.")
                {
                }
                column(RequestedAmount_Loans; Loans."Requested Amount")
                {
                }
                column(ApprovedAmount_Loans; Loans."Approved Amount")
                {
                }
                column(Interest_Loans; Loans.Interest)
                {
                }
                column(MemberName_Loans; Loans."Member Name")
                {
                }
                column(OutstandingInterest_Loans; Loans."Outstanding Interest")
                {
                }
                column(OutstandingBills_Loans; Loans."Outstanding Bills")
                {
                }
                column(Installments_Loans; Loans.Installments)
                {
                }
                column(LoanProductTypeName_Loans; Loans."Loan Product Type Name")
                {
                }
                column(DisbursementDate_Loans; Loans."Disbursement Date")
                {
                }
                column(IssuedDate; IssuedDate)
                {
                }
                column(LastPayDate; LastPayDate)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IssuedDate := CalcDate('30D', Today);

                    LedgerEntries.Reset;
                    LedgerEntries.SetRange("Member No.", "Member No.");
                    LedgerEntries.SetRange("Loan No", "Loan No.");
                    LedgerEntries.SetFilter("Transaction Type", '%1|%2', LedgerEntries."transaction type"::Loan, LedgerEntries."transaction type"::Repayment);
                    if LedgerEntries.FindLast then begin
                        LastPayDate := LedgerEntries."Posting Date";
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CompName := COMPANYNAME;
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
        CompName: Text[100];
        LastPayDate: Date;
        LedgerEntries: Record 52185733;
        IssuedDate: Date;
}
