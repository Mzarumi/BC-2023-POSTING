page 52186669 "Approved Withdrawal Notice"
{
    CardPageID = "Member withdrawal Notice";
    Editable = false;
    PageType = List;
    SourceTable = "Member withdrawal Notice";
    SourceTableView = WHERE(Status = CONST(Approved));

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
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("Reason for withdrawal"; Rec."Reason for withdrawal")
                {
                }
                field("Withdrawal Notice Date"; Rec."Withdrawal Notice Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Entered By"; Rec."Entered By")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field("Date Modified"; Rec."Date Modified")
                {
                }
                field("Maturity Date"; Rec."Maturity Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

