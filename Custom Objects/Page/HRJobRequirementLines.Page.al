page 52185518 "HR Job Requirement Lines"
{
    PageType = List;
    SourceTable = "HR Job Requirements";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Qualification Type"; Rec."Qualification Type")
                {
                    Importance = Promoted;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    Importance = Promoted;
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Minimum Score"; Rec."Minimum Score")
                {
                }
                field("Maximum Score"; Rec."Maximum Score")
                {
                }
                field(Control4; Rec."Related Qualification")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Action3)
            {
                Caption = 'Related Qualification';
                Image = JobLines;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "HR Related Job Qualification";
                RunPageLink = "Qualification ID" = FIELD("Qualification Code"),
                              "Qualification Type" = FIELD("Qualification Type");
            }
        }
    }
}

