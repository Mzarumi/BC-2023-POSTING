page 52186446 "DCS Loan Summary List"
{
    PageType = List;
    SourceTable = "DCS Loan Summary";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Member No."; Rec."Member No.")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Loan No"; Rec."Loan No")
                {
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                }
                field("Issue Date"; Rec."Issue Date")
                {
                }
                field("Loan Amount"; Rec."Loan Amount")
                {
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                }
                field("Total Paid"; Rec."Total Paid")
                {
                }
                field("Expected Repayment"; Rec."Expected Repayment")
                {
                }
                field("Last Update Date"; Rec."Last Update Date")
                {
                }
                field(Source; Rec.Source)
                {
                }
            }
        }
    }

    actions
    {
    }
}

