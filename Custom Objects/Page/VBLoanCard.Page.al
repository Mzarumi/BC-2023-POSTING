page 52186454 "VB Loan Card"
{
    PageType = Card;
    SourceTable = Loans;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                }
                field("Repayment Start Date"; Rec."Repayment Start Date")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                }
                field(Source; Rec.Source)
                {
                }
                field("Discounted Loan No."; Rec."Discounted Loan No.")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                Image = Post;
                Promoted = true;

                // trigger OnAction()
                // begin
                //     if VBManager.PostLoan(Rec) then begin
                //         Posted := true;
                //         //Status:=Status::Approved;
                //         Modify;
                //     end;
                // end;
            }
        }
    }

    var
        // VBManager: Codeunit "VB Management";
}

