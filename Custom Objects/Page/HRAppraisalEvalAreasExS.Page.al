page 52186520 "HR Appraisal Eval Areas - ExS"
{
    Caption = 'HR Appraisal Evaluation Areas - External Sources';
    PageType = List;
    SourceTable = "HR Appraisal Eval Areas";
    SourceTableView = WHERE("Categorize As" = CONST("External Sources"));

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                Editable = true;
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {

                    trigger OnValidate()
                    begin
                        Rec.TestField(Code);
                    end;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                }
                field("Categorize As"; Rec."Categorize As")
                {
                    Editable = false;
                }
                field("Sub Category"; Rec."Sub Category")
                {
                }
                field("Include in Evaluation Form"; Rec."Include in Evaluation Form")
                {
                }
                field("Appraisal Period"; Rec."Appraisal Period")
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
        Rec."Categorize As" := Rec."Categorize As"::"External Sources";
        Rec."Include in Evaluation Form" := true;
    end;
}

