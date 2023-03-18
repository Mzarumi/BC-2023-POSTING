page 52186583 "HR Staff Loan List"
{
    CardPageID = "HR Staff Loan Request";
    PageType = List;
    SourceTable = "HR Staff Loan Request";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Loan Description"; Rec."Loan Description")
                {
                }
                field("Loan Type"; Rec."Loan Type")
                {
                }
                field("Emp No."; Rec."Emp No.")
                {
                }
                field("Emp Name"; Rec."Emp Name")
                {
                }
                field("Request Date"; Rec."Request Date")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Amount Requested"; Rec."Amount Requested")
                {
                }
                field("Date Created"; Rec."Date Created")
                {
                }
                field("Amount Approved"; Rec."Amount Approved")
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                }
                field(Selected; Rec.Selected)
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

