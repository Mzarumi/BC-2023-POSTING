page 52185491 "Sky Insurance Card"
{
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Sky Insurance";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Session ID"; Rec."Session ID")
                {
                }
                field(Purpose; Rec.Purpose)
                {
                }
                field(Email; Rec.Email)
                {
                }
                field("Phone Number"; Rec."Phone Number")
                {
                }
                field("Entry Time"; Rec."Entry Time")
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field(Names; Rec.Names)
                {
                }
                field(Actioned; Rec.Actioned)
                {
                }
                field("Actioned By"; Rec."Actioned By")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Mark as Actioned")
            {
                Image = Apply;
                Promoted = true;
                Visible = MarkAsActioned;

                trigger OnAction()
                begin
                    Rec.Actioned := true;
                    Rec."Actioned By" := UserId;
                    Rec.Modify;

                    Message('Record Marked as Actioned');
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Actioned then
            MarkAsActioned := true;
    end;

    var
        MarkAsActioned: Boolean;
}

