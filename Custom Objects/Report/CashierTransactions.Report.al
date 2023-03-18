#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185687 "Cashier Transactions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Cashier Transactions.rdlc';

    dataset
    {
        dataitem("Cashier Transactions"; "Cashier Transactions")
        {
            RequestFilterFields = No, "Account No", Type, Posted, "Transaction Date", "Cheque Date", "Expected Maturity Date", Cashier;
            column(ReportForNavId_1; 1)
            {
            }
            column(Picture; CompanyInfo.Picture)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(us; UserId)
            {
            }
            column(date; Format(Today, 0, 4))
            {
            }
            column(CompName; COMPANYNAME)
            {
            }
            column(No; "Cashier Transactions".No)
            {
            }
            column(Acount; "Cashier Transactions"."Account No")
            {
            }
            column(TransType; "Cashier Transactions".Type)
            {
            }
            column(TransDate; "Cashier Transactions"."Transaction Date")
            {
            }
            column(Amount; "Cashier Transactions".Amount)
            {
            }
            column(Cashier; "Cashier Transactions".Cashier)
            {
            }
            column(CheDate; DatePosted)
            {
            }
            column(CheqNo; CheNo)
            {
            }
            column(ExpectedMaturity; "Cashier Transactions"."Expected Maturity Date")
            {
            }
            column(BankerCheqNo; "Cashier Transactions"."Bankers Cheque No")
            {
            }
            column(Dim2; "Cashier Transactions"."Global Dimension 2 Code")
            {
            }
            column(Posti; "Cashier Transactions".Posted)
            {
            }
            column(PayeeName; PayeeName)
            {
            }
            column(branch; "Cashier Transactions"."Global Dimension 2 Code")
            {
            }

            trigger OnAfterGetRecord()
            begin
                CheNo := '';
                DatePosted := 0D;
                PayeeName := '';
                if "Cashier Transactions"."Cheque No" = '' then begin
                    CheNo := "Cashier Transactions"."Bankers Cheque No";
                    DatePosted := "Cashier Transactions"."Date Posted";
                end else begin
                    CheNo := "Cashier Transactions"."Cheque No";
                    DatePosted := "Cashier Transactions"."Cheque Date";
                end;

                PayeeName := "Cashier Transactions".Payee;
            end;

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get;
                CompanyInfo.CalcFields(CompanyInfo.Picture);
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
        CompanyInfo: Record "Company Information";
        CheNo: Code[10];
        DatePosted: Date;
        PayeeName: Text;
}
