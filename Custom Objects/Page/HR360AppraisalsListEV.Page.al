page 52186524 "HR 360 Appraisals List - EV"
{
    CardPageID = "HR 360 Appraisal Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Functions,Appraisal';
    SourceTable = "HR Appraisal Header";
    SourceTableView = WHERE("Appraisal Stage" = CONST("End Year Evalauation"));

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
            group(Action1000000005)
            {
                Caption = 'Functions';
                action(ReturnSupervisor)
                {
                    Caption = 'Return to Supervisor';
                    Image = Return;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        Rec.TestField("Appraisal Stage", Rec."Appraisal Stage"::"End Year Evalauation");

                        if Confirm('Return to supervisor?', false) = false then exit;

                        Rec."Appraisal Stage" := Rec."Appraisal Stage"::"Target Approval";
                        Rec.Modify;
                        Message('Appraisal returned to supervisor');
                    end;
                }
                action(ReturnAppraisee)
                {
                    Caption = 'Return to Appraisee';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        Rec.TestField("Appraisal Stage");

                        if Confirm('Return to appraisee?', false) = false then exit;

                        Rec."Appraisal Stage" := Rec."Appraisal Stage"::"Target Setting";
                        Rec.Modify;
                        Message('Appraisal returned to appraisee');
                    end;
                }
            }
        }
    }
}

