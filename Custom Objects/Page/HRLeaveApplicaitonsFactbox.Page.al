page 52185558 "HR Leave Applicaitons Factbox"
{
    PageType = CardPart;
    SourceTable = "HR Employees";

    layout
    {
        area(content)
        {
            label(Control1102755011)
            {
                CaptionClass = Text1;
                ShowCaption = false;
                Style = StrongAccent;
                StyleExpr = TRUE;
            }
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
            field("Job Title"; Rec."Job Title")
            {
            }
            field(Status; Rec.Status)
            {
            }
            field("E-Mail"; Rec."E-Mail")
            {
            }
            label(Control1102755005)
            {
                ShowCaption = false;
                Style = StrongAccent;
                StyleExpr = TRUE;
            }
            label(Control1102755012)
            {
                CaptionClass = Text2;
                ShowCaption = false;
                Style = StrongAccent;
                StyleExpr = TRUE;
            }
            // field("Total Leave Taken"; Rec."Total Leave Taken")
            // {
            // }
            // field("Total (Leave Days)"; Rec."Total (Leave Days)")
            // {
            // }
            // field("Cash - Leave Earned"; Rec."Cash - Leave Earned")
            // {
            // }
            // field("Allocated Leave Days"; Rec."Allocated Leave Days")
            // {
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
        Text1: Label 'Employee Details';
        Text2: Label 'Employeee Leave Details';

}

