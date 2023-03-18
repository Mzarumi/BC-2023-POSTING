page 52185774 "Loan Product Appraisal"
{
    PageType = List;
    SourceTable = "Loan Product Parameters";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan Product Code"; Rec."Loan Product Code")
                {
                }
                field("Parameter Base"; Rec."Parameter Base")
                {
                }
                field("Computation Method"; Rec."Computation Method")
                {
                }
                field(Factor; Rec.Factor)
                {
                }
                field("Application Priority"; Rec."Application Priority")
                {
                }
                field(Formula; Rec.Formula)
                {
                }
                field("Parameter Base Unit"; Rec."Parameter Base Unit")
                {
                }
                field("Success Default Value"; Rec."Success Default Value")
                {
                }
            }
        }
    }

    actions
    {
    }
}

