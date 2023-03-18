page 52186552 "HR Interview Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Shortlist';
    SourceTable = "HR Employee Requisitions";
    SourceTableView = WHERE("Approval Status" = CONST(Canceled),
                            Closed = CONST(false));

    layout
    {
        area(content)
        {
            group("Job Details")
            {
                Caption = 'Job Details';
                Editable = true;
                field("Job ID"; Rec."Job ID")
                {
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    Editable = "Requisition DateEditable";
                    Enabled = false;
                    Importance = Promoted;
                }
                field(Priority; Rec.Priority)
                {
                    Editable = PriorityEditable;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Required Positions"; Rec."Required Positions")
                {
                    Editable = "Required PositionsEditable";
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Enabled = false;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
            }
            part(Shortlisted; "HR Shortlisting Lines")
            {
                Editable = ShortlistedEditable;
                SubPageLink = "Employee Requisition No" = FIELD("Requisition No.");
            }
        }
        area(factboxes)
        {
            part(Control1102755003; "HR Jobs Factbox")
            {
                SubPageLink = "Job ID" = FIELD("Job ID");
            }
            systempart(Control1102755001; Outlook)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Applicants)
            {
                Caption = 'Applicants';
                action("&ShortList Applicants")
                {
                    Caption = '&ShortList Applicants';
                    Image = SelectField;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HRJobRequirements.Reset;
                        HRJobRequirements.SetRange(HRJobRequirements."Job ID", Rec."Job ID");
                        if HRJobRequirements.Count = 0 then begin
                            Message('Job Requirements for the job ' + Rec."Job ID" + ' have not been setup');
                            exit;
                        end else begin

                            //GET JOB REQUIREMENTS
                            HRJobRequirements.Reset;
                            HRJobRequirements.SetRange(HRJobRequirements."Job ID", Rec."Job ID");

                            //DELETE ALL RECORDS FROM THE SHORTLISTED APPLICANTS TABLE
                            HRShortlistedApplicants.Reset;
                            HRShortlistedApplicants.SetRange(HRShortlistedApplicants."Employee Requisition No", Rec."Requisition No.");
                            HRShortlistedApplicants.DeleteAll;

                            //GET JOB APPLICANTS
                            HRJobApplications.Reset;
                            HRJobApplications.SetRange(HRJobApplications."Employee Requisition No", Rec."Requisition No.");
                            if HRJobApplications.Find('-') then begin
                                repeat
                                    Qualified := true;
                                    if HRJobRequirements.Find('-') then begin
                                        StageScore := 0;
                                        Rec.Score := 0;
                                        repeat
                                            //GET THE APPLICANTS QUALIFICATIONS AND COMPARE THEM WITH THE JOB REQUIREMENTS
                                            AppQualifications.Reset;
                                            AppQualifications.SetRange(AppQualifications."Application No", HRJobApplications."Job Application No.");
                                            AppQualifications.SetRange(AppQualifications."Qualification Code", HRJobRequirements."Qualification Code");
                                            if AppQualifications.Find('-') then begin
                                                Rec.Score := Rec.Score + AppQualifications."Score ID";
                                                if AppQualifications."Score ID" < HRJobRequirements."Maximum Score" then
                                                    Qualified := false;
                                            end else begin
                                                Qualified := false;
                                            end;

                                        until HRJobRequirements.Next = 0;
                                    end;

                                    HRShortlistedApplicants."Employee Requisition No" := Rec."Requisition No.";
                                    HRShortlistedApplicants."Job Application No" := HRJobApplications."Job Application No.";
                                    HRShortlistedApplicants."Stage Score" := Rec.Score;
                                    HRShortlistedApplicants.Qualified := Qualified;
                                    HRShortlistedApplicants."First Name" := HRJobApplications."First Name";
                                    HRShortlistedApplicants."Middle Name" := HRJobApplications."Middle Name";
                                    HRShortlistedApplicants."Last Name" := HRJobApplications."Last Name";
                                    HRShortlistedApplicants."ID No" := HRJobApplications."ID Number";
                                    HRShortlistedApplicants.Gender := HRJobApplications.Gender;
                                    HRShortlistedApplicants."Marital Status" := HRJobApplications."Marital Status";
                                    HRShortlistedApplicants.Insert;

                                until HRJobApplications.Next = 0;
                            end;
                            //MARK QUALIFIED APPLICANTS AS QUALIFIED
                            HRShortlistedApplicants.SetRange(HRShortlistedApplicants.Qualified, true);
                            if HRShortlistedApplicants.Find('-') then
                                repeat
                                    HRJobApplications.Get(HRShortlistedApplicants."Job Application No");
                                    HRJobApplications.Qualified := true;
                                    HRJobApplications.Modify;
                                until HRShortlistedApplicants.Next = 0;
                            /*
                            RecCount:= 0;
                            MyCount:=0;
                            StageShortlist.RESET;
                            StageShortlist.SETRANGE(StageShortlist."Need Code","Need Code");
                            StageShortlist.SETRANGE(StageShortlist."Stage Code","Stage Code");

                            IF StageShortlist.FIND('-') THEN BEGIN
                            RecCount:=StageShortlist.COUNT ;
                            StageShortlist.SETCURRENTKEY(StageShortlist."Stage Score");
                            StageShortlist.ASCENDING;
                            REPEAT
                            MyCount:=MyCount + 1;
                            StageShortlist.Position:=RecCount - MyCount;
                            StageShortlist.MODIFY;
                            UNTIL StageShortlist.NEXT = 0;
                            END;
                            */
                            Message('%1', 'Shortlisting Competed Successfully.');

                        end;
                        //END ELSE
                        //MESSAGE('%1','You must select the stage you would like to shortlist.');

                    end;
                }
                action("Interview Details")
                {
                    Caption = 'Interview Details';
                    RunObject = Page "HR Interview Card";
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnInit()
    begin
        "Required PositionsEditable" := true;
        PriorityEditable := true;
        ShortlistedEditable := true;
        "Requisition DateEditable" := true;
        "Job IDEditable" := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord;
    end;

    var
        HRJobRequirements: Record "HR Job Requirements";
        AppQualifications: Record "HR Applicant Qualifications";
        HRJobApplications: Record "HR Job Applications";
        Qualified: Boolean;
        StageScore: Decimal;
        HRShortlistedApplicants: Record "HR Shortlisted Applicants";
        MyCount: Integer;
        RecCount: Integer;
        HREmpReq: Record "HR Employee Requisitions";
        [InDataSet]
        "Job IDEditable": Boolean;
        [InDataSet]
        "Requisition DateEditable": Boolean;
        [InDataSet]
        ShortlistedEditable: Boolean;
        [InDataSet]
        PriorityEditable: Boolean;
        [InDataSet]
        "Required PositionsEditable": Boolean;
        Text19057439: Label 'Short Listed Candidates';

    //[Scope('Internal')]
    procedure UpdateControls()
    begin

        if Rec."Approval Status" = "Approval Status"::Open then begin
            "Job IDEditable" := true;
            "Requisition DateEditable" := true;
            ShortlistedEditable := true;
            PriorityEditable := true;
            "Required PositionsEditable" := true;
        end else begin
            "Job IDEditable" := false;
            "Requisition DateEditable" := false;
            ShortlistedEditable := false;
            PriorityEditable := false;
            "Required PositionsEditable" := false;
        end;
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;

        UpdateControls;
    end;
}

