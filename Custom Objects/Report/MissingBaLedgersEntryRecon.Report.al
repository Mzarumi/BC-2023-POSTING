#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185444 "Missing Ba Ledgers Entry Recon"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Missing Ba Ledgers Entry Recon.rdlc';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            RequestFilterFields = "G/L Account No.", "Posting Date";
            column(ReportForNavId_1; 1)
            {
            }
            column(EntryNo_SavingsLedgerEntry; "G/L Entry"."Entry No.")
            {
            }
            column(CustomerNo_SavingsLedgerEntry; "G/L Entry"."G/L Account No.")
            {
            }
            column(PostingDate_SavingsLedgerEntry; "G/L Entry"."Posting Date")
            {
            }
            column(DocumentNo_SavingsLedgerEntry; "G/L Entry"."Document No.")
            {
            }
            column(Description_SavingsLedgerEntry; "G/L Entry".Description)
            {
            }
            column(Amount_SavingsLedgerEntry; "G/L Entry".Amount)
            {
            }
            column(Diffren; "G/L Entry"."Source No.")
            {
            }
            column(Sno; Sno)
            {
            }

            trigger OnAfterGetRecord()
            begin
                BankAccountLedgerEntry.Reset;
                BankAccountLedgerEntry.SetRange("Entry No.", "G/L Entry"."Entry No.");
                if BankAccountLedgerEntry.Find('-') then
                    CurrReport.Skip;

                Sno += 1;
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
        GLAccount: Record "G/L Account";
        GLEntry: Record "G/L Entry";
        Diffren: Decimal;
        GLBal: Decimal;
        Sno: Integer;
        SavingsBal: Decimal;
        SavingsAccounts: Record 52185731;
        SavingsLedgerEntry: Record 52185733;
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
}
