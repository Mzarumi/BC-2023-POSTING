#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185508 "OSSafety Checklist"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/OSSafety Checklist.rdlc';

    dataset
    {
        dataitem("HR OSSafety Checklist";"HR OSSafety Checklist")
        {
            RequestFilterFields = "Incident No";
            column(ReportForNavId_1; 1)
            {
            }
            column(SafetyNo_OSSafetyChecklist;"HR OSSafety Checklist".SafetyNo)
            {
            }
            column(SafetyRules_OSSafetyChecklist;"HR OSSafety Checklist"."Safety Rules")
            {
            }
            column(Observed_OSSafetyChecklist;"HR OSSafety Checklist".Observed)
            {
            }
            column(NotObserved_OSSafetyChecklist;"HR OSSafety Checklist"."Not Observed")
            {
            }
            column(AccidentNo_OSSafetyChecklist;"HR OSSafety Checklist"."Accident No")
            {
            }
            column(IncidentNo_OSSafetyChecklist;"HR OSSafety Checklist"."Incident No")
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
}
