page 52186290 "Interest Buffer"
{
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Interest Buffer";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account No"; Rec."Account No")
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Interest Date"; Rec."Interest Date")
                {
                }
                field("Interest Amount"; Rec."Interest Amount")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Account Matured"; Rec."Account Matured")
                {
                }
                field(Transferred; Rec.Transferred)
                {
                }
                field("Qualifying Amount"; Rec."Qualifying Amount")
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

