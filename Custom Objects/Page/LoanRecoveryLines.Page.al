page 52185860 "Loan Recovery Lines"
{
    CardPageID = "Loans Posted";
    Editable = false;
    PageType = List;
    SourceTable = Loans;
    SourceTableView = WHERE(Posted = CONST(true),
                            "Recovered Loan" = FILTER(<> ''));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                }
                field(Interest; Rec.Interest)
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                }
            }
        }
    }

    actions
    {
    }
}

