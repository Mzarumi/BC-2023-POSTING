page 52185456 "Sky Agent Transactions"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Sky Agents Transactions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transaction ID"; Rec."Transaction ID")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field("Member Account"; Rec."Member Account")
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field("Agent Code"; Rec."Agent Code")
                {
                }
                field("Paybill Member ID"; Rec."Paybill Member ID")
                {
                }
                field("Vendor Commission"; Rec."Vendor Commission")
                {
                }
                field("Sacco Fee"; Rec."Sacco Fee")
                {
                }
                field("Agent Commision Account"; Rec."Agent Commision Account")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Control31; Rec."Needs Change")
                {
                }
                field("Agent Account Number"; Rec."Agent Account Number")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
                field("Time Posted"; Rec."Time Posted")
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Old Transaction Date"; Rec."Old Transaction Date")
                {
                }
                field(Reversed; Rec.Reversed)
                {
                }
                field("Date Reversed"; Rec."Date Reversed")
                {
                }
                field("Time Reversed"; Rec."Time Reversed")
                {
                }
                field("Reversed By"; Rec."Reversed By")
                {
                }
                field("Reversal ID"; Rec."Reversal ID")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                }
                field("Session ID"; Rec."Session ID")
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field(Keyword; Rec.Keyword)
                {
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                }
                field("Statement Max Rows"; Rec."Statement Max Rows")
                {
                }
                field("Statement Start Date"; Rec."Statement Start Date")
                {
                }
                field("Statement End Date"; Rec."Statement End Date")
                {
                }
                field("Account to Check"; Rec."Account to Check")
                {
                }
                field("Changed By"; Rec."Changed By")
                {
                }
                field("Date Changed"; Rec."Date Changed")
                {
                }
                field("Debit Account Type"; Rec."Debit Account Type")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update Paybill")
            {
                //here
                // RunObject = Page Page52017717;
                // RunPageLink = Field40 = FIELD("Entry No.");
            }
            action("Needs Change")
            {

                trigger OnAction()
                var
                    StatusChangePermissions: Record "Status Change Permissions.";
                begin
                    StatusChangePermissions.Reset;
                    StatusChangePermissions.SetRange("User ID", UserId);
                    //StatusChangePermissions.SETRANGE("Update Rejoining Member",TRUE);
                    if not StatusChangePermissions.FindFirst then
                        Error('You do not have the following permission: "Update Paybill Transaction"');

                    Rec.TestField(Posted, false);
                    if Confirm('Are you sure you want to mark this transaction as needs change?') then begin
                        Rec."Needs Change" := true;
                        Rec.Modify;
                    end;
                end;
            }
        }
    }
}

