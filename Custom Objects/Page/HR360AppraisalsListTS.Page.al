page 52186521 "HR 360 Appraisals List - TS"
{
    CardPageID = "HR 360 Appraisal Card";
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Functions,Appraisal';
    SourceTable = "HR Appraisal Header";
    SourceTableView = WHERE("Appraisal Stage" = CONST("Target Setting"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal No"; Rec."Appraisal No")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Job Title"; Rec."Job Title")
                {
                }
                field(Department; Rec.Department)
                {
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Appraisal Stage"; Rec."Appraisal Stage")
                {
                }
                field(Sent; Rec.Sent)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control26; Outlook)
            {
            }
            systempart(Control27; Notes)
            {
            }
            systempart(Control28; MyNotes)
            {
            }
            systempart(Control29; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Appraisal)
            {
                Caption = 'Appraisal';
                action(SendSupervisor)
                {
                    Caption = 'Send to Supervisor';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        Rec.TestField("Appraisal Stage", Rec."Appraisal Stage"::"Target Setting");
                        Rec.TestField("Employee No");

                        if Confirm('Send to supervisor?', false) = false then exit;

                        Rec."Appraisal Stage" := Rec."Appraisal Stage"::"Target Approval";
                        Rec.Modify();
                        Message('Appraisal sent to supervisor');
                    end;
                }
            }
        }
    }
}

