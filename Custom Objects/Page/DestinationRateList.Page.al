page 52186042 "Destination Rate List"
{
    CardPageID = "Destination Rates Card";
    PageType = List;
    SourceTable = "Destination Rate Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee Job Group"; Rec."Employee Job Group")
                {
                }
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

