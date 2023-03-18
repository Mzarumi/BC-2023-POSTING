page 52186443 "DCS Member Transaction List"
{
    PageType = List;
    SourceTable = "DCS Member Transaction";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Member No"; Rec."Member No")
                {
                }
                field("Last Update"; Rec."Last Update")
                {
                }
                field(Basic; Rec.Basic)
                {
                }
                field("Gross Salary"; Rec."Gross Salary")
                {
                }
                field(Earnings; Rec.Earnings)
                {
                }
                field(Deductions; Rec.Deductions)
                {
                }
                field("Net Pay"; Rec."Net Pay")
                {
                }
                field("Loan Balance"; Rec."Loan Balance")
                {
                }
                field("Expected Loan Repayment"; Rec."Expected Loan Repayment")
                {
                }
                field("Last Repayment Date"; Rec."Last Repayment Date")
                {
                }
                field("Total Loan Repayments"; Rec."Total Loan Repayments")
                {
                }
                field("Number of Active Loans"; Rec."Number of Active Loans")
                {
                }
                field("Date of Join"; Rec."Date of Join")
                {
                }
                field(Loan; Rec.Loan)
                {
                }
                field("Default Status"; Rec."Default Status")
                {
                }
                field("Standing Orders"; Rec."Standing Orders")
                {
                }
                field("Direct Debits"; Rec."Direct Debits")
                {
                }
                field("Deposits Contribution"; Rec."Deposits Contribution")
                {
                }
                field("Loan Repayment Frequency"; Rec."Loan Repayment Frequency")
                {
                }
                field("Loans Borrowing History"; Rec."Loans Borrowing History")
                {
                }
                field("Deposit Guaranteed"; Rec."Deposit Guaranteed")
                {
                }
                field("Share Capital"; Rec."Share Capital")
                {
                }
                field(Defaulter; Rec.Defaulter)
                {
                }
                field("Last Deposit Date"; Rec."Last Deposit Date")
                {
                }
                field("MSACCO Trans Ferquency"; Rec."MSACCO Trans Ferquency")
                {
                }
                field("MSACCO Last Trans Date"; Rec."MSACCO Last Trans Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

