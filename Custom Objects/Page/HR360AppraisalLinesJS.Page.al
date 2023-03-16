page 52186527 "HR 360 Appraisal Lines - JS"
{
    Caption = 'HR Appraisal Lines - Job Specific';
    PageType = ListPart;
    SourceTable = "HR Appraisal Lines";
    SourceTableView = WHERE("Categorize As" = CONST("Job Specific"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sub Category"; Rec."Sub Category")
                {
                }
                field("Perfomance Goals and Targets"; Rec."Perfomance Goals and Targets")
                {
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                }
                field("Min. Target Score"; Rec."Min. Target Score")
                {
                }
                field("Max Target Score"; Rec."Max Target Score")
                {
                }
                field("Self Rating"; Rec."Self Rating")
                {
                }
                field("Employee Comments"; Rec."Employee Comments")
                {
                }
                field("Supervisor Rating"; Rec."Supervisor Rating")
                {
                }
                field("Supervisor Comments"; Rec."Supervisor Comments")
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
        Rec."Categorize As" := Rec."Categorize As"::"Job Specific";
    end;
}

