page 52186681 "Sky Portal Setup Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Sky Portal Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Vendor Commission Account"; Rec."Vendor Commission Account")
                {
                }
                field("Sacco Fee Account"; Rec."Sacco Fee Account")
                {
                }
                field("Bank Account"; Rec."Bank Account")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Vendor Commission"; Rec."Vendor Commission")
                {
                }
                field("Sacco Fee"; Rec."Sacco Fee")
                {
                }
                field("Safaricom Account"; Rec."Safaricom Account")
                {
                }
                field("Safaricom Fee"; Rec."Safaricom Fee")
                {
                }
                field("Pre-Payment Account"; Rec."Pre-Payment Account")
                {
                }
                field("SMS Charge"; Rec."SMS Charge")
                {
                }
                field("SMS Account"; Rec."SMS Account")
                {
                }
                field("Transaction Limit"; Rec."Transaction Limit")
                {
                }
                field("Non-Member Debit Account"; Rec."Non-Member Debit Account")
                {
                }
                field("Daily Limit"; Rec."Daily Limit")
                {
                }
                field("Weekly Limit"; Rec."Weekly Limit")
                {
                }
                field("Monthly Limit"; Rec."Monthly Limit")
                {
                }
                field("Charge Type"; Rec."Charge Type")
                {
                }
                field("Restrict to Employer"; Rec."Restrict to Employer")
                {
                }
                field("Charge Agents"; Rec."Charge Agents")
                {
                }
            }
            part(Control24; "Portal Tiered Charges")
            {
                SubPageLink = Code = FIELD(Code);
            }
        }
    }

    actions
    {
    }
}

