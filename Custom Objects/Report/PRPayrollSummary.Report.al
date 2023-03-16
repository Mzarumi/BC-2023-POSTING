#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185522 "PR Payroll Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Payroll Summary.rdlc';

    dataset
    {
        dataitem("PR Transaction Codes"; "PR Transaction Codes")
        {
            DataItemTableView = sorting("Transaction Code") order(descending);
            RequestFilterFields = "Transaction Type", "Transaction Code";
            column(ReportForNavId_1; 1)
            {
            }
            column(TransactionCode_PRTransactionCodes; "PR Transaction Codes"."Transaction Code")
            {
            }
            column(TransactionName_PRTransactionCodes; "PR Transaction Codes"."Transaction Name")
            {
            }
            column(TransactionType_PRTransactionCodes; "PR Transaction Codes"."Transaction Type")
            {
            }
            column(Amount; Amount)
            {
            }
            column(PeriodFilter; PeriodFilter)
            {
            }

            trigger OnAfterGetRecord()
            begin

                Amount := 0;

                PRPeriodTrans.Reset;
                PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Period Month", "Period Year", Membership, "Reference No");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "PR Transaction Codes"."Transaction Code");
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    Amount := PRPeriodTrans.Amount;
                end;

                if Amount = 0 then CurrReport.Skip;
            end;

            trigger OnPreDataItem()
            begin
                OnViewCurrRec();
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(PeriodFilter; PeriodFilter)
                {
                    ApplicationArea = Basic;
                    Caption = 'Period Filter';
                    TableRelation = "PR Payroll Periods";
                }
            }
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
        if PeriodFilter = 0D then Error('Please specify period filter');
    end;

    var
        PRPeriodTrans: Record 52185624;
        PeriodFilter: Date;
        Amount: Decimal;


    procedure OnViewCurrRec()
    var
        ChangePermission: Record 52185687;
        ErrorOnRestricViewTxt: label 'You do not have Permissions to VIEW,MODIFY or DELETE on this record. Contact system administrator for assistance. %';
    begin
        ChangePermission.Reset;
        ChangePermission.SetRange("User ID", UserId);
        ChangePermission.SetRange("View Payroll", true);
        ChangePermission.SetRange("Function Extended", ChangePermission."function extended"::"View Payroll");
        if not ChangePermission.Find('-') then
            Error(ErrorOnRestricViewTxt, UserId);
    end;
}
