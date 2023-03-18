page 52185886 "BBF Claims Lines"
{
    PageType = ListPart;
    SourceTable = "BBF Claim Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Member No"; Rec."Member No")
                {
                    Caption = 'Account No.';
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Next of Kin"; Rec."Next of Kin")
                {
                }
                field(Relationship; Rec.Relationship)
                {
                }
                field("BBF Entitlement Code"; Rec."BBF Entitlement Code")
                {
                }
                field("BBF Entitlement Claimed"; Rec."BBF Entitlement Claimed")
                {
                }
                field("BBF Entitlement Paid"; Rec."BBF Entitlement Paid")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Deceased; Rec.Deceased)
                {
                }
                field(Beneficiary; Rec.Beneficiary)
                {
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

