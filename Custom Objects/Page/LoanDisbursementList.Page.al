page 52185767 "Loan Disbursement List"
{
    CardPageID = "Loan Disbursement Header";
    Editable = false;
    PageType = List;
    SourceTable = "Loan Disbursement Header";
    SourceTableView = WHERE(Posted = FILTER(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
                field("Time Posted"; Rec."Time Posted")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Prepared By"; Rec."Prepared By")
                {
                    Caption = 'Created By';
                }
            }
        }
    }

    actions
    {
    }
}

