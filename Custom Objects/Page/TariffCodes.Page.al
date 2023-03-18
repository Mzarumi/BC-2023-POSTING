page 52185706 "Tariff Codes"
{
    PageType = List;
    SourceTable = "Tariff Codes";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("G/L Account"; Rec."G/L Account")
                {
                }
                field("To Use"; Rec."To Use")
                {
                }
                field(Percentage; Rec.Percentage)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
            }
        }
    }

    actions
    {
    }
}

