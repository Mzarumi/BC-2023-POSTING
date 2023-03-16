page 52185572 "HR Applicant Qualifications"
{
    Caption = 'Applicant Qualifications';
    PageType = List;
    SaveValues = true;
    ShowFilter = true;
    SourceTable = "HR Applicant Qualifications";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Qualification Type"; Rec."Qualification Type")
                {
                    Importance = Promoted;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("From Date"; Rec."From Date")
                {
                }
                field("To Date"; Rec."To Date")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Institution/Company"; Rec."Institution/Company")
                {
                    Importance = Promoted;
                }
                field("Score ID"; Rec."Score ID")
                {
                    Importance = Promoted;
                }
            }
        }
    }

    actions
    {
    }
}

