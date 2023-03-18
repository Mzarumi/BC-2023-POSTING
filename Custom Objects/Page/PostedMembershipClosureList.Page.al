page 52186365 "Posted Membership Closure List"
{
    CardPageID = "Membership Closure";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Membership closure";
    SourceTableView = WHERE(Posted = CONST(true));

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
                field("Member Name"; Rec."Member Name")
                {
                }
                field("Closing Date"; Rec."Closing Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Total Loan"; Rec."Total Loan")
                {
                }
                field("Total Interest"; Rec."Total Interest")
                {
                }
                field("Member Savings"; Rec."Member Savings")
                {
                }
                field("Closure Type"; Rec."Closure Type")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Deposit Refundable"; Rec."Deposit Refundable")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field("Close Account"; Rec."Close Account")
                {
                }
                field("Loans Option"; Rec."Loans Option")
                {
                }
            }
        }
    }

    actions
    {
    }
}

