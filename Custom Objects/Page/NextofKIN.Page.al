page 52185729 "Next of KIN"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Next of KIN";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
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
                field(Address; Rec.Address)
                {
                }
                field(Telephone; Rec.Telephone)
                {
                }
                field(Fax; Rec.Fax)
                {
                }
                field(Email; Rec.Email)
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("%Allocation"; Rec."%Allocation")
                {
                }
                field(Type; Rec.Type)
                {
                    ValuesAllowed = "Next of Kin", "Benevolent Beneficiary", "Family Member";
                }
                field("BBF Entitlement Code"; Rec."BBF Entitlement Code")
                {
                }
                field("BBF Entitlement"; Rec."BBF Entitlement")
                {
                }
                field(Deceased; Rec.Deceased)
                {
                }
            }
        }
    }

    actions
    {
    }
}

