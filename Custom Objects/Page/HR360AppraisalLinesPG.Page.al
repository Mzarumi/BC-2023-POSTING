page 52186526 "HR 360 Appraisal Lines - PG"
{
    Caption = 'HR Appraisal Lines - Personal Goals/Objectives';
    PageType = ListPart;
    SourceTable = "HR Appraisal Lines";
    SourceTableView = WHERE("Categorize As" = CONST("Personal Goals/Objectives"));

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
        Rec."Categorize As" := Rec."Categorize As"::"Personal Goals/Objectives";
        Rec."Sub Category" := Rec."Sub Category"::"Personal Goals";
    end;
}

