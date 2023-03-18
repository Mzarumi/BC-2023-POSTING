page 52185539 "HR Employee Qualifications"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Qualification';
    SourceTable = "HR Employees";

    layout
    {
        area(content)
        {
            group("Employee Details")
            {
                Caption = 'Employee Details';
                field("No."; Rec."No.")
                {
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    StyleExpr = TRUE;
                }
                // field(FullName; Rec.FullName)
                // {
                //     Caption = 'Name';
                //     Editable = false;
                //     Enabled = false;
                //     Importance = Promoted;
                //     StyleExpr = TRUE;
                // }
                field("Job Title"; Rec."Job Title")
                {
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    StyleExpr = TRUE;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    Editable = false;
                    Enabled = false;
                    StyleExpr = TRUE;
                }
                field(Gender; Rec.Gender)
                {
                    Editable = false;
                    Enabled = false;
                    StyleExpr = TRUE;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Editable = false;
                    Enabled = false;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    StyleExpr = TRUE;
                }
            }
            part("Employee Qualifications"; "HR Employee Qualification Line")
            {
                Caption = 'Employee Qualifications';
                SubPageLink = "Employee No." = FIELD("No.");
            }
            systempart(Control1102755011; Outlook)
            {
            }
        }
        area(factboxes)
        {
            systempart(Control1102755010; Outlook)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Q&ualification")
            {
                Caption = 'Q&ualification';
                action("Q&ualification Overview")
                {
                    Caption = 'Q&ualification Overview';
                    Image = TaskQualityMeasure;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Qualification Overview";
                }
            }
        }
    }
}

