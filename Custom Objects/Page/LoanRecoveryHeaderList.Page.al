page 52185858 "Loan Recovery Header List"
{
    CardPageID = "Loan Recovery Header";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Loan Recovery Header";
    SourceTableView = WHERE(Recovered = CONST(false),
                            "Modify Recovered" = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Date Entered"; Rec."Date Entered")
                {
                }
                field("Entered By"; Rec."Entered By")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                }
                field("Outsatnding Interest"; Rec."Outsatnding Interest")
                {
                }
                field("Member Deposits"; Rec."Member Deposits")
                {
                }
            }
        }
    }

    actions
    {
    }
}

