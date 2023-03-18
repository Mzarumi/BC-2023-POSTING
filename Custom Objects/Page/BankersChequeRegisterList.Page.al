page 52185818 "Bankers Cheque Register List"
{
    DeleteAllowed = false;
    Editable = true;
    PageType = List;
    SourceTable = "Bankers Cheques Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Cheque No."; Rec."Cheque No.")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = true;
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
                field("Bank Account"; Rec."Bank Account")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
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
                        if Rec.Status <> Rec.Status::Pending then
                            Error('Status must be pending');
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

