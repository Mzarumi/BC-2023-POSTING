page 52185673 "prTransaction Code"
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
                field("Transaction Code"; Rec."Transaction Code")
                {
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
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
                field("Amount Preference"; Rec."Amount Preference")
                {
                    ValuesAllowed = "Posted Amount", "Take Lower ", "Take Higher";
                }
                field("Is Cash"; Rec."Is Cash")
                {
                }
                field("Is Income/Deduction"; Rec."Is Income/Deduction")
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
                field("Employer Deduction"; Rec."Employer Deduction")
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
                group(Loans)
                {
                    Caption = 'Loans';
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    Caption = 'Interest Rate';
                }
                field("Repayment Method"; Rec."Repayment Method")
                {
                    ValuesAllowed = Reducing, "Straight line", Amortized;
                }
                field("Fringe Benefit"; Rec."Fringe Benefit")
                {
                }
                field("GL Account"; Rec."GL Account")
                {
                }
                field(Subledger; Rec.Subledger)
                {
                    Caption = 'Posting to Subledger';
                }
                field(CustomerPostingGroup; Rec.CustomerPostingGroup)
                {
                    Caption = 'Debtor Posting Group';
                }
                field("IsCoop/LnRep"; Rec."IsCoop/LnRep")
                {
                    Caption = 'Is Loan/Coop';
                }
            }
            group("Other Set-Ups")
            {
                Caption = 'Other Set-Ups';
                field("IsTransfer Allowance"; Rec."IsTransfer Allowance")
                {
                }
                field("IsLeave Allowance"; Rec."IsLeave Allowance")
                {
                }
                field("Is Salary Advance"; Rec."Is Salary Advance")
                {
                }
                field("Is HR Loan"; Rec."Is HR Loan")
                {
                }
                field("Special Transactions"; Rec."Special Transactions")
                {
                }
                field("IsTraining Deduction"; Rec."IsTraining Deduction")
                {
                }
                field("Deduct Premium"; Rec."Deduct Premium")
                {
                }
                field("coop parameters"; Rec."coop parameters")
                {
                    Caption = 'coop parameters';
                    DrillDown = false;
                }
                field(Suspended; Rec.Suspended)
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

