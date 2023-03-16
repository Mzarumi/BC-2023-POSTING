page 52185573 "HR Applicant Referees"
{
    PageType = List;
    SourceTable = "HR Applicant Referees";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field(Names; Rec.Names)
                {
                }
                field(Designation; Rec.Designation)
                {
                }
                field(Institution; Rec.Institution)
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Telephone No"; Rec."Telephone No")
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
            }
        }
    }

    actions
    {
    }
}

