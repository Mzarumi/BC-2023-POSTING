page 52185600 "HR OSIncident Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "HR OSIncident";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Incident No"; Rec."Incident No")
                {
                    Editable = false;
                }
                field("Incident Description"; Rec."Incident Description")
                {
                }
                field("Type of Incident"; Rec."Type of Incident")
                {
                }
                field("Location Name"; Rec."Location Name")
                {
                }
                field("Date of Incident"; Rec."Date of Incident")
                {
                }
                field(Time; Rec.Time)
                {
                }
                field("Date Notification Received"; Rec."Date Notification Received")
                {
                }
                field("First Witness Name"; Rec."First Witness Name")
                {
                }
                field("First Witness Address"; Rec."First Witness Address")
                {
                }
                field("Second Witness Name"; Rec."Second Witness Name")
                {
                }
                field("Second Witness Address"; Rec."Second Witness Address")
                {
                }
                field("First Aid Given"; Rec."First Aid Given")
                {
                }
                field("Taken Home"; Rec."Taken Home")
                {
                }
                field("Return to Work on same day"; Rec."Return to Work on same day")
                {
                }
                field("Went Absent"; Rec."Went Absent")
                {
                }
                field("Taken to Hospital"; Rec."Taken to Hospital")
                {
                }
                field(Admitted; Rec.Admitted)
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = true;
                }
                field("User ID"; Rec."User ID")
                {
                    Editable = false;
                }
            }
            part(Control7; "HR OSInjured Person List")
            {
                SubPageLink = "Incident No" = FIELD("Incident No");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Approval)
            {
                Caption = 'Approval';
            }
            action("Send Approval")
            {
                Caption = 'Send Approval';
            }
            action("Cancel Approval")
            {
                Caption = 'Cancel Approval';
            }
            action("Send for Investigation")
            {
                Caption = 'Send for Investigation';
                Visible = false;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to Send Incident for Investigation?', true, false) then begin
                        Rec.Status := Rec.Status::Investigation;
                        Rec.Modify;
                    end;
                end;
            }
        }
    }
}

