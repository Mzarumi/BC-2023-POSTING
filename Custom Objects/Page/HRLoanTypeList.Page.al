page 52186584 "HR Loan Type List"
{
    PageType = List;
    SourceTable = "HR Staff Loan Typess";

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

