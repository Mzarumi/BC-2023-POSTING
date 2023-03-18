#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52186000 "Anti-Money Laundering Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Anti-Money Laundering Report.rdlc';

    dataset
    {
        dataitem("Cashier Transactions"; "Cashier Transactions")
        {
            //DataItemTableView = where("Account Type" = const(Account), Amount = filter(>= "1,000,000"), Posted = const(Yes), "Transaction Type" = filter("BANKERS CHEQUE" | "CASH DEPOSITS" | "CASH WITHDRWAL" | "CHEQUE DEPOSIT" | "CREDIT CHEQUE DEPOSI" | "CREDIT RECEIPT" | RTGS));
            RequestFilterFields = "Transaction Date";
            column(ReportForNavId_21; 21)
            {
            }
            dataitem("Savings Ledger Entry"; "Savings Ledger Entry")
            {
                DataItemLink = "Customer No." = field("Account No"), "Document No." = field(No);
                //DataItemTableView = where(Amount = filter(<= "-1,000,000" | >= "1,000,000"));
                column(ReportForNavId_1; 1)
                {
                }
                column(PostingDate; PostingDate)
                {
                }
                column(MemberName; MemberName)
                {
                }
                column(MemberNumber; MemberNumber)
                {
                }
                column(CustomerNo_SavingsLedgerEntry; "Savings Ledger Entry"."Customer No.")
                {
                }
                column(IDNumber; IDNumber)
                {
                }
                column(RegistrationDate; RegistrationDate)
                {
                }
                column(DocumentNo_SavingsLedgerEntry; "Savings Ledger Entry"."Document No.")
                {
                }
                column(Description_SavingsLedgerEntry; "Savings Ledger Entry".Description)
                {
                }
                column(Amount_SavingsLedgerEntry; "Savings Ledger Entry".Amount)
                {
                }
                column(EntryNo_SavingsLedgerEntry; "Savings Ledger Entry"."Entry No.")
                {
                }
                column(GLAcc; GLAcc)
                {
                }
                column(GLName; GLName)
                {
                }
                column(BranchCode; BranchCode)
                {
                }
                column(EmpLoyer; Employer)
                {
                }
                column(PostedBy; PostedBy)
                {
                }
                column(PrintedBy; PrintedBy)
                {
                }
                column(PrintedAt; PrintedAt)
                {
                }
                column(FirstDate; FirstDate)
                {
                }
                column(LastDate; LastDate)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    // PostingDate := SkyHarambeePortal.FormatDate("Savings Ledger Entry"."Posting Date");

                    if Members.Get("Savings Ledger Entry"."Member No.") then begin
                        //     if Members."Registration Date" <> 0D then
                        //         RegistrationDate := SkyHarambeePortal.FormatDate(Members."Registration Date")
                        //     else
                        //         RegistrationDate := 'NULL';

                        Employer := Members."Employer Name";
                        PostedBy := CopyStr("Savings Ledger Entry"."User ID", StrPos("Savings Ledger Entry"."User ID", '\') + 1, StrLen("Savings Ledger Entry"."User ID"));
                        MemberName := Members.Name;
                        MemberNumber := Members."No.";
                        IDNumber := Members."ID No.";
                        BranchCode := Members."Global Dimension 2 Code";

                        if SavingsAccounts.Get("Savings Ledger Entry"."Customer No.") then
                            if ProductFactory.Get(SavingsAccounts."Product Type") then
                                if CustomerPostingGroup.Get(ProductFactory."Product Posting Group") then
                                    if GLAccount.Get(CustomerPostingGroup."Receivables Account") then begin
                                        GLAcc := GLAccount."No.";
                                        GLName := GLAccount.Name;
                                    end;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    // "Savings Ledger Entry".SETCURRENTKEY("Posting Date");
                    // "Savings Ledger Entry".FINDFIRST;
                    // FirstDate := SkyHarambeePortal.FormatDate("Savings Ledger Entry"."Posting Date");
                    //
                    // "Savings Ledger Entry".FINDLAST;
                    // LastDate := SkyHarambeePortal.FormatDate("Savings Ledger Entry"."Posting Date");
                end;
            }
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
        PrintedBy := CopyStr(UserId, StrPos(UserId, '\') + 1, StrLen(UserId));
        //PrintedAt := SkyHarambeePortal.FormatDateTimeReverse(CurrentDatetime);
    end;

    var
        PrintedBy: Code[50];
        PrintedAt: Text;
        Members: Record "Members";
        PostingDate: Text;
        //SkyHarambeePortal: Codeunit 52185428;
        RegistrationDate: Text;
        SavingsAccounts: Record 52185730;
        Employer: Text;
        PostedBy: Text;
        MemberName: Text;
        MemberNumber: Text;
        IDNumber: Text;
        BranchCode: Code[10];
        GLAcc: Code[10];
        GLName: Text;
        ProductFactory: Record 52185690;
        CustomerPostingGroup: Record "Customer Posting Group";
        GLAccount: Record "G/L Account";
        FirstDate: Text;
        LastDate: Text;
}
