page 52186456 "VB Payment Option List"
{
    PageType = List;
    SourceTable = "VB Payment Option";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Repayment Code"; Rec."Repayment Code")
                {
                }
                field("Repayment Option"; Rec."Repayment Option")
                {
                }
                field("Interest Computation"; Rec."Interest Computation")
                {
                }
            }
        }
    }

    actions
    {
    }
}

