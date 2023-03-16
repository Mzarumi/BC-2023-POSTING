page 52186450 "DCS Product Parameter Matrix"
{
    PageType = List;
    SourceTable = "DCS Parameter Matrix";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan Product Code"; Rec."Loan Product Code")
                {
                }
                field("Parameter Code"; Rec."Parameter Code")
                {
                }
                field("Parameter Desc"; Rec."Parameter Desc")
                {
                }
                field("Parameter Base"; Rec."Parameter Base")
                {
                }
                field("Parameter Base Unit"; Rec."Parameter Base Unit")
                {
                }
                field("Computation Method"; Rec."Computation Method")
                {
                }
                field(Formula; Rec.Formula)
                {
                }
                field("Date Formula"; Rec."Date Formula")
                {
                }
                field(Factor; Rec.Factor)
                {
                }
                field("Contributes To Score As"; Rec."Contributes To Score As")
                {
                }
                field("Application Priority"; Rec."Application Priority")
                {
                }
                field("Success Default Value"; Rec."Success Default Value")
                {
                }
                field("Parameter Scope"; Rec."Parameter Scope")
                {
                }
                field("Failure Response"; Rec."Failure Response")
                {
                }
                field("Fall Back Parameter"; Rec."Fall Back Parameter")
                {
                }
            }
        }
    }

    actions
    {
    }
}

