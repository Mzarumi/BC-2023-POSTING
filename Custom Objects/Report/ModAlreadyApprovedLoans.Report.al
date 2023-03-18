#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185441 "Mod Already Approved Loans"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Mod Already Approved Loans.rdlc';

    dataset
    {
        dataitem(Loans; Loans)
        {
            //DataItemTableView = where("Application Date" = filter("05/08/18" .. "05/10/18"), Posted = filter(No), Status = filter(Open | Pending));
            RequestFilterFields = "Loan No.";
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin

                ApprovalENt.Reset;
                ApprovalENt.SetRange(ApprovalENt."Record ID to Approve", Loans.RecordId);
                ApprovalENt.SetRange(ApprovalENt.Status, ApprovalENt.Status::Approved);
                if ApprovalENt.Find('-') then begin
                    Loans.Status := Loans.Status::Approved;
                    Loans.Modify;
                    //MESSAGE('the record id to approve is %1',ApprovalENt."Record ID to Approve")
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
        ApprovalENt: Record "Approval Entry";
}
