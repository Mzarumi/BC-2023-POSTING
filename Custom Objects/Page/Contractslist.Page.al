page 52186030 "Contracts list"
{
    CardPageID = "Contracts Details Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Contracts;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Contract No"; Rec."Contract No")
                {
                }
                field("Contractor Type"; Rec."Contractor Type")
                {
                }
                field("Contractor No"; Rec."Contractor No")
                {
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Contract Amount"; Rec."Contract Amount")
                {
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control40; Notes)
            {
            }
            systempart(Control39; MyNotes)
            {
            }
            systempart(Control38; Links)
            {
            }
        }
    }

    actions
    {
    }
}

