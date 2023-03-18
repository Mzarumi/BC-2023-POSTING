#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185545 "New Employee Advise"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/New Employee Advise.rdlc';

    dataset
    {
        dataitem("Payroll Variations"; 52185655)
        {
            DataItemTableView = sorting("Employee Code");
            RequestFilterFields = "Employee Code";
            column(ReportForNavId_9162; 9162)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            // column(CompanyInfo_Picture; CompanyInfo.Picture)
            // {
            // }
            column(Payroll_Variations__Employee_Code_; "Employee Code")
            {
            }
            column(Payroll_Variations__Payroll_Period_; "Payroll Period")
            {
            }
            column(Payroll_Variations__Basic_Pay_; "Basic Pay")
            {
            }
            column(Payroll_Variations__Effective_Date_; "Effective Date")
            {
            }
            // column(Names; Names)
            // {
            // }
            // column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            // {
            // }
            // column(New_Employee_AdviseCaption; New_Employee_AdviseCaptionLbl)
            // {
            // }
            // column(Payroll_Variations__Employee_Code_Caption; UnknownTable52185655.FieldCaption("Employee Code"))
            // {
            // }
            // column(Payroll_Variations__Payroll_Period_Caption; UnknownTable52185655.FieldCaption("Payroll Period"))
            // {
            // }
            // column(Payroll_Variations__Basic_Pay_Caption; UnknownTable52185655.FieldCaption("Basic Pay"))
            // {
            // }
            // column(Payroll_Variations__Effective_Date_Caption; UnknownTable52185655.FieldCaption("Effective Date"))
            // {
            // }
            // column(NamesCaption; NamesCaptionLbl)
            // {
            // }
            // column(Approved_by______________________________________Date_________________Caption; Approved_by______________________________________Date_________________CaptionLbl)
            // {
            // }
            // column(Authorized_by____________________________________Date_________________Caption; Authorized_by____________________________________Date_________________CaptionLbl)
            // {
            //     //  rHggermOnAftorGe R cErd(yHm Cope") NhaiName" + ' ' + "Hr-Employee"."Middle Name" + ' ' + "Hr-Employee"."Last Name";nd;

            // ;
            // 
                     //         Names := "Hr-Employee"."First Name" + ' ' + "Hr-Employee"."Middle Name" + ' ' + "Hr-Employee"."Last Name";
            // end;

  
            // trigger OnAfterGetRecord()
            // begin
            //     Names := '';
            //     if "Hr-Employee".Get("Employee Code") then
            //         Names := "Hr-Employee"."First Name" + ' ' + "Hr-Employee"."Middle Name" + ' ' + "Hr-Employee"."Last Name";
            // end;

            // trigger OnPreDataItem()
            // begin
            //     //LastFieldNo := UnknownTable52185655.FieldNo("Employee Code");
            //     "Payroll Variations".SetRange("Payroll Variations".Type, "Payroll Variations".Type::"New Employee")
            // end;
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
        if CompanyInfo.Get() then
            CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        CompanyInfo: Record "Company Information";
        "Hr-Employee": Record "HR Employees";
        Names: Text[100];
        CurrReport_PAGENOCaptionLbl: label 'Page';
        New_Employee_AdviseCaptionLbl: label 'New Employee Advise';
        NamesCaptionLbl: label 'Names';
        Approved_by______________________________________Date_________________CaptionLbl: label 'Approved by……………………………………………………..                Date……………………………………………';
        Authorized_by____________________________________Date_________________CaptionLbl: label 'Authorized by……………………………………………………..              Date……………………………………………';
        Checked_by________________________________________Date_________________CaptionLbl: label 'Checked by…………………………………………………..                   Date……………………………………………';
        Prepared_by_______________________________________Date_________________CaptionLbl: label 'Prepared by……………………………………………………..                 Date……………………………………………';
}
