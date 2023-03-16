page 52185768 "Loan Posted List"
{
    CardPageID = "Loans Posted";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Loans;
    SourceTableView = WHERE(Posted = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Loan Account"; Rec."Loan Account")
                {
                }
                field("Staff No"; Rec."Staff No")
                {
                }
                field("Recovery Mode"; Rec."Recovery Mode")
                {
                }
                field("Employer Loan No."; Rec."Employer Loan No.")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                }
                field(Installments; Rec.Installments)
                {
                }
                field(Interest; Rec.Interest)
                {
                }
                field("Batch No."; Rec."Batch No.")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("Approval Date"; Rec."Approval Date")
                {
                }
                field(Repayment; Rec.Repayment)
                {
                }
                field("New Interest Rate"; Rec."New Interest Rate")
                {
                }
                field("New No. of Installment"; Rec."New No. of Installment")
                {
                }
                field("Loan Rescheduled"; Rec."Loan Rescheduled")
                {
                }
                field("Disbursement Date"; Rec."Disbursement Date")
                {
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                }
                field("Expected Date of Completion"; Rec."Expected Date of Completion")
                {
                }
                field("CRB Rating"; Rec."CRB Rating")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Repayment Frequency"; Rec."Repayment Frequency")
                {
                }
                field("Repayment Start Date"; Rec."Repayment Start Date")
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
                field("Approved By"; Rec."Approved By")
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
            }
        }
    }

    actions
    {
    }
}

