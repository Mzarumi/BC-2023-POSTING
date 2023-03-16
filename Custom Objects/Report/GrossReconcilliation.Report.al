#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185586 "Gross Reconcilliation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Gross Reconcilliation.rdlc';

    dataset
    {
        dataitem("HR EMPLOYEES"; "HR EMPLOYEES")
        {
            RequestFilterFields = "Current Month Filter", "No.";
            column(ReportForNavId_8631; 8631)
            {
            }
            column(USERID; UserId)
            {
            }
            column(TODAY; Today)
            {
            }
            // column(PeriodName; PeriodName)
            // {
            // }
            // column(CurrReport_PAGENO; CurrReport.PageNo)
            // {
            // }
            // column(companyinfo_Picture; companyinfo.Picture)
            // {
            // }
            // column(HR_Employee__HR_Employee___No__; "HR Employees"."No.")
            // {
            // }
            // column(EmployeeName; EmployeeName)
            // {
            // }
            // column(TCurrAmount; TCurrAmount)
            // {
            // }
            // column(TPrevAmount; TPrevAmount)
            // {
            // }
            // column(TCurrAmount_TPrevAmount; TCurrAmount - TPrevAmount)
            // {
            // }
            // column(Payment_ReconcilliationCaption; Payment_ReconcilliationCaptionLbl)
            // {
            // }
            // column(Prev__AmountCaption; Prev__AmountCaptionLbl)
            // {
            // }
            // column(VarienceCaption; VarienceCaptionLbl)
            // {
            // }
            // column(User_Name_Caption; User_Name_CaptionLbl)
            // {
            // }
            // column(Print_Date_Caption; Print_Date_CaptionLbl)
            // {
            // }
            // column(Period_Caption; Period_CaptionLbl)
            // {
            // }
            // column(Page_No_Caption; Page_No_CaptionLbl)
            // {
            // }
            // column(Current_AmountCaption; Current_AmountCaptionLbl)
            // {
            // }
            // column(Prepared_by_______________________________________Date_________________Caption; Prepared_by_______________________________________Date_________________CaptionLbl)
            // {
            // }
            // column(Checked_by________________________________________Date_________________Caption; Checked_by________________________________________Date_________________CaptionLbl)
            // {
            // }
            // column(Authorized_by____________________________________Date_________________Caption; Authorized_by____________________________________Date_________________CaptionLbl)
            // {
            // }
            // column(Approved_by______________________________________Date_________________Caption; Approved_by______________________________________Date_________________CaptionLbl)
            // {
            // }
            dataitem("Monthly Reconcilliation";"Monthly Reconcilliation")
            {
                DataItemLink = Employee = field("No.");
                DataItemTableView = sorting(Employee, TransCode) order(ascending);
                column(ReportForNavId_5750; 5750)
                {
                }
                column(Monthly_Reconcilliation_TransCode; TransCode)
                {
                }
                column(Monthly_Reconcilliation_Description; Description)
                {
                }
                column(Monthly_Reconcilliation_CurrAmount; CurrAmount)
                {
                }
                column(Monthly_Reconcilliation_PrevAmount; PrevAmount)
                {
                }
                column(No; No)
                {
                }
                column(CurrAmount_PrevAmount; CurrAmount - PrevAmount)
                {
                }
                column(Monthly_Reconcilliation_Employee; Employee)
                {
                }
                column(Monthly_Reconcilliation_Group_Order; "Group Order")
                {
                }
                column(Monthly_Reconcilliation_Refference_Code; "Refference Code")
                {
                }
                column(Monthly_Reconcilliation_Entry_Exit; "Entry/Exit")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    No += 1;

                    TCurrAmount := TCurrAmount + "Monthly Reconcilliation".CurrAmount;
                    TPrevAmount := TPrevAmount + "Monthly Reconcilliation".PrevAmount;
                end;

                trigger OnPreDataItem()
                begin
                    No := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin

                objEmp.Reset;
                objEmp.SetRange(objEmp."No.", "HR Employees"."No.");
                if objEmp.Find('-') then
                    EmployeeName := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";


                //IF NetPay<=0 THEN
                //CurrReport.SKIP;
                TotBasicPay := TotBasicPay + BasicPay;
                TotGrossPay := TotGrossPay + GrossPay;
                TotNetPay := TotNetPay + NetPay;
            end;

            trigger OnPreDataItem()
            begin
                //ReconcilliationTable.DELETEALL;
                if companyinfo.Get() then
                    companyinfo.CalcFields(companyinfo.Picture);
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
        PeriodFilter := "HR Employees".GetFilter("Current Month Filter");
        if PeriodFilter = '' then Error('You must specify the period filter');

        SelectedPeriod := "HR Employees".GetRangeMin("Current Month Filter");
        objPeriod.Reset;
        if objPeriod.Get(SelectedPeriod) then PeriodName := objPeriod."Period Name";
    end;

    var
        PeriodTrans: Record 52185624;
        BasicPay: Decimal;
        GrossPay: Decimal;
        NetPay: Decimal;
        TotBasicPay: Decimal;
        TotGrossPay: Decimal;
        TotNetPay: Decimal;
        EmployeeName: Text[200];
        objEmp: Record "HR Employees";
        objPeriod: Record 52185613;
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        companyinfo: Record "Company Information";
        PeriodTransPREV: Record 52185624;
        BasicPayPREV: Decimal;
        GrossPayPREV: Decimal;
        NetPayPREV: Decimal;
        ReconcilliationTable: Record 52185654;
        No: Integer;
        "Entry/Exit": Boolean;
        TCurrAmount: Decimal;
        TPrevAmount: Decimal;
        Payment_ReconcilliationCaptionLbl: label 'Payment Reconcilliation';
        Prev__AmountCaptionLbl: label 'Prev. Amount';
        VarienceCaptionLbl: label 'Varience';
        User_Name_CaptionLbl: label 'User Name:';
        Print_Date_CaptionLbl: label 'Print Date:';
        Period_CaptionLbl: label 'Period:';
        Page_No_CaptionLbl: label 'Page No:';
        Current_AmountCaptionLbl: label 'Current Amount';
        Prepared_by_______________________________________Date_________________CaptionLbl: label 'Prepared by……………………………………………………..                 Date……………………………………………';
        Checked_by________________________________________Date_________________CaptionLbl: label 'Checked by…………………………………………………..                   Date……………………………………………';
        Authorized_by____________________________________Date_________________CaptionLbl: label 'Authorized by……………………………………………………..              Date……………………………………………';
        Approved_by______________________________________Date_________________CaptionLbl: label 'Approved by……………………………………………………..                Date……………………………………………';
}
