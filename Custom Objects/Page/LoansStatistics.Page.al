page 52186644 "Loans Statistics"
{
    DeleteAllowed = false;
    Editable = false;
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = Loans;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Employer Loan No."; Rec."Employer Loan No.")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("Product Type"; Rec."Loan Product Type")
                {
                }
                field("Product Name"; Rec."Loan Product Type Name")
                {
                }
                field("Loan Account"; Rec."Loan Account")
                {
                }
                field(Installments; Rec.Installments)
                {
                }
                field(Interest; Rec.Interest)
                {
                }
                field("Disbursement Date"; Rec."Disbursement Date")
                {
                }
                field("Repayment Frequency"; Rec."Repayment Frequency")
                {
                }
                field("Mode of Disbursement"; Rec."Mode of Disbursement")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Recovery Mode"; Rec."Recovery Mode")
                {
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                }
                field(Repayment; Rec.Repayment)
                {
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                }
                field("Loans Category-SASRA"; Rec."Loans Category-SASRA")
                {
                }
                field("Outstanding Interest"; Rec."Outstanding Interest")
                {
                }
                field("Outstanding Bills"; Rec."Outstanding Bills")
                {
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                }
                // field(TotaBill; Rec.TotaBill)
                // {
                //     Caption = 'Total Bills';
                // }
                field("Total Loan Balance"; Rec."Total Loan Balance")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        TotaBill := (Rec."Outstanding Bills" + Rec."Outstanding Interest") - Rec.Repayment;
        if TotaBill < 0 then
            TotaBill := 0;
    end;

    var
        TotaBill: Decimal;
}

