page 52185588 "HR Applicants Qualified Card"
{
    PageType = Card;
    SourceTable = "HR Job Applications";
    SourceTableView = WHERE(Qualified = CONST(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Job Application No."; Rec."Job Application No.")
                {
                }
                field("First Name"; Rec."First Name")
                {
                }
                field("Middle Name"; Rec."Middle Name")
                {
                }
                field("Last Name"; Rec."Last Name")
                {
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                }
                field(Qualified; Rec.Qualified)
                {
                }
                field("Date of Interview"; Rec."Date of Interview")
                {
                }
                field("From Time"; Rec."From Time")
                {
                }
                field("To Time"; Rec."To Time")
                {
                }
                field(Venue; Rec.Venue)
                {
                }
                field("Interview Type"; Rec."Interview Type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

