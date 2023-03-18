page 52185546 "HR Employee Grievance List"
{
    CardPageID = "HR Employee Grievance Card";
    PageType = List;
    SourceTable = "HR Employee Grievance";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Employee First Name"; Rec."Employee First Name")
                {
                }
                field("Employee Last Name"; Rec."Employee Last Name")
                {
                }
                field("Date Of Grievance"; Rec."Date Of Grievance")
                {
                }
                field("Release Date"; Rec."Release Date")
                {
                }
                field("Follow Up Date"; Rec."Follow Up Date")
                {
                }
                field("Follow Up Completed"; Rec."Follow Up Completed")
                {
                }
                field("Follow Up Date (Actual Date)"; Rec."Follow Up Date (Actual Date)")
                {
                }
                field("Cause Of Grievance"; Rec."Cause Of Grievance")
                {
                }
                field("Outcome Of Grievance"; Rec."Outcome Of Grievance")
                {
                }
                field("Letter Sent To Employee"; Rec."Letter Sent To Employee")
                {
                }
                field("Letter Sent By Whom"; Rec."Letter Sent By Whom")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
            }
        }
    }

    actions
    {
    }
}

