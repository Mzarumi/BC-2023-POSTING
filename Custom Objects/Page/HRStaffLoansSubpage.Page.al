page 52186586 "HR Staff Loans Subpage"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = ListPart;
    SourceTable = "HR Staff Loan Request";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Request Date"; Rec."Request Date")
                {
                }
                field("Loan Type"; Rec."Loan Type")
                {
                }
                field("Emp No."; Rec."Emp No.")
                {
                }
                field("Emp Name"; Rec."Emp Name")
                {
                }
                field("Amount Approved"; Rec."Amount Approved")
                {
                }
                field("Amount Disbursed"; Rec."Amount Disbursed")
                {
                }
                field("Undisbursed Amount"; Rec."Undisbursed Amount")
                {
                }
                field("Amount to Disperse"; Rec."Amount to Disperse")
                {
                }
                field("Loan Disbursement Date"; Rec."Loan Disbursement Date")
                {
                }
                field("No of Instalments"; Rec."No of Instalments")
                {
                }
                field(Balance; Rec.Balance)
                {
                }
                field("Repayment Method"; Rec."Repayment Method")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field(Selected; Rec.Selected)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        AmountToDisbEditable: Boolean;

    //[Scope('Internal')]
    procedure UpdateControl()
    begin
        if Rec."Amount Approved" = Rec."Amount Disbursed" then
            AmountToDisbEditable := true
        else
            AmountToDisbEditable := false
    end;
}

