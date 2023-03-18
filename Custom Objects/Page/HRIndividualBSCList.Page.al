page 52186533 "HR Individual BSC List"
{
    CardPageID = "HR Leave Carryover Request";
    PageType = List;
    SourceTable = "HR Appraisal Header";
    SourceTableView = WHERE("Target Type" = FILTER("Individual Targets"),
                            Sent = FILTER(Appraisee));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User ID"; Rec."User ID")
                {
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                }
                field("Appraisal No"; Rec."Appraisal No")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("Job Title"; Rec."Job Title")
                {
                }
                field(Picture; Rec.Picture)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
            }
            systempart(Control12; Notes)
            {
            }
            systempart(Control13; MyNotes)
            {
            }
            systempart(Control14; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Approve All Individual Targets")
            {
            }
            action("Approve Marked Targets")
            {
            }
            action("Return All Individual Targets")
            {
            }
            action("Return Marked Targets")
            {
            }
        }
    }
}

