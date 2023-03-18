page 52185979 "View Checkoff Lines"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Checkoff Lines";
    SourceTableView = WHERE(Posted = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Checkoff Header"; Rec."Checkoff Header")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Payroll No."; Rec."Payroll No.")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field(Multiple; Rec.Multiple)
                {
                }
                field("Credit Account"; Rec."Credit Account")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Savings Account"; Rec."Savings Account")
                {
                }
                field("ID Number"; Rec."ID Number")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        if Rec.Posted = true then
            CurrPage.Editable := false;
    end;
}

