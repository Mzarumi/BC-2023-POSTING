page 52186358 "Asset Finance Loans"
{
    PageType = List;
    SourceTable = "Asset Finance Loan";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Affects 2/3 Rule"; Rec."Affects 2/3 Rule")
                {
                }
                field("Monthly Deduction"; Rec."Monthly Deduction")
                {
                }
            }
        }
    }

    actions
    {
    }
}

