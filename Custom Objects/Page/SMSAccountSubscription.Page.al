page 52185681 "SMS Account Subscription"
{
    PageType = Card;
    SourceTable = "SMS Account Subscription";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Member No"; Rec."Member No")
                {
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field(SMS; Rec.SMS)
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
            }
            group("Sms Options")
            {
                field("Member Creation"; Rec."Member Creation")
                {
                }
                field("Deposit Confirmation"; Rec."Deposit Confirmation")
                {
                }
                field("Cash Withdrawal"; Rec."Cash Withdrawal")
                {
                }
                field("Loan Application"; Rec."Loan Application")
                {
                }
                field("Loan Guarantors"; Rec."Loan Guarantors")
                {
                }
                field("Loan Posted"; Rec."Loan Posted")
                {
                }
                field("Loan defaulted"; Rec."Loan defaulted")
                {
                }
                field("Salary Posted"; Rec."Salary Posted")
                {
                }
                field("Fixed Deposit Maturity"; Rec."Fixed Deposit Maturity")
                {
                }
                field("InterAccount Transfer"; Rec."InterAccount Transfer")
                {
                }
                field("Account Status"; Rec."Account Status")
                {
                }
                field("Status Order Creation"; Rec."Status Order Creation")
                {
                }
                field("EFT Effected"; Rec."EFT Effected")
                {
                }
                field("ATM Application Failed"; Rec."ATM Application Failed")
                {
                }
                field("ATM Collection"; Rec."ATM Collection")
                {
                }
                field(MSACCO; Rec.MSACCO)
                {
                }
            }
        }
    }

    actions
    {
    }
}

