page 52185597 "HR Leave Calendar Lines"
{
    PageType = ListPart;
    SourceTable = "HR Leave Calendar Lines";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = true;
                ShowCaption = false;
                field(Date; Rec.Date)
                {
                }
                field(Day; Rec.Day)
                {
                }
                field("Non Working"; Rec."Non Working")
                {
                }
                field(Reason; Rec.Reason)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update Unworking Days")
            {
                Caption = 'Update Unworking Days';
                Image = ClosePeriod;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    HRNonWorkingDays: Record "HR Non Working Days & Dates";
                    HRLeaveLedger: Record "HR Leave Ledger Entries";
                    HRCalendarList: Record "HR Leave Calendar Lines";
                begin

                    fn_DetermineNonWorking(Rec);
                end;
            }
        }
    }

    trigger OnClosePage()
    begin
        fn_DetermineNonWorking(Rec);
    end;

    trigger OnOpenPage()
    begin
        fn_DetermineNonWorking(Rec);
    end;

    local procedure fn_DetermineNonWorking(HRCalendarList: Record "HR Leave Calendar Lines")
    var
        HRNonWorkingDays: Record "HR Non Working Days & Dates";
        HRLeaveLedger: Record "HR Leave Ledger Entries";
    begin
        HRNonWorkingDays.Reset;
        HRNonWorkingDays.SetRange(Date, HRCalendarList.Date);
        //IF HRNonWorkingDays.GET(currDate) THEN
        if HRNonWorkingDays.Find('-') then begin
            repeat
                HRCalendarList."Non Working" := true;
                HRCalendarList.Reason := HRNonWorkingDays.Reason;
                HRCalendarList.Modify;
            until HRNonWorkingDays.Next = 0;
        end;
        //UNTIL HRNonWorkingDays.NEXT=0;
    end;
}

