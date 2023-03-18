#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185467 "HR Job Responsibilities"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Job Responsibilities.rdlc';

    dataset
    {
        dataitem("HR Jobs"; "HR Jobs")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Job ID";
            column(ReportForNavId_9002; 9002)
            {
            }
            column(JobDescription_HRJobs; "HR Jobs"."Job Description")
            {
                IncludeCaption = true;
            }
            // column(CI_Name; CI.Name)
            // {
            //     IncludeCaption = true;
            // }
            // column(CI_Address; CI.Address)
            // {
            //     IncludeCaption = true;
            // }
            // column(CI_Address2; CI."Address 2")
            // {
            //     IncludeCaption = true;
            // }
            // column(CI_City; CI.City)
            // {
            //     IncludeCaption = true;
            // }
            // column(CI_PhoneNo; CI."Phone No.")
            // {
            //     IncludeCaption = true;
            // }
            // column(CI_Picture; CI.Picture)
            // {
            //     IncludeCaption = true;
            // }
            // dataitem("HR Job Responsiblities";"HR Job Responsiblities")
            // {
            //     DataItemLink = "Job ID" = field("Job ID");
            //     DataItemTableView = sorting("Job ID", "Responsibility Code");
            //     PrintOnlyIfDetail = false;
            //     column(ReportForNavId_3841; 3841)
            //     {
            //     }
            //     column(JobID_HRJobResponsiblities; "HR Job Responsiblities"."Job ID")
            //     {
            //     }
            //     column(ResponsibilityDescription_HRJobResponsiblities; "HR Job Responsiblities"."Responsibility Description")
            //     {
            //     }
            //     column(Remarks_HRJobResponsiblities; "HR Job Responsiblities".Remarks)
            //     {
            //     }
            //     column(ResponsibilityCode_HRJobResponsiblities; "HR Job Responsiblities"."Responsibility Code")
            //     {
            //     }

            //     trigger OnAfterGetRecord()
            //     begin

            //         No := No + 1;
            //     end;

            //     trigger OnPreDataItem()
            //     begin

            //         No := 0;
            //     end;
            // }
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
        No := 1;
    end;

    var
        CI: Record "Company Information";
        No: Integer;
}
