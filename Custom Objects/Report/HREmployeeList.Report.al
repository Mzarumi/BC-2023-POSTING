#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185476 "HR Employee List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Employee List.rdlc';

    dataset
    {
        dataitem("HR EMPLOYEES"; "HR EMPLOYEES")
        {
            DataItemTableView = where(Status = filter(Active));
            RequestFilterFields = "No.";
            column(ReportForNavId_6075; 6075)
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
            column(USERID; "HR Employees"."User ID")
            {
            }
            // column(DateOfJoin_HREmployees; "HR Employees"."Date Of Join")
            // {
            // }
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
            column(Num; "No of Employees")
            {
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            column(CI_EMail; CI."E-Mail")
            {
                IncludeCaption = true;
            }
            column(CI_HomePage; CI."Home Page")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(UserID_HREmployees; "HR Employees"."User ID")
            {
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(IDNumber; "HR Employees"."ID Number")
            {
            }
            column(HR_Employees__No__; "No.")
            {
            }
            // column(GlobalDimension1Name_HREmployees; "HR Employees"."Global Dimension 1 Name")
            // {
            // }
            // column(GlobalDimension2Name_HREmployees; "HR Employees"."Global Dimension 2 Name")
            // {
            // }
            column(HR_Employees__Job_Description_; "HR Employees"."Job Title")
            {
            }
            column(HR_Employees__FullName; "HR Employees"."First Name")
            {
            }
            column(HR_Employees__Cell_Phone_Number_; "HR Employees"."Cellular Phone Number")
            {
            }
            column(Company_EMail; "HR Employees"."Company E-Mail")
            {
            }
            column(EmployeeCaption; EmployeeCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee_ListCaption; Employee_ListCaptionLbl)
            {
            }
            column(P_O__BoxCaption; P_O__BoxCaptionLbl)
            {
            }
            // column(HR_Employees__No__Caption; UnknownTable"HR EMPLOYEES".FieldCaption("No."))
            // {
            // }
            // column(HR_Employees__ID_Number_Caption; UnknownTable"HR EMPLOYEES".FieldCaption("ID Number"))
            // {
            // }
            // column(HR_Employees__Job_Description_Caption; UnknownTable"HR EMPLOYEES".FieldCaption("Job Title"))
            // {
            // }
            // column(Full_NamesCaption; Full_NamesCaptionLbl)
            // {
            // }
            // column(HR_Employees__Cell_Phone_Number_Caption; UnknownTable"HR EMPLOYEES".FieldCaption("Cellular Phone Number"))
            // {
            // }
            column(NoofEmployees; "No of Employees")
            {
            }
            column(FullNames; FullNames)
            {
            }

            trigger OnAfterGetRecord()
            begin
                "No of Employees" := "No of Employees" + 1;

                FullNames := '';
                FullNames := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";

                UserSetup.Reset;
                UserSetup.SetRange(UserSetup."User ID", UserId);
                if UserSetup.Find('-') then begin
                    //   IF UserSetup."Double Login"=FALSE THEN
                    //  ERROR('You have no rights')
                end
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
        CI.Get();
        CI.CalcFields(CI.Picture);
        "No of Employees" := 0;
    end;

    var
        CI: Record "Company Information";
        EmployeeCaptionLbl: label 'Employee';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Employee_ListCaptionLbl: label 'Employee List';
        P_O__BoxCaptionLbl: label 'P.O. Box';
        Full_NamesCaptionLbl: label 'Full Names';
        "No of Employees": Integer;
        FullNames: Text[150];
        UserSetup: Record "User Setup";


    procedure OnViewCurrRec()
    var
        ChangePermission: Record 52185687;
        ErrorOnRestricViewTxt: label 'You do not have Permissions to VIEW,MODIFY or DELETE on this record. Contact system administrator for assistance. %';
    begin
        ChangePermission.Reset;
        ChangePermission.SetRange("User ID", UserId);
        ChangePermission.SetRange("View Payroll", true);
        if not ChangePermission.Find('-') then
            Error(ErrorOnRestricViewTxt, UserId);
    end;
}
