page 52185765 "Other Commitments Clearance"
{
    PageType = List;
    SourceTable = "Other Commitements Clearance";

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
                field("Monthly Deduction"; Rec."Monthly Deduction")
                {
                }
                field("Affects 2/3 Rule"; Rec."Affects 2/3 Rule")
                {
                }
            }
        }
    }

    actions
    {
    }
}

