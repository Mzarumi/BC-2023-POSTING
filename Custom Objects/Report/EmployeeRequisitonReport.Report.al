#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185695 "Employee Requisiton Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Requisiton Report.rdlc';

    dataset
    {
        dataitem("HR Employee Requisitions";"HR Employee Requisitions")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(JobID_HREmployeeRequisitions;"HR Employee Requisitions"."Job ID")
            {
            }
            column(RequisitionDate_HREmployeeRequisitions;"HR Employee Requisitions"."Requisition Date")
            {
            }
            column(Positions_HREmployeeRequisitions;"HR Employee Requisitions".Positions)
            {
            }
            column(DateApproved_HREmployeeRequisitions;"HR Employee Requisitions"."Date Approved")
            {
            }
            column(JobDescription_HREmployeeRequisitions;"HR Employee Requisitions"."Job Description")
            {
            }
            column(ApprovalStatus_HREmployeeRequisitions;"HR Employee Requisitions"."Approval Status")
            {
            }
            column(RequiredPositions_HREmployeeRequisitions;"HR Employee Requisitions"."Required Positions")
            {
            }
            column(VacantPositions_HREmployeeRequisitions;"HR Employee Requisitions"."Vacant Positions")
            {
            }
            column(Advertised_HREmployeeRequisitions;"HR Employee Requisitions".Advertised)
            {
            }
            column(CompletionStatus_HREmployeeRequisitions;"HR Employee Requisitions"."Completion Status")
            {
            }
            column(Picture;CompInfo.Picture)
            {
            }
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
        CompInfo.Reset;
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture)
    end;

    var
        CompInfo: Record "Company Information";
}
