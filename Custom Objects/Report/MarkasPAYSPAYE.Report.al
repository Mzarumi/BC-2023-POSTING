#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185583 "Mark as PAYS PAYE"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Mark as PAYS PAYE.rdlc';

    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            DataItemTableView = sorting("Employee Code");
            column(ReportForNavId_6207; 6207)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(prSalary_Card__Employee_Code_; "Employee Code")
            {
            }
            column(prSalary_Card__Pays_PAYE_; "Pays PAYE")
            {
            }
            column(prSalary_CardCaption; prSalary_CardCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(prSalary_Card__Employee_Code_Caption; "PR Salary Card".FieldCaption("Employee Code"))
            {
            }
            column(prSalary_Card__Pays_PAYE_Caption; "PR Salary Card".FieldCaption("Pays PAYE"))
            {
            }

            trigger OnAfterGetRecord()
            begin
                // IF "PR Salary Card"."Date of Birth" = 'CS' THEN
                // EXIT;
                //
                // IF "PR Salary Card"."Date of Birth" = 'IT' THEN
                // EXIT;
                //
                // IF "PR Salary Card"."Date of Birth" = 'NYSC' THEN
                // EXIT;
                //
                // IF "PR Salary Card"."Date of Birth" = 'MGT' THEN
                // EXIT;
                //
                // "PR Salary Card"."Pays PAYE":=TRUE;
                // "PR Salary Card".MODIFY;
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
        SalaryGrades: Record 52185652;
        prSalary_CardCaptionLbl: label 'prSalary Card';
        CurrReport_PAGENOCaptionLbl: label 'Page';
}
