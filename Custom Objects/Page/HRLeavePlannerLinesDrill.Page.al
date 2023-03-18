page 52185672 "HR Leave Planner Lines Drill"
{
    PageType = List;
    SourceTable = "HR Leave Planner Drill";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application Code"; Rec."Application Code")
                {
                    Editable = false;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                }
                field("Days Applied"; Rec."Days Applied")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Return Date"; Rec."Return Date")
                {
                }
                field("Applicant Comments"; Rec."Applicant Comments")
                {
                }
                field(Reliever; Rec.Reliever)
                {
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                }
                field(Month; Rec.Month)
                {
                    Editable = false;
                }
                field(Year; Rec.Year)
                {
                    Editable = false;
                }
                field("User ID"; Rec."User ID")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Employee No" := Rec.GetFilter("Employee No");
        if Evaluate(Rec.Month, Rec.GetFilter(Month)) then
           Rec. Month := Rec.Month;
        if Evaluate(Rec.Year, Rec.GetFilter(Year)) then
            Rec.Year := Rec.Year;

        Commit;
        Rec."User ID" := UserId;
    end;

    trigger OnOpenPage()
    begin
        Rec.SetFilter("User ID", UserId)
    end;
}

