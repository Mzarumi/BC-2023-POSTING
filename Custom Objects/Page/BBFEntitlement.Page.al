page 52186314 "BBF Entitlement"
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
                field("New Amount"; Rec."New Amount")
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

