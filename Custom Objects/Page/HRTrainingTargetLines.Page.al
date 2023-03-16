page 52186541 "HR Training Target Lines"
{
    PageType = ListPart;
    SourceTable = "HR Individual Target Line";
    SourceTableView = WHERE("Perspective Type" = CONST("Training and Development"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Perspective Code"; Rec."Perspective Code")
                {
                    Visible = false;
                }
                field("Perspective Description"; Rec."Perspective Description")
                {
                    Visible = false;
                }
                field(Objective; Rec.Objective)
                {
                    Editable = TargetSettingStatus;
                    Enabled = TargetSettingStatus;
                }
                field(Strategy; Rec.Strategy)
                {
                }
                field(Measures; Rec.Measures)
                {
                }
                field(Baseline; Rec.Baseline)
                {
                }
                field("Targeted Score"; Rec."Targeted Score")
                {
                    Editable = TargetSettingStatus;
                    Enabled = TargetSettingStatus;
                }
                field(Change; Rec.Change)
                {
                }
                field("Quarter 1"; Rec."Quarter 1")
                {
                }
                field("Agreed Mid Year Rating"; Rec."Agreed Mid Year Rating")
                {
                    Visible = false;
                }
                field("Agreed End Year Rating"; Rec."Agreed End Year Rating")
                {
                    Visible = false;
                }
                field("Mid Year Self Rating"; Rec."Mid Year Self Rating")
                {
                    Visible = false;
                }
                field("Mid Year Supervisor Rating"; Rec."Mid Year Supervisor Rating")
                {
                    Visible = false;
                }
                field("Achieved Score"; Rec."Achieved Score")
                {
                    Editable = AppraisalStatus;
                    Enabled = AppraisalStatus;
                }
                field("Unachieved Targets"; Rec."Unachieved Targets")
                {
                    Editable = false;
                }
                field("Quarter 3"; Rec."Quarter 3")
                {
                }
                field("Self Rating"; Rec."Self Rating")
                {
                    Editable = SelfRating;
                    Enabled = SelfRating;
                }
                field("Supervisor Rating"; Rec."Supervisor Rating")
                {
                    Editable = SupervisorRating;
                    Enabled = SupervisorRating;
                }
                field("Agreed Rating"; Rec."Agreed Rating")
                {
                    Editable = AgreedRating;
                    Enabled = AgreedRating;
                }
                field("Appraisee Comments"; Rec."Appraisee Comments")
                {
                    Editable = SelfRating;
                    Enabled = SelfRating;
                }
                field("Appraiser Comments"; Rec."Appraiser Comments")
                {
                    Editable = SupervisorRating;
                    Enabled = SupervisorRating;
                }
                field("Perspective Type"; Rec."Perspective Type")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        FnEdittableUnedittable;
    end;

    trigger OnInit()
    begin
        FnEdittableUnedittable;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        FnEdittableUnedittable;

        Rec."Perspective Type" := Rec."Perspective Type"::"Training and Development";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        FnEdittableUnedittable;

        Rec."Perspective Type" := Rec."Perspective Type"::"Training and Development";
    end;

    trigger OnOpenPage()
    begin
        FnEdittableUnedittable;
    end;

    var
        TargetSettingStatus: Boolean;
        AppraisalStatus: Boolean;
        SupervisorRating: Boolean;
        AgreedRating: Boolean;
        SelfRating: Boolean;

    //[Scope('Internal')]
    procedure FnEdittableUnedittable()
    begin
        Rec.CalcFields("Appraisal Type", Status);

        if (Rec."Appraisal Type" = Rec."Appraisal Type"::"Target Setting") then begin
            TargetSettingStatus := true;
            AppraisalStatus := false;
            SupervisorRating := false;
            AgreedRating := false;
            SelfRating := false;
        end else
            if (Rec."Appraisal Type" = Rec."Appraisal Type"::"Quarter 1") then begin
                TargetSettingStatus := false;
                AppraisalStatus := false;
                SupervisorRating := true;
                AgreedRating := false;
                SelfRating := true;
            end else
                if (Rec."Appraisal Type" = Rec."Appraisal Type"::"Appraisal Review") then begin
                    TargetSettingStatus := false;
                    AppraisalStatus := true;
                    SupervisorRating := false;
                    AgreedRating := true;
                    SelfRating := false;
                end;


        /*
         IF ("Appraisal Type"="Appraisal Type"::"Appraisal Review") AND (Status=Status::Open) THEN BEGIN
         TargetSettingStatus:=TRUE;
         AppraisalStatus:=FALSE;
         SupervisorRating:=FALSE;
         AgreedRating:=FALSE;
         SelfRating:=FALSE;
         END ELSE
         IF ("Appraisal Type"="Appraisal Type"::"Appraisal Review") AND (Status<>Status::Open) THEN BEGIN
         TargetSettingStatus:=FALSE;
         AppraisalStatus:=FALSE;
         SupervisorRating:=FALSE;
         AgreedRating:=FALSE;
         SelfRating:=FALSE;
         END ELSE
         IF (("Appraisal Type"="Appraisal Type"::"Target Setting") OR ("Appraisal Type"="Appraisal Type"::"End Year Appraisal"))
          AND (Status=Status::Open) THEN BEGIN
         TargetSettingStatus:=FALSE;
         AppraisalStatus:=TRUE;
         SupervisorRating:=FALSE;
         AgreedRating:=FALSE;
         SelfRating:=TRUE;
         END ELSE
         IF (("Appraisal Type"="Appraisal Type"::"Target Setting") OR ("Appraisal Type"="Appraisal Type"::"End Year Appraisal"))
         AND (Status=Status::"Pending Approval") THEN BEGIN
         TargetSettingStatus:=FALSE;
         AppraisalStatus:=FALSE;
         SupervisorRating:=TRUE;
         AgreedRating:=TRUE;
         SelfRating:=FALSE;
         END ELSE
         IF (("Appraisal Type"="Appraisal Type"::"Target Setting") OR ("Appraisal Type"="Appraisal Type"::"End Year Appraisal"))
         AND (Status=Status::Approved) THEN BEGIN
         TargetSettingStatus:=FALSE;
         AppraisalStatus:=FALSE;
         SupervisorRating:=FALSE;
         AgreedRating:=FALSE;
         SelfRating:=FALSE;
         END;
         IF (Status=Status::Posted) THEN BEGIN
         TargetSettingStatus:=FALSE;
         AppraisalStatus:=FALSE;
         SupervisorRating:=FALSE;
         AgreedRating:=FALSE;
         SelfRating:=FALSE;
         END
        */

    end;
}

