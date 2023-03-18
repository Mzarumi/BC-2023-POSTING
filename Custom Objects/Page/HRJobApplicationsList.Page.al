page 52185528 "HR Job Applications List"
{
    CardPageID = "HR Job Applications Card";
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Applicant,Functions,Print';
    SourceTable = "HR Job Applications";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                ShowCaption = false;
                field("Job Application No."; Rec."Job Application No.")
                {
                    Importance = Promoted;
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
                    Caption = 'Job Applied For';
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    Caption = 'Job Description';
                }
                field("Document Status"; Rec."Document Status")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1; Links)
            {
            }
        }
    }

    actions
    {
    }

    var
        HRJobApplications: Record "HR Job Applications";
        Text001: Label 'Are you sure you want to Upload Applicants Details to the Employee Card?';
        Text002: Label 'Are you sure you want to Send an Interview Application?';
}

