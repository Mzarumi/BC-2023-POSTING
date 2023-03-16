page 52185664 "HR Employees Factbox"
{
    PageType = CardPart;
    SourceTable = "HR Employees";

    layout
    {
        area(content)
        {
            // field(PersonalDetails; Rec.PersonalDetails)
            // {
            //     Style = StrongAccent;
            //     StyleExpr = TRUE;
            // }
            field("No."; Rec."No.")
            {
            }
            field("First Name"; Rec."First Name")
            {
            }
            field("Middle Name"; Rec."Middle Name")
            {
            }
            field("Last Name"; Rec."Last Name")
            {
            }
            field("E-Mail"; Rec."E-Mail")
            {
            }
            field("Company E-Mail"; Rec."Company E-Mail")
            {
            }
            field(Status; Rec.Status)
            {
            }
            // field(JobDetails; Rec.JobDetails)
            // {
            //     Style = StrongAccent;
            //     StyleExpr = TRUE;
            // }
            field("Job Title"; Rec."Job Title")
            {
            }
            // field(Grade; Rec.Grade)
            // {
            // }
            // field(LeaveDetails; Rec.LeaveDetails)
            // {
            //     Style = StrongAccent;
            //     StyleExpr = TRUE;
            // }
            // field("Annual Leave Account"; Rec."Annual Leave Account")
            // {
            // }
            // field("Compassionate Leave Acc."; Rec."Compassionate Leave Acc.")
            // {
            // }
            // field("Maternity Leave Acc."; Rec."Maternity Leave Acc.")
            // {
            // }
            // field("Paternity Leave Acc."; Rec."Paternity Leave Acc.")
            // {
            // }
            // field("Sick Leave Acc."; Rec."Sick Leave Acc.")
            // {
            // }
            // field("Study Leave Acc"; Rec."Study Leave Acc")
            // {
            // }
        }
    }

    actions
    {
    }

    var
        PersonalDetails: Label 'Personal Details';
        BankDetails: Label 'Bank Details';
        JobDetails: Label 'Job Details';
        LeaveDetails: Label 'Leave Details';
}

