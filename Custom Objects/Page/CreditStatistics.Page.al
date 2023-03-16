page 52186643 "Credit Statistics"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Credit Accounts";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Product Name"; Rec."Product Name")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("Payroll/Staff No."; Rec."Payroll/Staff No.")
                {
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                }
                field("Monthly Contribution"; Rec."Monthly Contribution")
                {
                }
                field("Company Registration No."; Rec."Company Registration No.")
                {
                }
                field("Loan Disbursement Account"; Rec."Loan Disbursement Account")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                }
            }
        }
    }

    actions
    {
    }
}

