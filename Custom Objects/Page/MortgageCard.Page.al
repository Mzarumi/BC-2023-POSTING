page 52185488 "Mortgage Card"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Sky Mortgage";

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
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Full Name"; Rec."Full Name")
                {
                }
                field("Age Group"; Rec."Age Group")
                {
                }
                field("Source Of Income"; Rec."Source Of Income")
                {
                }
                field("Gross Monthly Income"; Rec."Gross Monthly Income")
                {
                }
                field("County Of Residence"; Rec."County Of Residence")
                {
                }
                field(Email; Rec.Email)
                {
                }
                field(Actioned; Rec.Actioned)
                {
                }
                field("Entry Time"; Rec."Entry Time")
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("Phone Number"; Rec."Phone Number")
                {
                }
                field("Actioned By"; Rec."Actioned By")
                {
                }
                field("Date Actioned"; Rec."Date Actioned")
                {
                }
                field("Time Actioned"; Rec."Time Actioned")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Mark As Actioned")
            {
                Image = Apply;
                Promoted = true;
                Visible = MarkAsActioned;

                trigger OnAction()
                begin
                    Rec.Actioned := true;
                    Rec."Actioned By" := UserId;
                    Rec."Date Actioned" := Today;
                    Rec."Time Actioned" := Time;
                    Rec.Modify;
                    Message('Entry Marked as actioned!');
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

