page 52185856 "Guarantor Subsitution List"
{
    CardPageID = "Guarantor Substitution";
    Editable = false;
    PageType = List;
    SourceTable = "Guarantors Substitution";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Loan Account No."; Rec."Loan Account No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Account Status"; Rec."Account Status")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Current Savings"; Rec."Current Savings")
                {
                }
                field("FOSA Account"; Rec."FOSA Account")
                {
                }
                field("Business Loan No."; Rec."Business Loan No.")
                {
                }
                field("Business Loan Shares"; Rec."Business Loan Shares")
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
                field("Responsibility Centre"; Rec."Responsibility Centre")
                {
                }
                field("Activity Code"; Rec."Activity Code")
                {
                }
                field("Branch Code"; Rec."Branch Code")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Date; Rec.Date)
                {
                }
            }
        }
    }

    actions
    {
    }
}

