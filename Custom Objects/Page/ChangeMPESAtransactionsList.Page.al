page 52185781 "Change MPESA transactions List"
{
    CardPageID = "Mpesa Changes";
    DeleteAllowed = false;
    Editable = true;
    PageType = List;
    SourceTable = "M-PESA Change Transactions";
    SourceTableView = WHERE(Status = FILTER(Open),
                            Status = FILTER(Pending));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Initiated By"; Rec."Initiated By")
                {
                }
                field("MPESA Receipt No"; Rec."MPESA Receipt No")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("New Account No"; Rec."New Account No")
                {
                }
                field(Comments; Rec.Comments)
                {
                }
                field("Approved By"; Rec."Approved By")
                {
                }
                field("Date Approved"; Rec."Date Approved")
                {
                }
                field("Time Approved"; Rec."Time Approved")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field(Changed; Rec.Changed)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Send For Approval By"; Rec."Send For Approval By")
                {
                }
                field("Date Sent For Approval"; Rec."Date Sent For Approval")
                {
                }
                field("Time Sent For Approval"; Rec."Time Sent For Approval")
                {
                }
                field("Reasons for rejection"; Rec."Reasons for rejection")
                {
                }
            }
        }
    }

    actions
    {
    }
}

