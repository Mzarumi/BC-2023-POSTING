#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185447 "Delete Loans"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Delete Loans.rdlc';

    dataset
    {
        dataitem(Loans; Loans)
        {
            DataItemTableView = where("Loan Product Type" = filter(126));
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*
                premi.RESET;
                premi.SETRANGE(premi.Code,"Gen. Journal Line"."Line No.");
                IF premi.FIND ('-')THEN BEGIN
                "Gen. Journal Line"."Shortcut Dimension 1 Code":=premi.Phone;
                "Gen. Journal Line"."Shortcut Dimension 2 Code"  :=premi."FD Duration";
                "Gen. Journal Line".MODIFY;
                END;
                */
                Loans."Approval Date" := Loans."Disbursement Date";
                Loans.Modify;

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
        premi: Record 52185423;
}
