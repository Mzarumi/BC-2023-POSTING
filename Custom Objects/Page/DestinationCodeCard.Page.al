page 52186000 "Destination Code Card"
{
    PageType = Card;
    SourceTable = "Travel Destination";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Destination Code"; Rec."Destination Code")
                {
                }
                field("Destination Name"; Rec."Destination Name")
                {
                }
                field("Destination Type"; Rec."Destination Type")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Outlook)
            {
            }
            systempart(Control8; Notes)
            {
            }
            systempart(Control9; MyNotes)
            {
            }
            systempart(Control10; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Destination Rate")
            {
                Caption = 'Destination Rate';
                Image = Travel;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page "Destination Rate List";
                RunPageLink = "Destination Code" = FIELD("Destination Code");
            }
        }
    }
}

