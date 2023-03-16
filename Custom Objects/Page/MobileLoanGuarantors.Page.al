page 52185452 "Mobile Loan Guarantors"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Mobile Loan Guarantors";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Guarantor Mobile No."; Rec."Guarantor Mobile No.")
                {
                }
                field("Guarantor Member No."; Rec."Guarantor Member No.")
                {
                }
                field("Loan Product"; Rec."Loan Product")
                {
                }
                field("Guarantor Name"; Rec."Guarantor Name")
                {
                }
                field("Amount Guaranteed"; Rec."Amount Guaranteed")
                {
                }
                field("Guarantor Accepted"; Rec."Guarantor Accepted")
                {
                }
                field("Guarantor Response Date"; Rec."Guarantor Response Date")
                {
                }
                field("Guarantor Response Time"; Rec."Guarantor Response Time")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
            }
        }
    }

    actions
    {
    }
}

