page 52186633 "prBoard Payment"
{
    PageType = List;
    SourceTable = "PR Board Transactions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Code"; Rec.Code)
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("G/L Accounts"; Rec."G/L Accounts")
                {
                }
            }
        }
    }

    actions
    {
    }
}

