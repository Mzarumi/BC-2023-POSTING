page 52185509 "HR Job Occupants"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report';
    SourceTable = "HR Jobs";

    layout
    {
        area(content)
        {
            group("Job Details")
            {
                Caption = 'Job Details';
                Editable = false;
                field("Job ID"; Rec."Job ID")
                {
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Enabled = false;
                    Importance = Promoted;
                }
            }
            part("Job Occupants"; "HR Employee List - Active")
            {
                Caption = 'Job Occupants';
                Editable = false;
                SubPageLink = "Job ID" = FIELD("Job ID");
            }
        }
        area(factboxes)
        {
            part(Control1102755005; "HR Job Applications Factbox")
            {
                SubPageLink = "Job Application No." = FIELD("Job ID");
            }
            systempart(Control1102755003; Outlook)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print HR Job Occupants")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    /*HRJobReq.RESET;
                    HRJobReq.SETRANGE(HRJobReq."Job ID","Job ID");
                    IF HRJobReq.FIND('-') THEN
                    BEGIN */
                    //REPORT.Run(REPORT::"HR Job Occupants", true, true, Rec);
                    //END;

                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.IsEmpty then
            Error('No jobs have been setup');
    end;

    var
        Text19006026: Label 'Job Occupants';
}

