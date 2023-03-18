page 52185841 "Checkoff Lines"
{
    PageType = List;
    SourceTable = "Checkoff Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field(Name; Rec.Name)
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
                field("Savings Account"; Rec."Savings Account")
                {
                }
                field("Credit Account"; Rec."Credit Account")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

