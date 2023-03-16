page 52186433 "BBF Requisation Lines"
{
    DeleteAllowed = true;
    Editable = false;
    PageType = ListPart;
    SourceTable = "BBF Requisation Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Member No"; Rec."Member No")
                {
                    Editable = false;
                }
                field("Pay To Name"; Rec."Pay To Name")
                {
                    ShowMandatory = true;
                }
                field("Pay To ID"; Rec."Pay To ID")
                {
                    ShowMandatory = true;
                }
                field("Pay To Relationship"; Rec."Pay To Relationship")
                {
                    Editable = false;
                    ShowMandatory = true;
                }
                field("Next of Kin"; Rec."Next of Kin")
                {
                    Editable = false;
                }
                field("BBF Entitlement Code"; Rec."BBF Entitlement Code")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("BBF Entitlement"; Rec."BBF Entitlement")
                {
                }
                field("Sacco Income Recovable"; Rec."Sacco Income Recovable")
                {
                }
                field("Total Amount"; Rec."Total Amount")
                {
                }
                field(Relationship; Rec.Relationship)
                {
                }
                field(Beneficiary; Rec.Beneficiary)
                {
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Enabled = false;
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("%Allocation"; Rec."%Allocation")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Deceased; Rec.Deceased)
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field(Posted; Rec.Posted)
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

