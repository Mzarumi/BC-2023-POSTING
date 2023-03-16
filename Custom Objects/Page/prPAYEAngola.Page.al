page 52185666 "prPAYE Angola"
{
    PageType = List;
    SourceTable = "prPAYE Angola";
    SourceTableView = SORTING("Tier Code")
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Tier Code"; Rec."Tier Code")
                {
                }
                field("Min. Amount"; Rec."Min. Amount")
                {
                }
                field("Max. Amount"; Rec."Max. Amount")
                {
                }
                field("Excess Amount"; Rec."Excess Amount")
                {
                }
                field(Rate; Rec.Rate)
                {
                }
                field("Fixed Amount"; Rec."Fixed Amount")
                {
                }
                field("Tax Code"; Rec."Tax Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

