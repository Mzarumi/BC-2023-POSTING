page 52185627 "PR Transaction Code Card"
{
    PageType = Card;
    SourceTable = "PR Transaction Codes";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    Editable = true;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field(Frequency; Rec.Frequency)
                {
                    ValuesAllowed = Fixed, Varied;
                }
                field("Balance Type"; Rec."Balance Type")
                {
                    ValuesAllowed = None, Increasing, Reducing;
                }
                field("Is Cash"; Rec."Is Cash")
                {
                }
                field(Taxable; Rec.Taxable)
                {
                }
                field("Is Formula"; Rec."Is Formula")
                {
                }
                field(Formula; Rec.Formula)
                {
                }
                label(Control1102756053)
                {
                    CaptionClass = Text19025872;
                    ShowCaption = false;
                }
                field("Include Employer Deduction"; Rec."Include Employer Deduction")
                {
                }
                field("iTax Grouping"; Rec."iTax Grouping")
                {
                }
                field("Employer Deduction"; Rec."Employer Deduction")
                {
                }
                field("Group Code"; Rec."Group Code")
                {
                }
                field("Is Formula for employer"; Rec."Is Formula for employer")
                {
                }
                label(Control1102756054)
                {
                    CaptionClass = Text19080001;
                    ShowCaption = false;
                }
                field("GL Account"; Rec."GL Account")
                {
                }
                field(Subledger; Rec.Subledger)
                {
                    Caption = 'Posting to Subledger';
                }
                field("Product Min Cont."; Rec."Product Min Cont.")
                {
                    Editable = false;
                }
                field(CustomerPostingGroup; Rec.CustomerPostingGroup)
                {
                    Caption = 'Debtor Posting Group';
                }
                group(Loans)
                {
                    Caption = 'Loans';
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    Caption = 'Interest Rate';
                }
                field("IsCoop/LnRep"; Rec."IsCoop/LnRep")
                {
                    Caption = 'Is Loan/Coop';
                }
            }
            group("Other Set-Ups")
            {
                Caption = 'Other Set-Ups';
                field("Amount Preference"; Rec."Amount Preference")
                {
                }
                field("Special Transactions3"; Rec."Special Transactions")
                {
                    Caption = 'Special Transactions';
                }
                field("Repayment Method"; Rec."Repayment Method")
                {
                }
                field("Fringe Benefit"; Rec."Fringe Benefit")
                {
                }
                field("Deduct Premium"; Rec."Deduct Premium")
                {
                }
                field("IsCoop/LnRep2"; Rec."IsCoop/LnRep")
                {
                    Caption = 'Coop Parameter';
                }
                field("coop parameters"; Rec."coop parameters")
                {
                    DrillDown = false;
                }
                field(Suspended; Rec.Suspended)
                {
                }
                field("IsLeave Allowance"; Rec."IsLeave Allowance")
                {
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                }
                field("Based on Loans"; Rec."Based on Loans")
                {
                }
                field("Product Category"; Rec."Product Category")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        Text19025872: Label 'E.g ([005]+[020]*[24])/2268';
        Text19080001: Label 'E.g ([005]+[020]*[24])/2268';
}

