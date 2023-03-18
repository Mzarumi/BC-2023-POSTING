#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185866 "Dormant Savings Accounts"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Dormant Savings Accounts.rdlc';

    dataset
    {
        dataitem("Savings Accounts"; "Savings Accounts")
        {
            DataItemTableView = where("Product Type" = filter(02), Status = filter(<> Deceased));
            RequestFilterFields = "Member No.";
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                SavingsLedgerEntry.Reset;
                SavingsLedgerEntry.SetRange("Customer No.", "Savings Accounts"."No.");
                SavingsLedgerEntry.SetFilter(Amount, '<%1', 0);
                if SavingsLedgerEntry.FindLast then
                    PostingDate := SavingsLedgerEntry."Posting Date";

                Members.Get("Savings Accounts"."Member No.");
                if (PostingDate <= CalcDate('-90D', Today)) and (Members.Status = Members.Status::Active) then begin
                    Members.Status := Members.Status::Dormant;
                    Members.Modify;
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Members Modified Successfully');
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
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        SavingsLedgerEntry: Record 52185732;
        PostingDate: Date;
        CompanyInformation: Record "Company Information";
        SavingsAccounts: Record 52185730;
        Members: Record "Members";
}
