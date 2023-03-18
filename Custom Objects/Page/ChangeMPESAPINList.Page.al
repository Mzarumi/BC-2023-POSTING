page 52185785 "Change MPESA PIN List"
{
    CardPageID = "M-SACCO Change MPESA PIN No";
    PageType = List;
    SourceTable = "M-SACCO Change PIN No";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("Date Entered"; Rec."Date Entered")
                {
                }
                field("Time Entered"; Rec."Time Entered")
                {
                }
                field("Entered By"; Rec."Entered By")
                {
                }
                field("MPESA Application No"; Rec."MPESA Application No")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("Customer ID No"; Rec."Customer ID No")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("MPESA Mobile No"; Rec."MPESA Mobile No")
                {
                }
                field("MPESA Corporate No"; Rec."MPESA Corporate No")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Comments; Rec.Comments)
                {
                }
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                }
                field("Date Sent"; Rec."Date Sent")
                {
                }
                field("Time Sent"; Rec."Time Sent")
                {
                }
                field("Sent By"; Rec."Sent By")
                {
                }
                field("Date Rejected"; Rec."Date Rejected")
                {
                }
                field("Time Rejected"; Rec."Time Rejected")
                {
                }
                field("Rejected By"; Rec."Rejected By")
                {
                }
                field("Sent To Server"; Rec."Sent To Server")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
            }
        }
    }

    actions
    {
    }
}

