page 52186622 "HR  Manager Cue"
{
    PageType = CardPart;
    SourceTable = "HR Officer Cue";

    layout
    {
        area(content)
        {
            cuegroup(Control4)
            {
                Caption = 'Hr Officer Cue';
                field("Pending Approvals"; Rec."Pending Approvals")
                {
                }
                field("Approved Leave"; Rec."Approved Leave")
                {
                }
                field("Approved  Trainings"; Rec."Approved  Trainings")
                {
                }
                field("Approved Transport Requisition"; Rec."Approved Transport Requisition")
                {
                }
                field(Active; Rec.Active)
                {
                    Caption = 'All Active Employees';
                }
                field(Female; Rec.Female)
                {
                    Caption = 'Female Employees';
                }
                field(Male; Rec.Male)
                {
                    Caption = 'Male Employees';
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

