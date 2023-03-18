#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185450 "Update HR Emp Sup code"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update HR Emp Sup code.rdlc';

    dataset
    {
        dataitem("HR EMPLOYEES"; "HR EMPLOYEES")
        {
            column(ReportForNavId_1; 1)
            {
            }

            // trigger OnAfterGetRecord()
            // begin
            //     if UserSetup.Get("HR Employees"."Supervisor Code") then begin
            //         SupervisorName := UserSetup."Full Name";
            //         "HR Employees"."Supervisor Name" := SupervisorName;
            //         "HR Employees".Modify;
            //     end else
            //         CurrReport.Skip;
            // end;

            trigger OnPostDataItem()
            begin
                Message('All Updated! Hahha!');
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
        UserSetup: Record "User Setup";
        SupervisorName: Text;
}
