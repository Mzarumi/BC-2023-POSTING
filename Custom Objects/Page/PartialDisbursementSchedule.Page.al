page 52186645 "Partial Disbursement Schedule"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Partial Disbursement Schedule";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Scheduled Disbursement Date"; Rec."Scheduled Disbursement Date")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Disbursement Destination"; Rec."Disbursement Destination")
                {
                    Visible = false;
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    Editable = false;
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    var
        LoanApp: Record Loans;
        PartialDisbursementSchedule: Record "Partial Disbursement Schedule";
        TotalAmount: Decimal;
}

