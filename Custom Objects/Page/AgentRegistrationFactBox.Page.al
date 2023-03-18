page 52186166 "Agent Registration Fact Box"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = CardPart;
    SourceTable = "Agent Biometric Data";

    layout
    {
        area(content)
        {
            group("Passport Photo")
            {
                field(PassportPhoto; Rec.PassportPhoto)
                {
                }
            }
            group("ID Cards")
            {
                field(IDFront; Rec.IDFront)
                {
                }
                field(IDBack; Rec.IDBack)
                {
                }
            }
            group("Application Form")
            {
                field(ApplicationFormFront; Rec.ApplicationFormFront)
                {
                }
                field(ApplicationFormBack; Rec.ApplicationFormBack)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        Members: Record Members;
}

