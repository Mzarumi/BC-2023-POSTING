page 52186172 "Updated Agents List"
{
    CardPageID = "Update Agent Applications";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Update Agent Application";
    SourceTableView = WHERE(Updated = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Update No"; Rec."Update No")
                {
                }
                field("Agent Code"; Rec."Agent Code")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Account; Rec.Account)
                {
                }
                field("Comm Account"; Rec."Comm Account")
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
                field("Document Serial No"; Rec."Document Serial No")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("Customer ID No"; Rec."Customer ID No")
                {
                }
                field("Mobile No"; Rec."Mobile No")
                {
                }
                field("Approval Status"; Rec."Approval Status")
                {
                }
                field(Comments; Rec.Comments)
                {
                }
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                }
                field("Date Approved"; Rec."Date Approved")
                {
                }
                field("Time Approved"; Rec."Time Approved")
                {
                }
                field("Approved By"; Rec."Approved By")
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
                field("1st Approval By"; Rec."1st Approval By")
                {
                }
                field("Date 1st Approval"; Rec."Date 1st Approval")
                {
                }
                field("Time First Approval"; Rec."Time First Approval")
                {
                }
                field("Withdrawal Limit Code"; Rec."Withdrawal Limit Code")
                {
                }
                field("Withdrawal Limit Amount"; Rec."Withdrawal Limit Amount")
                {
                }
                field("Name of the Proposed Agent"; Rec."Name of the Proposed Agent")
                {
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                }
                field("Type of Business"; Rec."Type of Business")
                {
                }
                field("Business/Work Experience"; Rec."Business/Work Experience")
                {
                }
                field("Name of Banker"; Rec."Name of Banker")
                {
                }
                field("PIN(KRA)"; Rec."PIN(KRA)")
                {
                }
            }
        }
    }

    actions
    {
    }
}

