page 52186415 "Loan Securites Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Loan Securities Set-up";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec."Security Description")
                {
                }
                field(Examples; Rec.Examples)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Category; Rec.Category)
                {
                }
                field("Collateral Multiplier"; Rec."Collateral Multiplier")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                }
                field("Revaluation Frequency"; Rec."Revaluation Frequency")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Notes)
            {
            }
            systempart(Control10; MyNotes)
            {
            }
            systempart(Control11; Links)
            {
            }
        }
    }

    actions
    {
    }
}

