page 52185514 "HR Job Requirements"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Jobs";

    layout
    {
        area(content)
        {
            group("Job Specification")
            {
                Caption = 'Job Details';
                field("Job ID"; Rec."Job ID")
                {
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                }
            }
            // group("Job Requirements")
            // {
            //     part("Job Req"; "HR Job Requirement Lines")
            //     {
            //         SubPageLink = "Job ID" = FIELD("Job ID");
            //     }
            // }
        }
        area(factboxes)
        {
            systempart(Control1102755008; Outlook)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Job Requirements")
            {
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    HRJobReq.Reset;
                    HRJobReq.SetRange(HRJobReq."Job ID", Rec."Job ID");
                    if HRJobReq.Find('-') then begin
                        //REPORT.Run(REPORT::"HR Job Requirements", true, true, HRJobReq);
                    end;
                end;
            }
        }
    }

    var
        HRJobReq: Record "HR Jobs";
}

