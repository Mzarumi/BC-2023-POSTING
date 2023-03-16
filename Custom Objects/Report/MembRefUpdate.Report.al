#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185449 "Memb Ref Update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Memb Ref Update.rdlc';

    dataset
    {
        dataitem(Members;Members)
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(No;Members."No.")
            {
            }
            column(Name;Members.Name)
            {
            }
            column(Balance;BalAmount)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CountNo:=0;
                CoNo:=false;
                SavingsAccounts.Reset;
                SavingsAccounts.SetRange("Member No.",Members."No.");
                SavingsAccounts.SetRange("Product Type",'505');
                if SavingsAccounts.Find('-') then begin
                  SavingsAccounts.CalcFields("Balance (LCY)");
                  BalAmount:=SavingsAccounts."Balance (LCY)";

                SavingsLedgerEntry.Reset;
                SavingsLedgerEntry.SetRange("Customer No.",SavingsAccounts."No.");
                SavingsLedgerEntry.SetRange("Document No.",'OPENBALFOSA2017');
                if SavingsLedgerEntry.Find('-') then begin
                  repeat
                    CountNo+=1;
                    if CountNo>1 then
                          CoNo:=true;
                    until SavingsLedgerEntry.Next=0;
                  end;

                end;

                if CoNo= true then
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

    var
        SavingsLedgerEntry: Record 52185732;
        CoNo: Boolean;
        CountNo: Integer;
        SavingsAccounts: Record 52185730;
        BalAmount: Decimal;
}
