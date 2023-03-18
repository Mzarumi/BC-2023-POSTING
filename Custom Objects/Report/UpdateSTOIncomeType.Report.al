#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185999 "Update STO Income Type"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update STO Income Type.rdlc';

    dataset
    {
        dataitem("Standing Order Header"; "Standing Order Header")
        {
            RequestFilterFields = "Income Type", Status;
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if Members.Get("Standing Order Header"."Member No.") then begin
                    if Members."Employer Code" = '99' then CurrReport.Skip;
                    "Standing Order Header"."Income Type" := "Standing Order Header"."income type"::Salary;
                    "Standing Order Header".Modify;
                end;
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
        Members: Record "Members";
}
