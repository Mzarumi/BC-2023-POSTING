page 52186284 "Family Member App."
{
    PageType = ListPart;
    SourceTable = "Next of KIN Application";
    SourceTableView = WHERE (Type = CONST ("Benevolent Beneficiary"));

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
               
            }
        }
    }

    actions
    {
    }
}

