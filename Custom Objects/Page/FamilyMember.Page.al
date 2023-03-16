page 52186285 "Family Member"
{
    PageType = ListPart;
    SourceTable = "Next of KIN";
    SourceTableView = WHERE(Type = CONST("Benevolent Beneficiary"));

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
                    Editable = true;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field(Telephone; Rec.Telephone)
                {
                }
                field(Email; Rec.Email)
                {
                }
                field(Fax; Rec.Fax)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Beneficiary; Rec.Beneficiary)
                {
                }
            }
        }
    }

    actions
    {
    }
}

