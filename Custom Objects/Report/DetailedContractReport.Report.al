#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185770 "Detailed Contract Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Detailed Contract Report.rdlc';

    dataset
    {
        dataitem(Contracts;Contracts)
        {
            RequestFilterFields = "Contract No","Start Date","End Date";
            column(ReportForNavId_1; 1)
            {
            }
            column(ContractNo_Contracts;Contracts."Contract No")
            {
            }
            column(Name_Contracts;Contracts."Contractor Name")
            {
            }
            column(StartDate_Contracts;Contracts."Start Date")
            {
            }
            column(EndDate_Contracts;Contracts."End Date")
            {
            }
            column(ContractValue_Contracts;Contracts."Contract Amount")
            {
            }
            // column(Remarks_Contracts;Contracts.Remark)
            // {
            // }
            // column(SerialNo;SerialNo)
            // {
            // }
            // column(ContractStatus;Contracts."Contract Description")
            // {
            // }
            // column(EDRemarks;Contracts.Remarks)
            // {
            // }
            // column(SCMRemarks;Contracts."Supply Chain Manager Remarks")
            // {
            // }
            dataitem(Milestones;Milestones)
            {
                DataItemLink = "Contract No"=field("Contract No");
                column(ReportForNavId_10; 10)
                {
                }
                column(Completed_ContractMilestoneEntry;Milestones."Completed %")
                {
                }
                column(StageDescription_ContractMilestoneEntry;Milestones."Stage Description")
                {
                }
                // column(CommitteeResolution_ContractMilestoneEntry;Milestones."Committee Resolution")
                // {
                // }
                // column(MilestoneDuration_ContractMilestoneEntry;Milestones."Milestone Duration")
                // {
                // }
            }

            trigger OnAfterGetRecord()
            begin
                SerialNo+=1;
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
        SerialNo: Integer;
}
