#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52186013 "Worker Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Worker Report.rdlc';

    dataset
    {
        dataitem("Worker Table"; "Worker Table")
        {
            column(ReportForNavId_1; 1)
            {
            }
            //column(LoanNo_WorkerTable;"Worker Table"."Loan No")
            // {
            // }
            // column(MemberNo_WorkerTable;"Worker Table"."Member No")
            // {
            // }
            // column(TotalBalance_WorkerTable;"Worker Table"."Total Balance")
            // {
            // }

            trigger OnAfterGetRecord()
            begin

                // if Loans.Get("Worker Table"."Loan No") then begin
                //   Loans.CalcFields("Outstanding Balance","Outstanding Interest");
                //   "Worker Table"."Total Balance" := Loans."Outstanding Balance"+Loans."Outstanding Interest";
                //   "Worker Table".Modify;
                // end;

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
        WorkerTable.Reset;
        WorkerTable.DeleteAll;
        Commit;

        Message('Cleanup Complete');

        Xmlport.Run(52185535, true, true, WorkerTable);

        Message('Import Complete');
    end;

    var
        WorkerTable: Record 52186230;
        Loans: Record 52185729;
}
