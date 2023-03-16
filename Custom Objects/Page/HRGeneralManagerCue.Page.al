page 52186579 "HR General Manager Cue"
{
    PageType = CardPart;
    SourceTable = "HR Manager Cue";

    layout
    {
        area(content)
        {
            cuegroup("Employee Cues")
            {
                Caption = 'Employee Cues';
                field("Pending Approvals"; Rec."Pending Approvals")
                {
                }
                field("Approved Job Posistions"; Rec."Approved Job Posistions")
                {
                }
                field("Requisitions Pending Approval"; Rec."Requisitions Pending Approval")
                {
                }
                field(Active; Rec.Active)
                {
                    Caption = 'All Active Employees';
                    Image = Stack;
                }
            }
            cuegroup(Control17)
            {
                ShowCaption = false;
                field(Female; Rec.Female)
                {
                    Caption = 'Female Employees';
                    Image = Stack;
                }
                field(Male; Rec.Male)
                {
                    Caption = 'Male Employees';
                    Image = Stack;
                }
                field("Contracts Due"; Rec."Contracts Due")
                {
                }
                field("Probation Due"; Rec."Probation Due")
                {
                }
            }
            cuegroup(Control18)
            {
                ShowCaption = false;
                field("Upcoming Birthdays"; Rec."Upcoming Birthdays")
                {
                }
                field("Leave Resume Due"; Rec."Leave Resume Due")
                {
                }
                field("Upcoming Leave"; Rec."Upcoming Leave")
                {
                }
                field("Upcoming Company Activities"; Rec."Upcoming Company Activities")
                {
                }
            }
            cuegroup(Control19)
            {
                ShowCaption = false;
                field("Upcoming Staff Separation"; Rec."Upcoming Staff Separation")
                {
                }
            }
        }
    }

    // actions
    // {
    //     action(Action6)
    //     {
    //         RunObject = Page "HR Proffesional Body Members";
    //     }
    // }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;
    end;
}

