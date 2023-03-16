page 52186398 "Online Loan Guarantors"
{
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Online Loan Guarantors";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan Application No"; Rec."Loan Application No")
                {
                }
                field("Guarantor No."; Rec."Guarantor No.")
                {
                }
                field("Guarantor Names"; Rec."Guarantor Names")
                {
                }
                field("Guarantor ID No"; Rec."Guarantor ID No")
                {
                }
                field("Guarantor Phone"; Rec."Guarantor Phone")
                {
                }
                field("Guarantor Email"; Rec."Guarantor Email")
                {
                }
                field("Guarantor Amount"; Rec."Guarantor Amount")
                {
                }
                field(Approved; Rec.Approved)
                {
                }
            }
        }
    }

    actions
    {
    }
}

