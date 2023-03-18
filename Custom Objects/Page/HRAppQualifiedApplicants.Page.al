page 52186602 "HR  App Qualified Applicants"
{
    CardPageID = "HR Job Applicants Qualified Ca";
    Editable = false;
    PageType = List;
    SourceTable = "HR Job Applications";
    SourceTableView = WHERE(Qualified = CONST(true),
                            "Approval Status" = FILTER(Approved),
                            Uploaded = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job Application No."; Rec."Job Application No.")
                {
                }
                field("Full Name"; Rec."Full Name")
                {
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    StyleExpr = TRUE;
                }
                field("Employee Requisition No"; Rec."Employee Requisition No")
                {
                    Caption = 'Application Ref. No.';
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    Caption = 'Job ID';
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    Caption = 'Job Description';
                }
                field(Qualified; Rec.Qualified)
                {
                }
                field(Uploaded; Rec.Uploaded)
                {
                }
                field("From Time"; Rec."From Time")
                {
                }
                field("To Time"; Rec."To Time")
                {
                }
                field(Venue; Rec.Venue)
                {
                }
                field(Status; Rec.Status)
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Interview Invitation Sent"; Rec."Interview Invitation Sent")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Applicant)
            {
                Caption = 'Applicant';
                action("Send Interview Invitation")
                {
                    Caption = 'Send Interview Invitation';
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        FN: Text;
                    begin
                        //Rec.TestField(Qualified, Qualified::"1");
                        //Rec.TestField("Date of Interview");
                        //Rec.TestField("From Time");
                        //Rec.TestField("To Time");
                        //Rec.TestField(Venue);


                        FN := Rec."First Name" + ' ' + Rec."Middle Name" + ' ' + Rec."Last Name";
                        if not Confirm(Text002, false, FN) then exit;



                        if Rec."Interview Invitation Sent" = true then Error('Applicant has already been notified');

                        HRJobApplications.SetRange(HRJobApplications."Job Application No.", Rec."Job Application No.");
                        CurrPage.SetSelectionFilter(HRJobApplications);

                        if HRJobApplications.Find('-') then
                            //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
                            HREmailParameters.Reset;
                        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Interview Invitations");
                        if not HREmailParameters.Find('-') then Error('Please setup Email Parameters');
                        begin
                            repeat
                                HRJobApplications.TestField(HRJobApplications."E-Mail");
                            // SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", HRJobApplications."E-Mail",
                            // HREmailParameters.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + '<BR><br>' + HREmailParameters.Body + ' '
                            // + HRJobApplications."Job Applied for Description" + ' ' + 'applied on ' + Format("Date Applied") + ' ' + HREmailParameters."Body 2" + '<br>'
                            // + HREmailParameters."Body 3" + ' ' + Format(HRJobApplications."Date of Interview") + ' '
                            // + 'Starting at ' + Format(HRJobApplications."From Time") + ' to ' + Format(HRJobApplications."To Time") + ' Venue ' + HRJobApplications.Venue
                            // + '<br><br>Best Regards' + '<br>' + CompanyName, true);

                            // SMTP.Send();
                            until HRJobApplications.Next = 0;

                            Rec."Interview Invitation Sent" := true;
                            Rec.Modify;
                            Message('%1 has been invited for the Interview Invitation via E-Mail ', FN)
                        end;
                    end;
                }
                action("Job Interview details")
                {
                    Caption = 'Job Interview details';
                    Image = ApplicationWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "HR Job Interview";
                    RunPageLink = "Applicant No" = FIELD("Job Application No.");
                }
                action("Job Applicant Card")
                {
                    Caption = 'Job Applicant Card';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "HR Job Applications Card";
                    RunPageLink = "Job Application No." = FIELD("Job Application No.");
                }
                action("Applicant Qualifications")
                {
                    Caption = 'Applicant Qualifications';
                    Image = QualificationOverview;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Page "HR Applicant Qualifications";
                    RunPageLink = "Application No" = FIELD("Job Application No.");
                }
                action("Applicant Referees")
                {
                    Caption = 'Applicant Referees';
                    Image = ContactReference;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Page "HR Applicant Referees";
                    RunPageLink = "Job Application No" = FIELD("Job Application No.");
                }
                action("Applicant Hobbies")
                {
                    Caption = 'Applicant Hobbies';
                    Image = Holiday;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Page "HR Applicant Hobbies";
                    RunPageLink = "Job Application No" = FIELD("Job Application No.");
                }
                action("Upload to Employees")
                {
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    //RunObject = Report "HR Applicant to Employee";
                    Visible = true;

                    trigger OnAction()
                    begin
                        ////REPORT.Run(report::"HR Applicant to Employee",rec);
                        ////REPORT.Run(Number [, ReqWindow] [, SystemPrinter] [, Record])
                    end;
                }
            }
        }
    }

    var
        Text001: Label 'Are you sure you want to upload "%1" to the Employee List?';
        Text002: Label 'Are you sure you want to Send this Interview invitation to\%1?';
        HRJobApplications: Record "HR Job Applications";
        //SMTP: Codeunit "SMTP Mail";
        CTEXTURL: Text[30];
        HREmailParameters: Record "HR E-Mail Parameters";
        Interview: Record "HR Job Interview";
        fn: Text;
}

