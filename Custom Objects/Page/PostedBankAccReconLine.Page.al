page 52186083 "Posted Bank Acc. Recon Line"
{
    Editable = false;
    PageType = List;
    SourceTable = "Posted Bank Acc. Recon Line";
    SourceTableView = WHERE(Difference = FILTER(<> 0));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Statement Amount"; Rec."Statement Amount")
                {
                }
                field(Difference; Rec.Difference)
                {
                }
                field(Type; Rec.Type)
                {
                }
            }
        }
    }

    actions
    {
    }
}

