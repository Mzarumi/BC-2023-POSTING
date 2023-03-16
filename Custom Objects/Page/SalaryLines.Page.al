page 52185809 "Salary Lines"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Salary Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account No."; Rec."Account No.")
                {
                }
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Account Not Found"; Rec."Account Not Found")
                {
                }
                field("Blocked Accounts"; Rec."Blocked Accounts")
                {
                }
                field("Multiple Salary"; Rec."Multiple Salary")
                {
                    Editable = false;
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Posting Time"; Rec."Posting Time")
                {
                }
            }
        }
    }

    actions
    {
    }
}

