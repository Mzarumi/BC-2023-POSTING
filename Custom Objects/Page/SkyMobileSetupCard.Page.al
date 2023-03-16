page 52186691 "Sky Mobile Setup Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Sky Mobile Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
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
                field("Staggered Charge Code"; Rec."Staggered Charge Code")
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
            part(Control3; "Sky Tiered Lines List")
            {
                SubPageLink = Code = FIELD("Staggered Charge Code");
                SubPageView = WHERE("Band Active" = CONST(true));
            }
            part("Archived Charges"; "Sky Tiered Lines List")
            {
                Caption = 'Archived Charges';
                SubPageLink = Code = FIELD("Staggered Charge Code");
                SubPageView = WHERE("Band Active" = CONST(false));
            }
        }
    }

    actions
    {
    }
}

