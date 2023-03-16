page 52186043 "Destination Rates Card"
{
    PageType = Card;
    SourceTable = "Destination Rate Entry";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Advance Code"; Rec."Advance Code")
                {
                }
                field("Destination Code"; Rec."Destination Code")
                {
                }
                field(Currency; Rec.Currency)
                {
                }
                field("Destination Type"; Rec."Destination Type")
                {
                }
                field("Daily Rate (Amount)"; Rec."Daily Rate (Amount)")
                {
                }
                field("Employee Job Group"; Rec."Employee Job Group")
                {
                }
                field("Destination Name"; Rec."Destination Name")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
            }
            systempart(Control12; Notes)
            {
            }
            systempart(Control13; MyNotes)
            {
            }
            systempart(Control14; Links)
            {
            }
        }
    }

    actions
    {
    }
}

