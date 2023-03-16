page 52186371 "Morgate Doc Release List"
{
    CardPageID = "Mortage Doc Release Card";
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Mortgage Loans Doc Release";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("Loan Type"; Rec."Loan Type")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Date Withheld"; Rec."Date Withheld")
                {
                }
                field("User Registered"; Rec."User Registered")
                {
                }
                field("Date Released"; Rec."Date Released")
                {
                }
                field("User Relased"; Rec."User Relased")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
    }
}

