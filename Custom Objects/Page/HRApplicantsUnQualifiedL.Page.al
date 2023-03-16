page 52185590 "HR Applicants UnQualified L"
{
    CardPageID = "HR Applicants UnQualified Card";
    PageType = List;
    SourceTable = "HR Job Applications";
    SourceTableView = WHERE(Qualified = FILTER(false));

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
                action("Send Regret Alert")
                {
                    Caption = 'Send Regret Alert';
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin

                        //IF CONFIRM('Send this Requisition for Approval?',TRUE)=FALSE THEN EXIT;
                        if not Confirm(Text003, false) then exit;

                        //Rec.TestField(Qualified, Qualified::"0");
                        HRJobApplications.SetRange(HRJobApplications."Job Application No.", Rec."Job Application No.");
                        CurrPage.SetSelectionFilter(HRJobApplications);
                        if HRJobApplications.Find('-') then
                            //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
                            HREmailParameters.Reset;
                        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Regret Notification");
                        if HREmailParameters.Find('-') then begin
                            repeat
                                HRJobApplications.TestField(HRJobApplications."E-Mail");
                            // SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", HRJobApplications."E-Mail",
                            // HREmailParameters.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ' ' + HREmailParameters.Body + ' ' + HRJobApplications."Job Applied for Description" + ' ' + 'applied on' + ' ' + Format("Date Applied") + ' ' + HREmailParameters."Body 2", true);
                            // //HREmailParameters."Body 2"+' '+ FORMAT("Date Applied")+'. '+
                            // // HREmailParameters.Body,TRUE);
                            // SMTP.Send();
                            until HRJobApplications.Next = 0;

                            Message('All Unqualified  candidates have been sent regret alerts');
                        end;
                    end;
                }
            }
        }
    }

    var
        Text001: Label 'Are you sure you want to Upload Applicants Details to the Employee Card?';
        Text002: Label 'Are you sure you want to Send this Interview invitation?';
        HRJobApplications: Record "HR Job Applications";
        //here//SMTP: Codeunit "SMTP Mail";
        CTEXTURL: Text[30];
        HREmailParameters: Record "HR E-Mail Parameters";
        Text003: Label 'Are you sure you want to Send Regret Notification?';
}

