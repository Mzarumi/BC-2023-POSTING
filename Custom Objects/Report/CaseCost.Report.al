#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185835 "Case Cost"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Case Cost.rdlc';

    dataset
    {
        dataitem("Case Cost List"; "Case Cost List")
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(Code_CaseCostList; "Case Cost List".Code)
            {
            }
            column(CaseItem_CaseCostList; "Case Cost List"."Case Item")
            {
            }
            column(Cost_CaseCostList; "Case Cost List".Cost)
            {
            }
            column(Description_CaseCostList; "Case Cost List".Description)
            {
            }
            column(LineNo_CaseCostList; "Case Cost List"."Line No")
            {
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
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
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
}
