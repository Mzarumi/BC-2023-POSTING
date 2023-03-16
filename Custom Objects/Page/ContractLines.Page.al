page 52186024 "Contract Lines"
{
    PageType = ListPart;
    SourceTable = "Contract Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                }
                field("Item Code"; Rec."Item Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Detail; Rec.Detail)
                {
                }
                field("From Date"; Rec."From Date")
                {
                }
                field("To Date"; Rec."To Date")
                {
                }
                field("Amount Awarded"; Rec."Amount Awarded")
                {
                }
            }
        }
    }

    actions
    {
    }
}

