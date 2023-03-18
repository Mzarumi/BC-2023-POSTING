page 52186455 "VB Loan List"
{
    CardPageID = "VB Loan Card";
    PageType = List;
    SourceTable = Loans;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                }
                field("Discounted Loan No."; Rec."Discounted Loan No.")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

