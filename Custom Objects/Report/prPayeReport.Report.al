#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185596 "prPaye Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prPaye Report.rdlc';

    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            column(ReportForNavId_1000000008; 1000000008)
            {
            }
            column(EmployeeCode_prSalaryCard; "PR Salary Card"."Employee Code")
            {
            }
            column(CompanyInfoName; CompanyInfo.Name)
            {
            }
            column(EmpName; EmpName)
            {
            }
            column(SNo; SNo)
            {
            }
            column(Pension; Pension)
            {
            }
            column(Paye; Paye)
            {
            }
            column(TotalAllowances; TotalAllowances)
            {
            }
            column(BasicPay; BasicPay)
            {
            }
            column(PayrollPeriod; PayrollPeriod)
            {
            }
            column(TaxablePay; TaxablePay)
            {
            }

            trigger OnAfterGetRecord()
            begin
                // HrEmp.RESET;
                // HrEmp.SETRANGE(hremp."No.","PR Salary Card"."Employee Code");
                // HrEmp.SETRANGE(hremp.Status,HrEmp.Status::Active);
                // IF HrEmp.FIND('-') THEN
                //  BEGIN



                HrEmp.Get("Employee Code");
                SNo += 1;
                EmpName := HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
                BasicPay := 0;
                TotalAllowances := 0;
                Paye := 0;
                Pension := 0;
                TaxablePay := 0;



                prPeriodTrans.Reset;
                prPeriodTrans.SetRange("Employee Code", "Employee Code");
                prPeriodTrans.SetRange("Payroll Period", PayrollPeriod);
                if prPeriodTrans.FindSet then
                    repeat
                        if prPeriodTrans."Transaction Code" = 'BPAY' then BasicPay := prPeriodTrans.Amount;
                        if prPeriodTrans."Transaction Code" = 'PAYE' then Paye := prPeriodTrans.Amount;
                        if prPeriodTrans."Transaction Code" = 'TXBP' then TaxablePay := prPeriodTrans.Amount;
                        if prPeriodTrans."Transaction Code" = 'PENS' then Pension := prPeriodTrans.Amount;
                    until prPeriodTrans.Next = 0;
                //end
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
                field(PayrollPeriod; PayrollPeriod)
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Period';
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
        CompanyInfo.Get;
        if PayrollPeriod = 0D then Error('Please Specify the payroll period');
    end;

    var
        CompanyInfo: Record "Company Information";
        EmpName: Text;
        HrEmp: Record "HR Employees";
        SNo: Integer;
        BasicPay: Decimal;
        TotalAllowances: Decimal;
        Paye: Decimal;
        PayrollPeriod: Date;
        Pension: Decimal;
        prPeriodTrans: Record 52185624;
        TaxablePay: Decimal;


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
