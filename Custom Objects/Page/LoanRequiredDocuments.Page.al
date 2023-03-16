page 52186068 "Loan Required Documents"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    UsageCategory = Administration;
    SourceTable = "Loan Required Documents";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Product ID"; Rec."Product ID")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Single Party/Multiple"; Rec."Single Party/Multiple")
                {
                }
                field("Provided ?"; Rec."Provided ?")
                {
                }
                field("License Expiry Date"; Rec."License Expiry Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

