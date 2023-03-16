#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185646 "Check Mutiple Salary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Check Mutiple Salary.rdlc';

    dataset
    {
        dataitem("Salary Lines"; "Salary Lines")
        {
            //DataItemTableView = where(Posted=const(No));
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin

                SalaryLine.Reset;
                SalaryLine.SetRange(SalaryLine.Processed, false);
                SalaryLine.SetRange(SalaryLine."Salary Header No.", "Salary Lines"."Salary Header No.");
                SalaryLine.SetRange(SalaryLine."Account No.", "Salary Lines"."Account No.");
                if SalaryLine.Count > 1 then begin
                    "Salary Lines"."Multiple Salary" := true;
                    "Salary Lines".Modify;
                end else begin
                    "Salary Lines"."Multiple Salary" := false;
                    "Salary Lines".Modify;
                end;
            end;

            trigger OnPostDataItem()
            begin

                if SalaryHeader.Get("Salary Lines"."Salary Header No.") then begin
                    SalaryHeader."Mutiple Salaries Checked" := true;
                    SalaryHeader.Modify;
                end;

                Message('Mutiple Salary validation Completed sucessfully');
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
        SalaryLine: Record 52185784;
        SalaryHeader: Record 52185783;
}
