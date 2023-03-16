page 52186389 "Delegate  Memberss Transfer"
{
    PageType = ListPart;
    SourceTable = "Delegate Members Retirementss";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                }
                field(Position; Rec.Position)
                {
                }
                field("Delegate MNO."; Rec."Delegate MNO.")
                {
                }
                field("Delegate Name"; Rec."Delegate Name")
                {
                }
                field(Transfer; Rec.Transfer)
                {
                }
                field("Tranfer To"; Rec."Tranfer To")
                {
                }
                field("Tranfer Date"; Rec."Tranfer Date")
                {
                }
                field("Transfer to Position"; Rec."Transfer to Position")
                {
                }
                field("Transfer to Name"; Rec."Transfer to Name")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Retire all Members")
            {
                Image = ReturnCustomerBill;
                Promoted = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to retire all delegates?') then
                        exit;
                    // Retired := true;
                    // ModifyAll(Retired, true);
                end;
            }
            action("`")
            {
            }
        }
    }

    var
        RetireDate: Boolean;
        ReinstateDate: Boolean;
}

