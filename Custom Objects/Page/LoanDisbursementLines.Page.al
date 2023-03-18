page 52185766 "Loan Disbursement Lines"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    Editable = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Loan Disbursement Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                }
                field("Cheque No"; Rec."Cheque No")
                {
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                }
                field("Bank Code"; Rec."Bank Code")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
                field("Time Posted"; Rec."Time Posted")
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Disbursement Amount"; Rec."Disbursement Amount")
                {
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
        if Loans.Get(Rec."Loan No.") then begin
            Loans."Already Suggested" := false;
            Loans.Modify;
        end;
    end;

    var
        Posting: Codeunit "Loans Process";
        Loans: Record Loans;
}

