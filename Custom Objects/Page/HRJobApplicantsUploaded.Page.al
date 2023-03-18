page 52186560 "HR Job Applicants Uploaded"
{
    DeleteAllowed = false;
    Description = 'HR Job Applicants Qualified Card';
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Job Applications";
    SourceTableView = WHERE(Uploaded = CONST(true));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Job Application No."; Rec."Job Application No.")
                {
                    Editable = false;
                }
                field(Qualified; Rec.Qualified)
                {
                    Editable = false;
                    Style = AttentionAccent;
                    StyleExpr = TRUE;
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
                field("E-Mail"; Rec."E-Mail")
                {
                }
                field(Age; Rec.Age)
                {
                }
                field("Date Applied"; Rec."Date Applied")
                {
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                }
            }
        }
    }

    actions
    {
    }
}

