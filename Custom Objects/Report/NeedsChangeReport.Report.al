#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185879 "Needs Change Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Needs Change Report.rdlc';

    dataset
    {
        dataitem("Sky Transactions";"Sky Transactions")
        {
            RequestFilterFields = "Transaction ID", "Session ID";
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                // TransactionID := '';
                // //TransactionID := "Sky Transactions"."Transaction ID";
                // SavingsLedgerEntry.RESET;
                // SavingsLedgerEntry.SETRANGE("Document No.",TransactionID);
                // IF SavingsLedgerEntry.FINDFIRST THEN
                //  ERROR('This transaction has already been posted');
                //
                // IF Loans.GET("Sky Transactions"."Member Account") THEN BEGIN
                //  "Sky Transactions"."Loan No." := "Sky Transactions"."Member Account";
                //  SavingsAccounts.RESET;
                //  SavingsAccounts.SETRANGE("Member No.",Loans."Member No.");
                //  SavingsAccounts.SETRANGE("Product Type",'505');
                //  IF SavingsAccounts.FINDFIRST THEN
                //    "Sky Transactions"."Member Account" := SavingsAccounts."No.";
                //  "Sky Transactions"."Needs Change" := FALSE;
                //
                //  "Sky Transactions".MODIFY;
                // END;
            end;

            trigger OnPostDataItem()
            begin
                Message('Done');
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
        Loans: Record 52185729;
        Members: Record "Members";
        SavingsAccounts: Record 52185730;
        SavingsLedgerEntry: Record 52185732;
        TransactionID: Text;
}
