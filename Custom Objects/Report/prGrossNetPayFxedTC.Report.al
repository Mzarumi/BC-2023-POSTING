#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185862 "prGrossNetPay FxedTC"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prGrossNetPay FxedTC.rdlc';

    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            DataItemTableView = where("Basic Pay" = filter(<> 0));
            RequestFilterFields = "Period Filter", "Employee Code";
            column(ReportForNavId_6207; 6207)
            {
            }
            column(USERID; UserId)
            {
            }
            column(TODAY; Today)
            {
            }
            column(PeriodName; PeriodName)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(companyinfo_Picture; companyinfo.Picture)
            {
            }
            column(companyinfoName; companyinfo.Name)
            {
            }
            column(prSalary_Card__prSalary_Card___Employee_Code_; "PR Salary Card"."Employee Code")
            {
            }
            column(BasicPay; BasicPay)
            {
            }
            column(GrossPay; GrossPay)
            {
            }
            column(EmployeeName; EmployeeName)
            {
            }
            column(NetPay; NetPay)
            {
            }
            column(TotNetPay; TotNetPay)
            {
            }
            column(TotGrossPay; TotGrossPay)
            {
            }
            column(TotBasicPay; TotBasicPay)
            {
            }
            column(Gross_and_Net_pay_scheduleCaption; Gross_and_Net_pay_scheduleCaptionLbl)
            {
            }
            column(Basic_Pay_Caption; Basic_Pay_CaptionLbl)
            {
            }
            column(Gross_Pay_Caption; Gross_Pay_CaptionLbl)
            {
            }
            column(Net_Pay_Caption; Net_Pay_CaptionLbl)
            {
            }
            column(User_Name_Caption; User_Name_CaptionLbl)
            {
            }
            column(Print_Date_Caption; Print_Date_CaptionLbl)
            {
            }
            column(Period_Caption; Period_CaptionLbl)
            {
            }
            column(Page_No_Caption; Page_No_CaptionLbl)
            {
            }
            column(Prepared_by_______________________________________Date_________________Caption; Prepared_by_______________________________________Date_________________CaptionLbl)
            {
            }
            column(Checked_by________________________________________Date_________________Caption; Checked_by________________________________________Date_________________CaptionLbl)
            {
            }
            column(Authorized_by____________________________________Date_________________Caption; Authorized_by____________________________________Date_________________CaptionLbl)
            {
            }
            column(Approved_by______________________________________Date_________________Caption; Approved_by______________________________________Date_________________CaptionLbl)
            {
            }
            column(Totals_Caption; Totals_CaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                EmployeeName := '';
                objEmp.Reset;
                objEmp.SetRange(objEmp."No.", "Employee Code");
                //objEmp.SETRANGE(objEmp.Status,objEmp.Status::Active);
                if objEmp.Find('-') then begin
                    EmployeeName := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";
                    if objEmp."Contract Type" <> 'FIXEDTC' then CurrReport.Skip;
                end;
                BasicPay := 0;
                GrossPay := 0;
                NetPay := 0;

                PeriodTrans.Reset;
                PeriodTrans.SetRange(PeriodTrans."Employee Code", "Employee Code");
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                PeriodTrans.SetFilter(PeriodTrans."Group Order", '=1|=4|=9');
                PeriodTrans.SetFilter(PeriodTrans."Sub Group Order", '<=1');
                PeriodTrans.SetCurrentkey(PeriodTrans."Employee Code", PeriodTrans."Period Month", PeriodTrans."Period Year",
                PeriodTrans."Group Order", PeriodTrans."Sub Group Order");
                if PeriodTrans.Find('-') then
                    repeat
                        if PeriodTrans."Group Order" = 1 then begin
                            BasicPay := PeriodTrans.Amount;
                        end;

                        if PeriodTrans."Group Order" = 4 then begin
                            GrossPay := PeriodTrans.Amount; //Gross pay
                        end;

                        if PeriodTrans."Group Order" = 9 then begin
                            NetPay := PeriodTrans.Amount; //Net pay
                        end;
                    until PeriodTrans.Next = 0;



                if BasicPay <= 0 then
                    CurrReport.Skip;
                TotBasicPay := TotBasicPay + BasicPay;
                TotGrossPay := TotGrossPay + GrossPay;
                TotNetPay := TotNetPay + NetPay;
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
        PeriodFilter := "PR Salary Card".GetFilter("Period Filter");
        if PeriodFilter = '' then Error('You must specify the period filter');

        SelectedPeriod := "PR Salary Card".GetRangeMin("Period Filter");
        objPeriod.Reset;
        if objPeriod.Get(SelectedPeriod) then PeriodName := objPeriod."Period Name";


        if companyinfo.Get() then
            companyinfo.CalcFields(companyinfo.Picture);
    end;

    var
        PeriodTrans: Record 52185624;
        BasicPay: Decimal;
        GrossPay: Decimal;
        NetPay: Decimal;
        TotBasicPay: Decimal;
        TotGrossPay: Decimal;
        TotNetPay: Decimal;
        EmployeeName: Text[30];
        objEmp: Record "HR Employees";
        objPeriod: Record 52185613;
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        companyinfo: Record "Company Information";
        Gross_and_Net_pay_scheduleCaptionLbl: label 'Gross and Net pay schedule';
        Basic_Pay_CaptionLbl: label 'Basic Pay:';
        Gross_Pay_CaptionLbl: label 'Gross Pay:';
        Net_Pay_CaptionLbl: label 'Net Pay:';
        User_Name_CaptionLbl: label 'User Name:';
        Print_Date_CaptionLbl: label 'Print Date:';
        Period_CaptionLbl: label 'Period:';
        Page_No_CaptionLbl: label 'Page No:';
        Prepared_by_______________________________________Date_________________CaptionLbl: label 'Prepared by……………………………………………………..                 Date……………………………………………';
        Checked_by________________________________________Date_________________CaptionLbl: label 'Checked by…………………………………………………..                   Date……………………………………………';
        Authorized_by____________________________________Date_________________CaptionLbl: label 'Authorized by……………………………………………………..              Date……………………………………………';
        Approved_by______________________________________Date_________________CaptionLbl: label 'Approved by……………………………………………………..                Date……………………………………………';
        Totals_CaptionLbl: label 'Totals:';


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
