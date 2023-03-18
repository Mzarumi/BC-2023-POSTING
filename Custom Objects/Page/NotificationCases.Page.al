page 52186124 "Notification Cases"
{
    PageType = List;
    SourceTable = "Cases Noitification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Mention; Rec.Mention)
                {
                }
                field(Judgment; Rec.Judgment)
                {
                }
                field(Hearing; Rec.Hearing)
                {
                }
                field("Action Required"; Rec."Action Required")
                {
                }
                field("Hearing Date"; Rec."Hearing Date")
                {
                }
                field("Expiry Date For Leases"; Rec."Expiry Date For Leases")
                {
                }
            }
        }
    }

    actions
    {
    }
}

