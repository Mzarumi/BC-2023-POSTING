page 52186522 "HR Appraisal Eval Areas - JS"
{
    Caption = 'HR Appraisal Evaluation Areas - Job Specific';
    PageType = List;
    SourceTable = "HR Appraisal Eval Areas";
    SourceTableView = WHERE("Categorize As" = CONST("Job Specific"));

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
                field("Assign To"; Rec."Assign To")
                {

                    trigger OnValidate()
                    begin
                        Rec.TestField(Description);
                    end;
                }
                field("Assigned To"; Rec."Assigned To")
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
        Rec."Categorize As" := Rec."Categorize As"::"Job Specific";
        Rec."Include in Evaluation Form" := true;
    end;
}

