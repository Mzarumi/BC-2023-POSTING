page 52186282 "Investment Type"
{
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Investment Type";

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
                field(Type; Rec.Type)
                {
                }
                field("Deposit Type"; Rec."Deposit Type")
                {
                }
                field(Interest; Rec.Interest)
                {
                }
                field("Repayment Frequency"; Rec."Repayment Frequency")
                {
                }
            }
        }
    }

    actions
    {
    }
}

