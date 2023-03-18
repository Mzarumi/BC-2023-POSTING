page 52185773 "Loan Appraisal Parameters"
{
    PageType = List;
    SourceTable = "Loan Application Credit Score";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Product Code"; Rec."Product Code")
                {
                }
                field("Parameter Code"; Rec."Parameter Code")
                {
                }
                field(Score; Rec.Score)
                {
                }
            }
        }
    }

    actions
    {
    }
}

