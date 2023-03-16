page 52185852 "Account Closure Line"
{
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Account Closure Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";Rec."No.")
                {
                }
                field("Account No.";Rec."Account No.")
                {
                }
                field(Name;Rec.Name)
                {
                }
                field("Product Type";Rec."Product Type")
                {
                }
                field(Balance;Rec.Balance)
                {
                }
                field(Close;Rec.Close)
                {
                }
                field("Member No.";Rec."Member No.")
                {
                }
                field(Blocked;Rec.Blocked)
                {
                }
            }
        }
    }

    actions
    {
    }
}

