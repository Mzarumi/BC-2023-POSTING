page 52186419 "Loans Linking List"
{
    CardPageID = "Loan Linking";
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Loan Linking";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Entered By"; Rec."Entered By")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Processed; Rec.Processed)
                {
                }
            }
        }
    }

    actions
    {
    }
}

