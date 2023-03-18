#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185625 "Dividend Posting Buffer"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(Members;Members)
        {
            DataItemTableView = where("Dividend Action" = filter(Pay));
            RequestFilterFields = "No.", "Employer Code";
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Year := Date2dmy(Today, 3);
                PreviousYear := Year - 1;

                DividendPostingBuffer.Reset;
                DividendPostingBuffer.SetRange("Member No.", Members."No.");
                DividendPostingBuffer.SetRange(Posted, false);
                if DividendPostingBuffer.Find('-') then
                    DividendPostingBuffer.DeleteAll;

                DividendPostingBuffer.Reset;
                DividendPostingBuffer.SetRange(DividendPostingBuffer."Member No.", "No.");
                DividendPostingBuffer.SetRange(Posted, false);
                if not DividendPostingBuffer.Find('-') then begin


                    // DividendProcess.GenerateDividendPostingEntries(Members."No.");
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message(Text001);
            end;

            trigger OnPreDataItem()
            begin
                Year := Date2dmy(Today, 3);
                PreviousYear := Year - 1;
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

    trigger OnPostReport()
    begin
        Message(Text001);
    end;

    trigger OnPreReport()
    var
        // DividendProcess: Codeunit 52185459;
        Members: Record "Members";
    begin
        //DividendProcess.GenerateDividendPostingEntries(Members."No.");
    end;

    var
        Text001: label 'Successfully Processed.';
        // DividendProcess: Codeunit 52185459;
        DividendPostingBuffer: Record 52185714;
        Year: Integer;
        PreviousYear: Integer;
        intProgressTotal: Integer;
        diaProgress: Dialog;
        intProgressI: Integer;
        intProgress: Integer;
        TimeProgress: Time;
        NoOfProgressed: Integer;
        NoOfRecsProgress: Integer;
}
