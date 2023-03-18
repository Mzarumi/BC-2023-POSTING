page 52186679 "Transaction Types SetUp"
{
    PageType = List;
    SourceTable = "Transaction Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field("Default Mode"; Rec."Default Mode")
                {
                }
                field("Requires Finger Verification"; Rec."Requires Finger Verification")
                {
                }
                field("Product Name"; Rec."Product Name")
                {
                }
                field("Upper Limit"; Rec."Upper Limit")
                {
                }
                field(Category; Rec.Category)
                {
                }
            }
        }
    }

    actions
    {
    }
}

