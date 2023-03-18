page 52185633 "Salary Grades"
{
    PageType = List;
    SourceTable = "Salary Grades";

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;
                field("Salary Grade"; Rec."Salary Grade")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Minimum Amount"; Rec."Minimum Amount")
                {
                }
                field("Maxmum Amount"; Rec."Maxmum Amount")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Salary Notches")
            {
                Caption = 'Salary Notches';
                action(Notch)
                {
                    Caption = 'Notch';
                    Image = NumberGroup;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Salary Notches";
                    RunPageLink = "Salary Grade" = FIELD("Salary Grade");
                }
            }
        }
    }
}

