page 52186343 "Delegate Members List"
{
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Delegate Memberss";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                // field("Delegate Zone Name"; Rec."Delegate Zone Name")
                // {
                //     Caption = 'Delegate Zone Name';
                // }
                field("Electoral Zone Name"; Rec."Electoral Zone Name")
                {
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                }
                field("Delegate MNO."; Rec."Delegate MNO.")
                {
                }
                field("Delegate Name"; Rec."Delegate Name")
                {
                }
                field(Position; Rec.Position)
                {
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                }
                field(Retired; Rec.Retired)
                {
                }
                field("Retire Date"; Rec."Retire Date")
                {
                }
                field("Reason for retirement"; Rec."Reason for retirement")
                {
                }
                field("Service Period"; Rec."Service Period")
                {
                }
                field("Retired By"; Rec."Retired By")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        DelegateZone.Reset;
        //DelegateZone.SetRange(Code, Code);
        if DelegateZone.Find('-') then
            "Delegate Zone Name" := DelegateZone."Delegate Region Description";
    end;

    var
        DelegateZone: Record "Delegate Region";
        "Delegate Zone Name": Text;
}

