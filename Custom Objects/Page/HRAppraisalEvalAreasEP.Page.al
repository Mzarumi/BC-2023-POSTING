page 52186519 "HR Appraisal Eval Areas - EP"
{
    Caption = 'HR Appraisal Evaluation Areas - Employee''s Peers';
    PageType = List;
    SourceTable = "HR Appraisal Eval Areas";
    SourceTableView = WHERE("Categorize As" = CONST("Employee's Peers"));

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
        Rec."Categorize As" := Rec."Categorize As"::"Employee's Peers";
        Rec."Include in Evaluation Form" := true;
    end;
}

