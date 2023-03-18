page 52185694 "Approved Agents List"
{
    // CardPageID = "Agent Approved Card";

    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Agent Applications";
    SourceTableView = WHERE("Approval Status" = CONST(Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Agent Code"; Rec."Agent Code")
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
                field(Name; Rec.Name)
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
                field(Account; Rec.Account)
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
                field("Place of Business"; Rec."Place of Business")
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
                field(Branch; Rec.Branch)
                {
                }
                field(NewApps; Rec.NewApps)
                {
                }
                field("Comm Account"; Rec."Comm Account")
                {
                }
            }
        }
    }

    actions
    {
    }
}

