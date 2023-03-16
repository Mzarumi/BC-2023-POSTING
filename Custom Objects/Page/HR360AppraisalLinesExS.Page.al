page 52186473 "HR 360 Appraisal Lines - ExS"
{
    Caption = 'HR Appraisal Lines - External Sources';
    PageType = ListPart;
    SourceTable = "HR Appraisal Lines";
    SourceTableView = WHERE("Categorize As" = CONST("External Sources"));

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
                field("Sub-ordinates Rating"; Rec."Sub-ordinates Rating")
                {
                }
                field("Subordinates Comments"; Rec."Subordinates Comments")
                {
                }
                field("Employee Comments"; Rec."Employee Comments")
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
        Rec."Categorize As" := Rec."Categorize As"::"Employee's Subordinates";
    end;
}

