page 52186437 "BDE Management Buffer"
{
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "BDE Management Buffer";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("No Sold"; Rec."No Sold")
                {
                }
                field(Transfered; Rec.Transfered)
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

