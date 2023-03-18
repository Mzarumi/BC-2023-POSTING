#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185638 "Generate Dormant Accounts"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(SavingsAccounts; "Savings Accounts")
        {
            DataItemTableView = where("Product Type" = filter(505), Status = filter(New | Active));
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            var
            //MemberMgt: Codeunit 52185455;
            begin

                // MemberMgt.DormancyP(DateFilter, SavingsAccounts);
                //MESSAGE(SavingsAccounts."No.");
            end;

            trigger OnPostDataItem()
            var
                SuccessfulTxt: label 'Successfully Processed.';
            begin
                Message(SuccessfulTxt);
            end;

            trigger OnPreDataItem()
            begin
                if DateFilter = 0D then DateFilter := Today;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Date Filter:"; DateFilter)
                {
                    ApplicationArea = Basic;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        DateFilter: Date;
}
