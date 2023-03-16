page 52185795 "Transactions Type"
{
    SourceTable = "Transaction Types";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Product Name"; Rec."Product Name")
                {
                }
                field("Default Mode"; Rec."Default Mode")
                {
                }
                field("Upper Limit"; Rec."Upper Limit")
                {
                }
                field(Category; Rec.Category)
                {
                }
            }
            part(Control1; "Transaction Charges")
            {
                SubPageLink = "Transaction Type" = FIELD(Code);
            }
        }
    }

    actions
    {
    }
}

