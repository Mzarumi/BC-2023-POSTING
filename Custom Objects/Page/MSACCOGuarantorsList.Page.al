page 52186395 "M-SACCO Guarantors List"
{
    Editable = false;
    PageType = List;
    SourceTable = "M-SACCO Guarantors";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Msacco Loans Entry No"; Rec."Msacco Loans Entry No")
                {
                }
                field("Guarontor Telephone No"; Rec."Guarontor Telephone No")
                {
                }
                field("Guarontor Account No"; Rec."Guarontor Account No")
                {
                }
                field("Guarontor Name"; Rec."Guarontor Name")
                {
                }
                field("Applicant Telephone No"; Rec."Applicant Telephone No")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Date Received"; Rec."Date Received")
                {
                }
            }
        }
    }

    actions
    {
    }
}

