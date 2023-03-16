page 52186429 "Business Appraisals"
{
    PageType = List;
    SourceTable = "Business Loan Appraisal";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Financial Classification Code"; Rec."Financial Classification Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                }
                field("Loan With Sacco"; Rec."Loan With Sacco")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

