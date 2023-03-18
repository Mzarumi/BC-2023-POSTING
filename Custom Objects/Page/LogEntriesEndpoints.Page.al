page 52186696 "Log Entries Endpoints"
{
    PageType = List;
    SourceTable = "Log Endpoint  Entiries";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Enabled; Rec.Enabled)
                {
                }
                field("Password Verification"; Rec."Password Verification")
                {
                }
                field("OTP Verification"; Rec."OTP Verification")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field(Time; Rec.Time)
                {
                }
                field("Action"; Rec.Action)
                {
                }
                field("Affected Field/Row"; Rec."Affected Field/Row")
                {
                }
            }
        }
    }

    actions
    {
    }
}

