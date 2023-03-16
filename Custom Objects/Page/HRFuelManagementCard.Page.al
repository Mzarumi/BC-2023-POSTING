page 52186093 "HR Fuel Management Card"
{
    SourceTable = "HR Fuel Management Header";

    layout
    {
        area(content)
        {
            field("Code"; Rec.Code)
            {
            }
            field("Vehicle Registration No."; Rec."Vehicle Registration No.")
            {
            }
            field("Name Vehicle"; Rec."Name Vehicle")
            {
            }
            field("Vehicle Type"; Rec."Vehicle Type")
            {
            }
            field("Driver Details"; Rec."Driver Details")
            {
            }
            field("Type Of Payment"; Rec."Type Of Payment")
            {
            }
            field("Work Ticket No."; Rec."Work Ticket No.")
            {
            }
            field("Date /Time"; Rec."Date /Time")
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {

                trigger OnAction()
                begin

                    //52017699
                end;
            }
            action("Send For Approval")
            {
                Image = SendAsPDF;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    if Confirm('Do you want to Send this Application for Approval?', true) = false then exit;
                end;
            }
            action("Cancel Approval")
            {
                Image = SendAsPDF;
                Promoted = true;

                trigger OnAction()
                begin
                    if Confirm('Do you want to Cancel this Application for Approval?', true) = false then exit;
                end;
            }
        }
    }
}

