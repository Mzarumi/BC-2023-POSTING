page 52185887 "BBF Entitlement2"
{
    PageType = List;
    SourceTable = "BBF Entitlement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Entitlement; Rec.Entitlement)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Max No."; Rec."Max No.")
                {
                }
                field(Self; Rec.Self)
                {
                }
            }
        }
    }

    actions
    {
    }
}

