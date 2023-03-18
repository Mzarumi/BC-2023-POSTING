page 52186336 "Delegate Retire Memberss"
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
                field("Appointment Date"; Rec."Appointment Date")
                {

                    trigger OnValidate()
                    begin
                        // Reinstate := false;
                        // Retired := false;
                        // "Retirement Date" := 0D;
                        // "Reinstatement Date" := 0D;
                    end;
                }
                field(Retire; Rec.Retired)
                {

                    trigger OnValidate()
                    begin
                        // "Appointment Date" := 0D;
                        // Reinstate := false;
                        // "Reinstatement Date" := 0D;
                        // if Retired = true then
                        //     RetireDate := true else
                        //     RetireDate := false;
                    end;
                }
                field("Retirement Date"; Rec."Retirement Date")
                {
                    // Editable = Retired;
                }
                field(Reinstate; Rec.Reinstate)
                {

                    trigger OnValidate()
                    begin
                        // Retired := false;
                        // "Retirement Date" := 0D;
                        // "Appointment Date" := 0D;

                        // if Reinstate = true then
                        //     Reinstate := true else
                        //     Reinstate := false;
                    end;
                }
                field("Reinstatement Date"; Rec."Reinstatement Date")
                {
                    // Editable = Reinstate;
                }
                field(Appoint; Rec.Appoint)
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

