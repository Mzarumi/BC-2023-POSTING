page 52186495 "HR Disciplinary Cases SF"
{
    PageType = ListPart;
    SourceTable = "HR Disciplinary Cases NCA";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Case Number"; Rec."Case Number")
                {
                    Editable = true;
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    Caption = 'Date Of Occurance';
                }
                field(Status; Rec.Status)
                {
                }
                field(Selected; Rec.Selected)
                {
                    Caption = 'Repeat';
                }
                field("Type Complaint"; Rec."Type Complaint")
                {
                }
                field("Description of Complaint"; Rec."Description of Complaint")
                {
                }
                field("Case Discussion"; Rec."Case Discussion")
                {
                }
                field("Mode of Lodging the Complaint"; Rec."Mode of Lodging the Complaint")
                {
                }
                field("Accused Employee"; Rec."Accused Employee")
                {
                }
                field("Witness #1"; Rec."Witness #1")
                {
                }
                field("Witness #2"; Rec."Witness #2")
                {
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                }
                field("Action Taken"; Rec."Action Taken")
                {
                }
                field(Recomendations; Rec.Recomendations)
                {
                }
                field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
                {
                }
            }
        }
    }

    actions
    {
    }
}

