page 52186504 "HR Employee Exit Interviews"
{
    DeleteAllowed = false;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Exit Interview';
    SourceTable = "HR Employee Exit Interviews";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Exit Interview No"; Rec."Exit Interview No")
                {
                    Editable = false;
                }
                field("Date Of Interview"; Rec."Date Of Interview")
                {
                }
                field("Interview Done By"; Rec."Interview Done By")
                {
                }
                field("Interviewer Name"; Rec."Interviewer Name")
                {
                    Editable = false;
                }
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                }
                field("Reason For Leaving"; Rec."Reason For Leaving")
                {
                }
                field("Reason For Leaving (Other)"; Rec."Reason For Leaving (Other)")
                {
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                }
                field("Re Employ In Future"; Rec."Re Employ In Future")
                {
                }
                field(Comment; Rec.Comment)
                {
                    MultiLine = true;
                }
                field("Form Submitted"; Rec."Form Submitted")
                {
                }
                field(Closed; Rec.Closed)
                {
                    Editable = false;
                }
            }
            part(SF; "Misc. Article Information List")
            {
                Caption = 'Allocated Assets';
                SubPageLink = "Employee No." = FIELD("Employee No.");
                SubPageView = WHERE("In Use" = FILTER(true));
            }
        }
        area(factboxes)
        {
            systempart(Control1102755008; Outlook)
            {
            }
            systempart(Control1102755010; Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Exit Interview")
            {
                Caption = '&Exit Interview';
                action("Close Interview")
                {
                    Image = ClearLog;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Rec.TestField("Form Submitted");
                        Rec.TestField("Reason For Leaving");
                        Rec.TestField("Employee No.");


                        if Confirm(Text001, true) = false then exit;

                        HREmp.Reset;
                        HREmp.SetRange(HREmp."No.", Rec."Employee No.");
                        if HREmp.Find('-') then begin
                            // HREmp."Date Of Leaving the Company" := Rec."Date Of Leaving";
                            HREmp."Termination Category" := Rec."Reason For Leaving";
                            HREmp."Exit Interview Date" := Rec."Date Of Interview";
                            HREmp."Exit Interview Done by" := Rec."Interview Done By";
                            HREmp."Allow Re-Employment In Future" := Rec."Re Employ In Future";
                            HREmp.Status := HREmp.Status::InActive;
                            HREmp.Modify;
                            Rec.Closed := true;
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        /*
       IF HREmp.GET(Dependants) THEN BEGIN
       JobTitle:=HREmp."Job Title";
       sUserID:=HREmp."User ID";
       END ELSE BEGIN
       JobTitle:='';
       sUserID:='';
       END;


       SETRANGE(Dependants);
       DAge:='';
       DService:='';
       DPension:='';
       DMedical:='';

       RecalcDates;
            */

        UpdateControls;

    end;

    trigger OnOpenPage()
    begin
        UpdateControls;
    end;

    var
        JobTitle: Text[30];
        Supervisor: Text[60];
        HREmp: Record "HR Employees";
        Dates: Codeunit "HR Codeunit2";
        DAge: Text[100];
        DService: Text[100];
        DPension: Text[100];
        DMedical: Text[100];
        HREmpForm: Page "HR Employee Card";
        sUserID: Code[30];
        DoclLink: Record "HR Company Attachments";
        InteractTemplLanguage: Record "Interaction Tmpl. Language";
        D: Date;
        Misc: Record "Misc. Article Information";
        Text19062217: Label 'Misc Articles';
        Text001: Label 'Closing this interview will deactivate the employee. Do you want to continue?';
        Text002: Label 'Exit interview successfully closed.';

    //[Scope('Internal')]
    procedure RecalcDates()
    begin
    end;

    local procedure EmployeeNoOnAfterValidate()
    begin
        /*
       CurrPage.SAVERECORD;
       FILTERGROUP := 2;
       //Misc.SETRANGE(Misc."Employee No.",Dependants);
       FILTERGROUP := 0;
       IF Misc.FIND('-') THEN;
       CurrPage.UPDATE(FALSE);
         */

    end;

    //[Scope('Internal')]
    procedure UpdateControls()
    begin
        if Rec.Closed then begin
            CurrPage.Editable := false;
        end else begin
            CurrPage.Editable := true;
        end;
    end;
}

