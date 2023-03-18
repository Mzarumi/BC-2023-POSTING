page 52185589 "HR Applicants UnQualified Card"
{
    PageType = Card;
    SourceTable = "HR Job Applications";
    SourceTableView = WHERE(Qualified = CONST(false));

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
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    Editable = false;
                }
                field(Qualified; Rec.Qualified)
                {
                }
            }
        }
    }

    actions
    {
    }
}

