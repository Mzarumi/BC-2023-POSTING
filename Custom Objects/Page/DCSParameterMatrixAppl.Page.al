page 52186411 "DCS Parameter Matrix Appl."
{
    PageType = List;
    SourceTable = "DCS Parameter Matrix Appl.";

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
        area(creation)
        {
            group(Action23)
            {
                action("Product Charges")
                {
                    Image = SetupPayment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Loan Product Charge Appl.";
                }
                action("Appraisal Parameters")
                {
                    Image = Evaluate;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "DCS Product Parameter Matrix";
                }
                action("Related Product")
                {
                    Image = Relatives;
                    Promoted = true;
                    RunObject = Page "Related Product Appl. List";
                }
            }
        }
        area(navigation)
        {
            action("Product Application Document")
            {
                Image = Documents;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Product Application Document";
            }
        }
    }
}

