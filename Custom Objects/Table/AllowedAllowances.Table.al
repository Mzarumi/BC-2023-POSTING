table 52186242 "Allowed Allowances"
{

    fields
    {
        field(1; "Meeting Type Code"; Code[50])
        {
        }
        field(2; "Allowance Type"; Option)
        {
            OptionMembers = "Sitting Allowance","Night Out Allowance","Transport Allowance";

            trigger OnValidate()
            begin
                AllowedAllowances.Reset;
                AllowedAllowances.SetRange("Meeting Type Code", Rec."Meeting Type Code");
                AllowedAllowances.SetRange("Allowance Type", Rec."Allowance Type");
            end;
        }
        field(3; Amount; Decimal)
        {
        }
        field(4; "Tax %"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Meeting Type Code", "Allowance Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        MeetingTypes: Record "Meeting Types";
        AllowedAllowances: Record "Allowed Allowances";
}

