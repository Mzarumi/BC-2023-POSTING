page 52185537 "Misc. Article Information List"
{
    Caption = 'Misc. Article Information';
    DataCaptionFields = "Employee No.";
    PageType = ListPart;
    SourceTable = "Misc. Article Information";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Employee No."; Rec."Employee No.")
                {
                    Visible = false;
                }
                field("Misc. Article Code"; Rec."Misc. Article Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Serial No."; Rec."Serial No.")
                {
                }
                field("From Date"; Rec."From Date")
                {
                }
                field("To Date"; Rec."To Date")
                {
                    Editable = false;
                }
                field("In Use"; Rec."In Use")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
            }
        }
    }

    actions
    {
    }
}

