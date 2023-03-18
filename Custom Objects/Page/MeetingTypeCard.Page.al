page 52186711 "Meeting Type Card"
{
    DeleteAllowed = false;
    PageType = Card;
    UsageCategory = Administration;
    SourceTable = "Meeting Types";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Intervals; Rec.Intervals)
                {
                }
                field("Processing Fee"; Rec."Processing Fee")
                {
                }
                field("Allowed Creation Channel"; Rec."Allowed Creation Channel")
                {
                }
                field("Only Officials"; Rec."Only Officials")
                {
                }
            }
            part(Control6; "Allowed Allowances Part")
            {
                SubPageLink = "Meeting Type Code" = FIELD(Code);
            }
        }
    }

    actions
    {
    }
}

