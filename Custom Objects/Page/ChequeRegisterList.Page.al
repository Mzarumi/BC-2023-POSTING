page 52185815 "Cheque Register List"
{
    PageType = List;
    SourceTable = "Cheques Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Cheque No."; Rec."Cheque No.")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Approval Date"; Rec."Approval Date")
                {
                }
                field("Application No."; Rec."Application No.")
                {
                }
                field("Cancelled/Stopped By"; Rec."Cancelled/Stopped By")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Cancel Cheque")
            {

                trigger OnAction()
                begin

                    if Confirm('Are you sure you want to cancel cheque ?', false) = true then begin
                        if Rec.Status <> Rec.Status::Pending then
                            Error('Status must be pending');
                        Rec.Status := Rec.Status::Cancelled;
                        Rec."Approval Date" := Today;
                        Rec."Cancelled/Stopped By" := UserId;
                        Rec.Modify;
                    end;
                end;
            }
            action("Stop Cheque")
            {

                trigger OnAction()
                begin

                    if Confirm('Are you sure you want to stop cheque ?', false) = true then begin
                        // if Rec.Status <> Rec.::Pending then
                        //     Error('Status must be pending');
                        Rec.Status := Rec.Status::stopped;
                        Rec."Approval Date" := Today;
                        Rec."Cancelled/Stopped By" := UserId;
                        Rec.Modify;
                    end;
                end;
            }
            action("Cancel Cheque Book")
            {

                trigger OnAction()
                begin
                    //reset;
                end;
            }
        }
    }
}

