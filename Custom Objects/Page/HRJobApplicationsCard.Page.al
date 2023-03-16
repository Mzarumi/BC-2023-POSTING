page 52185529 "HR Job Applications Card"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Other Details,Job Details';
    SourceTable = "HR Job Applications";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Job Application No."; Rec."Job Application No.")
                {
                    Importance = Promoted;
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Applicant Type"; Rec."Applicant Type")
                {
                    Editable = false;
                }
                group(Control39)
                {
                    ShowCaption = false;
                    grid(Control38)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control21)
                        {
                            ShowCaption = false;
                            field("Employee Requisition No"; Rec."Employee Requisition No")
                            {
                                Caption = 'Application Reff No.';
                                Importance = Promoted;
                            }
                            field("Job Applied For"; Rec."Job Applied For")
                            {
                                Caption = 'Position Applied For';
                                Editable = false;
                                Enabled = true;
                                Importance = Promoted;
                            }
                            field("Job Applied for Description"; Rec."Job Applied for Description")
                            {
                                Editable = false;
                                ShowCaption = false;
                            }
                        }
                    }
                }
                group(Control18)
                {
                    ShowCaption = false;
                    grid(Control15)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control16)
                        {
                            ShowCaption = false;
                            field("First Name"; Rec."First Name")
                            {
                                Importance = Promoted;
                                StyleExpr = TRUE;
                            }
                            field("Middle Name"; Rec."Middle Name")
                            {
                                Importance = Promoted;
                                StyleExpr = TRUE;
                            }
                            field("Last Name"; Rec."Last Name")
                            {
                                Importance = Promoted;
                                StyleExpr = TRUE;
                            }
                            field(Initials; Rec.Initials)
                            {
                                StyleExpr = TRUE;
                            }
                        }
                    }
                }
                group(Control20)
                {
                    ShowCaption = false;
                    grid(Control19)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control17)
                        {
                            ShowCaption = false;
                            field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                            {
                                Caption = '1st Language (R/W/S)';
                                Importance = Promoted;
                                StyleExpr = TRUE;
                            }
                            field("First Language Read"; Rec."First Language Read")
                            {
                                Caption = 'R';
                            }
                            field("First Language Write"; Rec."First Language Write")
                            {
                                Caption = 'W';
                            }
                            field("First Language Speak"; Rec."First Language Speak")
                            {
                                Caption = 'S';
                            }
                            field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                            {
                                Caption = '2nd Language (R/W/S)';
                                Importance = Promoted;
                            }
                            field("Second Language Read"; Rec."Second Language Read")
                            {
                                Caption = 'R';
                            }
                            field("Second Language Write"; Rec."Second Language Write")
                            {
                                Caption = 'W';
                            }
                            field("Second Language Speak"; Rec."Second Language Speak")
                            {
                                Caption = 'S';
                            }
                            field("ID Number"; Rec."ID Number")
                            {
                            }
                            field("Additional Language"; Rec."Additional Language")
                            {
                            }
                        }
                    }
                }
                field(Gender; Rec.Gender)
                {
                    Importance = Promoted;
                }
                field("Post Code"; Rec."Post Code")
                {
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    Importance = Promoted;
                }
                field("Residential Address"; Rec."Residential Address")
                {
                }
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    Importance = Promoted;
                }
                field(Disabled; Rec.Disabled)
                {
                }
                group(Control37)
                {
                    ShowCaption = false;
                    grid(Control36)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control35)
                        {
                            ShowCaption = false;
                            field("Date Of Birth"; Rec."Date Of Birth")
                            {
                            }
                            field(Age; Rec.Age)
                            {
                                Editable = false;
                                Importance = Promoted;
                            }
                        }
                    }
                }
                group(Control5)
                {
                    ShowCaption = false;
                    grid(Control2)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control1)
                        {
                            ShowCaption = false;
                            field(Citizenship; Rec.Citizenship)
                            {
                            }
                            field("Country Details"; Rec."Citizenship Details")
                            {
                                Editable = false;
                                ShowCaption = false;
                            }
                        }
                    }
                }
                field(Picture; Rec.Picture)
                {
                }
                field("Document Status"; Rec."Document Status")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Proposed Salary"; Rec."Proposed Salary")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755008; Outlook)
            {
            }
            systempart(Control3; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Other Details")
            {
                Caption = 'Other Details';
                action(Qualifications)
                {
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Applicant Qualifications";
                    RunPageLink = "Application No" = FIELD("Job Application No.");
                }
                action(Referees)
                {
                    Caption = 'Referees';
                    Image = ContactReference;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "HR Applicant Referees";
                    RunPageLink = "Job Application No" = FIELD("Job Application No.");
                }
                action(Hobbies)
                {
                    Caption = 'Hobbies';
                    Image = Holiday;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "HR Applicant Hobbies";
                    RunPageLink = "Job Application No" = FIELD("Job Application No.");
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';
                action(Requirements)
                {
                    Caption = 'Requirements';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Job Requirement Lines";
                    RunPageLink = "Job ID" = FIELD("Job Applied For");
                }
                action(Responsibilities)
                {
                    Caption = 'Responsibilities';
                    Image = JobResponsibility;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Job Responsiblities Lines";
                    RunPageLink = "Job ID" = FIELD("Job Applied For");
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Applicant Type":="Applicant Type"::Internal;
    end;

    var
        HRJobApplications: Record "HR Job Applications";
        //SMTP: Codeunit "SMTP Mail";
        HREmailParameters: Record "HR E-Mail Parameters";
        Employee: Record "HR Employees";
        Text19064672: Label 'Shortlisting Summary';
        DAge: Text[100];
        Text0000: Label '                     ';
}

