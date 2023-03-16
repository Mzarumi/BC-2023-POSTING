page 52185677 "Loan Type List"
{
    CardPageID = "Staff Loan Types";
    PageType = List;
    SourceTable = "Staff Loan Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Product Description"; Rec."Product Description")
                {
                }
                field("Interest rate"; Rec."Interest rate")
                {
                }
                field("Interest Calculation Method"; Rec."Interest Calculation Method")
                {
                }
                field("No of Installment"; Rec."No of Installment")
                {
                }
                field("Repayment Method"; Rec."Repayment Method")
                {
                }
            }
        }
    }

    actions
    {
    }
}

