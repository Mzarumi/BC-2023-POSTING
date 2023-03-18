page 52186286 "Cheque Set Up"
{
    PageType = List;
    SourceTable = "Cheque Set Up";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Cheque Code"; Rec."Cheque Code")
                {
                }
                field("Number Of Leaf"; Rec."Number Of Leaf")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
            }
        }
    }

    actions
    {
    }
}

