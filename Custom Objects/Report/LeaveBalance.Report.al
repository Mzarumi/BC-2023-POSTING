#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185491 "Leave Balance"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Leave Balance.rdlc';

    dataset
    {
        dataitem("HR EMPLOYEES"; "HR EMPLOYEES")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            column(USERID; UserId)
            {
            }
            column(TODAY; Today)
            {
            }
            column(No_HREmployees; "HR Employees"."No.")
            {
            }
            column(FullName_HREmployees; "HR Employees"."Full Name")
            {
            }
            // column(TotalLeaveDays_HREmployees; "HR Employees"."Total (Leave Days)")
            // {
            // }
            // column(TotalLeaveTaken_HREmployees; "HR Employees"."Total Leave Taken")
            // {
            // }
            column(LeaveBal; LeaveBal)
            {
            }
            // column(AllocatedLeaveDays; "HR Employees"."Allocated Leave Days")
            // {
            // }

            // trigger OnAfterGetRecord()
            // begin
            //     LeaveBal := 0;
            //     LeaveBal := "HR Employees"."Allocated Leave Days" - "HR Employees"."Total Leave Taken";
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
        if CI.Get() then
            CI.CalcFields(CI.Picture);
    end;

    var
        LeaveBal: Decimal;
        CompanyInfo: Record "Company Information";
        CI: Record "Company Information";
}
