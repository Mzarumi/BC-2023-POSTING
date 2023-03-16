page 52186317 "BBF Entitlement List"
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
                field(Minor; Rec.Minor)
                {
                }
                field(Self; Rec.Self)
                {
                }
                field(Entitlement; Rec.Entitlement)
                {
                }
            }
        }
    }

    actions
    {
    }
}

