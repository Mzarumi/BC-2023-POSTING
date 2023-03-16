page 52185592 "HR Setup"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    RefreshOnActivate = false;
    SourceTable = "HR Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Default Leave Posting Template"; Rec."Default Leave Posting Template")
                {
                }
                field("Positive Leave Posting Batch"; Rec."Positive Leave Posting Batch")
                {
                }
                field("Negative Leave Posting Batch"; Rec."Negative Leave Posting Batch")
                {
                }
            }
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Job ID Nos"; Rec."Job ID Nos")
                {
                }
                field("Employee Requisition Nos."; Rec."Employee Requisition Nos.")
                {
                }
                field("Job Application Nos"; Rec."Job Application Nos")
                {
                }
                field("Induction Nos"; Rec."Induction Nos")
                {
                }
                field("Employee Nos."; Rec."Employee Nos.")
                {
                }
                field("Leave Application Nos."; Rec."Leave Application Nos.")
                {
                }
                field("Leave Reimbursment Nos."; Rec."Leave Reimbursment Nos.")
                {
                }
                field("Leave Planner Nos."; Rec."Leave Planner Nos.")
                {
                }
                field("Traning Needs Nos."; Rec."Traning Needs Nos.")
                {
                }
                field("Training Application Nos."; Rec."Training Application Nos.")
                {
                }
                field("Interns Req. Nos"; Rec."Interns Req. Nos")
                {
                }
                field("Disciplinary Cases Nos."; Rec."Disciplinary Cases Nos.")
                {
                }
                field("Employee Transfer Nos."; Rec."Employee Transfer Nos.")
                {
                }
                field("Employee Promotion No."; Rec."Employee Promotion No.")
                {
                }
                field("Exit Interview Nos"; Rec."Exit Interview Nos")
                {
                }
                field("Appraisal Nos"; Rec."Appraisal Nos")
                {
                }
                field("Company Activities"; Rec."Company Activities")
                {
                }
                field("Employee Asset Transfer No."; Rec."Employee Asset Transfer No.")
                {
                }
                field("Transport Req Nos"; Rec."Transport Req Nos")
                {
                }
                field("Transport Allocation Nos."; Rec."Transport Allocation Nos.")
                {
                }
                field("Succession Planning Nos."; Rec."Succession Planning Nos.")
                {
                }
                field("Medical Claims Nos"; Rec."Medical Claims Nos")
                {
                }
                field("Overtime Req Nos."; Rec."Overtime Req Nos.")
                {
                }
                field("Incident Nos."; Rec."Incident Nos.")
                {
                }
                field("Investigation Nos."; Rec."Investigation Nos.")
                {
                }
                field("Employee Confirmation No."; Rec."Employee Confirmation No.")
                {
                }
                field("PR Deduction Nos."; Rec."PR Deduction Nos.")
                {
                }
                field("PR Allowances Nos."; Rec."PR Allowances Nos.")
                {
                }
                field("Base Calendar"; Rec."Base Calendar")
                {
                }
                field("Salary Advance Nos."; Rec."Salary Advance Nos.")
                {
                }
                field(test; Rec.test)
                {
                }
                field("Back To Office Nos"; Rec."Back To Office Nos")
                {
                }
                field("Disciplinary Withdrawal Nos."; Rec."Disciplinary Withdrawal Nos.")
                {
                }
                field("Appraisal Appeal Nos"; Rec."Appraisal Appeal Nos")
                {
                }
                field("Disciplinary Appeal Nos"; Rec."Disciplinary Appeal Nos")
                {
                }
            }
            group(Appraisal)
            {
                Caption = 'Appraisal';
                field("Appraisal Method"; Rec."Appraisal Method")
                {
                }
                field("Appraisal Template"; Rec."Appraisal Template")
                {
                }
                field("Appraisal Batch"; Rec."Appraisal Batch")
                {
                }
                field("Appraisal Posting Period[FROM]"; Rec."Appraisal Posting Period[FROM]")
                {
                }
                field("Appraisal Posting Period[TO]"; Rec."Appraisal Posting Period[TO]")
                {
                }
                field("Target Setting Month"; Rec."Target Setting Month")
                {
                }
                field("Max Appraisal Rating"; Rec."Max Appraisal Rating")
                {
                }
                field("Appraisal Interval"; Rec."Appraisal Interval")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin

        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;
    end;
}

