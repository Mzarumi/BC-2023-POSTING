page 52185764 "Loan Top Up"
{
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Loans Top up";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan Top Up"; Rec."Loan Top Up")
                {
                }
                field("Client Code"; Rec."Client Code")
                {
                }
                field("Loan Type"; Rec."Loan Type")
                {
                }
                field("Principle Top Up"; Rec."Principle Top Up")
                {
                }
                field("Interest Top Up"; Rec."Interest Top Up")
                {
                }
                field("Total Top Up"; Rec."Total Top Up")
                {
                }
                field("Monthly Repayment"; Rec."Monthly Repayment")
                {
                }
                field("Interest Paid"; Rec."Interest Paid")
                {
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                }
                field("ID. NO"; Rec."ID. NO")
                {
                }
                field(Commision; Rec.Commision)
                {
                }
                field("One Month Interest"; Rec."One Month Interest")
                {
                }
                field("Insurance rebate"; Rec."Insurance rebate")
                {
                }
                field("Loan Account"; Rec."Loan Account")
                {
                }
            }
        }
    }

    actions
    {
    }
}

