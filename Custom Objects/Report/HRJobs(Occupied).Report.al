#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185466 "HR Jobs (Occupied)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Jobs (Occupied).rdlc';

    dataset
    {
        dataitem("HR Jobs"; "HR Jobs")
        {
            //DataItemTableView = where("Occupied Positions" = filter("(>0"));
            RequestFilterFields = "Job ID";
            column(ReportForNavId_9002; 9002)
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
            column(NoofPosts_HRJobs; "HR Jobs"."No of Posts")
            {
                IncludeCaption = true;
            }
            column(OccupiedPositions_HRJobs; "HR Jobs"."Occupied Positions")
            {
                IncludeCaption = true;
            }
            column(JobID_HRJobs; "HR Jobs"."Job ID")
            {
                IncludeCaption = true;
            }
            column(JobDescription_HRJobs; "HR Jobs"."Job Description")
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            dataitem("HR EMPLOYEES"; "HR EMPLOYEES")
            {
                DataItemLink = "Job ID" = field("Job ID");
                DataItemTableView = where(Status = const(New));
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(JobID_HREmployee; "HR Employees".Position)
                {
                }
                column(No_HREmployee; "HR Employees"."No.")
                {
                }
                column(FirstName_HREmployee; "HR Employees"."First Name")
                {
                }
                column(MiddleName_HREmployee; "HR Employees"."Middle Name")
                {
                }
                column(LastName_HREmployee; "HR Employees"."Last Name")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                "HR Jobs".Validate("Vacant Positions");
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
    end;

    var
        CI: Record "Company Information";
        HR_JobsCaptionLbl: label 'HR Jobs';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Jobs_with_OccupantsCaptionLbl: label 'Jobs with Occupants';
        P_O__BoxCaptionLbl: label 'P.O. Box';
}
